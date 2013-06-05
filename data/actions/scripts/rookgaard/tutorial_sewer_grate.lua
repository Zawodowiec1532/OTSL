	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6814) ~= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "It is too dark down there! 'Open' this chest in this room and see if you can find something to light the room.")
		doTeleportThing(cid, fromPosition, true) -- no need that I think.. --
		return false
	end
return true
end
