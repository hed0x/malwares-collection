/***********************************
    功能：登录处理
    作者：王秋实
***********************************/

var gLanguage = {

    EN:{
        "Help":"Help",
        "Pre_sales":"Pre-sales",
        "After_sale":"After-sales",
        "pc_config":"Client Config(Foxmail/Outlook/Mobile phone etc.)",
        "phone_config":"phone config",
        "enterAccount":"Please enter the account",
        "enterPassword":"Please enter the password",
        "saveName":"Save name",
        "CN":"Simplified Chinese",
        "HK":"Traditional Chinese",
        "EN":"English",
        "useAdmin":"Admin Login",
        "login":"Sign in",
        "logining": "Signing in",
        "Pre_saleLink":"Pre-sales:300.cn",
        "After_salePheon":"After_sales: 4006605555",
        "loginEnt":"Login",
        "refresh":"Can't see",
        "account":"enter account",
        "email":"enter a valid email",
        "password":"enter password",
        "idfEmpty":"enter verification code",
        "idfWrong":"verification code error",
        "acctWrong":"account or password is wrong",
        "Copyright":"Copyright &copy;  300.cn All Rights Reserved ",
        
        "href_help":"/page/help/help.html?l=en",
        "href_clientconfig": "/page/help/mailConfig/config/index.html?l=en",
        "SSL": "SSL",
        "ie6_tips": "IE browser version you are currently using is too low, this will result in some page can not be displayed, poor stability, it is strongly recommended that you use IE7 and above browsers or replacement for Firefox / chrome and other browsers.",
        "forgetPassword": "password?",
        "adminAccountInfo": "Your administrator’s  account is admin or sysadmin!",
        
        "temp": ''
    },

    CN:{
        "Help":"帮助中心",
        "Pre_sales":"售前咨询",
        "After_sale":"售后服务",
        "pc_config":"客户端配置（Foxmail/Outlook/手机等）",
        "phone_config":"手机端配置",
        "enterAccount":"请输入帐号",
        "enterPassword":"请输入密码",
        "saveName":"记住用户名",
        "CN":"简体中文",
        "HK":"繁体中文",
        "EN":"English",
        "useAdmin":"以管理员身份登录",
        "login":"登录",
        "logining": "正在登录",
        "Pre_saleLink":"售前咨询:联系中企各分支机构",
        "After_salePheon":"售后服务:4006605555",
        "loginEnt":"登录企业邮箱",
        "refresh":"看不清",
        "account":"请输入帐号",
        "email":"请输入正确邮箱账户",
        "password":"请输入密码",
        "idfEmpty":"请输入验证码",
        "idfWrong":"验证码错误",
        "acctWrong":"账户或密码错误",
        "Copyright":"Copyright &copy; 2016 中企动力科技股份有限公司  版权所有",
        	
        "href_help":"/page/help/help.html?l=cn",
        "href_clientconfig": "/page/help/mailConfig/config/index.html?l=cn",
        "SSL": "安全登录(SSL加密)",
        "ie6_tips": "您当前使用的IE浏览器版本过低，这样会导致部分页面无法显示，稳定性差，强烈建议您使用IE7及以上版本浏览器或更换为火狐/chrome等浏览器。",
        "forgetPassword": "忘记密码了？",
        "adminAccountInfo": "您的超级管理员账号为admin或者sysadmin ！",
        
        "temp": ''
    },

    HK:{
        "Help":"幫助中心",
        "Pre_sales":"售前咨詢",
        "After_sale":"售後服務",
        "pc_config":"客戶端配置（Foxmail/Outlook/手機等）",
        "phone_config":"手機端配置",
        "enterAccount":"請輸入帳號",
        "enterPassword":"請輸入密碼",
        "saveName":"記住用戶名",
        "CN":"簡體中文",
        "HK":"繁體中文",
        "EN":"English",
        "useAdmin":"以管理員身份登錄",
        "login":"登錄",
        "logining": "正在登錄",
        "Pre_saleLink":"售前咨詢:聯系中企各分支機構",
        "After_salePheon":"售後服務:4006605555",
        "loginEnt":"登錄企業郵箱",
        "refresh":"看不清",
        "account":"請輸入帳號",
        "email":"請輸入正確郵箱賬戶",
        "password":"請輸入密碼",
        "idfEmpty":"請輸入驗證碼",
        "idfWrong":"驗證碼錯誤",
        "acctWrong":"賬戶或密碼錯誤",
        "Copyright":"Copyright &copy; 2016 中企動力科技股份有限公司  版權所有",
        
        "href_help":"/page/help/help.html?l=hk",
        "href_clientconfig": "/page/help/mailConfig/config/index.html?l=hk",
        "SSL": "安全登錄(SSL加密)",
        "ie6_tips": "您當前使用的IE瀏覽器版本過低，這樣會導致部分頁面無法顯示，穩定性差，強烈建議您使用IE7及以上版本瀏覽器或更換為火狐/chrome等瀏覽器",
        "forgetPassword": "忘記密碼了？",
        "adminAccountInfo": "您的管理員賬號為admin或者sysadmin ！",
        
        "temp": ''
    }

};


