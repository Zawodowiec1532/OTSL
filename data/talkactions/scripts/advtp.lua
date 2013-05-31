PLAYER_STORAGE_START_VALUE = 11350 -- script use storages from this id to +400 ids 
MAX_NUMBER_OF_POSITION = 10 -- player can save max. 10 positions, script limit is 100 
SAVE_ONLY_IN_PZ = true -- player can save position only when he is in PZ (house/depot/trainers?) - true/false 
TELEPORT_ONLY_IN_PZ = true -- player can teleport to position only when he is in PZ (house/depot/trainers?) - true/false 
GROUP_ID_NOT_BLOCKED = 3 -- players with that group can teleport from/to any position 


function onSay(cid, words, param, channel) 
    if(param == "") then 
        if(words == '!pos') then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Saved positions ( ID - name ):") 
            for i = 1, MAX_NUMBER_OF_POSITION do 
                local posName = getPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + i + 300) 
                if(posName ~= -1) then 
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, i .. " - " .. posName) 
                end 
            end 
        end 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.") 
        return TRUE     
    end 
    local params = string.explode(param, ",") 
    params[1] = tonumber(params[1]) 
    local pos = getCreaturePosition(cid) 
    if(#params == 1) then 
        params[2] = "" 
    end 
    if(words == '!savepos') then 
        if(params[1] < 1 or params[1] > MAX_NUMBER_OF_POSITION) then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Position ID (first parameter) must be between 1 and " .. MAX_NUMBER_OF_POSITION) 
            return TRUE 
        end 
        if(SAVE_ONLY_IN_PZ and getPlayerGroupId(cid) < GROUP_ID_NOT_BLOCKED and getTileInfo(pos).protection == true) then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can save positions only when you are in protection zone.") 
            return TRUE 
        end 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1], pos.x) 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 100, pos.y) 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 200, pos.z) 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 300, params[2]) 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Position ID " .. params[1] .. " (" .. params[2] .. ") saved.") 
    elseif(words == '!deletepos') then 
        if(params[1] < 1 or params[1] > MAX_NUMBER_OF_POSITION) then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Position ID (first parameter) must be between 1 and " .. MAX_NUMBER_OF_POSITION) 
            return TRUE 
        end 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1], -1) 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 100, -1) 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 200, -1) 
        setPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 300, -1) 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Position ID " .. params[1] .. " deleted.") 
    elseif(words == '!pos') then 
        if(params[1] < 1 or params[1] > MAX_NUMBER_OF_POSITION) then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Position ID (first parameter) must be between 1 and " .. MAX_NUMBER_OF_POSITION) 
            return TRUE 
        end 
        if(TELEPORT_ONLY_IN_PZ and getPlayerGroupId(cid) < GROUP_ID_NOT_BLOCKED and getTileInfo(pos).protection == true) then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can teleport to positions only when you are in protection zone.") 
            return TRUE 
        end 
        strPos = getPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1]) 
        if(strPos == -1) then 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You didn't save positon with ID " .. params[1]) 
            return TRUE 
        end 
        toPos = {x = getPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1]), y = getPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 100), z = getPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 200)} 
        posName = getPlayerStorageValue(cid, PLAYER_STORAGE_START_VALUE + params[1] + 300) 
        if(doTeleportThing(cid, toPos, TRUE) ~= LUA_ERROR and isPlayerGhost(cid) ~= TRUE) then 
            doSendMagicEffect(pos, CONST_ME_POFF) 
            doSendMagicEffect(toPos, CONST_ME_TELEPORT) 
        end 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You were teleported to position ID " .. params[1] .. " - " .. posName) 
    end 
    return TRUE 
end  