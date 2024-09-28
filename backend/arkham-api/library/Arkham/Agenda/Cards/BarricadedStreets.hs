module Arkham.Agenda.Cards.BarricadedStreets (BarricadedStreets (..), barricadedStreets) where

import Arkham.Ability
import Arkham.Agenda.Cards qualified as Cards
import Arkham.Agenda.Import.Lifted
import Arkham.Deck qualified as Deck
import Arkham.Enemy.Cards qualified as Enemies
import Arkham.Helpers.Modifiers (ModifierType (..), modified)
import Arkham.Helpers.Query (getSetAsideCardsMatching)
import Arkham.Matcher
import Arkham.Trait (Trait (Coastal, Suspect))

newtype BarricadedStreets = BarricadedStreets AgendaAttrs
  deriving anyclass IsAgenda
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

barricadedStreets :: AgendaCard BarricadedStreets
barricadedStreets = agenda (1, A) BarricadedStreets Cards.barricadedStreets (Static 6)

instance HasModifiersFor BarricadedStreets where
  getModifiersFor (EnemyTarget eid) (BarricadedStreets a) = do
    isSuspect <- eid <=~> EnemyWithTrait Suspect
    modified a [IgnoreAloof | isSuspect]
  getModifiersFor (InvestigatorTarget _iid) (BarricadedStreets a) = do
    modified a [CannotParleyWith $ EnemyWithTrait Suspect]
  getModifiersFor _ _ = pure []

instance HasAbilities BarricadedStreets where
  getAbilities (BarricadedStreets a) = [mkAbility a 1 $ forced $ TurnEnds #when (You <> at_ FullyFloodedLocation)]

instance RunMessage BarricadedStreets where
  runMessage msg a@(BarricadedStreets attrs) = runQueueT $ case msg of
    AdvanceAgenda (isSide B attrs -> True) -> do
      selectEach (LocationWithTrait Coastal) (push . IncreaseFloodLevel)
      shuffleCardsIntoDeck Deck.EncounterDeck
        =<< getSetAsideCardsMatching (mapOneOf cardIs [Enemies.ravagerFromTheDeep, Enemies.youngDeepOne])
      shuffleEncounterDiscardBackIn
      advanceAgendaDeck attrs
      pure a
    UseThisAbility iid (isSource attrs -> True) 1 -> do
      assignDamage iid (attrs.ability 1) 1
      pure a
    _ -> BarricadedStreets <$> liftRunMessage msg attrs
