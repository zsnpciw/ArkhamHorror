module Arkham.Types.Treachery.Cards.TerrorFromBeyond
  ( TerrorFromBeyond(..)
  , terrorFromBeyond
  ) where

import Arkham.Prelude

import qualified Arkham.Treachery.Cards as Cards
import Arkham.Types.Card
import Arkham.Types.Card.Id
import Arkham.Types.Classes
import Arkham.Types.History
import Arkham.Types.Message
import Arkham.Types.Treachery.Attrs
import Arkham.Types.Treachery.Runner

newtype TerrorFromBeyond = TerrorFromBeyond TreacheryAttrs
  deriving anyclass (IsTreachery, HasModifiersFor env, HasAbilities)
  deriving newtype (Show, Eq, ToJSON, FromJSON, Entity)

terrorFromBeyond :: TreacheryCard TerrorFromBeyond
terrorFromBeyond = treachery TerrorFromBeyond Cards.terrorFromBeyond

instance TreacheryRunner env => RunMessage env TerrorFromBeyond where
  runMessage msg t@(TerrorFromBeyond attrs) = case msg of
    Revelation iid source | isSource attrs source -> do
      iids <- getSetList ()
      phaseHistory <- mconcat <$> traverse (getHistory PhaseHistory) iids
      let
        secondCopy =
          toCardCode attrs `elem` historyTreacheriesDrawn phaseHistory
      iidsWithAssets <- traverse
        (traverseToSnd $ (map unHandCardId <$>) . getSetList . (, AssetType))
        iids
      iidsWithEvents <- traverse
        (traverseToSnd $ (map unHandCardId <$>) . getSetList . (, EventType))
        iids
      iidsWithSkills <- traverse
        (traverseToSnd $ (map unHandCardId <$>) . getSetList . (, SkillType))
        iids
      t <$ push
        (chooseN
          iid
          (if secondCopy then 2 else 1)
          [ Label
            "Assets"
            [ Run [ DiscardCard iid' aid | aid <- assets ]
            | (iid', assets) <- iidsWithAssets
            ]
          , Label
            "Events"
            [ Run [ DiscardCard iid' eid | eid <- events ]
            | (iid', events) <- iidsWithEvents
            ]
          , Label
            "Skills"
            [ Run [ DiscardCard iid' sid | sid <- skills ]
            | (iid', skills) <- iidsWithSkills
            ]
          ]
        )
    _ -> TerrorFromBeyond <$> runMessage msg attrs
