   <?PHP
header('Content-type: text/html; charset=utf-8');
$procent1 = 70;
$procent2 = 20;
$procent3 = 10;
$limitt = 30;
$azz = 0;
$lotterys = $SQL->query('SELECT `lottery_system2`.`id`, `lottery_system2`.`winner1`, `lottery_system2`.`winner2`, `lottery_system2`.`winner3`, `lottery_system2`.`balance`, `lottery_system2`.`date` FROM `lottery_system2` ORDER BY `lottery_system2`.`id` DESC LIMIT 0 , '.$limitt.'')->fetchAll();
$players = 0;
       
	$tickets = $SQL->query('SELECT * FROM `lottery_system` WHERE `id` != 0')->fetchAll();
				$tickets2 = 0;
   			foreach ($tickets as $player) {
			$tickets2++;
			}
    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'">
	<TD CLASS=white><b>Lottery System<b></TD>
	</TR><TR BGCOLOR='.$config['site']['darkborder'].'>
	
	<TD>
	<center><h2>Wykupionych Losów: '.$tickets2.'</h2></center>
	<center><h2>Instrukcja</h2><b>
	<i>
	Co 24 godziny (o 18:00) odbywa sie losowanie trzech osób.</br>
	Każda z nich, aby wygrać musi wcześniej kupić przynajmniej jeden los.</br>
	Pamiętaj, że im więcej kupisz losów tym większe masz szanse na wygraną.</br>
	Zwycięzcy otrzymuję określony procent sumy kwoty, jaką wpłacili wszyscy inni gracze.</br>
	</br></i>
	<li>Pierwsze miejsce wygrywa '.$procent1.'% całej kwoty, jaką łącznie wpłacili inni gracze,</li>
	<li>Drugie miejsce wygrywa '.$procent2.'% całej kwoty, jaką łącznie wpłacili inni gracze,</li>
	<li>Trzecie miejsce wygrywa '.$procent3.'% całej kwoty, jaką łącznie wpłacili inni gracze.</li>
	</br><h2>Komendy</b></h2></center>
	<div style="margin-left:45px;Padding:0px;"><li><b>!lottery [kwota]</b> - W miejsce [kwota], wpisz kwote jaką chcesz przeznaczyć na loterie.</li></div>
	<small><i><div style="margin-left:70px;Padding:0px;">Przykład na kupienie dwóch losów: !lottery 200</small></i></div>
	<div style="margin-left:45px;Padding:0px;"><li><b>!lotteryinfo</b> - Wyświetla w grze okienko z informacjami o loterii.</li>
	<li><b>!lotterystore</b> - Wypisuje 5 ostatnich wygranych.</li>
	<li><b>!lottery withdraw</b> - Wypłaca wygrane pieniądze.</li></div>	</br><h2><center>Historia</b></h2></center>
</TR></TD></TABLE><br />';
    if(empty($lotterys))
    {
        $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b>Lottery Winners</b></td></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD>Currently is no one active Lottery.</TD></TR></TABLE>';
        $main_content .= '<br /><p align="right"><small>System created by <a href="http://otland.net/members/Dragonas1/">Dragonas</a>.</small></p>';
    }
    else
    {
    foreach($lotterys as $lottery) {
        $players++;
		$azz++;
            if(is_int($players / 2))
                $bgcolor = $config['site']['lightborder'];
            else
                $bgcolor = $config['site']['darkborder'];
        $cost = round($lottery['cost']/1000, 2);
        $content .= '<TR BGCOLOR='.$bgcolor.'>
		<TD><center>'.$lottery['id'].'</center></TD>
			<TD><center>'.$azz.' dni temu<br/></center></TD>
		<TD><center><a href="?subtopic=characters&name='.urlencode($lottery['winner1']).'">'.$lottery['winner1'].'</a>
			<br/><small>(Wygrana: '.($lottery['balance'])*($procent1 / 100).'gp)</small></center></TD>
		<TD><center><a href="?subtopic=characters&name='.urlencode($lottery['winner2']).'">'.$lottery['winner2'].'</a>
			<br/><small>(Wygrana: '.($lottery['balance'])*($procent2 / 100).'gp)</small></center></TD>
		<TD><center><a href="?subtopic=characters&name='.urlencode($lottery['winner3']).'">'.$lottery['winner3'].'</a>
			<br/><small>(Wygrana: '.($lottery['balance'])*($procent3 / 100).'gp)</small></center></TD>
		<TD><center>Łączna pula: '.$lottery['balance'].'</center></TR>';
    }
    
    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>#</center></b></TD><TD class="white"><b><center>Dni temu</center></b></td><TD class="white"><b><center>1 miejsce</center></b></TD><TD class="white"><b><center>2 miejsce</center></b></td><TD class="white"><b><center>3 miejsce</center></b></td><TD class="white"><b><center>Łączna pula</center></b></td></TR>'.$content.'</TABLE>';
    $main_content .= '<br /><p align="right"><small>System created by <a href="http://www.elara.pl/?subtopic=characters&name=God+Dragonas">Dragonas</a>.</small></p>';
}
    ?> 