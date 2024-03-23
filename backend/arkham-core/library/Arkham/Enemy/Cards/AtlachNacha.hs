module Arkham.Enemy.Cards.AtlachNacha (
  atlachNacha,
  AtlachNacha (..),
)
where

import Arkham.Ability
import Arkham.Attack
import Arkham.Card
import Arkham.Enemy.Cards qualified as Cards
import Arkham.Enemy.Import.Lifted
import Arkham.Helpers.Modifiers
import Arkham.Helpers.Modifiers qualified as Msg
import Arkham.Location.Types (Field (..))
import Arkham.Matcher
import Arkham.Matcher qualified as Match
import Arkham.Message qualified as Msg
import Arkham.Placement

newtype Meta = Meta {rotation :: Int}
  deriving stock (Show, Eq, Generic)
  deriving anyclass (ToJSON, FromJSON)

newtype AtlachNacha = AtlachNacha EnemyAttrs
  deriving anyclass (IsEnemy)
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

atlachNacha :: EnemyCard AtlachNacha
atlachNacha =
  enemyWith
    AtlachNacha
    Cards.atlachNacha
    (4, PerPlayer 4, 4)
    (2, 2)
    ((asSelfLocationL ?~ "atlachNacha") . setMeta @Meta (Meta 0))

instance HasModifiersFor AtlachNacha where
  getModifiersFor target (AtlachNacha attrs) | attrs `is` target = do
    pure
      $ toModifiers attrs
      $ if attrs.placement == Global
        then [Omnipotent]
        else [DoNotExhaustEvaded]
  getModifiersFor _ _ = pure []

instance HasAbilities AtlachNacha where
  getAbilities (AtlachNacha attrs) =
    extend
      attrs
      [ mkAbility attrs 1 $ forced $ EnemyLeaves #when Anywhere (be attrs)
      , mkAbility attrs 2 $ forced $ Match.EnemyEvaded #when You (be attrs)
      ]

instance RunMessage AtlachNacha where
  runMessage msg e@(AtlachNacha attrs) = runQueueT $ case msg of
    Flip iid _ (isTarget attrs -> True) -> do
      lids <- liftA2 (<|>) (selectMax LocationDoom Anywhere) (select Anywhere)
      push $ Flipped (toSource attrs) (toCard attrs)
      chooseOrRunOne
        iid
        [targetLabel lid [PlaceEnemy attrs.id $ AtLocation lid] | lid <- lids]
      pure $ AtlachNacha $ attrs & asSelfLocationL .~ Nothing & flippedL .~ True
    HandleAbilityOption _ (isSource attrs -> True) n -> do
      let Meta m = toResult attrs.meta
      pure $ AtlachNacha $ setMeta @Meta (Meta ((m + (45 * n)) `mod` 360)) attrs
    UseThisAbility _ (isSource attrs -> True) 1 -> do
      lid <- selectJust $ locationWithEnemy attrs.id
      iids <- select $ investigatorAt lid
      if null iids
        then placeDoom (attrs.ability 1) lid 1
        else eachInvestigator (\iid' -> push $ EnemyWillAttack $ enemyAttack attrs (attrs.ability 1) iid')
      pure e
    UseThisAbility iid (isSource attrs -> True) 2 -> do
      iids <- select $ InvestigatorAt $ locationWithInvestigator iid
      chooseOrRunOne
        iid
        [ targetLabel
          iid'
          [Msg.roundModifier (attrs.ability 1) iid' $ CannotBeAttackedBy (EnemyWithId attrs.id)]
        | iid' <- iids
        ]
      pure e
    Do (Msg.EnemyEvaded _ eid) | eid == attrs.id -> do
      pure e
    _ -> AtlachNacha <$> lift (runMessage msg attrs)
