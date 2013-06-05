	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6810) ~= 1 then
		local bag = doPlayerAddItem(cid, 1987, 1)
		doAddContainerItem(bag, 2651, 1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have found a bag.")
		setPlayerStorageValue(cid, 6810, 1)
		doPlayerSendTutorial(cid, 5)
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "The chest is empty.")
	end
return true
end
