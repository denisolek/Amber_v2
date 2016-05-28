function onSay(player, words, param)    
	
	if not player:getGroup():getAccess() then
		return true
	end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Storage [' .. param .. '] : ' .. player:getStorageValue(param))
end