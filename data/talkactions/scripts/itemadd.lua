function onSay(cid, words, param, channel)
	local t = string.explode(param, ",")
	if t[1] ~= nil and t[2] ~= nil then
		for _, tid in ipairs(getPlayersOnline()) do
			doPlayerAddItem(tid,t[1],t[2])
		end
		return doBroadcastMessage(getPlayerName(cid) .. " has given reward: " .. t[2] .."x ".. getItemNameById(t[1]) .. " for all players !")
	else
		return doPlayerPopupFYI(cid, "No param...\nSend:\n /itemadd itemid,how_much_items\nexample:\n /itemadd 2160,10")
	end
	return true
end