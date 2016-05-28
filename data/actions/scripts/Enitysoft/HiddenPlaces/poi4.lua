local showItem = 7272 -- id przedmiotu ktory ma sie pojawic (schodow)
local pos = Position(203, 209, 12) -- pozycja przedmiotu (schodow)
local normalGround = 4750 -- id normalnej podłogi w tym miejscu
local time = 600 * 1000 -- na ile ma znikać 
local msg = 'The passage has been opened ! RUSH !' -- wiadomosc nad uzytym przedmiotem
local msg2 = 'Puff!' -- wiadomosc nad znikajaca sciana

local function removeShowItem(position, itemId)
    local removeItem = Tile(position):getItemById(itemId)
    if removeItem then
        removeItem:remove()
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(pos)
	local ground = tile:getGround()
	if ground:getId() == showItem then
	  	return false
	end
	player:say(msg, TALKTYPE_MONSTER_SAY, false, player, toPosition)
	local spectators = Game.getSpectators(pos, false, true, 3, 3)
		for i = 1, #spectators do
		player:say(msg2, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
	end
	Game.createItem(showItem, 1, pos)
	local tempItem = Tile(pos):getItemById(showItem)
	addEvent(removeShowItem, time, pos, showItem)
	addEvent(Game.createItem, time, 4701, 1, pos)
end