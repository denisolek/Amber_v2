function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local voucherStorage = 835
	local voucherTime = 836
	local duration = 36000
	
	if player:getStorageValue(voucherStorage) == -1 then
		player:setStorageValue(voucherTime, os.time() + duration)
		player:setStorageValue(voucherStorage, 1)
		item:remove(1)
		player:save()
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Training voucher activated. Use '!voucher' or '!v' to check time left.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Training voucher is already activated")
	end	
	return true
end