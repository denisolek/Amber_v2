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

shopModule:addBuyableItem({'paralyze'}, 2278, 20000, 1, '2.(paralyze rune)')
shopModule:addBuyableItem({'pox'}, 2299, 20000, 1, '2.(pox rune)')

shopModule:addBuyableItem({'instant death'}, 2300, 25000, 1, '1.(instant death rune)')
shopModule:addBuyableItem({'ghost'}, 2314, 10000, 1, '1.(ghost rune)')


shopModule:addBuyableItem({'hyper potion'}, 8474, 30000, 1, '4.(hyper potion)')
shopModule:addBuyableItem({'icy giant sword'}, 7767, 110000, 2, '4.(icy giant sword)')
shopModule:addBuyableItem({'icy giant axe'}, 7772, 90000, 3, '4.(icy giant axe)')
shopModule:addBuyableItem({'icy giant club'}, 7775, 70000, 5, '4.(icy giant club)')

shopModule:addBuyableItem({'desinmwall'}, 2283, 20000, 1, '3.(desimwall rune)')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