/*
    Login 登录类
    参数:账户，密码
*/

function getLanguage(aKey){
    var language = $.cookie( 'zmail300_language' );
    if(!language){
        language = "CN";
    }
    if(!$.zWebLanguage){
        language = "CN";
    }
    if(!gLanguage[language]){
        return "";
    }
    return gLanguage[language][aKey] || "" ;
}


function Login(account,password){
    this.account = account;
    this.password = password;
    this.msgMap = {
       account:function(){return getLanguage("account");},
       email:function(){return getLanguage("email");},
       password:function(){return getLanguage("password");},
       idfEmpty:function(){return getLanguage("idfEmpty");},
       idfWrong:function(){return getLanguage("idfWrong");},
       acctWrong:function(){return getLanguage("acctWrong");}
    };
}
/*
    Login的原型
*/
Login.prototype = {
    // 检测账户格式
    checkAcct : function(){
        if(this.account.length <= 0){
            this.showErr(this.msgMap.account());
            return false;
        }
        //var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
        var reg = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
        if(!reg.test(this.account))
        {
             this.showErr(this.msgMap.email());
             return false;
        }
        return true;
    },
    // 检测密码格式
    checkPwd : function(){
        if(this.password.length <= 0){
            this.showErr(this.msgMap.password());
            return false;
        }
        return true;
    },
    // 展示错误信息
    showErr : function(errMsg){
        alert(errMsg);
    }
};
var cookie = function(key, value, options){
    if(typeof value=="undefined"){
        value=null;
        if(document.cookie && document.cookie!=''){
            var arr = document.cookie.split(";");
            for(var i=0;i<arr.length;i++){
                var c = arr[i];
                if ($.trim(c.substring(0, key.length + 1)) == $.trim(key)) {
                    value = decodeURIComponent(c.substring(key.length + 2));
                    break;
                }
            }
        }
        return value;
    }
    options = options || {};
    if(value===null){
        value="";
        options.expires=-1;
    }
    var expires="";
    if(options.expires && (typeof options.expires=="number" || options.expires.toUTCString)){
        var date;
        if(typeof options.expires=="number"){
            date = new Date();
            date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
        }else{
            date = options.expires;
        }
        expires = "; expires=" + date.toUTCString();
    }
    var path = options.path ? '; path=' + (options.path) : '';
    var domain = options.domain ? '; domain=' + (options.domain) : '';
    var secure = options.secure ? '; secure' : '';
    var ccd = [key, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    document.cookie = ccd;
};

function checkSSLAction() { 
    var action = $('#loginForm')[0].action;
    var path = "";
    if($('#useSSLChk')[0].checked){
        path = sslPath;
        if(action.indexOf('https:') == -1){
            $('#loginForm')[0].action = action.replace('http:', 'https:').replace(':7070', ':443');
        }
        
    }else{
        path = basePath;
        $('#loginForm')[0].action = action.replace('https:', 'http:').replace(':443', ':7070');;
    }
    
    $('#errorReturnUrl').val($('#errorReturnUrl').val().replace('{basePath}', path));
    $('#service').val($('#service').val().replace('{basePath}', path));
    $('#service').attr('userUrl', $('#service').attr('userUrl').replace('{basePath}', path));
    $('#service').attr('adminUrl', $('#service').attr('adminUrl').replace('{basePath}', path));
}

var domainCheckedArr = [];
function checkSimplePwd(p){
	for(var i=0;i<domainCheckedArr.length;i++){
		if(autoDomainName == domainCheckedArr[i]){
			var re = /^[a-z0-9]+$/;
			if(p.length < 8 || re.test(p)){
				var url = $('#service').val();
				var adminUrl = $('#service').attr('adminUrl');
				 $('#service').val(url+'?chgpwd=true');
				 $('#service').attr('userUrl', url+'?chgpwd=true');
				 $('#service').attr('adminUrl', adminUrl+'&chgpwd=true');
			}
			return;
		}
	}
}

/*登录处理*/
$(function(){
    // 初始化页面，如果上次选中记住账户，则对账户赋值
    var accountName = $.cookie( 'LASTLOGINACCOUNT' );
    var languageIncookie = $.cookie( 'zmail300_language' );
    var isErrorLogin = false;
    // 根据cookie设置用户名
    if(accountName!="" && accountName!=null){
        if(autoDomainName){
            $("#lgActIpt").val(accountName.replace("@"+autoDomainName,"")).css("color","#333");
        }else{
            $("#lgActIpt").val(accountName).css("color","#333");
        }
    }
    // 根据cookie设置语言
    if(languageIncookie != "" && languageIncookie!=null){
    	$("option[value="+languageIncookie+"]").attr("selected", "selected");
    }
    var error = getString("error");
    if (error != "" && error != null) {
        $("#errLabel").text(decodeURI(error));
        isErrorLogin = true;
    }
//    isErrorLogin = false;
    if (isErrorLogin){
        createIdfCode();
        $("#identifyLine").css({'background-position':'20px 90px'}).show(0);
        //$("#lgIdfCode").val(idfCode);
        $("#loginBlock").height("310px");
    }else{
        $("#identifyLine").hide(0);
        $("#loginBlock").height("265px");
    }
    $("#doLoginBtn").click(function(){
        $_account = ($.trim($("#lgActIpt").val()) == getLanguage("account")) ? "" : $.trim($("#lgActIpt").val());
        
        if($_account != "" ){
            var autoDomain = document.getElementById("autoDomain")
            if(autoDomain && autoDomain.value){
                if($_account.indexOf("@" + autoDomain.value) == -1){
                    $_account += "@" + autoDomain.value;
                }
            }
        }
        $_password = $.trim($("#lgPwdIpt").val());
        
        var ceLogin = new Login($_account,$_password);
        //重写showErr
        ceLogin.showErr = function(errMsg){
            $("#errLabel").text(errMsg);
        };
        ceLogin.checkIdf = function(){
            var $_inputCode = $("#lgIdfIpt").val().toUpperCase();  
            
            if($_inputCode.length <=0){
                this.showErr(this.msgMap.idfEmpty());
                return false;
            }
            /*
            else if($_inputCode != $("#lgIdfCode").val() ){
                this.showErr(this.msgMap.idfWrong());
                $("#lgIdfCode").val(createIdfCode());//刷新验证码
                return false;
            }
            */
            return true;
        };
        if(!ceLogin.checkAcct()){
            // do something
            return false;
        }
        if(!ceLogin.checkPwd()){
            // do something
            return false;
        }
        if(isErrorLogin){
            if(!ceLogin.checkIdf()){
                return false;
            }
        }
        // 如果选中记住账户，则将账户保存到cookie中
        var host=window.location.hostname;
    	var language = $("select option:selected").attr("value");
        if($("#keepAcctChk")[0].checked){
            var acc = $_account;
            $.cookie( 'LASTLOGINACCOUNT', acc, {expires:365,path:"/"});
        }else{
            $.cookie( 'LASTLOGINACCOUNT', "", {path:"/",expires:0});
        }
        $.cookie("zmail300_language", language, { expires: 365, path: "/" });
        // cookie设置完毕
        
        //根据是否是管理员跳转到不同的地址
        var isAdmin = document.getElementById("isAdmin").checked;
        var service =$("#service");
        service.attr("value",(isAdmin?service.attr("adminUrl"):service.attr("userUrl")));
        //密码md5加密
        try{        
//        	$("#lgPwdIpt").val(hex_md5($_password));   
        	$("#lgPwdIpt").val($_password);
        }
        catch(ex){
        	alert(ex)
        }

        // 提交到 sso 还得用全账号名
        $("#username").val($_account);
        checkSSLAction();
        checkSimplePwd($_password);
        $("#doLoginBtn").css("display", "none");
        $("#doLoginBtn_txt").css("display", "inline");
        
    });
    $("#lgActIpt").focus(function(){
        if($.trim($("#lgActIpt").val()) == getLanguage("account")){
            $("#lgActIpt").val("");
        }
    }).keypress(function(){
        $("#lgActIpt").css("color","#333");
    }).blur(function(){
        if($.trim($("#lgActIpt").val()) == getLanguage("account")){
            $("#lgActIpt").css("color","#BEBEBE");
        }else if($.trim($("#lgActIpt").val()) == ""){
            $("#lgActIpt").val(getLanguage("account")).css("color","#BEBEBE");
        }
    });
    $("#lgPwdIpt_txt").focus(function(){
        $("#lgPwdIpt_txt").hide(0);
        $("#lgPwdIpt").show(0);
        $("#lgPwdIpt")[0].focus();
    });
    $("#lgPwdIpt").blur(function(){
        if($.trim($("#lgPwdIpt").val()) == ""){
            $("#lgPwdIpt").hide(0);
            $("#lgPwdIpt_txt").show(0).val(getLanguage("password")).css("color","#BEBEBE");
        }
    });
});
function createIdfCode() {
	/*
    var idfCode = "";
    var codeLength = 4; //验证码的长度  
    //创建验证码的字符  
    var idfArray = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I',
        'J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
    for(var i = 0; i < codeLength; i++) {
        var charIndex = Math.floor(Math.random() * 36);
        idfCode += idfArray[charIndex];
    }
    return idfCode;
    */
	$('#lgIdfIpt').val('');
	var src = "";
	if(!window.captchaImageUrl){
		$("#lgIdfCode").css("display","none");
		var lgici=document.getElementById("lgIdfCodeImg");
		if(lgici==null){
			$("#identifyLine").html('<input id="lgIdfIpt" name="checkcode" type="text" style="float:left;"/><img id="lgIdfCodeImg" src="" style="height:30px;width:80px;margin:5px 0 0 5px;float:left;"></img><a href="#" onclick="refIdfCode();" style="color:#167ba9;float:left;line-height:35px;"> &nbsp;'+getLanguage("refresh")+'</a><br />');
		}
		//$.ajax({
	        //url: "/GetSSOURLController",
	        //type: "GET",
	        //dataType:"json",
	        //success: function(data) {
				captchaImageUrl=document.getElementById("loginForm").action.replace("/login?outer=true","")+"/captchaImage";
	        	src=captchaImageUrl + '?_dc=' + new Date().getTime(); 
	    		$('#lgIdfCodeImg').attr('src', src);
	        //}
	    //});
	}else{
		src=captchaImageUrl + '?_dc=' + new Date().getTime(); 
		$('#lgIdfCodeImg').attr('src', src);
	}
}
function getString(sName) {
    var sRE = "([?&])" + sName + "=([^&]*)";
    var oRE = new RegExp(sRE);
    if (oRE.test(window.location.href)) {
        return RegExp["$2"];
    } else {
        return null;
    }
}

/*
 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
 * Digest Algorithm, as defined in RFC 1321.
 * Version 2.1 Copyright (C) Paul Johnston 1999 - 2002.
 * Other contributors: Greg Holt, Andrew Kepert, Ydnar, Lostinet
 * Distributed under the BSD License
 * See http://pajhome.org.uk/crypt/md5 for more info.
 */

/*
 * Configurable variables. You may need to tweak these to be compatible with
 * the server-side, but the defaults work in most cases.
 */
var hexcase = 0;  /* hex output format. 0 - lowercase; 1 - uppercase        */
var b64pad  = ""; /* base-64 pad character. "=" for strict RFC compliance   */
var chrsz   = 8;  /* bits per input character. 8 - ASCII; 16 - Unicode      */

/*
 * These are the functions you'll usually want to call
 * They take string arguments and return either hex or base-64 encoded strings
 */
function hex_md5(s){ return binl2hex(core_md5(str2binl(s), s.length * chrsz));}
function b64_md5(s){ return binl2b64(core_md5(str2binl(s), s.length * chrsz));}
function str_md5(s){ return binl2str(core_md5(str2binl(s), s.length * chrsz));}
function hex_hmac_md5(key, data) { return binl2hex(core_hmac_md5(key, data)); }
function b64_hmac_md5(key, data) { return binl2b64(core_hmac_md5(key, data)); }
function str_hmac_md5(key, data) { return binl2str(core_hmac_md5(key, data)); }

/*
 * Calculate the MD5 of an array of little-endian words, and a bit length
 */
function core_md5(x, len)
{
  /* append padding */
  x[len >> 5] |= 0x80 << ((len) % 32);
  x[(((len + 64) >>> 9) << 4) + 14] = len;

  var a =  1732584193;
  var b = -271733879;
  var c = -1732584194;
  var d =  271733878;

  for(var i = 0; i < x.length; i += 16)
  {
    var olda = a;
    var oldb = b;
    var oldc = c;
    var oldd = d;

    a = md5_ff(a, b, c, d, x[i+ 0], 7 , -680876936);
    d = md5_ff(d, a, b, c, x[i+ 1], 12, -389564586);
    c = md5_ff(c, d, a, b, x[i+ 2], 17,  606105819);
    b = md5_ff(b, c, d, a, x[i+ 3], 22, -1044525330);
    a = md5_ff(a, b, c, d, x[i+ 4], 7 , -176418897);
    d = md5_ff(d, a, b, c, x[i+ 5], 12,  1200080426);
    c = md5_ff(c, d, a, b, x[i+ 6], 17, -1473231341);
    b = md5_ff(b, c, d, a, x[i+ 7], 22, -45705983);
    a = md5_ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
    d = md5_ff(d, a, b, c, x[i+ 9], 12, -1958414417);
    c = md5_ff(c, d, a, b, x[i+10], 17, -42063);
    b = md5_ff(b, c, d, a, x[i+11], 22, -1990404162);
    a = md5_ff(a, b, c, d, x[i+12], 7 ,  1804603682);
    d = md5_ff(d, a, b, c, x[i+13], 12, -40341101);
    c = md5_ff(c, d, a, b, x[i+14], 17, -1502002290);
    b = md5_ff(b, c, d, a, x[i+15], 22,  1236535329);

    a = md5_gg(a, b, c, d, x[i+ 1], 5 , -165796510);
    d = md5_gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
    c = md5_gg(c, d, a, b, x[i+11], 14,  643717713);
    b = md5_gg(b, c, d, a, x[i+ 0], 20, -373897302);
    a = md5_gg(a, b, c, d, x[i+ 5], 5 , -701558691);
    d = md5_gg(d, a, b, c, x[i+10], 9 ,  38016083);
    c = md5_gg(c, d, a, b, x[i+15], 14, -660478335);
    b = md5_gg(b, c, d, a, x[i+ 4], 20, -405537848);
    a = md5_gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
    d = md5_gg(d, a, b, c, x[i+14], 9 , -1019803690);
    c = md5_gg(c, d, a, b, x[i+ 3], 14, -187363961);
    b = md5_gg(b, c, d, a, x[i+ 8], 20,  1163531501);
    a = md5_gg(a, b, c, d, x[i+13], 5 , -1444681467);
    d = md5_gg(d, a, b, c, x[i+ 2], 9 , -51403784);
    c = md5_gg(c, d, a, b, x[i+ 7], 14,  1735328473);
    b = md5_gg(b, c, d, a, x[i+12], 20, -1926607734);

    a = md5_hh(a, b, c, d, x[i+ 5], 4 , -378558);
    d = md5_hh(d, a, b, c, x[i+ 8], 11, -2022574463);
    c = md5_hh(c, d, a, b, x[i+11], 16,  1839030562);
    b = md5_hh(b, c, d, a, x[i+14], 23, -35309556);
    a = md5_hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
    d = md5_hh(d, a, b, c, x[i+ 4], 11,  1272893353);
    c = md5_hh(c, d, a, b, x[i+ 7], 16, -155497632);
    b = md5_hh(b, c, d, a, x[i+10], 23, -1094730640);
    a = md5_hh(a, b, c, d, x[i+13], 4 ,  681279174);
    d = md5_hh(d, a, b, c, x[i+ 0], 11, -358537222);
    c = md5_hh(c, d, a, b, x[i+ 3], 16, -722521979);
    b = md5_hh(b, c, d, a, x[i+ 6], 23,  76029189);
    a = md5_hh(a, b, c, d, x[i+ 9], 4 , -640364487);
    d = md5_hh(d, a, b, c, x[i+12], 11, -421815835);
    c = md5_hh(c, d, a, b, x[i+15], 16,  530742520);
    b = md5_hh(b, c, d, a, x[i+ 2], 23, -995338651);

    a = md5_ii(a, b, c, d, x[i+ 0], 6 , -198630844);
    d = md5_ii(d, a, b, c, x[i+ 7], 10,  1126891415);
    c = md5_ii(c, d, a, b, x[i+14], 15, -1416354905);
    b = md5_ii(b, c, d, a, x[i+ 5], 21, -57434055);
    a = md5_ii(a, b, c, d, x[i+12], 6 ,  1700485571);
    d = md5_ii(d, a, b, c, x[i+ 3], 10, -1894986606);
    c = md5_ii(c, d, a, b, x[i+10], 15, -1051523);
    b = md5_ii(b, c, d, a, x[i+ 1], 21, -2054922799);
    a = md5_ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
    d = md5_ii(d, a, b, c, x[i+15], 10, -30611744);
    c = md5_ii(c, d, a, b, x[i+ 6], 15, -1560198380);
    b = md5_ii(b, c, d, a, x[i+13], 21,  1309151649);
    a = md5_ii(a, b, c, d, x[i+ 4], 6 , -145523070);
    d = md5_ii(d, a, b, c, x[i+11], 10, -1120210379);
    c = md5_ii(c, d, a, b, x[i+ 2], 15,  718787259);
    b = md5_ii(b, c, d, a, x[i+ 9], 21, -343485551);

    a = safe_add(a, olda);
    b = safe_add(b, oldb);
    c = safe_add(c, oldc);
    d = safe_add(d, oldd);
  }
  return Array(a, b, c, d);

}

/*
 * These functions implement the four basic operations the algorithm uses.
 */
function md5_cmn(q, a, b, x, s, t)
{
  return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s),b);
}
function md5_ff(a, b, c, d, x, s, t)
{
  return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
}
function md5_gg(a, b, c, d, x, s, t)
{
  return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
}
function md5_hh(a, b, c, d, x, s, t)
{
  return md5_cmn(b ^ c ^ d, a, b, x, s, t);
}
function md5_ii(a, b, c, d, x, s, t)
{
  return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
}

