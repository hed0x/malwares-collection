<?php
//Запуск сессий;
session_start();

if (isset($_POST['login']) && isset($_POST['password']))
{
include_once "config.php";
include_once "msg.php";
// получаем данные из формы с авторизацией
$login = $_POST['login'];
$pass = $_POST['password'];
$password = md5("$login $pass $login");
//проверка пароля и логина
$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');
$sql = "SELECT * FROM t_users";

	$login_ = "";
	$password_ =  "";
	$right_ =  "";
	$status_ = "";

	foreach($connection->query($sql) as $row)
	{
		$login_ = $row['login'];
		$password_ = $row['password'];
		$right_ = $row['right_'];
		$status_ = $row['status'];

		if($login_ == $login) break;
	}

	if (($login == $login_)&&($password == $password_))
	{
		$_SESSION['panel_user']=$login;
		$_SESSION['panel_right']=$right_;
		$_SESSION['panel_status']=$status_;


		$_SESSION['sort_kat']="all";
		$_SESSION['sortCountry']="all";
		$_SESSION['color']="all";
		$_SESSION['versions']="all";
		$_SESSION['bank']="all";
		$_SESSION['packBank']="all";

		setcookie("msg");
		header("Location: index.php");
	}
	else
	{
		setcookie("msg", "!");

		header("Location: index.php");
	}
}
?>
