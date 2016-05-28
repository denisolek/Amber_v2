local config = {
    [1] = {name = "PIRATE", amount = 2500, questlog  = 7001},
    [2] = {name = "SHAMAN", amount = 2500, questlog  = 7004},
    [3] = {name = "ASSASSIN", amount = 2500, questlog  = 7007},
    [4] = {name = "ORIENTAL", amount = 1000, questlog  = 7010},
    [5] = {name = "NORSEMAN", amount = 1000, questlog  = 7013},
    [6] = {name = "BEGGAR", amount = 1000, questlog  = 7016}
}
function onKill(creature, target)

    if(creature:getId() == target:getId()) then
        return true
    end

    if (creature:getStorageValue(9500) == 1) then
        return true
    end

    local storage = 6002
    local startstorage = 6001
    local startvalue = 1
    local whichTask = creature:getStorageValue(6003)

    if(target:isPlayer()) then
        if (creature:getIp() == target:getIp()) then
            return true
        end
        for i = 1, 6, 1 do
            if(whichTask == i) then   
                if ((creature:getStorageValue(storage)+1) < config[i].amount and creature:getStorageValue(startstorage) >= startvalue) then
                    creature:setStorageValue(storage, creature:getStorageValue(storage) + 1)
                    creature:setStorageValue(config[i].questlog, creature:getStorageValue(config[i].questlog)+1)
                    creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '['..config[i].name..' TASK]:   '..(creature:getStorageValue(storage) + 1)..'/'.. config[i].amount)
                end
                if (creature:getStorageValue(storage)+1) == config[i].amount then
                    creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '['..config[i].name..' TASK]:   '..(creature:getStorageValue(storage) + 1)..'/'.. config[i].amount..' - DONE (visit npc '..config[i].name..' to get your reward)')
                end
            end
        end
    end
    return true
end