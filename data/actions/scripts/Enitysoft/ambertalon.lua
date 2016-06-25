local addonItems = {
		{id = 7140, count = 1, name = "Ghandaur Horn"},
		{id = 2401, count = 1, name = "Amber Staff"},
		{id = 5802, count = 1, name = "Bottle with a message"},
		{id = 11426, count = 1, name = "Aberlee Sabre"},
		{id = 11424, count = 1, name = "Aberlee Hat"},
		{id = 11423, count = 1, name = "Amber Comb"},
		{id = 2424, count = 1, name = "Silver Mace"},
		{id = 10575, count = 1, name = "Thall Pelt"},
		{id = 7386, count = 1, name = "Dethraze Sword"},
		{id = 2342, count = 1, name = "Apollyon Helmet"},
		{id = 7413, count = 1, name = "Faithkeeper"},
		{id = 7457, count = 1, name = "Erathal Boots"},
		{id = 10020, count = 1, name = "Bhale Claw"},
		{id = 7417, count = 1, name = "Shadowsteel"},
		{id = 9735, count = 1, name = "Nightmare Helmet"},
		{id = 2414, count = 1, name = "Nightmare Weapon"},
		{id = 10562, count = 1, name = "Sellah Hood"},
		{id = 5875, count = 1, name = "Sellah Gloves"},
		{id = 9678, count = 1, name = "Amber Satin"},
		{id = 7405, count = 1, name = "Trinity Sword"},
		{id = 5954, count = 1, name = "Demon Horn"},
		{id = 5906, count = 1, name = "Demon Dust"},
		{id = 2186, count = 1, name = "Amber Rod"},
		{id = 10570, count = 1, name = "Martha Hat"},
		{id = 6546, count = 1, name = "Sahuan's Eye"},
		{id = 8865, count = 1, name = "Tylian Cape"},
		{id = 3967, count = 1, name = "Shaman Mask"},
		{id = 3955, count = 1, name = "Voodoo Doll"},
		{id = 8922, count = 1, name = "Voodoo Staff"},
		{id = 12431, count = 1, name = "Richter Cape"},
		{id = 9969, count = 1, name = "Black Amber Skull"},
		{id = 11228, count = 1, name = "Bethia Teeth"},
		{id = 11234, count = 1, name = "Bethia Fur"}
}

local basicItems = {
	knight = {
		{id = 2462, count = 1, name = "Basic Knight Helmet1"},
		{id = 2475, count = 1, name = "Basic Knight Helmet2"},
		{id = 2476, count = 1, name = "Basic Knight Armor"},
		{id = 2477, count = 1, name = "Basic Knight Legs"},
		{id = 2195, count = 1, name = "Boots of Haste"},
		{id = 2645, count = 1, name = "Steel Boots"},
		{id = 2528, count = 1, name = "Basic Shield1"},
		{id = 2521, count = 1, name = "Basic Shield2"},
		{id = 11307, count = 1, name = "Basic Sword"},
		{id = 7380, count = 1, name = "Basic Axe"},
		{id = 7409, count = 1, name = "Basic Club"}
	},
	paladin = {
		{id = 7462, count = 1, name = "Basic Paladin Helmet"},
		{id = 8872, count = 1, name = "Basic Paladin Cape"},
		{id = 2647, count = 1, name = "Basic Paladin legs"},
		{id = 2195, count = 1, name = "Boots of Haste"},
		{id = 2528, count = 1, name = "Basic Shield1"},
		{id = 2521, count = 1, name = "Basic Shield2"},
		{id = 8849, count = 1, name = "Basic Crossbow"},
		{id = 2399, count = 50, name = "Basic Star"},
		{id = 7363, count = 500, name = "Basic Bolt"}
	},
	mages = {
		{id = 8820, count = 1, name = "Basic Mage Hat"},
		{id = 8819, count = 1, name = "Basic Mage Cloak"},
		{id = 2468, count = 1, name = "Basic Mage Legs"},
		{id = 2195, count = 1, name = "Boots of Haste"},
		{id = 8902, count = 1, name = "Basic Spellbook"},
		{id = 2184, count = 1, name = "Basic Wand"}		
	}
}

