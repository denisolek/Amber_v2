function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 2782 then
		target:transform(2781)
		target:decay()
		return true
	end
	-- ENITYSOFT
	if target.itemid == 1499 then
		toPosition:sendMagicEffect(CONST_ME_POFF)
		target:remove()
		return true
	end
	-----------
	return destroyItem(player, target, toPosition)
end
