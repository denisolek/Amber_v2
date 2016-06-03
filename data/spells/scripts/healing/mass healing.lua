function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	local min = ((player:getLevel() / 5) + (player:getMagicLevel() * 4.6) + 100)
	local max = ((player:getLevel() / 5) + (player:getMagicLevel() * 9.6) + 125)

	local master = target:getMaster()
	if target:isMonster() and not master or master and master:isMonster() then
		return true
	end
	local outfit = player:getOutfit()
	if(outfit.lookType == 148 or outfit.lookType == 144) then
		if(outfit.lookAddons == 3) then
			min = min + (min*0.3)
			max = max + (max*0.3)
		elseif(outfit.lookAddons == 2) then
			min = min + (min*0.15)
			max = max + (max*0.15)
		elseif(outfit.lookAddons == 1) then
			min = min + (min*0.2)
			max = max + (max*0.2)
		else
			min = min + (min*0.1)
			max = max + (max*0.1)
		end		
	end
	doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
	return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
