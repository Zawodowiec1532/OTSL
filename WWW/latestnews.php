<?PHP
// Queries for table with best players
$query = $SQL->query('SELECT `players`.`name`,`players`.`id`,`players`.`level`, `players`.`experience` FROM `players`,`server_motd` WHERE `players`.`group_id` < '.$config['site']['players_group_id_block'].' AND `players`.`name` != "Account Manager" ORDER BY `players`.`level` DESC, `players`.`experience` DESC, `server_motd`.`id` DESC LIMIT 1;')->fetch();
$query2 = $SQL->query('SELECT `id`, `name` FROM `players` ORDER BY `id` DESC LIMIT 1;')->fetch();
$players = $SQL->query('SELECT `id` FROM `players` ORDER BY `id` DESC LIMIT 1;')->fetch();
$accounts = $SQL->query('SELECT COUNT(*) FROM `accounts` WHERE `id`>0;')->fetch();
$players2 = $SQL->query('SELECT COUNT(*) FROM `accounts` WHERE `id`>0;')->fetch();
$banned = $SQL->query('SELECT COUNT(*) FROM `bans` WHERE `active` = 1 AND `type` !=2 AND `type` !=4;')->fetch();
$notations = $SQL->query('SELECT COUNT(*) FROM `bans` WHERE `active` = 1 AND `type` = 4;')->fetch();
$bestknight = $SQL->query('SELECT level, name, level, maglevel FROM `players` WHERE `vocation` = 4 ORDER BY `level` DESC LIMIT 1;')->fetch();
$bestpall = $SQL->query('SELECT level, name, level, maglevel FROM `players` WHERE `vocation` = 3 ORDER BY `level` DESC LIMIT 1;')->fetch();
$bestsorc = $SQL->query('SELECT level, name, level, maglevel FROM `players` WHERE `vocation` = 1 ORDER BY `level` DESC LIMIT 1;')->fetch();
$bestdrut = $SQL->query('SELECT level, name, level, maglevel FROM `players` WHERE `vocation` = 2 ORDER BY `level` DESC LIMIT 1;')->fetch();
// End Queries

$main_content .= '<script language="JavaScript">
	TargetDate = "12/19/2012 6:00 PM";
	CountActive = true;
	CountStepper = -1;
	LeadingZero = true;
	DisplayFormat = "<font size=\'1\' color=\'red\'><h1><center>Troja OTS starts in:<br/> %%D%% days, %%H%% hours, %%M%% minuts and %%S%% seconds!</center></h1></font>";
	FinishMessage = "";
				</script>
	<script language="JavaScript" src="countdown.js"></script>

	<table bgcolor='.$config['site']['darkborder'].' border=0 cellpadding=4 cellspacing=1 width=100%>
		<tr bgcolor='. $config['site']['vdarkborder'] .'><td align="center" class=white colspan=1><b>Welcome to '.$config['server']['serverName'].'</b></td></tr>
		<tr>
			<td><table border=0 cellpadding=1 cellspacing=1 width=100%>
				<tr bgcolor='. $config['site']['lightborder'] .'><td><center>Last joined us: <a href="?subtopic=characters&name='.urlencode($query2['name']).'">'.$query2['name'].'</a>, player number: <b>'.$query2['id'].'</b>. Welcome and wish you a nice game!</center></td></tr>
				<tr bgcolor='. $config['site']['lightborder'] .'><td><center>Currently, the best player on the server is: <a href="index.php?subtopic=characters&name='.urlencode($query['name']).'"> '.$query['name'].'</a> ('.urlencode($query['level']).'). Congratulations!</center></td></tr>
				<tr bgcolor='. $config['site']['lightborder'] .'><td><center><b>Accounts</b> in Database: '.$accounts[0].' | <b>Players</b> in Database: '.$players2[0].'</center></td></tr>
				<tr bgcolor='. $config['site']['lightborder'] .'><td><center><b>Banned</b> Accounts: '.$banned[0].' | <b>Notated</b> Players: '.$notations[0].'</center></td></tr>
				<tr bgcolor='. $config['site']['darkborder'] .'><td><center><b><font color="maroon">The Best Knight is:</font></b><a href="?subtopic=characters&name='.urlencode($bestknight['name']).'">  '.$bestknight['name'].'</a> ('.$bestknight['level'].') with '.$bestknight['maglevel'].' Magic Level !</center></td></tr>
				<tr bgcolor='. $config['site']['darkborder'] .'><td><center><b><font color="maroon">The Best Paladin is:</font></b><a href="?subtopic=characters&name='.urlencode($bestpall['name']).'"> '.$bestpall['name'].'</a> ('.$bestpall['level'].') with '.$bestpall['maglevel'].' Magic Level !</center></td></tr>
				<tr bgcolor='. $config['site']['darkborder'] .'><td><center><b><font color="maroon">The Best Sorcerer is:</font></b><a href="?subtopic=characters&name='.urlencode($bestsorc['name']).'">  '.$bestsorc['name'].'</a> ('.$bestsorc['level'].') with '.$bestsorc['maglevel'].' Magic Level !</center></td></tr>
				<tr bgcolor='. $config['site']['darkborder'] .'><td><center><b><font color="maroon">The Best Druid is:</font></b><a href="?subtopic=characters&name='.urlencode($bestdrut['name']).'">  '.$bestdrut['name'].'</a> ('.$bestdrut['level'].') with '.$bestdrut['maglevel'].' Magic Level !</center></td></tr>
			</table></td>
		</tr>
	</table>';
	
