  local config =
{
        sexChangeable = false,
        copyOutfitAndAddonsEverytime = false
}

function onSay(cid, words, param, channel)
        party = getPlayerParty(cid)
        if (config.sexChangeable == true) then
                sex = getPlayerSex(cid)
        end
        if (party) then
                if (party == cid) then
                        outfit = getCreatureOutfit(cid)
                        members = getPartyMembers(party)
                        if (#members >= 1) then
                                tmp = outfit
                                for i=1,#members do    
                                        if (config.sexChangeable == true) then
                                                if (sex ~= getPlayerSex(members[i])) then
                                                        doPlayerSetSex(members[i], sex)
                                                end
                                        end
                                        if(config.copyOutfitAndAddonsEverytime == false and canPlayerWearOutfit(members[i], tmp.lookType, tmp.lookAddons) ~= true) then
                                                local tmpOutfit = getCreatureOutfit(members[i])
                                                tmp.lookType = tmpOutfit.lookType
                                                tmp.lookAddons = tmpOutfit.lookAddons
                                        end
                                        doCreatureChangeOutfit(members[i], tmp)
                                        doSendMagicEffect(getCreaturePosition(members[i]), 66)
                                end
                        end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "This command can use only leader of a party!")
                end
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You must be in a party!")
        end
        return true
end 