local monsters = {
	--name = storage
	["nightmare"] = 5616,
}

function onKill(cid, target)
	local monster = monsters[getCreatureName(target):lower()]
	if(isPlayer(target) == FALSE and monster and getPlayerStorageValue(cid, 9015) == 2) then
		if getPlayerStorageValue(cid, monster) < 333 then 
			local killedMonsters = getPlayerStorageValue(cid, monster)
            if(killedMonsters == -1) then
                killedMonsters = 1
			end
			setPlayerStorageValue(cid, monster, killedMonsters + 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed " .. killedMonsters .. " of 333 Nightmares.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed enough Nightmares. You should back to Elite Warrior.")
			setPlayerStorageValue(cid, 9015, 3)
		end
	end
	return TRUE
end