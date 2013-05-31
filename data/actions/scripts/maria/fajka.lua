	-- Made by Leon Zawodowiec --
		-- Buch - Dodaje: ca³¹ mane/hp, daje wszystkie blessy, tp'a do rooma, po 30 min kicka, zwieksza exp  2100000 --
function koniec(cid)
	local tpexit = {x=getPlayerStorageValue(cid, 1580), y=getPlayerStorageValue(cid, 1581), z=getPlayerStorageValue(cid, 1582)}
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Event sie wykonal hehe.")
	doPlayerSetExperienceRate(cid, 1.00)
	doTeleportThing(cid, tpexit, TRUE)

return true
end

function onUse(cid, item, frompos, item2, topos)
	local minuty = 35 * 60
	local buchy = getPlayerStorageValue(cid, 1568)

	function bless()
		local exps = {1.70, 1.50, 1.30, 1.20, 1.10}
		local tproom = {x=31823, y=32560, z=8}
		for i = 1, 5 do
			getPlayerBlessing(cid, i)
		end

		doCreatureAddMana(cid, getCreatureMaxMana(cid))
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))

		doPlayerRemoveItem(cid, 9675, 1)
		
		doSendAnimatedText(getPlayerPosition(cid), "Phh, Buch.", TEXTCOLOR_GREEN)
		doSendMagicEffect(getPlayerPosition(cid), 2)

		if getPlayerStorageValue(cid, 1568) == -1 then
			setPlayerStorageValue(cid, 1568, 0)
		end
		pos = getPlayerPosition(cid)
		setPlayerStorageValue(cid, 1568, getPlayerStorageValue(cid, 1568) + 1)
		
		setPlayerStorageValue(cid, 1580, getPlayerPosition(cid).x)
		setPlayerStorageValue(cid, 1581, getPlayerPosition(cid).y)
		setPlayerStorageValue(cid, 1582, getPlayerPosition(cid).z)
		
		doTeleportThing(cid, tproom, TRUE)
		doSendMagicEffect(pos, 27)
		if getPlayerStorageValue(cid, 1568) < 5 then
			doPlayerSetExperienceRate(cid, exps[getPlayerStorageValue(cid, 1568)])
		else
			doPlayerSetExperienceRate(cid, exps[5])
		end
		
		addEvent(koniec, 2100000, cid)
	return true
	end
	
	if getPlayerItemCount(cid, 9675) <= 0 then
		doCreatureSay(cid, "Nie mam ziola..", TALKTYPE_ORANGE_1)
		return false
	end
	
	if getPlayerStorageValue(cid, 1375) - os.time() <= 0 then
	
		if buchy < 1 then
			bless()
			doPlayerAddLevel(cid, 5)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Zyskales 5 leveli za pierwsze skucie + 70% Szybszy exp na 30 min.")
			
		elseif buchy == 1 then
			bless()
			doPlayerAddMagLevel(cid, 2)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Zyskales 2 magic levele za drugie skucie + 50% Szybszy exp na 30 min.")
		
		elseif buchy == 2 then
			bless()
			setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Zyskales 100 maksymalnej many za trzecie skucie + 30% Szybszy exp na 30 min.")
	
		elseif buchy == 3 then
			bless()
			setPlayerStorageValue(cid, 5555, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Dolaczyles do grona koneserow Ganji. Od teraz masz wiekszy szacunek na miescie + 20% Szybszy exp na 30 min.")
		else
			bless()
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Jestes uzalezniony. Ganjia nie dziala juz tak dobrze jak na poczatku. Dostajesz 10% kopa na 30 min.")
		end
	
	
		time = os.time() + minuty
		setPlayerStorageValue(cid, 1375, time)
		
		buchy2 = getPlayerStorageValue(cid, 1568)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "To byl twoj " .. buchy2 .. " buch. Do nastepnego musisz odczekac 35 minut.")
	
	else 
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Odczekaj 35 minut przed kolejnym buchem. Musisz czekac do: ".. os.date("%X", getPlayerStorageValue(cid, 1375)) .."")
		return false
	end 
return true 
end  