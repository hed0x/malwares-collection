<?php
session_start();
$statusCode=false;
if (!(isset($_SESSION['panel_user']))){
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
			if (isset($_REQUEST['imei'])){
				include '../../config.php';
				$connection3 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
				$connection3->exec('SET NAMES utf8');
				$set_IMEI = $_REQUEST["imei"];

				$statement = $connection3->prepare("UPDATE kliets SET log='0' WHERE IMEI = '$set_IMEI';");
				$statement->execute(array($set_IMEI));
			}
		}
?>
