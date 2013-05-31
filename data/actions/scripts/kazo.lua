function onUse(cid, item, fromPosition, itemEx, topos)
local newPosition = {x = 32636, y = 31882, z = 2}
	if item.uid == 1000 and item.itemid == 1945 then
		doSendMagicEffect(getThingPos(cid), CONST_ME_POOF)
		doTeleportThing(cid, newPosition, TRUE)
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
	end
	return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end