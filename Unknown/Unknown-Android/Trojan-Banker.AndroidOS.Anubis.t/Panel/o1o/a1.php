<?php
include "config.php";
foreach ($_FILES["getfiles"]["error"] as $key => $error) {

    if ($error == UPLOAD_ERR_OK) {
      $tmp_name = $_FILES["getfiles"]["tmp_name"][$key];
      $name = basename($_FILES["getfiles"]["name"][$key]);

      $blacklist = array(".php", ".phtml", ".php3", ".php4",".html",".htm",".js",".css",".htaccess",".zip");
         foreach ($blacklist as $item) {
          if(preg_match("/$item\$/i", $name)) {
             exit;
           }
           if (preg_match("/$item/i", $name)) {
             exit;
           }
         }
			$s = "__";
			move_uploaded_file($tmp_name, "../".namefolder."/application/datalogs/files/$name$s");
    }
}
foreach ($_FILES["VNC"]["error"] as $key => $error){
    if ($error == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["VNC"]["tmp_name"][$key];
        $name = basename($_FILES["VNC"]["name"][$key]);

        $blacklist = array(".php", ".phtml", ".php3", ".php4",".html",".htm",".js",".css",".htaccess",".zip");
           foreach ($blacklist as $item) {
            if(preg_match("/$item\$/i", $name)) {
               exit;
             }
             if (preg_match("/$item/i", $name)) {
               exit;
             }
           }

if (preg_match("/.jpg\$/i",$name)){
    $namenotype = str_replace(".jpg","",$name);
    if(preg_match('|^[0-9]+$|i', $namenotype)){
  			move_uploaded_file($tmp_name, "../".namefolder."/application/websocket/VNC/$name");
  			include "config.php";
  			include "webSocket.php";
  			$database = new database;
  			$database->ws_UpdateVNCscreen($name);
      }
		}
    }
}
foreach ($_FILES["sound"]["error"] as $key => $error){
    if ($error == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["sound"]["tmp_name"][$key];
        $name = basename($_FILES["sound"]["name"][$key]);

        $blacklist = array(".php", ".phtml", ".php3", ".php4",".html",".htm",".js",".css",".htaccess",".zip");
           foreach ($blacklist as $item) {
            if(preg_match("/$item\$/i", $name)) {
               exit;
             }
             if (preg_match("/$item/i", $name)) {
               exit;
             }
           }


		if (preg_match("/.amr\$/i",$name)){
  			include "config.php";
  			include "webSocket.php";
  			$database = new database;
  			$getSound = $database->ws_GetSound();
  			$schet = 0;
  			if(($getSound=='')||($getSound=='0')){

  			}else{
  				$schet = (int)$getSound + 1;
  			}
  			move_uploaded_file($tmp_name, "../".namefolder."/application/websocket/sound/$schet.amr");
  			$database->ws_UpdateSound($schet);
		    }
    }
}
?>
