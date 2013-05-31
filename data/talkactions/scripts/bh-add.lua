function onSay(cid, words, param)
if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] Use: \"!hunt [prize],[nick]\" where prize is for example 1(k).")
		return TRUE
	end
	local t = string.explode(param, ",")
	if(not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] Use: \"!hunt [prize],[nick]\" where prize is for example 1(k).")
		return TRUE
	end
	local sp_id = getPlayerGUIDByName(t[2])
	if sp_id == nil then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] This player doesn't exists.")		
		return TRUE
	end
    local result_plr = db.getResult("SELECT * FROM `bounty_hunters` WHERE `sp_id` = "..sp_id.." AND `killed` = 0;")
    if(result_plr:getID() ~= -1) then
		is = tonumber(result_plr:getDataInt("sp_id"))
		result_plr:free()
    else
		is = 0
    end
    prize = tonumber(t[1])
	if(prize == nil or prize < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] Use: \"!hunt [prize],[nick]\" where prize is for example 1(k).")
		return TRUE
	end
	if(prize >= 100000000000000000000) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] Sorry, you typed too big number!")
		return TRUE
	end
	if is ~= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] This player has already hunted.")	
		return TRUE
	end
		if doPlayerRemoveMoney(cid, prize*1000) == TRUE then
		    db.executeQuery("INSERT INTO `bounty_hunters` VALUES (NULL,"..getPlayerGUID(cid)..","..sp_id..",0," .. os.time() .. ","..prize..",0,0);")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] Hunt has been added!")			
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[BOUNTY HUNTERS] You haven't got enough money!")			
		end
	return 1
end