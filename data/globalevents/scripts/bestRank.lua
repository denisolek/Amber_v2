function getTop3Players()
	db.query("UPDATE `guild_wars` SET `status` = 4, `ended` = " .. os.time() .. " WHERE `status` = 1 AND (`started` + 1*86400) < " .. os.time())
	local player1 = {0,-1}
	local player2 = {0,-1}
	local player3 = {0,-1}
	local top3text = "Top 3 online:"
	local players = getOnlinePlayers()

	for i, cid in ipairs(players) do
		local player = Player(cid)
		if player:getStorageValue(9000) > player1[2] then
			player3 = {player2[1], player2[2]}
			player2 = {player1[1], player1[2]}
			player1 = {cid, player:getStorageValue(9000)}
		elseif player:getStorageValue(9000) > player2[2] then
			player3 = {player2[1], player2[2]}
			player2 = {cid, player:getStorageValue(9000)}
		elseif player:getStorageValue(9000) > player3[2] then
			player3 = {cid, player:getStorageValue(9000)}
		end
	end
	if player1[1] ~= nil then
		top3text = top3text .. "\n1. " .. getCreatureName(player1[1]) .. " - " .. player1[2] .. " AGR"
	end
	if player2[1] ~= nil then
		top3text = top3text .. "\n2. " .. getCreatureName(player2[1]) .. " - " .. player2[2] .. " AGR"
	end
	if player3[1] ~= nil then
		top3text = top3text .. "\n3. " .. getCreatureName(player3[1]) .. " - " .. player3[2] .. " AGR"
	end
	return top3text
end

function onThink(interval, lastExecution)
	local check = getOnlinePlayers()
	if #check >= 3 then
		broadcastMessage(getTop3Players(), MESSAGE_STATUS_WARNING)
	end
	return TRUE
end