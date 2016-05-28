local showItem = 6920 -- id przedmiotu ktory ma sie pojawic (schodow)
local pos = Position(35, 163, 7) -- pozycja przedmiotu (schodow)
local normalGround = 670 -- id normalnej podłogi w tym miejscu
local time = 15 * 1000 -- na ile ma znikać 
local msg = 'Secret passage has been open - BE FAST!' -- wiadomosc nad uzytym przedmiotem
local msg2 = 'Enter if you dare. Hahahahahaha' -- wiadomosc nad znikajaca sciana

local function removeShowItem(position, itemId)
    local removeItem = Tile(position):getItemById(itemId)
    if removeItem and removeItem:getId() == showItem then
        removeItem:remove()
        Game.createItem(normalGround, 1, pos)
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(pos)
	local ground = tile:getGround()
	if ground:getId() == showItem then
	  	return false
	end
	player:say(msg, TALKTYPE_MONSTER_SAY, false, player, toPosition)
	local spectators = Game.getSpectators(pos, false, true, 7, 7)
		for i = 1, #spectators do
		player:say(msg2, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
	end
	Game.createItem(showItem, 1, pos)
	local tempItem = Tile(pos):getItemById(showItem)
	addEvent(removeShowItem, time, pos, showItem)
end