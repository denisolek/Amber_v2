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

shopModule:addBuyableItem({'basic rings'}, 2209, 50000, 1, 'basic ring')
shopModule:addBuyableItem({'hero ring'}, 2208, 350000, 1, 'hero ring')
shopModule:addBuyableItem({'energy ring'}, 2167, 600000, 1, 'energy ring')
shopModule:addBuyableItem({'warlord ring'}, 2207, 800000, 1, 'warlord ring')
shopModule:addBuyableItem({'magic ring'}, 2166, 600000, 1, 'magic ring')
shopModule:addBuyableItem({'tank ring'}, 2213, 600000, 1, 'tank ring')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

