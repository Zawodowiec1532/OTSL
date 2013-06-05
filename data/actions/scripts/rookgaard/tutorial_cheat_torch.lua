	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6814) ~= 1 then
		doPlayerAddItem(cid, 2050)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have found a torch.")
		setPlayerStorageValue(cid, 6814, 1)
		doPlayerSendTutorial(cid, 6)
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "The chest is empty.")
	end
return true
end
