<?PHP
error_reporting(E_ALL & ~E_NOTICE);
ini_set('display_errors', '1');
$list = (isset($_REQUEST['list'])) ? $_REQUEST['list'] : '';
$page = (isset($_REQUEST['page'])) ? $_REQUEST['list'] : '';
// $vocation = array( 'All', 'Sorcerer', 'Druid', 'Paladin', 'Knight');
$vocation_id = (isset($_REQUEST['vocation_id'])) ? $_REQUEST['vocation_id'] : '';

switch($list)
{
  case "fist":
   $id = 0;
   $list_name = 'Fist Fighting';
   break;
  case "club":
   $id = 1;
   $list_name = 'Club Fighting';
   break;
  case "sword":
   $id = 2;
   $list_name = 'Sword Fighting';
   break;
  case "axe":
   $id = 3;
   $list_name = 'Axe Fighting';
   break;
  case "distance":
   $id = 4;
   $list_name = 'Distance Fighting';
   break;
  case "shield":
   $id = 5;
   $list_name = 'Shielding';
   break;
  case "fishing":
   $id = 6;
   $list_name = 'Fishing';
   break;
}
if(!isset($id))
	if($list == "magic")
		$list_name = "Magic Level";
	else
	{
		$list_name = 'Experience';
		$list = 'experience';
	}
if(count($config['site']['worlds']) > 1)
{
	$worlds .= '<i>Select world:</i> ';
	foreach($config['site']['worlds'] as $idd => $world_n)
	{
		if($idd == (int) $_GET['world'])
		{
			$world_id = $idd;
			$world_name = $world_n;
		}
	}
}
		if($idd == (int) $_GET['world'])
		{
			$world_id = $idd;
			$world_name = $world_n;
		}
if(!isset($world_id))
{
	$world_id = 0;
	$world_name = $config['server']['serverName'];
}
$offset = $page * 100;

##################################### \/ by Dragonas
$main_content .= '<FORM ACTION="?subtopic=highscores&list='.$list.'" METHOD=post>
<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
<TR BGCOLOR='.$config['site']['vdarkborder'].'><TD CLASS=white><B>highscores Search</B></TD></TR>
<TR BGCOLOR='.$config['site']['darkborder'].'><TD>Only for vocation: <SELECT NAME="vocation_id">';
$main_content .= '<OPTION VALUE="a:a" ';
if('a:a' == $vocation_id)
	$main_content .= 'SELECTED';
$main_content .= '>All';

foreach($vocation_name[0] as $prom => $arr)
	foreach($arr as $voc_id => $voc_name)
	{
		if(($prom < 1) && ($voc_id != 0))
			{
			$main_content .= '<OPTION VALUE="'.$prom.';'.$voc_id.'"';
			if($prom.';'.$voc_id == $vocation_id && $vocation_id != "a:a" && $vocation_id != '')
				$main_content .= ' SELECTED';
			$main_content .= '/>'.$voc_name;
			}
	}
$main_content .= '</SELECT><input type="hidden" name="order" value="'.$orderby.'">&nbsp;&nbsp;&nbsp;<INPUT TYPE=image NAME="Submit" ALT="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD><TR>
</TABLE></FORM>';
$vcc = $vocation_id;
$vcc = substr($vcc, 0, 1);
$vocation_id = substr($vocation_id, 2, 1);
if(($vcc != 'a') || ($vocation_id != 'a'))
	$vocation_id = ($vcc * 4) + $vocation_id;
elseif($vocation_id = '')
	$vocation_id = 'vocation';
else
	$vocation_id = 'vocation';
if(($vocation_id < 1) || ($vocation_id > 4))
//  || !int($vocation_id)
	$vocation_id = 'vocation';

#########################################################\/Not by dragonas
if(isset($id))
	$skills = $SQL->query('SELECT name,online,value,level,vocation,promotion FROM players,player_skills WHERE players.world_id = '.$world_id.' AND vocation = '.$vocation_id.' AND players.deleted = 0 AND players.group_id < '.$config['site']['players_group_id_block'].' AND players.id = player_skills.player_id AND player_skills.skillid = '.$id.' ORDER BY value DESC, count DESC LIMIT 101 OFFSET '.$offset);
elseif($list == "magic")
	$skills = $SQL->query('SELECT name,online,maglevel,level,vocation,promotion FROM players WHERE players.world_id = '.$world_id.' AND vocation = '.$vocation_id.' AND players.deleted = 0 AND players.group_id < '.$config['site']['players_group_id_block'].' AND name != "Account Manager" ORDER BY maglevel DESC, manaspent DESC LIMIT 101 OFFSET '.$offset);
elseif($list == "experience")
	$skills = $SQL->query('SELECT name,online,level,experience,vocation,promotion FROM players WHERE players.world_id = '.$world_id.' AND vocation = '.$vocation_id.' AND players.deleted = 0 AND players.group_id < '.$config['site']['players_group_id_block'].' AND name != "Account Manager" ORDER BY level DESC, experience DESC LIMIT 101 OFFSET '.$offset);
