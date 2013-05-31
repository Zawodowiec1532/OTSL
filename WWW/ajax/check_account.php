<?PHP
function check_account_name($name)//sprawdza name
{
	$temp = strspn("$name", "QWERTYUIOPASDFGHJKLZXCVBNM0123456789");
	if ($temp != strlen($name))
		return false;
	if(strlen($name) > 30)
		return false;
	else
	{
		$ok = "/[A-Z0-9]/";
		return (preg_match($ok, $name))? true: false;
	}
}
echo '<?xml version="1.0" encoding="utf-8" standalone="yes"?>';
$config_ini = parse_ini_file('../config/config.ini');
$account = strtoupper(trim($_REQUEST['account']));
if(empty($account))
{
	echo '<image src="../images/false.gif"> <font color="red">Please enter an account number.</font>';
	exit;
}
if(strlen($account) > 0 && strlen($account) < 31)
{
	if(!check_account_name($account))
	{
		echo '<image src="../images/false.gif"> <font color="red">Invalid account name format. Use only A-Z and numbers 0-9.</font>';
		exit;
	}
	//connect to DB
	$server_config = parse_ini_file($config_ini['server_path'].'config.lua');
	if(isset($server_config['sqlHost']))
	{
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
	$account_db = new OTS_Account();
	$account_db->load($account);
	if($account_db->isLoaded())
		echo '<image src="../images/false.gif"> <font color="red">Account with this name already exist.</font>';
	else
		echo '<image src="../images/true.gif"> <font color="green">Your account name will be:  '.$account.'</font>';
}
else
	echo '<image src="../images/false.gif"> <font color="red">Account name is too long (max. 30 chars).</font>';
?>