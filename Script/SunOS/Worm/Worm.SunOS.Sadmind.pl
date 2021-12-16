#!/usr/bin/perl

use Getopt::Long;

      $addr[0] = int(rand(254)+1);
      $addr[1] = int(rand(255));
      $b_ip = "$addr[0].$addr[1]";
print $b_ip;
