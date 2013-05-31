local telePos = {x=32602, y=31397, z=14}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getPlayerStorageValue(cid, 14201) == 1 then
		doTeleportThing(cid, telePos, TRUE)
		setPlayerStorageValue(cid, 14201, -1)
		else
		doTeleportThing(cid, fromPosition, true)
              doPlayerSendTextMessage(cid,21,"You did not yet talk to Pythius The Rotten And started the quest.")
	end
end