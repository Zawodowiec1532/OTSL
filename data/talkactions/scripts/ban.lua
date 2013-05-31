	-- /ban nick, 3, comment
	-- `id`, 3, acc_id, active`1`, os.time()+x, os.time, admin_id, comment
function onSay(cid, words, param, channel)
	if (param == "") then
		return true
	end
	local t = string.explode(param, ",")
	t[2] = tonumber(t[2])
	dni = t[2]

	local id = db.getResult("SELECT `id` FROM `players` WHERE `name` = '"..t[1].."';")
	local id = id:getDataInt("id")
	local online = db.getResult("SELECT `online` FROM `players` WHERE `name` = '"..t[1].."';")
	local online = online:getDataInt("online")
	local acc_id = db.getResult("SELECT `account_id` FROM `players` WHERE `id` = '"..id.."';")
	local acc_id = acc_id:getDataInt("account_id")
	local comment = t[3]
	
	if dni ~= -1 then
		x = os.time() + dni * 24 * 60 * 60
	else
		x = -1
	end
	
	db.executeQuery("INSERT INTO `bans` (`type`, `value`, `param`, `active`, `expires`, `added`, `admin_id`, `comment`) VALUES ( '3', '".. acc_id .."', '".. id .."', 1, '".. x .. "', '".. os.time() .."', '".. getPlayerGUID(cid) .."', '".. t[3] .."');")
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ban zostal dodany na konto o ID: ".. acc_id ..", graczowi: ".. t[1] .." na czas: ".. t[2] .." dni. Powod: ".. t[3] .."")
return true
end