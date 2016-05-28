function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 4181 then
		target:remove()
		player:addItem(2791,1)
		toPosition:sendMagicEffect(4)
		local rand = math.random(1,100)
		if rand <= 3 then
			item:remove(1)
			player:getPosition():sendMagicEffect(3)
			player:sendTextMessage(MESSAGE_STATUS_WARNING, 'Mushroom Knife has been broken.')
		end
		return true
	end
	return destroyItem(player, target, toPosition)
end
