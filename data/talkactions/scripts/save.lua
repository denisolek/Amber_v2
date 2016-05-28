local savingEvent = 0

function onSay(player, words, param)
	if player:getGroup():getAccess() then
			saveServer()
	end
end

function save(delay)
	saveServer()
	if delay > 0 then
		savingEvent = addEvent(save, delay, delay)
	end
end
