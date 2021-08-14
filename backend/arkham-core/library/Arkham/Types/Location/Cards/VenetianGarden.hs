module Arkham.Types.Location.Cards.VenetianGarden
  ( venetianGarden
  , VenetianGarden(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards
import Arkham.Types.Ability
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.Direction
import Arkham.Types.GameValue
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Helpers
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol
import Arkham.Types.Message
import Arkham.Types.Target
import Arkham.Types.Window

newtype VenetianGarden = VenetianGarden LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

venetianGarden :: LocationCard VenetianGarden
venetianGarden = locationWith
  VenetianGarden
  Cards.venetianGarden
  3
  (PerPlayer 1)
  NoSymbol
  []
  (connectsToL .~ singleton RightOf)

instance HasModifiersFor env VenetianGarden

ability :: LocationAttrs -> Ability
ability a =
  (mkAbility a 1 $ ActionAbility Nothing (Costs [ActionCost 2, ResourceCost 2]))
    { abilityLimit = PlayerLimit PerGame 1
    }

instance ActionRunner env => HasAbilities env VenetianGarden where
  getAbilities iid NonFast (VenetianGarden attrs) =
    withBaseActions iid NonFast attrs $ pure [locationAbility (ability attrs)]
  getAbilities iid window (VenetianGarden attrs) = getAbilities iid window attrs

instance LocationRunner env => RunMessage env VenetianGarden where
  runMessage msg l@(VenetianGarden attrs) = case msg of
    UseCardAbility iid source _ 1 _ | isSource attrs source ->
      l <$ push (HealHorror (InvestigatorTarget iid) 2)
    _ -> VenetianGarden <$> runMessage msg attrs
