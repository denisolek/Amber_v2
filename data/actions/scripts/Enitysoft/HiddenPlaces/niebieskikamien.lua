local wall = 1304 -- id ściany która znika
local pos = Position(192, 97, 8) -- pozycja ściany
local time = 4 * 1000 -- na ile ma znikać 
local msg = 'Stone destroyed, hurry up !' -- wiadomosc nad uzytym przedmiotem
local msg2 = 'OPENED' -- wiadomosc nad znikajaca sciana
local fromItem = 1354 -- dzwignia w lewo
local toItem = 1354 -- dzwignia w prawo

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local wallItem = Tile(pos):getItemById(wall)
	if wallItem then
		wallItem:remove()
		addEvent(Game.createItem, time, wall, 1, pos)
		if item:getId() == fromItem then
			item:transform(toItem)
		elseif item:getId() == toItem then
			item:transform(fromItem)
		end		
		player:say(msg, TALKTYPE_MONSTER_SAY, false, player, toPosition)
		local spectators = Game.getSpectators(pos, false, true, 3, 3)
			for i = 1, #spectators do
			player:say(msg2, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
		end
	else
		return false
	end
end