<?php
$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include 'crypt.php';
include 'config.php';
$request = decrypt($request,cryptKey);

$massivReq = explode(":", $request);
$IMEI = isset($massivReq[0]) ? $massivReq[0] : "";
$lat = isset($massivReq[1]) ? $massivReq[1] : "";
$lon = isset($massivReq[2]) ? $massivReq[2] : "";
$netgps = isset($massivReq[3]) ? $massivReq[3] : "";

if(($IMEI!="")&&($lat!="")&&($lon!="")&&($netgps!=""))
{
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$statement = $connection->prepare("SELECT name FROM markers WHERE name='$IMEI'");
	$statement->execute([$IMEI_log]);

	$data_time = date('Y-m-d H:i');
	$booIMEI = false;

	foreach($statement as $row)
	{
		if($row['name']==$IMEI)
		{
			$booIMEI=true;
			break;
		}
	}
	if($booIMEI == false)
	{

	$a1 = array("Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K"
	,"L","Z","X","C","V","B","N","M","q","w","e","r","t","y","u","i","o","p","a","s","d"
	,"f","g","h","j","k","l","z","x","c","v","b","n","m");
	$typeR  = $a1[rand(0, 51)];

		$statement = $connection->prepare("insert into markers (name, lat, lng, type, provayder, time)
		value ('$IMEI','$lat','$lon', '$typeR','$netgps','$data_time')");
		$statement->execute(array($IMEI,$lat,$lon,$typeR,$netgps,$data_time));
	}
	else
	{
		$statement = $connection->prepare("UPDATE markers SET name = '$IMEI', lat='$lat', lng='$lon', provayder='$netgps', time = '$data_time' WHERE name = '$IMEI'");
		$statement->execute(array($IMEI,$lat,$lon,$netgps,$data_time));
	}
}
?>
