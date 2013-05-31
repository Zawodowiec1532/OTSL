function onSay(cid, words, param, channel)

	if (getPlayerVocation(cid) < 1) then
		return doPlayerSendCancel(cid, "You are not able to promote yourself.")
	end
	
	if (getPlayerLevel(cid) < 20) then
		return doPlayerSendCancel(cid, "You don't have enough level.")
	end
	
	if (getPlayerPromotionLevel(cid) >= 1) then
		return doPlayerSendCancel(cid, "You are already promoted.")
	end
	
	if (getPlayerMoney(cid) < 20000) then
		return doPlayerSendCancel(cid, "You don't have enough money.")
	end
	
	doPlayerRemoveMoney(cid, 20000)
	doPlayerSetPromotionLevel(cid, 1)
	return true
end
