local npcOutfits = {
    [0] = {looktype = 136, text = "Loot Boost: 50%"},
    [1] = {looktype = 137, text = "Range: +2 \nDistance DMG: +10%"},
    [2] = {looktype = 138, text = "Magic Level: +10 \nMagic DMG: +10%"},
    [3] = {looktype = 139, text = "Protection ALL: +15% \nWeapon DMG: +10%"},
    [4] = {looktype = 140, text = "Gold boost: +25%"},
    [5] = {looktype = 141, text = "Mana cost: -25%"},
    [6] = {looktype = 142, text = "DMG: +20% \nHP Absorb: 80%"},
    [7] = {looktype = 147, text = "Movement Speed: +45 \nWeapon DMG: +30%"},
    [8] = {looktype = 148, text = "Healing Spells: +30% \n'Heal Friend' through walls"},
    [9] = {looktype = 149, text = "Protection Death: +20%"},
    [10] = {looktype = 150, text = "Desert Movement Punishment: -100%"},
    [11] = {looktype = 155, text = "NPC PIRATE: unlocked \nPlayer kill: +30.000 gold"},
    [12] = {looktype = 156, text = "NPC ASSASSIN: unlocked \nDistance DMG: +40%"},
    [13] = {looktype = 157, text = "Shop Prices: -25%"},
    [14] = {looktype = 158, text = "NPC SHAMAN: unlocked \nReflect DMG: +25%"},
    [15] = {looktype = 252, text = "Snow Movement Punishment: -100%"}
}


function changeOutfit(cid, x)
    local npc = Creature(cid)
    if npc then
        local outfit = npc:getOutfit()
        outfit.lookType = npcOutfits[x].looktype
        npc:setOutfit(outfit)
        npc:getPosition():sendMagicEffect(32)
    end
    local pos = npc:getPosition()  
    local spectators = Game.getSpectators(pos, false, true, 7, 7)
    for i = 1, #spectators do
        npc:say(npcOutfits[x].text, TALKTYPE_MONSTER_SAY, isInGhostMode, spectators[i], pos)
    end
    if x < 15 then
        x = x + 1
    else
        x = 0
    end
    addEvent(changeOutfit, 5000, cid, x) 
end

local started = 0
function onThink(cid)         
    local npcHandler = NpcHandler:new(keywordHandler)
    npcHandler:onThink(cid) 
    local nextOutfit = 0
    if started == 0 then
    local cid = getNpcCid()
        changeOutfit(cid, nextOutfit) 
        started = 1  
    end       
end