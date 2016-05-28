local amberPositions = {
	['poi'] = {position = Position(126, 140, 11)},
	['poi2'] = {position = Position(133, 225, 11)},
	['poi3'] = {position = Position(138, 197, 10)},
	['poi4'] = {position = Position(164, 198, 11)},
	['poi5'] = {position = Position(193, 198, 12)},
	['poi6'] = {position = Position(212, 224, 11)},
	['poi7'] = {position = Position(204, 226, 15)},
	['poi8'] = {position = Position(164, 235, 12)},
	['poir'] = {position = Position(136, 211, 9)},
	['ani'] = {position = Position(125, 131, 8)},
	['ani2'] = {position = Position(120, 110, 8)},
	['anir'] = {position = Position(125, 108, 9)},
	['bethia'] = {position = Position(44,188,9)},
	['bethia2'] = {position = Position(66,161,10)},
	['aberlee'] = {position = Position(31,126,7)},
	['aberlee2'] = {position = Position(36,112,6)},
	['beshata'] = {position = Position(23,50,9)},
	['beshata2'] = {position = Position(53,53,8)},
	['hellscream'] = {position = Position(89,39,8)},
	['hellscream2'] = {position = Position(93,37,7)},
	['ghandaur'] = {position = Position(121,68,11)},
	['ghandaur2'] = {position = Position(131,79,9)},
	['yfrg'] = {position = Position(147,12,5)},
	['yfrg2'] = {position = Position(145,14,6)},
	['sahuan'] = {position = Position(222,51,10)},
	['sahuan2'] = {position = Position(217,69,8)},
	['sellah'] = {position = Position(245,126,7)},
	['sellah2'] = {position = Position(229,107,7)},
	['erathal'] = {position = Position(39,155,4)},
	['erathal2'] = {position = Position(43,164,6)},
	['thall'] = {position = Position(62,204,10)},
	['thall2'] = {position = Position(51,216,9)},
	['sheon'] = {position = Position(190,235,10)},
	['sheon2'] = {position = Position(175,219,8)},
	['archemont'] = {position = Position(217,203,9)},
	['archemont2'] = {position = Position(219,198,8)},
	['rahin'] = {position = Position(212,172,10)},
	['rahin2'] = {position = Position(202,174,7)},
	['apollyon'] = {position = Position(163,108,5)},
	['apollyon2'] = {position = Position(163,117,6)},
	['bhale'] = {position = Position(238,150,10)},
	['bhale2'] = {position = Position(230,132,8)},
	['durak'] = {position = Position(251, 37, 7)},
	['durak2'] = {position = Position(104, 106, 7)}
}

function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if param == '' then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return false
	end
	local value = string.lower(param)
	local pos = amberPositions[value].position
	
	local tmp = player:getPosition()
	if player:teleportTo(pos) and not player:isInGhostMode() then
		tmp:sendMagicEffect(CONST_ME_POFF)
		pos:sendMagicEffect(CONST_ME_TELEPORT)
	end

	return false
end