<?PHP
$order = $_REQUEST['order'];
if($order == 'name') {
	$orderby = 'name';
}
if($order == 'level') {
	$orderby = 'level';
}
if($order == 'vocation') {
	$orderby = 'vocation';
}
if(empty($orderby)) {
	$orderby = 'name';
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
if(count($config['site']['worlds']) > 1)
{
	$main_content .= '<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100%><TR><TD>
		<FORM ACTION="?subtopic=whoisonline" METHOD=get><INPUT TYPE=hidden NAME=subtopic VALUE=whoisonline><INPUT TYPE=hidden NAME=list VALUE=experience>
		<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>World Selection</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['lightborder'].'">
		<TABLE BORDER=0 CELLPADDING=1><TR><TD>World: </TD><TD><SELECT SIZE="1" NAME="world"><OPTION VALUE="" SELECTED>(choose world)</OPTION>';
		foreach($config['site']['worlds'] as $id => $world_n)
		{
			$main_content .= '<OPTION VALUE="'.$id.'">'.$world_n.'</OPTION>';
		}
		$main_content .= '</SELECT> </TD><TD><INPUT TYPE=image NAME="Submit" ALT="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18>
		</TD></TR></TABLE></TABLE></FORM></TABLE><br>';
}
$players_online_data = $SQL->query('SELECT * FROM players WHERE online > 0 AND world_id = '.$world_id.' ORDER BY '.$orderby);
$number_of_players_online = 0;
foreach($players_online_data as $player) 
{
	$number_of_players_online++;
	if($config['site']['show_flag'])
	{
		$account = $SQL->query('SELECT * FROM accounts WHERE id = '.$player['account_id'].'')->fetch();
		$flag = '<image src="http://images.boardhost.com/flags/'.$account['flag'].'.png"/> ';
	}
	if(is_int($number_of_players_online / 2)) 
	{
		$bgcolor = $config['site']['darkborder'];
	}
	else
	{
		$bgcolor = $config['site']['lightborder'];
	}
	$players_rows .= '
	<TR BGCOLOR='.$bgcolor.'>
		<TD WIDTH=70%>'.$flag.'<A HREF="index.php?subtopic=characters&name='.urlencode($player['name']).'">'.$player['name'].'</A></TD>
		<TD WIDTH=10%>'.$player['level'].'</TD>
		<TD WIDTH=20%>'.$vocation_name[$player['world_id']][$player['promotion']][$player['vocation']].'</TD>
	</TR>';
}
if($number_of_players_online == 0) 
{
	//server status - server empty
	$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><B>Server Status</B></TD></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=1><TR><TD>Currently no one is playing on '.$config['server']['serverName'].'.</TD></TR></TABLE></TD></TR></TABLE><BR>';
}
else
{
	//server status - someone is online
	$main_content .= '
	<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
		<TR BGCOLOR="'.$config['site']['vdarkborder'].'">
			<TD CLASS=white><B>Server Status</B></TD>
		</TR>
		<TR BGCOLOR='.$config['site']['darkborder'].'>
			<TD>';
				if($number_of_players_online == $config['status']['serverStatus_players'])
					$main_content .= 'Currently there are '.$number_of_players_online.' players is active';
				else
					$main_content .= 'Currently there are '.$config['status']['serverStatus_players'].' active and '.($number_of_players_online - $config['status']['serverStatus_players']).' AFK players';
			$main_content .= ' on '.$world_name.' gameworlds.<br>
			</TD>
		</TR>
	</TABLE><BR>';
	//list of players
	$main_content .= '
	<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
		<TR BGCOLOR="'.$config['site']['vdarkborder'].'">
			<TD><A HREF="index.php?subtopic=whoisonline&order=name" CLASS=white>Name</A></TD>
			<TD><A HREF="index.php?subtopic=whoisonline&order=level" CLASS=white>Level</A></TD>
			<TD><A HREF="index.php?subtopic=whoisonline&order=vocation" CLASS=white>Vocation</TD>
		</TR>
	'.$players_rows.'</TABLE>';
	//search bar
	$main_content .= '<BR><FORM ACTION="index.php?subtopic=characters" METHOD=post>  <TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4><TR><TD BGCOLOR="'.$config['site']['vdarkborder'].'" CLASS=white><B>Search Character</B></TD></TR><TR><TD BGCOLOR="'.$config['site']['darkborder'].'"><TABLE BORDER=0 CELLPADDING=1><TR><TD>Name:</TD><TD><INPUT NAME="name" VALUE=""SIZE=29 MAXLENGTH=29></TD><TD><INPUT TYPE=image NAME="Submit" SRC="'.$layout_name.'/images/buttons/sbutton_submit.gif" BORDER=0 WIDTH=120 HEIGHT=18></TD></TR></TABLE></TD></TR></TABLE></FORM>';
}
?>