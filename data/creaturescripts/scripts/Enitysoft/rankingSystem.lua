local diffValues = {
        positiveDiff = {
            [300] = {winner = 25, loser = 30},
            [600] = {winner = 30, loser = 35},
            [900] = {winner = 35, loser = 40},
            [1200] = {winner = 40, loser = 45},
            [1500] = {winner = 45, loser = 50},
            ['max'] = {winner = 50, loser = 55}            
        },
        negativeDiff = {
            [300] = {winner = 25, loser = 30},
            [600] = {winner = 20, loser = 25},
            [900] = {winner = 15, loser = 20},
            [1200] = {winner = 10, loser = 15},
            [1500] = {winner = 5, loser = 10},
            ['max'] = {winner = 0, loser = 0}   
        },
        sharePercentTotal = {
        	[2] = 94,
        	[3] = 84,
        	[4] = 70,
        	['max'] = 52 
    	},
    	sharePercentPlayer = {
    		['min'] = 0,
    		[600] = 20,
    		[900] = 40,
    		[1200] = 60,
    		[1500] = 80,
    		['max'] = 100
    	}
}

function sharePercentPlayerDiff(value)
    local finalValue = 0
    if value <= 300 then
        finalValue = 'min'
    elseif value > 300 and value <= 600 then
        finalValue = 600
    elseif value > 600 and value <= 900 then
        finalValue = 900
    elseif value > 900 and value <= 1200 then
        finalValue = 1200
    elseif value > 1200 and value <= 1500 then
        finalValue = 1500
    else
        finalValue = 'max'
    end	
    return diffValues.sharePercentPlayer[finalValue]
end

function checkDiff(type, value)
    local finalValue = 0
    if value <= 300 then
        finalValue = 300
    elseif value > 300 and value <= 600 then
        finalValue = 600
    elseif value > 600 and value <= 900 then
        finalValue = 900
    elseif value > 900 and value <= 1200 then
        finalValue = 1200
    elseif value > 1200 and value <= 1500 then
        finalValue = 1500
    else
        finalValue = 'max'
    end

    if type == 'positive' then
        return diffValues.positiveDiff[finalValue].winner, diffValues.positiveDiff[finalValue].loser
    elseif type == 'negative' then
        return diffValues.negativeDiff[finalValue].winner, diffValues.negativeDiff[finalValue].loser
    end
    return true
end

function sharePercentDiff(killersCount)
	if killersCount < 5 then
		return diffValues.sharePercentTotal[killersCount]
	else
		return diffValues.sharePercentTotal['max']
	end
	return true
end

