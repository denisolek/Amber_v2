local stonePos = Position(61, 261, 7)
local removeStonePos = Position(60, 261, 7)
local durakPos = Position(250, 36, 7)

function removeDurak(name)
	broadcastMessage("Time is up! \n Server status: PVP", MESSAGE_STATUS_WARNING)
	local templePos = Position(153, 144, 7)
	-- remove players
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		if targetPlayer:getStorageValue(9601) == 1 then
			targetPlayer:teleportTo(templePos)	
			targetPlayer:setStorageValue(9601, -1)
		end
	end
	---
	Game.setWorldType(WORLD_TYPE_PVP_ENFORCED)
	local creature = Creature(name)	
	if creature == nil or creature:isMonster() == nil then
	    return true
	end
	creature:remove()
end

local function tpFromAdded(posFrom, posTo)
	local tile = Tile(posFrom)
	local tileCreatures = tile:getCreatures()
	if tileCreatures then
	  for i = 1, #tileCreatures do
	  	local creature = tileCreatures[i]
	  	creature:teleportTo(posTo,true)
	  end
	end
end

local function durakRespawn()
	local itemPos = Tile(stonePos):getItemById(1355)
	if itemPos then
		itemPos:remove()
		local spectators = Game.getSpectators(stonePos, false, true, 7, 7)
		for i = 1, #spectators do
			spectators[i]:say("Durak is here, BEWARE!", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], stonePos)
		end
	end
	Game.createMonster('Durak', durakPos, false, true)
	addEvent(tpFromAdded, 900000, stonePos, removeStonePos)
	addEvent(Game.createItem, 720000, 1355, 1, stonePos)	
	addEvent(removeDurak, 900000, 'Durak')
	broadcastMessage("Durak has spawned!", MESSAGE_STATUS_WARNING)
end

local function secondDurakWarning()
	broadcastMessage("Durak is comming in 60 seconds.", MESSAGE_STATUS_WARNING)
	addEvent(durakRespawn, 60000)
end

local function firstDurakWarning()
	broadcastMessage("Server status: NON-PVP (Durak in 3 minutes)", MESSAGE_STATUS_WARNING)
	Game.setWorldType(WORLD_TYPE_NO_PVP)
	addEvent(secondDurakWarning, 120000)
end

function onTime(interval)
	local time = os.time()
	broadcastMessage("Lord of the Amber DURAK will be spawned in 5 minutes. Remember that server will be NON-PVP from "..os.date("%H:%M", time+120).." to "..os.date("%H:%M", time+1200) , MESSAGE_STATUS_WARNING)
	addEvent(firstDurakWarning, 120000)
	return true
end
