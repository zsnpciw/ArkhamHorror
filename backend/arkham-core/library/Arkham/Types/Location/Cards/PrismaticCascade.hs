module Arkham.Types.Location.Cards.PrismaticCascade
  ( prismaticCascade
  , PrismaticCascade(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards (prismaticCascade)
import Arkham.Types.Ability
import Arkham.Types.Classes
import Arkham.Types.Game.Helpers
import Arkham.Types.GameValue
import Arkham.Types.Id
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Runner
import Arkham.Types.LocationMatcher
import Arkham.Types.LocationSymbol
import Arkham.Types.Message
import Arkham.Types.Name
import Arkham.Types.Window
import Control.Monad.Extra (findM)

newtype PrismaticCascade = PrismaticCascade LocationAttrs
  deriving anyclass IsLocation
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

prismaticCascade :: LocationCard PrismaticCascade
prismaticCascade = location
  PrismaticCascade
  Cards.prismaticCascade
  2
  (Static 3)
  Diamond
  [Square, Plus]

instance HasModifiersFor env PrismaticCascade

forcedAbility :: LocationAttrs -> Ability
forcedAbility a = mkAbility (toSource a) 1 ForcedAbility

instance ActionRunner env => HasActions env PrismaticCascade where
  getActions _ (AfterDiscoveringClues You YourLocation) (PrismaticCascade attrs)
    = do
      leadInvestigator <- getLeadInvestigatorId
      pure
        [ locationAbility leadInvestigator (forcedAbility attrs)
        | locationClues attrs == 0
        ]
  getActions iid window (PrismaticCascade attrs) = getActions iid window attrs

instance LocationRunner env => RunMessage env PrismaticCascade where
  runMessage msg l@(PrismaticCascade attrs) = case msg of
    Revelation iid source | isSource attrs source -> do
      push $ RandomDiscard iid
      let
        labels = [ nameToLabel (toName attrs) <> tshow @Int n | n <- [1 .. 2] ]
      availableLabel <- findM
        (fmap isNothing . getId @(Maybe LocationId) . LocationWithLabel)
        labels
      case availableLabel of
        Just label -> pure . PrismaticCascade $ attrs & labelL .~ label
        Nothing -> error "could not find label"
    UseCardAbility _ source _ 1 _ | isSource attrs source -> do
      l <$ push (Discard $ toTarget attrs)
    _ -> PrismaticCascade <$> runMessage msg attrs
