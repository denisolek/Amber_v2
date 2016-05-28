local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local trainConfigEK = {
    ekPositions = {
        Position(70, 263, 7),
        Position(72, 263, 7),
        Position(74, 263, 7),
        Position(76, 263, 7),
        Position(78, 263, 7),
        Position(80, 263, 7),
        Position(82, 263, 7),
        Position(84, 263, 7),
        Position(86, 263, 7),
        Position(70, 266, 7),
        Position(72, 266, 7),
        Position(74, 266, 7),
        Position(76, 266, 7),
        Position(78, 266, 7),
        Position(80, 266, 7),
        Position(82, 266, 7),
        Position(84, 266, 7),
        Position(86, 266, 7),
		Position(70, 263, 6),
        Position(72, 263, 6),
        Position(74, 263, 6),
        Position(76, 263, 6),
        Position(78, 263, 6),
        Position(80, 263, 6),
        Position(82, 263, 6),
        Position(84, 263, 6),
        Position(86, 263, 6),
        Position(70, 266, 6),
        Position(72, 266, 6),
        Position(74, 266, 6),
        Position(76, 266, 6),
        Position(78, 266, 6),
        Position(80, 266, 6),
        Position(82, 266, 6),
        Position(84, 266, 6),
        Position(86, 266, 6)
    }
}

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. Welcome to the knights training room. Type {start} to enter the room ( it costs 200k per hour) or {status} to check the ammount of avaible slots.")

local function countSlots()
    local pos
    local count=0
    for i=1, #trainConfigEK.ekPositions do
        pos = Tile(trainConfigEK.ekPositions[i]):getTopCreature()
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

    if(player:getVocation():getId() ~= 4 and player:getVocation():getId() ~= 8) then
        selfSay("The only vocation I talk to are knights. Go find you own place!", cid)
        return false
    end

    if msgcontains(msg, "status") then        
        if countSlots() < 36 then 
            selfSay("There are {"..countSlots().."/36} slots taken. You can {start} training!", cid)
        elseif countSlots() == 36 then
            selfSay("Training room is FULL (36/36)", cid)
        end
    elseif msgcontains(msg, "start") then
        if countSlots() < #trainConfigEK.ekPositions then
            if player:getMoney() >= cost then
                local posTile
                for i=1, #trainConfigEK.ekPositions do
                    posTile = Tile(trainConfigEK.ekPositions[i]):getTopCreature()
                    if not posTile or not posTile:isPlayer() then
                        player:removeMoney(cost)
                        player:teleportTo(trainConfigEK.ekPositions[i])
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