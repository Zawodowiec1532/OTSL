local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler')),
	startPosition = {x = getConfigValue('newPlayerSpawnPosX'), y = getConfigValue('newPlayerSpawnPosY'), z = getConfigValue('newPlayerSpawnPosZ')}
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			doTeleportThing(cid, config.startPosition, true)
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
			doPlayerSendTutorial(cid, 1)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "Idle")
	
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	
	registerCreatureEvent(cid, "inquisitionPortals")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "no-exp")
	registerCreatureEvent(cid, "Aol")
	registerCreatureEvent(cid, "chargeamulet")
	registerCreatureEvent(cid, "AdvanceSave")

	registerCreatureEvent(cid,'lvlup')

	registerCreatureEvent(cid, "ArenaKill")

	registerCreatureEvent(cid, "reward40")
	registerCreatureEvent(cid, "reward70")
	registerCreatureEvent(cid, "reward120")
	registerCreatureEvent(cid, "reward190")

	registerCreatureEvent(cid, "PythiusTheRotten")

	registerCreatureEvent(cid, "zzz")

	registerCreatureEvent(cid, "BountyHunter")

	registerCreatureEvent(cid, "Greg")
	registerCreatureEvent(cid, "guruyan")

	registerCreatureEvent(cid, "creaturenight")
	registerCreatureEvent(cid, "creaturefrost")
	
    -- Arena 1 (reset)
	if getPlayerStorageValue(cid, 42309) < 1 then
		for i = 42300, 42309 do
			setPlayerStorageValue(cid, i, 0)
		end
	end

    -- Arena 2 (reset)
	if getPlayerStorageValue(cid, 42319) < 1 then
		for i = 42310, 42319 do
			setPlayerStorageValue(cid, i, 0)
		end
	end

    -- Arena 3 (reset)
	if getPlayerStorageValue(cid, 42329) < 1 then
		for i = 42320, 42329 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	if getPlayerStorageValue(cid, 42355) == -1 then
		setPlayerStorageValue(cid, 42355, 0)
	end
	setPlayerStorageValue(cid, 42350, 0)
	setPlayerStorageValue(cid, 42352, 0) 

	if getPlayerLevel(cid) < 50 then
		for i = 1, 5 do
			doPlayerAddBlessing(cid, i)
		end
		doSendMagicEffect(getPlayerPosition(cid), 14)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are under 50 lvl. FREE BLESSINGS !")
	end
return true
end