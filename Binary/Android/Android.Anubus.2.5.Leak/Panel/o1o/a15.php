<?php
include 'crypt.php';
include 'config.php';

$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);

$request = mb_substr($request, 0, mb_strlen($request));
$request =  decrypt($request,cryptKey);
$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');

$boo = false;

if (preg_match("/sendsms/",$request)){
  $arraynumberSend = explode('sendsms',$request);
  $numberSend = $arraynumberSend[1];

  $statement = $connection->prepare("UPDATE smsspam SET status = '2' WHERE number = '$numberSend'");
  $statement->execute([$numberSend]);
}

if (preg_match("/errorsms/",$request)){
  $arraynumberError = explode('errorsms',$request);
  $numberError = $arraynumberError[1];

  $statement = $connection->prepare("UPDATE smsspam SET status = '0' WHERE number = '$numberError'");
  $statement->execute([$numberError]);
}

if (preg_match("/getnumber/",$request)){
  $connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
  $connection->exec('SET NAMES utf8');
  $sql = "SELECT * FROM smsspam";
  foreach($connection->query($sql) as $row){
    $number = $row['number'];
    $status = $row['status'];
    if($status=="0"){
      $statement = $connection->prepare("UPDATE smsspam SET status = '1' WHERE number = '$number'");
  		$statement->execute([$number]);

      $tag = "<tag>";
    	$otv = encrypt("$number",cryptKey);
    	$tagend = "</tag>";
    	echo "$tag$otv$tagend";

      $boo = true;
      break;
    }
  }
}
if(!$boo){
  $tag = "<tag>";
	$otv = encrypt("close",cryptKey);
	$tagend = "</tag>";
	echo "$tag$otv$tagend";
}
?>
