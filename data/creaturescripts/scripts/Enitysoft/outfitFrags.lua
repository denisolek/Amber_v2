function onKill(creature, target)
	local totalKills = 6000
	if(creature:getStorageValue(totalKills) == -1) then
		creature:setStorageValue(totalKills, 0)
	end
	if(target:isPlayer() and (creature:getIp() ~= target:getIp())) then
		if(creature:getStorageValue(totalKills) < 10) then
			creature:setStorageValue(totalKills, creature:getStorageValue(totalKills)+1)
			if(creature:getStorageValue(totalKills) == 10) then
				local outfit = creature:getOutfit()
				-- knight
				if(creature:getVocation():getId()  == 4 or creature:getVocation():getId()  == 8) then
					creature:addOutfit(139)
					creature:addOutfit(131)
					creature:setStorageValue(10015, 1)
					if(creature:getSex() == 0) then
						outfit.lookType = 139
						creature:setOutfit(outfit)
					else
						outfit.lookType = 131
						creature:setOutfit(outfit)
					end
				-- mage
				elseif(creature:getVocation():getId()  == 1 or creature:getVocation():getId()  == 5 or creature:getVocation():getId()  == 2 or creature:getVocation():getId()  == 6) then
					creature:addOutfit(138)
					creature:addOutfit(130)
					creature:setStorageValue(10019, 1)
					if(creature:getSex() == 0) then
						outfit.lookType = 138
						creature:setOutfit(outfit)
					else
						outfit.lookType = 130
						creature:setOutfit(outfit)
					end
				-- hunter
				else
					creature:addOutfit(137)
					creature:addOutfit(129)
					creature:setStorageValue(10023, 1)
					if(creature:getSex() == 0) then
						outfit.lookType = 137
						creature:setOutfit(outfit)
					else
						outfit.lookType = 129
						creature:setOutfit(outfit)
					end					
				end
				creature:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
				creature:sendTextMessage(MESSAGE_STATUS_WARNING, "Congratulations, You've made 10 frags! Check out your new outfit.")
			end
		else
			return true
		end	
	end
end
