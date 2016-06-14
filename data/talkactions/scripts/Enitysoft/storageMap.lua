function onSay(player, words, param)    
	if not player:getGroup():getAccess() then
		return true
	end
	local target = Player(param)
	updateOutfitStorage(target)
	printStorageMap(target)
end