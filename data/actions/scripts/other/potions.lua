local ultimateHealthPot = 8473
local greatHealthPot = 7591
local greatManaPot = 7590
local greatSpiritPot = 8472
local strongHealthPot = 7588
local strongManaPot = 7589
local healthPot = 7618
local manaPot = 7620
local smallHealthPot = 8704

-- Enitysoft
local potionBoost = 15  -- % value of boost for premium players

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)

local exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) - 1000))
-- 1000 - 100 due to exact condition timing. -100 doesn't hurt us, and players don't have reminding ~50ms exhaustion.

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target == nil or not target:isPlayer() then
		return true
	end

	if player:getCondition(CONDITION_EXHAUST_HEAL) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		return true
	end

	
	if getTileInfo(getCreaturePosition(player)).protection then
		doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "You can't use potions in PZ.")
		return false
	end
	
	local itemId = item:getId()
	if itemId == healthPot then
		local minHealthPot = 125
		local maxHealthPot = 175
		local minHealthPotBoost = minHealthPot + (minHealthPot*potionBoost/100)
		local maxHealthPotBoost = maxHealthPot + (maxHealthPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minHealthPotBoost, maxHealthPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minHealthPot, maxHealthPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)

	elseif itemId == manaPot then
		local minManaPot = 75
		local maxManaPot = 125
		local minManaPotBoost = minManaPot + (minManaPot*potionBoost/100)
		local maxManaPotBoost = maxManaPot + (maxManaPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatMana(0, target, minManaPotBoost, maxManaPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else
			if not doTargetCombatMana(0, target, minManaPot, maxManaPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		
	elseif itemId == strongHealthPot then
		if (not isInArray({3, 4, 7, 8}, target:getVocation():getId()) or target:getLevel() < 50) and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by paladins and knights of level 50 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		local minStrongHealthPot = 250
		local maxStrongHealthPot = 350
		local minStrongHealthPotBoost = minStrongHealthPot + (minStrongHealthPot*potionBoost/100)
		local maxStrongHealthPotBoost = maxStrongHealthPot + (maxStrongHealthPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minStrongHealthPotBoost, maxStrongHealthPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else			
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minStrongHealthPot, maxStrongHealthPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end
		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		
		
	elseif itemId == strongManaPot then
		if (not isInArray({1, 2, 3, 5, 6, 7}, target:getVocation():getId()) or target:getLevel() < 50) and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by sorcerers, druids and paladins of level 50 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		local minStrongManaPot = 115
		local maxStrongManaPot = 185
		local minStrongManaPotBoost = minStrongManaPot + (minStrongManaPot*potionBoost/100)
		local maxStrongManaPotBoost = maxStrongManaPot + (maxStrongManaPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatMana(0, target, minStrongManaPotBoost, maxStrongManaPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else
			if not doTargetCombatMana(0, target, minStrongManaPot, maxStrongManaPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		
	elseif itemId == greatSpiritPot then
		if (not isInArray({3, 7}, target:getVocation():getId()) or target:getLevel() < 70) and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by paladins of level 70 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		local minGreatSpiritPotHP = 250
		local maxGreatSpiritPotHP = 350
		local minGreatSpiritPotHPBoost = minGreatSpiritPotHP + (minGreatSpiritPotHP*potionBoost/100)
		local maxGreatSpiritPotHPBoost = maxGreatSpiritPotHP + (maxGreatSpiritPotHP*potionBoost/100)
		local minGreatSpiritPotMP = 100
		local maxGreatSpiritPotMP = 200
		local minGreatSpiritPotMPBoost = minGreatSpiritPotMP + (minGreatSpiritPotMP*potionBoost/100)
		local maxGreatSpiritPotMPBoost = maxGreatSpiritPotMP + (maxGreatSpiritPotMP*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minGreatSpiritPotHPBoost, maxGreatSpiritPotHPBoost, CONST_ME_MAGIC_BLUE) or not doTargetCombatMana(0, target, minGreatSpiritPotMPBoost, maxGreatSpiritPotMPBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minGreatSpiritPotHP, maxGreatSpiritPotHP, CONST_ME_MAGIC_BLUE) or not doTargetCombatMana(0, target, minGreatSpiritPotMP, maxGreatSpiritPotMP, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end
		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		
	elseif itemId == greatHealthPot then
		if (not isInArray({4, 8}, target:getVocation():getId()) or target:getLevel() < 70) and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by knights of level 70 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		local minGreatHealthPot = 425
		local maxGreatHealthPot = 575
		local minGreatHealthPotBoost = minGreatHealthPot + (minGreatHealthPot*potionBoost/100)
		local maxGreatHealthPotBoost = maxGreatHealthPot + (maxGreatHealthPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minGreatHealthPotBoost, maxGreatHealthPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minGreatHealthPot, maxGreatHealthPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end
		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		
	elseif itemId == greatManaPot then
		if (not isInArray({1,2,5,6}, target:getVocation():getId()) or target:getLevel() < 70) and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by sorcerers and druids of level 70 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		local minGreatManaPot = 150
		local maxGreatManaPot = 250
		local minGreatManaPotBoost = minGreatManaPot + (minGreatManaPot*potionBoost/100)
		local maxGreatManaPotBoost = maxGreatManaPot + (maxGreatManaPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatMana(0, target, minGreatManaPotBoost, maxGreatManaPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else
			if not doTargetCombatMana(0, target, minGreatManaPot, maxGreatManaPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end			
		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		
	elseif itemId == ultimateHealthPot then
		if (not isInArray({4, 8}, target:getVocation():getId()) or target:getLevel() < 110) and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by knights of level 110 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		local minUltimateHealthPot = 650
		local maxUltimateHealthPot = 850
		local minUltimateHealthPotBoost = minUltimateHealthPot + (minUltimateHealthPot*potionBoost/100)
		local maxUltimateHealthPotBoost = maxUltimateHealthPot + (maxUltimateHealthPot*potionBoost/100)

		if target:isPremium() and (target:getGuid() == player:getGuid())then
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minUltimateHealthPotBoost, maxUltimateHealthPotBoost, CONST_ME_MAGIC_BLUE) then
				return false
			end
		else				
			if not doTargetCombatHealth(0, target, COMBAT_HEALING, minUltimateHealthPot, maxUltimateHealthPot, CONST_ME_MAGIC_BLUE) then
				return false
			end
		end
		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)

	end
	return true
end
