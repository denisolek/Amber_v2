function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local potionStorage = 9800
	local duration = 36000
	
	if player:getStorageValue(potionStorage) == -1 then
		player:setStorageValue(potionStorage, os.time() + duration)
		item:remove(1)
		player:save()
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Infinity potions activated. Use '!potion' or '!p' to check time left.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Infinity potions are already activated")
	end	
	return true
end