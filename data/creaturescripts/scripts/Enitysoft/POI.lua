local bosses = {
	['son of verminor'] = 200,
	['the gashar'] = 201,
	['skuerom'] = 202,
	['muosur'] = 203,
	['afaedal'] = 204,
	['aateanun'] = 205,
	['sori'] = 206,
	['tomb'] = 207,
	['the dead vision'] = 208,
	['scaldor'] = 209,
	['ora'] = 210,
	['chasey'] = 211,
	['aeran'] = 212,
	['the silver shadow'] = 213,
	['masrahn'] = 214
}

-- SON OF VERMINOR (pojawianie się przemiotu/kratki/ściany)
local itemVerminor = 1284 -- id przedmiotu ktory ma sie pojawic (kładka)
local posVerminor = Position(134, 206, 11) -- pozycja przedmiotu (kładki)
local timeVerminor = 600 * 1000 -- na ile mają się pojawiać
local moveVerminor = Position(134, 205, 11) -- pozycja do ktorej ma tp po zniknieciu kladki

-- MUOSUR (pojawianie się przemiotu/kratki/ściany)
local itemMuosur = 3687 -- id przedmiotu ktory ma sie pojawic (kładka)
local posMuosur = Position(215, 203, 12) -- pozycja przedmiotu (kładki)
local timeMuosur = 600 * 1000 -- na ile mają się pojawiać

-- AFAEDAL (pojawianie się przemiotu/kratki/ściany)
local itemAfaedal = 3687 -- id przedmiotu ktory ma sie pojawic (kładka)
local posAfaedal = Position(216, 204, 11) -- pozycja przedmiotu (kładki)
local timeAfaedal = 600 * 1000 -- na ile mają się pojawiać

-- TOMB (pojawianie się przemiotu/kratki/ściany)
local itemTomb = 4835 -- id przedmiotu ktory ma sie pojawic (kładka)
local posTomb = Position(209, 239, 12) -- pozycja przedmiotu (kładki)
local timeTomb = 600 * 1000 -- na ile mają się pojawiać
local newTomb = 419

-- SCALDOR (pojawianie się przemiotu/kratki/ściany)
local itemScaldor = 407 -- id przedmiotu ktory ma sie pojawic (kładka)
local posScaldor = Position(165, 229, 13) -- pozycja przedmiotu (kładki)
local timeScaldor = 600 * 1000 -- na ile mają się pojawiać
local moveScaldor = Position(165, 228, 13) -- pozycja do ktorej ma tp po zniknieciu kladki

-- ORA (pojawianie się przemiotu/kratki/ściany)
local itemOra = 1386 -- id przedmiotu ktory ma sie pojawic (kładka)
local posOra = Position(172, 238, 12) -- pozycja przedmiotu (kładki)
local timeOra = 600 * 1000 -- na ile mają się pojawiać

-- CHASEY (pojawianie się przemiotu/kratki/ściany)
local itemChasey = 1386 -- id przedmiotu ktory ma sie pojawic (kładka)
local posChasey = Position(162, 241, 11) -- pozycja przedmiotu (kładki)
local timeChasey = 600 * 1000 -- na ile mają się pojawiać

-- AERAN (pojawianie się przemiotu/kratki/ściany)
local wallAeran = 1547 -- id przedmiotu ktory ma znikać
local posAeran = Position(151, 240, 10) -- pozycja przedmiotu (kładki)
local timeAeran = 600 * 1000 -- na ile mają się pojawiać
local msgAeranWall = 'OPEN'



-- THE GASHAR (znikanie przemiotu, kratki, ściany)
local wallGashar = 9485
local posGashar1 = Position(163, 201, 10) -- pozycja ściany 
local posGashar2 = Position(164, 201, 10) -- pozycja ściany
local posGashar3 = Position(165, 201, 10) -- pozycja ściany
local posGashar4 = Position(166, 201, 10) -- pozycja ściany
local posGashar5 = Position(167, 201, 10) -- pozycja ściany
local timeGashar = 600*1000 -- na ile maja znikać
local msgGasharWall = 'OPEN' -- wiadomość nad znikajcymi ścianami

-- SKUEROM (znikanie przemiotu, kratki, ściany)
local wallSkueron = 5452
local posSkueron = Position(193, 201, 11) -- pozycja ściany 

local timeSkueron = 600*1000 -- na ile maja znikać
local msgSkueronWall = 'OPEN' -- wiadomość nad znikajcymi ścianami

-- AATEANUN (znikanie przemiotu, kratki, ściany)
local wallAateanun = 3362
local posAateanun = Position(215, 209, 10) -- pozycja ściany 

local timeAateanun = 600*1000 -- na ile maja znikać
local msgAateanunWall = 'OPEN' -- wiadomość nad znikajcymi ścianami

-- SORI (znikanie przemiotu, kratki, ściany)
local wallSori = 3375
local posSori = Position(212, 224, 10) -- pozycja ściany 

