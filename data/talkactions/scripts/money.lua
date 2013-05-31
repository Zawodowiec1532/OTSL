function onSay(cid, words, param)
        if string.explode(param, ",") then
                local param2 = string.explode(param, ",")
                if(getPlayerByNameWildcard(param2[1]) ~= nil or getPlayerByNameWildcard(param2[1].."~")) then
                        local pname = getPlayerByNameWildcard(param2[1])
                        local text = "Hi!"
                        if pname == nil then
                                pname = getPlayerByNameWildcard(param2[1].."~")
                        end
                        if(param2[2] ~= nil) then
                                text = param2[2]
                        end
                        doCreatureSay(pname, text, TALKTYPE_SAY)
                else
                        doPlayerSendCancel(cid, "This player was not found.")
                end
                return TRUE
        else
            doPlayerSendCancel(cid, "This talkaction need a param.")
                return TRUE
        end
end