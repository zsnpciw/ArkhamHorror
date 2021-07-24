module Arkham.Types.Enemy.Cards.InterstellarTraveler
  ( interstellarTraveler
  , InterstellarTraveler(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Enemy.Cards as Cards
import Arkham.Types.Classes
import Arkham.Types.Enemy.Attrs
import Arkham.Types.Id
import Arkham.Types.LocationMatcher
import Arkham.Types.Message
import Arkham.Types.Query
import Arkham.Types.Target
import Arkham.Types.Trait

newtype InterstellarTraveler = InterstellarTraveler EnemyAttrs
  deriving anyclass IsEnemy
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

interstellarTraveler :: EnemyCard InterstellarTraveler
interstellarTraveler = enemyWith
  InterstellarTraveler
  Cards.interstellarTraveler
  (4, Static 3, 2)
  (1, 2)
  (spawnAtL ?~ LocationWithTrait Extradimensional)

instance HasModifiersFor env InterstellarTraveler

instance EnemyAttrsHasActions env => HasActions env InterstellarTraveler where
  getActions i window (InterstellarTraveler attrs) = getActions i window attrs

instance (HasCount ClueCount env LocationId, EnemyAttrsRunMessage env) => RunMessage env InterstellarTraveler where
  runMessage msg (InterstellarTraveler attrs) = case msg of
    EnemyEntered eid lid | eid == enemyId attrs -> do
      clueCount <- unClueCount <$> getCount lid
      when (clueCount > 0) (push $ RemoveClues (LocationTarget lid) 1)
      pure . InterstellarTraveler $ attrs & doomL +~ 1
    _ -> InterstellarTraveler <$> runMessage msg attrs