local timeSori = 600*1000 -- na ile maja znikać
local msgSoriWall = 'OPEN' -- wiadomość nad znikajcymi ścianami

-- THE DEAD VISION (znikanie przemiotu, kratki, ściany)
local wallDeadvision = 9485
local posDeadvision1 = Position(206, 231, 13) -- pozycja ściany 
local posDeadvision2 = Position(207, 231, 13) -- pozycja ściany 
local timeDeadvision = 600*1000 -- na ile maja znikać
local msgDeadvisionWall = 'OPEN' -- wiadomość nad znikajcymi ścianami

-- SKUEROM (znikanie przemiotu, kratki, ściany)
local wallSilvershadow = 11999
local posSilvershadow = Position(152, 228, 11) -- pozycja ściany 

local timeSilvershadow = 600*1000 -- na ile maja znikać
local msgSilvershadowWall = 'OPEN' -- wiadomość nad znikajcymi ścianami

-- MASRAHN (znikanie przemiotu, kratki, ściany)
local wallMasrahn = 9127
local posMasrahn = Position(120, 111, 8) -- pozycja ściany 
local msgMasrahnWall = 'OPEN' -- wiadomość nad znikajcymi ścianami


local function removeShowItem(position, itemId)
    local removeItem = Tile(position):getItemById(itemId)
    if removeItem then
        removeItem:remove()
    end
end

local function removeShowItemCreate(pos, id, newItem)
    local removeItem = Tile(pos):getItemById(id)
    if removeItem and removeItem:getId() == id then
        removeItem:remove()
        Game.createItem(newItem, 1, pos)
    end
end

