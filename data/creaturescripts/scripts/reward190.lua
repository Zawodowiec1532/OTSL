	-- Made by Leon Zawodowiec --
function onAdvance(cid, skill, oldlevel, newlevel)
	if(getPlayerStorageValue(cid, 99966) ~= 1 and skill == SKILL__LEVEL and newlevel >= 190) then
		doPlayerAddItem(cid, 2160, 15)
		setPlayerStorageValue(cid, 99966, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have received 15 Crystal Coins because you reached level 190")
	end
return true
end