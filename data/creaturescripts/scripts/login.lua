function onLogin(player)
	player:setStorageValue(10011, 1)
	-- rank
	if player:getStorageValue(9000) == -1 then
		player:setStorageValue(9000, 3500)
	end
	-- raids
	if player:getStorageValue(9600) == 1 then
		player:setStorageValue(9600, -1)
	end
	-- durak
	if player:getStorageValue(9601) == 1 then
		player:setStorageValue(9601, -1)
	end
	-- poiTiles
	if player:getStorageValue(9700) == 1 then
		player:setStorageValue(9700, -1)
	end

	-- init website values
	if player:getStorageValue(11000) == -1 then
		player:setStorageValue(11000, 0)
	end
	if player:getStorageValue(11001) == -1 then
		player:setStorageValue(11001, 0)
	end

	if player:getStorageValue(9702) == 1 then
		player:setStorageValue(9702, -1)
	end

	if player:getStorageValue(9500) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "Your character has been downgraded to low priority rank for breaking the rules. \n[Protection ALL: -50%]")
	end

	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
		local x = 0
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- Change outfit  ENITYSOFT
	local creature = player
	local current = creature:getOutfit()
	creature:setOutfit(current)

	-- Outfit bonus ENITYSOFT
	player:setOutfit(player:getOutfit())
	
	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("CheckTile")
	player:registerEvent("Resists")
	player:registerEvent("WarriorAbsorb")
	player:registerEvent("OutfitFrags")
	player:registerEvent("FragTasks")
	player:registerEvent("PirateReward")
	player:registerEvent("POI")
	player:registerEvent("fragReward")
	player:registerEvent("rankingSystem")
	player:registerEvent("fragsWebsite")
	player:registerEvent("lordsWebsite")
	return true
end