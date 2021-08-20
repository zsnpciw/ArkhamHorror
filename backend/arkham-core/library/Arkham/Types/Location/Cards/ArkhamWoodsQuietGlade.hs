module Arkham.Types.Location.Cards.ArkhamWoodsQuietGlade
  ( ArkhamWoodsQuietGlade(..)
  , arkhamWoodsQuietGlade
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards (arkhamWoodsQuietGlade)
import Arkham.Types.Ability
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.GameValue
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Helpers
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol
import Arkham.Types.Message
import Arkham.Types.Source
import Arkham.Types.Target
import qualified Arkham.Types.Timing as Timing
import Arkham.Types.Window

newtype ArkhamWoodsQuietGlade = ArkhamWoodsQuietGlade LocationAttrs
  deriving anyclass (IsLocation, HasModifiersFor env)
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

arkhamWoodsQuietGlade :: LocationCard ArkhamWoodsQuietGlade
arkhamWoodsQuietGlade = locationWith
  ArkhamWoodsQuietGlade
  Cards.arkhamWoodsQuietGlade
  1
  (Static 0)
  Square
  [Squiggle]
  ((revealedConnectedSymbolsL .~ setFromList [Squiggle, Equals, Hourglass])
  . (revealedSymbolL .~ Moon)
  )

ability :: LocationAttrs -> Ability
ability attrs =
  (mkAbility (toSource attrs) 1 (ActionAbility Nothing $ ActionCost 1))
    { abilityLimit = PlayerLimit PerTurn 1
    }

instance HasAbilities env ArkhamWoodsQuietGlade where
  getAbilities iid window@(Window Timing.When NonFast) (ArkhamWoodsQuietGlade attrs@LocationAttrs {..})
    | locationRevealed
    = withBaseActions iid window attrs $ pure [locationAbility (ability attrs)]
  getAbilities iid window (ArkhamWoodsQuietGlade attrs) =
    getAbilities iid window attrs

instance (LocationRunner env) => RunMessage env ArkhamWoodsQuietGlade where
  runMessage msg l@(ArkhamWoodsQuietGlade attrs@LocationAttrs {..}) =
    case msg of
      UseCardAbility iid (LocationSource lid) _ 1 _ | lid == locationId ->
        l <$ pushAll
          [ HealDamage (InvestigatorTarget iid) 1
          , HealHorror (InvestigatorTarget iid) 1
          ]
      _ -> ArkhamWoodsQuietGlade <$> runMessage msg attrs
