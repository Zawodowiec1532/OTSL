<?PHP
ini_set( 'display_errors', 'On' ); 
error_reporting( E_ALL );
ini_set("display_errors", 0);
session_start();
ob_start("ob_gzhandler");
date_default_timezone_set('Europe/Warsaw');
//require('./exaBD.php');
function microtime_float()
{
	list($usec, $sec) = explode(" ", microtime());
	return ((float)$usec + (float)$sec);
}
$time_start = microtime_float();

// Config
include('config-and-functions.php');
$action = $_REQUEST['action'];

// Logout
if($action == "logout")
{
	unset($_SESSION['account']);
	unset($_SESSION['password']);
}

// Login
$logged = FALSE;
if(isset($_SESSION['account']))
{
	$account_logged = $ots->createObject('Account');
	$account_logged->load($_SESSION['account']);
	if($account_logged->isLoaded() && $account_logged->getPassword() == $_SESSION['password'])
	{
		$logged = TRUE;
		$group_id_of_acc_logged = $account_logged->getPageAccess();
	} 
	else 
	{
		$logged = FALSE;
		unset($_SESSION['account']);
		unset($account_logged);
	}
}
$login_account = strtoupper(trim($_POST['account_login']));
$login_password = trim($_POST['password_login']);
if(!$logged && !empty($login_account) && !empty($login_password))
{
	$login_password = password_ency($login_password);
	$account_logged = $ots->createObject('Account');
	$account_logged->find($login_account);
	if($account_logged->isLoaded())
	{
		if($login_password == $account_logged->getPassword())
		{
			$_SESSION['account'] = $account_logged->getId();
			$_SESSION['password'] = $login_password;
			$logged = TRUE;
			$account_logged->setCustomField("page_lastday", time());
			$group_id_of_acc_logged = $account_logged->getPageAccess();
		} 
		else
			$logged = FALSE;
	}
}

