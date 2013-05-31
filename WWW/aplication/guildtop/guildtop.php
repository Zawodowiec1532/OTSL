<?PHP
$main_content .= '<div class="NewsHeadline">
	<div class="NewsHeadlineBackground" style="background-image:url(' . $layout_name . '/images/news/newsheadline_background.gif)">
		<table border="0">
			<tr>
				<td style="text-align: center; font-weight: bold;">
					<font color="white">Most powerfull guilds</font>
				</td>
			</tr>
		</table>
	</div>
</div>
<table border="0" cellspacing="3" cellpadding="4" width="100%">
	<tr>';

foreach($SQL->query('SELECT `g`.`id` AS `id`, `g`.`name` AS `name`,
	`g`.`logo_gfx_name` AS `logo`, COUNT(`g`.`name`) as `frags`
FROM `killers` k
	LEFT JOIN `player_killers` pk ON `k`.`id` = `pk`.`kill_id`
	LEFT JOIN `players` p ON `pk`.`player_id` = `p`.`id`
	LEFT JOIN `guild_ranks` gr ON `p`.`rank_id` = `gr`.`id`
	LEFT JOIN `guilds` g ON `gr`.`guild_id` = `g`.`id`
WHERE `k`.`unjustified` = 1 AND `k`.`final_hit` = 1
	GROUP BY `name`
	ORDER BY `frags` DESC, `name` ASC
	LIMIT 0, 4;') as $guild)
	$main_content .= '<td style="width: 25%; text-align: center;">
			<a href="?subtopic=guilds&action=show&guild='.$guild['id'].'"><img src="guilds/'.((!empty($guild['logo']) && file_exists('guilds/' . $guild['logo'])) ? $guild['logo'] : 'default_logo.gif').'" width="64" height="64" border="0"/><br />'.$guild['name'].'</a><br />'.$guild['frags'].' kills
		</td>';
$main_content .= '	</tr>
</table>';
?>