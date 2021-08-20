module Arkham.Types.Location.Cards.Rivertown where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards (rivertown)
import Arkham.Types.Classes
import Arkham.Types.GameValue
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol

newtype Rivertown = Rivertown LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

rivertown :: LocationCard Rivertown
rivertown = location
  Rivertown
  Cards.rivertown
  1
  (PerPlayer 1)
  Circle
  [Moon, Diamond, Square, Squiggle, Hourglass]

instance HasModifiersFor env Rivertown

instance HasAbilities env Rivertown where
  getAbilities i window (Rivertown attrs) = getAbilities i window attrs

instance (LocationRunner env) => RunMessage env Rivertown where
  runMessage msg (Rivertown attrs) = Rivertown <$> runMessage msg attrs
