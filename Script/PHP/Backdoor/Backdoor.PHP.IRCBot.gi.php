<?php
//fighter script - BAJAY
function working() {
$querym=array(
"?",
"!",
"^^",
" ^^",
" :(",
" :)",
" ~:>",
" :P~",
" :D",
",",
".",
"a",
"i",
"u",
"e",
"o",
"z",
"v",
"z",
"x",
"c",
"p",
"m",
"t",
"k",
"b",
"s",
"u",
"bot",
"g",
"lo",
"jo",
"lol"
);
$tsu1=array("`","|","[","]","{","}","^","_");
$tsu2=array("`","|","[","]","{","}","^","-","\\","_");
$nicky=array(
"Abdulrazak","Ackerman","Adams","Addison","Adelstein","Adibe","Adorno","Ahlers","Alavi","Alcorn","Alda",
"Aleks","Allison","Alongi","Altavilla","Altenberger","Altenhofen","Amaral","Amatangelo","Ameer","Amsden","Anand","Andel",
"Ando","Andrelus","Andron","Anfinrud","Ansley","Anthony","Antos","Arbia","Arduini","Arellano","Aristotle","Arjas","Arky","Atkins",
"Augustus","Aurelius","Axelrod","Axworthy","Ayiemba","Aykroyd","Ayling","Azima","Bachmuth","Backus","Bady","Baglivo","Bagnold",
"Bailar","Bakanowsky","Baleja","Ballatori","Ballew","Baltz","Banta","Barabesi","Barajas","Baranczak","Baranowska","Barberi","Barbetti",
"Barneson","Barnett","Barriola","Barry","Bartholomew","Bartolome","Bartoo","Basavappa","Bashevis","Batchelder","Baumiller","Bayles","Bayo",
"Beacon","Beal","Bean","Beckman","Beder","Bedford","Behenna","Belanger","Belaoussof","Belfer","Belin-Collart","Bellavance","Bellhouse",
"Bellini","Belloc","Benedict-Dye","Bergson","Berke-Jenkins","Bernardo",        "Bernassola","Bernston","Berrizbeitia","Betti","Beynart","Biagioli",
"Bickel","Binion","Bir","Bisema","Bisho","Blackbourn","Blackwell","Blagg","Blakemore","Blanke","Bliss","Blizard","Bloch","Bloembergen",
"Bloemhof","Bloxham","Blyth","Bolger","Bolick","Bollinger","Bologna","Boner","Bonham","Boniface","Bontempo","Book","Bookbinder","Boone",
"Boorstin","Borack","Borden","Bossi","Bothman","Botosh","Boudin","Boudrot","Bourneuf","Bowers","Boxer","Boyajian","Boyes","Boyland",
"Boym","Boyne","Bracalente","Bradac","Bradach","Brecht","Breed","Brenan","Brennan","Brewer","Brewer","Bridgeman","Bridges","Brinton",
"Britz","Broca","Brook","Brzycki","Buchan","Budding","Bullard","Bunton","Burden","Burdzy","Burke","Burridge","Busetta","Byatt","Byerly",
"Byrd","Cage","Calnan","Cammelli","Cammilleri","Canley","Capanni","Caperton","Capocaccia","Capodilupo","Cappuccio","Capursi","Caratozzolo",
"Carayannopoulos","Carlin","Carlos","Carlyle","Carmichael","Caroti","Carper","Cartmill","Cascio","Case","Caspar","Castelda","Cavanagh",
"Cavell","Ceniceros","Cerioli","Chapman","Charles","Cheang","Cherry","Chervinsky","Chiassino","Chien","Childress","Childs","Chinipardaz",
"Chinman","Christenson","Christian","Christiano","Christie","Christopher","Chu","Chupasko","Church","Ciampaglia","Cicero","Cifarelli",
"Claffey","Clancy","Clark","Clement","Clifton","Clow","Coblenz","Coito","Coldren","Colella","Collard","Collis","Compton","Compton",
"Comstock","Concino","Condodina","Connors","Corey","Cornish","Cosmides","Counter","Coutaux","Crawford","Crocker","Croshaw","Croxen",
"Croxton","Cui","Currier","Cutler","Cvek","Cyders","daSilva","Daldalian","Daly","D'Ambra","Danieli","Dante","Dapice","D'arcangelo","Das",
"Dasgupta","Daskalu","David","Dawkins","DeGennaro","DeLaPena","del'Enclos","deRousse","Debroff","Dees","Defeciani","Delattre","Deleon-Rendon",
"Delger","Dell'acqua","Deming","Dempster","Demusz","Denault","Denham","Denison","Desombre","Deutsch","D'fini","Dicks","Diefenbach","Difabio",
"Difronzo","Dilworth","Dionysius","Dirksen","Dockery","Doherty","Donahue","Donner","Doonan","Dore","Dorf","Dosi","Doty","Doug","Dowsland",
"Drinker","D'souza","Duffin","Durrett","Dussault","Dwyer","Eardley","Ebeling","Eckel","Edley","Edner","Edward","Eickenhorst","Eliasson",
"Elmendorf","Elmerick","Elvis","Encinas","Enyeart","Eppling","Erbach","Erdman","Erdos","Erez","Espinoza","Estes","Etter","Euripides",
"Everett","Fabbris","Fagan","Faioes","Falco-Acosta","Falorsi","Faris","Farone","Farren","Fasso'","Fates","Feigenbaum","Fejzo","Feldman",
"Fernald","Fernandes","Ferrante","Ferriell","Feuer","Fido","Field","Fink","Finkelstein","Finnegan","Fiorina","Fisk","Fitzmaurice","Flier",
"Flores","Folks","Forester","Fortes","Fortier","Fossey","Fossi","Francisco","Franklin-Kenea","Franz","Frazier-Davis","Freid","Freundlich",
"Fried","Friedland","Frisken","Frowiss","Fryberger","Frye","Fujii-Abe","Fuller","Furth","Fusaro","Gabrielli","Gaggiotti","Galeotti","Galwey",
"Gambini","Garfield","Garman","Garonna","Geller","Gemberling","Georgi","Gerrett","Ghorai","Gibbens","Gibson","Gilbert","Gili","Gill","Gillispie",
"Gist","Gleason","Glegg","Glendon","Goldfarb","Goncalves","Good","Goodearl","Goody","Gozzi","Gravell","Greenberg","Greenfeld","Griffiths",
"Grigoletto","Grummell","Gruner","Gruppe","Guenthart","Gunn","Guo","Ha","Haar","Hackman","Hackshaw","Haley","Halkias","Hallowell","Halpert",
"Hambarzumjan","Hamer","Hammerness","Hand","Hanssen","Harding","Hargraves","Harlow","Harrigan","Hartman","Hartmann","Hartnett","Harwell",
"Haviaras","Hawkes","Hayes","Haynes","Hazlewood","Heermans","Heft","Heiland","Hellman","Hellmiss","Helprin","Hemphill","Henery","Henrichs",
"Hernandez","Herrera","Hester","Heubert","Heyeck","Himmelfarb","Hind","Hirst","Hitchcock","Hoang","Hock","Hoffer","Hoffman","Hokanson","Hokoda",
"Holmes","Holoien","Holter","Holway","Holzman","Hooker","Hopkins","Horsley","Hoshida","Hostage","Hottle","Howard","Hoy","Huey","Huidekoper",
"Hungerford","Huntington","Hupp","Hurtubise","Hutchings","Hyde","Iaquinta","Ichikawa","Igarashi","Inamura","Inniss","Isaac","Isaievych","Isbill",
"Isserman","Iyer","Jacenko","Jackson","Jagers","Jagger","Jagoe","Jain","Jamil","Janjigian","Jarnagin","Jarrell","Jay","Jeffers","Jellis",
"Jenkins","Jespersen","Jewett","Johannesson","Johannsen","Johns","Jolly","Jorgensen","Jucks","Juliano","Julious","Kabbash","Kaboolian","Kafadar",
"Kalbfleisch","Kaligian","Kalil","Kalinowski","Kalman","Kamel","Kangis","Karpouzes","Kassower","Kasten","Kawachi","Kee","Keenan","Keepper",
"Keith","Kelker","Kelsey","Kempton","Kemsley","Kendall","Kerry","Keul","Khong","Kimmel","Kimmett","Kimura","Kindall","Kinsley","Kippenberger",
"Kirscht","Kittridge","Kleckner","Kleiman","Kleinfelder","Klemperer","Kling","Klinkenborg","Klint","Knuff","Kobrick","Koch","Kohn","Koivumaki",
"Kommer","Koniaris","Konrad","Kool","Korzybski","Kotter","Kovaks","Kraemer","Krailo","Krasney","Kraus","Kroemer","Krysiak","Kuenzli","Kumar",
"Kusman","Kuwabara","La","Labunka","Lafler","Laing","Lallemant","Landes","Lankes","Lantieri","Lanzit","Laserna","Lashley","Lawless","Lecar",
"Lecce","Leclercq","Leite","Lenard","Sofia","Lesser","Lessi","Liakos","Lidano","Liem","Light","Lightfoot","Lim","Linares","Linda","Linder",
"Line","Linehan","Linzee","Lippmann","Lipponen","Little","Litvak","Livernash","Livi","Livolsi","Lizardo","Locatelli","Longworth","Loss","Loveman",
"Lowenstein","Loza","Lubin","Lucas","Luciano","Luczkow","Luecke","Lunetta","Luoma","Lussier","Lutcavage","Luzader","Ma","Maccormac","Macdonald",
"Maceachern","Macintyre","Mackenney","MacMillan","Macy","Madigan","Maggio","Mahony","Maier","Maine-Hershey","Maisano","Malatesta","Maller",
"Malova","Manalis","Mandel","Manganiello","Mantovan","March","Marchbanks","Marcus","Margalit","Margetts","Marques","Martinez","Martochio",
"Marton","Marubini","Mass","Matalka","Matarazzo","Matsukata","Mattson","Mauzy","May","Mazzali","Mazziotta","Mcbride","Mccaffery","Mccall",
"Mcclearn","Mcdowell","Mcelroy","McFadden","Mcghee","Mcgoldrick","McIlroy","Mcintosh","Mcdonald","Mclane","Mclaren","Mcnealy","Mcnulty",
"Meccariello","Memisoglu","Menzies","Merikoski","Merlani","Merminod","Merseth","Merz","Metelka","Metropolis","Meurer","Michelman","Middle",
"Mieher","Mills","Minh","Mini","Minichiello","Gonzalez","Mitropoulos","Mittal","Mocroft","Modestino","Moeller","Mohr","Moiamedi","Monque","Montilio",
"MooreDeCh.","Morani","Moreton","Morrison","Morrow","Mortimer","Mosher","Mosler","Mostafavi","Motooka","Mudarri","Muello","Mugnai","Mulkern",
"Mulroy","Mumford","Mussachio","Naddeo","Napolitano","Nardi","Nardone","Naviaux","Nayduch","Nelson","Nenna","Nesci","Neuman","Newfeld","Newlin",
"Ng","Ni","Nickerson","Nickoloff","Nisenson","Nitabach","Notman","Nuzum","Ocougne","Ogata","Oh","O'hagan","Oldford","Olsen","Olson","Olszewski",
"O'malley","Oman","O'meara","Opel","Oray","Orfield","Orsi","Ospina","Ostrowski","Ottaviani","Otten","Ouchida","Ovid","PaesDealmeida","Paine",
"Palayoor","Palepu","Pallara","Palmitesta","Panadero","Panizzon","Pantilla","Paoletti","Parmeggiani","Parris","Partridge","Pascucci","Patefield",
"Patrick","Pattullo","Pavetti","Pavlon","Pawloski","Paynter","Peabody","Pearlberg","Pederson","Peishel","Penny","Pereira","Perko","Perlak",
"Perlman","Perna","Perone","Perrimon","Peters","Petruzello","Pettibone","Pettit","Pfister","Pilbeam","Pinot","Plancon","Plant","Plasket","Plous",
"Po","Pocobene","Poincaire","Pointer","Poirier","Polak","Polanyi","Politis","Poma","Poolman","Powers","Presper","Preucel","Prevost","Pritchard",
"Pritz","Proietti","Prothrow-Stith","Puccia","Pugh","Pynchon","Quaday","Quetin","Rabe","Rabkin","Radeke","Rajagopalan","Raney","Rangan","Rankin",
"Rapple","Rayport","Redden-Tyler","Reedquist","Cunningham","Reinold","Remak","Renick","Repetto","Resnik","Rhea","Richmond","Rielly","Rindos",
"Rineer","Rish","Rivera","Robinson","Rocha","Roesler","Rogers","Ronen","Row","Royal","Ru","Ruan","Ruderman","Ruescher","Rush","Ryu","Sabatello",
"Sadler","Safire","Sahu","Sali","Samson","Sanchez-Ramirez","Sanna","Sapers","Sarin","Sartore","Sase","Satin","Satta","Satterthwaite","Sawtell",
"Sayied","Scarponi","Scepan","Scharf","Scharlemann","Scheiner","Schiano","Schifini","Schilling","Schmitt","Schossberger","Schuman","Schutte",
"Schuyler","Schwan","Schwickrath","Scovel","Scudder","Seaton","Seeber","Segal","Sekler","Selvage","Sen","Sennett","Seterdahl","Sexton",
"Seyfert","Shaikh","Shakis","Shankland","Shanley","Shar","Shatrov","Shavelson","Shea","Sheats","Shepherd","Sheppard","Shepstone","Shesko","Shia",
"Shibata","Shimon","Siesto","Sigalot","Sigini","Signa","Silverman","Silvetti","Sinsabaugh","Sirilli","Sites","Skane","Skerry","Skoda","Sloan",
"Slowe","Smilow","Sniffen","Snodgrass","Socolow","Solon","Somers","Sommariva","Sorabella","Sorg","Sottak","Soukup","Soule","Soultanian","Spanier",
"Sparrow","Spaulding","Speizer","Spence","Sperber","Spicer","Spiegelhalter","Spiliotis","Spinrad","StMartin","Stalvey","Stam","Stang","Stassinopolus",
"States","Statlender","Stefani","Steiner","Stephanian","Stepniewska","Stewart-Oaten","Stiepock","Stillwell","Stock","Stockton","Stockwell","Stolzenberg",
"Stonich","Storer","Stott","Strange","Strauch","Streiff","Stringer","Sullivan","Sumner","Suo","Surdam","Sweeting","Sweetser","Swindle","Tagiuri",
"Tai","Talaugon","Tambiah","Tandler","Tanowitz","Tatar","Taveras","Tawn","Tcherepnin","Teague","Temes","Temmer","Tenney","Terracini","Than",
"Thavaneswaran","Theodos","Thibault","Thisted","Thomsen","Throop","Tierney","Till","Timmons","Tofallis","Tollestrup","Tolls","Tolman","Tomford",
"Toomer","Topulos","Torresi","Torske","Towler","Toye","Traebert","Trenga","Trewin","Tringali","Troiani","Troy","Truss","Tsiatis","Tsomides","Tsukurov",
"Tuck","Tudge","Tukan","Turano","Turek","Tuttle","Twells","Tzamarias","Ullman","Untermeyer","Upsdell","Urban","Urdang-Brown","Usdan","Uzuner",
"Vacca","Waite","Valberg","Valencia","Wales","Wallenberg","Walter","vanAllen","VanZwet","Vandenberg","Vanheeckeren","Warshafsky","Wasowska","Vasquez",
"Waugh","Weighart","Weingarten","Weinhaus","Weissbourd","Weissman","Velasquez","Welles","Welsh","Wengret","Venne","Verghese","Wescott","Wetzel",
"Whately","Whilton","White","Whitla","Whittaker","Viana","Viano","Wiedersheim","Wiener","Viens","Vignola","Wilder","Wilhelm","Wilk","Wilkin","Wilkinson",
"Villarreal","Willstatter","Wilson","Vitali","Viviani","Voigt","Wolk","VonHoffman","Woo","Wooden","Woods","Woods-Powell","Vorhaus","Votey","Yacono",
"Yamane","Yankee","Yarchuk","Yates","Ybarra","Yedidia","Yesson","Yetiv","Yoffe","Yoo","Youk-See","Yu","Zachary","Zahedi","Zangwill","Zegans","Zerbini",
"Zoldak","Zucconi","Zurn","Zwiers"
);
$usr1=array(
"ancuL",
);

$nick = $nicky[rand(0,count($nicky) - 1)];
$awaymsg = "13????? 3RajaTega 13?????";
$identify = 'uhuKz';
$Admin = 'Load';
$BOT_PASSWORD = 'brod';
$channels = '#haha';
$remotehst2= array("irc.allnetwork.org","irc.big.net.id","irc.indotransdata.net","visit.id.allnetwork.org","irc.uii.net.id","irc.plasa.com","wanxp.allnetwork.org","irc.indika.net.id","irc.citra.net.id","indowebster.id.allnetwork.org","irc.telkom.net.id","irc.dustshell.com","irc.cbn.net.id","irc.telkom.net.id","irc.jmn.net.id","acehskylink.id.allnetwork.org","irc.suryadata.co.id","irc.indo.net.id");
$remotehost= $remotehst2[rand(0,count($remotehst2) - 1)];
$port = '7000';
$realname = '13????? 7RajaTega 13?????';
$counterfp = 0;
$channels = str_replace("CNL","#",$channels);
print "<body bgcolor=#000000 text=#C0C0C0>";
print "<b>== Connecting to $remotehost...</b>";


$raway = "on";
$log   = "off";
$saway = "1";
if (!$stime) { $stime = time(); }
if (!$port) { $port = "6666"; }
$Admin = strtolower($Admin);
$auth = array($Admin => array("name" => $Admin, "pass" => $BOT_PASSWORD, "auth" => 1,"status" => "Admin"));

$username = $usr1[rand(0,count($usr1) - 1)].$usr1[rand(0,count($usr1) - 1)].$usr1[rand(0,count($usr1) - 1)];
$keluar = 0;
$akill  = 1;
$katime = 0;
$localhost = 'localhost';
$dayload = date("H:i:s d/m/Y");
ini_set('user_agent','MSIE 5\.5;');
set_time_limit(0);
define ('CRL', "\r\n");
$channels = strtolower($channels)." ";
$channel = explode(" ", $channels);

do {
  $fp = fsockopen($remotehost,$port, &$err_num, &$err_msg, 30);
  if(!$fp) {
	if ( $counterfp <= 200 ) {
		$counterfp = $counterfp+1;
		working($nick);
	}
  	else { 
 	   print "<br><b>Cannot connect to $remotehost!<br>Please Try Another Server!</b>";
 	   $keluar = 1;
  	   exit;
	}
  }
  print "<br><b>== Suceeded connection</b>";
  $Header = 'NICK '.$nick . CRL;
  $Header .= 'USER '.$username.' '.$localhost.' '.$remotehost.' :'.$realname . CRL;
  fputs($fp, $Header);
  $response = '';
  while (!feof($fp)) {
	$response .= fgets($fp, 1024);
	while (substr_count($response,CRL) != 0) {
		$offset = strpos($response, CRL);
		$data = substr($response,0,$offset);
		$response = substr($response,$offset+2);
		if (substr($data,0,1) == ':') {
			$offsetA = strpos($data, ' ');
			$dFrom = substr($data,1,$offsetA-1);
			$offsetB = strpos($data, ' :');
			$dCommand = substr($data,$offsetA+1,$offsetB-$offsetA-1);
			$offsetC = strpos($data, '!');
			$dNick = substr($data,1,$offsetC-1);
			$iText = substr($data,$offsetB+2);
            if ( substr($dCommand,0,3) == '004' ) {
			  fputs($fp, 'PRIVMSG nickserv@services.dal.net :identify '.$nick.' '.$identify.  CRL);
			  if ($nickmode) { fputs($fp, 'MODE '.$nick.' :'.$nickmode . CRL); }
			  fputs($fp, 'NOTICE ' . $Admin . ' :Halo bos besar!' .  CRL);
			  foreach ($channel as $v) {
				fputs($fp, 'JOIN ' .$v . CRL);
			  }
			  $pong1 = '1';
            }
			elseif (substr($dCommand,0,3)=='465') {
				print "<br><b>== This bot have been autokilled.</b>";
				$akill = 2;
			}
			elseif (substr($dCommand,0,3)=='433') {
				$nick = $nicky[rand(0,count($nicky) - 1)];
				fputs($fp, 'NICK '.$nick . CRL);
			}
			elseif (substr($dCommand,0,3)=='432') {
				$nick = $nick.$username;
				fputs($fp, 'NICK '.$nick . CRL);
			}
			if (eregi('.dal.net',$dNick) && $akill==2) {
				if (eregi('AKILL ID:',$data) || eregi('Your hostmask is',$data) || eregi('Your IP is',$data)) {
					print "<br><b>".strstr($data,'***')." </b>";

					if (eregi('Your IP is',$data)) {
						$keluar = 1;
						exit;
					}
				}
			}
			$dcom = explode(" ", $dCommand);
			$dNick = strtolower($dNick);
			if ($dcom[0]=='KICK' && $dcom[2]==$nick) {
				fputs($fp, 'JOIN ' .$dcom[1]. CRL);
			}
			elseif ($dcom[0]=='NICK' || $dcom[0]=='QUIT' || $dcom[0]=='PART') {
				if ($auth["$dNick"]) {
					if ($auth["$dNick"]["pass"]) {
						if ($auth["$dNick"]["auth"]==2) {

							if ($dcom[0]=='NICK') {
								$com = explode(" ", $data);
								$chnick = strtolower(str_replace(':','',$com[2]));
								if ($dNick!=$chnick) {
									$auth["$dNick"]["auth"] = 1;
									fputs($fp,'NOTICE '.$chnick.' :selamat istirahat bos! ' . CRL);
								}
							} else { $auth["$dNick"]["auth"] = 1; fputs($fp,'NOTICE '.$dNick.' :selamat istirahat bos! ' . CRL); }
						}
					} else { fputs($fp,'NOTICE ' . $dNick . ' :pass your pass ' . CRL); }
				}
			}
			elseif ($dcom[0]=='307' && strtolower($dcom[2])==$whois) {
				$dcom[2] = strtolower($dcom[2]);
				if ($auth["$dcom[2]"]) {
					if ($auth["$dcom[2]"]["pass"]) {
						if ($auth["$dcom[2]"]["auth"]==1) {
							$auth["$dcom[2]"]["auth"] = 2; $whois = "";
							fputs($fp,'NOTICE ' . $dcom[2] . ' :You`re Authorized as '.$auth["$dcom[2]"]["status"].' of this bot! ' . CRL);
						} else { fputs($fp,'NOTICE ' . $dcom[2] . ' :password bener bos seep! ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Pass salah cux! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
				} else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
			}
			elseif ($dcom[0]=='NOTICE') {
				$com = explode(" ", $data);
				if ($com[3]==':KB' && $com[4] && $com[5] && $com[6]) {
					$msg = str_replace('','',$data);
					$msg = strstr($msg,":KB");
					$msg = str_replace(":KB $com[4]","",$msg);
					fputs($fp, 'KICK '.$com[4].' '.$com[5].' :'.$msg . CRL);
					fputs($fp, 'MODE '.$com[4].' +b *!*'.$com[6] . CRL);
				}
			}
			elseif ($dcom[0]=='PRIVMSG') {
				$com = explode(" ", $data);
				if ($com[3]==':VERSION') {
					fputs($fp,'NOTICE '.$dNick.' :'.chr(1).'VERSION barang iks'.chr(1) . CRL);
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':auth' && $com[4]) {
					if ($auth["$dNick"]) {
						if ($auth["$dNick"]["pass"]) {
							if ($auth["$dNick"]["auth"]==1) {
								if ($com[4]===$auth["$dNick"]["pass"]) {
									$auth["$dNick"]["auth"] = 2;
									fputs($fp,'NOTICE ' . $dNick . ' :You`re Authorized as '.$auth["$dNick"]["status"].' of this bot! ' . CRL);
								} else { fputs($fp,'NOTICE ' . $dNick . ' :password salah! Auth salah cok! ' . CRL); }
							} else { fputs($fp,'NOTICE ' . $dNick . ' :password bener bos! ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':deauth') {
					if ($auth["$dNick"]) {
						if ($auth["$dNick"]["pass"]) {
							if ($auth["$dNick"]["auth"]==2) {
								$auth["$dNick"]["auth"] = 1;
								fputs($fp,'NOTICE ' . $dNick . ' :You`re LogOut! ' . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :You`re Already LogOut! ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':pass' && $com[4]) {
					if ($auth["$dNick"]) {
						if (!$auth["$dNick"]["pass"]) {
							$auth["$dNick"]["pass"] = $com[4];
							$auth["$dNick"]["auth"] = 1;
							fputs($fp,'NOTICE ' . $dNick . ' :Your Auth Pass set to '.$auth["$dNick"]["pass"].', Type: auth <your pass> To Authorized Imediately! ' . CRL);
						} else { fputs($fp,'NOTICE ' . $dNick . ' :Pass Already Set! Type: auth <your pass> To Get Authorized ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Pass Again ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':chgpass' && $com[4] && $com[5]) {
					if ($auth["$dNick"]) {
						if ($auth["$dNick"]["auth"]==2) {
							if ($com[4]===$auth["$dNick"]["pass"]) {
								$auth["$dNick"]["pass"] = $com[5];
								fputs($fp,'NOTICE ' . $dNick . ' :Your New Auth Pass set to '.$auth["$dNick"]["pass"].', Type: auth <your pass> To Authorized Imediately! ' . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :Your Old Pass Wrong! Type: chgpass <old pass> <new pass> To Change Your Auth Pass ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Pass Again ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':adduser' && $com[4] && $com[4]!=$nick && $com[5]) {
					$com[4] = strtolower($com[4]);
					if ($auth["$dNick"]["auth"]==2) {
						if ($auth["$dNick"]["status"]=="Admin") {
							if ($com[5]=="master" || $com[5]=="user") {
								$auth["$com[4]"]["name"] = $com[4];
								$auth["$com[4]"]["status"] = $com[5];
								fputs($fp,'NOTICE ' . $dNick . ' :AddUser :'.$com[4].' As My '.$com[5] . CRL);
								fputs($fp,'NOTICE ' . $com[4] . ' :You`re Now Known As My '.$com[5].' Added By '.$dNick.' Now Type: pass <your pass> To Set Your Pass ' . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :salah Command! Type: adduser <nick> <master/user> ' . CRL); }
						} elseif ($auth["$dNick"]["status"]=="master") {
							if (!$auth["$com[4]"]) {
								if ($com[5]=="user") {
									$auth["$com[4]"]["name"] = $com[4];
									$auth["$com[4]"]["status"] = $com[5];
									fputs($fp,'NOTICE ' . $dNick . ' :AddUser :'.$com[4].' As My '.$com[5] . CRL);
									fputs($fp,'NOTICE ' . $com[4] . ' :You`re Now Known As My '.$com[5].' Added By '.$dNick.' Now Type: pass <your pass33] <Spyderur Pass ' . CRL);
								} else { fputs($fp,'NOTICE ' . $dNick . ' :Wrong Command! Type: adduser <nick> user ' . CRL); }
							} else { fputs($fp,'NOTICE ' . $dNick . ' :User Already Exist! Aborting AddUser! ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :Unknown Status! Your Status is '.$auth["$dNick"]["status"] . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':deluser' && $com[4]) {
					$com[4] = strtolower($com[4]);
					if ($auth["$dNick"]["auth"]==2) {
						if ($auth["$dNick"]["status"]=="Admin") {
							if ($auth["$com[4]"]["status"]=="master" || $auth["$com[4]"]["status"]=="user") {
								unset($auth["$com[4]"]);
								fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
								fputs($fp,'NOTICE ' . $com[4] . ' :Your Access As My User Has Been Deleted By '.$dNick . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :Wrong Command! Type: deluser <nick> ' . CRL); }
						} elseif ($auth["$dNick"]["status"]=="master") {
							if ($auth["$com[4]"]["status"]=="user") {
								unset($auth["$com[4]"]);
								fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
								fputs($fp,'NOTICE ' . $com[4] . ' :Your Access As My User Has Been Deleted By '.$dNick . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :Wrong Command! Type: deluser <nick> ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :Unknown Status! Your Status is '.$auth["$dNick"]["status"] . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"]) {
				if (ereg(":`",$com[3]) || ereg(":!",$com[3])) {
					$chan = strstr($dCommand,"#");
					$anick = str_replace("PRIVMSG ","",$dCommand);
					if ($com[3]==':!auth') {
						if ($auth["$dNick"]["auth"]==2) {
							fputs($fp,'NOTICE '.$dNick.' :You`re already Authorized!' . CRL);
						} else {
							$whois = $dNick;
							fputs($fp,'WHOIS '.$dNick . CRL);
						}
					} elseif ($com[3]==':`auth' && $chan) {
						if ($auth["$dNick"]["auth"]==2) {
							fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.' siap bos!' . CRL);
						} else { fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.' bukan bosku cok!' . CRL); }
					} elseif ($auth["$dNick"]["auth"]==2) {
						if ($com[3]==':`say' && $com[4] && $chan) {
							$msg = strstr($data,":`say");
							$msg = str_replace(":`say ","",$msg);
							fputs($fp,'PRIVMSG '.$chan.' :'.$msg. CRL);
						}
						elseif ($com[3]==':`act' && $com[4] && $chan) {
							$msg = strstr($data,":`act");
							$msg = str_replace(":`act ","",$msg);
							fputs($fp,'PRIVMSG '.$chan.' :ACTION '.$msg.''. CRL);
						}
						elseif ($com[3]==':`slap' && $com[4] && $chan) {
							fputs($fp,'PRIVMSG '.$chan.' :ACTION slaps '.$com[4].' Tepat Di jidat 4pake kursi, kompor, penggorengan, plus tahi kuda... 2JeGuuuERRR... PleeTHaaQQQ ... DeeZZiiNGhHH ... 12cukuliinn dach loe ... monyong² tuh jidat ... hahahahakZ :4P~'. CRL);
						}
						elseif ($com[3]==':`msg' && $com[4] && $com[5]) {
							$msg = strstr($data,":`msg");
							$msg = str_replace(":`msg $com[4] ","",$msg);
							fputs($fp,'PRIVMSG '.$com[4].' :'.$msg. CRL);
						}
						elseif ($com[3]==':`notice' && $com[4] && $com[5]) {
							$msg = strstr($data,":`notice");
							$msg = str_replace(":`notice $com[4] ","",$msg);
							fputs($fp,'NOTICE '.$com[4].' :'.$msg. CRL);
						}
						elseif ($com[3]==':`ctcp' && $com[4] && $com[5]) {
							$msg = strstr($data,":`ctcp");
							$msg = str_replace(":`ctcp $com[4] ","",$msg);
							fputs($fp,'PRIVMSG '.$com[4].' :'.$msg.''. CRL);
						}
						elseif ($com[3]==':`ping' && $chan) {
							$sml = $smile[rand(0,count($smile) - 1)];
							fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', PONG! '.$sml. CRL);
						}
						elseif ($com[3]==':`pong' && $chan) {
							$sml = $smile[rand(0,count($smile) - 1)];
							fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', PING! '.$sml. CRL);
						}
						elseif ($com[3]==':`info' && $auth["$dNick"]["status"]=="Admin") {
							$bhost = $_SERVER['HTTP_HOST'];
							$bphp  = $_SERVER['PHP_SELF'];
							fputs($fp,'NOTICE '.$dNick.' :Bot Host: '.$bhost.', Bot PHP: '.$bphp. CRL);
						}
						elseif ($com[3]==':`up' && $chan) {
							fputs($fp, 'PRIVMSG chanserv@services.dal.net :op '.$chan.' '.$nick . CRL);
						}
						elseif ($com[3]==':`down' && $chan) {
							fputs($fp, 'MODE '.$chan.' +v-o '.$nick.' '.$nick . CRL);
						}
						elseif ($com[3]==':`tsunami' && $com[4] && $auth["$dNick"]["status"]!="user") {
							$nicktsu = $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)];
							fputs($fp, 'NICK '.$nicktsu . CRL);
							if (substr($dCommand,0,3)=='433') {
								$nicktsu = $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)];
								fputs($fp, 'NICK '.$nicktsu . CRL);
							}
							$msg = strstr($data,":tsunami");
							$msg = str_replace(":tsunami $com[4]","",$msg);
							if (ereg("#", $com[4])) {
					   		  fputs($fp, 'JOIN '.$com[4] . CRL);
							}
							fputs($fp, 'PRIVMSG '.$com[4].' :'.$msg.'' . CRL);
							fputs($fp, 'NOTICE '.$com[4].' :'.$msg.'' . CRL);
							fputs($fp, 'PRIVMSG '.$com[4].' :TSUNAMI '.$msg.'' . CRL);
							fputs($fp, 'PRIVMSG '.$com[4].' :'.$msg.'' . CRL);
							fputs($fp, 'NOTICE '.$com[4].' :'.$msg.'' . CRL);

							fputs($fp, 'PRIVMSG '.$com[4].' :FLOOD '.$msg.'' . CRL);
							if (ereg("#", $com[4])) {
					   		  fputs($fp, 'PART '.$com[4].' :Complete' . CRL);
							  fputs($fp, 'NICK '.$nick . CRL);
							} else {
							fputs($fp, 'NICK '.$nick . CRL);
							}
						}
						elseif ($com[3]==':`cycle' && $chan && $auth["$dNick"]["status"]!="user") {
							$msg = strstr($data,":`cycle");
							if (ereg("#", $com[4])) {
					   		  $partchan = $com[4];
							  $msg = str_replace(":`cycle $com[4]","",$msg);
							} else {
					   		  $partchan = $chan;
							  $msg = str_replace(":`cycle","",$msg);
							}
							if (strlen($msg)<3) {
							  $msg = '';
							}
							fputs($fp, 'PART '.$partchan.' :'.$msg . CRL);
							fputs($fp, 'JOIN '.$partchan . CRL);
						}
						elseif ($com[3]==':`part' && $auth["$dNick"]["status"]=="Admin") {
							$msg = strstr($data,":`part");
							if (ereg("#", $com[4])) {
					   		  $partchan = $com[4];
							  $msg = str_replace(":`part $com[4]","",$msg);
							} else {
					   		  $partchan = $chan;
							  $msg = str_replace(":`part","",$msg);
							}
							if (strlen($msg)<3) {
							  $msg = '';
							}
							fputs($fp, 'PART '.$partchan.' :'.$msg . CRL);
							$remchan = strtolower($partchan);
							if (in_array($remchan, $channel)) {
								$channels = str_replace("$remchan ","",$channels);
								unset($channel);
								$channel = explode(" ", $channels);
							}

							foreach ($channel as $v) {
								fputs($fp, 'JOIN '.$v . CRL);
							}
						}
						elseif ($com[3]==':`join' && $com[4] && $auth["$dNick"]["status"]=="Admin") {
							if (!ereg("#",$com[4])) { $com[4]="#".$com[4]; }
							$addchan = strtolower($com[4]);
							if (!in_array($addchan, $channel)) {
								$channel[]=$addchan;
								$channels.="$addchan ";
							}
							foreach ($channel as $v) {
								sleep(rand(1,6));
								fputs($fp, 'JOIN '.$v . CRL);
							}
						}
						elseif ($com[3]==':`botnick' && $com[4] && !$chan && $auth["$dNick"]["status"]=="Admin") {
							$nick = $com[4];
							$identify = $com[5];
							fputs($fp, 'NICK '.$nick . CRL);
					     		fputs($fp, 'PRIVMSG nickserv@services.dal.net :identify '.$nick.' '.$identify.  CRL);
						}
						elseif ($com[3]==':`k' && $com[4] && $chan) {
							$msg = strstr($data,":`k");
							$msg = str_replace(":`k $com[4]","",$msg);
							fputs($fp, 'KICK '.$chan.' '.$com[4].' :'.$msg . CRL);
						}
						elseif ($com[3]==':`kb' && $com[4] && $chan) {
							$msg = strstr($data,":`kb");
							$msg = str_replace(":`kb $com[4]","",$msg);
							fputs($fp, 'KICK '.$chan.' '.$com[4].' :'.$msg . CRL);
							fputs($fp, 'MODE '.$chan.' +b '.$com[4] . CRL);
						}
						elseif ($com[3]==':`ganti') {
							$nick = $nicky[rand(0,count($nicky) - 1)];
							fputs($fp, 'NICK '.$nick . CRL);
							if (substr($dCommand,0,3)=='433') {
								$nick = $nicky[rand(0,count($nicky) - 1)];
								fputs($fp, 'NICK '.$nick . CRL);
							}
						}
						elseif ($com[3]==':`op' && $chan) {
							if ($com[4]) { $opnick = $com[4]; }
							else { $opnick = $dNick; }
							fputs($fp, 'MODE '.$chan.' +ooo '.$opnick.' '.$com[5].' '.$com[6] . CRL);
						}
						elseif ($com[3]==':`deop' && $chan) {
							if ($com[4]) { $opnick = $com[4]; }
							else { $opnick = $dNick; }
							fputs($fp, 'MODE '.$chan.' -o+v-oo '.$opnick.' '.$opnick.' '.$com[5].' '.$com[6] . CRL);
						}
						elseif ($com[3]==':`v' && $chan) {
							if ($com[4]) { $vonick = $com[4]; }
							else { $vonick = $dNick; }
							fputs($fp, 'MODE '.$chan.' +vvv '.$vonick.' '.$com[5].' '.$com[6] . CRL);
						}
						elseif ($com[3]==':`dv' && $chan) {
							if ($com[4]) { $vonick = $com[4]; }
							else { $vonick = $dNick; }
							fputs($fp, 'MODE '.$chan.' -vvv '.$vonick.' '.$com[5].' '.$com[6] . CRL);
						}
						elseif ($com[3]==':`awaymsg' && $auth["$dNick"]["status"]=="Admin") {
							$msg = strstr($data,":`awaymsg");
							$msg = str_replace(":`awaymsg","",$msg);
							if (strlen($msg)<3) {
							  $raway="on";
							  fputs($fp,'AWAY : ' . 'AWAY' . CRL);
							} else {
							  $raway="off";
							  fputs($fp,'AWAY : ' . $msg . CRL);
							}
						}
						elseif ($com[3]==':`mode' && $com[4] && $chan) {
							fputs($fp, 'MODE '.$chan.' :'.$com[4].' '.$com[5] . CRL);
						}
						elseif ($com[3]==':`nickmode' && $com[4]) {
							$nickmode = $com[4];
							fputs($fp, 'MODE '.$nick.' :'.$nickmode . CRL);
						}
						elseif ($com[3]==':`chanlist') {
							fputs($fp, 'NOTICE '.$dNick.' :Channel List: '.$channels . CRL);
						}
						elseif ($com[3]==':`userlist') {
							$userlist="";
							foreach ($auth as $user) {
							  if ($user["pass"]) { $pass="-pass ok"; }
							  else { $pass="-no pass"; }
							  $userlist .= $user["name"].'('.$user["status"].$pass.') ';
							}
							fputs($fp, 'NOTICE '.$dNick.' :User List: '.$userlist . CRL);
						}
						elseif ($com[3]==':`quit' && $auth["$dNick"]["status"]=="Admin") {
							$msg = strstr($data,":`quit");
							$msg = str_replace(":`quit","",$msg);
							if (strlen($msg)>3) {
							  $msg = str_replace(" ","_",$msg);
							}
							$quit1 = array("ngantor","nguantuk","sama","brb","bye_all","s33_you","excess_flood","pingtimeout","hehe","bye","mandi","makan","muuah","quit","conection_reset_bay_peer","banned","part","leaving","ada_deh","call_me","wew","toronto.hub.dal.net_brodway.dal.net","no_komen","restart");
							$quitmsg = $quit1[rand(0,count($quit1) - 1)];
							fputs($fp, 'QUIT ' . $quitmsg . CRL);
							$keluar = 1;
							exit;
						}
						elseif ($com[3]==':`vhost' && $auth["$dNick"]["status"]=="Admin") {
							if ($com[4]) { $localhost = $com[4]; }
							else { $localhost = 'localhost'; }
							$keluar = 0;
							fputs($fp, 'QUIT ' . CRL);
						}
						elseif ($com[3]==':`jump' && $auth["$dNick"]["status"]=="Admin") {
							if (!eregi(".dal.net",$com[4])) {
							  $remotehost = "irc.dal.net";
							} else { $remotehost = $com[4]; }
							$keluar = 0;
							fputs($fp, 'QUIT changging_server' . CRL);
						}
						elseif ($com[3]==':`ident' && $auth["$dNick"]["status"]=="Admin") {
							if (!$com[4]) {
							  $username = $username;
							} else { $username = $com[4]; }
							$keluar = 0;
							fputs($fp, 'QUIT ganti_ident' . CRL);
						}
						elseif ($com[3]==':`fullname' && $auth["$dNick"]["status"]=="Admin") {
							if (!$com[4]) {
							  $realname = "--";
							} else { $realname = $com[4]; }
							$keluar = 0;
							fputs($fp, 'QUIT ganti_fullname' . CRL);
						}
						elseif ($com[3]==':`topic' && $com[4] && $chan) {
							$msg = strstr($data,":`topic");
							$msg = str_replace(":`topic ","",$msg);
							fputs($fp, 'TOPIC '.$chan.' :'.$msg . CRL);
						}
						elseif ($com[3]==':!help' && !$chan) {
							fputs($fp,'PRIVMSG '.$dNick.' :Secret Help' . CRL);
						}
					} else { fputs($fp,'NOTICE '.$dNick.' :Please Auth First! Type: auth <your pass> To Authorized '. CRL); }
				}
				}
				elseif (!$auth["$dNick"] && !eregi("auth",$iText)) {
					if (eregi("www.",$iText) || eregi("http:",$iText) || eregi("join #",$iText)) {
						if (!ereg("#",$dCommand)) {
							if ($log=="on") {
								fputs($fp,'PRIVMSG '. $Admin .' :4inviter: ' . $dFrom . '2:' .$iText. CRL);
							}
							$inv = strstr($dFrom,'@');
							foreach ($auth as $user) {
								if ($user["status"]=="user") {
									fputs($fp, 'NOTICE '.$user["name"].' :KB '.$chan.' '.$dNick.' '.$inv.'' . CRL);
								}
							}
						}
					}
					elseif (!ereg("#",$dCommand)) {
						if ($log=="on") {
							fputs($fp,'PRIVMSG '.$Admin.' :6' . $dFrom . '12:' .$iText. CRL);
						}
					}
				}
				}
			}
			elseif (substr($data,0,4) == 'PING') {
				fputs($fp,'PONG ' . substr($data,5) . CRL);
					$smile = $querym[rand(0,count($querym) - 1)];
					$kata1 = $usr1[rand(0,count($usr1) - 1)].$usr1[rand(0,count($usr1) - 1)].$usr1[rand(0,count($usr1) - 1)];
					$kata2 = $usr1[rand(0,count($usr1) - 1)].$usr1[rand(0,count($usr1) - 1)].$usr1[rand(0,count($usr1) - 1)];
					fputs($fp,'PRIVMSG #whatz :' . $kata1 . ' ' . $kata2 . $smile . CRL);
			}
		}
	}
	fclose ($fp);
} while ($keluar==0);
}
working($nick);
?>




