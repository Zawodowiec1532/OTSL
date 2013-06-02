	-- Achievements by Renusek & Darkhaos --
	-- EXAMPLE: [0] = {name = "Test Achievement", storage = 20000, value = 3, message = "You are lucker! You win the lottery 3 times!", grade = 2, points = 5, secret = true}
	-- Grade 1: 1-3 points, Grade 2: 4-6 points, Grade 3: 7-9 points, Grade 4: 10 points
ACHIEVEMENTS =	{
	[1] = {name = "Allow Cookies?", value = 1, message = "With a perfectly harmless smile you fooled all of those wisecrackers into eating your Exploding Cookies. Consider a boy or girl scout outfit next time to make the trick even better.", grade = 1, points = 1, secret = false},
	[2] = {name = "Backpack Tourist", value = 1, message = "If someone lost a random thing in a random place, you're probably a good person to ask and go find it, even if you don't know what and where.", grade = 1, points = 1, secret = true},
	[3] = {name = "Bearhugger", value = 1, message = "Warm, furry and cuddly - though that same bear you just hugged would probably rip you into pieces if he had been conscious, he reminded you of that old teddy bear which always slept in your bed when you were still small.", grade = 1, points = 1, secret = false},
	[4] = {name = "Bone Brother", value = 1, message = "You've joined the undead bone brothers - making death your enemy and your weapon as well. Devouring what's weak and leaving space for what's strong is your primary goal.", grade = 1, points = 1, secret = false},
	[5] = {name = "Chorister", value = 4, message = "Lalalala... you now know the cult's hymn sung in Liberty Bay by heart. Not that hard, considering that it mainly consists of two notes and repetitive lyrics.", grade = 1, points = 1, secret = false},
	[6] = {name = "Fountain of Life", value = 1, message = "You found and took a sip from the Fountain of Life. Thought it didn't grant you eternal life, you feel changed and somehow at peace.", grade = 1, points = 1, secret = true},
	[7] = {name = "Here, Fishy Fishy!", value = 1000, message = "Ah, the smell of the sea! Standing at the shore and casting a line is one of your favourite activities. For you, fishing is relaxing - and at the same time, providing easy food. Perfect!", grade = 1, points = 1, secret = true},
	[8] = {name = "Honorary Barbarian", value = 1, message = "You've hugged bears, pushed mammoths and proved your drinking skills. And even though you have a slight hangover, a partially fractured rib and some greasy hair on your tongue, you're quite proud to call yourself a honorary barbarian from now on.", grade = 1, points = 1, secret = false},
	[9] = {name = "Huntsman", value = 1, message = "You're familiar with hunting tasks and have carried out quite a few already. A bright career as hunter for the Paw & Fur society lies ahead!", grade = 1, points = 1, secret = false},
	[10] = {name = "Just in Time", value = 1, message = "You're a fast runner and are good at delivering wares which are bound to decay just in the nick of time, even if you can't use any means of transportation or if your hands get cold or smelly in the process.", grade = 1, points = 1, secret = false},
	[11] = {name = "Matchmaker", value = 1, message = "You don't believe in romance to be a coincidence or in love at first sight. In fact - love potions, bouquets of flowers and cheesy poems do the trick much better than ever could. Keep those hormones flowing!", grade = 1, points = 1, secret = false},
	[12] = {name = "Nightmare Knight", value = 1, message = "You follow the path of dreams and that of responsibility without self-centered power. Free from greed and selfishness, you help others without expecting a reward.", grade = 1, points = 1, secret = false},
	[13] = {name = "Party Animal", value = 200, message = "Oh my god, it's a paaaaaaaaaaaarty! You're always in for fun, friends and booze and love being the center of attention. There's endless reasons to celebrate! Woohoo!", grade = 1, points = 1, secret = true},
	[14] = {name = "Secret Agent", value = 1, message = "Pack your spy gear and get ready for some dangerous missions in service of a secret agency. You've shown you want to - but can you really do it? Time will tell.", grade = 1, points = 1, secret = false},
	[15] = {name = "Talented Dancer", value = 1, message = "You're a lord or lady of the dance - and not afraid to use your skills to impress tribal gods. One step to the left, one jump to the right, twist and shout!", grade = 1, points = 1, secret = false},
	[16] = {name = "Territorial", value = 1, message = "Your map is your friend - always in your back pocket and covered with countless marks of interesting and useful locations. One could say that you might be lost without it - but luckily there's no way to take it from you.", grade = 1, points = 1, secret = true},
	[17] = {name = "Worm Whacker", value = 1, message = "Weehee! Whack those worms! You sure know how to handle a big hammer.", grade = 1, points = 1, secret = true},
	[18] = {name = "Allowance Collector", value = 50, message = "You certainly have your ways when it comes to acquiring money. Many of them are pink and paved with broken fragments of porcelain.", grade = 1, points = 2, secret = true},
	[19] = {name = "Amateur Actor", value = 1, message = "You helped bringing Princess Buttercup, Doctor Dumbness and Lucky the Wonder Dog to life - and will probably dream of them tonight, since you memorised your lines perfectly. What a .. special piece of.. screenplay.", grade = 1, points = 2, secret = false},
	[20] = {name = "Animal Activist", value = 1, message = "You have a soft spot for little, weak animals, and you do everything in your power to protect them - even if you probably eat dragons for breakfast.", grade = 1, points = 2, secret = false},
	[21] = {name = "Beach Tamer", value = 1, message = "You re-enacted the Taming of the Shrew on a beach setting and proved that you can handle capricious girls quite well. With or without fish tails.", grade = 1, points = 2, secret = false},
	[22] = {name = "Blessed!", value = 1, message = "You travelled the world for an almost meaningless prayer - but at least you don't have to do that again and can get a new blessed stake in the blink of an eye.", grade = 1, points = 2, secret = false},
	[23] = {name = "Exquisite Taste", value = 250, message = "You love fish - but preferably those caught in the cold north. Even though they're hard to come by you never get tired of picking holes in ice sheets and hanging your fishing rod in.", grade = 1, points = 2, secret = true},
	[24] = {name = "Fireworks in the Sky", value = 250, message = "You love the moment right before your rocket takes off and explodes into beautiful colours - not only on new year's eve!", grade = 1, points = 2, secret = true},
	[25] = {name = "Greenhorn", value = 1, message = "You wiped out Orcus the Cruel in the Arena of Svargrond. You're still a bit green behind the ears, but there's some great potential.", grade = 1, points = 2, secret = false},
	[26] = {name = "Jinx", value = 500, message = "Sometimes you feel there's a gremlin in there. So many lottery tickets, so many blanks? That's just not fair! Share your misery with the world.", grade = 1, points = 2, secret = true},
	[27] = {name = "Lucid Dreamer", value = 1, message = "Dreams - are your reality? Strange visions, ticking clocks, going to bed and waking up somewhere completely else - that was some trip, but you're almost sure you actually did enjoy it.", grade = 1, points = 2, secret = false},
	[28] = {name = "Mathemagician", value = 1, message = "Sometimes the biggest secrets of life can have a simple solution.", grade = 1, points = 2, secret = false},
	[29] = {name = "Masquerader", value = 100, message = "You probably don't know anymore how you really look like - usually when you look into a mirror, some kind of monster stares back at you. On the other hand - maybe that's an improvement?", grade = 1, points = 2, secret = true},
	[30] = {name = "Ministrel", value = 1, message = "You can handle any music instrument you're given - and actually manage to produce a pleasant sound with it. You're a welcome guest and entertainer in most taverns.", grade = 1, points = 2, secret = true},
	[31] = {name = "Poet Laureate", value = 1, message = "Poems, verses, songs and rhymes you've recited many times. You have passed the cryptic door, raconteur of ancient lore. Even elves you've left impressed, so it seems you're truly blessed.", grade = 1, points = 2, secret = true},
	[32] = {name = "Quick as a Turtle", value = 2000, message = "There... is... simply... no... better... way - than to travel on the back of a turtle. At least you get to enjoy the beautiful surroundings of Laguna.", grade = 1, points = 2, secret = true},
	[33] = {name = "Sea Scout", value = 1, message = "Not even the hostile underwater environment stops you from doing your duty for the Explorer Society. Scouting the Quara realm is a piece of cake for you.", grade = 1, points = 2, secret = false},
	[34] = {name = "Steampunked", value = 100, message = "Travelling with the dwarven steamboats through the underground rivers is your preferred way of crossing the lands. No pesky seagulls, and good beer on board!", grade = 1, points = 2, secret = true},
	[35] = {name = "Superstitios", value = 100, message = "Fortune tellers and horoscopes guide you through your life. And you probably wouldn't dare going on a big game hunt without your trusty voodoo skull giving you his approval for the day.", grade = 1, points = 2, secret = true},
	[36] = {name = "The Milkman", value = 1, message = "Who's the milkman? You are!", grade = 1, points = 2, secret = false},
	[37] = {name = "Turncoat", value = 1, message = "You served Yalahar - but you didn't seem so sure whom to believe on the way. Both Azerus and Palimuth had good reasons for their actions, and thus you followed your gut instinct in the end, even if you helped either of them. May Yalahar prosper!", grade = 1, points = 2, secret = true},
	[38] = {name = "Vive la Resistance", value = 1, message = "You've always been a rebel - admit it! Supplying prisoners, caring for outcasts, stealing from the rich and giving to the poor - no wait, that was another story.", grade = 1, points = 2, secret = false},
	[39] = {name = "Archpostman", value = 1, message = "Delivering letters and parcels has always been a secret passion of yours, and now you can officially put on your blue hat, blow your Post Horn and do what you like to do most. Beware of dogs!", grade = 1, points = 3, secret = false},
	[40] = {name = "Clay Fighter", value = 1, message = "Sculpting Brog, the raging Titan, is your secret passion. Numerous perfect little clay statues with your name on them can be found everywhere around Tibia.", grade = 1, points = 3, secret = true},
	[41] = {name = "Efreet Ally", value = 1, message = "Even though the Efreet welcomed you only reluctantly and viewed you as \"only a human\" for quite some time, you managed to impress Malor and gained his respect and trade options with the green djinns.", grade = 1, points = 3, secret = false},
	[42] = {name = "Ghostwisperer", value = 1, message = "You don't hunt them, you talk to them. You know that ghosts might keep secrets that have been long lost among the living, and you're skilled at talking them into revealing them to you.", grade = 1, points = 3, secret = false},
	[43] = {name = "His True Face", value = 1, message = "You're one of the few Tibians who Armenius chose to actually show his true face to - and he made you fight him. Either that means you're very lucky or very unlucky, but one thing's for sure - it's extremely rare.", grade = 1, points = 3, secret = true},
	[44] = {name = "Ice Sculptor", value = 1, message = "You love to hang out in cold surroundings and consider ice the best material to be shaped. What a waste to use ice cubes for drinks when you can create a beautiful mammoth statue from it!", grade = 1, points = 3, secret = true},
	[45] = {name = "King Tibanus Fan", value = 1, message = "You're not sure what it is, but you feel drawn to royalty. Your knees are always a bit grazed from crawling around in front of thrones and you love hanging out in castles. Maybe you should consider applying as a guard?", grade = 1, points = 3, secret = false},
	[46] = {name = "Marblelous", value = 1, message = "Your little statues of Tibiasula have become quite famous around Tibia and there's few people with similar skills when it comes to shaping marble.", grade = 1, points = 3, secret = true},
	[47] = {name = "Marid Ally", value = 1, message = "You've proven to be a valuable ally to the Marid, and Gabel welcomed you to trade with Haroun and Nah'Bob whenever you want to. Though the Djinn war has still not ended, the Marid can't fail with you on their side.", grade = 1, points = 3, secret = false},
	[48] = {name = "Passionate Kisser", value = 1, message = "For you, a kiss is more than a simple touch of lips. You kiss maidens and deadbeats alike with unmatched affection and faced death and rebirth through the kiss of the banshee queen. Lucky are those who get to share such an intimate moment with you!", grade = 1, points = 3, secret = false},
	[49] = {name = "Perfect Fool", value = 1, message = "You love playing jokes on others and tricking them into looking a little silly. Wagging tongues say that the moment of realisation in your victims' eyes is the reward you feed on, but you're probably just kidding and having fun with them... right??", grade = 1, points = 3, secret = false},
	[50] = {name = "Recognised Trader", value = 1, message = "You're a talented merchant who's able to handle wares with care, finds good offers and digs up rares every now and then. Never late to complete an order, you're a reliable trader - at least in Rashid's eyes.", grade = 1, points = 3, secret = false},
	[51] = {name = "Rockstar", value = 10000, message = "Music just comes to you naturally. You feel comfortable on any stage, at any time, and secretly hope that someday you will be able to defeat your foes by playing music only. Rock on!", grade = 1, points = 3, secret = true},
	[52] = {name = "Scrapper", value = 1, message = "You put out the Spirit of Fire's flames in the arena of Svargrond. Arena fights are for you - fair, square, with simple rules and one-on-one battles.", grade = 1, points = 3, secret = false},
	[53] = {name = "Vanity", value = 300, message = "Aren't you just perfectly, wonderfully, beautifully gorgeous? You can't pass a mirror without admiring your looks. Or maybe doing a quick check whether something's stuck in your teeth, perhaps?", grade = 1, points = 3, secret = true},
	[54] = {name = "Wayfarer", value = 1, message = "Dragon dreams are golden.", grade = 1, points = 3, secret = true},
	[55] = {name = "Champion of Chazorai", value = 1, message = "You won the merciless 2 vs. 2 team tournament on the Isle of Strife and wiped out wave after wave of fearsome opponents. Death or victory - you certainly chose the latter.", grade = 2, points = 4, secret = false},
	[56] = {name = "Culinary Master", value = 1, message = "Simple hams and bread merely make you laugh. You're the master of the extra-ordinaire, melter of cheese, fryer of bat wings and shaker of shakes. Delicious!", grade = 2, points = 4, secret = false},
	[57] = {name = "Explorer", value = 1, message = "You've been to places most people don't even know the names of. Collecting botanic, zoologic and ectoplasmic samples is your daily business and you're always prepared to discover new horizons.", grade = 2, points = 4, secret = false},
	[58] = {name = "Follower of Azerus", value = 1, message = "When you do something, you do it right. You have an opinion and you stand by it - and no one will be able to convince you otherwise. On a sidenote, you're a bit on the brutal and war-oriented side, but that's not a bad thing, is it?", grade = 2, points = 4, secret = false},
	[59] = {name = "Follower of Palimuth", value = 1, message = "You're a peacekeeper and listen to what the small people have to say. You've made up your mind and know who to help and for which reasons - and you do it consistently. Your war is fought with reason rather than weapons.", grade = 2, points = 4, secret = false},
	[60] = {name = "Friend of the Apes", value = 1, message = "You know Banuta like the back of your hand and are good at destroying caskets and urns. The sight of giant footprints doesn't keep you from exploring unknown areas either.", grade = 2, points = 4, secret = false},
	[61] = {name = "Golem in the Gears", value = 1, message = "You're an aspiring mago-mechanic. Science and magic work well together in your eyes - and even though you probably delivered countless wrong charges while working for Telas, you might just have enough knowledge to build your own golem now.", grade = 2, points = 4, secret = false},
	[62] = {name = "High-Flyer", value = 1000, message = "The breeze in your hair, your fingers clutching the rim of your Carpet - that's how you like to travel. Faster! Higher! And a looping every now and then.", grade = 2, points = 4, secret = true},
	[63] = {name = "Interior Decorator", value = 1000, message = "Your home is your castle - and the furniture in it is just as important. Your friends ask for your advice when decorating their Houses and your probably own every statue, rack and bed there is.", grade = 2, points = 4, secret = true},
	[64] = {name = "Master Thief", value = 1, message = "Robbing, inviting yourself to VIP parties, faking contracts and pretending to be someone else - you're a jack of all trades when it comes to illegal activities. You take no prisoners, except for the occasional goldfish now and then.", grade = 2, points = 4, secret = false},
	[65] = {name = "Polisher", value = 1, message = "If you see a rusty item, you can't resist polishing it. There's always a little flask of rust remover in your inventory - who knows, there might be a golden armor beneath all that dirt!", grade = 2, points = 4, secret = true},
	[66] = {name = "Potion Addict", value = 1, message = "Your local magic trader considers you one of his best customers - you usually buy large stocks of potions so you won't wake up in the middle of the night craving for more. Yet, you always seem to run out of them too fast. Cheers!", grade = 2, points = 4, secret = true},
	[67] = {name = "Ruthless", value = 1, message = "You've touched all thrones of the Ruthless Seven and absorbed some of their evil spirit. It may have changed you forever.", grade = 2, points = 5, secret = false},
	[68] = {name = "Ship's Kobold", value = 1000, message = "You've probably never gotten seasick in your life - you love spending your free time on the ocean and covered quite a lot of miles with ships. Aren't you glad you didn't have to swim all that?", grade = 2, points = 4, secret = true}, 
	[69] = {name = "Top AVIN Agent", value = 1, message = "You've proven yourself as a worthy member of the 'family' and successfully carried out numerous spy missions for your 'uncle' to support the Venorean traders and their goals.", grade = 2, points = 4, secret = false},
	[70] = {name = "Top CGB Agent", value = 1, message = "Girl power! Whether you're female or not, you've proven absolute loyalty and the willingness to put your life at stake for the girls brigade of Carlin.", grade = 2, points = 4, secret = false},
	[71] = {name = "Top TBI Agent", value = 1, message = "Conspiracies and open secrets are your daily bread. You've shown loyalty to the Thaian crown through your courage when facing enemies and completing spy missions. You're an excellent field agent of the TBI.", grade = 2, points = 4, secret = false},
	[72] = {name = "Annihilator", value = 1, message = "You've daringly jumped into the infamous Annihilator and survived - taking home fame, glory and your reward.", grade = 2, points = 5, secret = false},
	[73] = {name = "Castlemania", value = 1, message = "You have an eye for suspicious places and love to read other people's diaries, especially those with vampire stories in it. You're also a dedicated token collector and explorer. Respect!", grade = 2, points = 5, secret = true},
	[74] = {name = "Elite Hunter", value = 1, message = "You jump at every opportunity for a hunting challenge that's offered to you and carry out those tasks with deadly precision. You're a hunter at heart and a valuable member of the Paw & Fur Society.", grade = 2, points = 5, secret = false},
	[75] = {name = "High Inquisitor", value = 1, message = "You're the one who poses the questions around here, and you know how to get the answers you want to hear. Besides, you're a famous exorcist and slay a few vampires and demons here and there. You and your stake are a perfect team.", grade = 2, points = 5, secret = false},
	[76] = {name = "Jamjam", value = 1, message = "When it comes to interracial understanding, you're an expert. You've mastered the language of the Chakoya and made someone really happy with your generosity. Achuq!", grade = 2, points = 5, secret = false},
	[77] = {name = "Lord of the Elements", value = 1, message = "You travelled the surreal realm of the elemental spheres, summoned and slayed the Lord of the Elements, all in order to retrieve neutral matter. And as brave as you were, you couldn't have done it without your team!", grade = 2, points = 5, secret = false},
	[78] = {name = "Warlord of Svargrond", value = 1, message = "You sent the Obliverator into oblivion in the arena of Svargrond and defeated nine other dangerous enemies on the way. All hail the Warlord of Svargrond!", grade = 2, points = 5, secret = false},
	[79] = {name = "Master of the Nexus", value = 1, message = "You were able to fight your way through the countless hordes in the Demon Forge. Once more you proved that nothing is impossible.", grade = 2, points = 6, secret = false},
	[80] = {name = "Razing!", value = 1, message = "People with sharp canine teeth better beware of you, especially at nighttime, or they might find a stake between their ribs. You're a merciless vampire hunter and have gathered numerous tokens as proof.", grade = 3, points = 7, secret = true},
	[81] = {name = "Dread Lord", value = 1, message = "You don't care for rules that others set up and shape the world to your liking. Having left behind meaningless conventions and morals, you prize only the power you wield. You're a master of your fate and battle to cleanse the world.", grade = 3, points = 8, secret = true},
	[82] = {name = "Lord Protector", value = 1, message = "You proved yourself - not only in your dreams - and possess a strong and spiritual mind. Your valorous fight against demons and the undead plague has granted you the highest and most respected rank among the Nightmare Knights.", grade = 3, points = 8, secret = true},
	[83] = {name = "Herbicide", value = 1, message = "You're one of the brave heroes to face and defeat the mysterious demon oak and all the critters it threw in your face. Wielding your blessed axe no tree dares stand in your way - demonic or not.", grade = 3, points = 7, secret = true}
}

