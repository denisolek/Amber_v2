local bossList = {
    "Sheon", "Rahin", "Sellah", "Apollyon", "Erathal", "Aberlee", "Archemont", "Ghandaur", "Yfrg", "Bethia", "Hellscream", "Bhale", "Sahuan", "Beshata", "Thall"
}
function onKill(creature, target)
    if not creature:isPlayer() then
        return true
    end

    if target:isPlayer() then
        return true
    end

    local isLord = 0
    for i=1, #bossList do
        if bossList[i] == target:getName() then
            isLord = 1
        end
    end

    if isLord == 1 then
        creature:setStorageValue(11001, creature:getStorageValue(11001)+1)
    end

    return true
end