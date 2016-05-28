dofile("war_config.lua")
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
local config = {
            exhaustion = 300002, -- exhaust storage
            duration = 20 -- counted in seconds for example 5*60 for 5 minutes.
        }

function onSay(player, words, param) 
	if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end 
    function doScanContainer(item, tables, count)
        if isContainer(item.uid) then
            for i = 0, getContainerSize(item.uid) do
                local item = getContainerItem(item.uid, i)
                if isContainer(item.uid) then
                    doScanContainer(item, tables)
                end
                table.insert(count, item.type)
                table.insert(tables, item.itemid)
            end
        end
    end
    local vocation = player:getVocation():getId()
    if not getTilePzInfo(getPlayerPosition(player)) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You can deposit your backpack only in protection zone.")
        player:setStorageValue(config.exhaustion, os.time() + config.duration)
        return false
    end
    local bp = player:getSlotItem(CONST_SLOT_BACKPACK)

    local items = {}
    local counts = {}
    doScanContainer(bp, items, counts)

    local depotChest = player:getDepotChest(1, true)
    if depotChest:getItemCountById(bp:getId()) >= 3 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Maximum count of deposited backpacks reached (max 3) - clean your depot.")
        player:setStorageValue(config.exhaustion, os.time() + config.duration)
        return false
    end

    local newBp = depotChest:addItem(bp:getId(), 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
    if newBp then
        for i=1, #items do
            local tmpItem = ItemType(items[i])
            if counts[i] == 0 then
                newBp:addItem(items[i], 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
            else
                newBp:addItem(items[i], counts[i], INDEX_WHEREEVER, FLAG_NOLIMIT)
            end
        end
    end
    bp:remove(1)
    if player:getSlotItem(CONST_SLOT_BACKPACK) == nil then
        for _, v in ipairs(commonItems) do
            itemCheck = 1
            player:addItem(v.itemid, v.count or 1)
        end
        if vocation <= 4 then
            local giveBackpackItems = backpackItems[vocation]
            if giveBackpackItems ~= nil then
                for _, v in ipairs(giveBackpackItems) do
                    itemCheck = 1
                    player:addItem(v.itemid, v.count or 1)
                end
            end
        elseif vocation >= 5 then
            local promoVoc = vocation-4
            local giveBackpackItems = backpackItems[promoVoc]
            if giveBackpackItems ~= nil then
                for _, v in ipairs(giveBackpackItems) do
                    itemCheck = 1
                    player:addItem(v.itemid, v.count or 1)
                end
            end
        end
    end
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Your backpack has been send to depot.")
return false
end