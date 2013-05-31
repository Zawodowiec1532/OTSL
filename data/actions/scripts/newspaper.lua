	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, ItemEx, toPosition)
local wstep = "Witaj na Revolutions OTS !\n\n Zalozyciele:\n God Reaper: GG: 4174357\n God Xevis: GG: 12331718\n\n"
local expp = "          Exp Stage:\n         1 - 50 = 150x\n         51 - 100 = 100x\n         101 - 120 = 50x\n         121 - 140 = 30x\n         141 - 160 = 20x\n\n"
local koniec = "          Zyczymy milej gry. :)\n                   Revolutions TeaM."
local all = ""..wstep..""..expp..""..koniec..""
	doPlayerPopupFYI(cid, all)
return true
end