//wyswietlanie wszystkiego

$main_content .= '<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100%><TR><TD><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=10 HEIGHT=1 BORDER=0></TD><TD><CENTER><H2>Ranking for '.$list_name.' on '.$world_name.'</H2></CENTER><BR><BR>';
		
		
		$main_content .= '<center><table cellspacing="0" cellpadding="0" border="1" width="200">
    <caption><strong>Choose a Skill</strong>
    <tbody>
        <tr>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=experience"><img src="/images/skills/level.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=magic"><img src="/images/skills/ml.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=fist"><img src="/images/skills/fist.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=club"><img src="/images/skills/club.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=sword"><img src="/images/skills/sword.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=axe"><img src="/images/skills/axe.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=distance"><img src="/images/skills/dist.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=shield"><img src="/images/skills/def.gif" alt="" style="border-style: none"/></td>
            <td style="text-align: center;"><a href="?subtopic=highscores&list=fishing"><img src="/images/skills/fish.gif" alt="" style="border-style: none"/></td>
        </tr>
        <tr>
            <tr bgcolor="'.$config['site']['darkborder'].'"><td style="text-align: center;"><strong>Level</strong></td>
            <td style="text-align: center;"><strong>ML</strong></td>
            <td style="text-align: center;"><strong>Fist</strong></td>
            <td style="text-align: center;"><strong>Mace</strong></td>
            <td style="text-align: center;"><strong>Sword</strong></td>
            <td style="text-align: center;"><strong>Axe</strong></td>
            <td style="text-align: center;"><strong>Dist</strong></td>
            <td style="text-align: center;"><strong>Def</strong></td>
            <td style="text-align: center;"><strong>Fish</strong></td>
        </tr>
    </tbody>
</table>';
	$main_content .= '<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100%>
<FORM ACTION="?subtopic=highscores" METHOD=get><INPUT TYPE=hidden NAME=subtopic VALUE=highscores><INPUT TYPE=hidden NAME=list VALUE=experience>
</FORM></TABLE><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%></TABLE><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD WIDTH=10% CLASS=whites><B>Rank</B></TD><TD WIDTH=50% CLASS=whites><B>Name</B></TD><TD WIDTH=15% CLASS=whites><b><center>Level</center></B></TD>';
if($list == "experience")
	$main_content .= '<TD WIDTH=25% CLASS=whites><b><center>Experience Points</center></B></TD>';
$main_content .= '</TR><TR>';

foreach($skills as $skill)
{
$player = $ots->createObject('Player');
$player->find($skill['name']);
$account = $player->getAccount();
$ban = '';
$flagg = $account->getCustomField("flag");
$flag = '<image src="http://images.boardhost.com/flags/'.$flagg.'.png"/> ';
if($account->isBanned())
$ban = '<font color="red"> [Banished]</font>';
	if($number_of_rows < 100)
	{
		if($list == "magic")
			$skill['value'] = $skill['maglevel'];
		if($list == "experience")
			$skill['value'] = $skill['level'];
		if(!is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
		$main_content .= '<tr bgcolor="'.$bgcolor.'"><td>'.($offset + $number_of_rows).'.</td><td>'.$flag.'<a href="?subtopic=characters&name='.urlencode($skill['name']).'">'.($skill['online']>0 ? "<font color=\"green\"> ".$skill['name']."</font>" : "<font color=\"red\"> ".$skill['name']."</font>").'</a> '.$ban.'<br><small>'.$skill['level'].' '.$vocation_name[$world_id][$skill['promotion']][$skill['vocation']].'</small></td><td><center>'.$skill['value'].'</center></td>';
		if($list == "experience")
			$main_content .= '<td><center>'.$skill['experience'].'</center></td>';
		$main_content .= '</tr>';
	}
	else
		$show_link_to_next_page = TRUE;
}
$main_content .= '</TABLE><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1 WIDTH=100%>';
if($page > 0)
	$main_content .= '<TR><TD><A HREF="?subtopic=highscores&list='.$list.'&page='.($page - 1).'"><img src="http://mariaots.pl/images/back.png" border="0"></img></A></TD>';
if($show_link_to_next_page)
	$main_content .= '<TD WIDTH=100% ALIGN=right VALIGN=bottom><A style="text-decoration:none;" HREF="?subtopic=highscores&list='.$list.'&page='.($page + 1).'"><img src="http://mariaots.pl/images/next.png" border="0"></img></A></TD></TR>';
$main_content .= '</TABLE></TD><TD WIDTH=10><IMG SRC="'.$layout_name.'/images/general/blank.gif" WIDTH=1 HEIGHT=1 BORDER=0></TD><TD WIDTH=1% VALIGN=top ALIGN=right><TABLE BORDER=0 CELLPADDING=4 CELLSPACING=1></TABLE></TD></TABLE>';

?>