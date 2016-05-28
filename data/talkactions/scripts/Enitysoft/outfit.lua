function string.diff(self)
    local format = {
        {'day', self / 60 / 60 / 24},
        {'hour', self / 60 / 60 % 24},
        {'minute', self / 60 % 60},
        {'second', self % 60}
    }

    local out = {}
    for k, t in ipairs(format) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    local ret = table.concat(out)
    if ret:len() < 16 and ret:find('second') then
        local a, b = ret:find(' and ')
        ret = ret:sub(b+1)
    end
    return ret
end

local config = {
            exhaustion = 300000, -- exhaust storage
            duration = 10 -- counted in seconds for example 5*60 for 5 minutes.
        }

function onSay(player, words, param)
    if (player:getStorageValue(config.exhaustion) > os.time())then
        doPlayerSendCancel(player,"You must wait another " .. player:getStorageValue(config.exhaustion) - os.time() .. ' second' .. ((player:getStorageValue(config.exhaustion) - os.time()) == 1 and "" or "s") .. " to use this command again.")
        return false
    end    

    if(param == '') then
        local outfit_list = {"Citizen", "Hunter", "Mage", "Knight", "Nobleman", "Noblewoman","Summoner", "Warrior", "Barbarian", "Druid", "Wizard", "Oriental", "Pirate", "Assassin", "Beggar", "Shaman", "Norseman","Norsewoman", "Nightmare", "Jester", "Brotherhood", "Demonhunter","Warmaster","Husband","Wife"}
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "------------------------------" )
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Type ' !outfit outfit_name ' to set outfit." )
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Outfits available for you: " )
        for i=1, #outfit_list do
            if(outfit_list[i] == "Citizen") then
                if(player:hasOutfit(136, 0) or player:hasOutfit(128, 0)) then
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Hunter") then
                if(player:hasOutfit(137, 0) or player:hasOutfit(129, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Mage") then
                if(player:hasOutfit(138, 0) or player:hasOutfit(130, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Knight") then
                if(player:hasOutfit(139, 0) or player:hasOutfit(131, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(player:getSex() == 1) then
                if(outfit_list[i] == "Nobleman") then
                    if(player:hasOutfit(140, 0) or player:hasOutfit(132, 0)) then   
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                    end
                end
            end 
            if(player:getSex() == 0) then
                if(outfit_list[i] == "Noblewoman") then
                    if(player:hasOutfit(140, 0) or player:hasOutfit(132, 0)) then   
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                    end
                end
            end
            if(outfit_list[i] == "Summoner") then
                if(player:hasOutfit(141, 0) or player:hasOutfit(133, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Warrior") then
                if(player:hasOutfit(142, 0) or player:hasOutfit(134, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Barbarian") then
                if(player:hasOutfit(147, 0) or player:hasOutfit(143, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Druid") then
                if(player:hasOutfit(144, 0) or player:hasOutfit(148, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Wizard") then
                if(player:hasOutfit(149, 0) or player:hasOutfit(145, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Oriental") then
                if(player:hasOutfit(150, 0) or player:hasOutfit(146, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Pirate") then
                if(player:hasOutfit(155, 0) or player:hasOutfit(151, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Assassin") then
                if(player:hasOutfit(156, 0) or player:hasOutfit(152, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Beggar") then
                if(player:hasOutfit(157, 0) or player:hasOutfit(153, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Shaman") then
                if(player:hasOutfit(158, 0) or player:hasOutfit(154, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(player:getSex() == 1) then
                if(outfit_list[i] == "Norseman") then
                    if(player:hasOutfit(252, 0) or player:hasOutfit(251, 0)) then   
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                    end
                end
            end
            if(player:getSex() == 0) then
                if(outfit_list[i] == "Norsewoman") then
                    if(player:hasOutfit(252, 0) or player:hasOutfit(251, 0)) then   
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                    end
                end
            end         
            if(outfit_list[i] == "Nightmare") then
                if(player:hasOutfit(269, 0) or player:hasOutfit(268, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Jester") then
                if(player:hasOutfit(270, 0) or player:hasOutfit(273, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Brotherhood") then
                if(player:hasOutfit(279, 0) or player:hasOutfit(278, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Demonhunter") then
                if(player:hasOutfit(288, 0) or player:hasOutfit(289, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Yalaharian") then
                if(player:hasOutfit(324, 0) or player:hasOutfit(325, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(outfit_list[i] == "Warmaster") then
                if(player:hasOutfit(336, 0) or player:hasOutfit(335, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end
            if(player:getSex() == 1) then
                if(outfit_list[i] == "Husband") then
                    if(player:hasOutfit(329, 0) or player:hasOutfit(328, 0)) then   
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                    end
                end
            end
            if(player:getSex() == 0) then
                if(outfit_list[i] == "Wife") then
                    if(player:hasOutfit(329, 0) or player:hasOutfit(328, 0)) then   
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                    end
                end
            end
            if(outfit_list[i] == "Wayfarer") then
                if(player:hasOutfit(366, 0) or player:hasOutfit(367, 0)) then   
                    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, outfit_list[i])
                end
            end            
        end
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "------------------------------")
    end
    -- CHANGE OUTFIT
    local creature = player
    local color = creature:getOutfit()
    local wrong_param = 0
    local nooutfit = 0
    local outfit = {}
    local message = "Your outfit has been changed."
    param = param:lower()

    if(param == "citizen") then
        if(player:getSex() == 1) then
            outfit = {lookType = 128, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 136, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "hunter") then
        if(player:getSex() == 1) then
            outfit = {lookType = 129, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 137, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "mage") then
        if(player:getSex() == 1) then
            outfit = {lookType = 130, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 138, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "knight") then
        if(player:getSex() == 1) then
            outfit = {lookType = 131, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 139, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "nobleman" or param == "noblewoman") then
        if(player:getSex() == 1) then
            outfit = {lookType = 132, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 140, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "summoner") then
        if(player:getSex() == 1) then
            outfit = {lookType = 133, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 141, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "warrior") then
        if(player:getSex() == 1) then
            outfit = {lookType = 134, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 142, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "barbarian") then
        if(player:getSex() == 1) then
            outfit = {lookType = 143, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 147, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "druid") then
        if(player:getSex() == 1) then
            outfit = {lookType = 144, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 148, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "wizard") then
        if(player:getSex() == 1) then
            outfit = {lookType = 145, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 149, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "oriental") then
        if(player:getSex() == 1) then
            outfit = {lookType = 146, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 150, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "pirate") then
        if(player:getSex() == 1) then
            outfit = {lookType = 151, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 155, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "assassin") then
        if(player:getSex() == 1) then
            outfit = {lookType = 152, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 156, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "beggar") then
        if(player:getSex() == 1) then
            outfit = {lookType = 153, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 157, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "shaman") then
        if(player:getSex() == 1) then
            outfit = {lookType = 154, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 158, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "norseman" or param == "norsewoman") then
        if(player:getSex() == 1) then
            outfit = {lookType = 251, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 252, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end 
    elseif(param == "husband" or param == "wife") then
        if(player:getSex() == 1) then
            outfit = {lookType = 328, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 329, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "nightmare") then
        if(player:getSex() == 1) then
            outfit = {lookType = 268, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 269, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "jester") then
        if(player:getSex() == 1) then
            outfit = {lookType = 273, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 270, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end
    elseif(param == "brotherhood") then
        if(player:getSex() == 1) then
            outfit = {lookType = 278, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 279, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "demonhunter") then
        if(player:getSex() == 1) then
            outfit = {lookType = 289, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 288, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "yalaharian") then
        if(player:getSex() == 1) then
            outfit = {lookType = 325, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 324, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "warmaster") then
        if(player:getSex() == 1) then
            outfit = {lookType = 355, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 356, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end         
    elseif(param == "wedding") then
        if(player:getSex() == 1) then
            outfit = {lookType = 328, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 329, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end     
    elseif(param == "wayfarer") then
        if(player:getSex() == 1) then
            outfit = {lookType = 367, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        elseif(player:getSex() == 0) then
            outfit = {lookType = 366, lookHead = color.lookHead, lookBody = color.lookBody, lookLegs = color.lookLegs, lookFeet = color.lookFeet, lookTypeEx = 0, lookAddons = 0}
        end                     
    -- Zmiana, magic effect, exhaust, message, addon check
    else
        wrong_param=1
        player:sendCancelMessage("This outfit doesn't exist or you can't wear it.")
    end 
    if(wrong_param == 0) then
        if(player:hasOutfit(outfit.lookType, 3)) then
            outfit.lookAddons = 3
        elseif(player:hasOutfit(outfit.lookType, 2)) then
            outfit.lookAddons = 2
        elseif(player:hasOutfit(outfit.lookType, 1)) then
            outfit.lookAddons = 1
        elseif(player:hasOutfit(outfit.lookType, 0)) then
            outfit.lookAddons = 0
        else
            player:sendCancelMessage("You can't wear this outfit.")
            nooutfit = 1
        end

        creature = player
        if(nooutfit == 0) then
          player:getPosition():sendMagicEffect(32)
          creature:setOutfit(outfit)
        
           player:sendTextMessage(MESSAGE_INFO_DESCR, message)
        end
    end
    player:setStorageValue(config.exhaustion, os.time() + config.duration)

    return false
end