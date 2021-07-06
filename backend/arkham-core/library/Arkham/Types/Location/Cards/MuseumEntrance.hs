module Arkham.Types.Location.Cards.MuseumEntrance
  ( museumEntrance
  , MuseumEntrance(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards (museumEntrance)
import Arkham.Types.Classes
import Arkham.Types.GameValue
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Helpers
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol
import Arkham.Types.Modifier
import Arkham.Types.Target

newtype MuseumEntrance = MuseumEntrance LocationAttrs
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

museumEntrance :: LocationCard MuseumEntrance
museumEntrance =
  location MuseumEntrance Cards.museumEntrance 3 (Static 2) Circle [Square]

instance HasModifiersFor env MuseumEntrance where
  getModifiersFor _ (InvestigatorTarget iid) (MuseumEntrance attrs) =
    pure $ toModifiers attrs [ CannotGainResources | iid `on` attrs ]
  getModifiersFor _ _ _ = pure []

instance ActionRunner env => HasActions env MuseumEntrance where
  getActions = withResignAction

instance LocationRunner env => RunMessage env MuseumEntrance where
  runMessage msg (MuseumEntrance attrs) =
    MuseumEntrance <$> runMessage msg attrs
