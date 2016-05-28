
function onSay(cid, words, param, channel) 
local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end	

local pos =player:getPosition()
for _, cid in ipairs(Game.getPlayers()) do 
	doTeleportThing(cid, pos)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "All players have been teleported.")
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS) 
end
return TRUE
end 