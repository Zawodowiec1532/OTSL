   <?PHP
                $main_content .= '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'">
	<TD CLASS=white><b><center>Kup Punkty Przelewem</center><b></TD>
	</TR><TR BGCOLOR='.$config['site']['darkborder'].'>
	</TD></TABLE>';
	                $bgcolor = $config['site']['lightborder'];
					$bgcolor2 = $config['site']['darkborder'];
					
					    $main_content .= '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'">
	</TR><TR BGCOLOR='.$config['site']['darkborder'].'>
	
	<TD>
	<center><h2>Niezbędne Infromacje oraz Zasady Zakupu:</h2><b>
	
	Co 24h (o 18:00) Support sprawdza nowe zaksięgowane wpłaty.</br>
	Każda wpłata musi być zgodna z zamieszczonym poniżej taryfikatorem oraz musi posiadać tytuł‚ zawierający Account Name i Imię Postaci.</br>
	<i>Pamiętaj, że każda wpłata bez tytułu lub niezgodna z kwotą taryfikatora zostanie uznana jako darowizna na rzecz Deltoria.pl</i></br>
	<blink><font color="red"><b>GRATIS ZMIENIANY JEST RAZ W TYGODNIU !</font></blink></b>
	</TR></TD></TABLE><br/>
<P ALIGN=CENTER>
        <table bordercolor="brown" bodercolorlight="brown" bordercolordark="brown" border="10"><tr bordercolor="red" bodercolorlight="red" bordercolordark="red" border="1"><td border="1"><h3><center>Dane Przelewu:</center></h3>
        <ul>
        <li>Dariusz Gajdziński</li>
        <li>Ul. B. Głowackiego 47/40</li>
		<li>85-717 Bydgoszcz</li>
		<li>ING Bank Śląski</li>
		<li>35 1050 1139 1000 0018 0208 5454</li>
        </ul></td></tr></table>
    </FONT>		
	</P>';	
					
					
	$content .= '<TR BGCOLOR='.$bgcolor.'>
		<TD><center><b>5 zł</b></center></TD>
		<TD><center><b>630</center></b></TD>
		</TR>';
	$content .= '<TR BGCOLOR='.$bgcolor2.'>
		<TD><center><b>10 zł</b></center></TD>
		<TD><center><b>1300</b></center></TD>
		</TR>';
			$content .= '<TR BGCOLOR='.$bgcolor.'>
		<TD><center><b>20 zł</b></center></TD>
		<TD><center><blink><font color="red"><b>3000 + GRATIS*</font></blink></b></center></TD>
		</TR>';
		

	


	    $main_content .= '<center><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=4 WIDTH=40%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>Koszt</center></b></TD><TD class="white"><b><center>IloĹ›Ä‡ punktĂłw</center></b></td></TR>'.$content.'</TABLE>';
		
	$main_content .= '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'">
	<TD CLASS=white><b><center>Wzór Wpłaty za 20 zł</center><b></TD>
		<TR BGCOLOR='.$bgcolor2.'>
		<TD><center><img src="aa.png"></center></TD>
		</TR><br><br></TR>';
		
		
$main_content .= "
<table border='0' CELLSPACING=1 CELLPADDING=4 WIDTH=100%><tbody><TR><td><div style='text-align: left; margin: 5px auto; font-size: 10px; color: red;'><br><br>
   * W tym tygodniu jako GRATIS rozdawane są: <img src='s.gif'></div></td></tr></tbody></table>";
	?>