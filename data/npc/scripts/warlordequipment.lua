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

shopModule:addBuyableItem({'warlord knight helmet'}, 12645, 600000, 1, '3.(warlord knight helmet)')
shopModule:addBuyableItem({'warlord paladin helmet'}, 2498, 600000, 1, '2.(warlord paladin helmet)')
shopModule:addBuyableItem({'warlord mage hat'}, 10016, 600000, 1, '1.(warlord mage helmet)')

shopModule:addBuyableItem({'warlord knight armor'}, 2466, 600000, 1, '3.(warlord knight armor)')
shopModule:addBuyableItem({'warlord paladin armor'}, 8891, 600000, 1, '2.(warlord paladin armor)')
shopModule:addBuyableItem({'warlord mage robe'}, 2656, 600000, 1, '1.(warlord mage robe)')

shopModule:addBuyableItem({'warlord legs'}, 2470, 600000, 1, '4.(warlord legs')

shopModule:addBuyableItem({'tempest shield'}, 2542, 600000, 1, '5.(tempest shield)')
shopModule:addBuyableItem({'warlord knight shield'}, 12644, 600000, 1, '5.(warlord knight shield)')
shopModule:addBuyableItem({'warlord spellbook'}, 8904, 600000, 1, '5.(warlord spellbook)')

shopModule:addBuyableItem({'warlord boots'}, 12646, 600000, 1, '6.(warlord boots)')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
