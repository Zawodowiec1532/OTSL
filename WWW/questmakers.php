<?PHP
$quest_list = $config['site']['quests'];
if(!$quest_list)
{
        $main_content .= 'Uzupe3nij storage questow w cofingu';
        break;
}
$players = $SQL->query('SELECT * FROM players WHERE deleted = 0 AND group_id < '.$config['site']['players_group_id_block'].' AND account_id != 1');
$nr_gracza = 0;
$main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR='.$config['site']['vdarkborder'].'><TD align="left" COLSPAN=2 CLASS=white width="90%"><B>Best quest makers</B></TD></TR>';
foreach ($players as $player) 
{
        $ilosc_questow_wykonanych = 0;
        $ilosc_questow = 0;
        foreach($quest_list as $storage => $name)
        {
                $ilosc_questow++;
                $quest_baza = $SQL->query("SELECT * FROM player_storage WHERE player_id = ".$player['id']." AND `key` = '".$quest_list[$storage]."'");
                foreach($quest_baza as $idd)
                        $ilosc_questow_wykonanych++;
        }
        $ilosc_procent =($ilosc_questow_wykonanych / $ilosc_questow) * 100;
        $gracz_wynik[$player['name']] = $ilosc_procent;
}
$gracze_wyniki = arsort($gracz_wynik);
foreach($gracz_wynik as $gracz => $procent)
{
        if(is_int($nr_gracza / 2))
                $bgcolor = $config['site']['darkborder'];
        else
                $bgcolor = $config['site']['lightborder'];
        $nr_gracza++;
        $main_content .= '<TR BGCOLOR="'.$bgcolor.'"><TD width=60%>'.$gracz.'</td><td>'.number_format($procent,0).'%<div title="'.number_format($procent,0).'%" style="width: 100%; height: 3px; border: 1px solid #000;"><div style="background: green; width: '.$procent.'%; height: 3px;"></td></tr>';
}
$main_content .= '</table>';
?>