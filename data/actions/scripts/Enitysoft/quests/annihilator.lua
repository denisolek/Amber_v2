local configAni = {
	requiredLevel = 60,
	daily = false,
	centerDemonRoomPosition = Position(120, 113, 8),
	playerPositions = {
		Position(124, 130, 8),
		Position(124, 131, 8),
		Position(124, 132, 8),
		Position(124, 133, 8)
	},
	
	newPositions = {
		Position(120, 113, 8),
		Position(120, 114, 8),
		Position(120, 115, 8),
		Position(120, 116, 8)
	},

    posMasrahn = Position(120, 112, 8),
    posCliozhar = Position(123, 113, 8),
    posNiamohr = Position(123, 115, 8),
    posTazach = Position(120, 118, 8),
    posEipiobhal = Position(117, 116, 8),
    posStiosom = Position(117, 114, 8),
}

local function backTemple(playerId, pos)
    local player = Player(playerId)
    if not player then
        return true
    end
	local playerPos = player:getPosition()
	local tile = Tile(playerPos)
	local ground = tile:getGround()
	if ground then
		if ground:getActionId() == 51001 then
			player:teleportTo(pos)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The time is over. Try to be faster !")
			return true
		end
	end
end

local daysvalue = 1 * 12 * 60 * 60


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1946 then
		local storePlayers, playerTile = {}

		for i = 1, #configAni.playerPositions do
			playerTile = Tile(configAni.playerPositions[i]):getTopCreature()
			if not playerTile or not playerTile:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 4 players.")
				player:say("You need 4 players.", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				return true
			end

			if playerTile:getLevel() < configAni.requiredLevel then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "All the players need to be level ".. configAni.requiredLevel .." or higher.")
				player:say("All the players need to be level ".. configAni.requiredLevel .." or higher.", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				return true
			end

			if playerTile:getStorageValue(8001)-os.time() > 0 then
				player:say("At least one of your teammates has done Annihilator earlier. REMEBER that you can do it every 12 hours!", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				playerTile:sendTextMessage(MESSAGE_STATUS_WARNING, "You must wait 12 hours to make this quest again. You'll be ready at: " .. os.date("%H:%M:%S", playerTile:getStorageValue(8001)) .. " (SERVER TIME).")
				return false
			end
			storePlayers[#storePlayers + 1] = playerTile
		end

		local specs, spec = Game.getSpectators(configAni.centerDemonRoomPosition, false, false, 3, 3, 3, 3)
		
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
				player:say("A team is already inside the quest room.", TALKTYPE_MONSTER_SAY, false, player, fromPosition)
				return true
			end

			spec:remove()
		end
		
		local posWall = Position(120, 111, 8)
		local tile = Tile(posWall)
		local items = tile:getItems()
		local isWall = 0
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == 9127 then
		    	isWall=1
		    end
		  end	
		end
		if isWall == 0 then	
			Game.createItem(9127, 1, posWall)
    	end
        Game.createMonster("Masrahn", configAni.posMasrahn)
        Game.createMonster("Cliozhar", configAni.posCliozhar)
        Game.createMonster("Niamohr", configAni.posNiamohr)
        Game.createMonster("Tazach", configAni.posTazach)
        Game.createMonster("Eipiobhal", configAni.posEipiobhal)
        Game.createMonster("Stiosom", configAni.posStiosom)
            
        local posTemple = Position(153, 144, 7)

		for i = 1, #storePlayers do
			players = storePlayers[i]
			configAni.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
			time = os.time() + daysvalue
			players:setStorageValue(8001, time)			
			players:sendTextMessage(MESSAGE_INFO_DESCR, "You have now 15 minutes to complete this quest and take your reward.")
			players:teleportTo(configAni.newPositions[i])
			addEvent(backTemple, 900000, players.uid, posTemple)
			configAni.newPositions[i]:sendMagicEffect(CONST_ME_ENERGYAREA)
			players:setDirection(DIRECTION_NORTH)
		end
	elseif item.itemid == 1945 then
		if configAni.daily then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
			return true
		end
	end

	item:transform(item.itemid == 1946 and 1945 or 1946)
	return true
end