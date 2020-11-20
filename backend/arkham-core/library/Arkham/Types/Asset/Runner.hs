module Arkham.Types.Asset.Runner where

import ClassyPrelude

import Arkham.Types.AssetId
import Arkham.Types.Card
import Arkham.Types.Classes
import Arkham.Types.EnemyId
import Arkham.Types.InvestigatorId
import Arkham.Types.LocationId
import Arkham.Types.Query
import Arkham.Types.Trait

type AssetRunner env
  = ( HasQueue env
    , HasModifiersFor env ()
    , HasCount AssetCount env (InvestigatorId, [Trait])
    , HasCount CardCount env InvestigatorId
    , HasCount ClueCount env LocationId
    , HasCount EnemyCount env InvestigatorId
    , HasCount HealthDamageCount env EnemyId
    , HasCount HorrorCount env InvestigatorId
    , HasCount ResourceCount env InvestigatorId
    , HasCount SanityDamageCount env EnemyId
    , HasId (Maybe StoryEnemyId) env CardCode
    , HasId ActiveInvestigatorId env ()
    , HasId CardCode env EnemyId
    , HasId LocationId env InvestigatorId
    , HasSet AccessibleLocationId env LocationId
    , HasSet AssetId env InvestigatorId
    , HasSet BlockedLocationId env ()
    , HasSet ConnectedLocationId env LocationId
    , HasSet EnemyId env InvestigatorId
    , HasSet EnemyId env LocationId
    , HasSet InvestigatorId env ()
    , HasSet InvestigatorId env LocationId
    , HasSet Trait env AssetId
    , HasSet Trait env EnemyId
    )
