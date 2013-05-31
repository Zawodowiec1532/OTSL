   <?PHP
//////////////////
/// CREATED BY ///
///   SAMME    ///
/////  FROM  /////
/// OTLAND.NET ///
//////////////////

//Please respect the copyrights!//
$lol = "<br>";
$ban_reason = array("Offensive Name", "Invalid Name Format", "Unsuitable Name", "Name Inciting Rule Violation", "Offensive Statement", "Spamming", "Illegal Advertising", "Off-Topic Public Statement", "Non-English Public Statement", "Inciting Rule Violation", "Bug Abuse", "Game Weakness Abuse", "Using Unofficial Software to Play", "Hacking", "Multi-Clienting", "Account Trading or Sharing", "Threatening Gamemaster", "Pretending to Have Influence on Rule Enforcer", "False Report to Gamemaster", "Destructive Behaviour", "Excessive Unjustified Player Killing", "Invalid Payment", "Spoiling Auction");

$players_banned = $SQL->query('SELECT `bans`.`value`, `bans`.`comment`, `bans`.`admin_id`, `bans`.`expires`, `bans`.`added`, `bans`.`reason` FROM `bans`, `players` WHERE `players`.`account_id` = `bans`.`value` AND `bans`.`type` = 3 AND `bans`.`active` = 1 GROUP BY `bans`.`value` ORDER BY `bans`.`added` DESC')->fetchAll();
$number_of_players = 0;
    
foreach($players_banned as $player) {
    $nick = $SQL->query("SELECT name, id, level, account_id FROM `players` WHERE account_id =".$player['value']." ORDER BY level DESC LIMIT 1")->fetch(); 
    $gmnick = $SQL->query("SELECT name, id FROM `players` WHERE id =".$player['admin_id']."")->fetch(); 	
	$data3 = date("d/m/Y, G:i:s",  $player['expires']);
    if($player['admin_id'] > "1")
        $banby = "<a href=?subtopic=characters&name=".urlencode($gmnick[0])."><font color ='green'><b><center>$gmnick[0]</center></b></font></a>";
    else
        $banby = "AntyBot System";
        
    $number_of_players++;
    if(is_int($number_of_players / 2))
        $bgcolor = $config['site']['darkborder'];
    else
        $bgcolor = $config['site']['lightborder'];
		
	if ($player['expires'] < 1277121616) 
		$data = "<font color='red'><blink><b>PERMANENT</b></blink></font>";
	else
		$data = $data3;

    $players_rows .= '<TR BGCOLOR='.$bgcolor.'><TD WIDTH=15%><A HREF="?subtopic=characters&name='.$nick['name'].'"><center>'.$nick['name'].'</center></A></TD><TD WIDTH=25%><font color ="red"><center><small>'.$player['comment'].'</small></center></font></TD><TD>'.$banby.'</TD><TD><center>'.date("d/m/Y, G:i:s", $player['added']).'</center></TD><TD><center>'.$data.'</center></TD></TR>';
}

    //list of players
    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>Banned Player</center></b></TD><TD class="white"><b><center>GameMaster Comment<br>And Reason</center></b></TD><TD class="white"><b><center>Banned By</center></b></TD><TD class="white"><b><center>Added</center></b></TD><TD class="white"><b><center>Expires</center></b></TD></TR>'.$players_rows.'</TABLE>';
?>