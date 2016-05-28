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


shopModule:addBuyableItem({'mana potion'}, 7620, 2, 100, 'mana potion')
shopModule:addBuyableItem({'strong mana potion'}, 7589, 2, 100, 'strong mana potion')
shopModule:addBuyableItem({'great mana potion'}, 7590, 2, 100, 'great mana potion')
shopModule:addBuyableItem({'strong health potion'}, 7588, 2, 100, 'strong health potion')
shopModule:addBuyableItem({'great health potion'}, 7591, 2, 100, 'great health potion')
shopModule:addBuyableItem({'ultimate health potion'}, 8473, 2, 100, 'ultimate health potion')
shopModule:addBuyableItem({'great spirit potion'}, 8472, 2, 100, 'great spirit potion')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

