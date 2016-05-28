local effects = {
    {position = Position(170, 107, 5), effect = CONST_ME_TUTORIALARROW},
    {position = Position(63, 141, 5), effect = CONST_ME_TUTORIALARROW},
	{position = Position(45, 156, 4), effect = CONST_ME_TUTORIALARROW},
	{position = Position(128, 192, 4), effect = CONST_ME_TUTORIALARROW},
	{position = Position(184, 187, 4), effect = CONST_ME_TUTORIALARROW},
	{position = Position(236, 133, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(175, 62, 3), effect = CONST_ME_TUTORIALARROW},
	{position = Position(151, 14, 4), effect = CONST_ME_TUTORIALARROW},
    {position = Position(95, 82, 4), effect = CONST_ME_TUTORIALARROW},
    {position = Position(119, 45, 5), effect = CONST_ME_TUTORIALARROW},
	{position = Position(195, 89, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(193, 104, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(177, 55, 7), effect = CONST_ME_TUTORIALARROW},
	{position = Position(170, 124, 7), effect = CONST_ME_TUTORIALARROW},
    {position = Position(153, 161, 7), effect = CONST_ME_TUTORIALARROW},
	{position = Position(170, 124, 7), effect = CONST_ME_TUTORIALARROW},
	{position = Position(146, 162, 6), effect = CONST_ME_TUTORIALARROW},
	{position = Position(175, 124, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(182, 114, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(152, 143, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(154, 147, 7), effect = CONST_ME_TUTORIALARROW},
	{position = Position(58, 212, 8), effect = CONST_ME_TUTORIALARROW},
	{position = Position(48, 268, 7), effect = CONST_ME_TUTORIALARROW},
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