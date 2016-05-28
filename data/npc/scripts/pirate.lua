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
    local isPirate = player:getStorageValue(10039)
    local taskStarted = player:getStorageValue(storage)
    local whichTask = player:getStorageValue(6003)
    if not npcHandler:isFocused(cid) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if (msgcontains(msg, "help") and isPirate == -1) then
        selfSay("From me you can start pirate outfit {task}. After successful accomplishing task you'll be able to trade with me.", cid)
    elseif (msgcontains(msg, "task") and (whichTask == -1 or whichTask==1)) then
        if isPirate == -1 then
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
            selfSay("You are a pirate ! I can't give you any more tasks.", cid)
        end
    elseif (msgcontains(msg, "task") and whichTask ~= 1) then
        selfSay("You can't make two tasks at the same time, but remember - it's always possible to {resign} from the old one.", cid)
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 2) then
        if taskStarted == -1 then
            selfSay("Great, when you've done this come back to me. You can cancel the task, just enter {resign}.", cid)
            player:setStorageValue(storage, 1)
            player:setStorageValue(6003, 1)
            player:setStorageValue(7001, 0)
            if(player:getStorageValue(7000) == -1) then
                player:setStorageValue(7000, 1)
            end
        else
            if (player:getStorageValue(6002)+1 == 2500) then
                selfSay("I don't know how you've managed it... Let's trade !", cid)
                player:setStorageValue(10039, 1)
                player:addOutfit(155)
                player:addOutfit(151)
                player:getPosition():sendMagicEffect(15)
                player:setStorageValue(storage, -1)
                player:setStorageValue(6003, -1)
                player:setStorageValue(6002, -1)
                player:setStorageValue(7002, 1)
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
    elseif (msgcontains(msg, "help") and isPirate == 1) then
        selfSay("Just say {first pirate addon}, {second pirate addon} or [trade] if you want to exchange items.", cid)
    elseif (msgcontains(msg, "first pirate addon")) then
        if(player:getStorageValue(10039) == -1) then
            selfSay("You are not a pirate ! Make outfit first.", cid)
        elseif(player:getStorageValue(10040) == 1 or player:getStorageValue(10042) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For first pirate addon you will need aberlee sabre. Do you have it with you?", cid)
            talkState[talkUser] = 5
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 5) then
        if(player:getItemCount(11426) >= 1) then
            player:removeItem(11426,1)
            player:addOutfitAddon(155, 1)
            player:addOutfitAddon(151, 1)
            player:getPosition():sendMagicEffect(15)
            if(player:getStorageValue(10041) == 1) then
                player:setStorageValue(10041, -1)
                player:setStorageValue(10042, 1)
            else
                player:setStorageValue(10040, 1)
            end
            selfSay("Here you are.", cid)
            talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "second pirate addon")) then
        if(player:getStorageValue(10039) == -1) then
            selfSay("You are not a pirate ! Make outfit first.", cid)
        elseif(player:getStorageValue(10041) == 1 or player:getStorageValue(10042) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For second pirate addon you will need aberlee hat. Do you have it with you?", cid)
            talkState[talkUser] = 6
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 6) then
        if(player:getItemCount(11424) >= 1) then
            player:removeItem(11424,1)
            player:addOutfitAddon(155, 2)
            player:addOutfitAddon(151, 2)
            player:getPosition():sendMagicEffect(15)
            if(player:getStorageValue(10040) == 1) then
                player:setStorageValue(10040, -1)
                player:setStorageValue(10042, 1)
            else
                player:setStorageValue(10041, 1)
            end
            selfSay("Here you are.", cid)
            talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "trade")) then
        if(player:getStorageValue(10039) == -1) then
            selfSay("You are not a pirate ! Make outfit first.", cid)
        else
            selfSay("I'll make for you piece of amber satin for 20 beshata silks. Submit {piece of amber satin} and I'll make this item for you.",cid)
            talkState[talkUser] = 7
        end
    elseif (msgcontains(msg, "piece of amber satin") and talkState[talkUser] == 7) then   
        if(player:getItemCount(5879) >= 20) then
            player:removeItem(5879, 20)       
            player:addItem(9678, 1)
            selfSay("Here is your item.",cid)
        else
            selfSay("Hey ! You don't have required items.", cid)
        end                      
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())