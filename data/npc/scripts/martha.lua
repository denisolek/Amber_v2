local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
     
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
    
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end 
          
    if msgcontains(msg,"I have") then
        if(getPlayerItemCount(cid,2791) >= 60 and getPlayerItemCount(cid,5934) >= 1) then     
            doPlayerRemoveItem(cid, 2791, 60)
            doPlayerRemoveItem(cid, 5934, 1)
            doPlayerAddItem(cid, 10570, 1)
			selfSay("Here is your item.",cid)
        else
                selfSay("Hey ! You don't have required items.", cid)
        end
    end
    return true
end
     
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())