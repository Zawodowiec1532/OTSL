function onKill(cid, target)
	if (getCreatureName(target) == "Dragon Lord") and getPlayerStorageValue(cid, 32101) == 1 then
		setPlayerStorageValue(cid, 32101, 2)
		doPlayerSendTextMessage(cid,22, "You have killed Dragon Lord, talk to Greg to receive a reward.")

	elseif (getCreatureName(target) == "Fury") and getPlayerStorageValue(cid, 32103) == 1 then
		setPlayerStorageValue(cid, 32103, 2)
		doPlayerSendTextMessage(cid,22, "You have killed Fury, talk to Greg to receive a reward.")

	elseif (getCreatureName(target) == "Grim Reaper") and getPlayerStorageValue(cid, 32104) == 1 then
		setPlayerStorageValue(cid, 32104, 2)
		doPlayerSendTextMessage(cid,22, "You have killed Grim Reaper, talk to Greg to receive a reward.")

	elseif (getCreatureName(target) == "Demon") and getPlayerStorageValue(cid, 32105) == 1 then
		setPlayerStorageValue(cid, 32105, 2)
		doPlayerSendTextMessage(cid,22, "You have killed Demon, talk to Greg to receive a reward.")

	elseif (getCreatureName(target) == "Orshabaal") and getPlayerStorageValue(cid, 32106) == 1 then
		setPlayerStorageValue(cid, 32106, 2)
		doPlayerSendTextMessage(cid,22, "You have killed Orshabaal, talk to Greg to receive a reward.")
	end
return true
end