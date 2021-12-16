#!/usr/bin/perl

use BOHTTPD;
use CGI;

print qq{Content-type: text/html\n\n};

my $cgi = new CGI;
my $Q = html_escape($cgi->param('q'));

BOHTTPD::show_header;

print qq<
  <form>
  <table><tr>
    <td>Query</td>
    <td><input name=q size=80 value="$Q"></td>
  </tr>
  <tr><td colspan=2 align=center>
    <input type=submit value="Search!">
  </table>
  </form>
>;

if (my $q = $cgi->param('q')) {
  my $dt = $cgi->param('dt') || 600;
  my @u = BOHTTPD::db_search($q, $dt);

  if (@u) {
    print qq<<hr><ul>>;
    for my $url (@u) {
      my $URL = html_escape($url);
      print qq<<li><a href="$URL">$URL</a>>;
    }
    print qq<</ul>>;
  } else {
    print "<hr>No matches found.\n";
  }
}

BOHTTPD::show_footer;
