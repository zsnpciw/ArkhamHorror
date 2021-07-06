{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE UndecidableInstances #-}
module Entity.Arkham.Game
  ( module Entity.Arkham.Game
  ) where

import Arkham.Types.Game
import Arkham.Types.Message
import ClassyPrelude
import Data.UUID
import Database.Persist.Postgresql.JSON ()
import Database.Persist.TH
import Json
import Orphans ()

share [mkPersist sqlSettings] [persistLowerCase|
ArkhamGame sql=arkham_games
  Id UUID default=uuid_generate_v4()
  name Text
  currentData Game
  queue [Message]
  log [Text]
  deriving Generic Show
|]

instance ToJSON ArkhamGame where
  toJSON = genericToJSON $ aesonOptions $ Just "arkhamGame"
  toEncoding = genericToEncoding $ aesonOptions $ Just "arkhamGame"
