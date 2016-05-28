local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local trainConfigMAGES = {
    magesPositions = {
        Position(90, 262, 7),
        Position(92, 262, 7),
        Position(94, 262, 7),
        Position(96, 262, 7),
        Position(98, 262, 7),
        Position(100, 262, 7),
        Position(102, 262, 7),
        Position(104, 262, 7),
        Position(106, 262, 7),
        Position(108, 266, 7),
		Position(90, 264, 7),
        Position(92, 264, 7),
        Position(94, 264, 7),
        Position(96, 264, 7),
        Position(98, 264, 7),
        Position(100, 264, 7),
        Position(102, 264, 7),
        Position(104, 264, 7),
        Position(106, 264, 7),
        Position(108, 264, 7),
		Position(90, 266, 7),
        Position(92, 266, 7),
        Position(94, 266, 7),
        Position(96, 266, 7),
        Position(98, 266, 7),
        Position(100, 266, 7),
        Position(102, 266, 7),
        Position(104, 266, 7),
        Position(106, 266, 7),
        Position(108, 266, 7),
		Position(90, 262, 6),
        Position(92, 262, 6),
        Position(94, 262, 6),
        Position(96, 262, 6),
        Position(98, 262, 6),
        Position(100, 262, 6),
        Position(102, 262, 6),
        Position(104, 262, 6),
        Position(106, 262, 6),
        Position(108, 266, 6),
		Position(90, 264, 6),
        Position(92, 264, 6),
        Position(94, 264, 6),
        Position(96, 264, 6),
        Position(98, 264, 6),
        Position(100, 264, 6),
        Position(102, 264, 6),
        Position(104, 264, 6),
        Position(106, 264, 6),
        Position(108, 264, 6),
		Position(90, 266, 6),
        Position(92, 266, 6),
        Position(94, 266, 6),
        Position(96, 266, 6),
        Position(98, 266, 6),
        Position(100, 266, 6),
        Position(102, 266, 6),
        Position(104, 266, 6),
        Position(106, 266, 6),
        Position(108, 266, 6)
    }
}

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. Welcome to the mage training room. Type {start} to enter the room ( it costs 200k per hour) or {status} to check the ammount of avaible slots.")

local function countSlots()
    local pos
    local count=0
    for i=1, #trainConfigMAGES.magesPositions do
        pos = Tile(trainConfigMAGES.magesPositions[i]):getTopCreature()
        if pos then
            count=count+1
        end
    end
    return count
end

function creatureSayCallback(cid, type, msg)    
    local player = Player(cid)
    if not npcHandler:isFocused(cid) then
        return false
    end
    local cost = 200000
    if player:getStorageValue(835) == 1 then
        cost = 100000
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if(player:getVocation():getId() ~= 1 and player:getVocation():getId() ~= 5 and player:getVocation():getId() ~= 2 and player:getVocation():getId() ~= 6) then
        selfSay("The only vocation I talk to are sorcerers or druids. Go find you own place!", cid)
        return false
    end

    if msgcontains(msg, "status") then        
        if countSlots() < 60 then 
            selfSay("There are {"..countSlots().."/60} slots taken. You can {start} training!", cid)
        elseif countSlots() == 60 then
            selfSay("Training room is FULL (60/60)", cid)
        end
    elseif msgcontains(msg, "start") then
        if countSlots() < #trainConfigMAGES.magesPositions then
            if player:getMoney() >= cost then
                local posTile
                for i=1, #trainConfigMAGES.magesPositions do
                    posTile = Tile(trainConfigMAGES.magesPositions[i]):getTopCreature()
                    if not posTile or not posTile:isPlayer() then
                        player:removeMoney(cost)
                        player:teleportTo(trainConfigMAGES.magesPositions[i])
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "You've entered training room for 1 hour. After that you'll have to pay more. REMEMBER that you can always go back using teleport command (i.e '!t 1')")
                        break
                    end
                end    
            else
                selfSay("You don't have enought money!", cid)
            end   
        else
            selfSay("Training room is full, try again later.", cid)
        end    
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())