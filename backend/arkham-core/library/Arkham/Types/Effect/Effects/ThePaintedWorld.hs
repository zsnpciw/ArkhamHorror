module Arkham.Types.Effect.Effects.ThePaintedWorld
  ( ThePaintedWorld(..)
  , thePaintedWorld
  ) where

import Arkham.Prelude

import Arkham.Types.Classes
import Arkham.Types.Effect.Attrs
import Arkham.Types.Game.Helpers
import Arkham.Types.Id
import Arkham.Types.Modifier
import Arkham.Types.Target

newtype ThePaintedWorld = ThePaintedWorld EffectAttrs
  deriving anyclass HasAbilities
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

thePaintedWorld :: EffectArgs -> ThePaintedWorld
thePaintedWorld = ThePaintedWorld . uncurry4 (baseAttrs "03012")

instance HasModifiersFor env ThePaintedWorld where
  getModifiersFor _ (EventTarget eid) (ThePaintedWorld a@EffectAttrs {..})
    | CardIdTarget (unEventId eid) == effectTarget = pure
    $ toModifiers a [RemoveFromGameInsteadOfDiscard]
  getModifiersFor _ _ _ = pure []

instance HasQueue env => RunMessage env ThePaintedWorld where
  runMessage msg (ThePaintedWorld attrs) =
    ThePaintedWorld <$> runMessage msg attrs
