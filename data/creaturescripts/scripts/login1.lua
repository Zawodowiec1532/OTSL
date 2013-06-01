function onLogin(cid)
	local config =	{
		texttype = TALKTYPE_CHANNEL_W,
		channelID = 11,
		textprefix = "Login:",
		textsuffix = "has logged in!"
	}

	local showGamemasters = getBooleanFromString(getConfigValue('displayGamemastersWithOnlineCommand'))
	for _, pid in ipairs(getChannelUsers(config.channelID)) do
		if((showGamemasters or getPlayerCustomFlagValue(pid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES) or not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES)) and (not isPlayerGhost(cid) or getPlayerGhostAccess(pid) >= getPlayerGhostAccess(cid))) then
			doPlayerSendChannelMessage(pid, cid, config.textprefix.." "..getCreatureName(cid).." "..config.textsuffix, config.texttype, config.channelID)
		end
	end
return true
end