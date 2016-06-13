local fragOutfitConfig = {
	firstStage = {
		{name='Pirate', typeFamale=155, typeMale=151, storage=10039} -- pirate
	},
	secondStage = {
		{name='Shaman', typeFamale=158, typeMale=154, storage=10043} -- shaman
	},
	thirdStage ={
		{name='Assasin', typeFamale=156, typeMale=152, storage=10047, vocationID = 3}, -- assassin
		{name='Druid', typeFamale=148, typeMale=144, storage=10063, vocationID = 2}, -- druid
		{name='Barbarian', typeFamale=147, typeMale=143, storage=10067, vocationID = 4}, -- barbarian
		{name='Wizard', typeFamale=149, typeMale=145, storage=10071, vocationID = 1}  -- wizard
	},
	firstStageFrags = 100,
	secondStageFrags = 300,
	thirdStageFrags = 500
}
function onKill(creature, target)
	local totalKills = 6000
	if(creature:getStorageValue(totalKills) == -1) then
		creature:setStorageValue(totalKills, 0)
	end
	if(target:isPlayer() and (creature:getIp() ~= target:getIp())) then
		creature:setStorageValue(totalKills, creature:getStorageValue(totalKills)+1)
	else
		return true
	end
	local playerFrags = creature:getStorageValue(totalKills)
	-- firstStage
	local outfit = creature:getOutfit()
    if playerFrags == fragOutfitConfig.firstStageFrags then
    	if creature:getSex() == 1 then
			creature:addOutfit(fragOutfitConfig.firstStage[1].typeMale)
			outfit.lookType = fragOutfitConfig.firstStage[1].typeMale
		else
			creature:addOutfit(fragOutfitConfig.firstStage[1].typeFamale)
			outfit.lookType = fragOutfitConfig.firstStage[1].typeFamale
		end
		creature:setStorageValue(fragOutfitConfig.firstStage[1].storage, 1)
		creature:setOutfit(outfit)
		creature:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		creature:sendTextMessage(MESSAGE_STATUS_WARNING, "Congratulations, You've made "..playerFrags.." frags! There is your reward: ".. fragOutfitConfig.firstStage[1].name .." Outfit.")
		creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Congratulations, You've made "..playerFrags.." frags! There is your reward: ".. fragOutfitConfig.firstStage[1].name .." Outfit.")
		return true
	-- secondStage
   	elseif playerFrags == fragOutfitConfig.secondStageFrags then
    	if creature:getSex() == 1 then
			creature:addOutfit(fragOutfitConfig.secondStage[1].typeMale)
			outfit.lookType = fragOutfitConfig.secondStage[1].typeMale
		else
			creature:addOutfit(fragOutfitConfig.secondStage[1].typeFamale)
			outfit.lookType = fragOutfitConfig.secondStage[1].typeFamale
		end
		creature:setStorageValue(fragOutfitConfig.secondStage[1].storage, 1)
		creature:setOutfit(outfit)
		creature:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		creature:sendTextMessage(MESSAGE_STATUS_WARNING, "Congratulations, You've made "..playerFrags.." frags! There is your reward: "..fragOutfitConfig.secondStage[1].name.." Outfit.")
		creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Congratulations, You've made "..playerFrags.." frags! There is your reward: "..fragOutfitConfig.secondStage[1].name.." Outfit.")
		return true
   	-- thirdStage
   	elseif playerFrags == fragOutfitConfig.thirdStageFrags then
   		local playerVocation = creature:getVocation():getId()
   		if playerVocation == 5 then playerVocation = 1 end
   		if playerVocation == 6 then playerVocation = 2 end
   		if playerVocation == 7 then playerVocation = 3 end
   		if playerVocation == 8 then playerVocation = 4 end

		for i=1, #fragOutfitConfig.thirdStage do
			if fragOutfitConfig.thirdStage[i].vocationID == playerVocation then		
		    	if creature:getSex() == 1 then
					creature:addOutfit(fragOutfitConfig.thirdStage[i].typeMale)
					outfit.lookType = fragOutfitConfig.thirdStage[i].typeMale
				else
					creature:addOutfit(fragOutfitConfig.thirdStage[i].typeFamale)
					outfit.lookType = fragOutfitConfig.thirdStage[i].typeFamale
				end
				creature:setStorageValue(fragOutfitConfig.thirdStage[i].storage, 1)
				creature:setOutfit(outfit)
				creature:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
				creature:sendTextMessage(MESSAGE_STATUS_WARNING, "Congratulations, You've made "..playerFrags.." frags! There is your reward: "..fragOutfitConfig.thirdStage[i].name.." Outfit.")
				creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Congratulations, You've made "..playerFrags.." frags! There is your reward: "..fragOutfitConfig.thirdStage[i].name.." Outfit.")
			end
		end
		return true
   	end

   	-- send status msg
   	local msg = ''
   	if playerFrags < fragOutfitConfig.firstStageFrags then
   		msg = 'Frag system: '..playerFrags..'/'..fragOutfitConfig.firstStageFrags ..' players killed         [ Next reward: '.. fragOutfitConfig.firstStage[1].name ..' Outfit ]'
   	elseif (playerFrags > fragOutfitConfig.firstStageFrags) and (playerFrags < fragOutfitConfig.secondStageFrags) then
		msg = 'Frag system: '..playerFrags..'/'..fragOutfitConfig.secondStageFrags ..' players killed         [ Next reward: '.. fragOutfitConfig.secondStage[1].name ..' Outfit ]'
   	elseif (playerFrags > fragOutfitConfig.secondStageFrags) and (playerFrags < fragOutfitConfig.thirdStageFrags) then
      	local playerVocation = creature:getVocation():getId()
   		if playerVocation == 5 then playerVocation = 1 end
   		if playerVocation == 6 then playerVocation = 2 end
   		if playerVocation == 7 then playerVocation = 3 end
   		if playerVocation == 8 then playerVocation = 4 end

		for i=1, #fragOutfitConfig.thirdStage do
			if fragOutfitConfig.thirdStage[i].vocationID == playerVocation then		
				msg = 'Frag system: '..playerFrags..'/'..fragOutfitConfig.thirdStageFrags ..' players killed         [ Next reward: '.. fragOutfitConfig.thirdStage[i].name ..' Outfit ]'
			end
		end
   	end

   	if msg ~= '' then
   		creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, msg)
   	end
   	return true
end
