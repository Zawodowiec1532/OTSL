<?php
// check that the request comes from PayGol server
if(!in_array($_SERVER['REMOTE_ADDR'],
  array('109.70.3.48', '109.70.3.146', '109.70.3.58'))) {
  header("HTTP/1.0 403 Forbidden");
  die("CHyba cie popierdolilo ziomus :D");
}
// CONFIG
$your_service_id = 44190;  // Twoje service ID z PayGola

// get the variables from PayGol system
$message_id	= $_GET['message_id'];
$service_id	= $_GET['service_id'];
$shortcode	= $_GET['shortcode'];
$keyword	= $_GET['keyword'];
$message	= $_GET['message'];
$sender	= $_GET['sender'];
$operator	= $_GET['operator'];
$country	= $_GET['country'];
$custom	= $_GET['custom'];
$points	= $_GET['points'];
$price		= $_GET['price'];
$currency	= $_GET['currency'];

//Replace these parameters by your database details
$dbhost     = "localhost"; //Your database domain
$dbuser     = "root"; //Database username
$dbpassword = "polak12"; //Database password
$db         = "otsl"; //Database name

if ($your_service_id == $service_id) {
	//Connect to Database
	$conn = mysql_connect($dbhost, $dbuser, $dbpassword);
	mysql_select_db($db);
	$sql = "UPDATE accounts SET premium_points = premium_points+'".mysql_real_escape_string($points)."' WHERE id = '".mysql_real_escape_string($custom)."'";
	mysql_query($sql);

	mysql_close($conn);
}

?>