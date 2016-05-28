function onThink(interval)
    for _, players in ipairs(Game.getPlayers()) do
        if players:getStorageValue(9800) > -1 then
            if players:getStorageValue(9800)-os.time() < 0 then
                players:setStorageValue(9800, -1)
            end     
        end
    end
   return true
end