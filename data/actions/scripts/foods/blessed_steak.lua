local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local food = SPECIAL_FOODS[item.itemid]
	local mana = getCreatureMaxMana(cid) - getCreatureMana(cid)
	if(food == nil) then
		return false
	end

	if(not doAddCondition(cid, exhaust)) then
		return true
	end

	if(mana > 0) then
		doCreatureAddMana(cid, mana)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your mana was refilled completely.")
		doCreatureSay(cid, food, TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid, 1)
	else
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	end
return true
end