	-- Made by Leon Zawodowiec --
function onUse(cid, item, frompos, item2, topos) 
local config = { 
				staminafull = 42 * 60 * 1000,
				effect = 53
				}
				
local player = getPlayerPosition(cid) 
local playerstamina = getPlayerStamina(cid) 
local playeracc = getPlayerAccess(cid) 
local playerfood = 1 

	if playeracc <= 2 then
		if playerfood ~= 0 then
			if playerstamina ~= config.staminafull then
				setPlayerStamina(cid, config.staminafull)
				doRemoveItem(item.uid, 1)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Stamina has been refilled !")
				doSendMagicEffect(player, config.effect)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't need a Energy Shot !")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You can't be hungry !")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are member of Support Team. You dont need it !")
	end
return true
end