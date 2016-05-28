local config = {
    [1] = {name = "DRUID", amount = 10, monster = "bethia", questlog = 7019},
    [2] = {name = "BARBARIAN", amount = 10, monster = "erathal", questlog = 7022},
    [3] = {name = "WIZARD", amount = 10, monster = "hellscream", questlog = 7025}
}
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    if not lasthitkiller:isPlayer() then
        lasthitkiller = lasthitkiller:getMaster()
    end

    local storage = 6005
    local startstorage = 6004
    local startvalue = 1
    local whichTask = lasthitkiller:getStorageValue(6006)

    if(creature:isMonster()) then
        for i = 1, 3, 1 do
            if(whichTask == i and getCreatureName(creature):lower() == config[i].monster) then   
                if ((lasthitkiller:getStorageValue(storage)+1) < config[i].amount and lasthitkiller:getStorageValue(startstorage) >= startvalue) then
                    lasthitkiller:setStorageValue(storage, lasthitkiller:getStorageValue(storage) + 1)
                    lasthitkiller:setStorageValue(config[i].questlog, lasthitkiller:getStorageValue(config[i].questlog)+1)
                    lasthitkiller:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '['..config[i].name..' TASK]:   '..(lasthitkiller:getStorageValue(storage) + 1)..'/'.. config[i].amount)
                end
                if (lasthitkiller:getStorageValue(storage)+1) == config[i].amount then
                    lasthitkiller:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '['..config[i].name..' TASK]:   '..(lasthitkiller:getStorageValue(storage) + 1)..'/'.. config[i].amount..' - DONE (visit npc '..config[i].name..' to get your reward)')
                end
            end
        end
    end
    return true
end