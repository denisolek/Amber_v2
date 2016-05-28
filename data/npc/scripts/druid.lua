local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local storage = 6004

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I need your help and I'll reward you with nice addons if you help me! Just say {help} if you don't know what to do.")

function creatureSayCallback(cid, type, msg)    
    local player = Player(cid)
    local isDruid = player:getStorageValue(10063)
    local taskStarted = player:getStorageValue(storage)
    local whichTask = player:getStorageValue(6006)
    if not npcHandler:isFocused(cid) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if(player:getVocation():getId() ~= 2 and player:getVocation():getId() ~= 6) then
        selfSay("The only vocation I talk to are druids.", cid)
        return false
    end

    if (msgcontains(msg, "help") and isDruid == -1) then
        selfSay("From me you can start druid outfit {task}.", cid)
    elseif (msgcontains(msg, "task") and (whichTask == -1 or whichTask==1)) then
        if isDruid == -1 then
            if taskStarted == -1 then
                selfSay("Kill 10 Bethias to accomplish this task. Do you accept?", cid)
                talkState[talkUser] = 2
            elseif taskStarted == 1 then
                selfSay("Did you kill 10 Bethias?", cid)
                talkState[talkUser] = 2
            else
                selfSay("You already did this task.", cid)
            end
        else
            selfSay("You are a druid ! I can't give you any more tasks.", cid)
        end
    elseif (msgcontains(msg, "task") and whichTask ~= 1) then
        selfSay("You can't make two tasks at the same time, but remember - it's always possible to {resign} from the old one.", cid)
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 2) then
        if taskStarted == -1 then
            selfSay("Great, when you've done this come back to me. You can cancel the task, just enter {resign}.", cid)
            player:setStorageValue(storage, 1)
            player:setStorageValue(6006, 1)
            player:setStorageValue(7019, 0)
            if(player:getStorageValue(7018) == -1) then
                player:setStorageValue(7018, 1)
            end
        else
            if (player:getStorageValue(6005)+1 == 10) then
                selfSay("I don't know how you've managed it... Good job!", cid)
                player:setStorageValue(10063, 1)
                player:addOutfit(148)
                player:addOutfit(144)
                player:getPosition():sendMagicEffect(15)
                player:setStorageValue(storage, -1)
                player:setStorageValue(6006, -1)
                player:setStorageValue(6005, -1)
                player:setStorageValue(7020, 1)
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
        if(player:getStorageValue(10063) ~= 1) then
            player:setStorageValue(7018, -1)
            player:setStorageValue(7019, -1)
        end
        if(player:getStorageValue(10067) ~= 1) then
            player:setStorageValue(7021, -1)
            player:setStorageValue(7022, -1)
        end
        if(player:getStorageValue(10071) ~= 1) then
            player:setStorageValue(7024, -1)
            player:setStorageValue(7023, -1)
        end 
        player:setStorageValue(6006, -1)
        player:setStorageValue(storage, -1)
        player:setStorageValue(6005, -1)
        talkState[talkUser] = 1
    elseif (msgcontains(msg, "help") and isDruid == 1) then
        selfSay("Just say {first druid addon} or {second druid addon}.", cid)
    elseif (msgcontains(msg, "first druid addon")) then
        if(player:getStorageValue(10063) == -1) then
            selfSay("You are not a druid ! Make outfit first.", cid)
        elseif(player:getStorageValue(10064) == 1 or player:getStorageValue(10066) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For first druid addon you will need 10 bethia teeths. Do you have it with you?", cid)
            talkState[talkUser] = 5
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 5) then
        if(player:getItemCount(11228) >= 10) then
            player:removeItem(11228,10)
            player:addOutfitAddon(148, 1)
            player:addOutfitAddon(144, 1)
            player:getPosition():sendMagicEffect(15)
            if(player:getStorageValue(10065) == 1) then
                player:setStorageValue(10065, -1)
                player:setStorageValue(10066, 1)
            else
                player:setStorageValue(10064, 1)
            end
            selfSay("Here you are.", cid)
            talkState[talkUser] = 4
        else
            selfSay("Hey ! You don't have required items.", cid)
        end 
    elseif (msgcontains(msg, "second druid addon")) then
        if(player:getStorageValue(10063) == -1) then
            selfSay("You are not a druid ! Make outfit first.", cid)
        elseif(player:getStorageValue(10065) == 1 or player:getStorageValue(10066) == 1) then
            selfSay("You already have this addon.", cid)
        else    
            selfSay("For second druid addon you will need 6 bethia furs. Do you have it with you?", cid)
            talkState[talkUser] = 6
        end
    elseif (msgcontains(msg, "yes") and talkState[talkUser] == 6) then
        if(player:getItemCount(11234) >= 6) then
            player:removeItem(11234,6)
            player:addOutfitAddon(148, 2)
            player:addOutfitAddon(144, 2)
            player:getPosition():sendMagicEffect(15)
            if(player:getStorageValue(10064) == 1) then
                player:setStorageValue(10064, -1)
                player:setStorageValue(10066, 1)
            else
                player:setStorageValue(10065, 1)
            end
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