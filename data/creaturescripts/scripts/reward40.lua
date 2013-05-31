function onAdvance(cid, skill, oldlevel, newlevel)
	if(getPlayerStorageValue(cid, 99963) ~= 1 and skill == SKILL__LEVEL and newlevel >= 40) then
		doPlayerAddItem(cid, 2160, 5)
		setPlayerStorageValue(cid, 99963, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have received 5 Crystal Coins because you reached level 40")
	end
return true
end