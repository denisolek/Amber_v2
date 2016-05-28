-- Without Rookgaard
local config = {
		[1] = {
				--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
				items = {{2516, 1}, {2433, 1}, {2654, 1}, {2662, 1}, {2649, 1}, {2643, 1}, {2661, 1}},
				--container rope, shovel, mana potion
				container = {{7589, 100}, {2304, 30}, {2268, 60}, {2273, 60}, {2293, 30}, {2305, 6}, {2261, 6}, {2789, 20}}
		},
		[2] = {
				--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
				items = {{2516, 1}, {2433, 1}, {2654, 1}, {2662, 1}, {2649, 1}, {2643, 1}, {2661, 1}},
				--container rope, shovel, mana potion
				container = {{7589, 100}, {2304, 30}, {2268, 60}, {2273, 60}, {2293, 30}, {2305, 6}, {2261, 6}, {2789, 20}}
		},
		[3] = {
				--equipment dwrven shield, 5 spear, ranger's cloak, ranger legs scarf, legion helmet
				items = {{2543, 1}, {2463, 1}, {2648, 1}, {2643, 1}, {2661, 1}, {2457, 1}},
				--container mana potion, shovel, health potion, bow, 50 arrow
				container = {{7589, 100}, {7588, 100}, {2304, 30}, {2313, 60}, {2305, 6}, {2261, 6}, {2293, 30}, {2543, 100}, {2543, 100}, {7589, 20}}
		},
		[4] = {
				--equipment dwarven shield, steel axe, brass armor, brass helmet, brass legs scarf
				items = {{2516, 1}, {2486, 1}, {7461, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
				--container jagged sword, daramian mace, rope, shovel, health potion
				container = {{7449, 1}, {7402, 1}, {3962, 1}, {2454, 1}, {7430, 1},{7415, 1}, {7588, 100}, {7588, 100}, {7620, 100},{2304, 30}, {2313, 60}, {2261, 6},{2305, 6}}
				
		}
}

function onLogin(cid)
	local player = Player(cid)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end