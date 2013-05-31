	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 1740) ~= 1 then
		doPlayerAddItem(cid, 2152, 100)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found 100 platinum coins.")
		setPlayerStorageValue(cid, 1740, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This chest is empty.")
	end
return true
end 