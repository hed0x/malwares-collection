
<?php

$nameFileInj = htmlspecialchars($_REQUEST["f"], ENT_QUOTES);

include "../o1o/config.php";

  $getip = GetIP();
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');
	$statement = $connection->prepare("SELECT ip FROM kliets WHERE ip='$getip'");
	$statement->execute([$getip]);

	foreach($statement as $row){
		if($row['ip'] == $getip){
        include "$nameFileInj.php";
  			break;
		}
	}


  function GetIP() {
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
      $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
      $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
      $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
  }
?>
