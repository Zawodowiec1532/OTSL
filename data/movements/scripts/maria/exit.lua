	-- Made by Leon Zawodowiec --
function onStepIn(cid, item, pos)
local exitt = {x=getPlayerStorageValue(cid, 1580), y=getPlayerStorageValue(cid, 1581), z=getPlayerStorageValue(cid, 1582)}
	doPlayerSetExperienceRate(cid, 1.00)
	doTeleportThing(cid, exitt)
	doSendMagicEffect(getCreaturePosition(cid), 37)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp rate has been reseted.")
return true
end