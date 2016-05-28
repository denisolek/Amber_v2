function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if(attacker~=nil and primaryType~=128 and attacker:isPlayer()) then	   
		local outfit = attacker:getOutfit()
		if(outfit.lookType == 142 or outfit.lookType == 134) then
		    if(outfit.lookAddons == 1 or outfit.lookAddons == 2) then
			    if (origin == ORIGIN_RANGED or origin == ORIGIN_MELEE) then
			    	if creature:isMonster() then
			        	attacker:addHealth(primaryDamage*0.30)
			        elseif creature:isPlayer() then
			        	attacker:addHealth(-primaryDamage*0.30)
			        end
			    end		
			elseif(outfit.lookAddons == 3) then
				if (origin == ORIGIN_RANGED or origin == ORIGIN_MELEE) then
			    	if creature:isMonster() then
				        attacker:addHealth(primaryDamage*0.80)
					elseif creature:isPlayer() then
						attacker:addHealth(-primaryDamage*0.80)
					end
			    end
			end
		end
	end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end