dofile("war_config.lua")

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

function onLogin(player)
	-- TEMPLE TP
	local online = Game.getPlayerCount()
	local x,y,z
	if online <= 50 then
		x,y,z = selectTemple(1)
	elseif online > 50 and online <=100 then
		local rand = math.random(1,2)
		x,y,z = selectTemple(rand)
	elseif online > 100 and online <=150 then
		local rand = math.random(1,3)
		x,y,z = selectTemple(rand)
	elseif online > 150 and online <=200 then
		local rand = math.random(1,4)
		x,y,z = selectTemple(rand)
	elseif online > 200 and online <=250 then
		local rand = math.random(1,5)
		x,y,z = selectTemple(rand)
	elseif online > 250 then
		local rand = math.random(1,6)
		x,y,z = selectTemple(rand)
	end
	player:teleportTo(Position(x, y, z), false)
	-- SKULL SYSTEM
	local playerRank = player:getStorageValue(9000)
	if playerRank <= 1750 then
		player:setSkull(SKULL_GREEN)
	elseif playerRank > 1750 and playerRank <= 3500 then
		player:setSkull(SKULL_WHITE)
	elseif playerRank > 3500 and playerRank <= 5250 then
		player:setSkull(SKULL_YELLOW)
	elseif playerRank > 5250 and playerRank <= 7000 then
		player:setSkull(SKULL_RED)
	else
		player:setSkull(SKULL_BLACK)
	end
	------------
	local vocation = player:getVocation():getId()

	local function getExpForLevel(level)
   		level = level - 1
    		return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
	end

	local function getMinimumLevel(skill)
		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
			if skill == SKILL_CLUB or skill == SKILL_SWORD or skill == SKILL_AXE or skill == SKILL_DISTANCE then
			return 10
			end
			if skill == SKILL_SHIELD then
				return magesShield
			end
			if skill == "MAGIC" then
				return magesMagic
			end
		end
		if vocation == 3 or vocation == 7 then
			if skill == SKILL_CLUB or skill == SKILL_SWORD or skill == SKILL_AXE then
			return 10
			end
			if skill == SKILL_DISTANCE then
				return paladinDistance
			end
			if skill == SKILL_SHIELD then
				return paladinShield
			end
			if skill == "MAGIC" then
				return paladinMagic
			end
		end
		if vocation == 4 or vocation == 8 then
			if skill == SKILL_DISTANCE then
			return 10
			end
			if skill == SKILL_CLUB or skill == SKILL_SWORD or skill == SKILL_AXE then
				return knightMelee
			end
			if skill == SKILL_SHIELD then
				return knightShield
			end
			if skill == "MAGIC" then
				return knightMagic
			end
		end
	end

	if player:isPremium() then
		if player:getLevel() < startLevel+10 then
			player:addExperience(getExpForLevel(startLevel+10) - player:getExperience(), false, true)
		end
	else
		if player:getLevel() < startLevel then
			player:addExperience(getExpForLevel(startLevel) - player:getExperience(), false, true)
		end
	end

	local addHP = player:getMaxHealth()-player:getHealth()
	local addMANA = player:getMaxMana()-player:getMana()

	player:addHealth(addHP, true)
	player:addMana(addMANA, false, true)

	player:setStorageValue(4999, -1)

	if player:getLastLoginSaved() <= 0 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, newPlayerMessage)

		if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
			while player:getSkillLevel(SKILL_SHIELD) < getMinimumLevel(SKILL_SHIELD) do
				player:addSkillTries(SKILL_SHIELD, player:getVocation():getRequiredSkillTries(SKILL_SHIELD, player:getSkillLevel(SKILL_SHIELD) + 1) - player:getSkillTries(SKILL_SHIELD), true)
			end
			while player:getBaseMagicLevel() < getMinimumLevel("MAGIC") do
   				player:addManaSpent(player:getVocation():getRequiredManaSpent(player:getBaseMagicLevel() + 1) - player:getManaSpent(), true)
			end
		end
		if vocation == 3 or vocation == 7 then
			while player:getSkillLevel(SKILL_SHIELD) < getMinimumLevel(SKILL_SHIELD) do
				player:addSkillTries(SKILL_SHIELD, player:getVocation():getRequiredSkillTries(SKILL_SHIELD, player:getSkillLevel(SKILL_SHIELD) + 1) - player:getSkillTries(SKILL_SHIELD), true)
			end
			while player:getSkillLevel(SKILL_DISTANCE) < getMinimumLevel(SKILL_DISTANCE) do
				player:addSkillTries(SKILL_DISTANCE, player:getVocation():getRequiredSkillTries(SKILL_DISTANCE, player:getSkillLevel(SKILL_DISTANCE) + 1) - player:getSkillTries(SKILL_DISTANCE), true)
			end
			while player:getBaseMagicLevel() < getMinimumLevel("MAGIC") do
   				player:addManaSpent(player:getVocation():getRequiredManaSpent(player:getBaseMagicLevel() + 1) - player:getManaSpent(), true)
			end
		end
		if vocation == 4 or vocation == 8 then
			while player:getSkillLevel(SKILL_SHIELD) < getMinimumLevel(SKILL_SHIELD) do
				player:addSkillTries(SKILL_SHIELD, player:getVocation():getRequiredSkillTries(SKILL_SHIELD, player:getSkillLevel(SKILL_SHIELD) + 1) - player:getSkillTries(SKILL_SHIELD), true)
			end
			while player:getSkillLevel(SKILL_SWORD) < getMinimumLevel(SKILL_SWORD) do
				player:addSkillTries(SKILL_SWORD, player:getVocation():getRequiredSkillTries(SKILL_SWORD, player:getSkillLevel(SKILL_SWORD) + 1) - player:getSkillTries(SKILL_SWORD), true)
			end
			while player:getSkillLevel(SKILL_AXE) < getMinimumLevel(SKILL_AXE) do
				player:addSkillTries(SKILL_AXE, player:getVocation():getRequiredSkillTries(SKILL_AXE, player:getSkillLevel(SKILL_AXE) + 1) - player:getSkillTries(SKILL_AXE), true)
			end
			while player:getSkillLevel(SKILL_CLUB) < getMinimumLevel(SKILL_CLUB) do
				player:addSkillTries(SKILL_CLUB, player:getVocation():getRequiredSkillTries(SKILL_CLUB, player:getSkillLevel(SKILL_CLUB) + 1) - player:getSkillTries(SKILL_CLUB), true)
			end
			while player:getBaseMagicLevel() < 5 do
   				player:addManaSpent(player:getVocation():getRequiredManaSpent(player:getBaseMagicLevel() + 1) - player:getManaSpent(), true)
			end
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, oldPlayerMessage..player:getName())
	end
	-- remove bag
	if player:getItemCount(1987) >= 1 then
		player:removeItem(1987,1)
	end
	-- restore items
	if string.lower(restoreItems) ~= "no" then
		if player:getGroup():getId() < 2 then
			if player:getSlotItem(CONST_SLOT_HEAD) == nil then
				if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
					player:addItem(2662, 1, true, 1, CONST_SLOT_HEAD)-- start mage hat
				elseif vocation == 3 or vocation == 7 then
					player:addItem(2457, 1, true, 1, CONST_SLOT_HEAD)-- start paladin helmet
				elseif vocation == 4 or vocation == 8 then
					player:addItem(7461, 1, true, 1, CONST_SLOT_HEAD)-- start knight helmet
				end
			end
			if player:getSlotItem(CONST_SLOT_NECKLACE) == nil then
				player:addItem(2661, 1, true, 1, CONST_SLOT_NECKLACE)-- scarf
			end
			if player:getSlotItem(CONST_SLOT_ARMOR) == nil then
				if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
					player:addItem(2654, 1, true, 1, CONST_SLOT_ARMOR)-- start mage cape
				elseif vocation == 3 or vocation == 7 then
					player:addItem(2463, 1, true, 1, CONST_SLOT_ARMOR)-- start paladin armor
				elseif vocation == 4 or vocation == 8 then
					player:addItem(2486, 1, true, 1, CONST_SLOT_ARMOR)-- start knight armor
				end
			end
			if player:getSlotItem(CONST_SLOT_RIGHT) == nil then
				if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 or vocation == 4 or vocation == 8 then
					player:addItem(2516, 1, true, 1, CONST_SLOT_RIGHT)-- start shield
				end
			end
			if player:getSlotItem(CONST_SLOT_LEFT) == nil then
				if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
					player:addItem(2433, 1, true, 1, CONST_SLOT_LEFT)-- start mage staff
				elseif vocation == 3 or vocation == 7 then
					player:addItem(2455, 1, true, 1, CONST_SLOT_LEFT)-- start crossbow
				elseif vocation == 4 or vocation == 8 then
					player:addItem(7449, 1, true, 1, CONST_SLOT_LEFT)-- start sword
				end
			end
			if player:getSlotItem(CONST_SLOT_LEGS) == nil then
				if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
					player:addItem(2649, 1, true, 1, CONST_SLOT_LEGS)-- start mage legs
				elseif vocation == 3 or vocation == 7 then
					player:addItem(2648, 1, true, 1, CONST_SLOT_LEGS)-- start paladin legs
				elseif vocation == 4 or vocation == 8 then
					player:addItem(2478, 1, true, 1, CONST_SLOT_LEGS)-- start knight legs
				end
			end
			if player:getSlotItem(CONST_SLOT_FEET) == nil then
				player:addItem(2643, 1, true, 1, CONST_SLOT_FEET)-- start boots
			end
			if player:getSlotItem(CONST_SLOT_AMMO) == nil then
				if vocation == 3 or vocation == 7 then
					player:addItem(2543, 1, true, 1, CONST_SLOT_AMMO)-- start bolts
				end
			end	
			if player:getSlotItem(CONST_SLOT_BACKPACK) == nil then
				for _, v in ipairs(commonItems) do
					player:addItem(v.itemid, v.count or 1)
				end
				if vocation <= 4 then
					local giveBackpackItems = backpackItems[vocation]
					if giveBackpackItems ~= nil then
						for _, v in ipairs(giveBackpackItems) do
							player:addItem(v.itemid, v.count or 1)
						end
					end
				elseif vocation >= 5 then
					local promoVoc = vocation-4
					local giveBackpackItems = backpackItems[promoVoc]
					if giveBackpackItems ~= nil then
						for _, v in ipairs(giveBackpackItems) do
							player:addItem(v.itemid, v.count or 1)
						end
					end
				end
			end		
		end
	end
	--------------------
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, everyLoginMessage)
	return true
end