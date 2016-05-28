function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 10758 then
		target:transform(8786)
		target:decay()
		player:addItem(12503, 1)
		toPosition:sendMagicEffect(4)
		local rand = math.random(1,100)
		if rand <= 25 then
			item:remove(1)
			player:getPosition():sendMagicEffect(3)
			player:sendTextMessage(MESSAGE_STATUS_WARNING, 'Lujack Axe has been broken.')
		end
		return true
	end
	return destroyItem(player, target, toPosition)
end
