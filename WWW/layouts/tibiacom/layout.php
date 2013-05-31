<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><?PHP echo $title ?></title>
		<meta name="google-site-verification" content="9garbcAsVSPiZnkl-_dBMijUE3Z1sBwDBZlgi_PF0uY" />
		<meta name="description" content="Tibia is a free massive multiplayer online role playing game (MMORPG). The best OTS" />
		<meta name="author" content="Leonidas" />
		<meta http-equiv="content-language" content="en" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
		<meta name="keywords" content="free online game, free multiplayer game, ots, open tibia server, tibia, troja, trojaots, tibia net pl, tibia tv, torg, tnet, otservlist, otlist, ots pvp" />
		<link rel="shortcut icon" href="<?PHP echo $layout_name; ?>/images/server.ico" type="image/x-icon">
		<link rel="icon" href="<?PHP echo $layout_name; ?>/images/server.ico" type="image/x-icon">
		<?PHP echo $layout_header; ?>
		<link href="<?PHP echo $layout_name; ?>/basic.css" rel="stylesheet" type="text/css">
		<script type='text/javascript'> var IMAGES=0; IMAGES='http://static.tibia.com/images'; var g_FormField=''; var LINK_ACCOUNT=0; LINK_ACCOUNT='';</script>
		<SCRIPT TYPE="text/javascript">
			<!-- // Framekiller
			setTimeout ("changePage()", 6000);
			function changePage()
			{
				if (parent.frames.length > 2) 
				{
					if (browserTyp == "ie") {
						parent.location=document.location;
					} else {
						self.top.location=document.location;
					}
				}
			}
		// -->
		</SCRIPT>
		<script type="text/javascript">
			state = new Array("0", "0", "0", "0", "0");
			function TickerAction(id) 
			{
				var line = id.substr(12, 1);
				if(state[line] == "0") 
				{
					state[line] = "1";
					OpenNews(id);
				} 
				else 
				{
					state[line] = "0";
					CloseNews(id);
				}
			}

			function OpenNews(id)
			{
				var div = document.getElementById(id)
				var idShort = id.concat("-ShortText");
				var idMore = id.concat("-FullText");
				var idButton = id.concat("-Button");
				document.getElementById(idShort).style.display = "none";
				document.getElementById(idMore).style.display = "block";
				document.getElementById(idButton).style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/general/minus.gif')";
			}

			function CloseNews(id)
			{
				var div = document.getElementById(id)
				var idShort = id.concat("-ShortText");
				var idMore = id.concat("-FullText");
				var idButton = id.concat("-Button");
				document.getElementById(idShort).style.display = "block";
				document.getElementById(idMore).style.display = "none";
				document.getElementById(idButton).style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/general/minus.gif')";
			}

			function InitializePage() 
			{
				LoadLoginBox();
				LoadMenu();
			}


			// initialisation of the loginbox status by the value of the variable 'loginStatus' which is provided to the HTML-document by PHP in the file 'header.inc'
			function LoadLoginBox()
			{
				if(loginStatus == "false") 
				{
					document.getElementById('LoginstatusText_1').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-you-are-not-logged-in.gif')";
					document.getElementById('ButtonText').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/buttons/_sbutton_login.gif')";
					document.getElementById('LoginstatusText_2').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-create-account.gif')";
					document.getElementById('LoginstatusText_2_1').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-create-account.gif')";
					document.getElementById('LoginstatusText_2_2').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-create-account-over.gif')";
				}
				else 
				{
					document.getElementById('LoginstatusText_1').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-welcome.gif')";
					document.getElementById('ButtonText').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/buttons/_sbutton_myaccount.gif')";
					document.getElementById('LoginstatusText_2').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-logout.gif')";
					document.getElementById('LoginstatusText_2_1').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-logout.gif')";
					document.getElementById('LoginstatusText_2_2').style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-logout-over.gif')";
				}
			}

			// mouse-over and click events of the loginbox
			function MouseOverLoginBoxText(source)
			{
				source.lastChild.style.visibility = "visible";
				source.firstChild.style.visibility = "hidden";
			}
			function MouseOutLoginBoxText(source)
			{
				source.firstChild.style.visibility = "visible";
				source.lastChild.style.visibility = "hidden";
			}
			function LoginButtonAction()
			{
				if(loginStatus == "false") 
				{
					window.location = LINK_ACCOUNT + "?subtopic=accountmanagement";
				} 
				else 
				{
					window.location = LINK_ACCOUNT + "?subtopic=accountmanagement";
				}
			}
			function LoginstatusTextAction(source) 
			{
				if(loginStatus == "false") 
				{
					window.location = LINK_ACCOUNT + "?subtopic=createaccount";
				} 
				else
				{
					window.location = LINK_ACCOUNT + "?subtopic=accountmanagement&action=logout";
				}
			}

			var menu = new Array();
			menu[0] = new Object();
			var unloadhelper = false;

			// load the menu and set the active submenu item by using the variable 'activeSubmenuItem' (provided to HTML-document by PHP in the file 'header.inc'
			function LoadMenu()
			{
				document.getElementById("submenu_"+activeSubmenuItem).style.color = "white";
				document.getElementById("ActiveSubmenuItemIcon_"+activeSubmenuItem).style.visibility = "visible";
				if(self.name.lastIndexOf("&") == -1) 
				{
					self.name = "news=1&library=0&community=0&forum=0&account=0&support=0<?PHP if($config['site']['shop_system'] == 1) echo "&shops=0"; ?>&";
				}
				FillMenuArray();
				InitializeMenu();
			}

			function SaveMenu()
			{
				if(unloadhelper == false) 
				{
					SaveMenuArray();
					unloadhelper = true;
				}
			}

			// store the values of the variable 'self.name' in the array menu
			function FillMenuArray()
			{
				while(self.name.length > 0 )
				{
					var mark1 = self.name.indexOf("=");
					var mark2 = self.name.indexOf("&");
					var menuItemName = self.name.substr(0, mark1);
					menu[0][menuItemName] = self.name.substring(mark1 + 1, mark2);
					self.name = self.name.substr(mark2 + 1, self.name.length);
				}
			}

			// hide or show the corresponding submenus
			function InitializeMenu()
			{
				for(menuItemName in menu[0]) 
				{
					if(menu[0][menuItemName] == "0") 
					{
						document.getElementById(menuItemName+"_Submenu").style.visibility = "hidden";
						document.getElementById(menuItemName+"_Submenu").style.display = "none";
						document.getElementById(menuItemName+"_Lights").style.visibility = "visible";
						document.getElementById(menuItemName+"_Extend").style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/general/plus.gif')";
					}
					else 
					{
						document.getElementById(menuItemName+"_Submenu").style.visibility = "visible";
						document.getElementById(menuItemName+"_Submenu").style.display = "block";
						document.getElementById(menuItemName+"_Lights").style.visibility = "hidden";
						document.getElementById(menuItemName+"_Extend").style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/general/minus.gif')";
					}
				}
			}

			// reconstruct the variable "self.name" out of the array menu
			function SaveMenuArray()
			{
				var stringSlices = "";
				var temp = "";
				for(menuItemName in menu[0]) 
				{
					stringSlices = menuItemName + "=" + menu[0][menuItemName] + "&";
					temp = temp + stringSlices;
				}
				self.name = temp;
			}

			// onClick open or close submenus
			function MenuItemAction(sourceId)
			{
				if(menu[0][sourceId] == 1) 
				{
					CloseMenuItem(sourceId);
				}
				else 
				{
					OpenMenuItem(sourceId);
				}
			}
			function OpenMenuItem(sourceId)
			{
				menu[0][sourceId] = 1;
				document.getElementById(sourceId+"_Submenu").style.visibility = "visible";
				document.getElementById(sourceId+"_Submenu").style.display = "block";
				document.getElementById(sourceId+"_Lights").style.visibility = "hidden";
				document.getElementById(sourceId+"_Extend").style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/general/minus.gif')";
			}
			function CloseMenuItem(sourceId)
			{
				menu[0][sourceId] = 0;
				document.getElementById(sourceId+"_Submenu").style.visibility = "hidden";
				document.getElementById(sourceId+"_Submenu").style.display = "none";
				document.getElementById(sourceId+"_Lights").style.visibility = "visible";
				document.getElementById(sourceId+"_Extend").style.backgroundImage = "url('<?PHP echo $layout_name; ?>/images/general/plus.gif')";
			}

			// mouse-over effects of menubuttons and submenuitems
			function MouseOverMenuItem(source)
			{
				source.firstChild.style.visibility = "visible";
			}
			function MouseOutMenuItem(source)
			{
				source.firstChild.style.visibility = "hidden";
			}
			function MouseOverSubmenuItem(source)
			{
				source.style.backgroundColor = "#14433F";
			}
			function MouseOutSubmenuItem(source)
			{
				source.style.backgroundColor = "#0D2E2B";
			}
		</script>
	</head>
	<body onBeforeUnLoad="SaveMenu();" onUnload="SaveMenu();">
		<a name="top" ></a>
		<div id="ArtworkHelper" style="background-image:url(<?PHP echo $layout_name; ?>/images/tre.png);" >
			<div id="Bodycontainer">
				<div id="ContentRow">
					<div id="MenuColumn">
						<div id="LeftArtwork">
							<img id="TibiaLogoArtworkTop" src="<?PHP echo $layout_name; ?>/images/general/logo.gif" onClick="window.location = '?subtopic=latestnews';" alt="logoartwork" />
						</div>
						<div id="Loginbox" >
							<div id="LoginTop" style="background-image:url(<?PHP echo $layout_name; ?>/images/general/box-top.gif)" ></div>
							<div id="BorderLeft" class="LoginBorder" style="background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif)" ></div>
							<div class="Loginstatus" style="background-image:url(<?PHP echo $layout_name; ?>/images/loginbox/loginbox-textfield-background.gif)" >
								<div id="LoginstatusText_1" class="LoginstatusText" style="background-image:url(<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-you-are-not-logged-in.gif)" ></div>
							</div>
							<div id="LoginButtonContainer" style="background-image:url(<?PHP echo $layout_name; ?>/images/loginbox/loginbox-textfield-background.gif)" >
								<div id="LoginButton" style="background-image:url(<?PHP echo $layout_name; ?>/images/buttons/sbutton.gif)" > 
									<div onClick="LoginButtonAction();" onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);"><div class="Button" style="background-image:url(<?PHP echo $layout_name; ?>/images/buttons/sbutton_over.gif)" ></div>
									<div id="ButtonText" ></div>
								</div>
							</div>
						</div>
						<div style="clear:both" ></div>
						<div class="Loginstatus" style="background-image:url(<?PHP echo $layout_name; ?>/images/loginbox/loginbox-textfield-background.gif)" >
							<div id="LoginstatusText_2" onClick="LoginstatusTextAction(this);" onMouseOver="MouseOverLoginBoxText(this);" onMouseOut="MouseOutLoginBoxText(this);" >
								<div id="LoginstatusText_2_1" class="LoginstatusText" style="background-image:url(<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-create-account.gif)" ></div>
								<div id="LoginstatusText_2_2" class="LoginstatusText" style="background-image:url(<?PHP echo $layout_name; ?>/images/loginbox/loginbox-font-create-account-over.gif)" ></div>
							</div>
						</div>
						<div id="BorderRight" class="LoginBorder" style="background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif)" ></div>
						<div id="LoginBottom" class="Loginstatus" style="background-image:url(<?PHP echo $layout_name; ?>/images/general/box-bottom.gif)" ></div>
					</div>
					<div id='Menu'>
						<div id='MenuTop' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/box-top.gif);'></div>
						<div id='news' class='menuitem'>
							<span onClick="MenuItemAction('news')">
								<div class='MenuButton' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background.gif);'>
									<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'>
										<div class='Button' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background-over.gif);'></div>
										<span id='news_Lights' class='Lights'>
											<div class='light_lu' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ld' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ru' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
										</span>
										<div id='news_Icon' class='Icon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-news.gif);'></div>
										<div id='news_Label' class='Label' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/label-news.gif);'></div>
										<div id='news_Extend' class='Extend' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/plus.gif);'></div>
									</div>
								</div>
							</span>
							<div id='news_Submenu' class='Submenu'>
								<a href='?subtopic=latestnews'>
									<div id='submenu_latestnews' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_latestnews' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Latest News</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=archive'>
									<div id='submenu_archive' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_archive' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>News Archive</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
							</div>
						</div>
						<div id='account' class='menuitem'>
							<span onClick="MenuItemAction('account')">
								<div class='MenuButton' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background.gif);'>
									<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'>
										<div class='Button' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background-over.gif);'></div>
										<span id='account_Lights' class='Lights'>
											<div class='light_lu' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ld' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ru' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
										</span>
										<div id='account_Icon' class='Icon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-account.gif);'></div>
										<div id='account_Label' class='Label' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/label-account.gif);'></div>
										<div id='account_Extend' class='Extend' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/plus.gif);'></div>
									</div>
								</div>
							</span>
							<div id='account_Submenu' class='Submenu'>
								<a href='?subtopic=accountmanagement'>
									<div id='submenu_accountmanagement' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_accountmanagement' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Account Management</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=createaccount'>
									<div id='submenu_createaccount' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_createaccount' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Create Account</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=lostaccount'>
									<div id='submenu_lostaccount' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_lostaccount' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Lost Account?</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<?PHP
									if($config['site']['download_page'] == 1)
									echo "
									<a href='?subtopic=downloads'>
										<div id='submenu_downloads' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
											<div class='LeftChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
											<div id='ActiveSubmenuItemIcon_downloads' class='ActiveSubmenuItemIcon' style='background-image:url(".$layout_name."/images/menu/icon-activesubmenu.gif);'></div>
											<div class='SubmenuitemLabel'>Downloads</div>
											<div class='RightChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
										</div>
									</a>";
								?>
							</div>
						</div>
						<div id='library' class='menuitem'>
							<span onClick="MenuItemAction('library')">
								<div class='MenuButton' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background.gif);'>
									<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'>
										<div class='Button' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background-over.gif);'></div>
										<span id='library_Lights' class='Lights'>
											<div class='light_lu' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ld' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ru' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
										</span>
										<div id='library_Icon' class='Icon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-library.gif);'></div>
										<div id='library_Label' class='Label' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/label-library.gif);'></div>
										<div id='library_Extend' class='Extend' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/plus.gif);'></div>
									</div>
								</div>
							</span>
							<div id='library_Submenu' class='Submenu'>
								<a href='?subtopic=creatures'>
									<div id='submenu_creatures' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_creatures' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Creatures</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=spells'>
									<div id='submenu_spells' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_spells' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Spells</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
	
								<a href='?subtopic=serverinfo'>
										<div id='submenu_serverinfo' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
											<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
											<div id='ActiveSubmenuItemIcon_serverinfo' class='ActiveSubmenuItemIcon' style='background-image:url(".$layout_name."/images/menu/icon-activesubmenu.gif);'></div>
											<div class='SubmenuitemLabel'>Server Info</div>
											<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										</div>
									</a>

								<a href='?subtopic=serverrules'>
									<div id='submenu_tibiarules' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_tibiarules' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Server Rules</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>

								<a href='?subtopic=commands'>
									<div id='submenu_commands' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_commands' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Commands</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=experiencetable'>
									<div id='submenu_experiencetable' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_experiencetable' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Experience Table</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=support'>
									<div id='submenu_team' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_team' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Support List</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
							</div>
						</div>
						<div id='community' class='menuitem'>
							<span onClick="MenuItemAction('community')">
								<div class='MenuButton' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background.gif);'>
									<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'>
										<div class='Button' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/button-background-over.gif);'></div>
										<span id='community_Lights' class='Lights'>
											<div class='light_lu' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ld' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
											<div class='light_ru' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/green-light.gif);'></div>
										</span>
										<div id='community_Icon' class='Icon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-community.gif);'></div>
										<div id='community_Label' class='Label' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/label-community.gif);'></div>
										<div id='community_Extend' class='Extend' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/plus.gif);'></div>
									</div>
								</div>
							</span>
							<div id='community_Submenu' class='Submenu'>
								<a href='?subtopic=characters'>
									<div id='submenu_characters' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_characters' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Characters</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=whoisonline'>
									<div id='submenu_whoisonline' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_whoisonline' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Who Is Online?</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=highscores'>
									<div id='submenu_highscores' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_highscores' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Highscores</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=guilds'>
									<div id='submenu_guilds' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_guilds' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Guilds</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='index.php?subtopic=wars'>
									<div id='submenu_wars' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'> 
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_wars' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'><font color="#FF4500"><u>Guild Wars</u></font></div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=bans'>
									<div id='submenu_bans' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_bans' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'><font color="red">Banishments</font></div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=toprichest'>
									<div id='submenu_bans' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_bans' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'><font color="gold">Top Richest</font></div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=killstatistics'>
									<div id='submenu_killstatistics' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_killstatistics' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Last Kills</div>
										<div class='RightChain' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/chain.gif);'></div>
									</div>
								</a>
							</div>
						</div>
						<?PHP
						echo "
						<div id='forum' class='menuitem'>
							<span onClick=\"MenuItemAction('forum')\">
								<div class='MenuButton' style='background-image:url(".$layout_name."/images/menu/button-background.gif);'>
									<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'>
										<div class='Button' style='background-image:url(".$layout_name."/images/menu/button-background-over.gif);'></div>
										<span id='forum_Lights' class='Lights'>
											<div class='light_lu' style='background-image:url(".$layout_name."/images/menu/green-light.gif);'></div>
											<div class='light_ld' style='background-image:url(".$layout_name."/images/menu/green-light.gif);'></div>
											<div class='light_ru' style='background-image:url(".$layout_name."/images/menu/green-light.gif);'></div>
										</span>
										<div id='forum_Icon' class='Icon' style='background-image:url(".$layout_name."/images/menu/icon-forum.gif);'></div>
										<div id='forum_Label' class='Label' style='background-image:url(".$layout_name."/images/menu/label-forum.gif);'></div>
										<div id='forum_Extend' class='Extend' style='background-image:url(".$layout_name."/images/general/plus.gif);'></div>
									</div>
								</div>
							</span>
							<div id='forum_Submenu' class='Submenu'>
								<a href='?subtopic=forum'>
									<div id='submenu_forum' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_forum' class='ActiveSubmenuItemIcon' style='background-image:url(".$layout_name."/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Server Forum</div>
										<div class='RightChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
									</div>
								</a>
								<a href='?subtopic=auctionsystem'>
								  <div id='submenu_auctionsystem' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
									<div class='LeftChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
									<div id='ActiveSubmenuItemIcon_auctionsystem' class='ActiveSubmenuItemIcon' style='background-image:url(<?PHP echo $layout_name; ?>/images/menu/icon-activesubmenu.gif);'></div>
									<div class='SubmenuitemLabel'>Auction System</div>
									<div class='RightChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
								  </div>
								</a> 
							</div>
						</div>";
						if($config['site']['shop_system'] == 1)
						{
							echo "<div id='shops' class='menuitem'>
								<span onClick=\"MenuItemAction('shops')\">
									<div class='MenuButton' style='background-image:url(".$layout_name."/images/menu/button-background.gif);'>
										<div onMouseOver='MouseOverMenuItem(this);' onMouseOut='MouseOutMenuItem(this);'>
											<div class='Button' style='background-image:url(".$layout_name."/images/menu/button-background-over.gif);'></div>
											<span id='shops_Lights' class='Lights'>
												<div class='light_lu' style='background-image:url(".$layout_name."/images/menu/green-light.gif);'></div>
												<div class='light_ld' style='background-image:url(".$layout_name."/images/menu/green-light.gif);'></div>
												<div class='light_ru' style='background-image:url(".$layout_name."/images/menu/green-light.gif);'></div>
											</span>
											<div id='shops_Icon' class='Icon' style='background-image:url(".$layout_name."/images/menu/icon-shops.gif);'></div>
											<div id='shops_Label' class='Label' style='background-image:url(".$layout_name."/images/menu/label-shops.gif);'></div>
											<div id='shops_Extend' class='Extend' style='background-image:url(".$layout_name."/images/general/plus.gif);'></div>
										</div>
									</div>
								</span>
								<div id='shops_Submenu' class='Submenu'>
									<a href='?subtopic=buypoints'>
										<div id='submenu_buypoints' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
											<div class='LeftChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
											<div id='ActiveSubmenuItemIcon_buypoints' class='ActiveSubmenuItemIcon' style='background-image:url(".$layout_name."/images/menu/icon-activesubmenu.gif);'></div>
											<div class='SubmenuitemLabel' style='color:red'>Buy Points</div>
											<div class='RightChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
										</div>
									</a>
									<a href='?subtopic=shopsystem'>
										<div id='submenu_shopsystem' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
											<div class='LeftChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
											<div id='ActiveSubmenuItemIcon_shopsystem' class='ActiveSubmenuItemIcon' style='background-image:url(".$layout_name."/images/menu/icon-activesubmenu.gif);'></div>
											<div class='SubmenuitemLabel' style='color:green'>\$hop Offer</div>
											<div class='RightChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
										</div>
									</a>";
							if($logged)
								echo "<a href='?subtopic=shopsystem&action=show_history'>
									<div id='submenu_shopsystem' class='Submenuitem' onMouseOver='MouseOverSubmenuItem(this)' onMouseOut='MouseOutSubmenuItem(this)'>
										<div class='LeftChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
										<div id='ActiveSubmenuItemIcon_shopsystem' class='ActiveSubmenuItemIcon' style='background-image:url(".$layout_name."/images/menu/icon-activesubmenu.gif);'></div>
										<div class='SubmenuitemLabel'>Trans. History</div>
										<div class='RightChain' style='background-image:url(".$layout_name."/images/general/chain.gif);'></div>
									</div>
								</a>";
							echo "</div></div>";
						}
						?>
						<div id='MenuBottom' style='background-image:url(<?PHP echo $layout_name; ?>/images/general/box-bottom.gif);'></div>
					</div>
				</div>
				<div id="ContentColumn">
					<div class="Content">
						<div id="ContentHelper">
							<script type="text/javascript" src="<?PHP echo $layout_name; ?>/newsticker.js"></script>
							<?PHP echo $news_content; ?>
							<div id="<?PHP echo $subtopic; ?>" class="Box">
								<div class="Corner-tl" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/corner-tl.gif);"></div>
								<div class="Corner-tr" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/corner-tr.gif);"></div>
								<div class="Border_1" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/border-1.gif);"></div>
								<div class="BorderTitleText" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/title-background-green.gif);"></div>
								<img class="Title" src="<?PHP echo $layout_name; ?>/images/header/headline-<?PHP echo $subtopic; ?>.gif" alt="Contentbox headline" />
								<div class="Border_2">
									<div class="Border_3">
										<div class="BoxContent" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/scroll.gif);">
											<?PHP echo $main_content; ?> 
										</div>
									</div>
								</div>
								<div class="Border_1" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/border-1.gif);"></div>
								<div class="CornerWrapper-b"><div class="Corner-bl" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/corner-bl.gif);"></div></div>
								<div class="CornerWrapper-b"><div class="Corner-br" style="background-image:url(<?PHP echo $layout_name; ?>/images/content/corner-br.gif);"></div></div>
							</div>
						</div>
					</div>
					<div id="Footer">
						<?PHP
							$time_end = microtime_float();
							$time = $time_end - $time_start;
						?>
						<?PHP echo getFooter() ?><br/>Page generated in <?PHP echo round($time, 4); ?> seconds
					</div>
				</div>
				<div id="ThemeboxesColumn">
					<div id="RightArtwork">
						<img id="Monster" src="monsters/Lizard Abomination.gif" onClick="window.location = '?subtopic=creatures&amp;creature=Lizard Abomination';" alt="Monster of the Week" />
						<img id="PedestalAndOnline" src="<?PHP echo $layout_name; ?>/images/general/pedestalandonline.gif" alt="Monster Pedestal and Players Online Box"/>
						<div id="PlayersOnline" onClick="window.location = '?subtopic=whoisonline'">
							<?PHP
								if($config['status']['serverStatus_online'] == 1)
									echo $config['status']['serverStatus_players'].'<br />Players Online';
								else
									echo '<font color="red"><b>Server<br />OFFLINE</b></font>';
							?>
						</div>
					</div>
					<div id="Themeboxes">
						<div id="NewcomerBox" class="Themebox" style="background-image:url(<?PHP echo $layout_name; ?>/images/themeboxes/newcomer/newcomer.gif);">
							
							<div class="Bottom" style="background-image:url(<?PHP echo $layout_name; ?>/images/general/box-bottom.gif);"></div>
						</div>
						
						 <?PHP

						  echo '	<div id="Auction" class="Themebox" style="background-image:url('.$layout_name.'/images/themeboxes/auction/newonauction.gif);">
							<a class="ThemeboxButton"   href="?subtopic=ganja" onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" style="text-decoration:none; background-image:url('.$layout_name.'/images/buttons/sbutton.gif); margin: -5px; margin-left: 0px; "><div class="BigButtonOver" style="background-image:url('.$layout_name.'/images/buttons/sbutton_over.gif);"></div>
							  <div class="ButtonText" style="color: gold; margin: 5px;"><b>CHECK NOW !</b></div>
						   </a>
							
							<div class="Bottom" style="background-image:url('.$layout_name.'/images/general/box-bottom.gif);"></div>
						  </div>' ;
						  ?>
						
						<?PHP
						if($group_id_of_acc_logged >= $config['site']['access_admin_panel']) 
							echo '
							<div id="NewcomerBox" class="Themebox" style="background-image:url('.$layout_name.'/images/themeboxes/admin/admin.png);">
								<div id="lool" CLASS=white>
									<table><tr><td height="30">&nbsp;</td><td>&nbsp;</td></tr>
										<tr><td height="10">&nbsp;</td><td><a href="?subtopic=adminpanel"><font color="white"><b>ADMIN PANEL</b></font></a></td></tr>
										<tr><td height="10">&nbsp;</td><td><a href="?subtopic=namelock"><font color="white"><b>NAME LOCKS</b></font></a></td></tr>
										<tr><td height="10">&nbsp;</td><td><a href="?subtopic=shopadmin"><font color="white"><b>SHOP ADMIN</b></font></a></td></tr>
										<tr><td height="10">&nbsp;</td><td><a href="http://mariaots.pl/phpmyadmin"><font color="white"><b>PMA</b></font></a></td></tr>
									</table>
								</div>
								<div class="Bottom" style="background-image:url('.$layout_name.'/images/general/box-bottom.gif);"></div>
							</div>';
						 ?>
						<script type="text/javascript">InitializePage();</script>
					</div>
				</div>
			</div>
		</div>
		</div>
<script type="text/javascript"> 
var otslist_serverid = 16592;
</script> 
<!--<script type="text/javascript" src="http://otslist.eu/ratingWidget.js?jquery=1"></script>-->
	</body>
</html>