local bossRaids = {
	[1] = {raidStorage = 1, monster = 'Bethia'},
	[2] = {raidStorage = 2, monster = 'Aberlee'},
	[3] = {raidStorage = 3, monster = 'Beshata'},
	[4] = {raidStorage = 4, monster = 'Hellscream'},
	[5] = {raidStorage = 5, monster = 'Ghandaur'},
	[6] = {raidStorage = 6, monster = 'Yfrg'},
	[7] = {raidStorage = 7, monster = 'Sahuan'},
	[8] = {raidStorage = 8, monster = 'Sellah'},
	[9] = {raidStorage = 9, monster = 'Erathal'},
	[10] = {raidStorage = 10, monster = 'Thall'},
	[11] = {raidStorage = 11, monster = 'Sheon'},
	[12] = {raidStorage = 12, monster = 'Archemont'},
	[13] = {raidStorage = 13, monster = 'Rahin'},
	[14] = {raidStorage = 14, monster = 'Apollyon'},
	[15] = {raidStorage = 15, monster = 'Bhale'},
	[16] = {raidStorage = 16, monster = 'Nightfall'},
	[17] = {raidStorage = 17, monster = 'Bune'}
}
local time = 1800000

function removeMonster(name)
	local creature = Creature(name)	
	if creature == nil or creature:isMonster() == nil then
	    return true
	end
	creature:remove()
end

function raidStarted(boss)
	local bossPosition = Position(154,133,10)
	selectBoss = boss

	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, bossRaids[selectBoss].monster .. " has spawned ! You have 45 minutes to kill it.")		
	end

	Game.createMonster(bossRaids[selectBoss].monster, bossPosition, false, true)
	addEvent(removeMonster, time, bossRaids[selectBoss].monster)	
	setGlobalStorageValue(50000, bossRaids[selectBoss].raidStorage)	

end

function onThink(interval, lastExecution, thinkInterval)
	local selectBoss = math.random(17)

	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, bossRaids[selectBoss].monster .. " raid in 5 minutes.")		
	end
    local time = os.date("*t")
    print("[RAID SYSTEM] - "..bossRaids[selectBoss].monster.." ("..time.hour..":"..time.min..")")

	addEvent(raidStarted, 300000, selectBoss)
	return true
end