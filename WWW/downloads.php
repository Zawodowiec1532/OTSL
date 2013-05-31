<?PHP
$content = file_get_contents("downloads.htm");
if($content != FALSE)
	$main_content .= $content;
else
	$main_content .= 'Can not load file <b>downloads.htm</b> or file is empty.';
?>