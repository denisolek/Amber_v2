function onKill(creature, target)
	local outfit = creature:getOutfit()
	if(target:isPlayer()) then
		if creature:getIp() == target:getIp() then
			return true
		end
		if creature:getStorageValue(9500) == 1 then
       		return true
    	end
    	if(creature:getId() == target:getId()) then
        	return true
    	end
		if(outfit.lookType == 155 or outfit.lookType == 151) then
			if(outfit.lookAddons == 3) then
				creature:addItem(2160, 3, false, 1, CONST_SLOT_WHEREEVER)
			elseif(outfit.lookAddons == 2 or outfit.lookAddons == 1) then
				creature:addItem(2160, 1, false, 1, CONST_SLOT_WHEREEVER)
			end
		end
	end
end