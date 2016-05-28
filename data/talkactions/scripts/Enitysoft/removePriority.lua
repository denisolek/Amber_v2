function onSay(player, words, param)    
	
	if not player:getGroup():getAccess() then
		return true
	end
	local target = Player(param)
	if target:getStorageValue(9500) == 1 then
		target:setStorageValue(9000, 3000)
		target:setStorageValue(9500, -1)
		target:save()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, target:getName()..' usuniety z LOW PRIORITY.')
		target:remove()
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, target:getName()..' nie jest w LOW PRIORITY.')
	end
end