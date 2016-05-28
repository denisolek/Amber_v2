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
function onSay(cid, words, param, channel)
    local player = Player(cid)
    if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end 
    local t, k = {}, getPlayerLevel(cid)
    for i = 0, getPlayerInstantSpellCount(cid) - 1 do
        local spell = getPlayerInstantSpellInfo(cid, i)
        if(spell.level ~= 0 and k >= spell.level) then
            if(spell.manapercent > 0) then
                spell.mana = spell.manapercent .. "%"
            end

            table.insert(t, spell)
        end
    end

    table.sort(t, function(a, b) return a.level < b.level end)
    local text, prevLevel = "", -1
    for i, spell in ipairs(t) do
        local line = ""
        if(prevLevel ~= spell.level) then
            if(i ~= 1) then
                line = "\n"
            end

            line = line .. "Spells for Level " .. spell.level .. "\n"
            prevLevel = spell.level
        end

        text = text .. line .. "  " .. spell.words .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
    end

    doShowTextDialog(cid, 2175, text)
    player:setStorageValue(config.exhaustion, os.time() + config.duration)
    return true
end