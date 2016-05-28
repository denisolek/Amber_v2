function string.diff(self)  
    local format = {
        {'day', self / 60 / 60 / 24},
        {'hour', self / 60 / 60 % 24},
        {'minute', self / 60 % 60},
        {'second', self % 60}
    }

    local out = {}
    for k, t in ipairs(format) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    local ret = table.concat(out)
    if ret:len() < 16 and ret:find('second') then
        local a, b = ret:find(' and ')
        ret = ret:sub(b+1)
    end
    return ret
end

local configPOIReward = {
    exTime = 11*60*60, -- time in seconds
    chests = {
         [30010] = {
             {itemid = 2160, count = 10, exStorage = 9710}
         },
         [30011] = {
             {itemid = 2160, count = 10, exStorage = 9711}
         },
         [30012] = {
             {itemid = 2160, count = 10, exStorage = 9712}
         },
         [30013] = {
             {itemid = 2160, count = 10, exStorage = 9713}
         },
         [30014] = {
             {itemid = 2160, count = 10, exStorage = 9714}
         },
         [30015] = {
             {itemid = 2160, count = 10, exStorage = 9715}
         },
         [30016] = {
             {itemid = 2160, count = 10, exStorage = 9716}
         },
         [30017] = {
             {itemid = 2160, count = 90, exStorage = 9717}
         },
         [30018] = {
             {itemid = 6132, count = 1, exStorage = 9718}
         },
         [30019] = {
             {itemid = 8881, count = 1, exStorage = 9719}
         },
         [30020] = {
             {itemid = 7899, count = 1, exStorage = 9719}
         },
         [30021] = {
             {itemid = 8886, count = 1, exStorage = 9719}
         }
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)
    local player = Player(cid)
    local x = configPOIReward.chests[item:getUniqueId()]
    if player:getStorageValue(x[1].exStorage) > os.time() then
        doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) 
        player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty. You need to wait ".. string.diff(player:getStorageValue(x[1].exStorage) - os.time()) .." before you can get a reward again.")             
        return true
    end
    local itemx = Game.createItem(x[1].itemid, x[1].count)
    if player:addItemEx(itemx) ~= RETURNVALUE_NOERROR then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        text = "You have found a reward weighing " .. itemx:getWeight()/100 .. " oz. It is too heavy or you have not enough space."
    else
        text = "You have received your reward."
        player:setStorageValue(x[1].exStorage, os.time() + configPOIReward.exTime)
    end
    player:sendTextMessage(MESSAGE_INFO_DESCR, text)        
    return true
end