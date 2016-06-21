-- ENITYSOFT OUTFIT BONUS-----------------------------------------------
local mage_mlvlFull = Condition(CONDITION_ATTRIBUTES)
mage_mlvlFull:setParameter(CONDITION_PARAM_TICKS, -1)
mage_mlvlFull:setParameter(CONDITION_PARAM_SUBID, 100)
mage_mlvlFull:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 10)

local mage_mlvlSecond = Condition(CONDITION_ATTRIBUTES)
mage_mlvlSecond:setParameter(CONDITION_PARAM_TICKS, -1)
mage_mlvlSecond:setParameter(CONDITION_PARAM_SUBID, 108)
mage_mlvlSecond:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 8)

local mage_mlvlNone = Condition(CONDITION_ATTRIBUTES)
mage_mlvlNone:setParameter(CONDITION_PARAM_TICKS, -1)
mage_mlvlNone:setParameter(CONDITION_PARAM_SUBID, 109)
mage_mlvlNone:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 5)

local wizard_resistDeathFull = Condition(CONDITION_ATTRIBUTES)
wizard_resistDeathFull:setParameter(CONDITION_PARAM_TICKS, -1)
wizard_resistDeathFull:setParameter(CONDITION_PARAM_SUBID, 101)

local wizard_resistDeathFirst = Condition(CONDITION_ATTRIBUTES)
wizard_resistDeathFirst:setParameter(CONDITION_PARAM_TICKS, -1)
wizard_resistDeathFirst:setParameter(CONDITION_PARAM_SUBID, 102)

local wizard_resistDeathSecond = Condition(CONDITION_ATTRIBUTES)
wizard_resistDeathSecond:setParameter(CONDITION_PARAM_TICKS, -1)
wizard_resistDeathSecond:setParameter(CONDITION_PARAM_SUBID, 103)

local wizard_resistDeathNone = Condition(CONDITION_ATTRIBUTES)
wizard_resistDeathNone:setParameter(CONDITION_PARAM_TICKS, -1)
wizard_resistDeathNone:setParameter(CONDITION_PARAM_SUBID, 104)

local knight_resistAllFull = Condition(CONDITION_ATTRIBUTES)
knight_resistAllFull:setParameter(CONDITION_PARAM_TICKS, -1)
knight_resistAllFull:setParameter(CONDITION_PARAM_SUBID, 105)

local knight_resistAllFirst = Condition(CONDITION_ATTRIBUTES)
knight_resistAllFirst:setParameter(CONDITION_PARAM_TICKS, -1)
knight_resistAllFirst:setParameter(CONDITION_PARAM_SUBID, 106)

local knight_resistAllNone = Condition(CONDITION_ATTRIBUTES)
knight_resistAllNone:setParameter(CONDITION_PARAM_TICKS, -1)
knight_resistAllNone:setParameter(CONDITION_PARAM_SUBID, 107)

local nightmare_resistAllFull = Condition(CONDITION_ATTRIBUTES)
nightmare_resistAllFull:setParameter(CONDITION_PARAM_TICKS, -1)
nightmare_resistAllFull:setParameter(CONDITION_PARAM_SUBID, 108)

local nightmare_resistAllFirst = Condition(CONDITION_ATTRIBUTES)
nightmare_resistAllFirst:setParameter(CONDITION_PARAM_TICKS, -1)
nightmare_resistAllFirst:setParameter(CONDITION_PARAM_SUBID, 109)

local nightmare_resistAllSecond = Condition(CONDITION_ATTRIBUTES)
nightmare_resistAllSecond:setParameter(CONDITION_PARAM_TICKS, -1)
nightmare_resistAllSecond:setParameter(CONDITION_PARAM_SUBID, 110)

local nightmare_resistAllNone = Condition(CONDITION_ATTRIBUTES)
nightmare_resistAllNone:setParameter(CONDITION_PARAM_TICKS, -1)
nightmare_resistAllNone:setParameter(CONDITION_PARAM_SUBID, 111)

local demonhunter_resistDeathFull = Condition(CONDITION_ATTRIBUTES)
demonhunter_resistDeathFull:setParameter(CONDITION_PARAM_TICKS, -1)
demonhunter_resistDeathFull:setParameter(CONDITION_PARAM_SUBID, 112)

local demonhunter_resistDeathFirst = Condition(CONDITION_ATTRIBUTES)
demonhunter_resistDeathFirst:setParameter(CONDITION_PARAM_TICKS, -1)
demonhunter_resistDeathFirst:setParameter(CONDITION_PARAM_SUBID, 113)

