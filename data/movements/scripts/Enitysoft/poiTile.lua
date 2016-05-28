function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() then
		if item:getActionId() == 20303 and creature:getStorageValue(9700) == -1 then
			creature:setStorageValue(9700, 1)
		elseif item:getActionId() == 20304 and creature:getStorageValue(9700) == 1 then
			creature:setStorageValue(9700, -1)
		elseif item:getActionId() == 20306 and creature:getStorageValue(9702) == 1 then
			creature:setStorageValue(9702, -1)
		end
	end
end