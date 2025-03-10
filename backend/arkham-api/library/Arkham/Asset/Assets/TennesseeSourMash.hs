module Arkham.Asset.Assets.TennesseeSourMash (tennesseeSourMash) where

import Arkham.Ability
import Arkham.Asset.Cards qualified as Cards
import Arkham.Asset.Runner
import Arkham.Fight
import Arkham.Helpers.Modifiers
import Arkham.Matcher
import Arkham.Prelude

newtype TennesseeSourMash = TennesseeSourMash AssetAttrs
  deriving anyclass (IsAsset, HasModifiersFor)
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

tennesseeSourMash :: AssetCard TennesseeSourMash
tennesseeSourMash = asset TennesseeSourMash Cards.tennesseeSourMash

instance HasAbilities TennesseeSourMash where
  getAbilities (TennesseeSourMash a) =
    [ controlledAbility a 1 (DuringSkillTest $ SkillTestOnTreachery AnyTreachery)
        $ FastAbility (exhaust a <> assetUseCost a Supply 1)
    , restrictedAbility a 2 ControlsThis $ fightAction (discardCost a)
    ]

instance RunMessage TennesseeSourMash where
  runMessage msg a@(TennesseeSourMash attrs) = case msg of
    UseThisAbility iid (isSource attrs -> True) 1 -> do
      withSkillTest \sid ->
        pushM $ skillTestModifier sid attrs iid (SkillModifier #willpower 2)
      pure a
    UseThisAbility iid (isSource attrs -> True) 2 -> do
      let source = attrs.ability 2
      sid <- getRandom
      chooseFight <- toMessage <$> mkChooseFight sid iid source
      enabled <- skillTestModifier sid source iid (SkillModifier #combat 3)
      pushAll [enabled, chooseFight]
      pure a
    _ -> TennesseeSourMash <$> runMessage msg attrs
