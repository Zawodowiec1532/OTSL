<style type="text/css">
	tr.over:hover
	{
		background-color: lightgrey;
	}
</style>

<?PHP
	if($groups = simplexml_load_file($config['site']['server_path'].'/data/XML/groups.xml') or die('<b>Could not load groups!</b>'))
		foreach($groups->group as $g)
			$groupList[(int)$g['id']] = $g['name'];

		$list = $SQL->query("SELECT `name`, `online`, `group_id`, `world_id`, `lastlogin` FROM `players` WHERE `group_id` > 1 ORDER BY `group_id` DESC");
		$showed_players = 0;

		$main_content .= '<center><h2>SUPPORT LIST</h2></center><br>';

		$headline = '<table border="0" cellspacing="1" cellpadding="1" width="100%">
			<tr bgcolor="'.$config['site']['vdarkborder'].'">
			<td width="20%"><font size="2" class=white><b><center>Group</center></b></font></td>
			<td width="45%"><font size="2" class=white><b>Name</b></font></td>
			<td width="15%"><font size="2" class=white><b><center>Status</center></b></font></td>
			<td width="20%"><font size="2" class=white><b><center>Last Login</center></b></font></td>';

		$group_id = 0;
		foreach($list as $gm)
		{
			if($group_id != (int)$gm['group_id'])
			{
				if($group_id != 0)
					$main_content .= '</table><br />';

				$main_content .= $headline;
				$group_id = (int)$gm['group_id'];
			}
			$main_content .= '<tr bgcolor="'.(is_int($showed_players++ / 2) ? $config['site']['darkborder'] : $config['site']['lightborder']).'" class="over"><td><font size="2"><center><b>'.$groupList[(int)$gm['group_id']].'</b></center></font></td><td><font size="2"><a href="?subtopic=characters&name='.urlencode($gm['name']).'">'.$gm['name'].'</a></font></td><td><font size="2" color="'.($gm['online'] == 0 ? 'red"><b><center>Offline</center></b>' : 'green"><b><center><blink>Online</blink></center></b>').'</font></td><td><font size="2"><b><center><small>'.date("d F Y, G:i", $gm['lastlogin']).'</small></center></b></font></td></tr>';
		}
	$main_content .= '</table>';
?>