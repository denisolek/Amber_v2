local effects = {		
	{position = Position(92, 41, 6), text = 'BOSS'},
	{position = Position(94, 41, 6), text = 'BOSS'},
	{position = Position(161, 117, 6), text = 'BOSS'},
	{position = Position(164, 117, 6), text = 'BOSS'},
	{position = Position(131, 78, 9), text = 'BOSS'},
	{position = Position(131, 80, 9), text = 'BOSS'},
	{position = Position(37, 49, 8), text = 'BOSS'},
	{position = Position(37, 51, 8), text = 'BOSS'},
	{position = Position(144, 13, 6), text = 'BOSS'},
    {position = Position(217, 68, 8), text = 'BOSS'},
	{position = Position(217, 71, 8), text = 'BOSS'},
	--HUNTER--
	{position = Position(230, 106, 7), text = 'BOSS'},
	{position = Position(230, 109, 7), text = 'BOSS'},
	--WARRIOR--
	{position = Position(234, 132, 8), text = 'BOSS'},
	{position = Position(236, 132, 8), text = 'BOSS'},
	--BANDIT--
	{position = Position(202, 171, 9), text = 'BOSS'},		   
	{position = Position(217, 198, 8), text = 'BOSS'},
	{position = Position(219, 198, 8), text = 'BOSS'},				
	{position = Position(178, 226, 8), text = 'BOSS'},
	{position = Position(56, 211, 8), text = 'BOSS'},
	{position = Position(40, 122, 6), text = 'BOSS'},   
	{position = Position(37, 157, 6), text = 'BOSS'},
	{position = Position(40, 157, 6), text = 'BOSS'},
	
	{position = Position(165, 213, 10), text = 'CONTINUE QUEST'},
    {position = Position(62, 261, 7), text = 'LORD OF AMBER'},
}

function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end