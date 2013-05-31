function onSay(cid, words, param)
    local Outfits = { ["cult"]={28}, ["headsplitter"]={29}, ["skullhunter"]={30}, ["bloodwalker"]={31}, ["brutetamer"]={32} }

    local msg = {"Wrong Outfit Name. Type !outfit [name] . Avaiable Outfit Mames: cult, headsplitter, skullhunter, bloodwalker and brutetamer.", "You dont have Premium Outfit Doll !", "Wrong Outfit Name !", "Outfit sucesfully added !"}
    local param = string.lower(param) 
	if getPlayerStorageValue(cid, 46005) < os.time() - 5 then
		if(getPlayerItemCount(cid, 9693) > 0) then
			if getPlayerStorageValue(cid, 32545) < 3 then
				if(param ~= "" and Outfits[param]) then
					doPlayerRemoveItem(cid, 9693, 1)
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[4])
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
					doPlayerAddOutfitId(cid, Outfits[param][1],0)
					setPlayerStorageValue(cid, 32545, getPlayerStorageValue(cid, 32545) + 2)
					setPlayerStorageValue(cid,46005,os.time())
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[1])
				end
			else
				doCreatureSay(cid, "You already used twice Premium Outfit Dool.", TALKTYPE_ORANGE_1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You already used twice Premium Outfit Doll.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
				setPlayerStorageValue(cid,46005,os.time())
				return 0
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[2])
			return 0
		end
	else
		doPlayerSendCancel(cid, "Sorry, you must wait 5 seconds.")
		return 0
	end
end