/*
 * Calculate the HMAC-MD5, of a key and some data
 */
function core_hmac_md5(key, data)
{
  var bkey = str2binl(key);
  if(bkey.length > 16) bkey = core_md5(bkey, key.length * chrsz);

  var ipad = Array(16), opad = Array(16);
  for(var i = 0; i < 16; i++)
  {
    ipad[i] = bkey[i] ^ 0x36363636;
    opad[i] = bkey[i] ^ 0x5C5C5C5C;
  }

  var hash = core_md5(ipad.concat(str2binl(data)), 512 + data.length * chrsz);
  return core_md5(opad.concat(hash), 512 + 128);
}

/*
 * Add integers, wrapping at 2^32. This uses 16-bit operations internally
 * to work around bugs in some JS interpreters.
 */
function safe_add(x, y)
{
  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
  return (msw << 16) | (lsw & 0xFFFF);
}

/*
 * Bitwise rotate a 32-bit number to the left.
 */
function bit_rol(num, cnt)
{
  return (num << cnt) | (num >>> (32 - cnt));
}

/*
 * Convert a string to an array of little-endian words
 * If chrsz is ASCII, characters >255 have their hi-byte silently ignored.
 */
function str2binl(str)
{
  var bin = Array();
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < str.length * chrsz; i += chrsz)
    bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (i%32);
  return bin;
}

