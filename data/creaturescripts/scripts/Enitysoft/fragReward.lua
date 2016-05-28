function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	if creature:isPlayer() then
		local killersArray = {}
		if lasthitkiller:isPlayer() then
			if creature:getId() == lasthitkiller:getId() then
				return true
			end
			if creature:getIp() == lasthitkiller:getIp() then
				lasthitkiller:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You can't get reward for killing player from the same IP.")
				return true
			end
			if lasthitkiller:getStorageValue(9500) ~= 1 then
				lasthitkiller:addItem(2151, 1)
			end
		end
	    local killers = 1
	    for id, damage in pairs(creature:getDamageMap()) do
	        local player = Player(id)
	        if player then
	            killersArray[killers] = {name = player:getName()}
	            killers = killers+1
	        end
	    end
	    if #killersArray > 0 then
		    local luckyNumber = math.random(1,#killersArray)
		    local luckyKiller = Player(killersArray[luckyNumber].name)

			if creature:getId() == luckyKiller:getId() or luckyKiller:getId() == lasthitkiller:getId() then
				return true
			end
			if creature:getIp() == luckyKiller:getIp() then
				luckyKiller:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You can't get reward for killing player from the same IP.")
				return true
			end
			if luckyKiller:getStorageValue(9500) ~= 1 then
				luckyKiller:addItem(2151, 1)
			end
		end
	end
end