module Arkham.Types.Slot where

import Arkham.Json
import Arkham.Types.AssetId
import Arkham.Types.Trait
import ClassyPrelude

isEmptySlot :: Slot -> Bool
isEmptySlot (Slot masset) = isNothing masset
isEmptySlot (TraitRestrictedSlot _ masset) = isNothing masset

putIntoSlot :: AssetId -> Slot -> Slot
putIntoSlot aid = \case
  Slot _ -> Slot (Just aid)
  TraitRestrictedSlot t _ -> TraitRestrictedSlot t (Just aid)

data Slot = Slot (Maybe AssetId) | TraitRestrictedSlot Trait (Maybe AssetId)
  deriving stock (Show, Generic)
  deriving anyclass (ToJSON, FromJSON)

data SlotType
  = HandSlot
  | BodySlot
  | AllySlot
  | AccessorySlot
  | ArcaneSlot
  deriving stock (Show, Generic, Eq)
  deriving anyclass (ToJSON, FromJSON, Hashable, ToJSONKey, FromJSONKey)
