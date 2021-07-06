module Arkham.Types.Agenda.Cards.StrangeDisappearances
  ( StrangeDisappearances(..)
  , strangeDisappearances
  ) where

import Arkham.Prelude

import Arkham.Types.Agenda.Attrs
import Arkham.Types.Agenda.Runner
import Arkham.Types.Classes
import Arkham.Types.GameValue
import Arkham.Types.Message
import Arkham.Types.Query

newtype StrangeDisappearances = StrangeDisappearances AgendaAttrs
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

strangeDisappearances :: StrangeDisappearances
strangeDisappearances = StrangeDisappearances
  $ baseAttrs "02196" "Strange Disappearances" (Agenda 1 A) (Static 6)

instance HasModifiersFor env StrangeDisappearances where
  getModifiersFor = noModifiersFor

instance HasActions env StrangeDisappearances where
  getActions i window (StrangeDisappearances x) = getActions i window x

instance AgendaRunner env => RunMessage env StrangeDisappearances where
  runMessage msg a@(StrangeDisappearances attrs@AgendaAttrs {..}) = case msg of
    AdvanceAgenda aid | aid == agendaId && agendaSequence == Agenda 1 B -> do
      leadInvestigatorId <- unLeadInvestigatorId <$> getId ()
      scenarioDeckCount <- unScenarioDeckCount <$> getCount ()
      if scenarioDeckCount >= 3
        then a <$ pushAll
          [ UseScenarioSpecificAbility leadInvestigatorId Nothing 1
          , NextAgenda agendaId "02197"
          ]
        else a <$ push (NextAgenda agendaId "02197")
    _ -> StrangeDisappearances <$> runMessage msg attrs
