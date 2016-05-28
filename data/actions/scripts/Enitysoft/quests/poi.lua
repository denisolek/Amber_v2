local configPOI = {
	requiredLevel = 100,
	playerPositions = {
		Position(125, 138, 11),
    	Position(126, 138, 11),
    	Position(127, 138, 11),
		Position(124, 139, 11),
		Position(125, 139, 11),
		Position(127, 139, 11),
   		Position(128, 139, 11),
    	Position(124, 140, 11),
    	Position(128, 140, 11),
    	Position(124, 141, 11),
		Position(125, 141, 11),
		Position(127, 141, 11),
    	Position(128, 141, 11),
    	Position(125, 142, 11),
    	Position(126, 142, 11),
    	Position(127, 142, 11)
	},
	
	newPositions = {
 		Position(132, 226, 11),
	    Position(133, 226, 11),
	    Position(134, 226, 11),
	    Position(135, 226, 11),
	    Position(132, 227, 11),
	    Position(133, 227, 11),
	    Position(134, 227, 11),
	    Position(135, 227, 11),
	    Position(132, 228, 11),
	    Position(133, 228, 11),
	    Position(134, 228, 11),
	    Position(135, 228, 11),
	    Position(132, 229, 11),
	    Position(133, 229, 11),
	    Position(134, 229, 11),
	    Position(135, 229, 11)    
	},

	posSonOfVerminor = Position(134,208,11),
	posGashar = Position(166,205,10),
	posSkuerom = Position(192,205,11),
	posSori = Position(216,223,10),
	posDeadVision = Position(206,234,13),
	posScaldor = Position(163,231,13),
	posSilverShadow = Position(151,233,11)
}

local function gameOver()
	local templePos = Position(153, 144, 7)
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		if targetPlayer:getStorageValue(9702) == 1 then
			targetPlayer:teleportTo(templePos)	
			targetPlayer:setStorageValue(9702, -1)
		end
	end
	oldStatuePos = Position(126, 139, 11)
	newStatue = Tile(oldStatuePos):getItemById(9241)
	newStatue:transform(9242)
	removeMonster("Son Of Verminor")
	removeMonster("The Gashar")
	removeMonster("Skuerom")
	removeMonster("Sori")
	removeMonster("The Dead Vision")
	removeMonster("Scaldor")
	removeMonster("The Silver Shadow")
end

function removeMonster(name)
	local creature = Creature(name)	
	if creature == nil or creature:isMonster() == nil then
	    return true
	end
	creature:remove()
end

local function tileEffect()
	for i = 1, #configPOI.playerPositions do
		configPOI.playerPositions[i]:sendMagicEffect(3)
	end
end

local daysvalue = 1 * 1 * 90 * 60


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9242 then
		local storePlayers, playerTile = {}

		for i = 1, #configPOI.playerPositions do
			playerTile = Tile(configPOI.playerPositions[i]):getTopCreature()
			if not playerTile or not playerTile:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 16 players.")
				player:say("You need 16 players.", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				tileEffect()
				return true
			end

			if playerTile:getLevel() < configPOI.requiredLevel then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "All the players need to be level ".. configPOI.requiredLevel .." or higher.")
				player:say("All the players need to be level ".. configPOI.requiredLevel .." or higher.", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				return true
			end

			if playerTile:getStorageValue(9701)-os.time() > 0 then
				player:say("At least one of your teammates has done Pits of Inferno earlier. REMEBER that you can do it every 12 hours!", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				playerTile:sendTextMessage(MESSAGE_STATUS_WARNING, "You must wait 12 hours to make this quest again. You'll be ready at: " .. os.date("%H:%M:%S", playerTile:getStorageValue(9701)) .. " (GMT+0).")
				return false
			end
			storePlayers[#storePlayers + 1] = playerTile
		end
			
	    Game.createMonster("Son Of Verminor", configPOI.posSonOfVerminor)
	    Game.createMonster("The Gashar", configPOI.posGashar)
	    Game.createMonster("Skuerom", configPOI.posSkuerom)
	    Game.createMonster("Sori", configPOI.posSori)
	    Game.createMonster("The Dead Vision", configPOI.posDeadVision)
	    Game.createMonster("Scaldor", configPOI.posScaldor)
	    Game.createMonster("The Silver Shadow", configPOI.posSilverShadow)
	            
	    local posTemple = Position(153,147,8)

		for i = 1, #storePlayers do
			players = storePlayers[i]
			configPOI.playerPositions[i]:sendMagicEffect(CONST_ME_FIREATTACK)
			time = os.time() + daysvalue
			players:setStorageValue(9701, time)
			players:setStorageValue(9702, 1)			
			players:sendTextMessage(MESSAGE_INFO_DESCR, "You have now 90 minutes to complete this quest and take your reward.")
			players:teleportTo(configPOI.newPositions[i])
			configPOI.newPositions[i]:sendMagicEffect(CONST_ME_ENERGYAREA)
			players:setDirection(DIRECTION_SOUTH)
		end
		addEvent(gameOver, 5400000)
		item:transform(9241)
		Game.setStorageValue(9703, time)
	else
		player:say("There is a team inside the quest room. POI will be open at: ".. os.date("%H:%M:%S", Game.getStorageValue(9703)) .. " (GMT+0).", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
	end
	return true
end