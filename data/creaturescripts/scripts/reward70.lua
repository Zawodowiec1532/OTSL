function onAdvance(cid, skill, oldlevel, newlevel)
	if(getPlayerStorageValue(cid, 99964) ~= 1 and skill == SKILL__LEVEL and newlevel >= 70) then
		doPlayerAddItem(cid, 2160, 10)
		setPlayerStorageValue(cid, 99964, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have received 10 Crystal Coins because you reached level 70")
	end
return true
end