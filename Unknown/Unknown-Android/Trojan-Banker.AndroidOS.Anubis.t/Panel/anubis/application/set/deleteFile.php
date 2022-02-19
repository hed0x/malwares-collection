<?php
session_start();
$statusCode=false;
include "../../config.php";
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

	$type=htmlspecialchars(isset($_GET["t"]) ? $_GET["t"] : "");
	$file=htmlspecialchars(isset($_GET["f"]) ? $_GET["f"] : "");
	if(($type=="nums")&&($file != "")){
		$path = "../datalogs/numers/$file.html";
		unlink("$path");
		header ("Location:/".namefolder."/?cont=numbers");
	}
	if(($type=="files")&&($file != "")){
		$path = "../datalogs/files/$file";

		unlink("$path");
		header ("Location:/".namefolder."/?cont=files");
	}
}
?>
