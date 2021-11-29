module Arkham.Types.Treachery.Cards.TwinSuns
  ( twinSuns
  , TwinSuns(..)
  ) where

import Arkham.Prelude

import Arkham.Treachery.Cards qualified as Cards
import Arkham.Types.Classes
import Arkham.Types.Message
import Arkham.Types.Treachery.Attrs
import Arkham.Types.Treachery.Runner

newtype TwinSuns = TwinSuns TreacheryAttrs
  deriving anyclass (IsTreachery, HasModifiersFor env, HasAbilities)
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

twinSuns :: TreacheryCard TwinSuns
twinSuns = treachery TwinSuns Cards.twinSuns

instance TreacheryRunner env => RunMessage env TwinSuns where
  runMessage msg t@(TwinSuns attrs) = case msg of
    Revelation _iid source | isSource attrs source ->
      t <$ push (Discard $ toTarget attrs)
    _ -> TwinSuns <$> runMessage msg attrs
