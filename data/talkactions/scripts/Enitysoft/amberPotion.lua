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
    if player:getStorageValue(9800) < 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Infinity potions disabled.")
    else
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Infinity potions active for: " .. string.diff(player:getStorageValue(9800) - os.time()))
    end
	player:setStorageValue(config.exhaustion, os.time() + config.duration)	
return false
end