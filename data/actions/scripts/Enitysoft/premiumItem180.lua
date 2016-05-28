function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addPremiumDays(180)
	player:setStorageValue(9801, player:getPremiumDays()+180)
	item:remove(1)
	player:save()
	player:getPosition():sendMagicEffect(29)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "180 days of premium has been added to your account. Please relog to recieve all bonuses.")
	return true
end