local showItem = 1284 -- id przedmiotu ktory ma sie pojawic (schodow)
local pos = Position(181, 121, 8) -- pozycja przedmiotu (schodow)
local time = 6 * 1000 -- na ile mają się pojawiać
local msg = 'Passage created !' -- wiadomosc nad uzytym przedmiotem
local fromItem = 1354 -- dzwignia w lewo
local toItem = 1354 -- dzwignia w prawo

local function removeShowItem(position, itemId)
    local removeItem = Tile(position):getItemById(itemId)
    if removeItem then
        removeItem:remove()
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == fromItem then
		item:transform(toItem)
	elseif item:getId() == toItem then
		item:transform(fromItem)
	end
	local tile = Tile(pos)
	local items = tile:getItems()
	if items then
	  for i = 1, #items do
	    if items[i]:getId() == showItem then
	    	return false
	    end
	  end
	end
	player:say(msg, TALKTYPE_MONSTER_SAY, false, player, toPosition)
	Game.createItem(showItem, 1, pos)
	local tempItem = Tile(pos):getItemById(showItem)
	addEvent(removeShowItem, time, pos, showItem)
end