module Arkham.Types.Event.Cards.DrawnToTheFlameSpec
  ( spec
  )
where

import TestImport

import Arkham.Types.Investigator.Attrs (Attrs(..))
import Arkham.Types.Location.Attrs (Attrs(..))
import Arkham.Types.Token
import Arkham.Types.Trait

spec :: Spec
spec = describe "Drawn to the flame" $ do
  it "draws the top card of the encounter deck and then you discover two clues"
    $ do
    -- We use "On Wings of Darkness" here to check that the Revelation effect
    -- resolves and that the clues discovered are at your location after the
    -- effect per the FAQ
        investigator <- testInvestigator "00000"
          $ \attrs -> attrs { investigatorAgility = 3 }
        (startLocation, centralLocation) <-
          testConnectedLocations id $ \attrs ->
            attrs { locationTraits = setFromList [Central], locationClues = 2 }
        drawnToTheFlame <- buildEvent "01064" investigator
        onWingsOfDarkness <- buildEncounterCard "01173"
        scenario' <- testScenario "00000" id
        game <-
          runGameTest
            investigator
            [ SetEncounterDeck [onWingsOfDarkness]
            , SetTokens [Zero]
            , PlacedLocation (getId () startLocation)
            , PlacedLocation (getId () centralLocation)
            , moveTo investigator startLocation
            , playEvent investigator drawnToTheFlame
            ]
            ((events %~ insertEntity drawnToTheFlame)
            . (locations %~ insertEntity startLocation)
            . (locations %~ insertEntity centralLocation)
            . (scenario ?~ scenario')
            )
          >>= runGameTestOnlyOption "start skill test"
          >>= runGameTestOnlyOption "apply results"
          >>= runGameTestFirstOption "apply horror/damage"
          >>= runGameTestFirstOption "apply horror/damage"
          >>= runGameTestOnlyOption "move to central location"
        updated game investigator `shouldSatisfy` hasClueCount 2
        drawnToTheFlame `shouldSatisfy` isInDiscardOf game investigator
