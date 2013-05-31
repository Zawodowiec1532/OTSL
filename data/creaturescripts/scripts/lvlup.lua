function onAdvance(cid, skill, oldlevel, newlevel)
local pos = getCreaturePosition(cid)
if skill == SKILL__LEVEL then
	doSendAnimatedText(pos, "Level Up!", 150)
       doSendMagicEffect(pos, 28) 
	doCreatureAddMana(cid, getCreatureMaxMana(cid))
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
end
return true
end