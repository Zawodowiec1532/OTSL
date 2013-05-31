<?php
if(isset($_SERVER['REDIRECT_URL']))
	header( 'location: /index.php?subtopic=error&id='.$_SERVER['REDIRECT_STATUS'] );

if (isset($_GET['id']))
{
	$_GET['id'] = (int) $_GET['id'];
	if($_GET['id'] == '404')
		$main_content .= '<h2><center>The requested URL was not found on this server.<br />Please contact with <a href="mailto:admin@trojaots.pl">TrojaOTS.pl - Support</a></center></h2>';
	elseif($_GET['id'] == '403')
		$main_content .= '<h2><center>You don\'t have permission to access the requested object.<br />It is either read-protected or not readable by the server.<br />Please contact with <a href="admin@trojaots.pl">TrojaOTS.pl - Support</a></center></h2>';
	else
		$main_content .= '<h2><center>Unknown Error with ID: '.(int) $_GET['id'].'.<br />Please contact with <a href="mailto:admin@trojaots.pl">TrojaOTS.pl - Support</a></center></h2>';
}
else
	$main_content .= '<h2><center>Don\'t try to cheat noob.. ;)</a></center></h2>';
?>