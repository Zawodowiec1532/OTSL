function onSay(cid, words, param, channel)
	if(param ~= '') then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Write this command without param !")
		return 0
	end
account_id = db.getResult("SELECT `account_id` FROM `players` WHERE `name` = '"..getPlayerName(cid).."';")
uzyte_id = db.getResult("SELECT `uzyte` FROM `players` WHERE `name` = '"..getPlayerName(cid).."';")
local account_id = account_id:getDataInt("account_id")
local uzyte_id = uzyte_id:getDataInt("uzyte")
		if (uzyte_id == 1) then
			db.executeQuery("UPDATE `players` SET `uzyte`=0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
			db.executeQuery("DELETE FROM `sale` WHERE `account_id` = " .. account_id .. ";")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your character has been sucessfull removed from the sale list !")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don\'t have this character on the sale list !")
			return 0
		end

 return true
end