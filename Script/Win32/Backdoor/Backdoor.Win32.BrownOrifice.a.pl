#!/usr/bin/perl

package BOHTTPD_download;

use BOHTTPD;
use CGI;

my $cgi = new CGI;

sub show_download {
  print qq<
    <h3>Download BOHTTPD Source Code</h3>
      <p>By downloading BOHTTPD, you, your children, and your friends are implicitly 
        agreeing to the terms set forth by the
           <a href="/pirate.gif">ClosedSource<sup>TM</sup> License</a>.</p>
    <ul>
      <li><code><a href="BOHTTPD-0.1.tar.gz">BOHTTPD-0.1.tar.gz</a>&nbsp;&nbsp;[<a href="BOHTTPD-0.1.tar.gz.md5">md5sum</a>]</code>
      <li><code><a href="BOHTTPD-0.1.tar.bz2">BOHTTPD-0.1.tar.bz2</a> [<a href="BOHTTPD-0.1.tar.bz2.md5">md5sum</a>]</code>
      <li><code><a href="BOHTTPD-0.1.zip">BOHTTPD-0.1.zip</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="BOHTTPD-0.1.zip.md5">md5sum</a>]</code>
    </ul>
  >
}

print "Content-type: text/html\n\n";
show_header;
show_download;
show_footer;

1
