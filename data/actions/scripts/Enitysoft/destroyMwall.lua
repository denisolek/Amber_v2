function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 1497 then
		toPosition:sendMagicEffect(CONST_ME_POFF)
		target:remove()
		return true
	end
	return destroyItem(player, target, toPosition)
end