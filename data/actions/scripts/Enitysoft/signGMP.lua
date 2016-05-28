function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemID = 7590
	local itemCount = 100
	local itemPrice = 30
	local itemType = ItemType(itemID)
	local itemWeight = itemType:getWeight(itemCount)

	if player:getFreeCapacity() < itemWeight then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You don't have enough cap.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return true
	else
		if player:getMoney() >= itemPrice * itemCount then
			player:removeMoney(itemPrice * itemCount)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You bought 100 GMP.")
			player:addItem(itemID, itemCount)
			doSendMagicEffect(getCreaturePosition(player), 15)
		else
			player:sendTextMessage(MESSAGE_STATUS_WARNING, "You need "..itemPrice * itemCount.."gp to buy "..itemCount.." great mana potions !")
		end
	end
	return true
end