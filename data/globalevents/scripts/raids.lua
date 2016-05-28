local bossRaids = {
	[1] = {raidStorage = 1, position = Position(44,188,9), monster = 'Bethia', itemID = 1546, pos1 = Position(66,161,10), pos2 = Position(66,162,10)},
	[2] = {raidStorage = 2, position = Position(31,126,7), monster = 'Aberlee', itemID = 1546, pos1 = Position(36,112,6)},
	[3] = {raidStorage = 3, position = Position(23,50,9), monster = 'Beshata', itemID = 1546, pos1 = Position(53,53,8), pos2 = Position(53,54,8)},
	[4] = {raidStorage = 4, position = Position(89,39,8), monster = 'Hellscream', itemID = 1547, pos1 = Position(93,37,7)},
	[5] = {raidStorage = 5, position = Position(121,68,11), monster = 'Ghandaur', itemID = 1461, pos1 = Position(131,79,9)},
	[6] = {raidStorage = 6, position = Position(147,12,5), monster = 'Yfrg', itemID = 1546, pos1 = Position(145,14,6)},
	[7] = {raidStorage = 7, position = Position(222,51,10), monster = 'Sahuan', itemID = 1546, pos1 = Position(217,69,8), pos2 = Position(217,70,8)},
	[8] = {raidStorage = 8, position = Position(245,126,7), monster = 'Sellah', itemID = 1546, pos1 = Position(229,107,7), pos2 = Position(229,108,7)},
	[9] = {raidStorage = 9, position = Position(39,155,4), monster = 'Erathal', itemID = 1547, pos1 = Position(43,164,6), pos2 = Position(42,164,6)},
	[10] = {raidStorage = 10, position = Position(62,204,10), monster = 'Thall', itemID = 1546, pos1 = Position(51,216,9)},
	[11] = {raidStorage = 11, position = Position(190,235,10), monster = 'Sheon', itemID = 1546, pos1 = Position(175,219,8), pos2 = Position(175,220,8)},
	[12] = {raidStorage = 12, position = Position(217,203,9), monster = 'Archemont', itemID = 1547, pos1 = Position(219,198,8)},
	[13] = {raidStorage = 13, position = Position(212,172,10), monster = 'Rahin', itemID = 1547, pos1 = Position(202,174,7), pos2 = Position(203,174,7)},
	[14] = {raidStorage = 14, position = Position(163,108,5), monster = 'Apollyon', itemID = 1547, pos1 = Position(163,117,6), pos2 = Position(164,117,6)},
	[15] = {raidStorage = 15, position = Position(238,150,10), monster = 'Bhale', itemID = 1547, pos1 = Position(230,132,8), pos2 = Position(231,132,8)}
}
local time = 1800000

function removeMonster(name)
	-- remove players
	local templePos = Position(153, 144, 7)
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		if targetPlayer:getStorageValue(9600) == 1 then
			targetPlayer:teleportTo(templePos)	
			targetPlayer:setStorageValue(9600, -1)
		end
	end
	---
	local creature = Creature(name)	
	if creature == nil or creature:isMonster() == nil then
	    return true
	end
	creature:remove()
end

function raidStarted(boss)

	selectBoss = boss
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, bossRaids[selectBoss].monster .. " has spawned ! You have 45 minutes to kill it.")		
	end

	if selectBoss == 2 or selectBoss == 4 or selectBoss == 5 or selectBoss == 6 or selectBoss == 10 or selectBoss == 12 then
		local itemPos = Tile(bossRaids[selectBoss].pos1):getItemById(bossRaids[selectBoss].itemID)
		if itemPos then
			itemPos:remove()
			local spectators = Game.getSpectators(bossRaids[selectBoss].pos1, false, true, 7, 7)
				for i = 1, #spectators do
				spectators[i]:say("Boss is here!", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], bossRaids[selectBoss].pos1)
				end
		end
		Game.createMonster(bossRaids[selectBoss].monster, bossRaids[selectBoss].position, false, true)
		addEvent(Game.createItem, time, bossRaids[selectBoss].itemID, 1, bossRaids[selectBoss].pos1)	
		addEvent(removeMonster, time, bossRaids[selectBoss].monster)	
		setGlobalStorageValue(50000, bossRaids[selectBoss].raidStorage)	
	elseif selectBoss == 1  or selectBoss == 3 or selectBoss == 7 or selectBoss == 8 or selectBoss == 9 or selectBoss == 11 or selectBoss == 13 or selectBoss == 14 or  selectBoss == 15 then
		local itemPos = Tile(bossRaids[selectBoss].pos1):getItemById(bossRaids[selectBoss].itemID)
		local itemPos2 = Tile(bossRaids[selectBoss].pos2):getItemById(bossRaids[selectBoss].itemID)		
		if itemPos then
			itemPos:remove()
			local spectators = Game.getSpectators(bossRaids[selectBoss].pos1, false, true, 7, 7)
				for i = 1, #spectators do
				spectators[i]:say("Boss is here!", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], bossRaids[selectBoss].pos1)
				end
		end
		if itemPos2 then
			itemPos2:remove()
			local spectators = Game.getSpectators(bossRaids[selectBoss].pos2, false, true, 7, 7)
				for i = 1, #spectators do
				spectators[i]:say("Boss is here!", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], bossRaids[selectBoss].pos2)
				end
		end
		Game.createMonster(bossRaids[selectBoss].monster, bossRaids[selectBoss].position, false, true)
		addEvent(Game.createItem, time, bossRaids[selectBoss].itemID, 1, bossRaids[selectBoss].pos1)	
		addEvent(Game.createItem, time, bossRaids[selectBoss].itemID, 1, bossRaids[selectBoss].pos2)
		addEvent(removeMonster, time, bossRaids[selectBoss].monster)
		setGlobalStorageValue(50000, bossRaids[selectBoss].raidStorage)	
	end
end

function onThink(interval, lastExecution, thinkInterval)
	local selectBoss = math.random(15)

	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, bossRaids[selectBoss].monster .. " raid in 5 minutes.")		
	end
    local time = os.date("*t")
    print("[RAID SYSTEM] - "..bossRaids[selectBoss].monster.." ("..time.hour..":"..time.min..")")

	addEvent(raidStarted, 300000, selectBoss)
	return true
end