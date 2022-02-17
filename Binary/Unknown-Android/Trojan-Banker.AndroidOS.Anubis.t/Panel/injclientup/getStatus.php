<?php
include "config.php";
if (isset($_REQUEST["p"])) {
$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
$massivReq = explode("|", $request);
	if($massivReq[0] == md5($_SERVER['SERVER_NAME'])||($massivReq[0] == md5(getURL_SERVER()))){
		if($massivReq[1]==$URL){
			echo "OK|Injections|";
		}else{
			echo "NO|Injections|";
		}
	}
}
function getURL_SERVER(){
	$protocol=empty($_SERVER['HTTPS'])?'http://':'https://';
	$SERVER_NAME = $_SERVER['SERVER_NAME'];
	return "$protocol$SERVER_NAME";
}

?>