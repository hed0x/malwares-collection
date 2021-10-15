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
		 //передаем данные для выпонения команд!!!-----
		if((isset($_POST["EDITUSER"]))&&($statusCode))
		{
			include '../../config.php';
			$id = $_POST['getID'];
			$login = $_POST['login'];
			$pass = $_POST['password'];
			$password = md5("$login $pass $login");
			$right = $_POST['RIGHT'];
			$tag = $_POST['tag'];

			$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connect->exec('SET NAMES utf8');

			$sql = "UPDATE t_users SET login='$login', password='$password', right_='$right',tag='$tag' WHERE id='$id';";
			$connect->query($sql);

		header("Location: /".namefolder."/index.php?cont=settings&page=users");
		}
?>
