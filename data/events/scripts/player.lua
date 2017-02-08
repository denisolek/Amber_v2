function Player:onLook(thing, position, distance)
	local description = ""
	if thing:isPlayer() then
		description = thing:getDescription(distance)
	else
		description = "You see " .. thing:getDescription(distance)
	end

	if self:getGroup():getAccess() then
		if thing:isItem() then
			description = string.format("%s\nItem ID: %d", description, thing:getId())

			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, Action ID: %d", description, actionId)
			end

			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, Unique ID: %d", description, uniqueId)
			end

			local itemType = thing:getType()

			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onEquip)", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onDeEquip)", description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecays to: %d", description, decayId)
			end
		elseif thing:isCreature() then
			local str = "%s\nHealth: %d / %d"
			if thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: %d / %d", str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
		end

		local position = thing:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if thing:isCreature() then
			if thing:isPlayer() then
				description = string.format("%s\nIP: %s.", description, Game.convertIpToString(thing:getIp()))
			end
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInBattleList(creature, distance)
	local description = "You see " .. creature:getDescription(distance)
	if self:getGroup():getAccess() then
		local str = "%s\nHealth: %d / %d"
		if creature:getMaxMana() > 0 then
			str = string.format("%s, Mana: %d / %d", str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. "."

		local position = creature:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if creature:isPlayer() then
			description = string.format("%s\nIP: %s", description, Game.convertIpToString(creature:getIp()))
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInTrade(partner, item, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, "You see " .. item:getDescription(distance))
end

function Player:onLookInShop(itemType, count)
	return true
end


local maxItemsPerSecond = 4
local stor = 19191
local items = 0

function Player:onMoveItem(item, count, fromPosition, toPosition)
	if self:getStorageValue(stor) == -1 then
		self:setStorageValue(stor, os.time())
	end
	if os.time() - self:getStorageValue(stor) < 2 and items >= maxItemsPerSecond then
		self:sendCancelMessage("You can't move items so fast [ANTI-PUSH BOT].")
		return false
	elseif os.time() - self:getStorageValue(stor) < 2 then
		items = items + 1
		self:setStorageValue(stor, os.time())
	else
		items = 0
		self:setStorageValue(stor, os.time())
	end	
	return true
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	local tile = Tile(toPosition)
	local ground = tile:getGround()
	if ground then
		if ground:getActionId() == 20300 or ground:getActionId() == 20301 then
			return false
		end
	end
	return true
end

local maxTurnPerSecond = 6
local storTurn = 19192
local turns = 0
function Player:onTurn(direction)
	if self:getStorageValue(storTurn) == -1 then
		self:setStorageValue(storTurn, os.time())
	end
	if os.time() - self:getStorageValue(storTurn) < 3 and turns >= maxTurnPerSecond then
		self:sendCancelMessage("You can't dance so fast!")
		return false
	elseif os.time() - self:getStorageValue(storTurn) < 3 then
		turns = turns + 1
	else
		turns = 0
		self:setStorageValue(storTurn, os.time())
	end	
	return true
end

function Player:onTradeRequest(target, item)
	return true
end

function Player:onTradeAccept(target, item, targetItem)
	return true
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

function Player:onGainExperience(source, exp, rawExp)
	if not source or source:isPlayer() then
		return exp
	end

	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Apply experience stage multiplier
	exp = exp * Game.getExperienceStage(self:getLevel())

	-- Stamina modifier
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)

		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5
		end
	end

	return exp
end

function Player:onLoseExperience(exp)
	return exp
end
-- Enitysoft SKILL STAGES
local configSkills = {
        [1] = { -- SORCERER
                [SKILL_FIST] = {
                        [{10, 19}] = 10, -- [{od skilla, do skilla}] = mnoznik
                        [{20, 29}] = 5
                },
                [SKILL_CLUB] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SWORD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_AXE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_DISTANCE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SHIELD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_FISHING] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_MAGLEVEL] = {
                        [{1, 50}] = 200,
                        [{50, 51}] = 5
                }
        },
        [2] = { -- DRUID
                [SKILL_FIST] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_CLUB] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SWORD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_AXE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_DISTANCE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SHIELD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_FISHING] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_MAGLEVEL] = {
                        [{10, 50}] = 200,
                        [{50, 51}] = 5
                }
        },
        [3] = { -- PALADIN
                [SKILL_FIST] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_CLUB] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SWORD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_AXE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_DISTANCE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SHIELD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_FISHING] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_MAGLEVEL] = {
                        [{10, 50}] = 200,
                        [{50, 51}] = 5
                }
        },
        [4] = { -- KNIGHT
                [SKILL_FIST] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_CLUB] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SWORD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_AXE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_DISTANCE] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_SHIELD] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_FISHING] = {
                        [{10, 19}] = 10,
                        [{20, 29}] = 5
                },
                [SKILL_MAGLEVEL] = {
                        [{1, 50}] = 200,
                        [{50, 51}] = 5
                }
        }
}

local function getSkillRate(player, skillId)
		local targetBase = player:getVocation():getId()
		if (targetBase == 5) then
			targetBase = 1
		elseif (targetBase == 6) then
			targetBase = 2
		elseif (targetBase == 7) then
			targetBase = 3
		elseif (targetBase == 8) then
			targetBase = 4
		end
        local targetVocation = configSkills[targetBase]
        if targetVocation then
                local targetSkillStage = targetVocation[skillId]
                if targetSkillStage then
                        local skillLevel = skillId ~= SKILL_MAGLEVEL and player:getSkillLevel(skillId) or player:getBaseMagicLevel()
                        for level, rate in pairs(targetSkillStage) do
                                if skillLevel >= level[1] and skillLevel <= level[2] then
                                        return rate
                                end
                        end
                end
        end
 
        return skillId == SKILL_MAGLEVEL and configManager.getNumber(configKeys.RATE_MAGIC) or configManager.getNumber(configKeys.RATE_SKILL)
end

function Player:onGainSkillTries(skill, tries)
        if not APPLY_SKILL_MULTIPLIER then
                return tries
        end
 
        return tries * getSkillRate(self, skill)
end