ACHIEVEMENT_BASE = 20000
ACHIEVEMENT_FIRST = 1
ACHIEVEMENT_LAST = #ACHIEVEMENTS
ACHIEVEMENT_POINTS = 15200

function getAchievementInfo(id)
	local ach = ACHIEVEMENTS[id]
	return ach and {
		id = id,
	   	name = ach.name,
		storage = ACHIEVEMENT_BASE + id,
		value = ach.value,
		message = ach.message,
		grade = ach.grade,
	   	points = ach.points,
	   	secret = ach.secret or false
	} or false
end

function getAchievementInfoByName(name)
	name = name:lower()
	local info
	for k, v in pairs(ACHIEVEMENTS) do
		if v.name:lower() == name then
			local ach = v
			info = {
				id = k,
				name = ach.name,
				storage = ACHIEVEMENT_BASE + k,
				value = ach.value,
				message = ach.message,
				grade = ach.grade,
				points = ach.points,
				secret = ach.secret or false
			}
			break
		end
	end
return info ~= nil and info or false
end
 
function isAchievementSecret(ach)
	local ach = type(ach) == "string" and getAchievementInfoByName(ach) or getAchievementInfo(tonumber(ach))
	return ach.secret or false
end

function getPlayerAchievements(cid, name)
	local done = {}
	local name = name or false
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		if getCreatureStorage(cid, ACHIEVEMENT_BASE + i) >= getAchievementInfo(i).value then
			if name then
				table.insert(done, getAchievementInfo(i).name)
		   	else
				table.insert(done, i)
			end
	  	end
	end
