local outfitNames ={
	['hunter'] = {famale=147, male=129, storage=10023},
	['mage'] = {famale=138, male=130, storage=10019},
	['knight'] = {famale=139, male=131, storage=10015},
	['nobleman'] = {famale=140, male=132, storage=10027},
	['summoner'] = {famale=141, male=133, storage=10035},
	['warrior'] = {famale=142, male=134, storage=10031},
	['barbarian'] = {famale=147, male=143, storage=10067},
	['druid'] = {famale=148, male=144, storage=10063},
	['wizard'] = {famale=149, male=145, storage=10071},
	['oriental'] = {famale=150, male=146, storage=10051},
	['pirate'] = {famale=155, male=151, storage=10039},
	['assassin'] = {famale=156, male=152, storage=10047},
	['beggar'] = {famale=157, male=153, storage=10059},
	['shaman'] = {famale=158, male=154, storage=10043},
	['norseman'] = {famale=252, male=251, storage=10055},
	['nightmare'] = {famale=269, male=268, storage=10076},
	['demonhunter'] = {famale=288, male=289, storage=10080}
	
}

function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")

	local target = Player(split[1])
	local outfitName = split[2]

	if target:getSex() == 1 then
		target:addOutfit(outfitNames[outfitName].male)
		target:setStorageValue(outfitNames[outfitName].storage, 1)
	else
		target:addOutfit(outfitNames[outfitName].famale)
		target:setStorageValue(outfitNames[outfitName].storage, 1)
	end

	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'GIFT: '..outfitName..' outfit has been added.')
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Outfit: '..outfitName..' has been added to '..split[1]..'.')
	return false
end
