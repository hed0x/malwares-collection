#!/usr/bin/perl -sw
use strict;

my $LINE = "  %-30s /* %-32s */\n";

$::identifier = 'main' if (!defined($::identifier));
$::size = '' if (!defined($::size));
$::align = '8' if (!defined($::align));
$::section = '.text' if (!defined($::section));

printf "const unsigned char %s[%s]\n", $::identifier, $::size;
print "__attribute__ (( aligned($::align), section(\"$::section\") )) =\n";
print "{\n";

my $code_size = 0;
my @line;
while(<>)
{
  s/^\s+//;		# trim leading white space
  s/\s+$//;		# trim trailing white space
  s/\s+[!;].*//;	# trim trailing comments

  my $addr = (split(/[:\s]+/))[0];
  s/[A-Fa-f0-9]+:?\s+//;

  my @code = split(/\s\s+/);
  my $code = $code[0];
  $code =~ s/\s//g;	# make objdump look like ndisasm

  $code_size += length($code) / 2;
  my $dump = '0x' . substr($code, 0, 2);
  for(my $i = 2; $i < length($code); $i += 2)
  {
    $dump .= ',0x' . substr($code, $i, 2);
  }
  push @line, [ $addr . ': ' . join(' ', @code[1..$#code]), $code, $dump ]
}

my $nr = 0;
my $max = $#line;
$max -= 1 if (defined($::last_line_is_ofs));
while($nr < $max)
{
  printf $LINE, $line[$nr][2] . ',', $line[$nr][0];
  $nr++;
}
printf $LINE, $line[$nr][2], $line[$nr][0];
printf "}; /* %d bytes (%#x) */\n", $code_size, $code_size;
if (defined($::last_line_is_ofs))
{
  my $ofs = substr($line[$nr + 1][1], -2, 2);
  printf "enum { ENTRY_POINT_OFS = 0x%x };\n", hex($ofs);
}
