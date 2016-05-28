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
          
    if msgcontains(msg,"Trinity sword") then
        if(getPlayerItemCount(cid,8859) >= 1 and getPlayerItemCount(cid,5887) >= 5) then
            doPlayerRemoveItem(cid, 8859, 1)
            doPlayerRemoveItem(cid, 5887, 5)
		    doPlayerAddItem(cid, 7405, 1)
			selfSay("Here is your item.",cid)
        else
                selfSay("Hey ! You don't have required items.", cid)
        end
    end

    if msgcontains(msg,"Silver mace") then
        if(getPlayerItemCount(cid,5887) >= 3) then
            doPlayerRemoveItem(cid, 5887, 3)
            doPlayerAddItem(cid, 2424, 1)
            selfSay("Here is your item.",cid)
        else
                selfSay("Hey ! You don't have required items.", cid)
        end
    end

    return true
end
     
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())