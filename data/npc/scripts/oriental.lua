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
    local isOriental = player:getStorageValue(10051)
    local taskStarted = player:getStorageValue(storage)
    local whichTask = player:getStorageValue(6003)
    if not npcHandler:isFocused(cid) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if (msgcontains(msg, "help") and isOriental == -1) then
        selfSay("From me you can start oriental outfit {task}.", cid)
    elseif (msgcontains(msg, "task") and (whichTask == -1 or whichTask==4)) then
        if isOriental == -1 then
            if taskStarted == -1 then
                selfSay("Get 1000 frags to accomplish this task. Do you accept?", cid)
                talkState[talkUser] = 2
            elseif taskStarted == 1 then
                selfSay("Did you kill 1000 people?", cid)
                talkState[talkUser] = 2
            else
                selfSay("You already did this task.", cid)
            end
        else
            selfSay("You are a oriental ! I can't give you any more tasks.", cid)
        end
    elseif (msgcontains(msg, "task") and whichTask ~= 4) then
        selfSay("You can't make two tasks at the same time, but remember - it's always possible to {resign} from the old one.", cid)
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 2) then
        if taskStarted == -1 then
            selfSay("Great, when you've done this come back to me. You can cancel the task, just enter {resign}.", cid)
            player:setStorageValue(storage, 1)
            player:setStorageValue(6003, 4)
            player:setStorageValue(7010, 0)
            if(player:getStorageValue(7009) == -1) then
                player:setStorageValue(7009, 1)
            end
        else
            if (player:getStorageValue(6002)+1 == 1000) then
                selfSay("I don't know how you've managed it... Good job!", cid)
                player:setStorageValue(10051, 1)
                player:addOutfit(150)
                player:addOutfit(146)
                player:getPosition():sendMagicEffect(15)
                player:setStorageValue(storage, -1)
                player:setStorageValue(6003, -1)
                player:setStorageValue(6002, -1)
                player:setStorageValue(7011, 1)
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
    elseif (msgcontains(msg, "help") and isOriental == 1) then
        selfSay("Just say {full oriental}.", cid)
    elseif (msgcontains(msg, "full oriental")) then
        if(player:getStorageValue(10051) == -1) then
            selfSay("You are not a oriental ! Make outfit first.", cid)
        elseif(player:getStorageValue(10052) == 1 or player:getStorageValue(10054) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For full oriental you will need a amber comb. Do you have it with you?", cid)
            talkState[talkUser] = 5
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 5) then
        if(player:getItemCount(11423) >= 1) then
            player:removeItem(11423,1)
            player:addOutfitAddon(150, 3)
            player:addOutfitAddon(146, 3)
            player:getPosition():sendMagicEffect(15)
            player:setStorageValue(10054, 1)
            selfSay("Here you are.", cid)
            talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())