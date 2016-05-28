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
            duration = 5 -- counted in seconds for example 5*60 for 5 minutes.
        }
function onSay(player, words, param)   
	if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end  
	local cost = 2000000
	local promotion = player:getVocation():getPromotion()
	if player:getStorageValue(STORAGEVALUE_PROMOTION) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You are already promoted!")
	elseif not player:removeMoney(cost) then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You do not have enough money!")
	else
		if player:getVocation():getId() == 1 then
			player:setVocation(5)
		elseif player:getVocation():getId() == 2 then
			player:setVocation(6)
		elseif player:getVocation():getId() == 3 then
			player:setVocation(7)
		elseif player:getVocation():getId() == 4 then
			player:setVocation(8)
		end
		player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		-- Enitysoft
		player:addOutfit(140)
		player:addOutfit(132)
		if player:getVocation():getId() == 3 or player:getVocation():getId() == 4 or player:getVocation():getId() == 7 or player:getVocation():getId() == 8 then
			player:addOutfit(142)
			player:addOutfit(134)
			player:setStorageValue(10031, 1)
		elseif player:getVocation():getId() == 1 or player:getVocation():getId() == 2 or player:getVocation():getId() == 5 or player:getVocation():getId() == 6 then
			player:addOutfit(141)
			player:addOutfit(133)
			player:setStorageValue(10035, 1)
		end
		player:setStorageValue(10027, 1)			
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "Congratulations! Check out your new outfits.")
	end
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false
end