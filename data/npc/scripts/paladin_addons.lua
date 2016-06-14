local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local talkState = {}
local rtnt = {}
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I need your help and I'll reward you with nice addons for paladins if you help me! Just say {addons} or {help} if you don't know what to do.")

addoninfo = {
['full citizen'] = {cost = 0, items = {{7140,1}}, outfit_female = 136, outfit_male = 128, addon = 3, storageID = 10014, storageOutfit = 10011},
['first nobleman addon'] = {cost = 2500000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10028, storageOutfit = 10027},
['second nobleman addon'] = {cost = 2500000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10029, storageOutfit = 10027},
['first beggar addon'] = {cost = 0, items = {{2401,1}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10060, storageOutfit = 10059},
['second beggar addon'] = {cost = 0, items = {{5802,1}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10061, storageOutfit = 10059},
['first pirate addon'] = {cost = 0, items = {{11426,1}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10040, storageOutfit = 10039},
['second pirate addon'] = {cost = 0, items = {{11424,1}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10041, storageOutfit = 10039},
['full oriental'] = {cost = 0, items = {{11423,1}}, outfit_female = 150, outfit_male = 146, addon = 3, storageID = 10054, storageOutfit = 10051},
['first norseman addon'] = {cost = 0, items = {{2424,1}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10056, storageOutfit = 10055},
['second norseman addon'] = {cost = 0, items = {{10575,3}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10057, storageOutfit = 10055},
['first warrior addon'] = {cost = 0, items = {{10020,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10032, storageOutfit = 10031},
['second warrior addon'] = {cost = 0, items = {{7417,1}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10033, storageOutfit = 10031},
['first hunter addon'] = {cost = 0, items = {{10562,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10024, storageOutfit = 10023},
['second hunter addon'] = {cost = 0, items = {{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10025, storageOutfit = 10023},
['first assassin addon'] = {cost = 0, items = {{9678,10}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10048, storageOutfit = 10047},
['second assassin addon'] = {cost = 0, items = {{7405,1}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10049, storageOutfit = 10047}
}

function creatureSayCallback(cid, type, msg)
local talkUser = cid
local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if(player:getVocation():getId() ~= 3 and player:getVocation():getId() ~= 7) then
        selfSay("The only vocation I talk to are paladins. Go find you own place!", cid)
        return false
    end

	if addoninfo[msg] ~= nil then
		if (getPlayerStorageValue(cid, addoninfo[msg].storageID) ~= -1) then
				npcHandler:say('You already have this addon!', cid)
				npcHandler:resetNpc()
		elseif (getPlayerStorageValue(cid, addoninfo[msg].storageOutfit) == -1) then
				npcHandler:say('You need outfit first!', cid)
				npcHandler:resetNpc()
		else
		local itemsTable = addoninfo[msg].items
		local items_list = ''
			if table.maxn(itemsTable) > 0 then
				for i = 1, table.maxn(itemsTable) do
					local item = itemsTable[i]
					items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()
					if i ~= table.maxn(itemsTable) then
						items_list = items_list .. ', '
					end
				end
			end
		local text = ''
			if (addoninfo[msg].cost > 0) then
				text = addoninfo[msg].cost .. ' gp'
			elseif table.maxn(addoninfo[msg].items) then
				text = items_list
			elseif (addoninfo[msg].cost > 0) and table.maxn(addoninfo[msg].items) then
				text = items_list .. ' and ' .. addoninfo[msg].cost .. ' gp'
			end
			npcHandler:say('For ' .. msg .. ' you will need ' .. text .. '. Do you have it all with you?', cid)
			rtnt[talkUser] = msg
			talkState[talkUser] = addoninfo[msg].storageID
			return true
		end
	elseif msgcontains(msg, "yes") then
		if (talkState[talkUser] > 10010 and talkState[talkUser] < 10100) then
			local items_number = 0
			if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then
				for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do
					local item = addoninfo[rtnt[talkUser]].items[i]
					if (getPlayerItemCount(cid,item[1]) >= item[2]) then
						items_number = items_number + 1
					end
				end
			end
			if(getPlayerMoney(cid) >= addoninfo[rtnt[talkUser]].cost) and (items_number == table.maxn(addoninfo[rtnt[talkUser]].items)) then
				doPlayerRemoveMoney(cid, addoninfo[rtnt[talkUser]].cost)
				if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then
					for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do
						local item = addoninfo[rtnt[talkUser]].items[i]
						doPlayerRemoveItem(cid,item[1],item[2])
					end
				end
				doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_male, addoninfo[rtnt[talkUser]].addon)
				doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_female, addoninfo[rtnt[talkUser]].addon)
				setPlayerStorageValue(cid,addoninfo[rtnt[talkUser]].storageID,1)
				local player = Player(cid)
				player:getPosition():sendMagicEffect(15)
				npcHandler:say('Here you are.', cid)
				updateOutfitStorage(player)

			else
				npcHandler:say('You do not have needed items!', cid)
			end
			rtnt[talkUser] = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc()
			return true
		end
	elseif msgcontains(msg, "addon") then
		npcHandler:say('This is the list of addons avaible to buy here:\n- {full citizen}\n- {first nobleman addon}\n- {second nobleman addon}\n- {first beggar addon}\n- {second beggar addon}\n- {first pirate addon}\n- {second pirate addon}\n- {full oriental}\n- {first norseman addon}\n- {second norseman addon}\n- {first hunter addon}\n- {second hunter addon}\n- {first assassin addon}\n- {second assassin addon}\n- {first warrior addon}\n- {second warrior addon}', cid)				
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
		return true
	elseif msgcontains(msg, "help") then
		npcHandler:say('This is the list of addons avaible to buy here:\n- {full citizen}\n- {first nobleman addon}\n- {second nobleman addon}\n- {first beggar addon}\n- {second beggar addon}\n- {first pirate addon}\n- {second pirate addon}\n- {full oriental}\n- {first norseman addon}\n- {second norseman addon}\n- {first hunter addon}\n- {second hunter addon}\n- {first assassin addon}\n- {second assassin addon}\n- {first warrior addon}\n- {second warrior addon}', cid)						
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
		return true
	else
		if talkState[talkUser] ~= nil then
			if talkState[talkUser] > 0 then
			npcHandler:say('Come back when you get these items.', cid)
			rtnt[talkUser] = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc()
			return true
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())