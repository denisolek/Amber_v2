local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'hero knight helmet'}, 2497, 200000, 1, '3.(hero knight helmet)')
shopModule:addBuyableItem({'hero paladin helmet'}, 2491, 20000, 1, '2.(hero paladin helmet)')
shopModule:addBuyableItem({'hero mage hat'}, 2323, 200000, 1, '1.(hero mage hat)')

shopModule:addBuyableItem({'hero knight armor'}, 2503, 200000, 1, '3.(hero knight armor)')
shopModule:addBuyableItem({'hero paladin armor'}, 2487, 200000, 1, '2.(hero paladin armor)')
shopModule:addBuyableItem({'hero mage cloak'}, 8870, 200000, 1, '1.(hero mage cloak)')

shopModule:addBuyableItem({'hero knight legs'}, 2504, 200000, 1, '3.(hero knight legs)')
shopModule:addBuyableItem({'hero paladin legs'}, 2488, 200000, 1, '2.(hero paladin legs)')
shopModule:addBuyableItem({'hero mage legs'}, 7730, 200000, 1, '1.(hero mage legs)')

shopModule:addBuyableItem({'phoenix shield'}, 2539, 200000, 1, '4.(phoenix shield)')
shopModule:addBuyableItem({'hero knight shield'}, 2515, 200000, 1, '4.(hero knight shield)')
shopModule:addBuyableItem({'hero spellbook'}, 8900, 200000, 1, '4.(hero spellbook)')

shopModule:addBuyableItem({'guardian boots'}, 11240, 200000, 1, '5.(guardian boots)')
shopModule:addBuyableItem({'hero speed shoes'}, 11303, 200000, 1, '5.(hero speed shoes)')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

