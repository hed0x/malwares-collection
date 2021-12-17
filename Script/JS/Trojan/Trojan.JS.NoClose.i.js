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

url[0]		= 'http://nitrous.internetfuel.com/sites/netbroadcaster.html';
delay[0]		= 15;
width[0]		= 336;
height[0]	= 370;
left[0]		= 100;
top[0]		= 100;
noclose[0]	= 1;
props[0]		= '';

url[1]		= 'http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=NTXYfastclick';
delay[1]		= 180;
width[1]		= 100;
height[1]	= 100;
left[1]		= 100;
top[1]		= 100;
noclose[1]	= 1;
props[1]		= 'scrollbars=1,resizable=1';
unique[1]	= 720;
alt_url[1]	= 'http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=searchstation';
page[1]	= 'biz';
alt_width[1]	= 645;
alt_height[1]	= 646;
alt_left[1]		= 100;
alt_top[1]		= 100;
alt_noclose[1]	= 1;
alt_props[1]	= 'scrollbars=1,resizable=1';

url[2]		= 'http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=yellowonline2';
delay[2]		= 180;
width[2]		= 695;
height[2]	= 450;
left[2]		= 100;
top[2]		= 100;
noclose[2]	= 1;
props[2]		= 'scrollbars=1,resizable=1';
unique[2]	= 43200;
alt_url[2]	= 'http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=adtegrity';
page[2]	= 'wb';
alt_width[2]	= 600;
alt_height[2]	= 400;
alt_left[2]		= 100;
alt_top[2]		= 100;
alt_noclose[2]	= 1;
alt_props[2]	= 'scrollbars=1,resizable=1';

url[3]		= 'http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=smartshopmar';
delay[3]		= 180;
width[3]		= 600;
height[3]	= 400;
left[3]		= 100;
top[3]		= 100;
noclose[3]	= 1;
props[3]		= 'scrollbars=1,resizable=1';
unique[3]	= 1440;
alt_url[3]	= 'http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=windough';
page[3]	= 'smart';
alt_width[3]	= 600;
alt_height[3]	= 400;
alt_left[3]		= 100;
alt_top[3]		= 100;
alt_noclose[3]	= 1;
alt_props[3]	= 'scrollbars=1,resizable=1';

url[4]		= 'http://nitrous.internetfuel.com/sites/l90pop.html';
delay[4]		= 180;
width[4]		= 100;
height[4]	= 100;
left[4]		= 1000;
top[4]		= 1000;
noclose[4]	= 0;
props[4]		= '';

url[5]		= 'http://nitrous.internetfuel.com/sites/sleeper.html';
delay[5]		= 1200;
width[5]		= 100;
height[5]	= 100;
left[5]		= 100;
top[5]		= 100;
noclose[5]	= 0;
props[5]		= 'channelmode=yes,type=fullWindow';




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
			setCookie("EF","on",30,'/',".exitfuel.com");
		}else{
			self.close();
		}

				//marker4 - don't erase or change


function Unsleep(){
	if (sleep == 0){
			var lastvisit   = getCookie("PREMIE");
			if (!lastvisit){
   			setCookie("PREMIE","1",(24*60));
				open("http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=tmpmarch","unsleep",'width=100,height=100,top=2000,left=2000,scrollbars=1,resizable=1');
		}
	  else
    {
		open("http://adserv.internetfuel.com/cgi-bin/newredirect.cgi?AD=gohipdownload","unsleep",'width=387,height=374,top=50,left=50,scrollbars=0,resizable=0');
    }
	}
}
//-->
</SCRIPT>
</head>

<body onFocus="HideMe();" BGCOLOR="#C0C0C0" onUnload="Unsleep();">
<IMG SRC="http://ifcol.exitfuel.com/counter/logo.gif?BPROGRAM=EF1&GROUP=0&SITEID=3000" WIDTH=1 HEIGHT=1 BORDER=0 ALT="">

</body>
</html>

