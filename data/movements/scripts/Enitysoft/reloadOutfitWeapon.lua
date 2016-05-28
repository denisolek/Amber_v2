function onEquip(player, item, slot)
	if player:isPlayer() then
		local outfit = player:getOutfit()
		player:setOutfit(outfit)
	end	
	
	return true
end
