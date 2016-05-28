function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1,100)
	local id = 0
	local count = 0
	local text = ""

	if rand > 5  and rand <= 10 then
		id = 2269
		count = 1
		text = "You got wild growth rune!"
	elseif rand > 10  and rand <= 15 then	
		id = 2310
		count = 1
		text = "You got desintegrate rune!"
	elseif rand > 15  and rand <= 30 then	
		id = 2420
		count = 1
		text = "You got machete!"
	elseif rand > 30  and rand <= 45 then	
		id = 2229
		count = 1
		text = "You got amber skull!"	
	elseif rand > 45 and rand <= 50 then
		id = 2300
		count = 1
		text = "You got instant death rune!"
	elseif rand > 50 and rand <= 55 then
		id = 8474
		count = 1
		text = "You got hyper potion!"
	elseif rand > 55 and rand <= 60 then	
		id = 2100
		count = 1
		text = "You got amber flower!"	
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