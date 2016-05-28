local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'basic knight helmet1'}, 2462, 30000, 1, '3.(basic knight helmet1)')
shopModule:addBuyableItem({'basic knight helmet2'}, 2475, 30000, 1, '3.(basic knight helmet2)')
shopModule:addBuyableItem({'basic paladin helmet'}, 7462, 30000, 1, '2.(basic paladin helmet)')
shopModule:addBuyableItem({'basic mage hat'}, 8820, 30000, 1, '1.(basic mage hat)')

shopModule:addBuyableItem({'basic mage cloak'}, 8819, 30000, 1, '1.(basic mage cloak)')
shopModule:addBuyableItem({'basic paladin cape'}, 8872, 30000, 1, '2.(basic paladin cape)')
shopModule:addBuyableItem({'basic knight armor'}, 2476, 30000, 1, '3.(basic knight armor)')

shopModule:addBuyableItem({'basic knight legs'}, 2477, 30000, 1, '3.(basic knight legs)')
shopModule:addBuyableItem({'basic paladin legs'}, 2647, 30000, 1, '2.(basic paladin legs)')
shopModule:addBuyableItem({'basic mage legs'}, 2468, 30000, 1, '1.(basic mage legs)')

shopModule:addBuyableItem({'basic shield1'}, 2528, 30000, 1, '4.(basic shield1)')
shopModule:addBuyableItem({'basic shield2'}, 2521, 30000, 1, '4.(basic shield2)')
shopModule:addBuyableItem({'basic spellbook'}, 8902, 20000, 1, '4.(basic spellbook)')

shopModule:addBuyableItem({'boots of Haste'}, 2195, 80000, 1, '5.(boots of haste)')
shopModule:addBuyableItem({'steel boots'}, 2645, 70000, 1, '5.(steel boots)')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

