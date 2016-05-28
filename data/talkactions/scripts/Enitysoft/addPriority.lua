function onSay(player, words, param)    
	
	if not player:getGroup():getAccess() then
		return true
	end
	local target = Player(param)
	if target:getStorageValue(9500) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, target:getName()..' juz jest w low priority.')
	else
		target:setStorageValue(9000, 2500)
		target:setStorageValue(9500, 1)
		target:save()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, target:getName()..' dodany do LOW PRIORITY.')
		target:remove()
	end
end