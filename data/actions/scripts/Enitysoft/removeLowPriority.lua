function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(9500) == 1 then
		player:setStorageValue(9500, -1)
		item:remove(1)
		player:save()
		player:remove()
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are not in low priority rank.")
	end
end