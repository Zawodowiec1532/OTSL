	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6814) ~= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "It is too dark down there! 'Open' this chest in this room and see if you can find something to light the room.")
		doTeleportThing(cid, getClosestFreeTile(cid, {x = fromPosition.x + 2, y = fromPosition.y - 3, z = fromPosition.z}), true)
		doSendMagicEffect(getPlayerPosition(cid), 10)
		doSendMagicEffect({x = 32033, y = 32278, z = 8}, 55)
		return true
	end
return false
end
