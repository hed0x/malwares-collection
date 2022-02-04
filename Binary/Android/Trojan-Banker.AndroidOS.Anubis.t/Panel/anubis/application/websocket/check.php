<?php
session_start();
$statusCode=false;
if(!(isset($_SESSION['panel_user'])))
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
	include '../../config.php';
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');
	$statement = $connection->prepare("SELECT * FROM ws WHERE id='1'");
	$statement->execute();

		global $botid;
		global $lastconnect;//будет как таймер
		foreach($statement as $row){
			$botid = $row['botid'];
			$lastconnect = $row['lastconnect'];
		}
		//$lastconnect = date('Y-m-d H:i');
		$seconds=-1;
		if(strlen($lastconnect)>5){
		//******Получаем иконку состояния бота, вычисляем дату****
			$arr_data_from = explode(" ", $lastconnect);
			$arr_data_till = explode(" ", date('Y-m-d H:i'));

			$date_from = $arr_data_from[0];
			$date_till = $arr_data_till[0];

			$date_from = explode('-', $date_from);
			$date_till = explode('-', $date_till);

			$time_from = mktime(0, 0, 0, $date_from[1], $date_from[2], $date_from[0]);
			$time_till = mktime(0, 0, 0, $date_till[1], $date_till[2], $date_till[0]);

			$day = ($time_till - $time_from)/60/60/24; //получаем разницу кол-во дней!
			//----------Секунды!-------/
			$date1 = new \DateTime($lastconnect);
			$date2 = new \DateTime(date('Y-m-d H:i'));
			$diff = $date2->diff($date1);
			// разница в секундах
			$seconds = ($diff->y * 365 * 24 * 60 * 60) + //получаем разницу в секундах!
			($diff->m * 30 * 24 * 60 * 60) +
			($diff->d * 24 * 60 * 60) +
			($diff->h * 60 * 60) +
			($diff->i * 60) +
			$diff->s;
		}
		$strSecond = '';
		if(($seconds>=0)&&($seconds<=14)){
			$strSecond = "Connected";
		}
			echo "ID Bots: <a>$botid</a></br>";
			echo "Status: <a style='color: #5ad65a'>$strSecond</a>";
}
?>
