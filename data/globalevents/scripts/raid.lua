	-- Made by Leon Zawodowiec --
--[[
- Godzina jest pobierana z Server Time
- Je¿eli raid ma siê wykonaæ w dok³adnej dacie ustaw type = "exact" i wpisz odpowiedni¹ date jak w przyk³adzie na dole.
- Je¿eli raid ma siê wykonywaæ co tydzieñ w ustalony dzieñ ustaw type = "weekly" i w "days" wpisz interesuj¹c¹ ciê wartoœæ z poni¿szych.
- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday".
- W t³umaczeniu.. "poniedzia³ek", "wtorek", "œroda", "czwartek", "pi¹tek", "sobota", "niedziela". - WPISZ PO ANGIELSKU !
- Dni tygodnia powinny byæ w tablicy -> {}
]]

local raids =
	{
		--[[ PRZYK£AD z "date" i "exact":
		[1] = 
			{
				name = 'Ghazbaran',
				type = 'exact',
				date = {day = 20, month = 10},
				hour = 21,
				minu = 00
			},
			
		-- PRZYK£AD z "weekly" i "days"
		[2] = 
			{
				name = 'Ferumbras',
				type = 'weekly',
				days = {'friday'},
				hour = 21,
				minu = 00
			},
		--]]
	
		[1] = 
			{
				name = 'Morgaroth',
				type = 'exact',
				date = {day = 15, month = 08},
				hour = 16,
				minu = 27
			},
			
		[2] = 
			{
				name = 'Ghazbaran',
				type = 'weekly',
				days = {'monday'},
				hour = 20,
				minu = 00
			},
	
		[3] = 
			{
				name = 'RatsThais',
				type = 'weekly',
				days = {'tuesday'},
				hour = 10,
				minu = 00
			},
		[4] = 
			{
				name = 'OrcsThais',
				type = 'weekly',
				days = {'wednesday'},
				hour = 15,
				minu = 00
			},
		[5] = 
			{
				name = 'Barbarian',
				type = 'exact',
				date = {day = 05, month = 08},
				hour = 18,
				minu = 00
			},
		[6] = 
			{
				name = 'Demodras',
				type = 'weekly',
				days = {'sunday'},
				hour = 13,
				minu = 00
			},
		[7] = 
			{
				name = 'Elfos',
				type = 'exact',
				date = {day = 09, month = 08},
				hour = 20,
				minu = 00
			},
		[8] = 
			{
				name = 'Ferumbras',
				type = 'exact',
				date = {day = 11, month = 08},
				hour = 21,
				minu = 00
			},
		[9] = 
			{
				name = 'Ghazbaran',
				type = 'exact',
				date = {day = 13, month = 08},
				hour = 22,
				minu = 00
			},
		[10] = 
			{
				name = 'Horned Fox',
				type = 'weekly',
				days = {'friday'},
				hour = 12,
				minu = 00
			}
	}
	
local last_execsutes = {}

function onThink(interval, lastExecution, thinkInterval)
	local static_time = os.time()
	for k, raid in ipairs(raids) do
		if (raid.type == 'weekly') then
			local day = os.date("%A", static_time):lower()
			if isInArray(raid.days, day) then
				local hour = tonumber(os.date("%H", static_time))
				if (raid.hour == hour) then
					local minute = tonumber(os.date("%M", static_time))
					if (raid.minu == minute) then
						local day_number = tonumber(os.date("%d", static_time))
						if (last_execsutes[k] ~= day_number) then
							last_execsutes[k] = day_number
							doExecuteRaid(raid.name)
						end
					end
				end
			end
		elseif (raid.type == 'exact') then
			local month = tonumber(os.date("%m", static_time))
			if (raid.date.month == month) then
				local day = tonumber(os.date("%d", static_time))
				if (raid.date.day == day) then
					local hour = tonumber(os.date("%H", static_time))
					if (raid.hour == hour) then
						local minute = tonumber(os.date("%M", static_time))
						if (raid.minu == minute) then
							if (last_execsutes[k] ~= day) then
								last_execsutes[k] = day
								doExecuteRaid(raid.name)
							end
						end
					end
				end
			end
		end
	end
return true
end