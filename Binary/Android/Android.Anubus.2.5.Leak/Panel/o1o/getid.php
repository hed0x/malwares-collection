<?php
$getIdBotWindows = htmlspecialchars($_REQUEST["id"], ENT_QUOTES);
include 'config.php';

$connection2 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection2->exec('SET NAMES utf8');

$statement2 = $connection2->prepare("SELECT * FROM idbotwindows");
$statement2->execute([$getIdBotWindows]);

$isIdBotWin = false;
foreach($statement2 as $row){
	if (preg_match("/$getIdBotWindows/",$row['idbot'])){
		$isIdBotWin=true;
	}
}
if($isIdBotWin){
	echo "exist";
}else{
	echo "no";
}
?>
