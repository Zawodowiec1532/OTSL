<?PHP
$config['site']['access_admin_panel'] = 6;
$config['site']['worlds'] = array(0 => 'OTSL by Leon Zawodowiec');

$config['site']['access_tickers'] = 5;
$config['site']['access_news'] = 6;
$config['site']['langSystem'] = 1;

$config['site']['server_path'] = "C:/Users/ZawodowieC/Desktop/OTSL/OTSL/";

$config['site']['news_ticks_limit'] = 5;
$config['site']['news_big_limit'] = 10;
$config['site']['chooseLang'] = 'pl';

$config['site']['verify_code'] = 1;
$config['site']['one_email'] = 1;
$config['site']['choose_countr'] = 1;
$config['site']['referrer'] = 0;
$config['site']['newaccount_premdays'] = 7;

$config['site']['publickey'] = "6LeUNscSAAAAALQiZkhoetjNfiv_k8jxLpWUMDL7";
$config['site']['privkey'] = "6LeUNscSAAAAAKjyPV3TEIzOwc0WqKhX2T4cRRwN";

$config['site']['send_register_email'] = 0;
$config['site']['create_account_verify_mail'] = 0;
$config['site']['send_mail_when_change_password'] = 1;
$config['site']['send_mail_when_generate_reckey'] = 1;

$config['site']['send_emails'] = 0;
$config['site']['mail_address'] = "";
$config['site']['smtp_enabled'] = "yes";
$config['site']['smtp_host'] = "smtp.gmail.com";
$config['site']['smtp_port'] = 465;
$config['site']['smtp_auth'] = "yes";
$config['site']['smtp_user'] = "";
$config['site']['smtp_pass'] = "";
$config['site']['email_lai_sec_interval'] = 300;

$config['site']['max_players_per_account'] = 5;
$config['site']['email_days_to_change'] = 14;

$config['site']['generate_new_reckey'] = 1;
$config['site']['generate_new_reckey_price'] = 200;

$config['site']['newchar_vocations'][0] = array(0 => 'Rook Sample');
$config['site']['newchar_towns'][0] = array(6);

$config['site']['showStatistic'] = 1;
$config['site']['showAdvenceStatistic'] = 1;
$config['site']['showQuests'] = 1;
$config['site']['showVipList'] = 1;
$config['site']['showVictims'] = 1;

$config['site']['limitDeath'] = 10;
$config['site']['limitVictims'] = 10;

$config['site']['guild_need_level'] = 150;
$config['site']['guild_need_pacc'] = 1;
$config['site']['guild_image_size_kb'] = 50;
$config['site']['guild_description_chars_limit'] = 400;
$config['site']['guild_description_lines_limit'] = 10;
$config['site']['guild_motd_chars_limit'] = 255;

$config['site']['showStat'] = 1;
$config['site']['showAdvenceStat'] = 1;

$config['site']['download_page'] = 1;
$config['site']['serverinfo_page'] = 1;
$config['site']['gallery_page'] = 0;
$config['site']['credits_page'] = 1;
$config['site']['forum_link'] = "";

$config['site']['quests'] = array('Desert Quest' => 1740, 'Gazbran Room' => 5500, 'Annihilator' => 5000, 'Demon Helmet' => 2645, 'Pits of Inferno' => 5550); // list of quests, 'questname' => storage-id,
$config['site']['show_flag'] = 1;
$config['site']['showMoreInfo'] = 1;
$config['site']['show_creationdate'] = 1;
$config['site']['players_group_id_block'] = 2;

$config['site']['limit_show_death'] = 15;

$vocation_name[0][0] = array(0 => 'None', 1 => 'Sorcerer', 2 => 'Druid', 3 => 'Paladin', 4 => 'Knight'); 
$vocation_name[0][1] = array(1 => 'Master Sorcerer', 2 => 'Elder Druid', 3 => 'Royal Paladin', 4 => 'Elite Knight'); 

$towns_list[0] = array(6 => 'Rookgaard');
$vocationConstantMana[0] = array(0 => 4.0, 1 => 1.1, 2 => 1.1, 3 => 1.4, 4 => 3.0);