local function tpFromRemoved(posFrom, posTo)
	local tile = Tile(posFrom)
	local tileCreatures = tile:getCreatures()
	print(tileCreatures)
	if tileCreatures then
	  for i = 1, #tileCreatures do
	  	local creature = tileCreatures[i]
	  	creature:teleportTo(posTo,true)
	  end
	end
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	if creature:isMonster() == 0 then
		return true
	end

	local targetName = creature:getName():lower()
	local bossStorage = bosses[targetName]
	if not bossStorage then
		return true
	end

	-- SON OF VERMINOR
	if bossStorage == 200 then
		local tile = Tile(posVerminor)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemVerminor then
		    	return false
		    end
		  end
		end
		Game.createItem(itemVerminor, 1, posVerminor)
		addEvent(removeShowItem, timeVerminor, posVerminor, itemVerminor)	
		addEvent(tpFromRemoved, timeVerminor, posVerminor, moveVerminor)
	end

	-- MUOSUR
	if bossStorage == 203 then
		local tile = Tile(posMuosur)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemMuosur then
		    	return false
		    end
		  end
		end
		Game.createItem(itemMuosur, 1, posMuosur)
		addEvent(removeShowItem, timeMuosur, posMuosur, itemMuosur)	
	end
	
	-- AFAEDAL
	if bossStorage == 204 then
		local tile = Tile(posAfaedal)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemAfaedal then
		    	return false
		    end
		  end
		end
		Game.createItem(itemAfaedal, 1, posAfaedal)
		addEvent(removeShowItem, timeAfaedal, posAfaedal, itemAfaedal)	
	end
	
	-- TOMB
	if bossStorage == 207 then
		local tile = Tile(posTomb)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemTomb then
		    	return false
		    end
		  end
		end
		Game.createItem(itemTomb, 1, posTomb)
		addEvent(removeShowItemCreate, timeTomb, posTomb, itemTomb, newTomb)	
	end
	
	-- SCALDOR		
	if bossStorage == 209 then
		local tile = Tile(posScaldor)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemScaldor then
		    	return false
		    end
		  end
		end
		Game.createItem(itemScaldor, 1, posScaldor)
		addEvent(removeShowItem, timeScaldor, posScaldor, itemScaldor)	
		addEvent(tpFromRemoved, timeScaldor, posScaldor, moveScaldor)
	end
	
	-- ORA
	if bossStorage == 210 then
		local tile = Tile(posOra)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemOra then
		    	return false
		    end
		  end
		end
		Game.createItem(itemOra, 1, posOra)
		addEvent(removeShowItem, timeOra, posOra, itemOra)	
	end
				
	-- CHASEY
	if bossStorage == 211 then
		local tile = Tile(posChasey)
		local items = tile:getItems()
		if items then
		  for i = 1, #items do
		    if items[i]:getId() == itemChasey then
		    	return false
		    end
		  end
		end
		Game.createItem(itemChasey, 1, posChasey)
		addEvent(removeShowItem, timeChasey, posChasey, itemChasey)	
	end
				
	-- AERAN
	if bossStorage == 212 then
		local wallItemAeran = Tile(posAeran):getItemById(wallAeran)
		if wallItemAeran then
			wallItemAeran:remove()
			addEvent(Game.createItem, timeAeran, wallAeran, 1, posAeran)
			local spectators = Game.getSpectators(posAeran, false, true, 7, 7)
				for i = 1, #spectators do
				spectators[i]:say(msgAeranWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posAeran)
				end
		end
	end
	
	-- THE GASHAR
	if bossStorage == 201 then
		local wallItem1 = Tile(posGashar1):getItemById(wallGashar)
		local wallItem2 = Tile(posGashar2):getItemById(wallGashar)
		local wallItem3 = Tile(posGashar3):getItemById(wallGashar)
		local wallItem4 = Tile(posGashar4):getItemById(wallGashar)
		local wallItem5 = Tile(posGashar5):getItemById(wallGashar)

		if wallItem1 then
			wallItem1:remove()
			addEvent(Game.createItem, timeGashar, wallGashar, 1, posGashar1)
			local spectators = Game.getSpectators(posGashar1, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgGasharWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posGashar1)
			end
		end
		if wallItem2 then
			wallItem2:remove()
			addEvent(Game.createItem, timeGashar, wallGashar, 1, posGashar2)
			local spectators = Game.getSpectators(posGashar2, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgGasharWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posGashar2)
			end
		end
		if wallItem3 then
			wallItem3:remove()
			addEvent(Game.createItem, timeGashar, wallGashar, 1, posGashar3)
			local spectators = Game.getSpectators(posGashar3, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgGasharWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posGashar3)
			end
		end
		
		if wallItem4 then
			wallItem4:remove()
			addEvent(Game.createItem, timeGashar, wallGashar, 1, posGashar4)
			local spectators = Game.getSpectators(posGashar4, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgGasharWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posGashar4)
			end
		end
		if wallItem5 then
			wallItem5:remove()
			addEvent(Game.createItem, timeGashar, wallGashar, 1, posGashar5)
			local spectators = Game.getSpectators(posGashar5, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgGasharWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posGashar5)
			end
		else
			return false
		end
	end
	
	-- SKUERON
	if bossStorage == 202 then
		local wallItem1 = Tile(posSkueron):getItemById(wallSkueron)

		if wallItem1 then
			wallItem1:remove()
			addEvent(Game.createItem, timeSkueron, wallSkueron, 1, posSkueron)
			local spectators = Game.getSpectators(posSkueron1, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgGasharWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posSkueron)
			end
		else
			return false
		end
	end
	
	-- AATEANUN
	if bossStorage == 205 then
		local wallItem1 = Tile(posAateanun):getItemById(wallAateanun)

		if wallItem1 then
			wallItem1:remove()
			addEvent(Game.createItem, timeAateanun, wallAateanun, 1, posAateanun)
			local spectators = Game.getSpectators(posAateanun, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgAateanunWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posAateanun)
			end
		else
			return false
		end
	end
	
	-- SORI
	if bossStorage == 206 then
		local wallItem1 = Tile(posSori):getItemById(wallSori)

		if wallItem1 then
			wallItem1:remove()
			addEvent(Game.createItem, timeSori, wallSori, 1, posSori)
			local spectators = Game.getSpectators(posSori, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgSoriWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posSori)
			end
		else
			return false
		end
	end
	
	-- DEADVISION
	if bossStorage == 208 then
		local wallItem1 = Tile(posDeadvision1):getItemById(wallDeadvision)
		local wallItem2 = Tile(posDeadvision2):getItemById(wallDeadvision)

		if wallItem1 then
			wallItem1:remove()
			addEvent(Game.createItem, timeDeadvision, wallDeadvision, 1, posDeadvision1)
			local spectators = Game.getSpectators(posDeadvision1, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgDeadvisionWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posDeadvision1)
			end
		end
		if wallItem2 then
			wallItem2:remove()
			addEvent(Game.createItem, timeDeadvision, wallDeadvision, 1, posDeadvision2)
			local spectators = Game.getSpectators(posDeadvision2, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgDeadvisionWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posDeadvision2)
			end
		else
			return false
		end
	end

	-- THE SILVER SHADOW
	if bossStorage == 213 then
		local wallItem1 = Tile(posSilvershadow):getItemById(wallSilvershadow)

		if wallItem1 then
			wallItem1:remove()
			addEvent(Game.createItem, timeSilvershadow, wallSilvershadow, 1, posSilvershadow)
			local spectators = Game.getSpectators(posSilvershadow, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgSilvershadowWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posSilvershadow)
			end
		else
			return false
		end
	end
	
	-- MASRAHN
	if bossStorage == 214 then
		local wallItem1 = Tile(posMasrahn):getItemById(wallMasrahn)

		if wallItem1 then
			wallItem1:remove()
			local spectators = Game.getSpectators(posMasrahn, false, true, 3, 3)
				for i = 1, #spectators do
				spectators[i]:say(msgMasrahnWall, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], posMasrahn)
			end
		else
			return false
		end
	end

	
	return true
end