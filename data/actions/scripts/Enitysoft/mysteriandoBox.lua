function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1,1000)
	local id = 0
	local count = 0
	local text = ""

	if rand <= 290 then
		id = 7440
		count = 1
		text = "You got amber potion!"
	elseif rand > 290  and rand <= 580 then
		id = 6119
		count = 1
		text = "You got training voucher!"
	elseif rand > 580  and rand <= 870 then	
		id = 3964
		count = 1
		text = "You got premium amber spear!"
	elseif rand > 870  and rand <= 900 then	
		id = 10511
		count = 1
		text = "You got pocket knife!"
	elseif rand > 900  and rand <= 950 then	
		id = 5792
		count = 1
		text = "You got amber dice!"	
	elseif rand > 950 and rand <= 970 then
		id = 6537
		count = 1
		text = "You got amber unban!"
	elseif rand > 970 and rand <= 990 then
		id = 8981
		count = 1
		text = "You got amber gold!"
	elseif rand > 990 and rand <= 998 then	
		id = 10503
		count = 1
		text = "Weeding outfit box! You lucky bastard!"	
	elseif rand > 998 and rand <= 1000 then	
		id = 10553
		count = 1
		text = "Amber heart! You lucky bastard!"	
	else		
		text = "Empty, maybe next time you'll be lucky."	
	end

	if id ~= 0 then
		player:addItem(id, count)
	end

	player:sendTextMessage(MESSAGE_INFO_DESCR, text)
	doRemoveItem(item.uid, 1)
return true
end