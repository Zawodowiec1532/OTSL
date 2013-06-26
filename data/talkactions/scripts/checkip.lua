function onSay(cid, words, param)
	local ip = 584127068
	local p = doConvertIntegerToIp(ip)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, p)
return true
end