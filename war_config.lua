-- Amber server war config - by ENITYSOFT

startLevel = 70
--potionsInPz = "no"
newPlayerMessage = "Welcome to Amber - UNUSUAL WAR SERVER"
oldPlayerMessage = "Welcome back "
everyLoginMessage = "Please report all issues (CTRL + Z) and give us some feedback - Enitysoft"
restoreItems = "yes"

--> PLAYER STATS <--

--MAGES--
magesMagic = 35
magesShield = 25

--KNIGHT--
knightMagic = 5
knightShield = 64
knightMelee = 70

--PALADIN--
paladinMagic = 13
paladinShield = 35
paladinDistance = 74

--> FIRST ITEMS <--
commonItems = {
---------ALL VOCATIONS---------
  {itemid=1988, count=1}
}

--> FIRST ITEMS && RESTORE ITEMS <--
commonItems = {
---------ALL VOCATIONS---------
  {itemid=1988, count=1}
}

backpackItems = {
  { 				---------SORCERER ITEMS---------							     
	{itemid=7590, count=100},  -- strong mana potion
	{itemid=7590, count=100},  -- strong mana potion
	{itemid=2274, count=1},  -- AVA
	{itemid=2268, count=1},  -- SD
	{itemid=2273, count=1},  -- UH
	{itemid=2293, count=1},  -- MW
	{itemid=2305, count=1},  -- FB
	{itemid=2261, count=1},  -- DESTROY
	{itemid=2789, count=1},  -- BROWN MUSHROOM
  },
  { 				---------DRUID ITEMS---------
	{itemid=7590, count=100},   -- strong mana potion
	{itemid=7590, count=100},  -- strong mana potion
	{itemid=2274, count=1},     -- AVA
	{itemid=2268, count=1},     -- SD
	{itemid=2273, count=1},     -- UH
	{itemid=2293, count=1},     -- MW
	{itemid=2305, count=1},     -- FB
	{itemid=2261, count=1},     -- DESTROY
	{itemid=2278, count=1},     -- PARALYZE RUNE	
	{itemid=2789, count=1},     -- BROWN MUSHROOM
  },
  { 				---------PALADIN ITEMS---------
	{itemid=8472, count=100},  -- spirit
	{itemid=8472, count=100},  -- spirit
	{itemid=8472, count=100},  -- spirit
	{itemid=2305, count=1},   -- FB
	{itemid=2261, count=1}, -- DESTROY
	{itemid=2293, count=1},    -- MW
	{itemid=2789, count=1},    -- BROWN MUSHROOM
  },
  { 				---------KNIGHT ITEMS---------
	{itemid=7402, count=1}, -- giant sword
	{itemid=7591, count=100},  -- great health potion
	{itemid=7591, count=100},  -- great health potion
	{itemid=7620, count=100}, -- mana potion
	{itemid=7620, count=100}, -- mana potion
	{itemid=2293, count=1},     -- MW
	{itemid=2261, count=1}, -- DESTROY
	{itemid=2305, count=1}, -- FB
	{itemid=2789, count=1},    -- BROWN MUSHROOM
  }
}

