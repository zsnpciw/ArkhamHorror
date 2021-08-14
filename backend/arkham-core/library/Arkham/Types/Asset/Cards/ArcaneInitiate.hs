module Arkham.Types.Asset.Cards.ArcaneInitiate where

import Arkham.Prelude

import qualified Arkham.Asset.Cards as Cards
import Arkham.Types.Ability
import Arkham.Types.Asset.Attrs
import Arkham.Types.Asset.Runner
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.Message
import Arkham.Types.Target
import Arkham.Types.Trait
import Arkham.Types.Window

newtype ArcaneInitiate = ArcaneInitiate AssetAttrs
  deriving anyclass IsAsset
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

arcaneInitiate :: AssetCard ArcaneInitiate
arcaneInitiate = ally ArcaneInitiate Cards.arcaneInitiate (1, 2)

fastAbility :: AssetAttrs -> Ability
fastAbility a = mkAbility a 1 . FastAbility . ExhaustCost $ toTarget a

instance HasModifiersFor env ArcaneInitiate

instance HasAbilities env ArcaneInitiate where
  getAbilities iid FastPlayerWindow (ArcaneInitiate a) | ownedBy a iid =
    pure [fastAbility a]
  getAbilities _ _ _ = pure []

instance (AssetRunner env) => RunMessage env ArcaneInitiate where
  runMessage msg a@(ArcaneInitiate attrs) = case msg of
    InvestigatorPlayedAsset _ aid _ _ | aid == assetId attrs ->
      ArcaneInitiate <$> runMessage msg (attrs & doomL +~ 1)
    UseCardAbility iid source _ 1 _ | isSource attrs source -> a <$ push
      (chooseOne
        iid
        [ SearchTopOfDeck
            iid
            source
            (InvestigatorTarget iid)
            3
            [Spell]
            (ShuffleBackIn $ DrawFound iid)
        ]
      )
    _ -> ArcaneInitiate <$> runMessage msg attrs