return done
end

function playerHasAchievement(cid, ach)
	local ach = type(ach) == "string" and getAchievementInfoByName(ach) or getAchievementInfo(tonumber(ach))
	if getCreatureStorage(cid, ach.storage) >= ach.value then
		return true
	end
return false
end

function getPlayerSecretAchievements(cid, name)
	local done = {}
	local name = name or false
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		if getCreatureStorage(cid, ACHIEVEMENT_BASE + i) >= getAchievementInfo(i).value then
			if isAchievementSecret(i) then
				if name then
					table.insert(done, getAchievementInfo(i).name)
		   		else
					table.insert(done, i)
				end
			end
	  	end
	end
return done
end

function doPlayerAddAchievement(cid, ach, showMsg)
	local ach = type(ach) == "string" and getAchievementInfoByName(ach) or getAchievementInfo(ach)
	if getCreatureStorage(cid, ACHIEVEMENT_POINTS) < 0 then
		doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, 0)
	end
	if ach then
		if getCreatureStorage(cid, ach.storage) < ach.value then
			if showMsg then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulations! You earned the achievement \"" .. ach.name .. "\".")
			end
			return doCreatureSetStorage(cid, ach.storage, ach.value) and doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, getCreatureStorage(cid, ACHIEVEMENT_POINTS) + ach.points)
		end
	end
