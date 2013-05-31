<?PHP
$n = 0;
$frags = $SQL->query('SELECT * FROM `players` ORDER BY `balance` DESC LIMIT 10;');
foreach($frags as $show)
{
	$cost2 = round($show['balance']/10000, 2);
	$noobs++;
	$n++;
	if(is_int($noobs / 2))
		$bgcolor = $config['site']['lightborder'];
	else
		$bgcolor = $config['site']['darkborder'];
		$load .= '<TR BGCOLOR='.$bgcolor.'><TD><center>'.$n.'</center></TD><TD><center><a href="?subtopic=characters&name='.urlencode($show['name']).'">'.$show['name'].'</a></center></TD><TD><center>'.$cost2.' cc</center></TD></TR>';
}
$main_content .= '<b><center><img src="/images/shop/9.jpg"></img> Top 10 Richest Players on TrojaOTS.pl <img src="/images/shop/9.jpg"></img></center></b><TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>#</center></b></TD><TD CLASS=white><b><center>Name</center></b></TD><TD class="white"><b><center>Gold in Bank</center></b></TD></TR>'.$load.'</TABLE>';
$main_content .= '';
?>