local demonhunter_resistDeathSecond = Condition(CONDITION_ATTRIBUTES)
demonhunter_resistDeathSecond:setParameter(CONDITION_PARAM_TICKS, -1)
demonhunter_resistDeathSecond:setParameter(CONDITION_PARAM_SUBID, 114)

local demonhunter_resistDeathNone = Condition(CONDITION_ATTRIBUTES)
demonhunter_resistDeathNone:setParameter(CONDITION_PARAM_TICKS, -1)
demonhunter_resistDeathNone:setParameter(CONDITION_PARAM_SUBID, 115)


oldOutfit = {}

outfitBonuses = {
   [130] = {[3] = {condition = mage_mlvlFull}, [2] = {condition = mage_mlvlSecond}, [1] = {condition = mage_mlvlNone}, [0] = {condition = mage_mlvlNone}},
   [138] = {[3] = {condition = mage_mlvlFull}, [2] = {condition = mage_mlvlSecond}, [1] = {condition = mage_mlvlNone}, [0] = {condition = mage_mlvlNone}},
   [145] = {[3] = {condition = wizard_resistDeathFull}, [2] = {condition = wizard_resistDeathSecond}, [1] = {condition = wizard_resistDeathFirst}, [0] = {condition = wizard_resistDeathNone}},
   [145] = {[3] = {condition = wizard_resistDeathFull}, [2] = {condition = wizard_resistDeathSecond}, [1] = {condition = wizard_resistDeathFirst}, [0] = {condition = wizard_resistDeathNone}},
   [139] = {[3] = {condition = knight_resistAllFull}, [1] = {condition = knight_resistAllFirst}, [0] = {condition = knight_resistAllNone}},   
   [131] = {[3] = {condition = knight_resistAllFull}, [1] = {condition = knight_resistAllFirst}, [0] = {condition = knight_resistAllNone}},
   [269] = {[3] = {condition = nightmare_resistAllFull}, [2] = {condition = nightmare_resistAllSecond}, [1] = {condition = nightmare_resistAllFirst}, [0] = {condition = nightmare_resistAllNone}},
   [268] = {[3] = {condition = nightmare_resistAllFull}, [2] = {condition = nightmare_resistAllSecond}, [1] = {condition = nightmare_resistAllFirst}, [0] = {condition = nightmare_resistAllNone}},
   [288] = {[3] = {condition = demonhunter_resistDeathFull}, [2] = {condition = demonhunter_resistDeathSecond}, [1] = {condition = demonhunter_resistDeathFirst}, [0] = {condition = demonhunter_resistDeathNone}},
   [289] = {[3] = {condition = demonhunter_resistDeathFull}, [2] = {condition = demonhunter_resistDeathSecond}, [1] = {condition = demonhunter_resistDeathFirst}, [0] = {condition = demonhunter_resistDeathNone}}
}

