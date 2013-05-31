   <?PHP
$auctions = $SQL->query('SELECT `auction_system`.`player`, `auction_system`.`id`, `auction_system`.`item_name`, `auction_system`.`item_id`, `auction_system`.`count`, `auction_system`.`cost`, `auction_system`.`date`, `players`.`name` FROM `auction_system`, `players` WHERE `players`.`id` = `auction_system`.`player` ORDER BY `auction_system`.`id` DESC')->fetchAll();
$box = $SQL->query('SELECT `auction_system`.`player`, `auction_system`.`id`, `auction_system`.`item_name`, `auction_system`.`item_id`, `auction_system`.`count`, `auction_system`.`cost`, `auction_system`.`date`, `players`.`name` FROM `auction_system`, `players` WHERE `auction_system`.`id` = (SELECT MAX(id) FROM auction_system) ')->fetch();
$cost2 = round($box['cost']/10000, 2);


$players = 0;
       
    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b>Instruction<b></TD></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD><center><h2>Commands</h2><b>!offer add, itemName, itemPrice, itemCount</b><br /><small>example: !offer add, plate armor, 500, 1</small><br /><br /><B>!offer buy, AuctionID</b><br /><small>example: !offer buy, 1943</small><br /><br /><b>!offer remove, AuctionID</b><br /><small>example: !offer remove, 1943</small><br /><br /><b>!offer withdraw</b><br /><small>Use this command to get money for sold items.</small></center></TR></TD></TABLE><br />';
    if(empty($auctions))
    {
        $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b>Auctions</b></td></TR><TR BGCOLOR='.$config['site']['darkborder'].'><TD>Currently is no one active Auction.</TD></TR></TABLE>';
        $main_content .= '<br /><p align="right"><small>System created by <a href="http://otland.net/members/vDk/">vDk</a>.</small></p>';
    }
    else
    {
    foreach($auctions as $auction) {
        $players++;
            if(is_int($players / 2))
                $bgcolor = $config['site']['lightborder'];
            else
                $bgcolor = $config['site']['darkborder'];
        $cost = round($auction['cost']/1000, 2);
        $content .= '<TR BGCOLOR='.$bgcolor.'><TD><center>'.$auction['id'].'</center></TD><TD><center><img src="/images/items/'.$auction['item_id'].'.gif"/></center></TD><TD><center>'.$auction['item_name'].'</center></TD><TD><center><a href="?subtopic=characters&name='.urlencode($auction['name']).'">'.$auction['name'].'</a></center></TD><TD><center>'.$auction['count'].'</center></TD><TD><center>'.$cost.'k<br /><small>'.$auction['cost'].'gp</small></center></TD><TD><center>!offer buy, '.$auction['id'].'</center></TR>';
    }
    
    $main_content .= '<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%><TR BGCOLOR="'.$config['site']['vdarkborder'].'"><TD CLASS=white><b><center>ID</center></b></TD><TD class="white"><b><center>#</center></b></TD><TD class="white"><b><center>Item Name</center></b></TD><TD class="white"><b><center>Player</center></b></TD><TD class="white"><b><center>Count</center></b></TD><TD class="white"><b><center>Cost</center></b></td><TD class="white"><b><center>Buy</center></b></td></TR>'.$content.'</TABLE>';
    $main_content .= '<br /><p align="right"><small>System created by <a href="http://otland.net/members/vDk/">vDk</a>.</small></p>';
}
    ?> 