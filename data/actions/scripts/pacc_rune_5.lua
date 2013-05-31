	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerPremiumDays(cid) + 5 < 30 then
		doPlayerAddPremiumDays(cid, 5)
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You received 5 days of premium.")
		doSendMagicEffect(toPosition, 12)
		doSendAnimatedText(toPosition, 'ReLog PLX', 180)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Now you have " .. getPlayerPremiumDays(cid) .. " premium days. You can\'t have more than 30 premium days.")
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
	end
return true
end