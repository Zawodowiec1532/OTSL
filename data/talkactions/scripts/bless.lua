function onSay(cid, words, param)
	local fail = 0
	if getPlayerLevel(cid) < 31 then
		cost = 2000
	else
		cost = ((getPlayerLevel(cid) - 30) * 200) + 2000
	end

	if cost > 6000 then
		cost = 6000
	end

	for i = 1, 5 do
		if getPlayerBlessing(cid, i) then
			fail = fail + 1
		else
			if doPlayerRemoveMoney(cid, cost) == TRUE then
				doPlayerAddBlessing(cid, i)
				if i == 5 and not(fail == 5) then
					doSendMagicEffect(getPlayerPosition(cid),14)
					doPlayerSendTextMessage(cid, 22, "You have purchased full bless.")
				end
			else
				doPlayerSendCancel(cid, "You do not have enough money to buy all the blessings!")
				break
			end
		end
	end
	if fail == 5 then
		doPlayerSendCancel(cid, "You already have all the blessings!")
	end
return true
end