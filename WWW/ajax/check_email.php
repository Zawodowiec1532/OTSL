<?PHP
$ok = "/[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,4}/";
echo '<?xml version="1.0" encoding="utf-8" standalone="yes"?>';
$config_ini = parse_ini_file('../config/config.ini');
$email = stripslashes(trim($_REQUEST['email']));
if(empty($email))
{
	echo '<image src="../images/false.gif"> <font color="red">Please enter an e-mail.</font>';
	exit;
}
if(strlen($email) < 255)
{
	if(preg_match($ok, $email))
	{
		if($config_ini['one_email'] == 'yes')
		{
			//connect to DB
			$server_config = parse_ini_file($config_ini['server_path'].'config.lua');
			if(isset($server_config['sqlHost']))
			{
				//old (0.2.4) ots config.lua file
				$mysqlhost = $server_config['sqlHost'];
				$mysqluser = $server_config['sqlUser'];
				$mysqlpass = $server_config['sqlPass'];
				$mysqldatabase = $server_config['sqlDatabase'];
				$sqlitefile = $server_config['sqliteDatabase'];
			}
			// loads #####POT mainfile#####
			include('../pot/OTS.php');
			// PDO and POT connects to database
			$ots = POT::getInstance();
			if($server_config['sqlType'] == "mysql")
				$ots->connect(POT::DB_MYSQL, array('host' => $mysqlhost, 'user' => $mysqluser, 'password' => $mysqlpass, 'database' => $mysqldatabase) );
			elseif($server_config['sqlType'] == "sqlite")
				$ots->connect(POT::DB_SQLITE, array('database' => $config_ini['server_path'].$sqlitefile));
			$email_db = new OTS_Account();
			$email_db->find($email);
			if($email_db->isLoaded())
				echo '<image src="../images/false.gif"> <font color="red">Account with this e-mail already exist.</font>';
			else
				echo '<image src="../images/true.gif"> <font color="green">Good e-mail.</font>';
		}
		else
			echo '<image src="../images/true.gif"> <font color="green">Good e-mail.</font>';
	}
	else
		echo '<image src="../images/false.gif"> <font color="red">Wrong e-mail format.</font>';
}
else
	echo '<image src="../images/false.gif"> <font color="red">E-mail is too long (max. 255 chars).</font>';

?>