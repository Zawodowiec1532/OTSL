<?PHP
if($config['site']['credits_page'])
{
	$main_content .= '
	<center>
		OTSL Account Maker based on Gesior ACC.<br>
		<a href="http://code.google.com/p/gesior-aac/" target="_blank">Gesior Account Maker - Google Code</a>
	</center>
	<hr>
		<center><b><a href="http://tibia.net.pl/members/254729-Mag-Egzorcysta" target="_blank"><font color="red"><u>Leon Zawodowiec</u></font></a> - Owner</b><br></center>
		<hr><center>
		<b>Developers:</b><br>
		Gandhi - LUA/C++<br>
		Leon Zawodowiec - LUA</center>
		
		<hr><center>
		<b>Mappers:</b><br>
		Thanks to Shirako. :)</center>
		
		<hr><center>
		<b>Old Gamemaster\'s & Other Stuff:</b><br>
		prezes9732 - Thanks for logo.<br>
	<hr>
		&copy; 2012-2013 <strong>OTSL by Leon Zawodowiec</strong> - All rights reserved.
	<hr>
	</center>';
}
else
	$main_content .= "Invalid subtopic. Can't load page.";
?>