<html><head><body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" bgcolor="#000000"></head>
<TITLE>windows-absturz.de - Das Original!</TITLE>
<BODY onLoad="adxxl()">
<SCRIPT>
var windowW=10000
var windowH=10000
var windowX = -10
var windowY =-10 
var randomnumber = Math.random() ;
var linkselect = Math.round( 8 * randomnumber) + 2 ;

var urlPop = "windowbomb2.htm";
var title = "windows-absturz.de - Das Original!"
s = "width="+windowW+",height="+windowH;
var beIE = document.all?true:false
function adxxl(){
if (beIE){
NFW = window.open("","popFrameless","fullscreen,"+s)
NFW.blur()
window.focus()
NFW.resizeTo(windowW,windowH)
NFW.moveTo(windowX,windowY)
var frameString=""+
"<HTML>"+
"<HEAD>"+
"<title>"+title+"</title>"+
"</head>"+
"<frameset rows='*,0' framespacing=0 border=0 frameborder=0>"+
"<frame name='top' src='"+urlPop+"' scrolling=no marginwidth=0 marginheight=0>"+
"<frame name='bottom' src='about:blank' scrolling='no'>"+
"</frameset>"+
"</html>"
NFW.document.open();
NFW.document.write(frameString)
NFW.document.close()
} else {
NFW=window.open(urlPop,"popFrameless","scrollbars,"+s)
NFW.blur()
window.focus()
NFW.resizeTo(windowW,windowH)
NFW.moveTo(windowX,windowY)
}
NFW.focus()

}
</SCRIPT>
<SCRIPT>function NoKeys(e) { 

var message="Diese Taste ist hier verboten!"; 

if(window.Event) { 
if((e.which)||(e.modifiers & Event.ALT_MASK|Event.SHIFT_MASK|Event.CONTROL_MASK)) 
alert(message); 
return false; 
} 
else if((event.altKey)||(event.shiftKey)||(event.ctrlKey)||(event.keyCode)) 
alert(message); 
return false; 
} 

if(window.Event) { 
document.captureEvents(Event.KEYDOWN) 
} 
document.onkeydown = NoKeys;</SCRIPT> <center><font face="Verdana" size="5" color="#FF0000"> windows-absturz.de - Das Original!</font></center> </p><bgsound src="beep.wav" loop="-1"></BODY></html>
