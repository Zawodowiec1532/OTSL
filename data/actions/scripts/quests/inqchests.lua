	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6076) ~= 1 then
		if item.uid == 1300 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Robe of the Underworld.")
			doPlayerAddItem(cid, 8890, 1)
		elseif item.uid == 1301 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Spellbook of Dark Mysteries.")
			doPlayerAddItem(cid, 8918, 1)
		elseif item.uid == 1302 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Fireborn Giant Armor.")
			doPlayerAddItem(cid, 8881, 1)
		elseif item.uid == 1303 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Master Archer's Armor.")
			doPlayerAddItem(cid, 8888, 1)
		elseif item.uid == 1304 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Royal Crossbow.")
			doPlayerAddItem(cid, 8851, 1)
		elseif item.uid == 1305 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Hellforged Axe.")
			doPlayerAddItem(cid, 8924, 1)
		elseif item.uid == 1306 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Obsidian Truncheon.")
			doPlayerAddItem(cid, 8928, 1)
		elseif item.uid == 1307 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Emerald Sword.")
			doPlayerAddItem(cid, 8930, 1)
		elseif item.uid == 1308 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Warsinger Bow.")
			doPlayerAddItem(cid, 8854, 1)
		end
		
		if getPlayerSex(cid) == 1 then 
			doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
		elseif getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
		end
		setPlayerStorageValue(cid, 6076, 1)
	else
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "This chest is empty.")
	end
return true
end