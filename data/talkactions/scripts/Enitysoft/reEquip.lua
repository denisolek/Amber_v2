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
            exhaustion = 300001, -- exhaust storage
            duration = 10 -- counted in seconds for example 5*60 for 5 minutes.
        }

function onSay(player, words, param)
	if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end 
	local itemCheck = 0
	local vocation = player:getVocation():getId()
	if player:getSlotItem(CONST_SLOT_HEAD) == nil then
		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
			itemCheck = 1
			player:addItem(2662, 1, true, 1, CONST_SLOT_HEAD)-- start mage hat
		elseif vocation == 3 or vocation == 7 then
			itemCheck = 1
			player:addItem(2457, 1, true, 1, CONST_SLOT_HEAD)-- start paladin helmet
		elseif vocation == 4 or vocation == 8 then
			itemCheck = 1
			player:addItem(7461, 1, true, 1, CONST_SLOT_HEAD)-- start knight helmet
		end
	end
	if player:getSlotItem(CONST_SLOT_NECKLACE) == nil then
		itemCheck = 1
		player:addItem(2661, 1, true, 1, CONST_SLOT_NECKLACE)-- scarf
	end
	if player:getSlotItem(CONST_SLOT_ARMOR) == nil then
		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
			itemCheck = 1
			player:addItem(2654, 1, true, 1, CONST_SLOT_ARMOR)-- start mage cape
		elseif vocation == 3 or vocation == 7 then
			itemCheck = 1
			player:addItem(2463, 1, true, 1, CONST_SLOT_ARMOR)-- start paladin armor
		elseif vocation == 4 or vocation == 8 then
			itemCheck = 1
			player:addItem(2486, 1, true, 1, CONST_SLOT_ARMOR)-- start knight armor
		end
	end
	if player:getSlotItem(CONST_SLOT_RIGHT) == nil then
		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 or vocation == 4 or vocation == 8 then
			itemCheck = 1
			player:addItem(2516, 1, true, 1, CONST_SLOT_RIGHT)-- start shield
		end
	end
	if player:getSlotItem(CONST_SLOT_LEFT) == nil then
		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
			itemCheck = 1
			player:addItem(2433, 1, true, 1, CONST_SLOT_LEFT)-- start mage staff
		elseif vocation == 3 or vocation == 7 then
			itemCheck = 1
			player:addItem(2455, 1, true, 1, CONST_SLOT_LEFT)-- start crossbow
		elseif vocation == 4 or vocation == 8 then
			itemCheck = 1
			player:addItem(7449, 1, true, 1, CONST_SLOT_LEFT)-- start sword
		end
	end
	if player:getSlotItem(CONST_SLOT_LEGS) == nil then
		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
			itemCheck = 1
			player:addItem(2649, 1, true, 1, CONST_SLOT_LEGS)-- start mage legs
		elseif vocation == 3 or vocation == 7 then
			itemCheck = 1
			player:addItem(2648, 1, true, 1, CONST_SLOT_LEGS)-- start paladin legs
		elseif vocation == 4 or vocation == 8 then
			itemCheck = 1
			player:addItem(2478, 1, true, 1, CONST_SLOT_LEGS)-- start knight legs
		end
	end
	if player:getSlotItem(CONST_SLOT_FEET) == nil then
		itemCheck = 1
		player:addItem(2643, 1, true, 1, CONST_SLOT_FEET)-- start boots
	end
	if player:getSlotItem(CONST_SLOT_AMMO) == nil then
		if vocation == 3 or vocation == 7 then
			itemCheck = 1
			player:addItem(2543, 100, true, 1, CONST_SLOT_AMMO)-- start bolts
		end
	end
	if player:getSlotItem(CONST_SLOT_BACKPACK) == nil then
    if not getTilePzInfo(getPlayerPosition(player)) then
    	if itemCheck == 1 then
    		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your equipment has been refilled (except backpack - it can be done only in PZ).")
    		player:getPosition():sendMagicEffect(35)
    	else
    		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your equipment is already complete (backpack can be refilled only in PZ).")
    	end
    	player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return false
    end
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
	if itemCheck == 1 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your equipment has been refilled.")
		player:getPosition():sendMagicEffect(35)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your equipment is already complete.")
	end
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false		
end