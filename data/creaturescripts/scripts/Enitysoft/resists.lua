local resists = { 
    -- WIZARD
    {101, COMBAT_DEATHDAMAGE, 20},          -- wizard full
    {102, COMBAT_DEATHDAMAGE, 10},          -- wizard first
    {103, COMBAT_DEATHDAMAGE, 5},           -- wizard second
    {104, COMBAT_DEATHDAMAGE, 5},           -- wizard none 
    -- KNIGHT
    {105, COMBAT_PHYSICALDAMAGE, 15},       -- knight full
    {105, COMBAT_ENERGYDAMAGE, 15},         -- knight full
    {105, COMBAT_FIREDAMAGE, 15},           -- knight full
    {105, COMBAT_UNDEFINEDDAMAGE, 15},      -- knight full
    {105, COMBAT_DROWNDAMAGE, 15},          -- knight full
    {105, COMBAT_ICEDAMAGE, 15},            -- knight full
    {105, COMBAT_HOLYDAMAGE, 15},           -- knight full
    {105, COMBAT_DEATHDAMAGE, 15},          -- knight full
    {105, COMBAT_EARTHDAMAGE, 15},          -- knight full
    {106, COMBAT_PHYSICALDAMAGE, 10},       -- knight first
    {106, COMBAT_ENERGYDAMAGE, 10},         -- knight first
    {106, COMBAT_FIREDAMAGE, 10},           -- knight first
    {106, COMBAT_UNDEFINEDDAMAGE, 10},      -- knight first
    {106, COMBAT_DROWNDAMAGE, 10},          -- knight first
    {106, COMBAT_ICEDAMAGE, 10},            -- knight first
    {106, COMBAT_HOLYDAMAGE, 10},           -- knight first
    {106, COMBAT_DEATHDAMAGE, 10},          -- knight first
    {106, COMBAT_EARTHDAMAGE, 10},          -- knight first
    {107, COMBAT_PHYSICALDAMAGE, 5},        -- knight none
    {107, COMBAT_ENERGYDAMAGE, 5},          -- knight none
    {107, COMBAT_FIREDAMAGE, 5},            -- knight none
    {107, COMBAT_UNDEFINEDDAMAGE, 5},       -- knight none
    {107, COMBAT_DROWNDAMAGE, 5},           -- knight none
    {107, COMBAT_ICEDAMAGE, 5},             -- knight none
    {107, COMBAT_HOLYDAMAGE, 5},            -- knight none
    {107, COMBAT_DEATHDAMAGE, 5},           -- knight none
    {107, COMBAT_EARTHDAMAGE, 5},           -- knight none
    -- NIGHTMARE
    {108, COMBAT_PHYSICALDAMAGE, 25},       -- nightmare full
    {108, COMBAT_ENERGYDAMAGE, 25},         -- nightmare full
    {108, COMBAT_FIREDAMAGE, 25},           -- nightmare full
    {108, COMBAT_UNDEFINEDDAMAGE, 25},      -- nightmare full
    {108, COMBAT_DROWNDAMAGE, 25},          -- nightmare full
    {108, COMBAT_ICEDAMAGE, 25},            -- nightmare full
    {108, COMBAT_HOLYDAMAGE, 25},           -- nightmare full
    {108, COMBAT_DEATHDAMAGE, 25},          -- nightmare full
    {108, COMBAT_EARTHDAMAGE, 25},          -- nightmare full
    {109, COMBAT_PHYSICALDAMAGE, 15},       -- nightmare first
    {109, COMBAT_ENERGYDAMAGE, 15},         -- nightmare first
    {109, COMBAT_FIREDAMAGE, 15},           -- nightmare first
    {109, COMBAT_UNDEFINEDDAMAGE, 15},      -- nightmare first
    {109, COMBAT_DROWNDAMAGE, 15},          -- nightmare first
    {109, COMBAT_ICEDAMAGE, 15},            -- nightmare first
    {109, COMBAT_HOLYDAMAGE, 15},           -- nightmare first
    {109, COMBAT_DEATHDAMAGE, 15},          -- nightmare first
    {109, COMBAT_EARTHDAMAGE, 15},          -- nightmare first
    {110, COMBAT_PHYSICALDAMAGE, 15},       -- nightmare second
    {110, COMBAT_ENERGYDAMAGE, 15},         -- nightmare second
    {110, COMBAT_FIREDAMAGE, 15},           -- nightmare second
    {110, COMBAT_UNDEFINEDDAMAGE, 15},      -- nightmare second
    {110, COMBAT_DROWNDAMAGE, 15},          -- nightmare second
    {110, COMBAT_ICEDAMAGE, 15},            -- nightmare second
    {110, COMBAT_HOLYDAMAGE, 15},           -- nightmare second
    {110, COMBAT_DEATHDAMAGE, 15},          -- nightmare second
    {110, COMBAT_EARTHDAMAGE, 15},          -- nightmare second
    {111, COMBAT_PHYSICALDAMAGE, 10},      -- nightmare none
    {111, COMBAT_ENERGYDAMAGE, 10},        -- nightmare none
    {111, COMBAT_FIREDAMAGE, 10},          -- nightmare none
    {111, COMBAT_UNDEFINEDDAMAGE, 10},     -- nightmare none
    {111, COMBAT_DROWNDAMAGE, 10},         -- nightmare none
    {111, COMBAT_ICEDAMAGE, 10},           -- nightmare none
    {111, COMBAT_HOLYDAMAGE, 10},          -- nightmare none
    {111, COMBAT_DEATHDAMAGE, 10},         -- nightmare none
    {111, COMBAT_EARTHDAMAGE, 10},         -- nightmare none
    -- DEMON HUNTER
    {112, COMBAT_DEATHDAMAGE, 8},          -- demonhunter full
    {113, COMBAT_DEATHDAMAGE, 5},          -- demonhunter first
    {114, COMBAT_DEATHDAMAGE, 5},           -- demonhunter second
    {115, COMBAT_DEATHDAMAGE, 2}            -- demonhunter none 


} -- {subId, damageType, resistancePercent}

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if primaryType == COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    for i = 1, #resists do
        if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, resists[i][1]) then
            if primaryType == resists[i][2] then
                primaryDamage = (primaryDamage - (primaryDamage * (resists[i][3] / 100)))
            end
            if secondaryType == resists[i][2] then
                secondaryDamage = (secondaryDamage - (secondaryDamage * (resists[i][3] / 100)))
            end
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end