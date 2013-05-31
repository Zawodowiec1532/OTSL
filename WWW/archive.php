<?php
$news_DB = $SQL->query('SELECT * FROM '.$SQL->tableName('z_news_big').' WHERE hide_news != 1 ORDER BY date DESC');
$langConfig = $config['site']['chooseLang'];
if($lang == 'en')
{
	$newsLanguageSystem = 'topic_df, text_df';
	$newsTopicInfo = 'topic_df';
	$newsTextInfo = 'text_df';
}
elseif($lang == $langConfig)
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
if(empty($_REQUEST['id']))
{
	if($config['site']['langSystem'])
		$main_content .= '<table style="border: 1px solid #CFB181; border-spacing: 1px" width=100%>
				<tr style="vertical-align: middle">
					<td><b>Set news language:</b> 
						<a href="index.php?subtopic=archive&lang=en"><img src="http://images.boardhost.com/flags/us.png"></a>
						<a href="index.php?subtopic=archive&lang='.$config['site']['chooseLang'].'"><img src="http://images.boardhost.com/flags/'.$config['site']['chooseLang'].'.png"></a> 
					</td>
				</tr>
			</table><br>';
	$main_content .= '<table border=0 cellspacing=1 cellpadding=4 width=100%>
	<tr bgcolor="'.$config['site']['vdarkborder'].'">
	<TD COLSPAN=3 CLASS=white><B>Archive</B></TD></TR>';
	foreach($news_DB as $news)
	{
		if(is_int($number_of_rows / 2)) { $bgcolor = $config['site']['darkborder']; } else { $bgcolor = $config['site']['lightborder']; } $number_of_rows++;
			$main_content .= '<tr BGCOLOR='.$bgcolor.'><td width=4%><center><img src="'.$layout_name.'/images/news/icon_'.$news['image_id'].'.gif"></center></td><td>'.date("j.n.Y", $news['date']).'</td><td><b><a href="index.php?subtopic=archive&id='.$news['date'].'">'.stripslashes($news[''.$newsTopicInfo.'']).'</a></b></td></tr>';
	}
	$main_content .= '</table>';
	$showed=true;
}
foreach($news_DB as $news)
	if($_REQUEST['id'] == $news['date'])
	{
		$newsText = stripslashes($news[''.$newsTextInfo.'']);
		$main_content .= '
		<div class="NewsHeadline">
		<div class="NewsHeadlineBackground" style="background-image:url('.$layout_name.'/images/news/newsheadline_background.gif)">
		<table border=0><tr><td><img src="'.$layout_name.'/images/news/icon_'.$news['image_id'].'.gif" class="NewsHeadlineIcon"/>
		</td><td><font color="'.$layout_ini['news_title_color'].'">'.date("j.n.Y", $news['date']).' - <b>'.stripslashes($news[''.$newsTopicInfo.'']).'</b></font></td></tr></table>
		</div>
		</div>
		<table style="clear:both" border=0 cellpadding=0 cellspacing=0 width=\'100%\'>
			<tr>
				<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0/></td>
				<td width="100%"><font size=2>'.$newsText.'<br></font><br></td>
				<td><img src="'.$layout_name.'/images/global/general/blank.gif" width=10 height=1 border=0/></td>
			</tr>
		</table>';
		$main_content .= '<br><a href="index.php?subtopic=archive"><font size="2"><b>Go to Archive</b></font></a>';
		$showed=true;
	}
if(!$showed)
{
	$main_content .= 'This news doeasn\'t exist.<br>';
	$main_content .= '<br /><a href="index.php?subtopic=archive"><font size="2"><b>Go to Archive</b></font></a>';
}
?>