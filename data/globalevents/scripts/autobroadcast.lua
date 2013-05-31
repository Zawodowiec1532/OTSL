	-- Made by Leon Zawodowiec --
local messages = {
	"Please report bugs at our forum http://trojaots.pl/forum/ with images and description.",
	"Follow the rules to avoid a banishment.",
	"You have the possibility to donate with a credit card or through phone at http://trojaots.pl/?subtopic=buypoints",
	"Visit the official homepage on a regular basis to have an overview of the latest news.",
	"We aren't the ones creating the wars and quest services, you are! Invite friends, it only makes the server better.",
	"You are able to become a tutor through our tutor exam system at the account management page."
}

local i = 0
function onThink(interval, lastExecution)
local message = messages[(i % #messages) + 1]
    doBroadcastMessage("Information: " .. message .. "", MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
return true
end