function onSay(player, words, param)    
	
	if not player:getGroup():getAccess() then
		return true
	end

	for _, allOnline in ipairs(Game.getPlayers()) do
    	allOnline:sendTextMessage(MESSAGE_EVENT_ADVANCE, "1x Amber Potion has been added to your character. Check backpack and use it :)")
		    allOnline:addItem(7440, 1)
	end

end