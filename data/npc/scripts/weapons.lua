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

shopModule:addBuyableItem({'basic sword'}, 11307, 100000, 1, '1.(basic sword)')
shopModule:addBuyableItem({'hero sword'}, 12649, 250000, 1, '2.(hero sword)')
shopModule:addBuyableItem({'warlord sword'}, 8931, 600000, 1, '3.(warlord sword)')

shopModule:addBuyableItem({'basic axe'}, 7380, 100000, 1, '1.(basic axe)')
shopModule:addBuyableItem({'hero axe'}, 7434, 250000, 1, '2.(hero axe)')
shopModule:addBuyableItem({'warlord axe'}, 8925, 600000, 1, '3.(warlord axe)')

shopModule:addBuyableItem({'basic club'}, 7409, 100000, 1, '1.(basic club)')
shopModule:addBuyableItem({'hero club'}, 7422, 250000, 1, '2.(hero club)')
shopModule:addBuyableItem({'warlord club'}, 8929, 600000, 1, '3.(warlord club)')

shopModule:addBuyableItem({'basic mage wand'}, 2184, 100000, 1, '4.(basic mage wand)')
shopModule:addBuyableItem({'hero mage wand'}, 12648, 250000, 1, '4.(hero mage wand)')
shopModule:addBuyableItem({'warlord mage wand'}, 12327, 600000, 1, '4.(warlord mage wand)')

shopModule:addBuyableItem({'icy giant sword'}, 7767, 110000, 2, '5.(2 charges) icy giant sword)')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

