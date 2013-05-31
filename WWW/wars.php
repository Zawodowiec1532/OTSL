   <?PHP
//Litle Config
$MaxShow = 100;
//END

if($action == '')
{
$main_content .= '
<P ALIGN=CENTER>
    <br>
    <FONT SIZE=4 COLOR=#8A0808>
        How to use...
    </FONT>
    <br>
    <br>
    <FONT SIZE=2 COLOR=#DF0101>
    * <b>/war-invite</b> :
        <FONT SIZE=1 COLOR=green>
            Send an invitation to start a war.<br>
            <u>Example</u>: /war-invite Death Hard
        </FONT><br>
    * <b>/war-accept</b> :
        <FONT SIZE=1 COLOR=green>
            Accept the invitation to start a war.
        </FONT><br>
    * <b>/war-reject</b> :
        <FONT SIZE=1 COLOR=green>
            Reject the invitation to start a war.
        </FONT><br>
    * <b>/war-cancel-invite</b> :
        <FONT SIZE=1 COLOR=green>
            Cancel the invitation already sent to start a war.
        </FONT><br>
    * <b>/war-cancel</b> :
        <FONT SIZE=1 COLOR=green>
            Finish the current war: it can only be used after 1 day of war.
        </FONT><br>
    </FONT>
    <br>
    <FONT SIZE=2 COLOR=#8A0808>
        Those commands can only be executed by guild leaders.<br><br>
        <table border="1"><tr border="1"><td border="1"><h3>Remember:</h3>
        <ul>
        <li>You won\'t get any frag if you kill someone that is VERSUS you.</li>
        <li>If you kill someone that is in your guild, you will get a frag.</li>
        </ul></td></tr></table>
    </FONT>
</P>
';
$wars = $SQL->query("
    SELECT g.name AS gname, wg.name AS wgname, g.war_time AS gtime, wg.war_time AS wgtime, g.kills AS kills, wg.kills AS ekills, g.show AS s, g.id AS gid, wg.id AS wgid, g.logo_gfx_name AS glogo, wg.logo_gfx_name AS wglogo
        FROM guilds AS g
    INNER JOIN guilds AS wg
        ON wg.id = g.in_war_with
    ORDER BY s DESC LIMIT 50;
");

foreach ($wars as $k=>$v) {
if ($v[s] == 1) 
{

$glogo = "default_logo.gif";
$wglogo = "default_logo.gif";

if(!empty($v[glogo]))
$glogo = $v[glogo];
if(!empty($v[wglogo]))
$wglogo = $v[wglogo];

if(is_int($number_of_rows / 2)) { $bgcolor = '#D4C0A1'; } else { $bgcolor = '#D5E1A2'; } $number_of_rows++;

    $stats .="
        <TR BGCOLOR=".$bgcolor.">
            <TD WIDTH=30%><center><a href='index.php?subtopic=guilds&action=show&guild=" . $v[gid] . "'><font color='#5A2800'>$v[gname]</font></a></center></TD>
            <TD WIDTH=40%><center><a href='index.php?subtopic=wars&action=show&war=" . $v[gid] . "'><font color='#5A2800'>{$v[kills]} - {$v[ekills]}</font></a></center></TD>
            <TD WIDTH=30%><center><a href='index.php?subtopic=guilds&action=show&guild=" . $v[wgid] . "'><font color='#5A2800'>$v[wgname]</font></a></center></TD>
        </TR>
        <TR BGCOLOR=".$bgcolor.">
            <TD><center><img src='guilds/".$glogo."' width='64px' height='64px'/></center></TD>
            <TD><center><b>Declared at:</b><br />" . date("d/m/y   H:i:s", $v[gtime]) . "<p><b>Started at:</b><br />" . date("d/m/y   H:i:s", $v[wgtime]) . "</center></TD>
            <TD><center><img src='guilds/".$wglogo."' width='64px' height='64px'/></center></TD>
        </TR>
    ";

}
}
$main_content .= '
<table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody>            <TR BGCOLOR="'.$config['site']['vdarkborder'].'"><td><font color="white" size=4><b><blink>Active Wars</blink></b></font></td></tr></tbody></table>
';
if(!$stats) {
    $main_content .= '
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            <TR BGCOLOR='.$config['site']['darkborder'].'>
                <TD>
                    No active wars in '.$config['server']['serverName'].' yet.
                </TD>
            </TR>
        </TABLE>
    ';
} else {
    $main_content .= "
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            $stats
        </TABLE>
    ";    
}

?>

<?PHP
$invitations = $SQL->query("
    SELECT ig.name AS igname, i.name AS iname, i.id AS iid, ig.id AS igid, i.war_time AS itime, i.logo_gfx_name AS ilogo, ig.logo_gfx_name AS iglogo
        FROM guilds AS i
    INNER JOIN guilds AS ig
        ON ig.id = i.invited_to
    ORDER BY itime ASC LIMIT 50;    
");
foreach ($invitations as $k=>$v) {

$ilogo = "default_logo.gif";
$iglogo = "default_logo.gif";

if(!empty($v[ilogo]))
$ilogo = $v[ilogo];
if(!empty($v[iglogo]))
$iglogo = $v[iglogo];

            if(is_int($number_of_rows / 2)) { $bgcolor = '#D4C0A1'; } else { $bgcolor = '#D5E1A2'; } $number_of_rows++;

    $invi .="
        <TR BGCOLOR=".$bgcolor.">
            <TD width=30%>
                <center>
                    <b>
                        <a href='index.php?subtopic=guilds&action=show&guild=" . $v[iname] . "'><font color='#5A2800'>$v[iname]</font></a>
                    </b>
                </center>
            </TD>
            <TD width=40%><center>0-0</center></TD>
            <TD width=30%>
                <center>
                    <b>
                        <a href='index.php?subtopic=guilds&action=show&guild=" . $v[igname] . "'><font color='#5A2800'>$v[igname]</font></a>
                    </b>
                </center>
            </TD>
        </TR>
        <TR BGCOLOR=".$bgcolor.">
            <TD>
                <center>
                        <img border=1 src='guilds/".$ilogo."' width='64px' height='64px'/>
                </center>
            </TD>
            <TD><center><b>Declared on:</b><br />" . date("d/m/y   H:i:s", $v[itime]) . "</center></TD>
            <TD>
                <center>
            <img border=1 src='guilds/".$iglogo."' width='64px' height='64px'/>
                </center>
            </TD>
        </TR>
    ";
}
$main_content .= '<br><br><br>
<table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody>            <TR BGCOLOR="'.$config['site']['vdarkborder'].'"><td><font color="white" size=4><b><blink>Declared Wars</blink></b></font></td></tr></tbody></table>';
if(!$invi) {
    $main_content .= '
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            <TR BGCOLOR='.$config['site']['darkborder'].'>
                <TD>
                    No declared wars in '.$config['server']['serverName'].' yet.
                </TD>
            </TR>
        </TABLE>
    <br>
    ';
} else {
    $main_content .= "
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            $invi
        </TABLE>
    ";
}
}

//SHOW FRAGS ~~
if($action == 'show')
{
$guild = $ots->createObject('Guild'); 
$guild->load($_REQUEST['war']);
$ranks = $SQL->query("
    SELECT 
        *
    FROM 
        guild_ranks 
    WHERE 
        guild_id = ". $guild->getId() ."
    ORDER BY
    level DESC;
    ");

foreach ($ranks as $y)
{
    $Players = $SQL->query("
    SELECT 
        *
    FROM 
        players 
    WHERE 
        rank_id = ". $y[id] ." 
    ORDER BY
    name
    ASC;");
    foreach ($Players as $v)
    {
    $totDeaths = 0;
    $deaths = $SQL->query("
    SELECT  
        COUNT(player_id) AS n
    FROM 
        deaths_in_wars
    WHERE 
        player_id = ". $v[id] ." 
    GROUP BY 
        player_id
    DESC LIMIT 1;");
        foreach ($deaths as $q)
        {
            $totDeaths = $q[n];
        }

if($totDeaths > 1 || $totDeaths == 0){
$deathL = "deaths";
}
else{
$deathL = "death";
}

    $membersDeaths1 .="<tr bgcolor=#D4C0A1>
                <td width=70%><a href=index.php?subtopic=characters&name=" . $v[name] . "><u>$v[name]</u></a></td>
        <td width=30%>$totDeaths $deathL</td>
    </tr>
    ";

    $totFrags = 0;
    $frags = $SQL->query("
    SELECT  
        COUNT(killer) AS m
    FROM 
        deaths_in_wars
    WHERE 
        killer = ". $v[id] ." 
    GROUP BY
    killer
    DESC LIMIT 1;");
        foreach ($frags as $p)
        {
            $totFrags = $p[m];
        }

if($totFrags > 1 || $totFrags == 0){
$fragL = "frags";
}
else{
$fragL = "frag";
}

    $membersFrags1 .= "<tr bgcolor=#D4C0A1>
                <td width=70%><a href=index.php?subtopic=characters&name=" . $v[name] . "><u>$v[name]</u></a></td>
        <td width=30%>$totFrags $fragL</td>
    </tr>
    ";
    }
}

$guild2 = $ots->createObject('Guild'); 
$guild2->load($guild->getCustomField(in_war_with));
$ranks2 = $SQL->query("
    SELECT 
        *
    FROM 
        guild_ranks 
    WHERE 
        guild_id = ". $guild2->getId() ."
    ORDER BY
    level DESC;
    ");

foreach ($ranks2 as $y)
{
    $Players = $SQL->query("
    SELECT 
        *
    FROM 
        players 
    WHERE 
        rank_id = ". $y[id] ." 
    ORDER BY
    name
    ASC;");
    foreach ($Players as $v)
    {
    $totDeaths2 = 0;
    $deaths = $SQL->query("
    SELECT  
        COUNT(player_id) AS n
    FROM 
        deaths_in_wars
    WHERE 
        player_id = ". $v[id] ." 
    GROUP BY
    player_id
    DESC LIMIT 1;");
        foreach ($deaths as $q)
        {
            $totDeaths2 = $q[n];
        }

if($totDeaths2 > 1 || $totDeaths2 == 0){
$deathL = "deaths";
}
else{
$deathL = "death";
}

    $membersDeaths2 .= "<tr bgcolor=#D4C0A1>
                <td width=70%><a href=index.php?subtopic=characters&name=" . $v[name] . "><u>$v[name]</u></a></td>
        <td width=30%>$totDeaths2 $deathL</td>
    </tr>
    ";

    $totFrags2 = 0;
    $frags = $SQL->query("
    SELECT  
        COUNT(killer) AS m
    FROM 
        deaths_in_wars
    WHERE 
        killer = ". $v[id] ." 
    GROUP BY
    killer
    DESC LIMIT 1;");
        foreach ($frags as $p)
        {
            $totFrags2 = $p[m];
        }

if($totFrags2 > 1 || $totFrags2 == 0){
$fragL = "frags";
}
else{
$fragL = "frag";
}

    $membersFrags2 .= "<tr bgcolor=#D4C0A1>
                <td width=70%><a href=index.php?subtopic=characters&name=" . $v[name] . "><u>$v[name]</u></a></td>
        <td width=30%>$totFrags2 $fragL</td>
    </tr>
    ";
    }
}

$deaths3 = $SQL->query("
    SELECT 
        * 
    FROM 
        deaths_in_wars 
    WHERE 
        (killer_guild = ". $guild->getId() ." OR killer_guild = ". $guild2->getId() .")
    ORDER BY 
        date 
    DESC LIMIT ". $MaxShow .";");

$deathsG1 = $SQL->query("
    SELECT 
        * 
    FROM 
        deaths_in_wars 
    WHERE 
        killer_guild = ". $guild->getId() ." 
    ORDER BY 
        date 
    DESC LIMIT ". $MaxShow .";");

$deathsG2 = $SQL->query("
    SELECT 
        * 
    FROM 
        deaths_in_wars 
    WHERE 
        killer_guild = ". $guild2->getId() ." 
    ORDER BY 
        date
    DESC LIMIT ". $MaxShow .";");

$Topfragger1 = $SQL->query("
    SELECT 
        killer, COUNT(killer) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild->getId() ." 
    GROUP BY 
        killer
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($Topfragger1 as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[killer]);
            $TopFraggerName = $name->getName();
            $numTop1 = $y[maximo];
        }
        
$Topfragger2 = $SQL->query("
    SELECT 
        killer, COUNT(killer) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild2->getId() ." 
    GROUP BY 
        killer
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($Topfragger2 as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[killer]);
            $TopFraggerName2 = $name->getName();
            $numTop2 = $y[maximo];
        }
        
$mostDead = $SQL->query("
    SELECT 
        player_id, COUNT(player_id) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild->getId() ." 
    GROUP BY 
        player_id
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($mostDead as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[player_id]);
            $mostDeadName = $name->getName();
            $mostDeadNum = $y[maximo];
        }

$mostDead2= $SQL->query("
    SELECT 
        player_id, COUNT(player_id) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild2->getId() ." 
    GROUP BY 
        player_id
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($mostDead2 as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[player_id]);
            $mostDeadName2 = $name->getName();
            $mostDeadNum2= $y[maximo];
        }

foreach ($deaths3 as $a=>$b) {
    
    $killed3 = $ots->createObject('Player');
    $killed3->load($b[player_id]);
    $killedName3 = $killed3->getName();

    $killer3 = $ots->createObject('Player');
    $killer3->load($b[killer]);
    $killerName3 = $killer3->getName();

    $guild3 = $ots->createObject('Guild');
    $guild3->load($b[killer_guild]);
    $guildName3 = $guild3->getName();

    $totKills1 = 0;
    $killss1 = $SQL->query("
    SELECT  
        COUNT(result1) AS m
    FROM 
        deaths_in_wars
    WHERE 
        (killer_guild = ". $guild->getId() ." AND date <= ". $b[date] .")
    GROUP BY
    result1
    DESC LIMIT 1;");
        foreach ($killss1 as $p)
        {
            $totKills1 = $p[m];
        }

    $totKills2 = 0;
    $killss2 = $SQL->query("
    SELECT  
        COUNT(result2) AS n
    FROM 
        deaths_in_wars
    WHERE 
        (killer_guild = ". $guild2->getId() ." AND date <= ". $b[date] .")
    GROUP BY
    result2
    DESC LIMIT 1;");
        foreach ($killss2 as $q)
        {
            $totKills2 = $q[n];
        }

    $kills3 .="
        <TR BGCOLOR=#D4C0A1>
            <TD>
                        <a href='index.php?subtopic=characters&name=" . $killerName3 . "'><u>$killerName3</u></a>
            </TD>
            <TD>
                        <a href='index.php?subtopic=characters&name=" . $killedName3 . "'><u>$killedName3</u></a>
            </TD>
            <TD>
            $guildName3
            </TD>
            <TD>
            $totKills1:$totKills2
            </TD>
            <TD>
                    " . date("d/m/y   H:i:s", $b[date]) . "
            </TD>
        </TR>
    ";
}

if(!empty($mostDeadNum)){$mostDeadNum = $mostDeadNum;}else{$mostDeadNum = 0 + $mostDeadNum;}
if(!empty($mostDeadNum2)){$mostDeadNum2 = $mostDeadNum2;}else{$mostDeadNum2 = 0 + $mostDeadNum2;}
if(!empty($numTop1)){$numTop1 = $numTop1;}else{$numTop1 = 0 + $numTop1;}
if(!empty($numTop2)){$numTop2 = $numTop2;}else{$numTop2 = 0 + $numTop2;}

foreach ($deathsG1 as $k=>$v) {
    
    $killed = $ots->createObject('Player');
    $killed->load($v[player_id]);
    $killedName = $killed->getName();

    $killer = $ots->createObject('Player');
    $killer->load($v[killer]);
    $killerName = $killer->getName();
    
    $kills .="
        <TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killedName . "'>$killedName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killerName . "'>$killerName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    " . date("d/m/y   H:i:s", $v[date]) . "
                </center>
            </TD>
        </TR>
    ";
}

foreach ($deathsG2 as $k=>$v) {
    
    $killed = $ots->createObject('Player');
    $killed->load($v[player_id]);
    $killedName = $killed->getName();

    $killer = $ots->createObject('Player');
    $killer->load($v[killer]);
    $killerName = $killer->getName();
    
    $kills2 .="
        <TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killedName . "'>$killedName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killerName . "'>$killerName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    " . date("d/m/y   H:i:s", $v[date]) . "
                </center>
            </TD>
        </TR>
    ";
}

if($numTop1 > 1 || $numTop1 == 0){$fragl1 = "frags";}else{$fragl1 = "frag";}
if($numTop2 > 1 || $numTop2 == 0){$fragl2 = "frags";}else{$fragl2= "frag";}
if($mostDeadNum > 1 || $mostDeadNum == 0){$deathl1 = "deaths";}else{$deathl1 = "death";}
if($mostDeadNum2 > 1 || $mostDeadNum2 == 0){$deathl2 = "deaths";}else{$deathl2 = "death";}

$main_content .= '
<table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody>            <TR BGCOLOR="'.$config['site']['vdarkborder'].'"><td><font color="white" size=4><b>War Information</b></font></td></tr></tbody></table>
';

$logo = "default_logo.gif";
$logo2 = "default_logo.gif";
$a = $guild->getCustomField(logo_gfx_name);
$b = $guild2->getCustomField(logo_gfx_name);
if(!empty($a))
$logo = $a;
if(!empty($b))
$logo2 = $b;

$main_content .= "
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR='#D4C0A1'>
            <TD WIDTH='35%'><center><a href='index.php?subtopic=guilds&action=show&guild=".$guild->getName()."'><font color='#5A2800'>".$guild->getName()."</font></a></center></TD>
            <TD WIDTH='30%'><center><font color='#5A2800'><b>".$guild->getCustomField(kills)." - ".$guild2->getCustomField(kills)."</b></font></center></TD>
            <TD WIDTH='35%'><center><a href='index.php?subtopic=guilds&action=show&guild=".$guild2->getName()."'><font color='#5A2800'>".$guild2->getName()."</font></a></center></TD>
        </TR>
        <TR BGCOLOR='#D4C0A1'>
            <TD><center><img src='guilds/".$logo."' width='64px' height='64px'/><p><b><u>Top fragger:</b></u><br /><a href='index.php?subtopic=characters&name=".$TopFraggerName."'>".$TopFraggerName."</a> (".$numTop1." ".$fragl1.")<p><b><u>Most dead:</b></u><br /><a href='index.php?subtopic=characters&name=".$mostDeadName2."'>".$mostDeadName2."</a> (".$mostDeadNum2." ".$deathl2.")</center></TD>
            <TD><center><b>Declared at:</b><br />" . date("d/m/y   H:i:s", $guild->getCustomField(war_time)) . "<p><b>Started at:</b><br />" . date("d/m/y   H:i:s", $guild2->getCustomField(war_time)) . "</center></TD>
            <TD><center><img src='guilds/".$logo2."' width='64px' height='64px'/><p><b><u>Top fragger:</u></b><br /><a href='index.php?subtopic=characters&name=".$TopFraggerName2."'>".$TopFraggerName2."</a> (".$numTop2." ".$fragl2.")<p><b><u>Most dead:</u></b><br /><a href='index.php?subtopic=characters&name=".$mostDeadName."'>".$mostDeadName."</a> (".$mostDeadNum." ".$deathl1.")</center></TD>
        </TR>
        </TABLE>    
";

$main_content .= '
<br><br><table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><td><font color="white" size=4><b>Kills - '.$guild->getName().' vs '.$guild2->getName().'</b></font></td></tr></tbody></table>
';

$main_content .= "
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR=#D4C0A1>
            <TD><b>Killer</b></TD>
            <TD><b>Victim</b></TD>
            <TD><b>Fragging Guild</b></TD>
            <TD><b>Result</b></TD>
            <TD><b>Date</b></TD>
        </TR>
    $kills3
        </TABLE>";

$main_content .= '
<br><br><table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><td><font color="white" size=4><b>Most Frags</b></font></td></tr></tbody></table>';

$main_content .= "
    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR=#D4C0A1>
            <TD width=50%>
                <div align='right'>
                    <B>
                        ". $guild->getName() ."
                    </B>
                </div>
            </TD>
            <TD width=50%>
                <div align='left'>
                    <B>
                        ". $guild2->getName() ."
                    </B>
                </div>
            </TD>
        </TR>
        <TR BGCOLOR=#D4C0A1>
            <TD>
                <div align='right'>
            <img src=guilds/".$logo." width='64px' height='64px' />
        </div>
            </TD>
            <TD>
                <div align='left'>
            <img src=guilds/".$logo2." width='64px' height='64px' />
                </div>
            </TD>
        </TR>
    </TABLE>
    <TABLE ALIGN=LEFT BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=50%>
        $membersFrags1
    </TABLE>
    <TABLE ALIGN=RIGHT BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=50%>
        $membersFrags2
    </TABLE>

";
$main_content .= '
<table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody><TR><td><font color="white" size=1>.</font></td></tr></tbody></table>';
$main_content .= '
<table border="0" CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><td><font color="white" size=4><b>Most Deaths</b></font></td></tr></tbody></table>';
$main_content .= "
    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR=#D4C0A1>
            <TD width=50%>
        <div align='right'>
                    <B>
                        ". $guild->getName() ."
                    </B>
        </div>
            </TD>
            <TD width=50%>
        <div align='left'>
                    <B>
                        ". $guild2->getName() ."
                    </B>
        </div>
            </TD>
        </TR>
        <TR BGCOLOR=#D4C0A1>
            <TD>
        <div align='right'>
            <img src=guilds/".$logo." width='64px' height='64px' />
        </div>
            </TD>
            <TD>
        <div align='left'>
            <img src=guilds/".$logo2." width='64px' height='64px' />
        </div>
            </TD>
        </TR>
    </TABLE>
    <TABLE ALIGN=LEFT BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=50%>
        $membersDeaths1
    </TABLE>
    <TABLE ALIGN=RIGHT BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=50%>
        $membersDeaths2
    </TABLE>
";
}
$main_content .= "
<table border='0' CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody><TR><td><div style='text-align: right; margin: 20px auto; font-size: 10px;'>
      Coded by <a target='blank' href='http://otland.net/members/nahruto/'>Nahruto</a> and <a target='blank' href='http://otland.net/members/xampy/'>Xampy</a> | Fixed & Edited by <a target='blank' href='http://otland.net/members/xampy/'>Xampy</a></div></td></tr></tbody></table>";
?> 