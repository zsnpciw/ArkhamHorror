module Arkham.Asset.Cards (module Arkham.Asset.Cards, module X) where

import Arkham.Asset.Cards.EdgeOfTheEarth as X
import Arkham.Asset.Cards.NightOfTheZealot as X
import Arkham.Asset.Cards.Parallel as X
import Arkham.Asset.Cards.Promo as X
import Arkham.Asset.Cards.ReturnTo as X
import Arkham.Asset.Cards.Standalone as X
import Arkham.Asset.Cards.Starter as X
import Arkham.Asset.Cards.TheCircleUndone as X
import Arkham.Asset.Cards.TheDreamEaters as X
import Arkham.Asset.Cards.TheDrownedCity as X
import Arkham.Asset.Cards.TheDunwichLegacy as X
import Arkham.Asset.Cards.TheFeastOfHemlochVale as X
import Arkham.Asset.Cards.TheForgottenAge as X
import Arkham.Asset.Cards.TheInnsmouthConspiracy as X
import Arkham.Asset.Cards.ThePathToCarcosa as X
import Arkham.Asset.Cards.TheScarletKeys as X
import Arkham.Card.CardCode
import Arkham.Card.CardDef
import Arkham.Prelude

allPlayerAssetCards :: Map CardCode CardDef
allPlayerAssetCards =
  mapFromList
    $ concatMap
      toCardCodePairs
      [ abbessAllegriaDiBiase
      , abigailForeman4
      , abyssalTome2
      , aceOfRods1
      , aceOfSwords1
      , adaptable1
      , agencyBackup5
      , alchemicalDistillation
      , alchemicalTransmutation
      , alchemicalTransmutation2
      , alejandroVela
      , aliceLuxley
      , altonOConnellGhostHunter
      , alyssaGraham
      , analyticalMind
      , ancestralKnowledge3
      , ancestralToken
      , ancientCovenant2
      , ancientStone1
      , ancientStoneKnowledgeOfTheElders4
      , ancientStoneMindsInHarmony4
      , ancientStoneTransientThoughts4
      , annaKaslow4
      , anotherDayAnotherDollar3
      , antiquary3
      , anyuFaithfulCompanion
      , aquinnah1
      , aquinnah3
      , arbiterOfFates
      , arcaneEnlightenment
      , arcaneInitiate
      , arcaneInitiate3
      , arcaneInsight4
      , arcaneResearch
      , arcaneStudies
      , arcaneStudies2
      , arcaneStudies4
      , archaicGlyphs
      , archaicGlyphsGuidingStones3
      , archaicGlyphsMarkingsOfIsis3
      , archaicGlyphsProphecyForetold3
      , archiveOfConduitsGatewayToAcheron4
      , archiveOfConduitsGatewayToAldebaran4
      , archiveOfConduitsGatewayToParadise4
      , archiveOfConduitsGatewayToTindalos4
      , archiveOfConduitsUnidentified
      , ariadnesTwine3
      , armageddon
      , armageddon4
      , armorOfArdennes5
      , artStudent
      , artisticInspiration
      , astralMirror2
      , astronomicalAtlas3
      , augur
      , augustLindquist
      , averyClaypoolAntarcticGuide
      , averyClaypoolAntarcticGuideResolute
      , awakenedMantle
      , azureFlame
      , azureFlame3
      , azureFlame5
      , backInjury
      , backpack
      , backpack2
      , bandages
      , bandolier
      , bandolier2
      , bangleOfJinxes1
      , baronSamedi
      , baseballBat
      , baseballBat2
      , bauta
      , beatCop
      , beatCop2
      , becky
      , berettaM19184
      , bestowResolve2
      , bewitching3
      , biancaDieKatzSingingYourSong
      , bindersJarInterdimensionalPrison1
      , blackjack
      , blackjack2
      , blackmailFile
      , bladeOfYothTheFathersIre
      , blasphemousCovenant2
      , blessedBlade
      , blessedBlade4
      , blessingOfIsis3
      , bloodOfThothLawIncarnate
      , bloodPact
      , bloodPact3
      , bloodstainedDagger
      , blur1
      , blur4
      , bonesaw
      , bonnieWalshLoyalAssistant
      , bookOfLivingMythsChronicleOfWonders
      , bookOfPsalms
      , bookOfShadows1
      , bookOfShadows3
      , bookOfVerseUnCommonplaceBook
      , borrowedTime3
      , bountyContracts
      , boxingGloves
      , boxingGloves3
      , brandOfCthugha1
      , brandOfCthugha4
      , breathOfTheSleeper
      , britishBullDog
      , britishBullDog2
      , brokenDiademCrownOfDyingLight5
      , brotherXavier1
      , bruiser3
      , bulletproofVest3
      , burglary
      , burglary2
      , butterflySwords2
      , butterflySwords5
      , catBurglar1
      , catMaskTheCapriciousMeddler
      , celaenoFragments
      , ceremonialSickle
      , ceremonialSickle4
      , chainsaw4
      , charisma3
      , charlesRossEsq
      , charonsObol1
      , chemistrySet
      , cherishedKeepsake
      , cherishedKeepsake1
      , chicagoTypewriter4
      , chuckFergus2
      , chuckFergus5
      , clairvoyance
      , clairvoyance3
      , clairvoyance5
      , clarityOfMind
      , clarityOfMind3
      , claspOfBlackOnyx
      , claypoolsFurs
      , cleaningKit
      , cleaningKit3
      , closeTheCircle1
      , collectedWorksOfPoe
      , coltVestPocket
      , coltVestPocket2
      , combatTraining1
      , combatTraining3
      , cookiesCustom32
      , cornered2
      , crafty3
      , crowbar
      , crypticGrimoireTextOfTheElderGuardian4
      , crypticGrimoireTextOfTheElderHerald4
      , crypticGrimoireUntranslated
      , cryptographicCipher
      , crystalPendulum
      , crystallineElderSign3
      , crystallizerOfDreams
      , curseOfAeons3
      , cyclopeanHammer5
      , daisysToteBag
      , daisysToteBagAdvanced
      , damningTestimony
      , danforthBrilliantStudent
      , danforthBrilliantStudentResolute
      , darioElAmin
      , darkHorse
      , darkHorse5
      , darkRitual
      , darrellsKodak
      , davidRenfield
      , dayanaEsperence3
      , deVermisMysteriis2
      , deathXiii1
      , decoratedSkull
      , decoratedSkull3
      , dejaVu5
      , delilahORourke3
      , dendromorphosis
      , detectivesColt1911s
      , devilFriendOrFoe2
      , dialOfAncientsUnidentified
      , digDeep
      , digDeep2
      , digDeep4
      , directiveConsultExperts
      , directiveDueDiligence
      , directiveLeaveNoDoubt
      , directiveRedTape
      , directiveSeekTheTruth
      , dirtyFighting2
      , discOfItzamna
      , discOfItzamna2
      , disciplineAlignmentOfSpirit
      , disciplineAlignmentOfSpiritBroken
      , disciplineBalanceOfBody
      , disciplineBalanceOfBodyBroken
      , disciplinePrescienceOfFate
      , disciplinePrescienceOfFateBroken
      , disciplineQuiescenceOfThought
      , disciplineQuiescenceOfThoughtBroken
      , disguise
      , dissectionTools
      , divination1
      , divination4
      , doubleDouble4
      , downTheRabbitHole
      , dowsingRod
      , dowsingRod4
      , drAmyKenslerProfessorOfBiology
      , drAmyKenslerProfessorOfBiologyResolute
      , drCharlesWestIiiKnowsHisPurpose
      , drElliHorowitz
      , drFrancisMorgan
      , drHenryArmitage
      , drMalaSinhaDaringPhysician
      , drMalaSinhaDaringPhysicianResolute
      , drMilanChristopher
      , drShivaniMaheswaran
      , drWilliamTMaleson
      , drWilliamTMaleson2
      , dragonPole
      , drawingThin
      , dreamDiary
      , dreamDiaryDreamsOfAChild3
      , dreamDiaryDreamsOfAMadman3
      , dreamDiaryDreamsOfAnExplorer3
      , dreamEnhancingSerum
      , duke
      , dynamite
      , earlSawyer
      , earthlySerenity1
      , earthlySerenity4
      , eighteenDerringer
      , eighteenDerringer2
      , elderSignAmulet3
      , eldritchSophist
      , eldritchTongue
      , elinaHarperKnowsTooMuch
      , eliyahAshevakDogHandler
      , eliyahAshevakDogHandlerResolute
      , elleRubashPurifyingPurpose2
      , ellsworthsBoots
      , embezzledTreasure
      , empiricalHypothesis
      , empowerSelfAcuity2
      , empowerSelfAlacrity2
      , empowerSelfStamina2
      , emptyVessel4
      , enchantedArmor2
      , enchantedBlade
      , enchantedBladeGuardian3
      , enchantedBladeMystic3
      , enchantedBow2
      , encyclopedia
      , encyclopedia2
      , eonChart1
      , eonChart4
      , esotericAtlas1
      , esotericAtlas2
      , esotericFormula
      , evanescentAscensionTheMorningStar
      , expeditionJournal
      , eyeOfChaos
      , eyeOfChaos4
      , eyeOfTheDjinnVesselOfGoodAndEvil2
      , eyesOfTheDreamer
      , eyesOfValusiaTheMothersCunning4
      , fakeCredentials
      , fakeCredentials4
      , falseCovenant2
      , familiarSpirit
      , familyInheritance
      , farsight4
      , favorOfTheMoon1
      , favorOfTheSun1
      , feedTheMind
      , feedTheMind3
      , fence1
      , fieldAgent2
      , fieldwork
      , fineClothes
      , fingerprintKit
      , fingerprintKit4
      , finnsTrustyThirtyEight
      , fireAxe
      , fireAxe2
      , fireExtinguisher1
      , fireExtinguisher3
      , firstAid
      , firstAid3
      , fiveOfPentacles1
      , flamethrower5
      , flashlight
      , flashlight3
      , fleshWard
      , fluteOfTheOuterGods4
      , fluxStabilizerActive
      , fluxStabilizerInactive
      , foolishnessFoolishCatOfUlthar
      , forbiddenKnowledge
      , forbiddenTome
      , forbiddenTomeDarkKnowledge3
      , forbiddenTomeSecretsRevealed3
      , forcedLearning
      , forensicKit
      , fortyFiveAutomatic
      , fortyFiveAutomatic2
      , fortyFiveThompson
      , fortyFiveThompsonGuardian3
      , fortyFiveThompsonRogue3
      , fortyOneDerringer
      , fortyOneDerringer2
      , fourOfCups1
      , foxMaskTheWiseTrickster
      , gabrielCarilloTrustedConfidante1
      , garroteWire2
      , gateBox
      , gavriellaMizrah
      , gearedUp
      , geas2
      , geneBeauregard3
      , gildedVolto
      , girishKadakiaIcpcPunjabDetective4
      , grannyOrne
      , grannyOrne3
      , grapplingHook
      , gravediggersShovel
      , gravediggersShovel2
      , graysAnatomyTheDoctorsBible5
      , greenManMedallionHourOfTheHuntress
      , greenSoapstoneJinxedIdol
      , gregoryGry
      , greteWagner
      , greteWagner3
      , grimMemoir
      , grimmsFairyTales
      , grislyTotem
      , grislyTotemSeeker3
      , grislyTotemSurvivor3
      , grotesqueStatue2
      , grotesqueStatue4
      , grounded1
      , grounded3
      , guardDog
      , guardDog2
      , guardianAngel
      , guidedByTheUnseen3
      , guidingSpirit1
      , hallowedChalice
      , hallowedMirror
      , hallowedMirror3
      , handcuffs
      , handcuffs2
      , hardKnocks
      , hardKnocks2
      , hardKnocks4
      , harlanEarnstone
      , haste2
      , hatchet1
      , hawkEyeFoldingCamera
      , headdressOfYhaNthlei
      , healingWords
      , healingWords3
      , heavyFurs
      , heirloomOfHyperborea
      , heirloomOfHyperboreaAdvanced
      , hemisphericMap3
      , henryDeveau
      , henryWan
      , highRoller2
      , higherEducation
      , higherEducation3
      , hikingBoots1
      , hiredMuscle1
      , holyRosary
      , holyRosary2
      , holySpear5
      , hope
      , huntersArmor
      , huntingJacket2
      , hyperawareness
      , hyperawareness2
      , hyperawareness4
      , hyperphysicalShotcasterTheoreticalDevice
      , hypnoticTherapy
      , icePick1
      , icePick3
      , ichtacaTheForgottenGuardian
      , idolOfXanatosWatcherBeyondTime
      , ikiaqTheCouncilsChosen3
      , improvisedShield
      , inTheKnow1
      , inTheThickOfIt
      , ineffableTruth
      , ineffableTruth3
      , ineffableTruth5
      , innocentReveler
      , investments
      , jacobMorrisonCostGuardCaptain3
      , jakeWilliams
      , jamesCookieFredericksDubiousChoice
      , jamesCookieFredericksDubiousChoiceResolute
      , jennysTwin45s
      , jennysTwin45sAdvanced
      , jeremiahKirbyArcticArchaeologist
      , jeromeDavids
      , jessicaHyde1
      , jewelOfAureolus3
      , jimsTrumpet
      , jimsTrumpetAdvanced
      , joeSargentRattletrapBusDriver
      , joeyTheRatVigil
      , joeyTheRatVigil3
      , katana
      , katjaEastbankKeeperOfEsotericLore2
      , keenEye
      , keenEye3
      , keeperOfTheKeyCelestialWard
      , kenslersLog
      , kerosene1
      , keyOfYs
      , kleptomania
      , knife
      , knightOfSwords3
      , knuckleduster
      , kukri
      , labCoat1
      , laboratoryAssistant
      , ladyEsprit
      , lantern
      , lantern2
      , leatherCoat
      , leatherCoat1
      , leatherJacket
      , leoDeLuca
      , leoDeLuca1
      , libraryDocent1
      , lightningGun5
      , liquidCourage
      , liquidCourage1
      , litaChantler
      , livingInk
      , livreDeibon
      , lockpicks
      , lockpicks1
      , lolaSantiago3
      , loneWolf
      , lonnieRitter
      , luckyCigaretteCase
      , luckyCigaretteCase3
      , luckyDice2
      , luckyDice3
      , luckyPennyOmenOfMisfortune2
      , lugerP08
      , lupara3
      , m1918Bar4
      , machete
      , madameLabranche
      , magnifyingGlass
      , magnifyingGlass1
      , maimedHand
      , mariaDeSilva
      , marinersCompass
      , marinersCompass2
      , martyrsVambraceRemnantOfTheUnknown3
      , maskedCarnevaleGoer_17
      , maskedCarnevaleGoer_18
      , maskedCarnevaleGoer_19
      , maskedCarnevaleGoer_20
      , maskedCarnevaleGoer_21
      , matchbox
      , mauserC96
      , mauserC962
      , meatCleaver
      , mechanicsWrench
      , medicalStudent
      , medicalTexts
      , medicalTexts2
      , medicoDellaPeste
      , miasmicCrystalStrangeEvidence
      , michaelLeigh5
      , microscope
      , microscope4
      , mindsEye2
      , mineralSpecimen
      , miskatonicArchaeologyFunding4
      , missDoyle1
      , mistsOfRlyeh
      , mistsOfRlyeh2
      , mistsOfRlyeh4
      , mitchBrown
      , mk1Grenades4
      , mollyMaxwell
      , monstrousTransformation
      , moonPendant2
      , moonstone
      , mortarAndPestle
      , mouseMaskTheMeekWatcher
      , moxie1
      , moxie3
      , mrRook
      , mysteriousRaven
      , nephthysHuntressOfBast4
      , newspaper
      , newspaper2
      , nightmareBauble3
      , nineOfRods3
      , nkosiMabatiEnigmaticWarlock3
      , obfuscation
      , observed4
      , obsidianBracelet
      , occultLexicon
      , occultLexicon3
      , occultReliquary3
      , occultScraps
      , oculaObscuraEsotericEyepiece
      , oculusMortuum
      , ofuda
      , oldBookOfLore
      , oldBookOfLore3
      , oldHuntingRifle3
      , oldKeyring
      , oldKeyring3
      , oldShotgun2
      , oliveMcBride
      , oliveMcBride2
      , onYourOwn3
      , onYourOwn3_Exceptional
      , onyxPentacle
      , onyxPentacle4
      , ornateBow3
      , orphicTheory1
      , otherworldCodex2
      , otherworldlyCompass2
      , painkillers
      , pantalone
      , paradoxicalCovenant2
      , pathfinder1
      , patricesViolin
      , peltShipment
      , pendantOfTheQueen
      , pennyWhite
      , peterSylvestre
      , peterSylvestre2
      , petesGuitar
      , physicalTraining
      , physicalTraining2
      , physicalTraining4
      , pickpocketing
      , pickpocketing2
      , pitchfork
      , plucky1
      , plucky3
      , pnakoticManuscripts5
      , pocketMultiTool
      , pocketTelescope
      , policeBadge2
      , powderOfIbnGhazi
      , preciousMementoFromAFormerLife4
      , preciousMementoFromAFutureLife4
      , pressPass2
      , priestOfTwoFaiths1
      , prismaticSpectaclesLensToTheOtherworld2
      , professorWarrenRice
      , professorWilliamDyerProfessorOfGeology
      , professorWilliamDyerProfessorOfGeologyResolute
      , professorWilliamWebbFinderOfHiddenConnections
      , professorWilliamWebbFinderOfHiddenConnections2
      , prophesiaeProfanaAtlasOfTheUnknowable5
      , prophetic3
      , protectiveGear2
      , protectiveIncantation1
      , purifyingCorruption4
      , puzzleBox
      , quickLearner4
      , quickStudy2
      , quickdrawHolster4
      , rabbitsFoot
      , rabbitsFoot3
      , randallCho
      , randolphCarterChainedToTheWakingWorld
      , randolphCarterExpertDreamer
      , ravenousControlledHunger
      , ravenousMyconidCarnivorousStrain4
      , ravenousMyconidNurturingStrain4
      , ravenousMyconidSentientStrain4
      , ravenousMyconidUnidentified
      , ravenousUncontrolledHunger
      , recallTheFuture2
      , relentless
      , relicHunter3
      , relicOfAgesADeviceOfSomeSort
      , relicOfAgesForestallingTheFuture
      , relicOfAgesRepossessThePast
      , relicOfAgesUnleashTheTimestream
      , remingtonModel1858
      , researchLibrarian
      , researchNotes
      , riotWhistle
      , riteOfSanctification
      , riteOfSeeking
      , riteOfSeeking2
      , riteOfSeeking4
      , ritualCandles
      , roaldEllsworthIntrepidExplorer
      , roaldEllsworthIntrepidExplorerResolute
      , robertCastaigneHasYourBack
      , robesOfEndlessNight
      , robesOfEndlessNight2
      , rodOfAnimalism1
      , rodOfCarnamagosScepterOfTheMadSeer
      , rodOfCarnamagosScepterOfTheMadSeer2
      , rolands38Special
      , rolands38SpecialAdvanced
      , runicAxe
      , ruthWestmacottDarkRevelations
      , sacredCovenant2
      , safeguard
      , safeguard2
      , sawedOffShotgun5
      , scavenging
      , scavenging2
      , schoffnersCatalogue
      , scientificTheory1
      , scientificTheory3
      , scrapper
      , scrapper3
      , scrimshawCharmFromDistantShores
      , scrollOfProphecies
      , scrollOfSecrets
      , scrollOfSecretsMystic3
      , scrollOfSecretsSeeker3
      , scrying
      , scrying3
      , scryingMirror
      , seaChangeHarpoon
      , sealOfTheSeventhSign5
      , segmentOfOnyx1
      , sergeantMonroe
      , servantOfBrassDaemonaicVassal
      , shardsOfTheVoid3
      , sharpshooter3
      , shieldOfFaith2
      , shiningTrapezohedron4
      , shortSupply
      , shotgun4
      , showmanship
      , shrewdAnalysis
      , shrewdDealings
      , shrivelling
      , shrivelling3
      , shrivelling5
      , shroudOfShadows
      , shroudOfShadows4
      , signMagick
      , signMagick3
      , silassNet
      , sinEater3
      , sinhasMedicalKit
      , sixthSense
      , sixthSense4
      , sledDog
      , sledgehammer
      , sledgehammer4
      , sleuth3
      , smallRadio
      , smokingPipe
      , solemnVow
      , somethingWorthFightingFor
      , songOfTheDead2
      , sophieInLovingMemory
      , sophieItWasAllMyFault
      , soulSanctification3
      , spareParts
      , sparrowMaskTheWanderersCompanion
      , speakToTheDead
      , spectralWeb
      , spiritAthame1
      , spiritOfHumanity2
      , spiritSpeaker
      , spiritualResolve5
      , splitTheAngleIreOfTheVoid
      , springfieldM19034
      , stHubertsKey
      , steadyHanded1
      , stealth
      , stealth3
      , stickToThePlan3
      , strangeSolution
      , strangeSolutionAcidicIchor4
      , strangeSolutionEmpoweringElixir4
      , strangeSolutionFreezingVariant4
      , strangeSolutionRestorativeConcoction4
      , strayCat
      , streetwise
      , streetwise3
      , stringAlong
      , studious3
      , stylishCoat1
      , suggestion1
      , suggestion4
      , summonedHound1
      , summonedServitor
      , surgicalKit3
      , survivalKnife
      , survivalKnife2
      , survivalTechnique2
      , switchblade
      , switchblade2
      , swordCane
      , takadaHirokoAeroplaneMechanic
      , takadaHirokoAeroplaneMechanicResolute
      , talismanOfProtection
      , teachingsOfTheOrder
      , tennesseeSourMash
      , tennesseeSourMashRogue3
      , tennesseeSourMashSurvivor3
      , tetsuoMori
      , theBeyondBleakNetherworld
      , theBlackBook
      , theBlackCat5
      , theBlackFan3
      , theBookOfWarSunTzusLegacy
      , theChthonianStone
      , theChthonianStone3
      , theCodexOfAges
      , theCodexOfAgesAdvanced
      , theCouncilsCoffer2
      , theCustodian
      , theDevilXv
      , theFool03
      , theGreatWorkDivideAndUnite
      , theGoldPocketWatch4
      , theHierophantV3
      , theHungeringBlade1
      , theKeyOfSolomonSecretsOfTheUnknown4
      , theKingInYellow
      , theMoonXiii1
      , theNecronomicon
      , theNecronomiconAdvanced
      , theNecronomiconOlausWormiusTranslation
      , theNecronomiconPetrusDeDaciaTranslation5
      , thePallidMask
      , theRedClockBrokenButReliable2
      , theRedClockBrokenButReliable5
      , theRedGlovedMan5
      , theSilverKey
      , theSilverMoth
      , theSkeletonKey2
      , theStarXvii3
      , theTatteredCloak
      , theTowerXVI
      , theWorldXxi3
      , thermos
      , thievesKit
      , thievesKit3
      , thirtyFiveWinchester
      , thirtyTwoColt
      , thirtyTwoColt2
      , thomasDawsonSoldierInANewWar
      , tidalMemento
      , timewornBrand5
      , tokenOfFaith
      , tokenOfFaith3
      , tonys38LongColt
      , toolBelt
      , toothOfEztli
      , trackShoes
      , treasureHunter1
      , trenchCoat
      , trenchKnife
      , triggerMan3
      , tristanBotleyFixerForHire2
      , trueGrit
      , trueMagickReworkingReality5
      , trustyBullwhip
      , trustyBullwhipAdvanced
      , tryAndTryAgain1
      , tryAndTryAgain3
      , twentyFiveAutomatic
      , twentyFiveAutomatic2
      , twilaKatherinePrice3
      , twilightBlade
      , twilightDiademCrownOfDyingLight
      , uncannySpecimen
      , underworldMarket2
      , underworldSupport
      , unscrupulousLoan3
      , untilTheEndOfTime
      , valentinoRivas
      , vaultOfKnowledge
      , venturer
      , versatile2
      , violaCase
      , virgilGray
      , vowOfDrzytelech
      , wavewornIdol
      , wellConnected
      , wellConnected3
      , wellPrepared2
      , wendysAmulet
      , wendysAmuletAdvanced
      , whittonGreene
      , whittonGreene2
      , wickedAthame
      , wishEater
      , wither
      , wither4
      , wolfMaskTheMoonsSire
      , woodenSledge
      , woundedBystanderOnDeathsDoorstep
      , yaotl1
      , zeal
      , zebulonWhateley
      , zoeysCross
      , zoeysCrossAdvanced
      ]

-- with encounter backs
allEncounterAssetCards :: Map CardCode CardDef
allEncounterAssetCards =
  mapFromList
    $ map
      (toCardCode &&& id)
      [ adamLynch
      , alchemicalConcoction
      , bearTrap
      , divingSuit
      , fishingNet
      , haroldWalsted
      , helplessPassenger
      , jazzMulligan
      , keyToTheChamber
      , peterClover
      , constanceDumaine
      , jordanPerry
      , ishimaruHaruko
      , sebastienMoreau
      , ashleighClarke
      , mrPeabody
      , danielChesterfield
      , alienDevice
      , managersKey
      , tomeOfRituals
      , sinisterSolution
      , timeWornLocket
      , virgilGrayTrulyInspired
      , theCaptain
      , richardUptonPickman
      , fishingVessel
      , thomasDawsonsCarRunning
      , thomasDawsonsCarStopped
      , elinaHarpersCarRunning
      , elinaHarpersCarStopped
      , yhanthleiStatueMysteriousRelic
      , yhanthleiStatueDynamicRelic
      ]

allSpecialPlayerAssetCards :: Map CardCode CardDef
allSpecialPlayerAssetCards =
  mapFromList $ map (toCardCode &&& id) [courage, straitjacket, intrepid]
