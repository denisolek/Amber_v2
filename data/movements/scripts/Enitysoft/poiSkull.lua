local config = {
	-- POI entrance
	[20302] = { sacrificePosition = Position(126, 146, 7), pushPosition = Position(126, 143, 7), destination = Position(126, 140, 11) }
}

function kickOut(playerId, pos)
	local player = Player(playerId)
    if not player then
        return true
    end

	if player:getStorageValue(9700) == 1 then
		player:teleportTo(pos)	
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Seriously?! You wasted Amber Skull for nothing ?")
		player:setStorageValue(9700, -1)
	end
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local flame = config[item.actionid]
	if not flame then
		return true
	end

	local items = Tile(flame.sacrificePosition):getItems()
	for i = 1, #items do
		local tmpItem = items[i]

		-- Looking for specific item ids (sacrifice ids)
		if isInArray({2229}, tmpItem:getId()) then
			-- Teleport Player
			player:teleportTo(flame.destination)
			position:sendMagicEffect(CONST_ME_HITBYFIRE)
			flame.sacrificePosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			flame.destination:sendMagicEffect(CONST_ME_HITBYFIRE)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You entered POI waiting room. Now you have 20 minutes to start the quest.")
			addEvent(kickOut, 1200000, player.uid, flame.pushPosition)
			-- Remove Soil
			tmpItem:remove()
			return true
		end
	end

	-- Send the player backwards if there's no sacrifice
	player:teleportTo(flame.pushPosition)
	position:sendMagicEffect(CONST_ME_ENERGYHIT)
	flame.pushPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
	return true
end