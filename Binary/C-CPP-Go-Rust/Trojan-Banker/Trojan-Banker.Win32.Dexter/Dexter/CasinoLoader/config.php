<?php
    //Connect to shitty DB
	$dbname = "nasproject";
	$user = "badroot";
	$pw = "toor";
    $link = mysql_connect('localhost',$user,$pw);
    $db = mysql_select_db($dbname,$link);
    /////////////////////////////////////////
?>