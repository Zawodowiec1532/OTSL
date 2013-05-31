	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
    doRemoveItem(item.uid, 1)
	doPlayerAddItem(cid, 9675, 3)
	doSendAnimatedText(getPlayerPosition(cid), "chrupot.. chrupot..", TEXTCOLOR_GREEN)
	doCreatureSay(cid, "Bedzie jaranie !", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), 4)
return true
end