local heroItems = {
	knight = {
		{id = 2497, count = 1, name = "Hero Knight Helmet"},
		{id = 2503, count = 1, name = "Hero Knight Armor"},
		{id = 2504, count = 1, name = "Hero Knight Legs"},
		{id = 11303, count = 1, name = "Hero Speed Shoes"},
		{id = 11240, count = 1, name = "Guardian Boots"},
		{id = 2515, count = 1, name = "Hero Knight Shield"},
		{id = 2539, count = 1, name = "Phoenix Shield"},
		{id = 12649, count = 1, name = "Hero Sword"},
		{id = 7434, count = 1, name = "Hero Axe"},
		{id = 7422, count = 1, name = "Hero Club"}
	},
	paladin = {
		{id = 2491, count = 1, name = "Hero Paladin Helmet"},
		{id = 2487, count = 1, name = "Hero Paladin Armor"},
		{id = 2488, count = 1, name = "Hero Paladin Legs"},
		{id = 11303, count = 1, name = "Hero Speed Shoes"},
		{id = 2539, count = 1, name = "Phoenix Shield"},
		{id = 8852, count = 1, name = "Hero Crossbow"},
		{id = 7366, count = 50, name = "Hero Star"},
		{id = 2547, count = 500, name = "Hero Bolt"}
	},
	mages = {
		{id = 2323, count = 1, name = "Hero Mage Hat"},
		{id = 8870, count = 1, name = "Hero Mage Cloak"},
		{id = 7730, count = 1, name = "Hero Mage Legs"},
		{id = 11303, count = 1, name = "Hero Speed Shoes"},
		{id = 8900, count = 1, name = "Hero Spellbook"},
		{id = 12648, count = 1, name = "Hero Wand"}
	}
}


local warlordItems = {
	knight = {
		{id = 2497, count = 1, name = "Warlord Knight Helmet"},
		{id = 2466, count = 1, name = "Warlord Knight Armor"},
		{id = 2470, count = 1, name = "Warlord Legs"},
		{id = 12646, count = 1, name = "Warlord Boots"},
		{id = 2542, count = 1, name = "Tempest Shield"},
		{id = 12644, count = 1, name = "Warlord Knight Shield"},
		{id = 8931, count = 1, name = "Warlord Sword"},
		{id = 8925, count = 1, name = "Warlord Axe"},
		{id = 8929, count = 1, name = "Warlord Club"}
	},
	paladin = {
		{id = 2498, count = 1, name = "Warlord Paladin Helmet"},
		{id = 8891, count = 1, name = "Warlord Paladin Armor"},
		{id = 2470, count = 1, name = "Warlord Legs"},
		{id = 12646, count = 1, name = "Warlord Boots"},
		{id = 2542, count = 1, name = "Tempest Shield"},
		{id = 8853, count = 1, name = "Warlord Crossbow"},
		{id = 7368, count = 50, name = "Assassin Star"}
	},
	mages = {
		{id = 10016, count = 1, name = "Warlord Mage Hat"},
		{id = 2656, count = 1, name = "Warlord Mage Robe"},
		{id = 2470, count = 1, name = "Warlord Legs"},
		{id = 8904, count = 1, name = "Warlord Spellbook"},
		{id = 12646, count = 1, name = "Warlord Boots"},
		{id = 12327, count = 1, name = "Warlord Wand"}
	}
}

local ringItems = {
	normal = {
		{id = 2209, count = 1, name = "Basic Ring"},
		{id = 2008, count = 1, name = "Hero Ring"},
		{id = 2007, count = 1, name = "Warlord Ring"}
	},	
	magic = {
		{id = 2166, count = 1, name = "Basic Magic Ring"},
		{id = 2213, count = 1, name = "Hero Magic Ring"},
		{id = 2214, count = 1, name = "Warlord Magic Ring"}
	}
}

local amuletItems = {
	{id = 2172, count = 1, name = "Basic Amulet"},
	{id = 2131, count = 1, name = "Hero Amulet"},
	{id = 2130, count = 1, name = "Warlord Amulet"}
}