return false
end

function doPlayerAddAllAchievements(cid)
	if getCreatureStorage(cid, ACHIEVEMENT_POINTS) < 0 then
		doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, 0)
	end
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		local ach = getAchievementInfo(i)
		if ach then
			if getCreatureStorage(cid, ach.storage) < ach.value then
				doCreatureSetStorage(cid, ach.storage, ach.value)
				doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, getCreatureStorage(cid, ACHIEVEMENT_POINTS) + ach.points)
			end
		end
	end
return true
end

function doPlayerRemoveAchievement(cid, ach)
	local ach = type(ach) == "string" and getAchievementInfoByName(ach) or getAchievementInfo(ach)
	if getCreatureStorage(cid, ACHIEVEMENT_POINTS) < 0 then
		doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, 0)
	end
	if ach then
		if getCreatureStorage(cid, ach.storage) >= ach.value then
			return doCreatureSetStorage(cid, ach.storage, 0) and doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, getCreatureStorage(cid, ACHIEVEMENT_POINTS) - ach.points)
		end
	end
return false
end	

function doPlayerRemoveAllAchievements(cid)
	if getCreatureStorage(cid, ACHIEVEMENT_POINTS) < 0 then
		doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, 0)
	end
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		local ach = getAchievementInfo(i)
		if ach then
			if getCreatureStorage(cid, ach.storage) >= ach.value then
				doCreatureSetStorage(cid, ach.storage, 0)
				doCreatureSetStorage(cid, ACHIEVEMENT_POINTS, getCreatureStorage(cid, ACHIEVEMENT_POINTS) - ach.points)
			end
		end
	end
return true
end
