local itemID = 12466 -- The ID of the item that will give you EXP
local xp = 600000 --How much EXP will be givin when item is used
local words = "+600k experience" --What the player will say when item is used
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
if item.itemid == itemID then
	if player:isPremium() then
		if player:getLevel() < 160 then
			player:addExperience(xp)
			player:say(words, TALKTYPE_MONSTER_SAY)
			Item(item.uid):remove(1)
		else
			player:say("You have maximum level.", TALKTYPE_MONSTER_SAY)
			return false
		end
	else
		if player:getLevel() < 150 then
			player:addExperience(xp)
			player:say(words, TALKTYPE_MONSTER_SAY)
			Item(item.uid):remove(1)
		else
			player:say("You have maximum level.", TALKTYPE_MONSTER_SAY)
			return false
		end
	end
end
return true
end