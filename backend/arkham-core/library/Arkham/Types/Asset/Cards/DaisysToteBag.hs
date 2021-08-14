module Arkham.Types.Asset.Cards.DaisysToteBag
  ( DaisysToteBag(..)
  , daisysToteBag
  ) where

import Arkham.Prelude

import qualified Arkham.Asset.Cards as Cards
import Arkham.Types.Asset.Attrs
import Arkham.Types.Asset.Runner
import Arkham.Types.Classes
import Arkham.Types.Message
import Arkham.Types.Slot
import Arkham.Types.Trait

newtype DaisysToteBag = DaisysToteBag AssetAttrs
  deriving anyclass IsAsset
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

daisysToteBag :: AssetCard DaisysToteBag
daisysToteBag = asset DaisysToteBag Cards.daisysToteBag

instance HasModifiersFor env DaisysToteBag

instance HasAbilities env DaisysToteBag where
  getAbilities i window (DaisysToteBag x) = getAbilities i window x

slot :: AssetAttrs -> Slot
slot attrs = TraitRestrictedSlot (toSource attrs) Tome Nothing

instance AssetRunner env => RunMessage env DaisysToteBag where
  runMessage msg (DaisysToteBag attrs) = case msg of
    InvestigatorPlayAsset iid aid _ _ | aid == assetId attrs -> do
      pushAll $ replicate 2 (AddSlot iid HandSlot (slot attrs))
      DaisysToteBag <$> runMessage msg attrs
    _ -> DaisysToteBag <$> runMessage msg attrs
