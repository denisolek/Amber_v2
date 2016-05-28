function onMove(creature, newPosition, lastPosition)

	if creature:isPlayer() then
		local newSpeed = creature:getBaseSpeed()*0.6
		if creature:getFreeCapacity() <= 100 and creature:getStorageValue(4999) == -1 then
			creature:changeSpeed(-newSpeed)
			creature:setStorageValue(4999, 1)
		end
		if creature:getFreeCapacity() > 100 and creature:getStorageValue(4999) == 1 then
			creature:changeSpeed(newSpeed)
			creature:setStorageValue(4999, -1)
		end

	    local tile = Tile(newPosition)
	    if tile then
	        local ground = tile:getGround()
	        if ground then
	        	-- oriental
	        	if(ground:getId() == 231) then
	        		local outfit = creature:getOutfit()
	        		if(outfit.lookType == 150 or outfit.lookType == 146) then
	        			if(outfit.lookAddons == 3) then
			        		if(creature:getStorageValue(5000) == -1) then
				        		creature:changeSpeed(160)
				        		creature:setStorageValue(5000, 1)
				        		creature:setStorageValue(5001, 160)
				        	end
				        else
				        	if(creature:getStorageValue(5000) == -1) then
				        		creature:changeSpeed(80)
				        		creature:setStorageValue(5000, 1)
				        		creature:setStorageValue(5001, 80)
				        	end
				        end
		        	end
		        -- norseman
	        	elseif(ground:getId() == 670 or ground:getId() == 6594) then
	        		local outfit = creature:getOutfit()
	        		if(outfit.lookType == 252 or outfit.lookType == 251) then
	        			if(outfit.lookAddons == 3) then
			        		if(creature:getStorageValue(5000) == -1) then
				        		creature:changeSpeed(160)
				        		creature:setStorageValue(5000, 1)
				        		creature:setStorageValue(5001, 160)
				        	end
				        elseif(outfit.lookAddons == 1 or outfit.lookAddons == 2) then
			        		if(creature:getStorageValue(5000) == -1) then
				        		creature:changeSpeed(120)
				        		creature:setStorageValue(5000, 1)
				        		creature:setStorageValue(5001, 120)
				        	end			        	
				        else
				        	if(creature:getStorageValue(5000) == -1) then
				        		creature:changeSpeed(80)
				        		creature:setStorageValue(5000, 1)
				        		creature:setStorageValue(5001, 80)
				        	end
				        end
		        	end	        
	        	else
	 		       	if(creature:getStorageValue(5000) ~= -1) then
		        		creature:changeSpeed(-creature:getStorageValue(5001))
		        		creature:setStorageValue(5000, -1)
		        		creature:setStorageValue(5001, 0)
		        	end	
		        end
	            -- creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "ID: " .. ground:getId())
	            -- creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "NAME: " .. ground:getName())
	            -- creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "SPEED: " .. creature:getSpeed())
	            -- creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "STORAGE 5000: " .. creature:getStorageValue(5000))
	            -- creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "STORAGE 5001: " .. creature:getStorageValue(5001))
	            -- creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "---------------------------------")
	        end
	    end
	end
    return true
end