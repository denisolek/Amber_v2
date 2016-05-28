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
	local hasAccess = player:getGroup():getAccess()
	local players = Game.getPlayers()
	local playerCount = Game.getPlayerCount()

	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, playerCount .. " players online.")

	if hasAccess then
		local i = 0
		local msg = ""
		for k, targetPlayer in ipairs(players) do
			if hasAccess or not targetPlayer:isInGhostMode() then
				if i > 0 then
					msg = msg .. ", "
				end
				msg = msg .. targetPlayer:getName() .. " [" .. targetPlayer:getLevel() .. "]"
				i = i + 1
			end

			if i == 10 then
				if k == playerCount then
					msg = msg .. "."
				else
					msg = msg .. ","
				end
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
				msg = ""
				i = 0
			end
		end

		if i > 0 then
			msg = msg .. "."
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
		end
	end
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false
end
