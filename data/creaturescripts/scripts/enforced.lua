function remove_exp(cid, old)
    if isPlayer(cid) then
        doPlayerAddExperience(cid, - (getPlayerExperience(cid) - old))
    end
end

function onKill(cid, target, deathList)
    if not isPlayer(target) then
        return true
    end
   
    if (getPlayerIp(cid) == getPlayerIp(target)) then
        addEvent(remove_exp, 100, cid, getPlayerExperience(cid))
    end
    return true
end