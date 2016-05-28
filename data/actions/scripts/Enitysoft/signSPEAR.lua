function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemID = 2425
	local itemCount = 1
	local itemPrice = 50000
	local itemType = ItemType(itemID)
	local itemWeight = itemType:getWeight(itemCount)

	if player:getFreeCapacity() < itemWeight then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You don't have enough cap.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return true
	else
		if player:getMoney() >= itemPrice * itemCount then
			player:removeMoney(itemPrice * itemCount)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You bought 30 min time spear.")
			player:addItem(itemID, itemCount)
			doSendMagicEffect(getCreaturePosition(player), 15)
		else
			player:sendTextMessage(MESSAGE_STATUS_WARNING, "You need "..itemPrice * itemCount.."gp to buy 30 min time spears !")
		end
	end
	return true
end