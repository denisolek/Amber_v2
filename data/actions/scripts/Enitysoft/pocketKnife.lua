function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 10758 then
		target:transform(8786)
		target:decay()
		player:addItem(12503, 1)
		toPosition:sendMagicEffect(4)
		return true
	end
	if target.itemid == 4181 then
		target:remove()
		player:addItem(2791,1)
		toPosition:sendMagicEffect(4)
		return true
	end
	return destroyItem(player, target, toPosition)
end
