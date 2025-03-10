module Arkham.Event.Events.Shortcut (shortcut) where

import Arkham.Capability
import Arkham.Event.Cards qualified as Cards
import Arkham.Event.Import.Lifted
import {-# SOURCE #-} Arkham.GameEnv
import Arkham.Helpers.Investigator
import Arkham.Helpers.Location
import Arkham.Matcher
import Arkham.Message.Lifted.Move

newtype Shortcut = Shortcut EventAttrs
  deriving anyclass (IsEvent, HasModifiersFor, HasAbilities)
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

shortcut :: EventCard Shortcut
shortcut = event Shortcut Cards.shortcut

instance RunMessage Shortcut where
  runMessage msg e@(Shortcut attrs) = runQueueT $ case msg of
    PlayThisEvent iid (is attrs -> True) -> do
      investigators <- select =<< guardAffectsOthers iid (can.move <> colocatedWith iid)
      chooseOrRunOneM iid do
        for_ investigators \iid' -> do
          connectingLocations <- withActiveInvestigatorAdjust iid' $ getAccessibleLocations iid' attrs
          when (notNull connectingLocations) do
            targeting iid' do
              chooseTargetM iid connectingLocations $ moveTo attrs iid'
      pure e
    _ -> Shortcut <$> liftRunMessage msg attrs
