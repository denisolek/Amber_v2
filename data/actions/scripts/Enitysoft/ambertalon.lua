function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Randomize = math.random(1, 10)
	local id = 0
	local count = 0
	local text = ""

	if (Randomize == 1) then
		id = 12466
		count = 1
		text = "You got Exp talon!"
	elseif (Randomize == 2) then
		id = 2160
		count = math.random(1, 4)
		if count == 1 then		
			text = "You got "..count.." crystal coin!"
		else
			text = "You got "..count.." crystal coins!"
		end
	elseif (Randomize == 3) then
		id = 2160
		count = math.random(1, 4)
		if count == 1 then		
			text = "You got "..count.." crystal coin!"
		else
			text = "You got "..count.." crystal coins!"
		end
	elseif (Randomize == 4) then
		id = 5944
		count = 1
		text = "You got Amber Orb!"
	elseif (Randomize == 5) then
		id = 5944
		count = 1
		text = "You got Amber Orb!"
	else
		text = "Empty, maybe next time you'll be lucky."
	end

	if Randomize <= 5 then
		doPlayerAddItem(cid, id, count)
	end
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, text)
	doRemoveItem(item.uid, 1)

return true
end