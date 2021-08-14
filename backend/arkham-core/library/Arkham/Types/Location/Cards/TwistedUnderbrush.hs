module Arkham.Types.Location.Cards.TwistedUnderbrush
  ( TwistedUnderbrush(..)
  , twistedUnderbrush
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards (twistedUnderbrush)
import Arkham.Types.Ability
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.GameValue
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Helpers
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol
import Arkham.Types.Message
import Arkham.Types.Window

newtype TwistedUnderbrush = TwistedUnderbrush LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

twistedUnderbrush :: LocationCard TwistedUnderbrush
twistedUnderbrush = location
  TwistedUnderbrush
  Cards.twistedUnderbrush
  3
  (PerPlayer 1)
  Moon
  [Diamond, Moon]

instance HasModifiersFor env TwistedUnderbrush

instance ActionRunner env => HasAbilities env TwistedUnderbrush where
  getAbilities iid NonFast (TwistedUnderbrush attrs@LocationAttrs {..})
    | locationRevealed = withBaseActions iid NonFast attrs $ pure
      [ locationAbility
          (mkAbility attrs 1 $ ActionAbility Nothing $ ActionCost 1)
      ]
  getAbilities i window (TwistedUnderbrush attrs) = getAbilities i window attrs

instance (LocationRunner env) => RunMessage env TwistedUnderbrush where
  runMessage msg l@(TwistedUnderbrush attrs) = case msg of
    UseCardAbility iid source _ 1 _ | isSource attrs source -> l <$ pushAll
      [ TakeResources iid 2 False
      , InvestigatorAssignDamage iid source DamageAny 0 1
      ]
    _ -> TwistedUnderbrush <$> runMessage msg attrs