// SHOW TICKERS AND NEWS
$time = time();
if($action == "") 
{
	// Show Tickers
	$tickers = $SQL->query('SELECT * FROM '.$SQL->tableName('z_news_tickers').' WHERE hide_ticker != 1 ORDER BY date DESC LIMIT '.$config['site']['news_ticks_limit'].';');
	$number_of_tickers = 0;
	if(is_object($tickers))
	{
		foreach($tickers as $ticker) 
		{
			if(is_int($number_of_tickers / 2))
				$color = "Odd";
			else
				$color = "Even";

			$tickers_to_add .= '<div id="TickerEntry-'.$number_of_tickers.'" class="Row" onclick=\'TickerAction("TickerEntry-'.$number_of_tickers.'")\'>
				<div class="'.$color.'">
				<div class="NewsTickerIcon" style="background-image: url('.$layout_name.'/images/news/icon_'.$ticker['image_id'].'.gif);"></div>
				<div id="TickerEntry-'.$number_of_tickers.'-Button" class="NewsTickerExtend" style="background-image: url('.$layout_name.'/images/general/plus.gif);"></div>
				<div class="NewsTickerText">
					<span class="NewsTickerDate">'.date("j M Y", $ticker['date']).' -</span>
					<div id="TickerEntry-'.$number_of_tickers.'-ShortText" class="NewsTickerShortText">';
						if($group_id_of_acc_logged >= $config['site']['access_tickers']) // Shows DELETE button for admins.
							$tickers_to_add .= '<a href="index.php?subtopic=latestnews&action=deleteticker&id='.$ticker['date'].'"><img src="'.$layout_name.'/images/news/delete.png" border="0"></a> ';
						$tickers_to_add .= short_text($ticker['text'], 60).'</div>
						<div id="TickerEntry-'.$number_of_tickers.'-FullText" class="NewsTickerFullText">';
							if($group_id_of_acc_logged >= $config['site']['access_tickers']) // Shows DELETE button for admins.
								$tickers_to_add .= '<a href="index.php?subtopic=latestnews&action=deleteticker&id='.$ticker['date'].'"><img src="'.$layout_name.'/images/news/delete.png" border="0"></a> ';
							$tickers_to_add .= $ticker['text'].'</div>
						</div>
					</div>
				</div>';
			$number_of_tickers++;
		}
	}
	if(!empty($tickers_to_add)) // Show table with tickers
	{
		$news_content .= '<div id="newsticker" class="Box">
			<div class="Corner-tl" style="background-image: url('.$layout_name.'/images/content/corner-tl.gif);"></div>
			<div class="Corner-tr" style="background-image: url('.$layout_name.'/images/content/corner-tr.gif);"></div>
			<div class="Border_1" style="background-image: url('.$layout_name.'/images/content/border-1.gif);"></div>
			<div class="BorderTitleText" style="background-image: url('.$layout_name.'/images/content/title-background-green.gif);"></div>
			<img class="Title" src="'.$layout_name.'/images/header/headline-newsticker.gif" alt="Contentbox headline">
			<div class="Border_2">
				<div class="Border_3">
					<div class="BoxContent" style="background-image: url('.$layout_name.'/images/content/scroll.gif);">';
						if($group_id_of_acc_logged >= $config['site']['access_tickers'])
							$tickers_to_add .= '<script type="text/javascript">
								var showednewticker_state = "0";
								function showNewTickerForm()
								{
									if(showednewticker_state == "0") 
									{
										document.getElementById("newtickerform").innerHTML = \'<form action="index.php?subtopic=latestnews&action=newticker" method="post" ><table border="0"><tr><td bgcolor="D4C0A1" align="center"><b>Select icon:</b></td><td><table border="0" bgcolor="F1E0C6"><tr><td><img src="images/news/icon_0.gif" width="20"></td><td><img src="images/news/icon_1.gif" width="20"></td><td><img src="images/news/icon_2.gif" width="20"></td><td><img src="images/news/icon_3.gif" width="20"></td><td><img src="images/news/icon_4.gif" width="20"></td></tr><tr><td><input type="radio" name="icon_id" value="0" checked="checked"></td><td><input type="radio" name="icon_id" value="1"></td><td><input type="radio" name="icon_id" value="2"></td><td><input type="radio" name="icon_id" value="3"></td><td><input type="radio" name="icon_id" value="4"></td></tr></table></td></tr><tr><td align="center" bgcolor="D4C0A1"><b>New<br>ticker<br>text:</b></td><td bgcolor="F1E0C6"><textarea name="new_ticker" rows="3" cols="45"></textarea></td></tr><tr><td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></form><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddTicker" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" onClick="showNewTickerForm()" alt="AddTicker" /></div></div></td></tr></table>\';
										document.getElementById("jajo").innerHTML = \'\';
										showednewticker_state = "1";
									}
									else 
									{
										document.getElementById("newtickerform").innerHTML = \'\';
										document.getElementById("jajo").innerHTML = \'<div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddTicker" src="'.$layout_name.'/images/buttons/addticker.gif" onClick="showNewTickerForm()" alt="AddTicker" /></div></div>\';
										showednewticker_state = "0";
									}
								}
							</script>
						<div id="newtickerform"></div><div id="jajo"><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddTicker" src="'.$layout_name.'/images/buttons/addticker.gif" onClick="showNewTickerForm()" alt="AddTicker" /></div></div></div><hr/>';
						$news_content .= $tickers_to_add;
					$news_content .= '</div>
				</div>
			</div>
		<div class="Border_1" style="background-image: url('.$layout_name.'/images/content/border-1.gif);"></div>
		<div class="CornerWrapper-b"><div class="Corner-bl" style="background-image: url('.$layout_name.'/images/content/corner-bl.gif);"></div></div>
		<div class="CornerWrapper-b"><div class="Corner-br" style="background-image: url('.$layout_name.'/images/content/corner-br.gif);"></div></div>
		</div>';
	}
	if($config['site']['langSystem']) // Show languange choice \/
		$main_content .= '<table style="border: 1px solid '.$config['site']['vdarkborder'].'; border-spacing: 1px" width=100%>
			<tr style="vertical-align: middle">
				<td><b>Set news language:</b> 
					<a href="index.php?subtopic=latestnews&lang=en"><img src="http://images.boardhost.com/flags/us.png"></a>
					<a href="index.php?subtopic=latestnews&lang='.$config['site']['chooseLang'].'"><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"></a> 
				</td>
				<td><center><b><a href="index.php?subtopic=serverinfo">General info about TrojaOTS.pl</a></b></center>
				</td>
			</tr>
		</table><br>'; // /\
		
	if($lang == 'en')
	{
		$newsLanguageSystem = 'topic_df, text_df';
		$newsTopicInfo = 'topic_df';
		$newsTextInfo = 'text_df';
	}
	elseif($lang == $config['site']['chooseLang'])
	{
		$newsLanguageSystem = 'topic_ot, text_ot';
		$newsTopicInfo = 'topic_ot';
		$newsTextInfo = 'text_ot';
	}
	else
	{
		$newsLanguageSystem = 'topic_df, text_df';
		$newsTopicInfo = 'topic_df';
		$newsTextInfo = 'text_df';
	}
	$news_DB = $SQL->query('SELECT image_id, date, author, '.$newsLanguageSystem.' FROM z_news_big WHERE hide_news != 1 ORDER BY date DESC LIMIT '.$config['site']['news_big_limit'].';');

	if(!empty($news_DB)) // Show "BIG" news here
	{
		if($group_id_of_acc_logged >= $config['site']['access_news']) // Show button to Add News
			$main_content .= '<script type="text/javascript">
				var showednewnews_state = "0";
				function showNewNewsForm()
				{
					if(showednewnews_state == "0") 
					{
						document.getElementById("newnewsform").innerHTML = \'<form action="index.php?subtopic=latestnews&action=newnews" method="post" ><table border="0"><tr><td bgcolor="D4C0A1" align="center"><b>Select icon:</b></td><td><table border="0" bgcolor="F1E0C6"><tr><td><img src="images/news/icon_0.gif" width="20"></td><td><img src="images/news/icon_1.gif" width="20"></td><td><img src="images/news/icon_2.gif" width="20"></td><td><img src="images/news/icon_3.gif" width="20"></td><td><img src="images/news/icon_4.gif" width="20"></td></tr><tr><td><input type="radio" name="icon_id" value="0" checked="checked"></td><td><input type="radio" name="icon_id" value="1"></td><td><input type="radio" name="icon_id" value="2"></td><td><input type="radio" name="icon_id" value="3"></td><td><input type="radio" name="icon_id" value="4"></td></tr></table></td></tr><tr><td align="center" bgcolor="F1E0C6"><b><img src="http://images.boardhost.com/flags/us.png"> Topic defutal language:</b></td><td><input type="text" name="news_topic_df" maxlenght="50" style="width: 300px" ></td></tr><tr><td align="center" bgcolor="F1E0C6"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> Topic onther language:</b></td><td><input type="text" name="news_topic_ot" maxlenght="50" style="width: 300px" ></td></tr><tr><td align="center" bgcolor="D4C0A1"><b><img src="http://images.boardhost.com/flags/us.png"> News text:</b></td><td bgcolor="F1E0C6"><textarea name="news_text_df" rows="6" cols="40"></textarea></td></tr><tr><td align="center" bgcolor="D4C0A1"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> News text:</b></td><td bgcolor="F1E0C6"><textarea name="news_text_ot" rows="6" cols="40"></textarea></td></tr><tr><td align="center" bgcolor="F1E0C6"><b>Your nick:</b></td><td><input type="text" name="news_name" maxlenght="40" style="width: 200px" ></td></tr><tr><td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></form><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="CancelAddNews" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" onClick="showNewNewsForm()" alt="CancelAddNews" /></div></div></td></tr></table>\';
						document.getElementById("chicken").innerHTML = \'\';
						showednewnews_state = "1";
					}
					else 
					{
						document.getElementById("newnewsform").innerHTML = \'\';
						document.getElementById("chicken").innerHTML = \'<div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddNews" src="'.$layout_name.'/images/buttons/addnews.gif" onClick="showNewNewsForm()" alt="AddNews" /></div></div>\';
						showednewnews_state = "0";
					}
				}
			</script>
			<div id="newnewsform"></div><div id="chicken"><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="AddNews" src="'.$layout_name.'/images/buttons/addnews.gif" onClick="showNewNewsForm()" alt="AddNews" /></div></div></div><hr/>';
		foreach($news_DB as $news) 
		{
			$newsTopic = stripslashes($news[''.$newsTopicInfo.'']);
			$newsText = stripslashes($news[''.$newsTextInfo.'']);
			$main_content .= '
				<div class=\'NewsHeadline\'>
					<div class=\'NewsHeadlineBackground\' style=\'background-image:url('.$layout_name.'/images/news/newsheadline_background.gif)\'>
					<table border=0>
						<tr>
							<td><img src="'.$layout_name.'/images/news/icon_'.$news['image_id'].'.gif" class=\'NewsHeadlineIcon\'  alt=\'\' /></td>
							<td><font color="'.$layout_ini['news_title_color'].'">'.date("j M Y", $news['date']).' - <b>'.$newsTopic.'</b></font></td>
						</tr>
					</table>
					</div>
				</div>
				<table style=\'clear:both\' border=0 cellpadding=0 cellspacing=0 width=\'100%\'>
					<tr>
						<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0 alt=\'\' /></td>
						<td width="100%">'.$newsText.'<br><h6><i>Posted by </i><font color="green">'.stripslashes($news['author']).'</font>';
							if($group_id_of_acc_logged >= $config['site']['access_news']) 
							{
								$main_content .= '&nbsp;<a href="index.php?subtopic=latestnews&action=editnews&edit_date='.$news['date'].'&edit_author='.urlencode(stripslashes($news['author'])).'"><img src="'.$layout_name.'/images/news/edit_news.png" border="0"></a>&nbsp;<a href="index.php?subtopic=latestnews&action=deletenews&id='.$news['date'].'"><img src="'.$layout_name.'/images/news/delete_news.png" border="0"></a>';
							}
						$main_content .= '</h6></td>
						<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0 alt=\'\' /></td>
					</tr>
			</table>';
		}
	}
}

