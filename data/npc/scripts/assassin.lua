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
    local isAssassin = player:getStorageValue(10047)
    local taskStarted = player:getStorageValue(storage)
    local whichTask = player:getStorageValue(6003)
    if not npcHandler:isFocused(cid) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if(player:getVocation():getId() ~= 3 and player:getVocation():getId() ~= 7) then
        selfSay("The only vocation I talk to are paladins.", cid)
        return false
    end

    if (msgcontains(msg, "help") and isAssassin == -1) then
        selfSay("From me you can start assassin outfit {task}. After successful accomplishing task you'll be able to trade with me.", cid)
    elseif (msgcontains(msg, "task") and (whichTask == -1 or whichTask==3)) then
        if isAssassin == -1 then
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
            selfSay("You are a assassin ! I can't give you any more tasks.", cid)
        end
    elseif (msgcontains(msg, "task") and whichTask ~= 3) then
        selfSay("You can't make two tasks at the same time, but remember - it's always possible to {resign} from the old one.", cid)
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 2) then
        if taskStarted == -1 then
            selfSay("Great, when you've done this come back to me. You can cancel the task, just enter {resign}.", cid)
            player:setStorageValue(storage, 1)
            player:setStorageValue(6003, 3)
            player:setStorageValue(7007, 0)
            if(player:getStorageValue(7006) == -1) then
                player:setStorageValue(7006, 1)
            end
        else
            if (player:getStorageValue(6002)+1 == 2500) then
                selfSay("I don't know how you've managed it... Let's trade !", cid)
                player:setStorageValue(10047, 1)
                player:addOutfit(156)
                player:addOutfit(152)
                player:getPosition():sendMagicEffect(15)
                player:setStorageValue(storage, -1)
                player:setStorageValue(6003, -1)
                player:setStorageValue(6002, -1)
                player:setStorageValue(7008, 1)
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
    elseif (msgcontains(msg, "help") and isAssassin == 1) then
        selfSay("Just say {first assassin addon}, {second assassin addon} or [trade] if you want to exchange items.", cid)
    elseif (msgcontains(msg, "first assassin addon")) then
        if(player:getStorageValue(10047) == -1) then
            selfSay("You are not an assassin ! Make outfit first.", cid)
        elseif(player:getStorageValue(10048) == 1 or player:getStorageValue(10050) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For first assassin addon you will need amber satin. Do you have it with you?", cid)
            talkState[talkUser] = 5
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 5) then
        if(player:getItemCount(9678) >= 1) then
            player:removeItem(9678,1)
            player:addOutfitAddon(156, 1)
            player:addOutfitAddon(152, 1)
            player:getPosition():sendMagicEffect(15)
            if(player:getStorageValue(10049) == 1) then
                player:setStorageValue(10049, -1)
                player:setStorageValue(10050, 1)
            else
                player:setStorageValue(10048, 1)
            end
            selfSay("Here you are.", cid)
            talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "second assassin addon")) then
        if(player:getStorageValue(10047) == -1) then
            selfSay("You are not an assassin ! Make outfit first.", cid)
        elseif(player:getStorageValue(10049) == 1 or player:getStorageValue(10050) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For second assassin addon you will need Trinity Sword. Do you have it with you?", cid)
            talkState[talkUser] = 6
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 6) then
        if(player:getItemCount(7405) >= 1) then
            player:removeItem(7405,1)
            player:addOutfitAddon(156, 2)
            player:addOutfitAddon(152, 2)
            player:getPosition():sendMagicEffect(15)
            if(player:getStorageValue(10048) == 1) then
                player:setStorageValue(10048, -1)
                player:setStorageValue(10050, 1)
            else
                player:setStorageValue(10049, 1)
            end
            selfSay("Here you are.", cid)
            talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "trade")) then
        if(player:getStorageValue(10047) == -1) then
            selfSay("You are not an assassin ! Make outfit first.", cid)
        else
            selfSay("I'll make for you assassin stars for 50 soul orb. Submit {assassin star} and I'll make this item for you.",cid)
            talkState[talkUser] = 7
        end
    elseif (msgcontains(msg, "assassin star") and talkState[talkUser] == 7) then   
        if(player:getItemCount(5944) >= 50) then
            player:removeItem(5944, 50)       
            player:addItem(7368, 1)
            selfSay("Here is your item.",cid)
        else
            selfSay("Hey ! You don't have required items.", cid)
        end                      
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())