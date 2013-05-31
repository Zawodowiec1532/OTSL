
function onSay(cid, words, param, channel)
		if param == "vials" then
			local max_vials = 300
			local v = max_vials / 3
			local a = 0
			local cena = 5
			local id1 = 7634
			local id2 = 7635
			local id3 = 7636
			local ilosc1 = getPlayerItemCount(cid, 7634)
			local ilosc2 = getPlayerItemCount(cid, 7635)
			local ilosc3 = getPlayerItemCount(cid, 7636)
			if (getPlayerStorageValue(cid,46002) < (os.time() - 1)) then
				if (ilosc1 > v) then
					ilosc1 = v
					a = 1
				end
				if (ilosc2 > v) then
					ilosc2 = v
					a = 1
				end
				if (ilosc3 > v) then
					ilosc3 = v
					a = 1
				end
				if (doPlayerRemoveItem(cid, id1, ilosc1)== TRUE) then
					doPlayerAddMoney(cid, ilosc1 * cena)
				end
				if (doPlayerRemoveItem(cid, id2, ilosc2)== TRUE) then
					doPlayerAddMoney(cid, ilosc2 * cena)
				end
				if (doPlayerRemoveItem(cid, id3, ilosc3)== TRUE) then
					doPlayerAddMoney(cid, ilosc3 * cena)
				end
				if a == 1 then
					wiad1 = "Sold ".. ilosc1 + ilosc2 + ilosc3.." vials for ".. (ilosc1 + ilosc2 + ilosc3) * 5 .."gps. You have more vials say this command again."
				else
					wiad1 = "Sold all (".. ilosc1 + ilosc2 + ilosc3..") vials for ".. (ilosc1 + ilosc2 + ilosc3) * 5 .."gps."
				end
				setPlayerStorageValue(cid,46002,os.time())
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, wiad1)
			else
				doPlayerSendCancel(cid, "Sorry, you must wait 1 sec.")
			end
		elseif param == "pearls" then
		local sapphire = getPlayerItemCount(cid, 2146)
		local diamond = getPlayerItemCount(cid, 2145)
		local ruby = getPlayerItemCount(cid, 2147)
		local emerald = getPlayerItemCount(cid, 2149)
		local amethyst = getPlayerItemCount(cid, 2150)
		local white = getPlayerItemCount(cid, 2143)
		local black = getPlayerItemCount(cid, 2144)
		local counts = {sapphire,diamond,ruby,emerald,amethyst,white,black}
		local ids = {2146,2145,2147,2149,2150,2143,2144}
		local prices = {250,300,250,250,200,160,280}
			if counts[1] == 0 and counts[2] == 0 and counts[3] == 0 and counts[4] == 0 and counts[5] == 0 and counts[6] == 0 and counts[7] == 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don\'t have any pearls!")
	else
	for i = 1, #ids do
		if counts[i] == 0 then
		else
			doPlayerRemoveItem(cid, ids[i], counts[i])
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sold " .. counts[i] .. " " .. getItemNameById(ids[i]) .. "(s)!")
			doPlayerAddMoney(cid, counts[i] * prices[i])
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "For : " .. (counts[i] * prices[i]) / 1000 .. "k!")
			end
	end
	return 1
end
		end

return true
end  