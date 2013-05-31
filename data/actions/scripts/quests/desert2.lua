	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 7163) ~= 1 then
		bag = doPlayerAddItem(cid, 1991, 1)
		doAddContainerItem(bag, 2200, 1)
		doAddContainerItem(bag, 2214, 1)
		doAddContainerItem(bag, 2162, 1)
		doAddContainerItem(bag, 2193, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a green bag.")
		setPlayerStorageValue(cid, 7163, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This chest is empty.")
	end
return true
end 