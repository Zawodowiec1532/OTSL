	-- Made by Leon Zawodowiec --
function vote_clean() -- Czysci wyniki ostatniego g³osowania
    setGlobalStorageValue(9855, 0) -- Odpowiada, aby tylko 1 g³osowanie by³o naraz
    setGlobalStorageValue(2299, 0) -- Odpowiada za g³osy na TAK
    setGlobalStorageValue(2288, 0) -- Odpowiada za g³osy na NIE
return true
end

function vote_end() -- Og³asza wyniki g³osowania
    doBroadcastMessage("Wyniki Glosowania:")
	doBroadcastMessage("".. getGlobalStorageValue(2299) .. " na TAK !")
	doBroadcastMessage("".. getGlobalStorageValue(2288) .. " na NIE !")
	addEvent(vote_clean, 2000) -- Czyœci wszystkie wpisy (Aktualne wyniki, g³osowanie)
return true
end

function vote_cancel() -- Anuluje aktualne g³osowanie
	doBroadcastMessage("Glosowanie zostalo anulowane !")
	vote_clean() -- Czyœci wszystkie wpisy (Aktualne wyniki, g³osowanie)
return true
end

function onSay(cid, words, param) -- G³owna struktura skryptu
	local vote_end_time = 60 -- Czas g³osowania w sekundach

    if getGlobalStorageValue(9855) ~= 1 and getGlobalStorageValue(7200) <= os.time() and words == '/vote' then -- Rozpoczyna g³osowanie
		if words == '/vote' then
            addEvent(vote_end, vote_end_time * 1000) -- Ustawia licznik po którym zakoñczy g³osowanie i wyœwietli wyniki
			doBroadcastMessage("UWAGA - GLOSOWANIE !")
			doBroadcastMessage("Pytanie: " .. param .. "")
			doBroadcastMessage("Aby zaglosowac wpisz na czacie:  !tak  lub  !nie")
			vote_clean() -- Zeruje liczniki na pocz¹tku
            setGlobalStorageValue(9855, 1) -- Ustawia Global Storage Value aby nie by³o mo¿na zacz¹æ kilku g³osowañ naraz.
			setGlobalStorageValue(7200, os.time() + vote_end_time) -- Ustawia Licznik aby nie by³o mo¿na zacz¹æ nastêpnego g³osowania w krótszym odstêpie od "vote_end_time", aby przy anulowaniu g³osowania i rozpoczêciu kolejnego wszyscy mogli znowu g³osowaæ
        end
	else
		if getPlayerAccess(cid) >= 5 and words == '/vote' then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Do nastepnego glosowania musisz odczekac jeszcze " .. getGlobalStorageValue(7200) - os.time() .. " sekund !")
		end
    end
	
    if getGlobalStorageValue(9855) == 1 then -- Je¿eli g³osowanie rozpoczê³o siê
		if words == '!tak' and getPlayerStorageValue(cid, 7200) <= os.time() then -- Je¿eli gracz g³osuje na TAK
			setGlobalStorageValue(2299, getGlobalStorageValue(2299) + 1) -- Dodaje 1 g³os na TAK
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Zaglosowales na TAK !")
			setPlayerStorageValue(cid, 7200, os.time() + vote_end_time) -- Ustawia czas w jakim gracz nie mo¿e g³osowaæ
		elseif words == '!nie' and getPlayerStorageValue(cid, 7200) <= os.time() then
			setGlobalStorageValue(2288, getGlobalStorageValue(2288) + 1) -- Dodaje 1 g³os na TAK
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Zaglosowales na NIE !")
			setPlayerStorageValue(cid, 7200, os.time() + vote_end_time) -- Ustawia czas w jakim gracz nie mo¿e g³osowaæ
		elseif getPlayerStorageValue(cid, 7200) >= os.time() then -- Je¿eli gracz próbuje zag³osowaæ w niedozwolonych czasie
			doPlayerSendCancel(cid, "Juz glosowales !")
		end
	else -- Je¿eli ¿adne g³osowanie nie zosta³o rozpoczête
		doPlayerSendCancel(cid, "Zadne glosowanie nie zostalo rozpoczete !")
	end
return true
end