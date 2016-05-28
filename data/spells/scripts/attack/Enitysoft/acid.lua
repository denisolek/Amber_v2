function onCastSpell(creature, var, isHotkey)

	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
    combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)

	local minDamage = (creature:getLevel() / 5) + (creature:getMagicLevel() * 4.3) + 32
	local maxDamage = (creature:getLevel() / 5) + (creature:getMagicLevel() * 7.4) + 48

	print(minDamage)
	print(maxDamage)

	math.randomseed(os.clock()*100)

	local test = math.random(minDamage, maxDamage)
	local target = Creature(var.number)

	if (target:isMonster()) then	
		firstHit = test * .95
		secondHit = test * 0.60
		thirdHit = test * 0.50
		fourthHit = test * 0.40
	else
		firstHit = test * 0.95 / 2
		secondHit = test * 0.60 / 2
		thirdHit = test * 0.50 / 2
		fourthHit = test * 0.40 / 2	
	end

	local condition = Condition(CONDITION_CURSED)
	condition:setParameter(CONDITION_PARAM_DELAYED, 1)
	condition:addDamage(1, 2000, -firstHit)
	condition:addDamage(1, 2000, -secondHit)
	condition:addDamage(1, 2000, -thirdHit)
	condition:addDamage(1, 2000, -fourthHit)
	combat:setCondition(condition)

	return combat:execute(creature, var)
end
