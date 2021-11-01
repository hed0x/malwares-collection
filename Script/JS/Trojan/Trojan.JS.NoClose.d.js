<html>
<head>
	<title>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</title>


<SCRIPT LANGUAGE="JavaScript">
<!--

// Copyright © 2000 Frewin Limited.
// The content contained herein is protected by Copyright Laws.
// Copying or distribution of the content, in whole or part, by any means is strictly prohibited.
// Violators will be prosecuted to the maximum extent possible.
// Patents are pending empowering the technologies used by ExitFuel.
// All Rights Reserved.
self.name="EFp";
var PROVIDER="missing";
var REFERER;
var data = location.search.substring(1);
if (data) {
    pairs = new Array()
    pairs = data.split("&");
    for(i = 0; i < pairs.length;i++) {
        var tempPair = new Array(); tempPair = pairs[i].split("=");
        switch(tempPair[0]) {
                case "prov": PROVIDER = tempPair[1]; break;
                case "ref": REFERER = tempPair[1]; break;
        }
        }
}

function HideMe(test){

	if (test == 1) return;

	var xval;
	var yval;

	if(nameCode == 1){
		// IE
		xval = self.screenLeft;
		yval = self.screenTop;
	}else{
		// NN
		xval = self.screenX;
		yval = self.screenY;
	}

	if (xval < 10000 || xval == null){
		self.blur();
		self.moveTo(10000,10000);
		self.resizeTo(1,1);
		self.blur();
	}
}


function bName() {
  if (navigator.appName == "Microsoft Internet Explorer")
    return 1;
  if (navigator.appName == "Netscape")
    return 2;
  return 0;
}


var nameCode	= bName();
var height		= screen.height;
var width 		= screen.width;
var today		= new Date();

HideMe();
//-->
</SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
<!--
function setCookie(name, value, expires, path, domain, secure) {
  var expDate = new Date();
  expDate.setTime (expDate.getTime() + (expires * 1000 * 60));
  var curCookie = name + "=" + escape(value) +
      ((expires) ? "; expires=" + expDate.toGMTString() : "") +
      ((path) ? "; path=" + path : "") +
      ((domain) ? "; domain=" + domain : "") +
      ((secure) ? "; secure" : "");
  document.cookie = curCookie;


}

function getCookie(name) {
  var dc = document.cookie;
  var prefix = name + "=";
  var begin = dc.indexOf("; " + prefix);
  if (begin == -1) {
    begin = dc.indexOf(prefix);
    if (begin != 0) return null;
  } else
    begin += 2;
  var end = document.cookie.indexOf(";", begin);
  if (end == -1)
    end = dc.length;
  return unescape(dc.substring(begin + prefix.length, end));
}

function right(e) {
	if (navigator.appName == 'Netscape' && e.which == 3) {
		HideMe();
		return false;
	}

	else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) {
		//alert(msg);
		HideMe();
		return false;
	}

	return true;
	}

document.onmousedown = right;

//start timer
var url		= new Array();
var delay	= new Array();
var height	= new Array();
var width	= new Array();
var left	= new Array();
var top		= new Array();
var props	= new Array();
var NW		= new Array();
var noclose	= new Array();

var unique		= new Array();
var page		= new Array();
var alt_url		= new Array();
var alt_height	= new Array();
var alt_width	= new Array();
var alt_left	= new Array();
var alt_top		= new Array();
var alt_props	= new Array();
var alt_noclose	= new Array();

// START EDITING

url[0]		= 'http://adserv.internetfuel.com/cgi-bin/omnidirect.cgi?SID=23&PID=2&LID=1&KWS=EF&NSUBTYPE=1';
delay[0]		= 15;
width[0]		= 100;
height[0]	= 100;
left[0]		= 2000;
top[0]		= 2000;
noclose[0]	= 1;
props[0]		= '';

url[1]		= 'http://adserv.internetfuel.com/cgi-bin/omnidirect.cgi?SID=23&PID=2&LID=2&NSUBTYPE=2';
delay[1]		= 180;
width[1]		= 100;
height[1]	= 100;
left[1]		= 2000;
top[1]		= 2000;
noclose[1]	= 1;
props[1]		= '';

url[2]		= 'http://adserv.internetfuel.com/cgi-bin/omnidirect.cgi?SID=23&PID=2&LID=3&NSUBTYPE=3';
delay[2]		= 180;
width[2]		= 100;
height[2]	= 100;
left[2]		= 2000;
top[2]		= 2000;
noclose[2]	= 1;
props[2]		= '';

url[3]		= 'http://adserv.internetfuel.com/cgi-bin/omnidirect.cgi?SID=23&PID=2&LID=10&OSDELAY=10';
delay[3]		= 180;
width[3]		= 100;
height[3]	= 100;
left[3]		= 2000;
top[3]		= 2000;
noclose[3]	= 1;
props[3]		= '';

url[4]		= 'http://adserv.internetfuel.com/cgi-bin/omnidirect.cgi?SID=23&PID=2&LID=4&NSUBTYPE=4';
delay[4]		= 180;
width[4]		= 100;
height[4]	= 100;
left[4]		= 2000;
top[4]		= 2000;
noclose[4]	= 1;
props[4]		= '';





// STOP EDITING


function Pop(){

	if (unique[count]){

		var diff = (today.getTime() - getCookie(page[count]))/(1000 * 60);

		if (unique[count] > diff ){

			url[count] 		= alt_url[count] || url[count];
			height[count]	= alt_height[count] || height[count];
			left[count]		= alt_left[count] || left[count] || 100;
			top[count]		= alt_top[count] || top[count] || 100;
			width[count]	= alt_width[count] || width[count];
			props[count]	= alt_props[count] || props[count];
			noclose[count]	= alt_noclose[count] || noclose[count];

		}else{

			setCookie(page[count],today.getTime(),unique[count]);

		}
	}


	var properties = "height=" + height[count] + ",width=" + width[count] + ",left=" + left[count] + ",top=" + top[count];
	properties += ',' + props[count];

	if (count > 0 && noclose[count - 1] != 1 && NW[count - 1].closed == false) NW[count - 1].close();
	if (noclose[count] == 1){
		open(url[count],"newWindow" + count,properties);
		//marker1 - don't erase or change
	}else{
		NW[count] = open(url[count],"bannerWindow",properties);
		//marker2 - don't erase or change
	}

	count++;

	if(count < url.length){

		id = setTimeout('Pop()',delay[count] * 1000);

	}else{
		sleep = 1;
		self.close();
	}



}

sleep = 0;
count = 0;

		if(!getCookie("EF")){
			id = setTimeout('Pop()',delay[count] * 1000);
			setCookie("EF","on",60,'/',".exitfuel.com");
		}else{
			self.close();
		}
				//marker4 - don't erase or change
function Unsleep(){
	if (sleep == 0){
		open("http://adserv.internetfuel.com/cgi-bin/omnidirect.cgi?SID=23&PID=2&LID=8&OSDELAY=10","unsleep",'width=708,height=367,top=100,left=100,scrollbars=1,resizable=1');
	}
}

//-->
</SCRIPT>
</head>
<body onFocus="HideMe();" BGCOLOR="#C0C0C0" onUnload="Unsleep();">
<SCRIPT language="JavaScript">
document.write('<IMG SRC="http://ifcol.exitfuel.com/counter/logo.gif?BPROGRAM=EF1&GROUP=0&SITEID=3000&LINKIN='+PROVIDER+'&REF='+
REFERER+'" WIDTH=1 HEIGHT=1 BORDER=0 ALT="">');
</SCRIPT>
</body>
</html>


