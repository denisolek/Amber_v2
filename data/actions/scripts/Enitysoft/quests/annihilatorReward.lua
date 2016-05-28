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

local configAniReward = {
    exTime = 11*60*60, -- time in seconds
    exStorage = 8000,
    chests = {
         [30000] = {
             {itemid = 8877, count = 1}
         },
         [30001] = {
             {itemid = 3968, count = 1}
         },
         [30002] = {
             {itemid = 8892, count = 1}
        }
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)
    local player = Player(cid)
    if player:getStorageValue(configAniReward.exStorage) > os.time() then
        doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) 
        player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty. You need to wait ".. string.diff(player:getStorageValue(configAniReward.exStorage) - os.time()) .." before you can get a reward again.")             
        return true
    end
    local x = configAniReward.chests[item:getUniqueId()]
    local itemx = Game.createItem(x[1].itemid, x[1].count)
    if player:addItemEx(itemx) ~= RETURNVALUE_NOERROR then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        text = "You have found a reward weighing " .. itemx:getWeight()/100 .. " oz. It is too heavy or you have not enough space."
    else
        text = "You have received your reward."
        player:setStorageValue(configAniReward.exStorage, os.time() + configAniReward.exTime)
    end
    player:sendTextMessage(MESSAGE_INFO_DESCR, text)        
    return true
end