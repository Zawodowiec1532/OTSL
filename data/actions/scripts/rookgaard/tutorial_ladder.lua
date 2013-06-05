	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6811) ~= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You still need to kill at least 3 cockroaches and bring their legs to Santiago. Don't give up!")
		doTeleportThing(cid, fromPosition, true) -- no need that I think.. --
		return false
	end
return true
end
