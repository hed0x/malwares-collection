<html>
<head>
<Title>Your VCard sent by your friend!</Title>
 <style type="text/css">
<!--
select  {  font-family: Verdana, Arial, Helvetica; font-size: 10px }
input   {  font-family: Verdana, Arial, Helvetica; font-size: 10px }
font    {  font-family: Arial, Helvetica; font-size: 10px }
h3      {  font-family: Verdana, Arial, Helvetica; font-size: 10px }
A{text-decoration:none}
-->
</style>
<script language="JavaScript">
<!--
//Start of JavaScript code
function setbackground(){
window.setTimeout( "setbackground()", 10);
var index = Math.round(Math.random() * 1);
var ColorValue = "6c6c6c"; // default color - b (index = 0)
if(index == 1)
ColorValue = "999999"; //gr
document.bgColor=ColorValue;
}
// -- End of JavaScript code -------------- -->
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!-- debut du script
nereidFadeObjects = new Object();
nereidFadeTimers = new Object();
function nereidFade(object, destOp, rate, delta){
if (!document.all)
return
if (object != "[object]"){
setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
return;
} 
clearTimeout(nereidFadeTimers[object.sourceIndex]);
diff = destOp-object.filters.alpha.opacity;
direction = 1;
if (object.filters.alpha.opacity > destOp){
direction = -1;
}
delta=Math.min(direction*diff,delta);
object.filters.alpha.opacity+=direction*delta;
if (object.filters.alpha.opacity != destOp){
nereidFadeObjects[object.sourceIndex]=object;
nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
}
}
function imagelogo(lImg) {
return ("<a href=\"#\" target=\"_self\"><img style=\"filter:alpha(opacity="+(Math.floor(Math.random()*80)+20)+")\" onmouseover=\"nereidFade(this,100,30,5)\" onmouseout=\"nereidFade(this,"+Math.floor(Math.random()*10)+",50,5)\" src="+lImg+" width=\"30%\" height=\"380\" border=\"0\"></a>");
}
// -- End of JavaScript code -------------- -->
</SCRIPT>
</HEAD>
<body bgcolor="#6c6c6c" text="#ececec" link="#ffdddd" vlink="#ffdddd" onLoad="setbackground();">
<center>
<script>document.write(imagelogo("vcrd01.jpg"));</script>
<script>document.write(imagelogo("vcrd02.jpg"));</script>
<script>document.write(imagelogo("vcrd03.jpg"));</script>
</center>
</body>
</html>

