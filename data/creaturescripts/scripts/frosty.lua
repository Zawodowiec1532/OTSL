local monsters = {
	["frost dragon"] = 5615,
}

function onKill(cid, target)
	local monster = monsters[getCreatureName(target):lower()]
	if(isPlayer(target) == FALSE and monster and getPlayerStorageValue(cid, 9014) == 2) then
		if getPlayerStorageValue(cid, monster) < 389 then 
			local killedMonsters = getPlayerStorageValue(cid, monster)
            if(killedMonsters == -1) then
                killedMonsters = 1
			end
			setPlayerStorageValue(cid, monster, killedMonsters + 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed " .. killedMonsters .. " of 389 Frost Dragons.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed enough Frost Dragons. You should back to Inferno.")
			setPlayerStorageValue(cid, 9014, 3)
		end
	end
return true
end