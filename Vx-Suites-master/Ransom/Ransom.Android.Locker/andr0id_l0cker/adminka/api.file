<?php

function Param($var) {
	$val = '';
	if (isset($_POST[$var])) $val = $_POST[$var];
	if (isset($_GET[$var])) $val = $_GET[$var];
	return $val;
}

$sitename="_api";


//login & pass
$admin_login = 'admin';
$admin_pass = 'admin';


//MySQL
$mysql_host="localhost";
$mysql_login="root";
$mysql_password="admin!";
$my_database="mobile";



$globalcurrentdatetime = time();
$method = Param('method');

if (strlen($method)==0){
	$res_ar = array('result' => '100', 'error' => 'Invalid method');
	echo json_encode($res_ar);
	return;
}



if($method !== 'counter' && $method !== 'alladd' && $method !== 'launcher' && $method !== 'devicestatus'){

    $loggined = false;
    
    if(isset($_POST['login'])){
        if(!empty($_POST['login']) && !empty($_POST['pass'])){
            if($_POST['login'] == $admin_login && $_POST['pass'] == $admin_pass){
                $loggined = true;
                setcookie('log', md5(md5(md5(md5($admin_login.$admin_pass)))), time()+86400, '/');
            }
        }
        
    }elseif(!empty($_COOKIE['log'])){
        if($_COOKIE['log'] ==  md5(md5(md5(md5($admin_login.$admin_pass))))){
            $loggined = true;
            setcookie('log', md5(md5(md5(md5($admin_login.$admin_pass)))), time()+86400, '/');  
        }
    }
    
    if($method == 'logout'){
        
        setcookie('log', '', time(), '/');
        header('Location:index.php');
        exit();
        
    }

    if($loggined==false){
        header('Location:index.php');
        exit();
    }

}







if ($method=='counterdel' || $method=='counter' || $method=='alladd' || $method=='alldel'|| $method=='allview' || $method=='export' || $method=='used' || $method=='clear' || $method=='launcher' || $method=='devicestatus' || $method=='deviceunlock' ){}
else{
	$res_ar = array('result' => '100', 'error' => 'Invalid method');
	echo json_encode($res_ar);
	return;
}

$appkey=Param('app_key');
$ak='f5h3d8jh2g6nv6gk7g2was1g4ncmpu3';

if($method == 'alladd'){
    if ($appkey!=$ak){
    	$res_ar = array('result' => '101', 'error' => 'Error');
    	echo json_encode($res_ar);
    	return;
    }
}


//соединение с БД
$link = mysql_connect($mysql_host, $mysql_login, $mysql_password) or die ("Database connection ERROR. Please, contact with authors.");
mysql_select_db ($my_database) or die ("Database ERROR. Please, contact with authors.");


require_once($method.".php");


?>