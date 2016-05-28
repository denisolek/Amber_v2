poiTPTab = {
	[1] = {aid = 20300, x=165, y=209, z=10},
	[2] = {aid = 20301, x=215, y=228, z=10},
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	-- tu zmenić na ilość w tablicy
	for i = 1, 2, 1 do
		if item:getActionId() == poiTPTab[i].aid then
			local tpPos = Position(poiTPTab[i].x, poiTPTab[i].y, poiTPTab[i].z)
			player:teleportTo(tpPos, false)
		end
	end
end