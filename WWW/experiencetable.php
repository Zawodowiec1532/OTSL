<?php
if(!function_exists('getExperienceForLevel'))
{
	function getExperienceForLevel($level)
	{
		$level = $level - 1;
		return ((50 * $level * $level * $level) - (150 * $level * $level) + (400 * $level)) / 3;
	}
}

$config['site']['columns'] = 5;
$config['site']['result'] = 1;

$main_content .= 'This is a list of the experience points that are required to advance to the various levels.
Remember you can also check the respective skill bar in your skill window of the client to check your progress towards the next level.<br/><br/>

<table bgcolor="'.$config['site']['darkborder'].'" border="0" cellpadding="4" cellspacing="1" width="100%">
	<tr bgcolor="'.$config['site']['vdarkborder'].'">
		<td class="white" colspan="5"><b>Experience Table</b></td>
	</tr>
	<tr>';
	for($i = 0; $i < $config['site']['columns']; $i++)
	{
		$main_content .= '
		<td>
			<table border="0" cellpadding="2" cellspacing="1" width="100%">
				<tr bgcolor="'.$config['site']['lightborder'].'">
					<td><b>Level</b></td>
					<td><b>Experience</b></td>
				</tr>';
				for($level = $i * 100 + 1; $level < $i * 100 + 101; $level++)
				{
					$main_content .= '
						<tr bgcolor="'.$config['site']['lightborder'].'">
							<td>'.$level.'</td>
							<td>'.getExperienceForLevel($level).'</td>
						</tr>';
				}
				$main_content .= '
			</table>
		</td>';
	}
$main_content .= '</tr></table>';
?>