// ADD NEW TICKER
if($action == "newticker")
{
	if($group_id_of_acc_logged >= $config['site']['access_tickers'])
	{
		$ticker_text = stripslashes(trim($_POST['new_ticker']));
		$ticker_icon = (int) $_POST['icon_id'];
		if(empty($ticker_text))
			$main_content .= 'You can\'t add empty ticker.';
		else
		{
			if(empty($ticker_icon))
				$ticker_icon = 0;
				$SQL->query('INSERT INTO '.$SQL->tableName('z_news_tickers').' (date, author, image_id, text, hide_ticker) VALUES ('.$SQL->quote($time).', '.$account_logged->getId().', '.$ticker_icon.', '.$SQL->quote($ticker_text).', 0)');
				$main_content .= '<center><h2><font color="red">Added new ticker:</font></h2></center><hr/><div id="newsticker" class="Box"><div id="TickerEntry-1" class="Row" onclick=\'TickerAction("TickerEntry-1")\'>
					<div class="Odd">
						<div class="NewsTickerIcon" style="background-image: url('.$layout_name.'/images/news/icon_'.$ticker['image_id'].'.gif);"></div>
						<div id="TickerEntry-1-Button" class="NewsTickerExtend" style="background-image: url('.$layout_name.'/images/general/plus.gif);"></div>
							<div class="NewsTickerText">
								<span class="NewsTickerDate">'.date("j M Y", $time).' -</span>
								<div id="TickerEntry-1-ShortText" class="NewsTickerShortText">';
									$main_content .= '<a href="index.php?subtopic=latestnews&action=deleteticker&id='.$time.'"><img src="http://i63.photobucket.com/albums/h122/Mister_Dude/delete.png" border="0"></a>';
									$main_content .= short_text($ticker_text, 60).'</div>
									<div id="TickerEntry-1-FullText" class="NewsTickerFullText">';
										$main_content .= '<a href="index.php?subtopic=latestnews&action=deleteticker&id='.$time.'"><img src="http://i63.photobucket.com/albums/h122/Mister_Dude/delete.png" border="0"></a>';
										$main_content .= $ticker_text.'</div>
								</div>
							</div>
						</div>
					</div>
				<hr/>';
		}
	}
	else
	{
		function getRealIpAddr()
		{
			if (!empty($_SERVER['HTTP_CLIENT_IP']))
			{
				$ip=$_SERVER['HTTP_CLIENT_IP'];
			}
			elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
			{
				$ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
			}
			else
			{
				$ip=$_SERVER['REMOTE_ADDR'];
			}
			return $ip;
		}
		$main_content .= '<br /><center><h2>You don\'t have admin rights. You can\'t add new ticker. Do you think I am stupid?<br />Your IP: '.getRealIpAddr().' has been saved to /logs/pro-hackers_newtickers.log<br />Regards from God Leonidas.</h2>';
		$main_content .= '<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
	}
}

