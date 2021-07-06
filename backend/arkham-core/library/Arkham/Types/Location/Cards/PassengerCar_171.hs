module Arkham.Types.Location.Cards.PassengerCar_171
  ( passengerCar_171
  , PassengerCar_171(..)
  ) where

import Arkham.Prelude

import qualified Arkham.Location.Cards as Cards (passengerCar_171)
import Arkham.Types.Classes
import Arkham.Types.Cost
import Arkham.Types.Direction
import Arkham.Types.GameValue
import Arkham.Types.Id
import Arkham.Types.Location.Attrs
import Arkham.Types.Location.Helpers
import Arkham.Types.Location.Runner
import Arkham.Types.LocationSymbol
import Arkham.Types.Message
import Arkham.Types.Modifier
import Arkham.Types.Query
import Arkham.Types.SkillType

newtype PassengerCar_171 = PassengerCar_171 LocationAttrs
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

passengerCar_171 :: LocationCard PassengerCar_171
passengerCar_171 = locationWith
  PassengerCar_171
  Cards.passengerCar_171
  1
  (PerPlayer 1)
  NoSymbol
  []
  (connectsToL .~ setFromList [LeftOf, RightOf])

instance HasCount ClueCount env LocationId => HasModifiersFor env PassengerCar_171 where
  getModifiersFor _ target (PassengerCar_171 l@LocationAttrs {..})
    | isTarget l target = case lookup LeftOf locationDirections of
      Just leftLocation -> do
        clueCount <- unClueCount <$> getCount leftLocation
        pure $ toModifiers l [ Blocked | not locationRevealed && clueCount > 0 ]
      Nothing -> pure []
  getModifiersFor _ _ _ = pure []

instance ActionRunner env => HasActions env PassengerCar_171 where
  getActions iid window (PassengerCar_171 attrs) = getActions iid window attrs

instance LocationRunner env => RunMessage env PassengerCar_171 where
  runMessage msg l@(PassengerCar_171 attrs@LocationAttrs {..}) = case msg of
    AfterEnterLocation iid lid | lid == locationId -> do
      let cost = SkillIconCost 1 (singleton SkillWild)
      hasSkills <- getCanAffordCost iid (toSource attrs) Nothing cost
      l <$ if hasSkills
        then push
          (chooseOne
            iid
            [ Label
              "Take 1 damage and 1 horror"
              [InvestigatorAssignDamage iid (toSource attrs) DamageAny 1 1]
            , Label
              "Discard cards with at least 1 {wild} icons"
              [ CreatePayAbilityCostEffect
                Nothing
                (toSource attrs)
                (toTarget attrs)
              , PayAbilityCost (toSource attrs) iid Nothing cost
              , PayAbilityCostFinished (toSource attrs) iid
              ]
            ]
          )
        else push (InvestigatorAssignDamage iid (toSource attrs) DamageAny 1 1)
    _ -> PassengerCar_171 <$> runMessage msg attrs
