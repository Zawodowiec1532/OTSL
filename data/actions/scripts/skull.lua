-- Scripted by Leon Zawodowiec --

function onUse(cid, item, frompos, item2, topos)

local skull = getCreatureSkullType(cid)


if skull == SKULL_NONE then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't have any skull !")
 return 0
end

if skull == SKULL_YELLOW then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can't remove yellow skull !")
 return 0
end

if skull == SKULL_GREEN then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can't remove green skull !")
 return 0
end

if skull == SKULL_WHITE then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can't remove white skull !")
 return 0
end

if skull == SKULL_RED then
 if (doPlayerRemoveItem(cid, 9969, 1) == TRUE) then
   doCreatureSetSkullType(cid, SKULL_NONE)
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Red Skull has been removed !")
   db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
   return 0
  else 
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Take your Frag Remover to your BackPack !")
  end
 end

if skull == SKULL_BLACK then
 if (doPlayerRemoveItem(cid, 9969, 1) == TRUE) then
 doCreatureSetSkullType(cid, SKULL_NONE)
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Black Skull has been removed !")
 db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
 return 0
  else 
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Take your Frag Remover to your BackPack !")
  end
end
end


-- <action itemid="9969" script="skull.lua" />