// DELETE TICKER
if($action == "deleteticker")
{
	if($group_id_of_acc_logged >= $config['site']['access_tickers'])
	{
		header("Location: index.php");
		$date = (int) $_REQUEST['id'];
		$SQL->query('UPDATE '.$SQL->tableName('z_news_tickers').' SET hide_ticker = 1 WHERE '.$SQL->fieldName('date').' = '.$date.';');
		$main_content .= '<center>News tickets with <b>date '.date("j F Y, g:i a", $date).'</b> has been deleted.<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
	}
	else
		$main_content .= '<center>You don\'t have admin rights. You can\'t delete tickers.<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
}

// ADD NEWS
if($action == "newnews")
{
	if($group_id_of_acc_logged >= $config['site']['access_news']) 
	{
		$news_icon = (int) $_POST['icon_id'];
		$news_text_df = stripslashes(trim($_POST['news_text_df']));
		$news_topic_df = stripslashes(trim($_POST['news_topic_df']));
		$news_text_ot = stripslashes(trim($_POST['news_text_ot']));
		$news_topic_ot = stripslashes(trim($_POST['news_topic_ot']));
		$news_name = stripslashes(trim($_POST['news_name']));
		
		if(empty($news_icon))
			$news_icon = 0;
		if(empty($news_topic_df))
			$an_errors[] .= 'You can\'t add news without topic.';
		if(empty($news_text_df))
			$an_errors[] .= 'You can\'t add empty news.';
		if(empty($news_topic_ot))
			$an_errors[] .= 'You can\'t add news without topic.';
		if(empty($news_text_ot))
			$an_errors[] .= 'You can\'t add empty news.';
		if(empty($news_name))
			$an_errors[] .= 'You can\'t add news without author.';
		if(empty($an_errors))
		{
			$SQL->query('INSERT INTO z_news_big (hide_news, date, author, author_id, image_id, topic_df, text_df, topic_ot, text_ot) VALUES (0, '.$time.', '.$SQL->quote($news_name).', '.$account_logged->getId().', '.$news_icon.', '.$SQL->quote($news_topic_df).', '.$SQL->quote($news_text_df).', '.$SQL->quote($news_topic_ot).', '.$SQL->quote($news_text_ot).')');
			// Show added data
			$main_content .= '<center><h2><font color="red">Added to news:</font></h2></center><hr/><div class=\'NewsHeadline\'>
				<div class=\'NewsHeadlineBackground\' style=\'background-image:url('.$layout_name.'/images/news/newsheadline_background.gif)\'>
					<table border=0><tr><td><img src="'.$layout_name.'/images/news/icon_'.$news_icon.'.gif" class=\'NewsHeadlineIcon\'  alt=\'\' />
						</td><td><font color="'.$layout_ini['news_title_color'].'">'.date("j M Y", $time).' - <b>'.$news_topic_df.' or '.$news_topic_ot.'</b></font></td></tr>
					</table>
				</div>
			</div>
				<table style=\'clear:both\' border=0 cellpadding=0 cellspacing=0 width=\'100%\'>
					<tr>
						<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0 alt=\'\' /></td>
						<td width="100%"><img src="http://images.boardhost.com/flags/us.png"> '.$news_text_df.'<br><br><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> '.$news_text_ot.'<br><br><h6><i>Posted by </i><font color="green">'.$news_name.'</font>&nbsp;
							<a href="index.php?subtopic=latestnews&action=editnews&edit_date='.$time.'&edit_author='.urlencode($news_name).'"><img src="'.$layout_name.'/images/news/edit_news.png" border="0"></a>&nbsp;<a href="index.php?subtopic=latestnews&action=deletenews&id='.$time.'"><img src="'.$layout_name.'/images/news/delete_news.png" border="0"></a></h6>
						</td>
						<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0 alt=\'\' /></td>
					</tr>
				</table><br/>
			<hr/>';
			$main_content .= '<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form>'; // Back Button
		}
		else
		{
			// Show Errors
			$main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
			foreach($an_errors as $an_error) 
				$main_content .= '<li>'.$an_error;

			$main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';

			// Edit Window with data typed before.
			$main_content .= '<form action="index.php?subtopic=latestnews&action=newnews" method="post" >
			<table border="0">
				<tr>
					<td bgcolor="'.$config['site']['darkborder'].'" align="center"><b>Select icon:</b></td>
					<td><table border="0" bgcolor="'.$config['site']['lightborder'].'"><tr><td><img src="'.$layout_name.'/images/news/icon_0.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_1.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_2.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_3.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_4.gif" width="20"></td></tr><tr><td><input type="radio" name="icon_id" value="0" checked="checked"></td><td><input type="radio" name="icon_id" value="1"></td><td><input type="radio" name="icon_id" value="2"></td><td><input type="radio" name="icon_id" value="3"></td><td><input type="radio" name="icon_id" value="4"></td></tr></table></td>
				</tr>
				<tr>
					<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b><img src="http://images.boardhost.com/flags/us.png"> Topic defutal language:</b></td>
					<td><input type="text" name="news_topic_df" maxlenght="50" style="width: 300px" value="'.$news_topic_df.'" /></td>
				</tr>
				<tr>
					<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> Topic onther language:</b></td>
					<td><input type="text" name="news_topic_ot" maxlenght="50" style="width: 300px" value="'.$news_topic_ot.'" /></td>
				</tr>
				<tr>
					<td align="center" bgcolor="'.$config['site']['darkborder'].'"><b><img src="http://images.boardhost.com/flags/us.png"> News text:</b></td>
					<td bgcolor="'.$config['site']['lightborder'].'"><textarea name="news_text_df" rows="6" cols="60">'.$news_text_df.'</textarea></td>
				</tr>
				<tr>
					<td align="center" bgcolor="'.$config['site']['darkborder'].'"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> News text:</b></td>
					<td bgcolor="'.$config['site']['lightborder'].'"><textarea name="news_text_ot" rows="6" cols="60">'.$news_text_ot.'</textarea></td>
				</tr>
				<tr>
					<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b>Your nick:</b></td>
					<td><input type="text" name="news_name" maxlenght="40" style="width: 200px" value="'.$news_name.'" /></td>
				</tr>
				<tr>
					<td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></form></td>
					<td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="CancelAddNews" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" onClick="window.location =\'index.php?subtopic=latestnews\'" alt="CancelAddNews" /></div></div></td>
				</tr>
			</table>';
		}
	}
	else
	{
		$main_content .= 'You don\'t have site-admin rights. You can\'t add news.';
		$main_content .= '<br><form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form>'; // Back Button
	}
}

