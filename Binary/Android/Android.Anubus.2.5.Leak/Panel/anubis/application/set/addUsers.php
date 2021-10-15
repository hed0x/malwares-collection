<?php
session_start();
$statusCode=false;
if(!(isset($_SESSION['panel_user']))){
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
		//передаем данные для выпонения команд!!!-----
		if((isset($_POST["ADDUSER"]))&&($statusCode)){
			include '../../config.php';
			$login = $_POST['login'];
			$pass=$_POST['password'];
			$password = md5("$login $pass $login");
			$right = $_POST['RIGHT'];
			$tag = $_POST['tag'];

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into t_users (login,password,right_,status,tag)
			value ('$login','$password','$right','Disabled','$tag')");

					header("Location: /".namefolder."/index.php?cont=settings&page=users");
		}
?>
