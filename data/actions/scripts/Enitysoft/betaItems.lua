local famaleOutfits = {
	{outfitID=136, storageID=10014},
	{outfitID=137, storageID=10026},
	{outfitID=138, storageID=10022},
	{outfitID=139, storageID=10018},
	{outfitID=140, storageID=10030},
	{outfitID=141, storageID=10038},
	{outfitID=142, storageID=10034},
	{outfitID=147, storageID=10070},
	{outfitID=148, storageID=10066},
	{outfitID=149, storageID=10074},
	{outfitID=150, storageID=10054},
	{outfitID=155, storageID=10042},
	{outfitID=156, storageID=10050},
	{outfitID=157, storageID=10062},
	{outfitID=158, storageID=10046},
	{outfitID=252, storageID=10058}
}

local maleOutfits = {
	{outfitID=128, storageID=10014},
	{outfitID=129, storageID=10026},
	{outfitID=130, storageID=10022},
	{outfitID=131, storageID=10018},
	{outfitID=132, storageID=10030},
	{outfitID=133, storageID=10038},
	{outfitID=134, storageID=10034},
	{outfitID=143, storageID=10070},
	{outfitID=144, storageID=10066},
	{outfitID=145, storageID=10074},
	{outfitID=146, storageID=10054},
	{outfitID=151, storageID=10042},
	{outfitID=152, storageID=10050},
	{outfitID=153, storageID=10062},
	{outfitID=154, storageID=10046},
	{outfitID=251, storageID=10058}
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getActionId() == 30102 then
		local talonID = 12466
		local talonCount = 10
		local talonType = ItemType(talonID)
		local talonWeight = talonType:getWeight(talonCount)

		if player:getFreeCapacity() < talonWeight then
			player:sendTextMessage(MESSAGE_STATUS_WARNING, "You don't have enough cap.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			return true
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You found 10 experience talons.")
			player:addItem(talonID, talonCount, false)
			doSendMagicEffect(getCreaturePosition(player), 15)
		end
		return true
	elseif item:getActionId() == 30103 then
		if player:getStorageValue(299555) == -1 then
			if player:getSex() == 0 then
				for _, v in ipairs(famaleOutfits) do
					player:addOutfitAddon(v.outfitID, 3)
					player:setStorageValue(v.storageID, 1)
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Now you have all AMBER outfits!")
				doSendMagicEffect(getCreaturePosition(player), 32)
				doSendMagicEffect(getCreaturePosition(player), 37)
				player:setStorageValue(299555, 1)
			elseif player:getSex() == 1 then
				for _, v in ipairs(maleOutfits) do
					player:addOutfitAddon(v.outfitID, 3)
					player:setStorageValue(v.storageID, 1)
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Now you have all AMBER outfits!")
				doSendMagicEffect(getCreaturePosition(player), 32)
				doSendMagicEffect(getCreaturePosition(player), 37)
				player:setStorageValue(299555, 1)
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_WARNING, "You already have all AMBER outfits!")
		end
	elseif item:getActionId() == 30104 then
		local crystalID = 2160
		local crystalCount = 50
		local crystalType = ItemType(crystalID)
		local crystalWeight = crystalType:getWeight(crystalCount)

		if player:getFreeCapacity() < crystalWeight then
			player:sendTextMessage(MESSAGE_STATUS_WARNING, "You don't have enough cap.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			return true
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You found 50 crystal coins.")
			player:addItem(crystalID, crystalCount, false)
			doSendMagicEffect(getCreaturePosition(player), 15)
		end
		return true
	end
	return true
end