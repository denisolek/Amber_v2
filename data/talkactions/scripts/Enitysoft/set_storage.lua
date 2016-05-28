function onSay(player, words, param)
	
	if not player:getGroup():getAccess() then
		return true
	end

    local split = param:split(",")  
    local storageID = split[1]
    local storageValue = split[2]
    
    player:setStorageValue(storageID, storageValue)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Storage [' .. storageID .. '] set to : ' .. storageValue)
end