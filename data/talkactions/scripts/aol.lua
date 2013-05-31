	-- Made by Leon Zawodowiec --
function onSay(cid, words, param)
	local cena = 10000 -- Wpisz w GP // 10k = 1cc
	if (doPlayerRemoveMoney(cid, cena) == TRUE) then
		doPlayerAddItem(cid, 2173, 1)
		doSendMagicEffect(getPlayerPosition(cid), 12)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You bought an amulet of loss.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You don't have enough money! You need ".. cena .." gp.")
	end
return true
end