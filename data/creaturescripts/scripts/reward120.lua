	-- Made by Leon Zawodowiec --
function onAdvance(cid, skill, oldlevel, newlevel)
	if(getPlayerStorageValue(cid, 99965) ~= 1 and skill == SKILL__LEVEL and newlevel >= 120) then
		doPlayerAddItem(cid, 2160, 12)
		setPlayerStorageValue(cid, 99965, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have received 12 Crystal Coins because you reached level 120")
	end
return true
end