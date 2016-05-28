local durakLoot = {
	{itemId = 11429, countMin = 1, countMax = 3, chance = 100},
	{itemId = 5944, countMin = 1, countMax = 4, chance = 60},
	{itemId = 2197, countMin = 1, countMax = 6, chance = 100},
	{itemId = 2164, countMin = 5, countMax = 20, chance = 100},
	{itemId = 6500, countMin = 1, countMax = 3, chance = 15},
	{itemId = 8880, countMin = 1, countMax = 1, chance = 1},
	{itemId = 8888, countMin = 1, countMax = 1, chance = 1},
	{itemId = 8869, countMin = 1, countMax = 1, chance = 1},
	{itemId = 2522, countMin = 1, countMax = 1, chance = 1},
	{itemId = 11118, countMin = 1, countMax = 1, chance = 1}
}

function drawLoot(ch, min, max)
	local result = math.random(1,100)
	if result > ch then
		return false
	else
		local count = math.random(min,max)
		return count
	end
end

function onlineReward()
    for _, allOnline in ipairs(Game.getPlayers()) do
    	allOnline:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Durak has been slain. \n[100k for all online players]")
		local depotChest = allOnline:getDepotChest(1, true)
		if depotChest then
		    depotChest:addItem(2160, 10, INDEX_WHEREEVER, FLAG_NOLIMIT)
		end
	end
	return true
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    if creature:isPlayer() then
        return true
    end

    if getCreatureName(creature):lower() == "durak" then
    for id, damage in pairs(creature:getDamageMap()) do
        local player = Player(id)
        if player then
        	local lootMsg = "Reward from Durak: "
			local depotChest = player:getDepotChest(1, true)
			if depotChest then	
				local durakBP = depotChest:addItem(1998, 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
				if durakBP then
					for i=1, #durakLoot do
						local itemCount = drawLoot(durakLoot[i].chance, durakLoot[i].countMin, durakLoot[i].countMax)
						if itemCount then
							local tmpItem = ItemType(durakLoot[i].itemId)
							durakBP:addItem(durakLoot[i].itemId, itemCount, INDEX_WHEREEVER, FLAG_NOLIMIT)
				    		if i==1 then
				    			lootMsg = lootMsg..tmpItem:getName().." ["..itemCount.."]"
				    		else
				    			lootMsg = lootMsg..", "..tmpItem:getName().." ["..itemCount.."]"
				    		end
				    	end
				    end
				end
			end
			lootMsg = lootMsg.."."
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, lootMsg)			
        end
    end  
    addEvent(onlineReward, 20000)  	
    end
end