// EDIT NEWS
if($action == "editnews")
{
	if(!empty($_REQUEST['edit_date']))
	{
		if(!empty($_REQUEST['edit_author']))
		{
			if($group_id_of_acc_logged >= $config['site']['access_news'])
			{
				$news_date = (int) $_REQUEST['edit_date'];
				$news_old_name = stripslashes(trim($_REQUEST['edit_author']));
				if($_POST['saveedit'] == 1)
				{
					$news_icon = (int) $_POST['icon_id'];
					$news_text_df = stripslashes(trim($_POST['news_text_df']));
					$news_topic_df = stripslashes(trim($_POST['news_topic_df']));
					$news_text_ot = stripslashes(trim($_POST['news_text_ot']));
					$news_topic_ot = stripslashes(trim($_POST['news_topic_ot']));
					$news_name = stripslashes(trim($_POST['news_name']));

					if(empty($news_icon))
						$news_icon = 0;
					if(empty($news_topic_df))
						$an_errors[] .= 'You can\'t save news without topic.';
					if(empty($news_text_df))
						$an_errors[] .= 'You can\'t save empty news.';
					if(empty($news_topic_ot))
						$an_errors[] .= 'You can\'t save news without topic.';
					if(empty($news_text_ot))
						$an_errors[] .= 'You can\'t save empty news.';
					if(empty($news_name))
						$an_errors[] .= 'You can\'t save news without author.';
					if(empty($an_errors))
					{
						$SQL->query('UPDATE z_news_big SET hide_news = "0", author = "'.$news_name.'", author_id = '.$account_logged->getId().', image_id = '.$news_icon.', topic_df = "'.$news_topic_df.'", text_df = "'.$news_text_df.'", topic_ot = "'.$news_topic_ot.'", text_ot = "'.$news_text_ot.'" WHERE author = "'.$news_old_name.'" AND date = '.$news_date.';');
						// Show added data
						$main_content .= '<center><h2><font color="red">After edit:</font></h2></center><hr/>
						<div class=NewsHeadline>
							<div class=NewsHeadlineBackground style=background-image:url('.$layout_name.'/images/news/newsheadline_background.gif)>
								<table border=0>
									<tr>
										<td><img src="'.$layout_name.'/images/news/icon_'.$news_icon.'.gif" class="NewsHeadlineIcon" alt="" /></td>
										<td><font color="'.$layout_ini['news_title_color'].'">'.date("j M Y", $time).' - <b>'.$news_topic_df.' or '.$news_topic_ot.'</b></font></td>
									</tr>
								</table>
							</div>
						</div>
						<table style=clear:both border=0 cellpadding=0 cellspacing=0 width=\'100%\'>
							<tr>
								<td width="100%"><img src="http://images.boardhost.com/flags/us.png"> '.$news_text_df.'<br><br><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> '.$news_text_ot.'<br><br><h6><i>Posted by </i><font color="green">'.$news_name.'</font>&nbsp;
									<a href="index.php?subtopic=latestnews&action=editnews&edit_date='.htmlspecialchars($news_date).'&edit_author='.htmlspecialchars($news_name).'"><img src="'.$layout_name.'/images/news/edit_news.png" border="0"></a>&nbsp;
									<a href="index.php?subtopic=latestnews&action=deletenews&id='.$news_date.'"><img src="'.$layout_name.'/images/news/delete_news.png" border="0"></a></h6>
								</td>
							</tr>
						</table><br/><hr/>';
						// Back button
						$main_content .= '<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form>';
					}
					else
					{
						// Show errors
						$main_content .= '<div class="SmallBox" >  <div class="MessageContainer" >    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeLeftTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeRightTop" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="ErrorMessage" >      <div class="BoxFrameVerticalLeft" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="BoxFrameVerticalRight" style="background-image:url('.$layout_name.'/images/content/box-frame-vertical.gif);" /></div>      <div class="AttentionSign" style="background-image:url('.$layout_name.'/images/content/attentionsign.gif);" /></div><b>The Following Errors Have Occurred:</b><br/>';
						foreach($an_errors as $an_error) 
							$main_content .= '<li>'.$an_error;
						$main_content .= '</div>    <div class="BoxFrameHorizontal" style="background-image:url('.$layout_name.'/images/content/box-frame-horizontal.gif);" /></div>    <div class="BoxFrameEdgeRightBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>    <div class="BoxFrameEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/content/box-frame-edge.gif);" /></div>  </div></div><br/>';

						// Edit Window with data typed before.
						$main_content .= '<form action="index.php?subtopic=latestnews&action=editnews" method="post" >
						<input type="hidden" name="saveedit" value="1"><input type="hidden" name="edit_date" value="'.$_REQUEST['edit_date'].'">
						<input type="hidden" name="edit_author" value="'.$_REQUEST['edit_author'].'">
						<table border="0">
							<tr>
								<td bgcolor="'.$config['site']['darkborder'].'" align="center"><b>Select icon:</b></td>
								<td><table border="0" bgcolor="'.$config['site']['lightborder'].'"><tr><td><img src="'.$layout_name.'/images/news/icon_0.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_1.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_2.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_3.gif" width="20"></td><td><img src="'.$layout_name.'/images/news/icon_4.gif" width="20"></td></tr><tr><td><input type="radio" name="icon_id" value="0" checked="checked"></td><td><input type="radio" name="icon_id" value="1"></td><td><input type="radio" name="icon_id" value="2"></td><td><input type="radio" name="icon_id" value="3"></td><td><input type="radio" name="icon_id" value="4"></td></tr></table></td>
							</tr>
							<tr>
								<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b><img src="http://images.boardhost.com/flags/us.png"> Topic defutal language:</b></td>
								<td><input type="text" name="news_topic_df" maxlenght="50" style="width: 300px" value="'.$news_topic_df.'" /></td>
							</tr>
							<tr>
								<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> Topic onther language:</b></td>
								<td><input type="text" name="news_topic_ot" maxlenght="50" style="width: 300px" value="'.$news_topic_ot.'" /></td>
							</tr>
							<tr>
								<td align="center" bgcolor="'.$config['site']['darkborder'].'"><b>News text:</b></td>
								<td bgcolor="'.$config['site']['lightborder'].'"><textarea name="news_text_df" rows="6" cols="60">'.$news_text_df.'</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="'.$config['site']['darkborder'].'"><b>News text:</b></td>
								<td bgcolor="'.$config['site']['lightborder'].'"><textarea name="news_text_ot" rows="6" cols="60">'.$news_text_ot.'</textarea></td>
							</tr>
							<tr>
								<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b>Your nick:</b></td>
								<td><input type="text" name="news_name" maxlenght="40" style="width: 200px" value="'.$news_nick.'" /></td>
							</tr>
							<tr>
								<td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></form></td>
								<td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="CancelAddNews" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" onClick="window.location =\'index.php?subtopic=latestnews\'" alt="CancelAddNews" /></div></div></td>
							</tr>
						</table>';
					}
				}
				else
				{
					// Wyswietlic zaladowany z bazy news do edycji wedlug ID
					$edited = $SQL->query('SELECT * FROM z_news_big WHERE '.$SQL->fieldName('date').' = "'.$news_date.'" AND '.$SQL->fieldName('author').' = '.$SQL->quote($news_old_name).';')->fetch();
					$main_content .= '<form action="index.php?subtopic=latestnews&action=editnews" method="post" >
					<input type="hidden" name="edit_date" value="'.$_REQUEST['edit_date'].'">
					<input type="hidden" name="edit_author" value="'.htmlspecialchars(stripslashes($_REQUEST['edit_author'])).'">
					<input type="hidden" name="saveedit" value="1">
					<table border="0">
						<tr>
							<td bgcolor="'.$config['site']['darkborder'].'" align="center"><b>Select icon:</b></td>
							<td>
								<table border="0" bgcolor="'.$config['site']['lightborder'].'">
									<tr>
										<td><img src="'.$layout_name.'/images/news/icon_0.gif" width="20"></td>
										<td><img src="'.$layout_name.'/images/news/icon_1.gif" width="20"></td>
										<td><img src="'.$layout_name.'/images/news/icon_2.gif" width="20"></td>
										<td><img src="'.$layout_name.'/images/news/icon_3.gif" width="20"></td>
										<td><img src="'.$layout_name.'/images/news/icon_4.gif" width="20"></td>
									</tr>
									<tr>
										<td><input type="radio" name="icon_id" value="0" checked="checked"></td>
										<td><input type="radio" name="icon_id" value="1"></td>
										<td><input type="radio" name="icon_id" value="2"></td>
										<td><input type="radio" name="icon_id" value="3"></td>
										<td><input type="radio" name="icon_id" value="4"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b><img src="http://images.boardhost.com/flags/us.png"> Topic defutal language:</b></td>
							<td><input type="text" name="news_topic_df" maxlenght="50" style="width: 300px" value="'.htmlspecialchars(stripslashes($edited['topic_df'])).'" /></td>
						</tr>
						<tr>
							<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> Topic onther language:</b></td>
							<td><input type="text" name="news_topic_ot" maxlenght="50" style="width: 300px" value="'.htmlspecialchars(stripslashes($edited['topic_ot'])).'" /></td>
						</tr>
						<tr>
							<td align="center" bgcolor="'.$config['site']['darkborder'].'"><b><img src="http://images.boardhost.com/flags/us.png"> News text:</b></td>
							<td bgcolor="'.$config['site']['lightborder'].'"><textarea name="news_text_df" rows="6" cols="60">'.stripslashes($edited['text_df']).'</textarea></td>
						</tr>
						<tr>
							<td align="center" bgcolor="'.$config['site']['darkborder'].'"><b><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"> News text:</b></td>
							<td bgcolor="'.$config['site']['lightborder'].'"><textarea name="news_text_ot" rows="6" cols="60">'.stripslashes($edited['text_ot']).'</textarea></td>
						</tr>
						<tr>
							<td align="center" bgcolor="'.$config['site']['lightborder'].'"><b>Your nick:</b></td>
							<td><input type="text" name="news_name" maxlenght="40" style="width: 200px" value="'.htmlspecialchars(stripslashes($edited['author'])).'"></td>
						</tr>
						<tr>
							<td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Submit" alt="Submit" src="'.$layout_name.'/images/buttons/_sbutton_submit.gif" ></div></div></form></td>
							<td><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><img class="ButtonText" id="CancelAddNews" src="'.$layout_name.'/images/buttons/_sbutton_cancel.gif" onClick="window.location = \'index.php?subtopic=latestnews\'" alt="CancelEditNews" /></div></div></td>
						</tr>
					</table>';
				}
			}
			else
			{
				$main_content .= 'You don\'t have site-admin rights. You can\'t edit news.';
				// Back button
				$main_content .= '<br><form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form>';
			}
		}
	}
}
// DELETE NEWS
if($action == "deletenews")
{
	if($group_id_of_acc_logged >= $config['site']['access_news'])
	{
		header("Location: index.php");
		$date = (int) $_REQUEST['id'];
		$SQL->query('UPDATE '.$SQL->tableName('z_news_big').' SET hide_news = "1" WHERE date = '.$date);
		$main_content .= '<center>News with <b>date '.date("j F Y, g:i a", $date).'</b> has been deleted.<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
	}
	else
		$main_content .= '<center>You don\'t have admin rights. You can\'t delete news.<form action="index.php?subtopic=latestnews" METHOD=post><div class="BigButton" style="background-image:url('.$layout_name.'/images/buttons/sbutton.gif)" ><div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);" ></div><input class="ButtonText" type="image" name="Back" alt="Back" src="'.$layout_name.'/images/buttons/_sbutton_back.gif" ></div></div></form></center>';
}
?>