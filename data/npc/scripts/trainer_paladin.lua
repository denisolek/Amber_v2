local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local trainConfigRP = {
    rpPositions = {
        Position(68, 260, 7),
        Position(70, 260, 7),
        Position(72, 260, 7),
        Position(74, 260, 7),
        Position(76, 260, 7),
        Position(78, 260, 7),
        Position(80, 260, 7),
        Position(82, 260, 7),
        Position(84, 260, 7),
        Position(86, 260, 7),
        Position(88, 260, 7),
        Position(90, 260, 7),
        Position(92, 260, 7),
        Position(94, 260, 7),
        Position(96, 260, 7),
        Position(98, 260, 7),
        Position(100, 260, 7),
        Position(102, 260, 7),
        Position(104, 260, 7),
        Position(106, 260, 7),
        Position(108, 260, 7),
		Position(68, 260, 6),
        Position(70, 260, 6),
        Position(72, 260, 6),
        Position(74, 260, 6),
        Position(76, 260, 6),
        Position(78, 260, 6),
        Position(80, 260, 6),
        Position(82, 260, 6),
        Position(84, 260, 6),
        Position(86, 260, 6),
        Position(88, 260, 6),
        Position(90, 260, 6),
        Position(92, 260, 6),
        Position(94, 260, 6),
        Position(96, 260, 6),
        Position(98, 260, 6),
        Position(100, 260, 6),
        Position(102, 260, 6),
        Position(104, 260, 6),
        Position(106, 260, 6),
        Position(108, 260, 6)
    }
}

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. Welcome to the paladin training room. Type {start} to enter the room ( it costs 200k per hour) or {status} to check the ammount of avaible slots.")

local function countSlots()
    local pos
    local count=0
    for i=1, #trainConfigRP.rpPositions do
        pos = Tile(trainConfigRP.rpPositions[i]):getTopCreature()
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

    if(player:getVocation():getId() ~= 3 and player:getVocation():getId() ~= 7) then
        selfSay("The only vocation I talk to are paladins. Go find you own place!", cid)
        return false
    end

    if msgcontains(msg, "status") then        
        if countSlots() < 44 then 
            selfSay("There are {"..countSlots().."/44} slots taken. You can {start} training!", cid)
        elseif countSlots() == 44 then
            selfSay("Training room is FULL (44/44)", cid)
        end
    elseif msgcontains(msg, "start") then
        if countSlots() < #trainConfigRP.rpPositions then
            if player:getMoney() >= cost then
                local posTile
                for i=1, #trainConfigRP.rpPositions do
                    posTile = Tile(trainConfigRP.rpPositions[i]):getTopCreature()
                    if not posTile or not posTile:isPlayer() then
                        player:removeMoney(cost)
                        player:teleportTo(trainConfigRP.rpPositions[i])
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