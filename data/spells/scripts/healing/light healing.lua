local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.4) + 8
	local max = (level / 5) + (maglevel * 1.8) + 11
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
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
