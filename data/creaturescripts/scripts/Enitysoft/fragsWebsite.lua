function onKill(creature, target)
    -- and (creature:getIp() ~= target:getIp())
    if not target:isPlayer() then
    	return true
    end

    if(creature:getId() == target:getId()) then
        return true
    end

    if(target:isPlayer() and creature:isPlayer()) then
        if (creature:getIp() == target:getIp()) then
            return true
        end
        if creature:getStorageValue(9500) ~= 1 then
           creature:setStorageValue(11000, creature:getStorageValue(11000)+1)
        end
    end
    return true
end