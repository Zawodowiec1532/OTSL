local novaPos = {x=32826, y=32273, z=12} 



function onStepIn(cid, item, position, fromPosition)
    if (item.uid == 14550 and isPlayer(cid) == TRUE) then
        doTeleportThing(cid, novaPos)
    end 
    return TRUE
end
