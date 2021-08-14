module Arkham.Types.Asset.Cards.StrangeSolution
  ( strangeSolution
  , StrangeSolution(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Asset.Cards as Cards
import Arkham.Types.Ability
import Arkham.Types.Asset.Attrs
import Arkham.Types.CampaignLogKey
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.Message
import Arkham.Types.SkillType
import Arkham.Types.Target
import Arkham.Types.Window

newtype StrangeSolution = StrangeSolution AssetAttrs
  deriving anyclass IsAsset
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

strangeSolution :: AssetCard StrangeSolution
strangeSolution = asset StrangeSolution Cards.strangeSolution

instance HasAbilities env StrangeSolution where
  getAbilities iid NonFast (StrangeSolution attrs) | ownedBy attrs iid =
    pure [mkAbility (toSource attrs) 1 (ActionAbility Nothing $ ActionCost 1)]
  getAbilities iid window (StrangeSolution attrs) = getAbilities iid window attrs

instance HasModifiersFor env StrangeSolution

instance (HasQueue env, HasModifiersFor env ()) => RunMessage env StrangeSolution where
  runMessage msg a@(StrangeSolution attrs) = case msg of
    UseCardAbility iid source _ 1 _ | isSource attrs source -> a <$ push
      (BeginSkillTest
        iid
        source
        (InvestigatorTarget iid)
        Nothing
        SkillIntellect
        4
      )
    PassedSkillTest iid _ source SkillTestInitiatorTarget{} _ _
      | isSource attrs source -> a <$ pushAll
        [ Discard (toTarget attrs)
        , DrawCards iid 2 False
        , Record YouHaveIdentifiedTheSolution
        ]
    _ -> StrangeSolution <$> runMessage msg attrs
