<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<?php  session_start(); header('Content-type: text/html; charset=utf-8');
$statusCode=false;
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: login.php");
}else{

	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: login.php");
	}else{
		$statusCode=true;
	}
}
if($statusCode){
include_once "config.php";
	try {
	    $conn = new  PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(PDOException $e) {
	    header("Location:setdb.php");
	}

?>
<html>
<head >
<title>Anubis 2.5</title>



<link href="styles/menu.css" rel="stylesheet"/>
<link href="styles/index.css" rel="stylesheet"/>
<link href="styles/btn.css" rel="stylesheet"/>
<link href="styles/modul_form.css" rel="stylesheet"/>
<link rel="stylesheet" href="styles/style.css"/>
<link href="styles/modul_form_log.css" rel="stylesheet"/>
<link href="styles/modul_form_set.css" rel="stylesheet"/>

<link rel="stylesheet" href="styles/fa_fa/css/font-awesome.min.css">


<link rel="shortcut icon" href="/images/icon3.png" type="image/png"/>



<script src="styles/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<link href="styles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="styles/bootstrap/css/style.css"/>
<script src="styles/bootstrap/js/bootstrap.min.js"></script>
<script src="js/alert.js"></script>
<script src="js/amrnb.js" defer></script>
<!--
<script src="styles/bootstrap/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.0/css/bootstrap.css"    rel="stylesheet">
-->
</head>

 <body bgcolor="#171717" background="images/fon.jpg">


<?php

include_once "application/utils/classUsersRights.php";
include_once "application/utils/utils.php";
include_once 'application/database/webSocket.php';
include_once "header.php";

$id = isset($_GET['cont']) ? $_GET['cont'] : "";
	if($id=="bots"){
		include_once "application/views/botstable.php";
	}elseif($id=="statistic"){
		include_once "application/views/statistic.php";
	}elseif($id=="cards"){
		include_once "application/views/cardstable.php";
	}elseif($id=="injections"){
		include_once "application/views/injections.php";
	}elseif($id=="maps"){
		include_once "application/views/maps.php";
	}elseif($id=="ws"){
		include_once "application/views/webSocket.php";
	}elseif($id=="files"){
		include_once "application/views/files.php";
	}elseif($id=="numbers"){
		include_once "application/views/dumpNumbers.php";
	}elseif($id=="commands"){
		include_once "application/views/commands.php";
	}elseif($id=="spam"){
		include_once "application/views/spam.php";
	}elseif($id=="settings"){
		include_once "application/views/settingsPanel.php";
	}elseif($id=="exit"){
		session_destroy();
			echo "<script>window.location.replace('login.php');</script>";
		//header('Location: login.php');
		exit;
	}else{
	//	header("Location:?cont=bots&page=1");
		echo "<script>window.location.replace('?cont=bots&page=1');</script>";
	}

	if($id == null)	echo "<script>window.location.replace('?cont=bots&page=1');</script>";//header("Location:?cont=bots&page=1");
?>


</html>
<?php } ?>
