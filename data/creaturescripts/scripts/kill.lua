function onKill(cid, target)
if isPlayer(target) == TRUE then
---- BOUNTY HUNTERS START -----
pid = cid
pid2 = getPlayerGUID(target)
    local result_plr = db.getResult("SELECT * FROM `bounty_hunters` WHERE `sp_id` = "..pid2.." AND `killed` = 0;")
    if(result_plr:getID() ~= -1) then
    prize = tonumber(result_plr:getDataInt("prize"))
    bid = tonumber(result_plr:getDataInt("id"))
	result_plr:free()
    else
    prize = 0
	bid = 0
    end
if (bid ~= 0 and prize ~= 0 and not(getTileInfo(getCreaturePosition(cid)).pvp)) then
    db.executeQuery("UPDATE `bounty_hunters` SET `killed` = 1, `k_id`="..getPlayerGUID(cid)..", `kill_time` = " .. os.time() .. " WHERE `id`  = "..bid..";")
	doPlayerAddMoney(cid,prize*1000)
	doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'[BOUNTY HUNTERS] You killed hunted player, so you gained the reward!')
end	
---- BOUNTY HUNTERS END -----
end
return TRUE
end