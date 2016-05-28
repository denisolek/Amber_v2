local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local storage = 6001

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I need your help and I'll reward you with nice addons if you help me! Just say {help} if you don't know what to do.")

function creatureSayCallback(cid, type, msg)    
    local player = Player(cid)
    local isShaman = player:getStorageValue(10043)
    local taskStarted = player:getStorageValue(storage)
    local whichTask = player:getStorageValue(6003)
    if not npcHandler:isFocused(cid) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if(player:getVocation():getId() ~= 2 and player:getVocation():getId() ~= 6 and player:getVocation():getId() ~= 1 and player:getVocation():getId() ~= 5) then
        selfSay("The only vocation I talk to are druids and sorcerers.", cid)
        return false
    end

    if (msgcontains(msg, "help") and isShaman == -1) then
        selfSay("From me you can start shaman outfit {task}. After successful accomplishing task you'll be able to trade with me.", cid)
    elseif (msgcontains(msg, "task") and (whichTask == -1 or whichTask==2)) then
        if isShaman == -1 then
            if taskStarted == -1 then
                selfSay("Get 2500 frags to accomplish this task, when you succeed I'll trade with you. Do you accept?", cid)
                talkState[talkUser] = 2
            elseif taskStarted == 1 then
                selfSay("Did you kill 2500 people?", cid)
                talkState[talkUser] = 2
            else
                selfSay("You already did this task.", cid)
            end
        else
            selfSay("You are a shaman ! I can't give you any more tasks.", cid)
        end
    elseif (msgcontains(msg, "task") and whichTask ~= 2) then
        selfSay("You can't make two tasks at the same time, but remember - it's always possible to {resign} from the old one.", cid)
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 2) then
        if taskStarted == -1 then
            selfSay("Great, when you've done this come back to me. You can cancel the task, just enter {resign}.", cid)
            player:setStorageValue(storage, 1)
            player:setStorageValue(6003, 2)
            player:setStorageValue(7004, 0)
            if(player:getStorageValue(7003) == -1) then
                player:setStorageValue(7003, 1)
            end
        else
            if (player:getStorageValue(6002)+1 == 2500) then
                selfSay("I don't know how you've managed it... Let's trade !", cid)
                player:setStorageValue(10043, 1)
                player:addOutfit(158)
                player:addOutfit(154)
                player:getPosition():sendMagicEffect(15)
                player:setStorageValue(storage, -1)
                player:setStorageValue(6003, -1)
                player:setStorageValue(6002, -1)
                player:setStorageValue(7005, 1)
            else
                selfSay("You didn't kill them all.", cid)
            end
        end
        talkState[talkUser] = 0
    elseif (msgcontains(msg, "no") and talkState[talkUser] == 2) then
        selfSay("Ok then.", cid)
        talkState[talkUser] = 2
    elseif (msgcontains(msg, "resign") and taskStarted == 1) then
        selfSay("Are you sure? Your previous achievements will forfeit and next time you'll have to start over.", cid)
        talkState[talkUser] = 3
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 3) then
        selfSay("Ok then. Your task is cancelled.", cid) 
        if(player:getStorageValue(10039) ~= 1) then
            player:setStorageValue(7000, -1)
            player:setStorageValue(7001, -1)
        end
        if(player:getStorageValue(10043) ~= 1) then
            player:setStorageValue(7003, -1)
            player:setStorageValue(7004, -1)
        end
        if(player:getStorageValue(10047) ~= 1) then
            player:setStorageValue(7006, -1)
            player:setStorageValue(7007, -1)
        end 
        if(player:getStorageValue(10051) ~= 1) then
            player:setStorageValue(7009, -1)
            player:setStorageValue(7010, -1)
        end
        if(player:getStorageValue(10055) ~= 1) then
            player:setStorageValue(7012, -1)
            player:setStorageValue(7013, -1)
        end
        if(player:getStorageValue(10059) ~= 1) then
            player:setStorageValue(7015, -1)
            player:setStorageValue(7016, -1)
        end 
        player:setStorageValue(6003, -1)
        player:setStorageValue(storage, -1)
        player:setStorageValue(6002, -1)
        talkState[talkUser] = 1
    elseif (msgcontains(msg, "help") and isShaman == 1) then
        selfSay("Just say {first shaman addon}, {second shaman addon} or [trade] if you want to exchange items.", cid)
    elseif (msgcontains(msg, "first shaman addon")) then
        if(player:getStorageValue(10043) == -1) then
            selfSay("You are not a shaman ! Make outfit first.", cid)
        elseif(player:getStorageValue(10044) == 1 or player:getStorageValue(10046) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For first shaman addon you will need tribal mask. Do you have it with you?", cid)
            talkState[talkUser] = 5
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 5) then
    	if(player:getItemCount(3967) >= 1) then
	        player:removeItem(3967,1)
	        player:addOutfitAddon(158, 1)
	        player:addOutfitAddon(154, 1)
	        player:getPosition():sendMagicEffect(15)
	        if(player:getStorageValue(10045) == 1) then
	            player:setStorageValue(10045, -1)
	            player:setStorageValue(10046, 1)
	        else
	            player:setStorageValue(10044, 1)
	        end
	        selfSay("Here you are.", cid)
	        talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "second shaman addon")) then
        if(player:getStorageValue(10043) == -1) then
            selfSay("You are not a shaman ! Make outfit first.", cid)
        elseif(player:getStorageValue(10045) == 1 or player:getStorageValue(10046) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For second shaman addon you will need voodoo doll and voodoo staff. Do you have it with you?", cid)
            talkState[talkUser] = 6
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 6) then
    	if(player:getItemCount(3955) >= 1 and player:getItemCount(8922) >= 1) then
	        player:removeItem(3955,1)
	        player:removeItem(8922,1)
	        player:addOutfitAddon(158, 2)
	        player:addOutfitAddon(154, 2)
	        player:getPosition():sendMagicEffect(15)
	        if(player:getStorageValue(10044) == 1) then
	            player:setStorageValue(10044, -1)
	            player:setStorageValue(10046, 1)
	        else
	            player:setStorageValue(10045, 1)
	        end
	        selfSay("Here you are.", cid)
	        talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "trade")) then
        if(player:getStorageValue(10043) == -1) then
            selfSay("You are not a shaman ! Make outfit first.", cid)
        else
            selfSay("I'll make for you voodoo doll for 5 yfrg furs or voodoo staff for 5 giant yfrg hairs and skull staff. Submit {voodoo doll} or {voodoo staff} and I'll make this item for you.",cid)
            talkState[talkUser] = 7
        end
    elseif (msgcontains(msg, "voodoo doll") and talkState[talkUser] == 7) then   
        if(player:getItemCount(5883) >= 5) then
            player:removeItem(5883, 5)       
            player:addItem(3955, 1)
            selfSay("Here is your item.",cid)
        else
            selfSay("Hey ! You don't have required items.", cid)
        end
    elseif (msgcontains(msg, "voodoo staff") and talkState[talkUser] == 7) then   
        if(player:getItemCount(4843) >= 5 and player:getItemCount(2436) >= 1) then
            player:removeItem(4843, 5)
            player:removeItem(2436, 1)       
            player:addItem(8922, 1)
            selfSay("Here is your item.",cid)
        else
            selfSay("Hey ! You don't have required items.", cid)
        end                       
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())