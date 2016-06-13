local initOutfit = {
	commonOutfits = {
		{typeFamale=150, typeMale=146, storage=10051}, -- oriental
		{typeFamale=252, typeMale=251, storage=10055}, -- norseman
		{typeFamale=157, typeMale=153, storage=10059} -- beggar
	},
	knightOutfits = {
		{typeFamale=139, typeMale=131, storage=10015}, -- knight
		{typeFamale=142, typeMale=134, storage=10031} -- warrior
	},
	paladinOutfits = {
		{typeFamale=137, typeMale=129, storage=10023}, -- hunter
		{typeFamale=142, typeMale=134, storage=10031} -- warrior
	},
	mageOutfits = {
		{typeFamale=138, typeMale=130, storage=10019}, -- mage
		{typeFamale=141, typeMale=133, storage=10035} -- summoner
	}
}

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
		-- New player outfits
		for i=1, #initOutfit.commonOutfits do
			if player:getSex() == 1 then
				player:addOutfit(initOutfit.commonOutfits[i].typeMale)
			else
				player:addOutfit(initOutfit.commonOutfits[i].typeFamale)
			end
        	player:setStorageValue(initOutfit.commonOutfits[i].storage, 1)
    	end
    	local playerVocation = player:getVocation():getId()
    	if playerVocation == 1 or playerVocation == 5 or playerVocation == 2 or playerVocation == 6 then
    		for i=1, #initOutfit.mageOutfits do
				if player:getSex() == 1 then
					player:addOutfit(initOutfit.mageOutfits[i].typeMale)
				else
					player:addOutfit(initOutfit.mageOutfits[i].typeFamale)
				end
	        	player:setStorageValue(initOutfit.mageOutfits[i].storage, 1)
	    	end
    	elseif playerVocation == 3 or playerVocation == 7 then
    		for i=1, #initOutfit.paladinOutfits do
				if player:getSex() == 1 then
					player:addOutfit(initOutfit.paladinOutfits[i].typeMale)
				else
					player:addOutfit(initOutfit.paladinOutfits[i].typeFamale)
				end
	        	player:setStorageValue(initOutfit.paladinOutfits[i].storage, 1)
	    	end
    	elseif playerVocation == 4 or playerVocation == 8 then
    		for i=1, #initOutfit.knightOutfits do
				if player:getSex() == 1 then
					player:addOutfit(initOutfit.knightOutfits[i].typeMale)
				else
					player:addOutfit(initOutfit.knightOutfits[i].typeFamale)
				end
	        	player:setStorageValue(initOutfit.knightOutfits[i].storage, 1)
	    	end
    	end
    	--
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