function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() then
		if item:getActionId() == 30400 and creature:getStorageValue(9600) == -1 then
			creature:setStorageValue(9600, 1)
		elseif item:getActionId() == 30401 and creature:getStorageValue(9600) == 1 then
			creature:setStorageValue(9600, -1)
		elseif item:getActionId() == 30402 and creature:getStorageValue(9601) == -1 then
			creature:setStorageValue(9601, 1)
		elseif item:getActionId() == 30403 and creature:getStorageValue(9601) == 1 then
			creature:setStorageValue(9601, -1)
		end
	end
end