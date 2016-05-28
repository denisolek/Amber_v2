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
local currentRaid = {
	[0] = {text = "There is no raid at this moment."},
	[1] = {text = "Current raid: BETHIA"},
	[2] = {text = "Current raid: ABERLEE"},
	[3] = {text = "Current raid: BESHATA"},
	[4] = {text = "Current raid: HELLSCREAM"},
	[5] = {text = "Current raid: GHANDAUR"},
	[6] = {text = "Current raid: YFRG"},
	[7] = {text = "Current raid: SAHUAN"},
	[8] = {text = "Current raid: SELLAH"},
	[9] = {text = "Current raid: ERATHAL"},
	[10] = {text = "Current raid: THALL"},
	[11] = {text = "Current raid: SHEON"},
	[12] = {text = "Current raid: ARCHEMONT"},
	[13] = {text = "Current raid: RAHIN"},
	[14] = {text = "Current raid: APOLLYON"},
	[15] = {text = "Current raid: BHALE"}
}
function onSay(player, words, param) 
	if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end 
    local bossNumber = getGlobalStorageValue(50000)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, currentRaid[bossNumber].text)
    player:setStorageValue(config.exhaustion, os.time() + config.duration)
return false
end