function Creature:onChangeOutfit(outfit)
    if self:isPlayer() then
        -- Bonuses --
        local getOutfit = self:getOutfit()
        oldOutfit[self:getId()] = {
            lookHead = getOutfit.lookHead;
            lookBody = getOutfit.lookBody;
            lookLegs = getOutfit.lookLegs;
            lookFeet = getOutfit.lookFeet;
            lookType = getOutfit.lookType;
            lookTypeEx = getOutfit.lookTypeEx;
            lookAddons = getOutfit.lookAddons;
        }

        local old = oldOutfit[self:getId()]
        local oldOutfit_t = outfitBonuses[old.lookType]
        if oldOutfit_t and oldOutfit_t[old.lookAddons] then
            local oldCondition = oldOutfit_t[old.lookAddons].condition
            if type(oldCondition) == "table" then
                for _, condition in pairs(oldCondition) do
                    self:removeCondition(condition:getType(), condition:getId(), condition:getSubId())
                end
            else
                self:removeCondition(oldCondition:getType(), oldCondition:getId(), oldCondition:getSubId())
            end
        end

        local currentOutfit = outfitBonuses[outfit.lookType]
        if currentOutfit and currentOutfit[outfit.lookAddons] then
            local newCondition = currentOutfit[outfit.lookAddons].condition
            if type(newCondition) == "table" then
                for _, condition in pairs(newCondition) do
                    self:addCondition(condition)
                end
            else
                self:addCondition(newCondition)
            end
        end

        -- Barbarian speed boost
        if(self:getStorageValue(5002) ~= -1) then
            self:changeSpeed(-self:getStorageValue(5003))
            self:setStorageValue(5002, -1)
        end
        if outfit.lookType==147 or outfit.lookType==143 then
            if outfit.lookAddons==3 then
                self:changeSpeed(45)
                self:setStorageValue(5003, 45)
                self:setStorageValue(5002, 1)
            elseif outfit.lookAddons==2 then
                self:changeSpeed(40)
                self:setStorageValue(5003, 40)
                self:setStorageValue(5002, 1)
            elseif outfit.lookAddons==1 then
                self:changeSpeed(10)
                self:setStorageValue(5003, 10)
                self:setStorageValue(5002, 1)
            else
                self:changeSpeed(10)
                self:setStorageValue(5003, 10)
                self:setStorageValue(5002, 1)
            end
        end

        -- Show bonuses as TALKTYPE_MONSTER_SAY --
        local pos = self:getPosition()        
        local spectators = Game.getSpectators(pos, false, true, 7, 7)
        if(oldOutfit[self:getId()].lookType ~= outfit.lookType) then
            -- citizen
            if(outfit.lookType==136 or outfit.lookType==128) then
                if(outfit.lookAddons==3) then
                    for i = 1, #spectators do
                        self:say("Loot boost: 50%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                else
                    return true
                end
            -- knight
            elseif(outfit.lookType==139 or outfit.lookType==131) then
                if(outfit.lookAddons==3) then
                    for i = 1, #spectators do
                        self:say("Protection ALL: +15% \nWeapon DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end          
                elseif(outfit.lookAddons==2) then
                    for i = 1, #spectators do
                        self:say("Protection ALL: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end          
                elseif(outfit.lookAddons==1) then
                    for i = 1, #spectators do
                        self:say("Protection ALL: +5% \nWeapon DMG: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                else
                    for i = 1, #spectators do
                        self:say("Protection ALL: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end   
                end
            -- mage
            elseif(outfit.lookType==138 or outfit.lookType==130) then
                if(outfit.lookAddons==3) then
				    for i = 1, #spectators do
                        self:say("Magic Level: +10 \nMagic DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                elseif(outfit.lookAddons==2) then
				    for i = 1, #spectators do
                        self:say("Magic Level: +8", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end              
                elseif(outfit.lookAddons==1) then
				    for i = 1, #spectators do
                        self:say("Magic Level: +5 \nMagic DMG: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                else
				   for i = 1, #spectators do
                        self:say("Magic Level: +5", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                end
            -- hunter
            elseif(outfit.lookType==137 or outfit.lookType==129) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Range: +2 \nDistance DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                elseif(outfit.lookAddons==2) then
					for i = 1, #spectators do
                        self:say("Range: +2", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end                     
                elseif(outfit.lookAddons==1) then
					for i = 1, #spectators do
                        self:say("Range: +1 \nDistance DMG: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                else
						for i = 1, #spectators do
                        self:say("Range: +1", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                end
            -- nobleman
            elseif(outfit.lookType==140 or outfit.lookType==132) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Gold boost: +25%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                elseif(outfit.lookAddons==2) then
					for i = 1, #spectators do
                        self:say("Gold boost: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end                 
                elseif(outfit.lookAddons==1) then
					for i = 1, #spectators do
                        self:say("Gold boost: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                else
                  	  for i = 1, #spectators do
                        self:say("Gold boost: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                end
            -- warrior
            elseif(outfit.lookType==142 or outfit.lookType==134) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("DMG: +20% \nHP Absorb: 80%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                elseif(outfit.lookAddons==2) then
					for i = 1, #spectators do
                        self:say("DMG: +10% \nHP Absorb: 30%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                elseif(outfit.lookAddons==1) then
					for i = 1, #spectators do
                        self:say("DMG: +5% \nHP Absorb: 30%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                else
        	for i = 1, #spectators do
                        self:say("DMG: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                end
            -- summoner
            elseif(outfit.lookType==141 or outfit.lookType==133) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Mana cost: -25%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                elseif(outfit.lookAddons==2) then
					for i = 1, #spectators do
                        self:say("Mana cost: -15%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end               
                elseif(outfit.lookAddons==1) then
             			for i = 1, #spectators do
                        self:say("Mana cost: -10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end    
                else
                  		for i = 1, #spectators do
                        self:say("Mana cost: -5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end    
                end
            -- pirate
            elseif(outfit.lookType==155 or outfit.lookType==151) then
                if(outfit.lookAddons==3) then
						for i = 1, #spectators do
                        self:say("Player kill: +30.000 gold", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end    
                elseif(outfit.lookAddons==2) then
						for i = 1, #spectators do
                     self:say("Player kill: +10.000 gold", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end                 
                elseif(outfit.lookAddons==1) then
						for i = 1, #spectators do
                        self:say("Player kill: +10.000 gold", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end   
                else
               		for i = 1, #spectators do
                        self:say("", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end   
                end
            -- shaman
            elseif(outfit.lookType==158 or outfit.lookType==154) then
                if(outfit.lookAddons==3) then
				 	for i = 1, #spectators do
                        self:say("Reflect DMG: +25%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end   
                elseif(outfit.lookAddons==2) then
						for i = 1, #spectators do
                        self:say("Reflect DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end               
                elseif(outfit.lookAddons==1) then
    			for i = 1, #spectators do
                        self:say("Reflect DMG: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end   
                else
            			for i = 1, #spectators do
                        self:say("", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end   
                end
            -- assassin
            elseif(outfit.lookType==156 or outfit.lookType==152) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Distance DMG: +40%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                elseif(outfit.lookAddons==2) then
        			for i = 1, #spectators do
                        self:say("Distance DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end              
                elseif(outfit.lookAddons==1) then
              			for i = 1, #spectators do
                        self:say("Distance DMG: +20%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                else
             			for i = 1, #spectators do
                        self:say("", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                end
            -- oriental
            elseif(outfit.lookType==150 or outfit.lookType==146) then
                if(outfit.lookAddons==3) then
							for i = 1, #spectators do
                        self:say("Desert Movement Punishment: -100%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                else
							for i = 1, #spectators do
                        self:say("Desert Movement Punishment: -50%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                end
            -- norseman
            elseif(outfit.lookType==252 or outfit.lookType==251) then
                if(outfit.lookAddons==3) then
								for i = 1, #spectators do
                        self:say("Snow Movement Punishment: -100%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                elseif(outfit.lookAddons==2) then
      				for i = 1, #spectators do
                        self:say("Snow Movement Punishment: -75%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end              
                elseif(outfit.lookAddons==1) then
				for i = 1, #spectators do
                        self:say("Snow Movement Punishment: -75%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                else
				for i = 1, #spectators do
                        self:say("Snow Movement Punishment: -50%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                end
            -- beggar
            elseif(outfit.lookType==157 or outfit.lookType==153) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Shop Prices: -25%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end  
                elseif(outfit.lookAddons==2) then
					for i = 1, #spectators do
                        self:say("Shop Prices: -10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end                
                elseif(outfit.lookAddons==1) then
					for i = 1, #spectators do
                        self:say("Shop Prices: -8%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                else
               	for i = 1, #spectators do
                        self:say("Shop Prices: -5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                end
            -- druid
            elseif(outfit.lookType==148 or outfit.lookType==144) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Healing Spells: +30% \n'Heal Friend' through walls", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end
                elseif(outfit.lookAddons==2) then
     			for i = 1, #spectators do
                        self:say("Healing Spells: +15%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end          
                elseif(outfit.lookAddons==1) then
					for i = 1, #spectators do
                        self:say("Healing Spells: +20%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                else
              	for i = 1, #spectators do
                        self:say("Healing Spells: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                end
            -- barbarian
            elseif(outfit.lookType==147 or outfit.lookType==143) then
                if(outfit.lookAddons==3) then
					for i = 1, #spectators do
                        self:say("Movement Speed: +45 \nWeapon DMG: +30%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end      
                elseif(outfit.lookAddons==2) then
              		for i = 1, #spectators do
                        self:say("Movement Speed: +40 \nWeapon DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end             
                elseif(outfit.lookAddons==1) then
      				for i = 1, #spectators do
                        self:say("Movement Speed: +105 \nWeapon DMG: +25%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end     
                else
				for i = 1, #spectators do
                        self:say("Movement Speed: +10 \nWeapon DMG: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end     
                end
            -- wizard
            elseif(outfit.lookType==149 or outfit.lookType==145) then
                if(outfit.lookAddons==3) then
    			for i = 1, #spectators do
                        self:say("Protection Death: +20%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end     
                elseif(outfit.lookAddons==2) then
      			for i = 1, #spectators do
                        self:say("Protection Death: +15%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end              
                elseif(outfit.lookAddons==1) then
            			for i = 1, #spectators do
                        self:say("Protection Death: +10%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end    
                else
          			for i = 1, #spectators do
                        self:say("Protection Death: +5%", TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
                    end    
                end
            end
        end
    end
    return true
end
------------------------------------------------------------------------------
function Creature:onAreaCombat(tile, isAggressive)
	return true
end

function Creature:onTargetCombat(player, target)
    -- Function is bugged ->  player == target, self == attacker
    -- onHealthChange monsters ENITYSOFT
    if not self then return true end
    if self:isPlayer() and player:isMonster() then
        player:registerEvent("WarriorAbsorb")
    end
	-- Change outfit  ENITYSOFT
    if self:isMonster() then
        return false
	elseif self:isPlayer() then
		local current = self:getOutfit()
		self:setOutfit(current)
	end
	return true
end
