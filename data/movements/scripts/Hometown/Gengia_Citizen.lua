	-- Made by Leon Zawodowiec --
function onStepIn(cid, item, pos)
local gengia = {x=31948, y=32279, z=5}
	if item.actionid == 30022 then
		doPlayerSetTown(cid, 16)
		doTeleportThing(cid, gengia)
		doSendMagicEffect(getCreaturePosition(cid), 12)
		doPlayerSendTextMessage(cid, 22, "You are now a citizen of Gengia")
	end
return true
end