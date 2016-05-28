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

function onSay(cid, words, param)
	local player = Player(cid)
	if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end  
	local tpPos = {
		tpOne = {
			{150, 142, 7},{151, 142, 7},{152, 142, 7},{153, 142, 7},{154, 142, 7},{155, 142, 7},{156, 142, 7},{150, 143, 7},{151, 143, 7},{152, 143, 7},{153, 143, 7},{154, 143, 7},{155, 143, 7},{156, 143, 7},{150, 144, 7},{151, 144, 7},{152, 144, 7},{153, 144, 7},{154, 144, 7},{155, 144, 7},{156, 144, 7},{150, 145, 7},{151, 145, 7},{152, 145, 7},{153, 145, 7},{154, 145, 7},{155, 145, 7},{156, 145, 7},{150, 146, 7},{151, 146, 7},{152, 146, 7},{153, 146, 7},{154, 146, 7},{155, 146, 7},{156, 146, 7}
		},
		tpTwo = {
			{131, 60, 7},{131, 60, 7},{132, 60, 7},{133, 60, 7},{134, 60, 7},{135, 60, 7},{136, 60, 7},{137, 60, 7},{131, 61, 7},{131, 61, 7},{132, 61, 7},{133, 61, 7},{134, 61, 7},{135, 61, 7},{136, 61, 7},{137, 61, 7},{131, 62, 7},{131, 62, 7},{132, 62, 7},{133, 62, 7},{134, 62, 7},{136, 62, 7},{137, 62, 7},{131, 63, 7},{131, 63, 7},{132, 63, 7},{133, 63, 7},{134, 63, 7},{135, 63, 7},{136, 63, 7},{137, 63, 7},{131, 64, 7},{131, 64, 7},{132, 64, 7},{133, 64, 7},{134, 64, 7},{135, 64, 7},{136, 64, 7},{137, 64, 7},{131, 65, 7},{131, 65, 7},{132, 65, 7},{133, 65, 7},{134, 65, 7},{135, 65, 7},{136, 65, 7},{137, 65, 7}
		},
		tpThree = {
		    {76, 101, 7},{77, 101, 7},{78, 101, 7},{79, 101, 7},{80, 101, 7},{76, 102, 7},{77, 102, 7},{78, 102, 7},{79, 102, 7},{80, 102, 7},{76, 103, 7},{77, 103, 7},{78, 103, 7},{79, 103, 7},{80, 103, 7},{76, 104, 7},{77, 104, 7},{79, 104, 7},{80, 104, 7},{76, 105, 7},{77, 105, 7},{78, 105, 7},{79, 105, 7},{80, 105, 7}
		},
	  	tpFour = {
	  		{72, 194, 7},{73, 194, 7},{74, 194, 7},{75, 194, 7},{76, 194, 7},{77, 194, 7},{78, 194, 7},{72, 195, 7},{73, 195, 7},{74, 195, 7},{75, 195, 7},{76, 195, 7},{77, 195, 7},{78, 195, 7},{72, 196, 7},{73, 196, 7},{74, 196, 7},{75, 196, 7},{76, 196, 7},{77, 196, 7},{78, 196, 7},{72, 197, 7},{73, 197, 7},{74, 197, 7},{75, 197, 7},{76, 197, 7},{77, 197, 7},{78, 197, 7},{72, 198, 7},{73, 198, 7},{74, 198, 7},{75, 198, 7},{76, 198, 7},{77, 198, 7},{78, 198, 7}
		},
	    tpFive = {
	      	{183, 194, 7},{184, 194, 7},{185, 194, 7},{186, 194, 7},{187, 194, 7},{188, 194, 7},{189, 194, 7},{183, 195, 7},{184, 195, 7},{185, 195, 7},{186, 195, 7},{187, 195, 7},{188, 195, 7},{189, 194, 7},{183, 196, 7},{184, 196, 7},{185, 196, 7},{187, 196, 7},{188, 196, 7},{189, 196, 7},{183, 197, 7},{184, 197, 7},{185, 197, 7},{186, 197, 7},{187, 197, 7},{188, 197, 7},{189, 197, 7},{183, 198, 7},{184, 198, 7},{185, 198, 7},{186, 198, 7},{187, 198, 7},{188, 198, 7},{189, 198, 7}
		},
	  	tpSix = {
	     	{206, 113, 7},{207, 113, 7},{208, 113, 7},{209, 113, 7},{210, 113, 7},{211, 113, 7},{212, 113, 7},{213, 113, 7},{206, 114, 7},{207, 114, 7},{208, 114, 7},{209, 114, 7},{210, 114, 7},{211, 114, 7},{212, 114, 7},{213, 114, 7},{206, 115, 7},{207, 115, 7},{208, 115, 7},{209, 115, 7},{210, 115, 7},{211, 115, 7},{212, 115, 7},{213, 115, 7},{206, 116, 7},{207, 116, 7},{208, 116, 7},{209, 116, 7},{210, 116, 7},{211, 116, 7},{212, 116, 7},{213, 116, 7},
	    }
	 }

	 local function selectTemple(x)
		local temple
		if x == 1 then
			temple = math.random(1,#tpPos.tpOne)
			return tpPos.tpOne[temple][1], tpPos.tpOne[temple][2], tpPos.tpOne[temple][3]
		elseif x == 2 then
			temple = math.random(1,#tpPos.tpTwo)
			return tpPos.tpTwo[temple][1], tpPos.tpTwo[temple][2], tpPos.tpTwo[temple][3]
		elseif x == 3 then
			temple = math.random(1,#tpPos.tpThree)
			return tpPos.tpThree[temple][1], tpPos.tpThree[temple][2], tpPos.tpThree[temple][3]
		elseif x == 4 then
			temple = math.random(1,#tpPos.tpFour)
			return tpPos.tpFour[temple][1], tpPos.tpFour[temple][2], tpPos.tpFour[temple][3]
		elseif x == 5 then
			temple = math.random(1,#tpPos.tpFive)
			return tpPos.tpFive[temple][1], tpPos.tpFive[temple][2], tpPos.tpFive[temple][3]
		elseif x == 6 then
			temple = math.random(1,#tpPos.tpSix)
			return tpPos.tpSix[temple][1], tpPos.tpSix[temple][2], tpPos.tpSix[temple][3]	
		end
	end

	local possibleTemple = {
		[50] = {1},
		[100] = {1,2},
		[150] = {1,2,3},
		[200] = {1,2,3,4},
		[250] = {1,2,3,4,5},
		['max'] = {1,2,3,4,5,6}
	}
	
	local function onlineValue()
		local online = Game.getPlayerCount()
		if online <= 50 then
			return 50
		elseif online > 50 and online <=100 then
			return 100
		elseif online > 100 and online <=150 then
			return 150
		elseif online > 150 and online <=200 then
			return 200
		elseif online > 200 and online <=250 then
			return 250
		elseif online > 250 then
			return 'max'
		end
	end

	local function checkPossible(_liczba, _online)
		local check = false
	    for i=1, #possibleTemple[_online] do
	        if _liczba == possibleTemple[_online][i] then
	        	check = true
	        end
	    end
	    if check == true then
	    	return true
	    else
	    	return false
	    end
	end

	if param == "" then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must enter number of temple. (i.e. '!t 3')")
	doSendMagicEffect(getPlayerPosition(cid), 2)
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false
	end
	local liczba = tonumber(param)

	if not liczba or liczba < 1 or liczba > 6 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This temple id does not exist. ( !t 1-6 )")
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false
	end

	if(not getTileInfo(getCreaturePosition(cid)).protection) then
		local playerPos = player:getPosition()
		local tile = Tile(playerPos)
		local ground = tile:getGround()
		if ground then
			if ground:getActionId() ~= 30000 then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must be in protection zone to teleport.")
				player:setStorageValue(config.exhaustion, os.time() + config.duration)
				return false
			end
		end
	end

	local onlineCount = onlineValue()
	if not checkPossible(liczba, onlineCount) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Temple blocked - not enought players online.")
		return false
	end

	x,y,z = selectTemple(liczba)
	player:teleportTo(Position(x, y, z), false)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are teleported.")
	player:setDirection(DIRECTION_SOUTH)
	player:setStorageValue(config.exhaustion, os.time() + config.duration)
	return false
end