/*
 * Convert an array of little-endian words to a string
 */
function binl2str(bin)
{
  var str = "";
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < bin.length * 32; i += chrsz)
    str += String.fromCharCode((bin[i>>5] >>> (i % 32)) & mask);
  return str;
}

/*
 * Convert an array of little-endian words to a hex string.
 */
function binl2hex(binarray)
{
  var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i++)
  {
    str += hex_tab.charAt((binarray[i>>2] >> ((i%4)*8+4)) & 0xF) +
           hex_tab.charAt((binarray[i>>2] >> ((i%4)*8  )) & 0xF);
  }
  return str;
}

/*
 * Convert an array of little-endian words to a base-64 string
 */
function binl2b64(binarray)
{
  var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i += 3)
  {
    var triplet = (((binarray[i   >> 2] >> 8 * ( i   %4)) & 0xFF) << 16)
                | (((binarray[i+1 >> 2] >> 8 * ((i+1)%4)) & 0xFF) << 8 )
                |  ((binarray[i+2 >> 2] >> 8 * ((i+2)%4)) & 0xFF);
    for(var j = 0; j < 4; j++)
    {
      if(i * 8 + j * 6 > binarray.length * 32) str += b64pad;
      else str += tab.charAt((triplet >> 6*(3-j)) & 0x3F);
    }
  }
  return str;
}
function getkey(farmTime){
	if(farmTime=="") farmTime="1247231732";
	tmpkey = "$#087asd!@#$0AHFH";
	return hex_md5(farmTime + tmpkey.substr(parseInt(farmTime) % 10, 20));
}

function refIdfCode(){
    //$("#lgIdfCode").val(createIdfCode());
	createIdfCode();
}