function changeSkull(currRank)
    local skullType
    if currRank <= 1750 then
        skullType = SKULL_GREEN
    elseif currRank > 1750 and currRank <= 3500 then
        skullType = SKULL_WHITE
    elseif currRank > 3500 and currRank <= 5250 then
        skullType = SKULL_YELLOW
    elseif currRank > 5250 and currRank <= 7000 then
        skullType = SKULL_RED
    else
        skullType = SKULL_BLACK
    end    
    return skullType
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local rankSystem = {
        rankStorage = 9000,
        deathRank = creature:getStorageValue(9000),
        considerAttackers = {},
        manyKillers = {},
        killerPoints = {}
    }


    if creature:isMonster() then
        return true
    end
    -- totalDMG counter
    local totalDMG = 0
    for id, damage in pairs(creature:getDamageMap()) do
        local player = Player(id)
        if player then
            if player:getStorageValue(9500) ~= 1 then 
                if not (player:getIp() == creature:getIp()) then
                    totalDMG = totalDMG + damage.total
                end
            end
        end
    end

    -- considerAttackers
    local considerAttackers = 1
    for id, damage in pairs(creature:getDamageMap()) do
        local player = Player(id)
        if player then
            if damage.total / totalDMG >= 0.1 then
                if player:getStorageValue(9500) ~= 1 then        
                    if not (player:getIp() == creature:getIp()) then
                        rankSystem.considerAttackers[considerAttackers] = {name = player:getName(), rank = player:getStorageValue(rankSystem.rankStorage), dmg = damage.total}
                        considerAttackers = considerAttackers+1
                    end
                end
            end
        end
    end

    -- print('====== considerAttackers ======')
    -- for i=1, #rankSystem.considerAttackers do
    --     print(i, rankSystem.considerAttackers[i].name, rankSystem.considerAttackers[i].rank, rankSystem.considerAttackers[i].dmg)
    -- end

    -- totalConsiderDmg, killers, avgRank
    local totalConsiderDmg = 0
    local killers = 0
    local avgRank = 0
    for i=1, #rankSystem.considerAttackers do
        totalConsiderDmg = totalConsiderDmg + rankSystem.considerAttackers[i].dmg
        killers = killers + 1
        avgRank = avgRank + rankSystem.considerAttackers[i].rank
    end
    avgRank = math.floor(avgRank / killers)
    
    -- print('totalConsiderDmg: ', totalConsiderDmg)
    -- print('killers: ', killers)
    -- print('avgRank: ', avgRank)
    -- SOLO KILL
    if killers == 1 then
        local diff, winner, loser
        local killer = Player(rankSystem.considerAttackers[1].name)
        diff = math.abs(rankSystem.considerAttackers[1].rank - rankSystem.deathRank)
        if rankSystem.deathRank >= rankSystem.considerAttackers[1].rank then
            winner, loser = checkDiff('positive', diff)
            killer:setStorageValue(rankSystem.rankStorage, killer:getStorageValue(rankSystem.rankStorage) + winner)
            killer:setSkull(changeSkull(killer:getStorageValue(rankSystem.rankStorage)))
            Game.sendAnimatedText('RANK: +'..winner, killer:getPosition(), TEXTCOLOR_LIGHTBLUE)
            creature:setStorageValue(rankSystem.rankStorage, creature:getStorageValue(rankSystem.rankStorage) - loser)
            Game.sendAnimatedText('RANK: -'..loser, creature:getPosition(), TEXTCOLOR_RED)
            creature:sendTextMessage(MESSAGE_STATUS_WARNING, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
            creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
        else
            winner, loser = checkDiff('negative', diff)
            killer:setStorageValue(rankSystem.rankStorage, killer:getStorageValue(rankSystem.rankStorage) + winner)
            killer:setSkull(changeSkull(killer:getStorageValue(rankSystem.rankStorage)))
            Game.sendAnimatedText('RANK: +'..winner, killer:getPosition(), TEXTCOLOR_LIGHTBLUE)
            creature:setStorageValue(rankSystem.rankStorage, creature:getStorageValue(rankSystem.rankStorage) - loser)
            Game.sendAnimatedText('RANK: -'..loser, creature:getPosition(), TEXTCOLOR_RED)
            creature:sendTextMessage(MESSAGE_STATUS_WARNING, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
            creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
        end
        return true
    end

    -- MULTI KILL
    if killers > 1 then
    	-- many killers
    	local diff, winner, loser, sharedDiff
    	diff = math.abs(avgRank - rankSystem.deathRank)

    	local manyKillers = 1
    	for i=1, #rankSystem.considerAttackers do
    		rankSystem.manyKillers[manyKillers] = {name = rankSystem.considerAttackers[i].name, rank = rankSystem.considerAttackers[i].rank, dmgPercent = rankSystem.considerAttackers[i].dmg / totalConsiderDmg, sharedPercent = ((rankSystem.considerAttackers[i].dmg / totalConsiderDmg)/killers)*100}
    		manyKillers = manyKillers + 1
    	end
    	
    	-- print('====== manyKillers ======')
	    -- for i=1, #rankSystem.manyKillers do
	    --     print(i, rankSystem.manyKillers[i].name, rankSystem.manyKillers[i].rank, rankSystem.manyKillers[i].dmgPercent, rankSystem.manyKillers[i].sharedPercent)
	    -- end

    	if rankSystem.deathRank >= avgRank then
    		winner, loser = checkDiff('positive', diff)
    		sharedDiff = (winner * sharePercentDiff(killers)) / 100
    		-- print('DIFF: ', diff, 'WINNER: ', winner, 'LOSER: ', loser, 'SHAREDDIFF: ', sharedDiff)
	    	-- wyliczenia punktów kazdej postaci
	    	local killerPoints = 1
	   	    for i=1, #rankSystem.manyKillers do
	   	    	local newPointsPercent = rankSystem.manyKillers[i].dmgPercent * 100
	   	    	local bonusPoints = 0
	   	    	local totalPoints = 0
	   	    	for j=1, #rankSystem.manyKillers do
	   	    		local sharedPercentValue = 0
	   	    		local sharePointsValue = 0
	   	    		if rankSystem.manyKillers[i].name ~=  rankSystem.manyKillers[j].name then
	   	    			if rankSystem.manyKillers[i].rank <= rankSystem.manyKillers[j].rank then
		   	    			sharedPercentValue = rankSystem.manyKillers[j].sharedPercent
		   	    			sharePointsValue = (sharePercentPlayerDiff(math.abs(rankSystem.manyKillers[i].rank - rankSystem.manyKillers[j].rank)) * sharedPercentValue)/100
		   	    			bonusPoints = bonusPoints + sharePointsValue
		   	    		else
		   	    			sharedPercentValue = rankSystem.manyKillers[i].sharedPercent
		   	    			sharePointsValue = (sharePercentPlayerDiff(math.abs(rankSystem.manyKillers[i].rank - rankSystem.manyKillers[j].rank)) * sharedPercentValue)/100
		   	    			newPointsPercent = newPointsPercent - sharePointsValue	   	    			
		   	    		end
	   	    		end
	   	    	end
	   	    	totalPoints = (newPointsPercent + bonusPoints)*sharedDiff/100
	   	    	rankSystem.killerPoints[killerPoints] = {name = rankSystem.manyKillers[i].name, points = totalPoints}
	   	    	local killer = Player(rankSystem.killerPoints[killerPoints].name)
	   	    	killer:setStorageValue(rankSystem.rankStorage, killer:getStorageValue(rankSystem.rankStorage) + rankSystem.killerPoints[killerPoints].points)
                killer:setSkull(changeSkull(killer:getStorageValue(rankSystem.rankStorage)))
            	Game.sendAnimatedText('RANK: +'..rankSystem.killerPoints[killerPoints].points, killer:getPosition(), TEXTCOLOR_LIGHTBLUE)
            	killerPoints = killerPoints + 1
		    end
            creature:setStorageValue(rankSystem.rankStorage, creature:getStorageValue(rankSystem.rankStorage) - loser)
            Game.sendAnimatedText('RANK: -'..loser, creature:getPosition(), TEXTCOLOR_RED)
            creature:sendTextMessage(MESSAGE_STATUS_WARNING, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
            creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')

	    	-- print('====== killerPoints ======')
		    -- for i=1, #rankSystem.killerPoints do
		    --     print(i, rankSystem.killerPoints[i].name, rankSystem.killerPoints[i].points)
		    -- end
    	else
    		winner, loser = checkDiff('negative', diff)
    		sharedDiff = (winner * sharePercentDiff(killers)) / 100
	    	-- wyliczenia punktów kazdej postaci
	    	local killerPoints = 1
	   	    for i=1, #rankSystem.manyKillers do
	   	    	local newPointsPercent = rankSystem.manyKillers[i].dmgPercent * 100
	   	    	local bonusPoints = 0
	   	    	local totalPoints = 0
	   	    	for j=1, #rankSystem.manyKillers do
	   	    		local sharedPercentValue = 0
	   	    		local sharePointsValue = 0
	   	    		if rankSystem.manyKillers[i].name ~=  rankSystem.manyKillers[j].name then
	   	    			if rankSystem.manyKillers[i].rank <= rankSystem.manyKillers[j].rank then
		   	    			sharedPercentValue = rankSystem.manyKillers[j].sharedPercent
		   	    			sharePointsValue = (sharePercentDiff(math.abs(rankSystem.manyKillers[i].rank - rankSystem.manyKillers[j].rank)) * sharedPercentValue)/100
		   	    			bonusPoints = bonusPoints + sharePointsValue
		   	    		else
		   	    			sharedPercentValue = rankSystem.manyKillers[i].sharedPercent
		   	    			sharePointsValue = (sharePercentDiff(math.abs(rankSystem.manyKillers[i].rank - rankSystem.manyKillers[j].rank)) * sharedPercentValue)/100
		   	    			newPointsPercent = newPointsPercent - sharePointsValue	   	    			
		   	    		end
	   	    		end
	   	    	end
	   	    	totalPoints = (newPointsPercent + bonusPoints)*sharedDiff/100
	   	    	rankSystem.killerPoints[killerPoints] = {name = rankSystem.manyKillers[i].name, points = totalPoints}
	   	    	local killer = Player(rankSystem.killerPoints[killerPoints].name)
	   	    	killer:setStorageValue(rankSystem.rankStorage, killer:getStorageValue(rankSystem.rankStorage) + rankSystem.killerPoints[killerPoints].points)
                killer:setSkull(changeSkull(killer:getStorageValue(rankSystem.rankStorage)))
            	Game.sendAnimatedText('RANK: +'..rankSystem.killerPoints[killerPoints].points, killer:getPosition(), TEXTCOLOR_LIGHTBLUE)
            	killerPoints = killerPoints + 1
		    end
            creature:setStorageValue(rankSystem.rankStorage, creature:getStorageValue(rankSystem.rankStorage) - loser)
            Game.sendAnimatedText('RANK: -'..loser, creature:getPosition(), TEXTCOLOR_RED)
            creature:sendTextMessage(MESSAGE_STATUS_WARNING, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
            creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, 'You lost '..loser..' ranking points. Your ranking is now '..creature:getStorageValue(rankSystem.rankStorage)..' points.')
	    	-- print('====== killerPoints ======')
		    -- for i=1, #rankSystem.killerPoints do
		    --     print(i, rankSystem.killerPoints[i].name, rankSystem.killerPoints[i].points)
		    -- end
    	end
    end

    return true
end