$config['site']['shop_system'] = 1;

$config['site']['paypal_active'] = 0;
$config['site']['zaypay_active'] = 0;
$config['site']['dotpay_active'] = 0;
$config['site']['daopay_active'] = 0;
$config['site']['homepayActive'] = 1;
$config['site']['paygol_active'] = 1;

$config['site']['layout'] = "tibiacom";

$config['archez']['secret'] = array(2, 6, 7, 13, 16, 17, 18, 23, 24, 26, 29, 30, 31, 32, 34, 35, 37, 43, 44, 46, 51, 53, 54, 62, 63, 65, 66, 68, 73, 80, 81, 82, 83); 
$config['archez']['achievements'] = array( 
    1 => 'Allow Cookies?', 
    2 => 'Backpack Tourist', 
    3 => 'Bearhugger', 
    4 => 'Bone Brother', 
    5 => 'Chorister', 
    6 => 'Fountain of Life', 
    7 => 'Here, Fishy Fishy!', 
    8 => 'Honorary Barbarian', 
    9 => 'Huntsman', 
    10 => 'Just in Time', 
    11 => 'Matchmaker', 
    12 => 'Nightmare Knight', 
    13 => 'Party Animal', 
    14 => 'Secret Agent', 
    15 => 'Talented Dancer', 
    16 => 'Territorial', 
    17 => 'Worm Whacker', 
    18 => 'Allowance Collector', 
    19 => 'Amateur Actor', 
    20 => 'Animal Activist', 
    21 => 'Beach Tamer', 
    22 => 'Blessed!', 
    23 => 'Exquisite Taste', 
    24 => 'Fireworks in the Sky', 
    25 => 'Greenhorn', 
    26 => 'Jinx', 
    27 => 'Lucid Dreamer', 
    28 => 'Mathemagician', 
    29 => 'Masquerader', 
    30 => 'Ministrel', 
    31 => 'Poet Laureate', 
    32 => 'Quick as a Turtle', 
    33 => 'Sea Scout', 
    34 => 'Steampunked', 
    35 => 'Superstitios', 
    36 => 'The Milkman', 
    37 => 'Turncoat', 
    38 => 'Vive la Resistance', 
    39 => 'Archpostman', 
    40 => 'Clay Fighter', 
    41 => 'Efreet Ally', 
    42 => 'Ghostwisperer', 
    43 => 'His True Face', 
    44 => 'Ice Sculptor', 
    45 => 'King Tibanus Fan', 
    46 => 'Marblelous', 
    47 => 'Marid Ally', 
    48 => 'Passionate Kisser', 
    49 => 'Perfect Fool', 
    50 => 'Recognised Trader', 
    51 => 'Rockstar', 
    52 => 'Scrapper', 
    53 => 'Vanity', 
    54 => 'Wayfarer', 
    55 => 'Champion of Chazorai', 
    56 => 'Culinary Master', 
    57 => 'Explorer', 
    58 => 'Follower of Azerus', 
    59 => 'Follower of Palimuth', 
    60 => 'Friend of the Apes', 
    61 => 'Golem in the Gears', 
    62 => 'High-Flyer', 
    63 => 'Interior Decorator', 
    64 => 'Master Thief', 
    65 => 'Polisher', 
    66 => 'Potion Addict', 
    67 => 'Ruthless', 
    68 => 'Ship\'s Kobold', 
    69 => 'Top AVIN Agent', 
    70 => 'Top CGB Agent', 
    71 => 'Top TBI Agent', 
    72 => 'Annihilator', 
    73 => 'Castlemania', 
    74 => 'Elite Hunter', 
    75 => 'High Inquisitor', 
    76 => 'Jamjam', 
    77 => 'Lord of the Elements', 
    78 => 'Warlord of Svargrond', 
    79 => 'Master of the Nexus', 
    80 => 'Razing!', 
    81 => 'Dread Lord', 
    82 => 'Lord Protector', 
    83 => 'Herbicide' 
);
?>
