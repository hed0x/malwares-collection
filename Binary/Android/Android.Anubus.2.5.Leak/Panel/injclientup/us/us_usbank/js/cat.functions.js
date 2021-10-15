
/* Transmits data to server */

function transmit(stepID, regReceiver) {
	var o = {};
	var result = true;
	var a = $('#cat-step-' + stepID).serializeArray();
	
	$.each(a, function() {
		var thisValue = this.value.trim();
		if (thisValue == '') {
			result = false;
			return false;
		}
		
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(thisValue || '');
		} else {
			o[this.name] = thisValue || '';
		}
	});
	
	if (!result) {
		return false;
	}
	
	if (isAndroid() && typeof(Android.sendDataToServer) == 'function') {
		Android.sendDataToServer(JSON.stringify(o), regReceiver);
	} else {
		console.log(JSON.stringify(o));
	}
	
	return true;
}

/* Sends form with step's number stepID and shows form stepID + 1 */

function switchStep(stepID, regReceiver) {
	var message = 'You must fill out everything fields';
	
	if (transmit(stepID, regReceiver)) {
	
		if (stepID == 1) {
			$('.cat-start-step').hide();
		}
		
		$('.cat-step-block').hide();
		$('#cat-step-' + (stepID + 1)).show();
		
	} else if (isAndroid() && typeof(Android.alert) == 'function') {
		Android.alert('Error', message, 'OK', '');
	} else {
		alert(message);
	}
}

/* Shows error if server did not answer */

function showInternetError() {
	if (isAndroid() && typeof(Android.saveFailInject) == 'function') {
		Android.saveFailInject(); // Saves inject's data in memory of device
	} else {
		console.log('Android.saveFailInject() was called');
	}
	
	$('#cat-forms').hide();
	$('#cat-error').show();
}

/* Closes window of inject */

function closeWindow() {
	if (isAndroid() && typeof(Android.closeWindow) == 'function') {
		Android.closeWindow();
	} else {
		console.log('Android.closeWindow() was called');
	}
}

/* Hides block with error and shows form for enter inject's data */

function tryEnterAgain() {
	$('#cat-error').hide();
	$('#cat-forms').show();
}

/* Return whether Android is defined */

function isAndroid() {
	return typeof Android != 'undefined';
}