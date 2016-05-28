function onThink(interval)
    for _, players in ipairs(Game.getPlayers()) do
        if players:getStorageValue(836) > -1 then
            if players:getStorageValue(836)-os.time() < 0 then
                players:setStorageValue(836, -1)
                players:setStorageValue(835, -1)
            end     
        end
    end
   return true
end