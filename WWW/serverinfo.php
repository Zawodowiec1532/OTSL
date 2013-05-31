<?PHP
if($config['site']['serverinfo_page'])
{
	$stages = simplexml_load_file($config['site']['server_path'].'/data/XML/stages.xml');
	$servers = simplexml_load_file($config['site']['server_path'].'/data/XML/servers.xml');
	$talkactions = simplexml_load_file($config['site']['server_path'].'/data/talkactions/talkactions.xml');
	$main_content .= '<br><center>
		<table border="0" cellpadding="4" cellspacing="1" width="95%">
			<tr bgcolor="'.$config['site']['vdarkborder'].'">
				<td colspan="2"><font class="white"><b>Status</b></font></td>
			</tr>
			<tr bgcolor="'.$config['site']['vdarkborder'].'">
				<td width="50%"><font class="white">Name</font></td><td><font class="white">Value</font></td>
			</tr>
			<tr bgcolor="'.$config['site']['darkborder'].'">
				<td>Server</td><td>'.(($config['status']['serverStatus_online'] == 1) ? '<font color="grenn"><b>ONLINE</b></font>' : '<font color="red"><b>OFFLINE</b></font>').'</td>
			</tr>
			<tr bgcolor="'.$config['site']['lightborder'].'">
				<td>Player Online</td><td>'.$config['status']['serverStatus_players'].'</td>
			</tr>
			<tr bgcolor="'.$config['site']['darkborder'].'">
				<td>UpTime</td><td>'.$config['status']['serverStatus_uptime'].'</td>
			</tr>
			<tr bgcolor="'.$config['site']['lightborder'].'">
				<td>Monster</td><td>'.$config['status']['serverStatus_monsters'].'</td>
			</tr>
			<tr bgcolor="'.$config['site']['darkborder'].'">
				<td>NPC</td><td>'.$config['status']['serverStatus_npcs'].'</td>
			</tr>
		</table>
		<br>';
	if($config['server']['experienceStages'] == false)
        $rateExperience .= $config['server']['rateExperience'].'x';
    else
	{
        $rateExperience .= '<table width="100%">';
		$rateExperience .= '<tr align="center" bgcolor="'.$config['site']['vdarkborder'].'"><td colspan="3"><strong><font color="gold">Experience Stages on Troja OTS</font></strong></td></tr>';
		$rateExperience .= '<tr align="center" bgcolor="'.$config['site']['vdarkborder'].'"><td class="white">From Level</td><td class="white">To Level</td><td class="white">Rate</td></tr>';
        foreach($stages as $exp1)
        {
				if(isset($exp1["maxlevel"]))
					$max = $exp1["maxlevel"];
				else
					$max = "-";
				if(is_int($i/2))
					$bgcolor=$config['site']['lightborder'];
				else
					$bgcolor=$config['site']['darkborder'];
				$rateExperience .= '<tr align="center" bgcolor="'.$bgcolor.'"><td>'.$exp1["minlevel"].'</td><td>'.$max.'</td><td>'.$exp1["multiplier"].'x</td></tr>';
        }
        $rateExperience .= '</table>';
	}
	$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="95%">
			<tr bgcolor="'.$config['site']['vdarkborder'].'">
				<td colspan="2"><font class="white"><b>Rates</b></font></td>
			</tr>
			<tr bgcolor="'.$config['site']['vdarkborder'].'">
				<td><font class="white">Name</font></td><td><font class="white">Value</font></td>
			</tr>
			<tr bgcolor="'.$config['site']['darkborder'].'">
				<td width="50%">Experience</td><td>'.$rateExperience.'</td>
			</tr>
			<tr bgcolor="'.$config['site']['lightborder'].'">
				<td>Skill</td><td>'.$config['server']['rateSkill'].'x</td>
			</tr>
			<tr bgcolor="'.$config['site']['darkborder'].'">
				<td>Magic</td><td>'.$config['server']['rateMagic'].'x</td>
			</tr>
			<tr bgcolor="'.$config['site']['lightborder'].'">
				<td>Loot</td><td>'.$config['server']['rateLoot'].'x</td>
			</tr>
		</table><br>';

	///Queries ///
		$housesfree = $SQL->query('SELECT COUNT(*) FROM `houses` WHERE `owner`=0;')->fetch();
		$housesrented = $SQL->query('SELECT COUNT(*) FROM `houses` WHERE `owner`=1;')->fetch();
		$banned = $SQL->query('SELECT COUNT(*) FROM `bans` WHERE `id`>0;')->fetch();
		$accounts = $SQL->query('SELECT COUNT(*) FROM `accounts` WHERE `id`>0;')->fetch();
		$players = $SQL->query('SELECT COUNT(*) FROM `players` WHERE `id`>0;')->fetch();
		$guilds = $SQL->query('SELECT COUNT(*) FROM `guilds` WHERE `id`>0;')->fetch();
	///End Queries ///
	
	$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="95%">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<td colspan="2"><font class="white"><b>Info Server</b></font></td>
		</tr>
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<td width="50%"><font class="white">Name</font></td><td><font class="white">Value</font></td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>World Type</td><td>Open PVP</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Client Version</td><td>8.6</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Server motd</td><td>'.$config['server']['motd'].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Free Houses</td><td>'.$housesfree[0].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Rented Houses:</td><td>'.$housesrented[0].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Total Banned Accounts (Counts Un-banned too):</td><td>'.$banned[0].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Accounts in database:</td><td>'.$accounts[0].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Players in database:</td><td>'.$players[0].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Guilds in databese:</td><td>'.$guilds[0].'</td>
		</tr>
	</table><br>';

	$main_content .= '<table width="600" cellspacing="1" cellpadding="0" border="0" align="center">
		<tr>
			<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<td style="text-align: center; color: white;"><strong>Skull<br /></strong></td>
			<td style="text-align: center; color: white;"><strong>Daily Frags</strong></td>
			<td style="text-align: center; color: white;"><strong>Weekly Frags</strong></td>
			<td style="text-align: center; color: white;"><strong>Monthly Frags</strong></td>
			<td style="text-align: center; color: white;"><strong>Lenght</strong></td>
		</tr>
		<tr>
			<TR BGCOLOR="'.$config['site']['lightborder'].'">
			<td style="text-align: center;"><img style="border: 0;" src="images/whiteskull.gif"/></td>
			<td style="text-align: center;">-</td>
			<td style="text-align: center;">-</td>
			<td style="text-align: center;">-</td>
			<td style="text-align: center;">7.5 Minutes</td>
		</tr>
		<tr>
			<TR BGCOLOR="'.$config['site']['darkborder'].'">
			<td style="text-align: center;"><img style="border: 0;" src="images/redskull.gif"/></td>
			<td style="text-align: center;">7</td>
			<td style="text-align: center;">25</td>
			<td style="text-align: center;">40</td>
			<td style="text-align: center;">2 Days</td>
		</tr>
		<tr>
			<TR BGCOLOR="'.$config['site']['lightborder'].'">
			<td style="text-align: center;"><img style="border: 0;" src="images/blackskull.gif"/></td>
			<td style="text-align: center;">15</td>
			<td style="text-align: center;">30</td>
			<td style="text-align: center;">50</td>
			<td style="text-align: center;">4 Days</td>
		</tr>
		</table><br>';
		
	$idleKickTime = explode("*", $config['server']['idleKickTime']);
	$idleKickTime = $idleKickTime[0].(count($idleKickTime) == 4 ? ' hours' : ' minuts');
	$pzLocked = explode("*", $config['server']['pzLocked']);
	$pzLocked = $pzLocked[0].(count($pzLocked) == 3 ? ' minuts' : ' seconds'); 
	if($config['server']['bankSystem'] == true)
		$bankSystem = "Enabled";
	else
		$bankSystem = "Disabled";
	if($config['server']['guildHalls'] == true)
		$guildHalls = "Enabled";
	else
		$guildHalls = "Disabled";
	$main_content .= '<table border="0" cellpadding="4" cellspacing="1" width="95%">
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<td colspan="2"><font class="white"><b>Onther information</b></font></td>
		</tr>
		<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<td width="50%"><font class="white">Name</font></td><td><font class="white">Value</font></td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Premium</td><td>For gp !</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Bank System</td><td>'.$bankSystem.'</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Guild halls</td><td>'.$guildHalls.'</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Kick Time</td><td>'.$idleKickTime.'</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>PZ Lock</td><td>'.$pzLocked.'</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Protection Level</td><td>'.$config['server']['protectionLevel'].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td>Level to buy house</td><td>'.$config['server']['levelToBuyHouse'].'</td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td>Level to create guild</td><td>'.$config['site']['guild_need_level'].'</td>
		</tr>
		<!--
		<tr bgcolor="'.$config['site']['darkborder'].'">
			<td></td><td></td>
		</tr>
		<tr bgcolor="'.$config['site']['lightborder'].'">
			<td></td><td></td>
		</tr>
		-->
	</table><br>';
	$main_content .= '</center>';
}
else
	$main_content .= "Invalid subtopic. Can't load page.";
?>