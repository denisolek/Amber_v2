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

	local housePrice = configManager.getNumber(configKeys.HOUSE_PRICE)
	if housePrice == -1 then
		player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return true
	end

	if not player:isPremium() then
		player:sendCancelMessage("You need a premium account.")
		player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return false
	end

	local position = player:getPosition()
	position:getNextPosition(player:getDirection())

	local tile = Tile(position)
	local house = tile and tile:getHouse()
	if house == nil then
		player:sendCancelMessage("You have to be looking at the door of the house you would like to buy.")
		player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return false
	end

	if house:getOwnerGuid() > 0 then
		player:sendCancelMessage("This house already has an owner.")
		player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return false
	end

	if player:getHouse() then
		player:sendCancelMessage("You are already the owner of a house.")
		player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return false
	end

	local price = house:getTileCount() * housePrice
	if not player:removeMoney(price) then
		player:sendCancelMessage("You do not have enough money.")
		player:setStorageValue(config.exhaustion, os.time() + config.duration)
		return false
	end

	house:setOwnerGuid(player:getGuid())
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You have successfully bought this house, be sure to have the money for the rent in the bank.")
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false
end
