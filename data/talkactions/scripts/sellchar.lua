function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Podaj wartosc twojej postaci.")
		return true
	end
if getPlayerLevel(cid) > 39 then
	local t = string.explode(param, ",")
	t[1] = tonumber(t[1])
	if(not t[1]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Podaj cyfre...")
		return true
	end
		if (t[1] <= 10000) and (t[1] > 0) then
account_id = db.getResult("SELECT `account_id` FROM `players` WHERE `name` = '"..getPlayerName(cid).."';")
uzyte_id = db.getResult("SELECT `uzyte` FROM `players` WHERE `name` = '"..getPlayerName(cid).."';")
local account_id = account_id:getDataInt("account_id")
local uzyte_id = uzyte_id:getDataInt("uzyte")
		if (uzyte_id == 0) then
 db.executeQuery("INSERT INTO `sale` (`id`, `account_id`, `points`) VALUES ('".. getPlayerGUID(cid).."', '" .. account_id .. "', '" .. param .. "');")
 db.executeQuery("UPDATE `players` SET `uzyte`=1 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your character has been added to sale list.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Juz wystawiles ta postac na aukcje...")
			return 0
		end
 else
 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Cena powinna byc wyzsza od 0 i mniejsza od 10000.")
 return 0
end
else
 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Level postaci musi byc wiekszy od 40.")
return 0
end
return true

end  