function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(10075) == 1 then
 		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You already have weeding outfit')
 		player:getPosition():sendMagicEffect(3)
	else
		player:setStorageValue(10075, 1)
		if player:getSex() == 0 then
			player:addOutfit(329)
		elseif player:getSex() == 1 then
			player:addOutfit(328)
		end
		player:getPosition():sendMagicEffect(36)
		player:save()
		item:remove(1)
		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'Congratulations!')
 	end
return true
end