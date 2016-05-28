local foods = {
	[2789] = {3000, "Munch."}, -- brown mushroom
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local food = foods[item.itemid]
	if food == nil then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + food[1]) >= 1200 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full.")
	else
		player:feed(food[1] * 12)
		player:say(food[2], TALKTYPE_MONSTER_SAY)
	end
	return true
end
