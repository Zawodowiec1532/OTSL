<?PHP
header("Content-type: image/png");
include('config-and-functions.php');
function drawBorder(&$img, &$color, $thickness = 1)
{
    $x1 = 0;
    $y1 = 0;
    $x2 = ImageSX($img) - 1;
    $y2 = ImageSY($img) - 1;

    for($i = 0; $i < $thickness; $i++)
    {
        ImageRectangle($img, $x1++, $y1++, $x2--, $y2--, $color_black);
    }
}
if($_REQUEST['type'] == 'player')
{
	$name = stripslashes(ucwords(strtolower(trim($_REQUEST['name']))));
	$player = $ots->createObject('Player');
	$player->find($name);
	if($player->isLoaded())
	{
		if($player->isOnline())
		{
			$pos = $SQL->query('SELECT posx, posy, posz FROM players WHERE name = "'.$name.'" LIMIT 1')->fetch();
			$x = $pos['posx'];
			$y = $pos['posy'];
			$z = $pos['posz'];
			$image = imagecreatefrompng("images/maps/".$z.".png");
			list($width, $height) = getimagesize("images/maps/".$z.".png");
			$new_width = 200;
			$new_height= 200;
			$color_white = ImageColorAllocate($image, 255, 255, 255);
			$color_black = ImageColorAllocate($image, 0, 0, 0); 
			ImageFilledRectangle($image, $x-30, $y-25, $x-28, $y-23, $color_black);
			ImageArc($image, $x-29, $y-24, 5, 5, 0, 0, $color_white);
			$image_new = imagecreatetruecolor($new_width, $new_height); 
			imagecopyresized($image_new, $image, 0, 0, $x-60, $y-60, $new_width, $new_height,70, 70); 
			drawBorder($image_new, $color_black, 3); 
			imagepng($image_new);
			imagedestroy($image_new);
		}
		else
		{
			$image = imagecreatefrompng("images/maps/charoff.png");
			imagepng($image);
			imagedestroy($image);
		}
	}
	else
	{
		$image = imagecreatefrompng("images/maps/badchar.png");
		imagepng($image);
		imagedestroy($image);
	}
}
if($_REQUEST['type'] == 'house')
{
	$x = $_GET['x'];
	$y = $_GET['y'];
	$z = $_GET['z'];
	$image = imagecreatefrompng("images/maps/".$z.".png");
	list($width, $height) = getimagesize("images/maps/".$z.".png");
	$new_width = 200;
	$new_height= 200;
	$color_white = ImageColorAllocate($image, 255, 255, 255);
	$color_black = ImageColorAllocate($image, 0, 0, 0); 
	ImageFilledRectangle($image, $x-30, $y-25, $x-28, $y-23, $color_black);
	ImageArc($image, $x-29, $y-24, 5, 5, 0, 0, $color_white);
	$image_new = imagecreatetruecolor($new_width, $new_height); 
	imagecopyresized($image_new, $image, 0, 0, $x-60, $y-60, $new_width, $new_height,70, 70); 
	drawBorder($image_new, $color_black, 3); 
	imagepng($image_new);
	imagedestroy($image_new);
}
?>