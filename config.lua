-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp-enforced"
hotkeyAimbotEnabled = true
protectionLevel = 1
killsToRedSkull = 30
killsToBlackSkull = 50
pzLocked = 5000
removeChargesFromRunes = true
timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 1 * 1 * 1000
stairJumpExhaustion = 2000
experienceByKillingPlayers = true
expFromPlayersLevelRange = 150

-- WAR Frag EXP
fragExpLevelDiffRate = 45 -- 0.45
fragExpRate = 35 -- 0.35

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "51.254.218.120"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 0
motd = "Welcome to Amber! - by Enitysoft!"
onePlayerOnlinePerAccount = true
allowClones = false
serverName = "Amber"
statusTimeout = 5000
replaceKickOnLogin = true
maxPacketsPerSecond = 75

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 300000
houseRentPeriod = "never"

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "aa"
mapAuthor = "KregoX"

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = "admin"
mysqlDatabase = "tfsgesior"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = true
classicEquipmentSlots = false

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = 1
rateSkill = 3
rateLoot = 1
rateMagic = 1
rateSpawn = 1

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = false

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = false

-- Status server information
ownerName = ""
ownerEmail = ""
url = "https://otland.net/"
location = "Sweden"