function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1,1000)
	local id = 0
	local count = 0
	local text = ""
	local playerVoc = player:getVocation():getId()

	if rand > 0  and rand <= 10 then -- amulet 1%
		local randItem = math.random(1,#amuletItems)
		id = amuletItems[randItem].id
		count = amuletItems[randItem].count
		name = amuletItems[randItem].name		
	elseif rand > 10  and rand <= 20 then	-- ring 1%
		if isKnight(player.uid, playerVoc) or isPaladin(player.uid, playerVoc) then
			local randItem = math.random(1,#ringItems.normal)
			id = ringItems.normal[randItem].id
			count = ringItems.normal[randItem].count
			name = ringItems.normal[randItem].name	
		elseif isDruid(player.uid, playerVoc) or isSorcerer(player.uid, playerVoc) then
			local randItem = math.random(1,#ringItems.magic)
			id = ringItems.magic[randItem].id
			count = ringItems.magic[randItem].count
			name = ringItems.magic[randItem].name	
		end
	elseif rand > 20  and rand <= 80 then	-- basic 6%
		if isKnight(player.uid, playerVoc) then
			local randItem = math.random(1,#basicItems.knight)
			id = basicItems.knight[randItem].id
			count = basicItems.knight[randItem].count
			name = basicItems.knight[randItem].name	
		elseif isPaladin(player.uid, playerVoc) then
			local randItem = math.random(1,#basicItems.paladin)
			id = basicItems.paladin[randItem].id
			count = basicItems.paladin[randItem].count
			name = basicItems.paladin[randItem].name	
		elseif isDruid(player.uid, playerVoc) or isSorcerer(player.uid, playerVoc) then
			local randItem = math.random(1,#basicItems.mages)
			id = basicItems.mages[randItem].id
			count = basicItems.mages[randItem].count
			name = basicItems.mages[randItem].name	
		end
	elseif rand > 80  and rand <= 110 then	-- hero 3%
		if isKnight(player.uid, playerVoc) then
			local randItem = math.random(1,#heroItems.knight)
			id = heroItems.knight[randItem].id
			count = heroItems.knight[randItem].count
			name = heroItems.knight[randItem].name	
		elseif isPaladin(player.uid, playerVoc) then
			local randItem = math.random(1,#heroItems.paladin)
			id = heroItems.paladin[randItem].id
			count = heroItems.paladin[randItem].count
			name = heroItems.paladin[randItem].name	
		elseif isDruid(player.uid, playerVoc) or isSorcerer(player.uid, playerVoc) then
			local randItem = math.random(1,#heroItems.mages)
			id = heroItems.mages[randItem].id
			count = heroItems.mages[randItem].count
			name = heroItems.mages[randItem].name	
		end
	elseif rand > 110 and rand <= 101 then -- warlord 0.1%
		if isKnight(player.uid, playerVoc) then
			local randItem = math.random(1,#warlordItems.knight)
			id = warlordItems.knight[randItem].id
			count = warlordItems.knight[randItem].count
			name = warlordItems.knight[randItem].name	
		elseif isPaladin(player.uid, playerVoc) then
			local randItem = math.random(1,#warlordItems.paladin)
			id = warlordItems.paladin[randItem].id
			count = warlordItems.paladin[randItem].count
			name = warlordItems.paladin[randItem].name	
		elseif isDruid(player.uid, playerVoc) or isSorcerer(player.uid, playerVoc) then
			local randItem = math.random(1,#warlordItems.mages)
			id = warlordItems.mages[randItem].id
			count = warlordItems.mages[randItem].count
			name = warlordItems.mages[randItem].name	
		end
	elseif rand > 101 and rand <= 102 then -- addon 0.1%
		local randItem = math.random(1,#addonItems)
		id = addonItems[randItem].id
		count = addonItems[randItem].count
		name = addonItems[randItem].name		
	elseif rand > 102 and rand <= 252 then -- amber flower 15%
		id = 2100
		count = 1
		text = "Amber Flower"	
	elseif rand > 252 and rand <= 262 then -- exp scroll 1%
		id = 12466
		count = 1
		text = "Experience Scroll"
	elseif rand > 262 and rand <= 462 then -- crystal coin 20%
		id = 2160
		count = math.random(1, 4)
		if count == 1 then		
			text = count.." Crystal Coin"
		else
			text = count.." Crystal Coins"
		end
	else	
		text = "Empty, maybe next time you'll be lucky."	
	end

	if id ~= 0 then
		player:addItem(id, count)
		local rewardMSG = "Amber Talon reward: "..text
		player:sendTextMessage(MESSAGE_INFO_DESCR, rewardMSG)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, text)
	end

	doRemoveItem(item.uid, 1)

	return true
end