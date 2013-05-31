function onStepIn(cid, item, pos)

local temple = {x=31914, y=32713, z=12}
local temple2 = {x=32968, y=32626, z=5}

    if item.actionid == 14429 then
		doTeleportThing(cid,temple)
        doSendMagicEffect(getCreaturePosition(cid),53)
    elseif item.actionid == 14437 then
	doTeleportThing(cid,temple2)

        end
    return 1
end  