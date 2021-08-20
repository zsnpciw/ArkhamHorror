module Arkham.Types.Location.Cards.FacultyOfficesTheNightIsStillYoung
  ( facultyOfficesTheNightIsStillYoung
  , FacultyOfficesTheNightIsStillYoung(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards
  (facultyOfficesTheNightIsStillYoung)
import Arkham.Types.Ability
import Arkham.Types.Card
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.Game.Helpers
import Arkham.Types.GameValue
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol
import Arkham.Types.Matcher hiding (FastPlayerWindow, RevealLocation)
import Arkham.Types.Message
import Arkham.Types.Modifier
import Arkham.Types.Resolution
import qualified Arkham.Types.Timing as Timing
import Arkham.Types.Trait
import Arkham.Types.Window hiding (RevealLocation)

newtype FacultyOfficesTheNightIsStillYoung = FacultyOfficesTheNightIsStillYoung LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

facultyOfficesTheNightIsStillYoung
  :: LocationCard FacultyOfficesTheNightIsStillYoung
facultyOfficesTheNightIsStillYoung = location
  FacultyOfficesTheNightIsStillYoung
  Cards.facultyOfficesTheNightIsStillYoung
  2
  (PerPlayer 2)
  T
  [Circle]

instance HasModifiersFor env FacultyOfficesTheNightIsStillYoung where
  getModifiersFor _ target (FacultyOfficesTheNightIsStillYoung attrs)
    | isTarget attrs target = pure
    $ toModifiers attrs [ Blocked | not (locationRevealed attrs) ]
  getModifiersFor _ _ _ = pure []

instance HasAbilities env FacultyOfficesTheNightIsStillYoung where
  getAbilities iid window@(Window Timing.When FastPlayerWindow) (FacultyOfficesTheNightIsStillYoung attrs@LocationAttrs {..})
    | locationRevealed
    = withBaseActions iid window attrs $ pure
      [ locationAbility
          (mkAbility attrs 1 $ FastAbility
            (GroupClueCost
              (PerPlayer 2)
              (Just $ LocationWithTitle "Faculty Offices")
            )
          )
      ]
  getAbilities iid window (FacultyOfficesTheNightIsStillYoung attrs) =
    getAbilities iid window attrs

instance LocationRunner env => RunMessage env FacultyOfficesTheNightIsStillYoung where
  runMessage msg l@(FacultyOfficesTheNightIsStillYoung attrs) = case msg of
    RevealLocation miid lid | lid == locationId attrs -> do
      iid <- maybe getLeadInvestigatorId pure miid
      push $ FindEncounterCard
        iid
        (toTarget attrs)
        (CardWithType EnemyType <> CardWithTrait Humanoid)
      FacultyOfficesTheNightIsStillYoung <$> runMessage msg attrs
    FoundEncounterCard _iid target card | isTarget attrs target ->
      l <$ push (SpawnEnemyAt (EncounterCard card) (toId attrs))
    UseCardAbility _iid source _ 1 _
      | isSource attrs source && locationRevealed attrs -> l
      <$ push (ScenarioResolution $ Resolution 1)
    _ -> FacultyOfficesTheNightIsStillYoung <$> runMessage msg attrs
