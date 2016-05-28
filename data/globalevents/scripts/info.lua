local effects = {
		{position = Position(152, 143, 8), text = 'DEPO'},	   
	  	{position = Position(154, 147, 7), text = 'DEPO'},
	  	{position = Position(47, 268, 7), text = 'TRAINERS'},
	  	{position = Position(44, 254, 7), text = '[12H]'},
	  	{position = Position(48, 254, 7), text = '[8H]'},
	  	{position = Position(52, 254, 7), text = '[4H] '},
	  	{position = Position(41, 256, 7), text = 'WEAPONS'},
	  	{position = Position(59, 257, 7), text = 'ARCHER'},
	  	{position = Position(58, 264, 7), text = 'AOL'},
	  	{position = Position(57, 254, 7), text = 'RINGS'},
	  	{position = Position(51, 268, 7), text = 'PROMOTION'},
	   	{position = Position(55, 268, 7), text = 'ADDONS'},
	   	{position = Position(69, 260, 7), text = 'SPEAR 5cc'},
	   	{position = Position(73, 260, 7), text = 'SPEAR 5cc'},
	   	{position = Position(77, 260, 7), text = 'SPEAR 5cc'},
	   	{position = Position(81, 260, 7), text = 'SPEAR 5cc'},
		{position = Position(85, 260, 7), text ='SPEAR 5cc'},
	   	{position = Position(89, 260, 7), text = 'SPEAR 5cc'},
	   	{position = Position(93, 260, 7), text = 'SPEAR 5cc'},
	   	{position = Position(97, 260, 7), text = 'SPEAR 5cc'},
	   	{position = Position(101, 260, 7), text = 'SPEAR 5cc'},
		{position = Position(105, 260, 7), text ='SPEAR 5cc'},   
		
		{position = Position(91, 262, 7), text = 'GMP3k100'},
		{position = Position(95, 262, 7), text = 'GMP3k100'},
		{position = Position(99, 262, 7), text = 'GMP3k100'},
		{position = Position(103, 262, 7), text = 'GMP3k100'},
		{position = Position(107, 262, 7), text = 'GMP3k100'},
		
		{position = Position(91, 264, 7), text = 'GMP3k100'},
		{position = Position(95, 264, 7), text = 'GMP3k100'},
		{position = Position(99, 264, 7), text = 'GMP3k100'},
		{position = Position(103, 264, 7), text = 'GMP3k100'},
		{position = Position(107, 264, 7), text = 'GMP3k100'},
		
		{position = Position(91, 266, 7), text = 'GMP3k100'},
		{position = Position(95, 266, 7), text = 'GMP3k100'},
		{position = Position(99, 266, 7), text = 'GMP3k100'},
		{position = Position(103, 266, 7), text = 'GMP3k100'},
		{position = Position(107, 266, 7), text = 'GMP3k100'},
				
		{position = Position(169, 214, 10), text = 'EXIT'},			
				
	    {position = Position(45, 255, 7), effect = CONST_ME_TUTORIALSQUARE},
	    {position = Position(49, 255, 7), effect = CONST_ME_TUTORIALSQUARE},
	    {position = Position(53, 255, 7), effect = CONST_ME_TUTORIALSQUARE},
	    {position = Position(57, 255, 7), effect = CONST_ME_TUTORIALSQUARE},
	    {position = Position(58, 257, 7), effect = CONST_ME_TUTORIALSQUARE},
		{position = Position(58, 265, 7), effect = CONST_ME_TUTORIALSQUARE},
		{position = Position(56, 267, 7), effect = CONST_ME_TUTORIALSQUARE},
		{position = Position(52, 267, 7), effect = CONST_ME_TUTORIALSQUARE},
}

function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                Game.sendAnimatedText(settings.text, settings.position, TEXTCOLOR_WHITE_EXP)
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end