// Load Page
if(empty($_REQUEST['subtopic']))
{
	$_REQUEST['subtopic'] = "latestnews";
	$subtopic = "latestnews";
}
switch($_REQUEST['subtopic'])
{
	case "latestnews":
		$topic = "Latest News";
		$subtopic = "latestnews";
		include("latestnews.php");
		break;

	case "archive";
		$topic = "News Archives";
		$subtopic = "archive";
		include("archive.php");
		break;
	case "creatures";
		$topic = "Creatures";
		$subtopic = "creatures";
		include("creatures.php");
		break;

	case "spells";
		$topic = "Spells";
		$subtopic = "spells";
		include("spells.php");
		break;

	case "serverinfo";
		$topic = "Server Info";
		$subtopic = "serverinfo";
		include("serverinfo.php");
		break;

	case "experiencetable";
		$topic = "Experience Table";
		$subtopic = "experiencetable";
		include("experiencetable.php");
		break;

	case "wars":  
		$topic = "Wars";  
		$subtopic = "wars";  
		include("war.php");  
		break;

	case "characters";
		$topic = "Characters";
		$subtopic = "characters";
		include("characters.php");
		break;

	case "whoisonline";
		$topic = "Who is online?";
		$subtopic = "whoisonline";
		include("whoisonline.php");
		break;

	case "highscores";
		$topic = "Highscores";
		$subtopic = "highscores";
		include("highscores.php");
		break;

	case "killstatistics";
		$topic = "Last Kills";
		$subtopic = "killstatistics";
		include("killstatistics.php");
		break;

	case "bans":
		$topic = "Banishments";
		$subtopic = "bans";
		include("bans.php");
		break;

	case "guilds";
		$topic = "Guilds";
		$subtopic = "guilds";
		include("guilds.php");
		break;

	case "questmakers";
		$topic = "Quest Makers";
		$subtopic = "questmakers";
		include("questmakers.php");
		break;

	case "bansmeneger";
		$topic = "Bans Menager";
		$subtopic = "bansmeneger";
		include("bansmeneger.php");
		break;

	case "forum":
		$topic = "Forum";
		$subtopic = "forum";
		include("forum.php");
		break;

	case "accountmanagement";
		$topic = "Account Management";
		$subtopic = "accountmanagement";
		include("accountmanagement.php");
		break;

	case "createaccount";
		$topic = "Create Account";
		$subtopic = "createaccount";
		include("createaccount.php");
		break;

	case "lostaccount";
		$topic = "Lost Account";
		$subtopic = "lostaccount";
		include("lostaccount.php");
		break;

	case "downloads";
		$topic = "Downloads";
		$subtopic = "downloads";
		include("downloads.php");
		break;

	case "commands";
		$topic = "Commands";
		$subtopic = "commands";
		include("commands.php");
		break;

	case "serverrules";
		$topic = "Server Rules";
		$subtopic = "serverrules";
		include("serverrules.php");
		break;

	case "bonusaddon";
		$topic = "Addon Bonus";
		$subtopic = "addonbonus";
		include("bonusaddon.php");
		break;

	case "support";
		$topic = "Support List";
		$subtopic = "support";
		include("support.php");
		break;

	case "kontakt";
		$topic = "Kontakt";
		$subtopic = "kontakt";
		include("kontakt.php");
		break;
		
	case "adminpanel":
		$topic = "Admin Panel";
		$subtopic = "adminpanel";
		include("adminpanel.php");
		break;

	case "namelock";
		$topic = "Namelock Manager";
		$subtopic = "namelock";
		include("namelocks.php");
		break;

	case "buypoints";
		$topic = "Buy Points";
		$subtopic = "buypoints";
		include("buypoints.php");
		break;

	case "shopsystem";
		$topic = "Shop System";
		$subtopic = "shopsystem";        
		include("shopsystem.php");
		break;

	case "shopadmin";
		$topic = "Shop Admin";
		$subtopic = "shopadmin";
		include("shopadmin.php");
		break;

	case "credits":
		$topic = "Credits";
		$subtopic = "credits";
		include("credits.php");
		break;

	case "toprichest";
		$topic = "Top Richest Players";
		$subtopic = "toprichest";
		include("toprichest.php");
		break;

	case "ganja":
		$topic = "Ganja System";
		$subtopic = "ganja";
		include("ganja.php");
		break;

	case "shopadmin";
		$topic = "Shop Admin";
		$subtopic = "shopadmin";
		include("shopadmin.php");
		break;

	case "addons";
		$topic = "Addons";
		$subtopic = "addons";
		include("addons.php");
		break;

	case "auctionsystem";
		$topic = "Auction System";
		$subtopic = "auctionsystem";
		include("auctionsystem.php");
		break;

	case "lotterysystem";
		$topic = "Lottery System";
		$subtopic = "lotterysystem";
		include("lotterysystem.php");
		break;

	case "error";
		$topic = "Error";
		$subtopic = "error";
		include("error.php");
		break;
}

//$main_content .= print_r(error_get_last());;
// Page Titler
if(empty($topic))
{
	header('Location: /index.php?subtopic=error&id=404');
} 
else
{
	$title = $GLOBALS['config']['server']["serverName"]." - ".$topic;
}

// Page Fotter
function getFooter()
{
	echo 'Account maker by <i><a href="index.php?subtopic=credits">Credits</a></i>.';
}

// Layout Load
$layout_header = '<script type=\'text/javascript\'>
function GetXmlHttpObject()
{
	var xmlHttp=null;
	try
	{
		xmlHttp=new XMLHttpRequest();
	}
	catch (e)
	{
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlHttp;
}

function MouseOverBigButton(source)
{
	source.firstChild.style.visibility = "visible";
}

function MouseOutBigButton(source)
{
	source.firstChild.style.visibility = "hidden";
}

function BigButtonAction(path)
{
	window.location = path;
}
var';

if($logged)
{
	$layout_header .= "loginStatus=1; loginStatus='true';";
} 
else 
{ 
	$layout_header .= "loginStatus=0; loginStatus='false';";
}
$layout_header .= " var activeSubmenuItem='".$subtopic."';</script>";
include($layout_name."/layout.php");
ob_end_flush();
?>