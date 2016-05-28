local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'basic crossbow'}, 8849, 100000, 1, '1.(basic crossbow)')
shopModule:addBuyableItem({'hero crossbow'}, 8852, 250000, 1, '1.(hero crossbow)')
shopModule:addBuyableItem({'warlord crossboww'}, 8853, 600000, 1, '1.(warlord crossbow)')

shopModule:addBuyableItem({'basic bolt'}, 7363, 250, 1, '2.(basic bolt)')
shopModule:addBuyableItem({'hero bolt'}, 2547, 750, 1, '2.(hero bolt)')

shopModule:addBuyableItem({'basic star'}, 2399, 500, 1, '3.(basic star)')
shopModule:addBuyableItem({'hero star'}, 7366, 1000, 1, '3.(hero star)')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

